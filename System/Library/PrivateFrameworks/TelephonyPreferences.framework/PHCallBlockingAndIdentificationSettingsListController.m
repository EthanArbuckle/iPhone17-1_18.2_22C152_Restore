@interface PHCallBlockingAndIdentificationSettingsListController
- (BOOL)canEditExtensions;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CoreTelephonyClient)ctClient;
- (OS_dispatch_queue)queue;
- (PHBusinessCallingController)businessCallingController;
- (PHCallBlockingAndIdentificationSettingsListController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHCallDirectorySettingsController)callDirectorySettingsController;
- (PHLiveLookupSettingsController)liveLookupSettingsController;
- (PHSilenceJunkCallingController)silenceJunkCallingController;
- (TUConfigurationProvider)configurationProvider;
- (TUFeatureFlags)featureFlags;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)businessCallIdentificationIndex;
- (int64_t)callDirectoryIdentificationIndex;
- (int64_t)liveLookupIdentificationIndex;
- (int64_t)spamBlockingIdentificationIndex;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)businessCallingSpecifierCount;
- (void)activeSubscriptionsDidChange;
- (void)addBusinessCallingSpecifierIfNecessary:(id)a3;
- (void)addCallDirectorySpecifierIfNecessary:(id)a3;
- (void)addLiveLookupSpecifierIfNecessary:(id)a3;
- (void)addSpamBlockingSpecifiersIfNecessary:(id)a3;
- (void)configurationChanged;
- (void)emitNavigationEvent;
- (void)refreshView;
- (void)reloadSpecifiers;
- (void)setBusinessCallingSpecifierCount:(unint64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCallBlockingAndIdentificationSettingsListController

- (PHCallBlockingAndIdentificationSettingsListController)initWithNibName:(id)a3 bundle:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)PHCallBlockingAndIdentificationSettingsListController;
  v4 = [(PHCallBlockingAndIdentificationSettingsListController *)&v23 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("PHCallBlockingAndIdentificationSettingsListControllerQueue", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v4->_queue];
    ctClient = v4->_ctClient;
    v4->_ctClient = (CoreTelephonyClient *)v8;

    [(CoreTelephonyClient *)v4->_ctClient setDelegate:v4];
    v10 = [[PHBusinessCallingController alloc] initWithCoreTelephonyClient:v4->_ctClient];
    businessCallingController = v4->_businessCallingController;
    v4->_businessCallingController = v10;

    v4->_businessCallingSpecifierCount = 0;
    v12 = [[PHSilenceJunkCallingController alloc] initWithCoreTelephonyClient:v4->_ctClient queue:v4->_queue];
    silenceJunkCallingController = v4->_silenceJunkCallingController;
    v4->_silenceJunkCallingController = v12;

    v14 = [[PHCallDirectorySettingsController alloc] initWithParent:v4];
    callDirectorySettingsController = v4->_callDirectorySettingsController;
    v4->_callDirectorySettingsController = v14;

    v16 = [[PHLiveLookupSettingsController alloc] initWithParent:v4];
    liveLookupSettingsController = v4->_liveLookupSettingsController;
    v4->_liveLookupSettingsController = v16;

    v18 = (TUFeatureFlags *)objc_alloc_init(MEMORY[0x1E4FADBD0]);
    featureFlags = v4->_featureFlags;
    v4->_featureFlags = v18;

    if ([(TUFeatureFlags *)v4->_featureFlags deviceExpertMigrationEnabled])
    {
      v20 = (TUConfigurationProvider *)objc_alloc_init(MEMORY[0x1E4FADAF8]);
      configurationProvider = v4->_configurationProvider;
      v4->_configurationProvider = v20;

      [(TUConfigurationProvider *)v4->_configurationProvider setDelegate:v4];
    }
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHCallBlockingAndIdentificationSettingsListController;
  [(PHCallBlockingAndIdentificationSettingsListController *)&v7 viewWillAppear:a3];
  v4 = [(PHCallBlockingAndIdentificationSettingsListController *)self specifier];
  v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PHCallBlockingAndIdentificationSettingsListController *)self emitNavigationEvent];
  }
  [(PHBusinessCallingController *)self->_businessCallingController updateBusinessCallingState];
  [(PHCallBlockingAndIdentificationSettingsListController *)self refreshView];
}

