@interface VUIAccountSettingsButtonFactory
+ (id)_createAccountSettingsRouterDataSourceWith:(id)a3;
+ (id)createLibraryAccountSettingButtonWith:(id)a3;
+ (void)handleAccountSettingButtonSelected;
+ (void)recordClickEvent;
@end

@implementation VUIAccountSettingsButtonFactory

+ (id)createLibraryAccountSettingButtonWith:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (VUIAccountSettingsButton *)v3;
  }
  else
  {
    v4 = [[VUIAccountSettingsButton alloc] initWithType:4 interfaceStyle:0];
    v5 = +[VUILocalizationManager sharedInstance];
    v6 = [v5 localizedStringForKey:@"TV.Button.AccountSettings"];
    [(VUIAccountSettingsButton *)v4 setAccessibilityLabel:v6];
  }
  [(VUIButton *)v4 setSelectActionHandler:&__block_literal_global_9];

  return v4;
}

uint64_t __73__VUIAccountSettingsButtonFactory_createLibraryAccountSettingButtonWith___block_invoke()
{
  +[VUIAccountSettingsButtonFactory recordClickEvent];
  return +[VUIAccountSettingsButtonFactory handleAccountSettingButtonSelected];
}

+ (void)handleAccountSettingButtonSelected
{
  id v3 = +[VUITVAppLauncher sharedInstance];
  id v6 = [v3 appController];

  v4 = [v6 appContext];
  v5 = [a1 _createAccountSettingsRouterDataSourceWith:v4];
  +[VUIApplicationRouter handleEvent:*MEMORY[0x1E4FA9D18] targetResponder:0 appContext:v4 routerDataSource:v5 supplementaryData:0 extraInfo:0];
}

+ (id)_createAccountSettingsRouterDataSourceWith:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17 = @"selectEventDataSource";
  v15 = @"documentDataSource";
  v13[0] = @"controllerRef";
  v13[1] = @"documentType";
  v14[0] = @"AccountSettings";
  v14[1] = @"default";
  v13[2] = @"uiConfiguration";
  v11[0] = @"transitionType";
  v11[1] = @"viewControllerDocumentId";
  v12[0] = @"FormSheet";
  v12[1] = @"AccountSettings";
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  v9 = [[VUIRouterDataSource alloc] initWithRouterData:v8 appContext:v4];
  return v9;
}

+ (void)recordClickEvent
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"targetId";
  v4[1] = @"targetType";
  v5[0] = @"accountSettings";
  v5[1] = @"button";
  v4[2] = @"actionType";
  v5[2] = @"navigate";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  id v3 = +[VUIMetricsController sharedInstance];
  [v3 recordClick:v2];
}

@end