local mod = get_mod("UltraStubber")

local widgets = {
	{
		setting_id = "feature_toggles",
		type = "group",
		sub_widgets = {
			{
				setting_id = "allow_size_scaling",
				type = "checkbox",
				default_value = true,
			},
			{
				setting_id = "allow_plasma_crits",
				type = "checkbox",
				default_value = true,
			},
		},
	},
}
return {
	name = "UltraStubber",
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = widgets,
	},
}