- (void)emitNavigationEvent
{
  v3 = [(PHCallBlockingAndIdentificationSettingsListController *)self specifier];
  v4 = [v3 target];
  v5 = [v4 parentListController];
  id v27 = [v5 specifierID];

  id v6 = objc_alloc(MEMORY[0x1E4F292B8]);
  objc_super v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  v10 = (void *)[v6 initWithKey:@"Apps" table:0 locale:v7 bundleURL:v9];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
  if ([v27 isEqualToString:@"com.apple.preferences.facetime"])
  {
    v26 = v10;
    id v12 = (id)*MEMORY[0x1E4FADD08];
    id v13 = objc_alloc(MEMORY[0x1E4F292B8]);
    v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    v17 = @"FaceTime";
  }
  else
  {
    if (![v27 isEqualToString:@"com.apple.preferences.phone"]) {
      goto LABEL_6;
    }
    v26 = v10;
    id v12 = (id)*MEMORY[0x1E4FADD30];
    id v13 = objc_alloc(MEMORY[0x1E4F292B8]);
    v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 bundleURL];
    v17 = @"Phone";
  }
  v18 = (void *)[v13 initWithKey:v17 table:0 locale:v14 bundleURL:v16];
  [v11 addObject:v18];

  v19 = [NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", v12, @"CALL_DIRECTORIES"];
  v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
  id v21 = objc_alloc(MEMORY[0x1E4F292B8]);
  v22 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_super v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v24 = [v23 bundleURL];
  v25 = (void *)[v21 initWithKey:@"Call Blocking & Identification" table:0 locale:v22 bundleURL:v24];

  [(PHCallBlockingAndIdentificationSettingsListController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v12 title:v25 localizedNavigationComponents:v11 deepLink:v20];
  v10 = v26;
LABEL_6:
}

- (void)activeSubscriptionsDidChange
{
  [(PHBusinessCallingController *)self->_businessCallingController updateBusinessCallingState];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PHCallBlockingAndIdentificationSettingsListController_activeSubscriptionsDidChange__block_invoke;
  block[3] = &unk_1E6EB2258;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PHCallBlockingAndIdentificationSettingsListController_activeSubscriptionsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  if (v6 == [(PHCallBlockingAndIdentificationSettingsListController *)self callDirectoryIdentificationIndex])
  {
    objc_super v7 = &OBJC_IVAR___PHCallBlockingAndIdentificationSettingsListController__callDirectorySettingsController;
  }
  else
  {
    uint64_t v8 = [v5 section];
    if (v8 != [(PHCallBlockingAndIdentificationSettingsListController *)self liveLookupIdentificationIndex])
    {
      char v9 = 0;
      goto LABEL_7;
    }
    objc_super v7 = &OBJC_IVAR___PHCallBlockingAndIdentificationSettingsListController__liveLookupSettingsController;
  }
  char v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v7) canEditExtensions];
LABEL_7:

  return v9;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 section];
  if (v10 == [v9 section])
  {
    uint64_t v11 = [v8 section];
    if (v11 == [(PHCallBlockingAndIdentificationSettingsListController *)self callDirectoryIdentificationIndex])
    {
      id v12 = [(PHCallBlockingAndIdentificationSettingsListController *)self callDirectorySettingsController];
    }
    else
    {
      uint64_t v13 = [v8 section];
      if (v13 != [(PHCallBlockingAndIdentificationSettingsListController *)self liveLookupIdentificationIndex])goto LABEL_7; {
      id v12 = [(PHCallBlockingAndIdentificationSettingsListController *)self liveLookupSettingsController];
      }
    }
    v14 = v12;
    [v12 tableView:v15 moveRowAtIndexPath:v8 toIndexPath:v9];
  }
LABEL_7:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = v6;
  uint64_t v9 = [v8 section];
  id v10 = v8;
  if (v9 == [v7 section])
  {
    id v10 = v7;
  }
  return v10;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(PHCallBlockingAndIdentificationSettingsListController *)self loadSpecifiersFromPlistName:@"CallDirectorySettings" target:self];
    [(PHCallBlockingAndIdentificationSettingsListController *)self addBusinessCallingSpecifierIfNecessary:v5];
    [(PHCallBlockingAndIdentificationSettingsListController *)self addSpamBlockingSpecifiersIfNecessary:v5];
    [(PHCallBlockingAndIdentificationSettingsListController *)self addCallDirectorySpecifierIfNecessary:v5];
    [(PHCallBlockingAndIdentificationSettingsListController *)self addLiveLookupSpecifierIfNecessary:v5];
    id v6 = (objc_class *)[v5 copy];
    id v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHCallBlockingAndIdentificationSettingsListController;
  -[PHCallBlockingAndIdentificationSettingsListController setEditing:animated:](&v8, sel_setEditing_animated_);
  id v7 = [(PHCallBlockingAndIdentificationSettingsListController *)self table];
  [v7 setEditing:v5 animated:v4];

  [(PHCallBlockingAndIdentificationSettingsListController *)self setNavigationItemsForEditing:v5 animated:v4];
  if (!v5) {
    [(PHCallBlockingAndIdentificationSettingsListController *)self refreshView];
  }
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)PHCallBlockingAndIdentificationSettingsListController;
  [(PHCallBlockingAndIdentificationSettingsListController *)&v3 reloadSpecifiers];
  [(PHCallBlockingAndIdentificationSettingsListController *)self setNavigationItemsForEditing:[(PHCallBlockingAndIdentificationSettingsListController *)self isEditing] animated:0];
}

