state("Forager")
{
	double landsfeat : 0x00D00A48, 0x2C, 0x10, 0x798, 0x0, 0x4, 0x4, 0x4D0;
	double skillsfeat : 0x00D009C0, 0x2C, 0x10, 0xA8, 0x30, 0x24, 0x4, 0x4C0;
	double allfeats : 0x00D00A48, 0x2C, 0x10, 0x798, 0x0, 0x4, 0x4, 0x530;
	double lvl : 0x00D009C0, 0x2C, 0x10, 0x4E0, 0x60;
	double menu : 0x00D27434, 0x0, 0x2C, 0x10, 0x8D0;

	double desert : 0x00D00A48, 0x2C, 0x10, 0x798, 0x0, 0x4, 0x4, 0x50;
	double death : 0x00D00A48, 0x2C, 0x10, 0x798, 0x0, 0x4, 0x4, 0x60;
	double snow : 0x00D00A48, 0x2C, 0x10, 0x798, 0x0, 0x4, 0x4, 0x70;
	double fire : 0x00D00A48, 0x2C, 0x10, 0x798, 0x0, 0x4, 0x4, 0x80;
}

start
{
	if (current.menu != 0 && old.menu == 0) {
		return true;
	}
}

startup
{
	settings.Add("dungeons", false, "All Dungeons");
	settings.SetToolTip("dungeons", "Splits every time you receive a seal of a dungeon.");

	settings.Add("lands", true, "All lands feat");
	settings.SetToolTip("lands", "Splits when receiving the feat for owning all lands.");

	settings.Add("lvl", false, "Split at 14");
	settings.SetToolTip("lvl", "Splits when you reach level 14.");

	settings.Add("skills", true, "Split at Skillful");
	settings.SetToolTip("skills", "Splits not when you reach 65 but when you actually activate all skills.");

	settings.Add("feats", true, "Split at 100%");
	settings.SetToolTip("feats", "Splits when you have completed every feat.");
}

split
{
	if (settings["lvl"] && current.lvl >= 14 && old.lvl < 14) {
		return true;
	}

	if (settings["lands"] && current.landsfeat >= 100 && old.landsfeat < 100) {
		return true;
	}

	if (settings["skills"] && current.skillsfeat >= 100 && old.skillsfeat < 100) {
		return true;
	}

	if (settings["feats"] && current.allfeats >= 100 && old.allfeats < 100) {
		return true;
	}

	if (settings["dungeons"] && current.desert >= 100 && old.desert < 100) {
		return true;
	}
	if (settings["dungeons"] && current.death >= 100 && old.death < 100) {
		return true;
	}
	if (settings["dungeons"] && current.snow >= 100 && old.snow < 100) {
		return true;
	}
	if (settings["dungeons"] && current.fire >= 100 && old.fire < 100) {
		return true;
	}
}