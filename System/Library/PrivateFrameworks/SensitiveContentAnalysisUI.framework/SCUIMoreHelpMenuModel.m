@interface SCUIMoreHelpMenuModel
+ (id)menuTitleWith:(int64_t)a3 options:(int64_t)a4;
+ (id)modelWithOptions:(int64_t)a3 contextDictionary:(id)a4 interventionType:(int64_t)a5 locale:(id)a6;
+ (id)modelWithOptions:(int64_t)a3 interventionType:(int64_t)a4 locale:(id)a5;
+ (void)addDefaultActionsTo:(id)a3;
+ (void)addMenuActionsTo:(id)a3 interventionType:(int64_t)a4;
+ (void)addOptionalActionsTo:(id)a3 options:(int64_t)a4;
- (NSArray)actions;
- (NSDictionary)contextDictionary;
- (NSString)title;
- (SCUIReportAuthority)authority;
- (int64_t)interventionType;
- (int64_t)options;
- (void)setActions:(id)a3;
- (void)setAuthority:(id)a3;
- (void)setContextDictionary:(id)a3;
- (void)setInterventionType:(int64_t)a3;
- (void)setOptions:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SCUIMoreHelpMenuModel

+ (id)modelWithOptions:(int64_t)a3 interventionType:(int64_t)a4 locale:(id)a5
{
  return (id)[a1 modelWithOptions:a3 contextDictionary:0 interventionType:a4 locale:a5];
}

+ (id)modelWithOptions:(int64_t)a3 contextDictionary:(id)a4 interventionType:(int64_t)a5 locale:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = [[SCUIReportAuthority alloc] initWithLocale:v10 moreHelpMenuOptions:a3 interventionType:a5];

  if (!v12) {
    a3 &= ~0x20uLL;
  }
  if ([(SCUIReportAuthority *)v12 kind] == 1) {
    int64_t v13 = a3 | 0x40;
  }
  else {
    int64_t v13 = a3;
  }
  v14 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  if ((v13 & 0x80) != 0)
  {
    v15 = +[SCUIResources localizedStringForKey:@"SHOW_TITLE"];
    v16 = +[SCUIMoreHelpMenuAction action:v15 iconSystemName:@"eye.fill" destructive:0 actionID:9];
    [v14 addObject:v16];
  }
  [a1 addMenuActionsTo:v14 interventionType:a5];
  [a1 addDefaultActionsTo:v14];
  [a1 addOptionalActionsTo:v14 options:v13];
  v17 = objc_opt_new();
  v18 = [a1 menuTitleWith:a5 options:v13];
  [v17 setTitle:v18];

  v19 = (void *)[v14 copy];
  [v17 setActions:v19];

  [v17 setAuthority:v12];
  [v17 setOptions:v13];
  [v17 setInterventionType:a5];
  [v17 setContextDictionary:v11];

  return v17;
}

+ (id)menuTitleWith:(int64_t)a3 options:(int64_t)a4
{
  if (a3 == 2)
  {
    v4 = @"SENSITIVE_MEDIA_DETECTED_TITLE";
  }
  else if ((a4 & 0x20) != 0)
  {
    v4 = @"BLOCK_CONTACT_OR_REPORT_ACTION_TITLE";
  }
  else if ((a4 & 3) != 0)
  {
    v4 = @"BLOCK_CONTACT_ACTION_TITLE";
  }
  else
  {
    v4 = @"DEFAULT_ACTION_TITLE";
  }
  v5 = +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4, a4);

  return v5;
}

+ (void)addMenuActionsTo:(id)a3 interventionType:(int64_t)a4
{
  if (a4 != 2)
  {
    if (a4) {
      v5 = @"MESSAGE_SOMEONE";
    }
    else {
      v5 = @"MESSAGE_GROWNUP";
    }
    id v6 = a3;
    id v8 = +[SCUIResources localizedStringForKey:v5];
    v7 = +[SCUIMoreHelpMenuAction action:v8 iconSystemName:@"message" destructive:0 actionID:1];
    [v6 addObject:v7];
  }
}

+ (void)addDefaultActionsTo:(id)a3
{
  id v3 = a3;
  id v5 = +[SCUIResources localizedStringForKey:@"MORE_HELP"];
  uint64_t v4 = +[SCUIMoreHelpMenuAction action:v5 iconSystemName:@"doc.plaintext" destructive:0 actionID:2];
  [v3 addObject:v4];
}

+ (void)addOptionalActionsTo:(id)a3 options:(int64_t)a4
{
  id v5 = a3;
  if (!a4) {
    goto LABEL_10;
  }
  id v19 = v5;
  if ((a4 & 0x10) != 0)
  {
    id v10 = +[SCUIResources localizedStringForKey:@"HIDE_PHOTO_BUTTON_TITLE"];
    id v11 = +[SCUIMoreHelpMenuAction action:v10 iconSystemName:0 destructive:0 actionID:7];
    [v19 addObject:v11];

    if ((a4 & 0x20) == 0)
    {
LABEL_4:
      if ((a4 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_18;
    }
  }
  else if ((a4 & 0x20) == 0)
  {
    goto LABEL_4;
  }
  if ((a4 & 0x40) != 0) {
    v12 = @"REPORT_TO_APPLE";
  }
  else {
    v12 = @"REPORT_TO_AUTHORITIES";
  }
  int64_t v13 = +[SCUIResources localizedStringForKey:v12];
  v14 = +[SCUIMoreHelpMenuAction action:v13 iconSystemName:@"eye.trianglebadge.exclamationmark.fill" destructive:0 actionID:8];
  [v19 addObject:v14];

  if ((a4 & 8) == 0)
  {
LABEL_5:
    if ((a4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v15 = +[SCUIResources localizedStringForKey:@"DELETE_ITEM_BUTTON_TITLE"];
  v16 = +[SCUIMoreHelpMenuAction action:v15 iconSystemName:0 destructive:1 actionID:6];
  [v19 addObject:v16];

  if ((a4 & 4) == 0)
  {
LABEL_6:
    if ((a4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  v17 = +[SCUIResources localizedStringForKey:@"LEAVE_CONVERSATION_BUTTON_TITLE"];
  v18 = +[SCUIMoreHelpMenuAction action:v17 iconSystemName:0 destructive:1 actionID:3];
  [v19 addObject:v18];

  if (a4)
  {
LABEL_7:
    id v6 = +[SCUIResources localizedStringForKey:@"BLOCK_CONTACT_BUTTON_TITLE"];
    v7 = +[SCUIMoreHelpMenuAction action:v6 iconSystemName:@"person.slash.fill" destructive:1 actionID:4];
    [v19 addObject:v7];
  }
LABEL_8:
  id v5 = v19;
  if ((a4 & 2) != 0)
  {
    id v8 = +[SCUIResources localizedStringForKey:@"BLOCK_CONTACTS_BUTTON_TITLE"];
    v9 = +[SCUIMoreHelpMenuAction action:v8 iconSystemName:@"person.slash.fill" destructive:1 actionID:5];
    [v19 addObject:v9];

    id v5 = v19;
  }
LABEL_10:
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (SCUIReportAuthority)authority
{
  return self->_authority;
}

- (void)setAuthority:(id)a3
{
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (void)setContextDictionary:(id)a3
{
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void)setInterventionType:(int64_t)a3
{
  self->_interventionType = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_authority, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end