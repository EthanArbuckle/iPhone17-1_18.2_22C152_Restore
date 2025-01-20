@interface DBSZoomAndProSpecifiers
+ (BOOL)specifiersPresentIn:(id)a3;
+ (void)removeSpecifiersFrom:(id)a3;
- (DBSZoomAndProSpecifiersDelegate)delegate;
- (NSArray)specifiers;
- (PSSpecifier)advancedSpecifier;
- (id)_displayZoomFooterText;
- (id)advancedDetailString:(id)a3;
- (id)localizedMagnifyModeName;
- (void)presentModalMagnifyController;
- (void)setDelegate:(id)a3;
@end

@implementation DBSZoomAndProSpecifiers

+ (BOOL)specifiersPresentIn:(id)a3
{
  v3 = [a3 specifierForID:@"DISPLAY_ZOOM_PRO_GROUP"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)removeSpecifiersFrom:(id)a3
{
  id v7 = a3;
  v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [v7 specifierForID:@"DISPLAY_ZOOM_PRO_GROUP"];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [v7 specifierForID:@"MAGNIFY"];
  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [v7 specifierForID:@"ADVANCED_LINK_GROUP_ID"];
  if (v6) {
    [v3 addObject:v6];
  }
  if ([v3 count]) {
    [v7 removeContiguousSpecifiers:v3 animated:1];
  }
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    BOOL v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FB08] sharedManager];
    char v6 = [v5 capabilityBoolAnswer:*MEMORY[0x263F60220]];

    id v7 = [MEMORY[0x263F5FB08] sharedManager];
    int v8 = [v7 capabilityBoolAnswer:*MEMORY[0x263F60088]];

    v9 = (void *)MEMORY[0x263F60138];
    if (v8 && (v6 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x263F5FC40];
      if (DBSChamoisEnabled()) {
        v11 = @"DISPLAY_ZOOM_PRO";
      }
      else {
        v11 = @"DISPLAY_ZOOM_LEGACY";
      }
      v12 = DBS_LocalizedStringForDisplays(v11);
      v13 = [v10 groupSpecifierWithID:@"DISPLAY_ZOOM_PRO_GROUP" name:v12];

      v14 = [(DBSZoomAndProSpecifiers *)self _displayZoomFooterText];
      [v13 setProperty:v14 forKey:*MEMORY[0x263F600F8]];
      [(NSMutableArray *)v4 addObject:v13];
      v15 = (void *)MEMORY[0x263F5FC40];
      if (DBSChamoisEnabled()) {
        v16 = @"VIEW";
      }
      else {
        v16 = @"VIEW_LEGACY";
      }
      v17 = DBS_LocalizedStringForDisplays(v16);
      v18 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:sel_localizedMagnifyModeName detail:0 cell:2 edit:0];

      [v18 setObject:@"MAGNIFY" forKeyedSubscript:*v9];
      v19 = [MEMORY[0x263F82670] currentDevice];
      int v20 = objc_msgSend(v19, "sf_isiPad");

      if (v20)
      {
        [v18 setButtonAction:sel_presentModalMagnifyController];
        [v18 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
      }
      else
      {
        [v18 setDetailControllerClass:objc_opt_class()];
      }
      [(NSMutableArray *)v4 addObject:v18];
    }
    v21 = [(DBSZoomAndProSpecifiers *)self delegate];
    int v22 = [v21 proModeSupported];

    if (v22)
    {
      v23 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADVANCED_LINK_GROUP_ID"];
      [(NSMutableArray *)v4 addObject:v23];
      v24 = (void *)MEMORY[0x263F5FC40];
      v25 = DBS_LocalizedStringForDisplays(@"ADVANCED");
      v26 = [v24 preferenceSpecifierNamed:v25 target:self set:0 get:sel_advancedDetailString_ detail:objc_opt_class() cell:2 edit:0];
      advancedSpecifier = self->_advancedSpecifier;
      self->_advancedSpecifier = v26;

      [(PSSpecifier *)self->_advancedSpecifier setObject:@"ADVANCED" forKeyedSubscript:*v9];
      [(NSMutableArray *)v4 addObject:self->_advancedSpecifier];
    }
    v28 = self->_specifiers;
    self->_specifiers = v4;

    specifiers = self->_specifiers;
  }
  return (NSArray *)specifiers;
}

