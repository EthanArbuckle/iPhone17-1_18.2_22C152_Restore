@interface SUSUISoftwareUpdateRecommendedAvailableAlertItem
- (BOOL)allowAutoUnlock;
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)undimsScreen;
- (BOOL)unlocksScreen;
- (SUSUISoftwareUpdateRecommendedAvailableAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4;
- (id)buttons;
- (id)learnMoreButton;
- (id)message;
- (id)title;
@end

@implementation SUSUISoftwareUpdateRecommendedAvailableAlertItem

- (SUSUISoftwareUpdateRecommendedAvailableAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)SUSUISoftwareUpdateRecommendedAvailableAlertItem;
  v11 = [(SUSUIBaseSoftwareUpdateAlertItem *)&v8 initWithDescriptor:location[0] softwareUpdateController:v9];
  v7 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (id)title
{
  objc_super v8 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  id v7 = [(SUDescriptor *)v8 documentation];
  id v9 = [v7 recommendedUpdateTitleString];

  if (v9)
  {
    v6 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
    id v5 = [(SUDescriptor *)v6 documentation];
    id v11 = [v5 recommendedUpdateTitleString];
  }
  else
  {
    id v4 = sub_38B80();
    id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_RECOMMENDED_AVAILABLE_DEFAULT_TITLE"];
    id v11 = objc_msgSend(v4, "localizedStringForKey:value:table:");
  }

  return v11;
}

- (id)message
{
  objc_super v8 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
  id v7 = [(SUDescriptor *)v8 documentation];
  id v9 = [v7 recommendedUpdateAlertBodyString];

  if (v9)
  {
    v6 = [(SUSUIBaseSoftwareUpdateAlertItem *)self descriptor];
    id v5 = [(SUDescriptor *)v6 documentation];
    id v11 = [v5 recommendedUpdateAlertBodyString];
  }
  else
  {
    id v4 = sub_38B80();
    id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_RECOMMENDED_AVAILABLE_DEFAULT_MESSAGE"];
    id v11 = objc_msgSend(v4, "localizedStringForKey:value:table:");
  }

  return v11;
}

- (id)buttons
{
  id v3 = [(SUSUISoftwareUpdateRecommendedAvailableAlertItem *)self learnMoreButton];
  id v5 = v3;
  id v4 = +[NSArray arrayWithObjects:&v5 count:1];

  return v4;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (BOOL)allowInSetup
{
  return 0;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)allowAutoUnlock
{
  return 0;
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)unlocksScreen
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 0;
}

- (id)learnMoreButton
{
  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  v13 = self;
  v2 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v2);
  v6 = [SUSUIAlertButtonDefinition alloc];
  id v8 = sub_38B80();
  id v7 = [v8 localizedStringForKey:@"SOFTWARE_UPDATE_RECOMMENDED_AVAILABLE_ACTION_LEARN_MORE" value:&stru_62DF0 table:@"ui_alerts"];
  v10 = v12;
  id v11 = v13;
  id v3 = -[SUSUIAlertButtonDefinition initWithLabel:presentationStyle:isPreferredButton:handler:](v6, "initWithLabel:presentationStyle:isPreferredButton:handler:", v7, 0, 1);
  id v4 = v14[0];
  v14[0] = v3;

  id v9 = v14[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(v14, 0);

  return v9;
}

@end