- (void)addBusinessCallingSpecifierIfNecessary:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(PHBusinessCallingController *)self->_businessCallingController specifiers];
  self->_businessCallingSpecifierCount = [v4 count];
  if (v4) {
    [v5 addObjectsFromArray:v4];
  }
}

- (void)addSpamBlockingSpecifiersIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Spam blocking addSpamBlockingSpecifiersIfNecessary", v7, 2u);
  }

  id v6 = [(PHSilenceJunkCallingController *)self->_silenceJunkCallingController specifiers:self->_businessCallingSpecifierCount != 0];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
}

- (void)addCallDirectorySpecifierIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Call Directory addCallDirectorySpecifierIfNecessary", v7, 2u);
  }

  id v6 = [(PHCallDirectorySettingsController *)self->_callDirectorySettingsController specifiers];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
}

- (void)addLiveLookupSpecifierIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "live lookup addLiveLookupSpecifierIfNecessary", v7, 2u);
  }

  id v6 = [(PHLiveLookupSettingsController *)self->_liveLookupSettingsController specifiers];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
}

- (BOOL)canEditExtensions
{
  objc_super v3 = [(PHCallBlockingAndIdentificationSettingsListController *)self callDirectorySettingsController];
  if ([v3 canEditExtensions])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(PHCallBlockingAndIdentificationSettingsListController *)self liveLookupSettingsController];
    char v4 = [v5 canEditExtensions];
  }
  return v4;
}

- (void)refreshView
{
  if (([(PHCallBlockingAndIdentificationSettingsListController *)self isEditing] & 1) == 0
    && [(PHCallBlockingAndIdentificationSettingsListController *)self isViewLoaded])
  {
    [(PHCallBlockingAndIdentificationSettingsListController *)self reloadSpecifiers];
    uint64_t v3 = [(PHCallBlockingAndIdentificationSettingsListController *)self isEditing];
    [(PHCallBlockingAndIdentificationSettingsListController *)self setNavigationItemsForEditing:v3 animated:0];
  }
}

- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PHCallBlockingAndIdentificationSettingsListController *)self navigationItem];
  if (v6)
  {
    id v10 = (void *)v6;
    if ([(PHCallBlockingAndIdentificationSettingsListController *)self isViewLoaded])
    {
      if ([(PHCallBlockingAndIdentificationSettingsListController *)self canEditExtensions])
      {
        id v7 = [(PHCallBlockingAndIdentificationSettingsListController *)self editButtonItem];
      }
      else
      {
        id v7 = 0;
      }
      objc_super v8 = [v10 leftBarButtonItem];

      if (v8) {
        [v10 setLeftBarButtonItem:0 animated:v4];
      }
      uint64_t v9 = [v10 rightBarButtonItem];

      if (v9 != v7) {
        [v10 setRightBarButtonItem:v7 animated:v4];
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

- (int64_t)businessCallIdentificationIndex
{
  if (self->_businessCallingSpecifierCount) {
    return 0;
  }
  else {
    return -1;
  }
}

- (int64_t)spamBlockingIdentificationIndex
{
  int64_t v3 = [(PHCallBlockingAndIdentificationSettingsListController *)self businessCallIdentificationIndex];
  return v3
       + [(PHSilenceJunkCallingController *)self->_silenceJunkCallingController hasSpamEnabledSim];
}

- (int64_t)callDirectoryIdentificationIndex
{
  int64_t v3 = [(PHCallBlockingAndIdentificationSettingsListController *)self spamBlockingIdentificationIndex];
  return v3
       + [(PHCallDirectorySettingsController *)self->_callDirectorySettingsController hasExtensions];
}

- (int64_t)liveLookupIdentificationIndex
{
  int64_t v3 = [(PHCallBlockingAndIdentificationSettingsListController *)self callDirectoryIdentificationIndex];
  return v3 + [(PHLiveLookupSettingsController *)self->_liveLookupSettingsController hasExtensions];
}

- (void)configurationChanged
{
  [(PHBusinessCallingController *)self->_businessCallingController updateBusinessCallingState];
  [(PHCallBlockingAndIdentificationSettingsListController *)self refreshView];
}

- (PHBusinessCallingController)businessCallingController
{
  return self->_businessCallingController;
}

- (PHSilenceJunkCallingController)silenceJunkCallingController
{
  return self->_silenceJunkCallingController;
}

- (PHCallDirectorySettingsController)callDirectorySettingsController
{
  return self->_callDirectorySettingsController;
}

- (PHLiveLookupSettingsController)liveLookupSettingsController
{
  return self->_liveLookupSettingsController;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (TUConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (unint64_t)businessCallingSpecifierCount
{
  return self->_businessCallingSpecifierCount;
}

- (void)setBusinessCallingSpecifierCount:(unint64_t)a3
{
  self->_businessCallingSpecifierCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_liveLookupSettingsController, 0);
  objc_storeStrong((id *)&self->_callDirectorySettingsController, 0);
  objc_storeStrong((id *)&self->_silenceJunkCallingController, 0);
  objc_storeStrong((id *)&self->_businessCallingController, 0);
}

@end