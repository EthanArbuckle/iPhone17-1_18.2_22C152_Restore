@interface PSNotificationSettingsController
+ (id)sharedInstance;
- (PSNotificationSettingsController)init;
- (id)allSectionInfoIdentifiers;
- (id)sectionInfoForIdentifier:(id)a3;
- (void)dealloc;
@end

@implementation PSNotificationSettingsController

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance___instance_0;
  return v2;
}

uint64_t __50__PSNotificationSettingsController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PSNotificationSettingsController);
  uint64_t v1 = sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PSNotificationSettingsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PSNotificationSettingsController;
  v2 = [(PSNotificationSettingsController *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.preferences.BBSettingsGateway", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v5 = (void *)getBBSettingsGatewayClass_softClass;
    uint64_t v15 = getBBSettingsGatewayClass_softClass;
    if (!getBBSettingsGatewayClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getBBSettingsGatewayClass_block_invoke;
      v11[3] = &unk_1E5C5D4D8;
      v11[4] = &v12;
      __getBBSettingsGatewayClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = v5;
    _Block_object_dispose(&v12, 8);
    uint64_t v7 = [[v6 alloc] initWithQueue:v2->_queue];
    gateway = v2->_gateway;
    v2->_gateway = (BBSettingsGateway *)v7;
  }
  return v2;
}

- (void)dealloc
{
  [(BBSettingsGateway *)self->_gateway invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PSNotificationSettingsController;
  [(PSNotificationSettingsController *)&v3 dealloc];
}

- (id)allSectionInfoIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(BBSettingsGateway *)self->_gateway allSectionInfo];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) sectionID];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)sectionInfoForIdentifier:(id)a3
{
  return (id)[(BBSettingsGateway *)self->_gateway sectionInfoForSectionID:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end