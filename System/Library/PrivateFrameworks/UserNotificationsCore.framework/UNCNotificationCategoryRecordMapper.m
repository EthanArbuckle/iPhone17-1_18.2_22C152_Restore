@interface UNCNotificationCategoryRecordMapper
- (UNCNotificationCategoryRecordMapper)initWithBundle:(id)a3;
- (id)notificationActionForNotificationActionRecord:(id)a3;
- (id)notificationCategoryForNotificationCategoryRecord:(id)a3;
@end

@implementation UNCNotificationCategoryRecordMapper

- (UNCNotificationCategoryRecordMapper)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationCategoryRecordMapper;
  v6 = [(UNCNotificationCategoryRecordMapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundle, a3);
  }

  return v7;
}

- (id)notificationActionForNotificationActionRecord:(id)a3
{
  id v4 = a3;
  uint64_t v36 = [v4 identifier];
  id v5 = (void *)MEMORY[0x263F1DED0];
  v6 = [v4 titleLocalizationKey];
  v7 = [v4 titleLocalizationArguments];
  uint64_t v8 = [(BSCFBundle *)self->_bundle cfBundle];
  objc_super v9 = [v4 title];
  uint64_t v35 = [v5 localizedUserNotificationStringForKey:v6 arguments:v7 cfBundle:v8 defaultValue:v9];

  v10 = [v4 url];
  v11 = [v4 iconImageName];
  uint64_t v12 = [v4 isAuthenticationRequired];
  if ([v4 isDestructive]) {
    v12 |= 2uLL;
  }
  if ([v4 isForeground]) {
    v12 |= 4uLL;
  }
  if ([v4 shouldPreventNotificationDismiss]) {
    uint64_t v13 = v12 | 0x10000;
  }
  else {
    uint64_t v13 = v12;
  }
  [v11 length];
  if ([v4 hasSystemIcon]) {
    [MEMORY[0x263F1DF18] iconWithSystemImageName:v11];
  }
  else {
  v14 = [MEMORY[0x263F1DF18] iconWithTemplateImageName:v11];
  }
  v15 = [v4 actionType];
  int v16 = [v15 isEqualToString:@"TextInput"];

  if (v16)
  {
    v17 = (void *)MEMORY[0x263F1DED0];
    v18 = [v4 textInputButtonTitleLocalizationKey];
    v19 = [v4 textInputButtonTitleLocalizationArguments];
    uint64_t v20 = [(BSCFBundle *)self->_bundle cfBundle];
    [v4 textInputButtonTitle];
    v21 = uint64_t v34 = v13;
    v22 = [v17 localizedUserNotificationStringForKey:v18 arguments:v19 cfBundle:v20 defaultValue:v21];

    v23 = (void *)MEMORY[0x263F1DED0];
    v24 = [v4 textInputPlaceholderLocalizationKey];
    v25 = [v4 textInputPlaceholderLocalizationArguments];
    uint64_t v26 = [(BSCFBundle *)self->_bundle cfBundle];
    v27 = [v4 textInputPlaceholder];
    v28 = [v23 localizedUserNotificationStringForKey:v24 arguments:v25 cfBundle:v26 defaultValue:v27];

    v30 = (void *)v35;
    v29 = (void *)v36;
    v31 = [MEMORY[0x263F1DF98] actionWithIdentifier:v36 title:v35 options:v34 icon:v14 textInputButtonTitle:v22 textInputPlaceholder:v28];
  }
  else
  {
    if (v10)
    {
      v30 = (void *)v35;
      v29 = (void *)v36;
      [MEMORY[0x263F1DF10] actionWithIdentifier:v36 title:v35 url:v10 icon:v14];
    }
    else
    {
      uint64_t v32 = v13;
      v30 = (void *)v35;
      v29 = (void *)v36;
      [MEMORY[0x263F1DF10] actionWithIdentifier:v36 title:v35 options:v32 icon:v14];
    v31 = };
  }

  return v31;
}

- (id)notificationCategoryForNotificationCategoryRecord:(id)a3
{
  id v4 = a3;
  v24 = [v4 identifier];
  id v5 = [v4 actions];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke;
  v26[3] = &unk_265568790;
  v26[4] = self;
  v23 = objc_msgSend(v5, "bs_map:", v26);

  v6 = [v4 minimalActions];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke_2;
  v25[3] = &unk_265568790;
  v25[4] = self;
  v22 = objc_msgSend(v6, "bs_map:", v25);

  v7 = [v4 intentIdentifiers];
  unsigned int v8 = [v4 hasCustomDismissAction];
  int v9 = [v4 hasFollowActivityAction];
  int v10 = [v4 shouldAllowInCarPlay];
  int v11 = [v4 privacyOptionShowTitle];
  int v12 = [v4 privacyOptionShowSubtitle];
  int v13 = [v4 hasCustomSilenceAction];
  v14 = [v4 backgroundStyle];
  if ([v14 isEqualToString:@"System"])
  {
    uint64_t v15 = 1;
  }
  else if ([v14 isEqualToString:@"Dark"])
  {
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v8;
  if (v9) {
    uint64_t v16 = v8 | 0x80000000;
  }
  if (v10) {
    v16 |= 2uLL;
  }
  if (v11) {
    v16 |= 4uLL;
  }
  if (v12) {
    v16 |= 8uLL;
  }
  if (v13) {
    uint64_t v17 = v16 | 0x400000;
  }
  else {
    uint64_t v17 = v16;
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263F1DEE8]) initWithIdentifier:v24];
  [v18 setActions:v23];
  [v18 setMinimalActions:v22];
  [v18 setIntentIdentifiers:v7];
  v19 = [v4 privateBody];
  [v18 setHiddenPreviewsBodyPlaceholder:v19];

  uint64_t v20 = [v4 summaryFormat];
  [v18 setCategorySummaryFormat:v20];

  [v18 setOptions:v17];
  [v18 setBackgroundStyle:v15];

  return v18;
}

uint64_t __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notificationActionForNotificationActionRecord:a2];
}

- (void).cxx_destruct
{
}

uint64_t __89__UNCNotificationCategoryRecordMapper_notificationCategoryForNotificationCategoryRecord___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notificationActionForNotificationActionRecord:a2];
}

@end