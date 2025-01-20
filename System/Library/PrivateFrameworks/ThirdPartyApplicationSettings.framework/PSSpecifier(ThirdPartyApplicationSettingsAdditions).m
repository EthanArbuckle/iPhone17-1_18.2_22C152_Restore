@interface PSSpecifier(ThirdPartyApplicationSettingsAdditions)
- (id)sui_createCellInstance;
- (id)sui_detailString;
- (id)sui_footerString;
- (id)sui_image;
- (id)sui_titleString;
- (uint64_t)setSui_BOOLValue:()ThirdPartyApplicationSettingsAdditions;
- (uint64_t)sui_BOOLValue;
- (uint64_t)sui_isUserInteractive;
- (uint64_t)sui_prefersSubtitleAppearance;
- (void)sui_loadValueFromCell;
@end

@implementation PSSpecifier(ThirdPartyApplicationSettingsAdditions)

- (id)sui_image
{
  objc_opt_class();
  v2 = [a1 propertyForKey:*MEMORY[0x263F60140]];
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4) {
    id v5 = v4;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)sui_titleString
{
  v2 = [a1 name];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    id v4 = [a1 name];
    id v5 = (id)[v4 copy];
LABEL_3:
    v6 = v5;

    goto LABEL_7;
  }
  unint64_t v7 = [a1 cellType];
  if ((v7 > 0xD || ((1 << v7) & 0x200A) == 0) && [a1 hasValidGetter])
  {
    objc_opt_class();
    id v4 = [a1 performGetter];
    if (objc_opt_isKindOfClass()) {
      v9 = v4;
    }
    else {
      v9 = 0;
    }
    id v5 = v9;
    goto LABEL_3;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)sui_detailString
{
  if (![a1 hasValidGetter]
    || ([a1 performGetter], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_14:
    uint64_t v3 = [a1 propertyForKey:*MEMORY[0x263F60308]];
    goto LABEL_15;
  }
  uint64_t v3 = (void *)v2;
  if ([a1 cellType] == 9) {
    goto LABEL_15;
  }
  if ([a1 cellType] == 2 || objc_msgSend(a1, "cellType") == 4)
  {
    id v4 = [a1 shortTitleDictionary];
  }
  else
  {
    id v4 = [a1 titleDictionary];
  }
  id v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:v3],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_opt_class();
    unint64_t v7 = [v5 objectForKeyedSubscript:v3];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    uint64_t v3 = v7;
    if (!v9) {
      goto LABEL_14;
    }
  }
  else
  {
  }
LABEL_15:
  objc_opt_class();
  id v10 = v3;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)sui_footerString
{
  if ([a1 cellType])
  {
    id v2 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v3 = [a1 propertyForKey:*MEMORY[0x263F600F8]];
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v2 = v4;
  }

  return v2;
}

- (uint64_t)sui_BOOLValue
{
  if ([a1 cellType] != 6
    || ![a1 hasValidSetter]
    || ![a1 hasValidGetter])
  {
    return 0;
  }
  id v2 = [a1 performGetter];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = NSBOOLFromString();
  }
  else
  {
    objc_opt_class();
    id v8 = v3;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10) {
      uint64_t v6 = [v10 BOOLValue];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (uint64_t)setSui_BOOLValue:()ThirdPartyApplicationSettingsAdditions
{
  [a1 willChangeValueForKey:@"sui_BOOLValue"];
  id v5 = [NSNumber numberWithBool:a3];
  [a1 performSetterWithValue:v5];

  return [a1 didChangeValueForKey:@"sui_BOOLValue"];
}

- (uint64_t)sui_prefersSubtitleAppearance
{
  id v2 = (objc_class *)(id)[a1 propertyForKey:*MEMORY[0x263F5FFE0]];
  if (!v2) {
    return 0;
  }
  id v3 = NSStringFromClass(v2);
  id v4 = [a1 identifier];
  if ([@"NOTIFICATIONS" isEqualToString:v4]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [@"PSAppDataUsagePolicyTernaryControlTableCell" isEqualToString:v3];
  }

  return v5;
}

- (void)sui_loadValueFromCell
{
  if (objc_msgSend(a1, "sui_prefersSubtitleAppearance"))
  {
    id v2 = objc_msgSend(a1, "sui_createCellInstance");
    if (v2)
    {
      id v5 = v2;
      [v2 refreshCellContentsWithSpecifier:a1];
      id v3 = [v5 detailTextLabel];
      id v4 = [v3 text];

      if ([v4 length]) {
        [a1 setProperty:v4 forKey:*MEMORY[0x263F60308]];
      }

      id v2 = v5;
    }
  }
}

- (uint64_t)sui_isUserInteractive
{
  if ([a1 controllerLoadAction]
    || !CFPreferencesGetAppBooleanValue(@"kDontUseOldAction", @"com.apple.Preferences", 0)
    && *(void *)&a1[*MEMORY[0x263F5FDF8]]
    || *(void *)&a1[*MEMORY[0x263F5FE38]]
    || *(void *)&a1[*MEMORY[0x263F5FE20]]
    || *(void *)&a1[*MEMORY[0x263F5FE18]])
  {
    goto LABEL_10;
  }
  id v2 = [a1 propertyForKey:*MEMORY[0x263F60180]];
  if (!v2)
  {
    id v2 = [a1 propertyForKey:*MEMORY[0x263F60140]];
    if (!v2)
    {
      uint64_t v10 = *(void *)&a1[*MEMORY[0x263F5FE10]];
      if ((unint64_t)(v10 - 3) >= 2)
      {
        if (v10 == 15) {
          goto LABEL_10;
        }
        if (v10 != 13) {
          return 0;
        }
      }
    }
  }

LABEL_10:
  objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F600A8];
  id v4 = [a1 propertyForKey:*MEMORY[0x263F600A8]];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    return 1;
  }
  unint64_t v7 = [a1 propertyForKey:v3];
  uint64_t v8 = [v7 BOOLValue];

  return v8;
}

- (id)sui_createCellInstance
{
  id v2 = (objc_class *)[MEMORY[0x263F5FCA0] cellClassForSpecifier:a1];
  if ([(objc_class *)v2 isSubclassOfClass:objc_opt_class()])
  {
    id v3 = [v2 alloc];
    uint64_t v4 = [(objc_class *)v2 cellStyle];
    id v5 = [(objc_class *)v2 reuseIdentifierForSpecifier:a1];
    id v6 = (void *)[v3 initWithStyle:v4 reuseIdentifier:v5 specifier:a1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end