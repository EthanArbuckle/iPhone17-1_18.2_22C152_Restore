@interface SBPrivacyPreflightController
- (BOOL)requiresPreflightForApplication:(id)a3;
- (NSString)description;
- (SBPrivacyPreflightController)init;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)preflightLaunchForApplication:(id)a3 sceneIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation SBPrivacyPreflightController

- (BOOL)requiresPreflightForApplication:(id)a3
{
  return [(PDCPreflightManager *)self->_privacyPreflightManager requiresPreflightForApplication:a3];
}

- (SBPrivacyPreflightController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBPrivacyPreflightController;
  v2 = [(SBPrivacyPreflightController *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93548]);
    uint64_t v4 = [v3 initWithTargetQueue:MEMORY[0x1E4F14428]];
    privacyPreflightManager = v2->_privacyPreflightManager;
    v2->_privacyPreflightManager = (PDCPreflightManager *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applicationPreflightControllers = v2->_applicationPreflightControllers;
    v2->_applicationPreflightControllers = v6;
  }
  return v2;
}

- (void)preflightLaunchForApplication:(id)a3 sceneIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v17;
  id v12 = v10;
  if (v17)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBPrivacyPreflightController.m", 41, @"Invalid parameter not satisfying: %@", @"sceneIdentifier" object file lineNumber description];

    id v11 = v17;
    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SBPrivacyPreflightController.m", 40, @"Invalid parameter not satisfying: %@", @"application" object file lineNumber description];

  id v11 = 0;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_11:
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBPrivacyPreflightController.m", 42, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

  id v11 = v17;
LABEL_4:
  v13 = [(NSMutableDictionary *)self->_applicationPreflightControllers objectForKey:v11];
  if (!v13)
  {
    v13 = [[SBApplicationPrivacyPreflightController alloc] initWithPreflightManager:self->_privacyPreflightManager applicationIdentity:v17];
    [(NSMutableDictionary *)self->_applicationPreflightControllers setObject:v13 forKey:v17];
  }
  [(SBApplicationPrivacyPreflightController *)v13 addPendingCompletion:v12 forSceneIdentifier:v9];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3 = (id)[a3 appendObject:self->_applicationPreflightControllers withName:@"applicationPreflightControllers"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationPreflightControllers, 0);
  objc_storeStrong((id *)&self->_privacyPreflightManager, 0);
}

@end