- (id)_displayZoomFooterText
{
  v3 = +[DBSDisplayZoomConfigurationController defaultController];
  BOOL v4 = [v3 displayZoomModes];

  v5 = DBSStringForDisplayZoomOption(1);
  char v6 = DBSStringForDisplayZoomOption(0);
  id v7 = DBSStringForDisplayZoomOption(2);
  int v8 = [(DBSZoomAndProSpecifiers *)self delegate];
  v9 = [v8 connectedDisplayName];

  uint64_t v10 = [v4 objectForKeyedSubscript:v5];
  v11 = (void *)v10;
  if (v9)
  {
    if (v10)
    {
      uint64_t v12 = [v4 objectForKeyedSubscript:v6];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v4 objectForKeyedSubscript:v7];

        if (v14)
        {
          v15 = NSString;
          v16 = @"EXTERNALDISPLAY_DISPLAY_ZOOMED_STANDARD_DENSE_DESCRIPTION";
LABEL_18:
          v27 = DBS_LocalizedStringForDisplays(v16);
          v28 = objc_msgSend(v15, "localizedStringWithFormat:", v27, v9);

          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:v5];
    if (v21
      && (int v22 = (void *)v21,
          [v4 objectForKeyedSubscript:v6],
          v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v23))
    {
      v15 = NSString;
      v16 = @"EXTERNALDISPLAY_DISPLAY_ZOOMED_STANDARD_DESCRIPTION";
    }
    else
    {
      uint64_t v24 = [v4 objectForKeyedSubscript:v7];
      if (v24
        && (v25 = (void *)v24,
            [v4 objectForKeyedSubscript:v6],
            v26 = objc_claimAutoreleasedReturnValue(),
            v26,
            v25,
            v26))
      {
        v15 = NSString;
        v16 = @"EXTERNALDISPLAY_DISPLAY_STANDARD_DENSE_DESCRIPTION";
      }
      else
      {
        v15 = NSString;
        v16 = @"EXTERNALDISPLAY_DISPLAY_ZOOM_DEFAULT_DESCRIPTION";
      }
    }
    goto LABEL_18;
  }
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:v6];
  if (!v17)
  {

    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [v4 objectForKeyedSubscript:v7];

  if (!v19)
  {
LABEL_20:
    uint64_t v29 = [v4 objectForKeyedSubscript:v5];
    if (v29
      && (v30 = (void *)v29,
          [v4 objectForKeyedSubscript:v6],
          v31 = objc_claimAutoreleasedReturnValue(),
          v31,
          v30,
          v31))
    {
      int v20 = @"DEFAULT_DISPLAY_ZOOMED_STANDARD_DESCRIPTION";
    }
    else
    {
      uint64_t v32 = [v4 objectForKeyedSubscript:v7];
      if (v32
        && (v33 = (void *)v32,
            [v4 objectForKeyedSubscript:v6],
            v34 = objc_claimAutoreleasedReturnValue(),
            v34,
            v33,
            v34))
      {
        int v20 = @"DEFAULT_DISPLAY_STANDARD_DENSE_DESCRIPTION";
      }
      else
      {
        int v20 = @"DEFAULT_DISPLAY_ZOOM_DEFAULT_DESCRIPTION";
      }
    }
    goto LABEL_27;
  }
  int v20 = @"DEFAULT_DISPLAY_ZOOMED_STANDARD_DENSE_DESCRIPTION";
LABEL_27:
  v28 = DBS_LocalizedStringForDisplays(v20);
LABEL_28:

  return v28;
}

- (id)localizedMagnifyModeName
{
  v3 = [(DBSZoomAndProSpecifiers *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(DBSZoomAndProSpecifiers *)self delegate];
    char v6 = [v5 localizedMagnifyModeName];
  }
  else
  {
    v5 = +[DBSDisplayZoomConfigurationController defaultController];
    id v7 = [v5 currentDisplayZoomMode];
    char v6 = [v7 localizedName];
  }
  return v6;
}

- (void)presentModalMagnifyController
{
  id v2 = [(DBSZoomAndProSpecifiers *)self delegate];
  [v2 presentModalMagnifyController];
}

- (id)advancedDetailString:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F15778], "mainDisplay", a3);
  int v4 = [v3 isReference];

  if (v4)
  {
    DBS_LocalizedStringForDisplays(@"REFERENCE_MODE_ON");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_26E931C58;
  }
  return v5;
}

- (DBSZoomAndProSpecifiersDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSZoomAndProSpecifiersDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PSSpecifier)advancedSpecifier
{
  return self->_advancedSpecifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advancedSpecifier, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end