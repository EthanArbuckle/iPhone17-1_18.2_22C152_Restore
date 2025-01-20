@interface PDAppProtectionManager
- (PDAppProtectionManager)init;
- (void)_enforceHideCardsWhileLocked:(BOOL)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)updateHideCardsWhileLockedEnforcement;
@end

@implementation PDAppProtectionManager

- (PDAppProtectionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PDAppProtectionManager;
  v2 = [(PDAppProtectionManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[APApplication applicationWithBundleIdentifier:PKPassbookAppProtectionBundleIdentifier];
    application = v2->_application;
    v2->_application = (APApplication *)v3;

    v5 = +[APSubject subjectMonitorRegistry];
    uint64_t v6 = [v5 addMonitor:v2 subjectMask:1];
    subscription = v2->_subscription;
    v2->_subscription = (APSubjectMonitorSubscription *)v6;
  }
  return v2;
}

- (void)dealloc
{
  [(APSubjectMonitorSubscription *)self->_subscription invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PDAppProtectionManager;
  [(PDAppProtectionManager *)&v3 dealloc];
}

- (void)updateHideCardsWhileLockedEnforcement
{
  id v3 = [(APApplication *)self->_application isLocked];
  [(PDAppProtectionManager *)self _enforceHideCardsWhileLocked:v3];
}

- (void)_enforceHideCardsWhileLocked:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enforcing hide cards while locked policy", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [v6 MCSetBoolRestriction:MCFeatureCardsWhileLockedAllowed value:0];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unenforcing hide cards while locked policy", buf, 2u);
    }

    id v6 = 0;
  }
  v7 = +[MCProfileConnection sharedConnection];
  id v10 = 0;
  [v7 applyRestrictionDictionary:v6 clientType:PKServiceBundleIdentifier clientUUID:PKMCRestrictionClientUUIDAllowWhenLocked localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v10];
  id v8 = v10;

  if (v8)
  {
    objc_super v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error applying restriction %@", buf, 0xCu);
    }
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isEqual:self->_application])
        {
          id v10 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating hide cards enforcement due to subject change", v11, 2u);
          }

          [(PDAppProtectionManager *)self updateHideCardsWhileLockedEnforcement];
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end