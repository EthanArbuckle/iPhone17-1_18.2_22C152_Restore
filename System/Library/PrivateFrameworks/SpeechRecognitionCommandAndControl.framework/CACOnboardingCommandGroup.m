@interface CACOnboardingCommandGroup
+ (id)allCommandGroups;
+ (id)groupWithIdentifier:(id)a3;
+ (id)groupsFromIdentifiers:(id)a3;
- (CACOnboardingCommandGroup)initWithGroupTitle:(id)a3 commands:(id)a4;
- (NSArray)commands;
- (NSString)groupTitle;
- (void)setCommands:(id)a3;
- (void)setGroupTitle:(id)a3;
@end

@implementation CACOnboardingCommandGroup

- (CACOnboardingCommandGroup)initWithGroupTitle:(id)a3 commands:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CACOnboardingCommandGroup;
  v9 = [(CACOnboardingCommandGroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupTitle, a3);
    objc_storeStrong((id *)&v10->_commands, a4);
  }

  return v10;
}

+ (id)groupWithIdentifier:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[CACPreferences sharedPreferences];
  v5 = [v4 builtInCommandsTable];
  v6 = [v5 objectForKey:@"OverviewSections"];

  id v7 = +[CACPreferences sharedPreferences];
  id v8 = [v7 builtInCommandsTable];
  v9 = [v8 objectForKey:@"OrderedOverviewSectionIdentifiers"];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v16 = [NSString stringWithFormat:@"OverviewSectionTitle.%@", v15];
        v17 = +[CACLocaleUtilities localizedUIStringForKey:v16];
        if ([v15 isEqualToString:v3])
        {
          v33 = v17;
          v34 = v16;
          id v35 = v10;
          id v36 = v3;
          v19 = [MEMORY[0x263EFF980] array];
          v20 = [v6 objectForKey:v15];
          v21 = [v20 objectForKey:@"CommandIdentifiers"];

          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          obuint64_t j = v21;
          uint64_t v22 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v39 != v24) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * j);
                v27 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                v28 = [v27 primaryStringForCommandIdentifier:v26];

                v29 = +[CACLocaleUtilities localizedUIStringForKey:@"Onboarding.Command.Format.Title"];
                v30 = [NSString stringWithValidatedFormat:v29, @"%@", 0, v28 validFormatSpecifiers error];
                v31 = +[CACOnboardingFeature featureWithTitleText:v30 helperText:0];
                [v19 addObject:v31];
              }
              uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v23);
          }

          v18 = [[CACOnboardingCommandGroup alloc] initWithGroupTitle:v33 commands:v19];
          id v3 = v36;
          id v10 = v35;
          goto LABEL_18;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  v18 = 0;
LABEL_18:

  return v18;
}

+ (id)groupsFromIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[CACOnboardingCommandGroup groupWithIdentifier:](CACOnboardingCommandGroup, "groupWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)allCommandGroups
{
  v2 = +[CACPreferences sharedPreferences];
  id v3 = [v2 builtInCommandsTable];
  v4 = [v3 objectForKey:@"OrderedOverviewSectionIdentifiers"];

  id v5 = +[CACOnboardingCommandGroup groupsFromIdentifiers:v4];

  return v5;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_groupTitle, 0);
}

@end