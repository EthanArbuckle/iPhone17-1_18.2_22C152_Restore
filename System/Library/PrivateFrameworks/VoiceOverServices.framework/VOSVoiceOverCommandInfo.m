@interface VOSVoiceOverCommandInfo
- (id)brailleCommandsForCategory:(id)a3;
- (id)brailleVoiceOverCategories;
- (id)localizedNameForCategory:(id)a3;
- (id)localizedNameForCommand:(id)a3;
- (void)_loadBrailleCommandsIfNecessary;
@end

@implementation VOSVoiceOverCommandInfo

- (void)_loadBrailleCommandsIfNecessary
{
  if (!self->_brailleCommands)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v3 URLForResource:@"BrailleVoiceOverCommands" withExtension:@"plist"];

    v4 = [NSDictionary dictionaryWithContentsOfURL:v6];
    brailleCommands = self->_brailleCommands;
    self->_brailleCommands = v4;
  }
}

- (id)brailleVoiceOverCategories
{
  [(VOSVoiceOverCommandInfo *)self _loadBrailleCommandsIfNecessary];
  v3 = [(NSDictionary *)self->_brailleCommands allKeys];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (id)brailleCommandsForCategory:(id)a3
{
  id v4 = a3;
  [(VOSVoiceOverCommandInfo *)self _loadBrailleCommandsIfNecessary];
  id v5 = [(NSDictionary *)self->_brailleCommands objectForKey:v4];

  id v6 = [v5 keysOfEntriesPassingTest:&__block_literal_global_0];
  v7 = [v6 allObjects];

  return v7;
}

uint64_t __54__VOSVoiceOverCommandInfo_brailleCommandsForCategory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    id v6 = [v5 objectForKey:@"tvOSAvailable"];
    v7 = __UIAccessibilityCastAsClass();

    if (AXDeviceIsTV() && v7 && ![v7 BOOLValue])
    {
      uint64_t v10 = 0;
    }
    else
    {
      objc_opt_class();
      v8 = [v5 objectForKey:@"tvOSAvailable"];
      v9 = __UIAccessibilityCastAsClass();

      if (AXDeviceIsWatch() && v9 && ![v9 BOOLValue])
      {
        uint64_t v10 = 0;
      }
      else if (AXDeviceIsPad())
      {
        uint64_t v10 = 1;
      }
      else
      {
        v11 = [v5 objectForKey:@"MultittaskDeviceOnly"];
        int v12 = [v11 BOOLValue];

        uint64_t v10 = v12 ^ 1u;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)localizedNameForCommand:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:0 table:@"VoiceOverCommands"];

  return v6;
}

- (id)localizedNameForCategory:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:0 table:@"VoiceOverCommands"];

  return v6;
}

- (void).cxx_destruct
{
}

@end