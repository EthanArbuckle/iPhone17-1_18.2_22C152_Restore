@interface SUSUIRollbackSuggestedAlertItem
- (BOOL)allowInSetup;
- (SURollbackSuggestionInfo)suggestionInfo;
- (SUSUIRollbackSuggestedAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 info:(id)a5;
- (id)_notificationMessage;
- (id)_notificationTitle;
- (id)buttons;
- (id)message;
- (id)title;
- (void)setSuggestionInfo:(id)a3;
@end

@implementation SUSUIRollbackSuggestedAlertItem

- (SUSUIRollbackSuggestedAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4 info:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSUIRollbackSuggestedAlertItem;
  v10 = [(SUSUIBaseSoftwareUpdateAlertItem *)&v11 initWithDescriptor:location[0] softwareUpdateController:v13];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10) {
    objc_storeStrong((id *)((char *)&v15->super._controller + 1), v12);
  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)title
{
  return [(SUSUIRollbackSuggestedAlertItem *)self _notificationTitle];
}

- (id)message
{
  return [(SUSUIRollbackSuggestedAlertItem *)self _notificationMessage];
}

- (id)buttons
{
  v23[2] = self;
  v23[1] = (id)a2;
  v23[0] = 0;
  v22 = 0;
  v21 = self;
  id v20 = +[NSMutableArray array];
  v7 = [SUSUIAlertButtonDefinition alloc];
  id v9 = sub_42D20();
  id v8 = objc_msgSend(v9, "localizedStringForKey:value:table:", @"ROLLBACK_SUGGESTED_ALERT_SETTINGS_BUTTON");
  v14[1] = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_42A50;
  v18 = &unk_5CC30;
  v19 = v21;
  v2 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v7, "initWithLabel:presentationStyle:isPreferredButton:handler:", v8, 0, 1);
  id v3 = v23[0];
  v23[0] = v2;

  [v20 addObject:v23[0]];
  v10 = [SUSUIAlertButtonDefinition alloc];
  id v12 = sub_42D20();
  id v11 = [v12 localizedStringForKey:@"ROLLBACK_SUGGESTED_ALERT_NOT_NOW_BUTTON" value:&stru_62DF0 table:@"ui_alerts"];
  v14[0] = v21;
  v4 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v10, "initWithLabel:presentationStyle:isPreferredButton:handler:", v11, 2, 0);
  v5 = v22;
  v22 = v4;

  [v20 addObject:v22];
  id v13 = [v20 copy];
  objc_storeStrong(v14, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(v23, 0);

  return v13;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (id)_notificationTitle
{
  id v4 = sub_42D20();
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ROLLBACK_SUGGESTED_ALERT_TITLE"];
  id v5 = objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (id)_notificationMessage
{
  id v4 = sub_42D20();
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ROLLBACK_SUGGESTED_ALERT_MESSAGE"];
  id v5 = objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (SURollbackSuggestionInfo)suggestionInfo
{
  return (SURollbackSuggestionInfo *)objc_getProperty(self, a2, 41, 1);
}

- (void)setSuggestionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end