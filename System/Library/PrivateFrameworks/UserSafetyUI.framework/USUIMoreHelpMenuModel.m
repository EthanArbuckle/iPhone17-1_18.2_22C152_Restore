@interface USUIMoreHelpMenuModel
+ (id)menuTitleWith:(int64_t)a3;
+ (id)modelWithOptions:(int64_t)a3 interventionType:(int64_t)a4;
+ (void)addDefaultActionsTo:(id)a3;
+ (void)addMenuActionsTo:(id)a3 interventionType:(int64_t)a4;
+ (void)addOptionalActionsTo:(id)a3 options:(int64_t)a4;
- (NSArray)actions;
- (NSString)title;
- (void)setActions:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation USUIMoreHelpMenuModel

+ (id)modelWithOptions:(int64_t)a3 interventionType:(int64_t)a4
{
  v7 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  [a1 addMenuActionsTo:v7 interventionType:a4];
  [a1 addDefaultActionsTo:v7];
  [a1 addOptionalActionsTo:v7 options:a3];
  v8 = objc_opt_new();
  v9 = [a1 menuTitleWith:a4];
  [v8 setTitle:v9];

  v10 = (void *)[v7 copy];
  [v8 setActions:v10];

  return v8;
}

+ (id)menuTitleWith:(int64_t)a3
{
  if (a3 == 2) {
    v3 = @"SENSITIVE_MEDIA_DETECTED_TITLE";
  }
  else {
    v3 = @"BLOCK_CONTACT_ACTION_TITLE";
  }
  v4 = [MEMORY[0x263F67DD8] localizedStringForKey:v3];
  return v4;
}

+ (void)addMenuActionsTo:(id)a3 interventionType:(int64_t)a4
{
  if (a4 != 2)
  {
    v5 = (void *)MEMORY[0x263F67DD8];
    if (a4) {
      v6 = @"MESSAGE_SOMEONE";
    }
    else {
      v6 = @"MESSAGE_GROWNUP";
    }
    id v7 = a3;
    id v9 = [v5 localizedStringForKey:v6];
    v8 = +[USUIMoreHelpMenuAction action:v9 destructive:0 actionID:1];
    [v7 addObject:v8];
  }
}

+ (void)addDefaultActionsTo:(id)a3
{
  v3 = (void *)MEMORY[0x263F67DD8];
  id v4 = a3;
  id v6 = [v3 localizedStringForKey:@"MORE_HELP"];
  v5 = +[USUIMoreHelpMenuAction action:v6 destructive:0 actionID:2];
  [v4 addObject:v5];
}

+ (void)addOptionalActionsTo:(id)a3 options:(int64_t)a4
{
  id v5 = a3;
  if (a4)
  {
    id v12 = v5;
    if ((a4 & 4) != 0)
    {
      id v6 = [MEMORY[0x263F67DD8] localizedStringForKey:@"LEAVE_CONVERSATION_BUTTON_TITLE"];
      id v7 = +[USUIMoreHelpMenuAction action:v6 destructive:1 actionID:3];
      [v12 addObject:v7];
    }
    if (a4)
    {
      v8 = [MEMORY[0x263F67DD8] localizedStringForKey:@"BLOCK_CONTACT_BUTTON_TITLE"];
      id v9 = +[USUIMoreHelpMenuAction action:v8 destructive:1 actionID:4];
      [v12 addObject:v9];
    }
    id v5 = v12;
    if ((a4 & 2) != 0)
    {
      v10 = [MEMORY[0x263F67DD8] localizedStringForKey:@"BLOCK_CONTACTS_BUTTON_TITLE"];
      v11 = +[USUIMoreHelpMenuAction action:v10 destructive:1 actionID:5];
      [v12 addObject:v11];

      id v5 = v12;
    }
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end