@interface MCInstaller
+ (id)_installationFailureErrorWithUnderlyingError:(id)a3;
+ (id)considerProfilesInstalledDuringBuddyForManagement;
+ (id)deviceIsSupervisedError;
+ (id)deviceNotSupervisedError;
+ (id)notInstalledByMDMError;
+ (id)notSupportedUnderMultiUserModeError;
+ (id)sharedInstaller;
+ (void)_enumerateProfilesWithCriteria:(id)a3 filterFlags:(int)a4 block:(id)a5;
+ (void)_setPathsSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4;
+ (void)isInteractiveProfileInstallationAllowedBySDP:(id)a3 completion:(id)a4;
- (BOOL)_allowsPasswordPoliciesFromProfile:(id)a3 outError:(id *)a4;
- (BOOL)_overrideProfileValidation;
- (BOOL)_promptUserForComplianceWithRestrictions:(id)a3 handler:(id)a4 interactionClient:(id)a5 outPasscode:(id *)a6 outError:(id *)a7;
- (BOOL)_promptUserForMAIDSignIn:(id)a3 personaID:(id)a4 handler:(id)a5 interactionClient:(id)a6 outError:(id *)a7;
- (BOOL)_showWarnings:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (BOOL)_showWarningsForProfile:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (BOOL)_showWarningsForUpdatingProfile:(id)a3 originalProfile:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)deviceSupervisionRequiredForPayload:(id)a3;
- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6;
- (BOOL)isCertificateReference:(id)a3 aliasedInDependencyManager:(id)a4;
- (BOOL)sendPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6;
- (FLFollowUpController)followUpController;
- (MCInstaller)init;
- (NSMutableDictionary)setAsideAccountIdentifiersByPayloadClass;
- (NSMutableDictionary)setAsideDictionariesByPayloadClass;
- (NSTimer)purgatoryTimer;
- (id)_assumeOwnershipProfileHandler:(id)a3 options:(id)a4 source:(id)a5 outError:(id *)a6;
- (id)_badProvisioningProfileError;
- (id)_deviceLockedError;
- (id)_errorUnacceptablePayload:(id)a3;
- (id)_guardAgainstNoMDMPayloadWithNewProfile:(id)a3 oldProfile:(id)a4;
- (id)_installProfileHandler:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7;
- (id)_installationHaltedTopLevelError;
- (id)_installedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4;
- (id)_invalidInputError;
- (id)_malformedPayloadErrorInternal:(BOOL)a3;
- (id)_malformedPayloadErrorWithUnderlyingError:(id)a3;
- (id)_managingProfileIdentifierForProfileIdentifier:(id)a3;
- (id)_preflightProfileForInstallationOnHomePod:(id)a3;
- (id)_preflightProfileForInstallationOnWatch:(id)a3;
- (id)_profileDrivenEnrollmentBlocked;
- (id)_profileDrivenUserEnrollmentNotSupportedError;
- (id)_profileNotEligibleErrorWithProfile:(id)a3;
- (id)_reallyRemoveInstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6;
- (id)_reallyRemoveProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 profileInstalled:(BOOL)a5 targetDeviceType:(unint64_t)a6 options:(id)a7 source:(id)a8;
- (id)_targetDeviceArchivedError;
- (id)_targetDeviceErrorWithUnderlyingError:(id)a3;
- (id)_targetDeviceMismatchError;
- (id)_targetDevicePreflightFailedError;
- (id)_targetDeviceUnavailableError;
- (id)_uiProfileInstallationDisabledTopLevelErrorWithCause:(id)a3;
- (id)_userCancelledErrorWithFriendlyName:(id)a3;
- (id)_validateMDMReplacementNewProfile:(id)a3 oldProfile:(id)a4 client:(id)a5;
- (id)_validateNewMDMProfile:(id)a3 installationOption:(id)a4;
- (id)_watchInformationOutIsCellularSupported:(BOOL *)a3;
- (id)existingProfileContainingPayloadClass:(Class)a3 excludingProfileIdentifier:(id)a4;
- (id)existingProfileContainingPayloadClass:(Class)a3 inProfilesWithFilterFlags:(int)a4 excludingProfileIdentifier:(id)a5;
- (id)identifiersOfInstalledProfilesWithFilterFlags:(int)a3;
- (id)installProfileData:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7;
- (id)pathToInstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4;
- (id)pathToInstalledProfileByUUID:(id)a3;
- (id)pathToUninstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5;
- (id)peekPurgatoryProfileDataForTargetDevice:(unint64_t)a3;
- (id)popProfileDataAtHeadOfInstallationQueue;
- (id)removeProvisioningProfileUUID:(id)a3 sender:(id)a4;
- (id)setAsideAccountIdentifiersForPayloadClass:(Class)a3;
- (id)setAsideDictionariesForPayloadHandlerClass:(Class)a3;
- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 installForSystem:(BOOL)a5 source:(id)a6 outError:(id *)a7;
- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 outError:(id *)a6;
- (id)verifiedMDMProfileIdentifierWithCleanUp;
- (int64_t)_targetValidationStatusForProfile:(id)a3;
- (void)_checkinWithMdmd;
- (void)_cleanUpAfterRemovingProfileWithIdentifier:(id)a3 installedForUser:(BOOL)a4 profileHandler:(id)a5 oldRestrictions:(id)a6;
- (void)_continueQueueingProfile:(id)a3 profileData:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6;
- (void)_postPurgatoryFollowUpForProfileData:(id)a3 targetDevice:(unint64_t)a4;
- (void)_promptUserForRestoreWithAccountID:(id)a3 personaID:(id)a4 interactionClient:(id)a5;
- (void)_purgatoryWorkerQueue_didPurgePurgatory:(BOOL)a3;
- (void)_queueProfileData:(id)a3 profile:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6;
- (void)_removeOrphanedCertificateDependencyManager:(id)a3 persistentID:(id)a4 persona:(id)a5;
- (void)_removeOrphanedResourcesOptions:(id)a3 includingAccounts:(BOOL)a4;
- (void)_replacePurgatoryProfilesForTargetDevice:(unint64_t)a3;
- (void)_sendMDMEnrollmentEventWithInstallationOptions:(id)a3;
- (void)_updateCDPWithNewPasscode:(id)a3 passcodeType:(int)a4;
- (void)addSetAsideAccountIdentifier:(id)a3 forPayloadClass:(Class)a4;
- (void)addSetAsideDictionary:(id)a3 forPayloadHandlerClass:(Class)a4;
- (void)purgePurgatoryProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4;
- (void)purgePurgatoryProfilesForTargetDevice:(unint64_t)a3;
- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 completion:(id)a5;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)removeAllProfilesFromInstallationQueue;
- (void)removeManagedProfilesIfNecessary;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5;
- (void)setFollowUpController:(id)a3;
- (void)setPurgatoryTimer:(id)a3;
- (void)setSetAsideAccountIdentifiersByPayloadClass:(id)a3;
- (void)setSetAsideDictionariesByPayloadClass:(id)a3;
@end

@implementation MCInstaller

+ (id)sharedInstaller
{
  if (qword_100105990 != -1) {
    dispatch_once(&qword_100105990, &stru_1000EBB90);
  }
  v2 = (void *)qword_100105988;

  return v2;
}

- (MCInstaller)init
{
  v10.receiver = self;
  v10.super_class = (Class)MCInstaller;
  v2 = [(MCInstaller *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedProfiles = v2->_queuedProfiles;
    v2->_queuedProfiles = v3;

    dispatch_queue_t v5 = dispatch_queue_create("MCInstaller Purgatory worker queue", 0);
    purgatoryWorkerQueue = v2->_purgatoryWorkerQueue;
    v2->_purgatoryWorkerQueue = (OS_dispatch_queue *)v5;

    v7 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.managedconfiguration.profiled"];
    followUpController = v2->_followUpController;
    v2->_followUpController = v7;
  }
  return v2;
}

- (id)identifiersOfInstalledProfilesWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[MCManifest sharedManifest];
  dispatch_queue_t v5 = [v4 identifiersOfProfilesWithFilterFlags:v3];

  return v5;
}

- (id)pathToInstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v5 = a3;
  v6 = +[MCManifest sharedManifest];
  v7 = [v6 allInstalledProfileIdentifiers];

  if ([v7 containsObject:v5])
  {
    if (a4 == 2) {
      sub_10004579C();
    }
    else {
    v9 = sub_1000457EC();
    }
    objc_super v10 = [v5 MCHashedFilenameWithExtension:@"stub"];
    v8 = [v9 stringByAppendingPathComponent:v10];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pathToUninstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5
{
  id v6 = a3;
  v7 = +[MCHoldingTankManifest sharedManifest];
  v8 = [v7 uninstalledProfileIdentifiersForDevice:a5];

  if ([v8 containsObject:v6])
  {
    v9 = +[MCHoldingTankManifest sharedManifest];
    objc_super v10 = [v9 pathToHoldingTankProfileDataForIdentifier:v6 targetDevice:a5 createDirectory:0];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)pathToInstalledProfileByUUID:(id)a3
{
  id v25 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v3 = +[MCManifest sharedManifest];
  v4 = [v3 allInstalledProfileIdentifiers];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    v8 = &os_unfair_lock_unlock_ptr;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v7) {
        objc_enumerationMutation(obj);
      }
      objc_super v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
      v12 = [v8[397] sharedManifest];
      v13 = [v12 allInstalledUserProfileIdentifiers];
      unsigned int v14 = [v13 containsObject:v10];

      if (v14) {
        sub_10004579C();
      }
      else {
      v15 = sub_1000457EC();
      }
      v16 = [v10 MCHashedFilenameWithExtension:@"stub"];
      v17 = [v15 stringByAppendingPathComponent:v16];

      v18 = +[NSData dataWithContentsOfFile:v17];
      uint64_t v27 = 0;
      v19 = +[MCProfile profileWithData:v18 outError:&v27];
      v20 = v19;
      id v21 = 0;
      if (!v27)
      {
        v22 = [v19 UUID];
        unsigned int v23 = [v22 isEqualToString:v25];

        if (v23) {
          id v21 = v17;
        }
        else {
          id v21 = 0;
        }
        v8 = &os_unfair_lock_unlock_ptr;
      }

      if (v21) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    id v21 = 0;
  }

  return v21;
}

- (id)popProfileDataAtHeadOfInstallationQueue
{
  if ([(NSMutableArray *)self->_queuedProfiles count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_queuedProfiles objectAtIndex:0];
    [(NSMutableArray *)self->_queuedProfiles removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_badProvisioningProfileError
{
  uint64_t v2 = MCProvisioningProfileErrorDomain;
  uint64_t v3 = MCErrorArray();
  v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 25000, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v47 = 0;
  objc_super v10 = +[MCProfile profileWithData:v8 fileName:a4 allowEmptyPayload:0 outError:&v47];
  id v11 = v47;
  if (!v11)
  {
    if (![v10 isStub]) {
      goto LABEL_32;
    }
    v16 = _MCLogObjects[9];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Stub profile cannot be queued for installation", buf, 2u);
    }
    id v11 = [(MCInstaller *)self _malformedPayloadErrorInternal:1];
    if (!v11)
    {
LABEL_32:
      if ([v10 targetDeviceType])
      {
        v36 = _NSConcreteStackBlock;
        uint64_t v37 = 3221225472;
        v38 = sub_100046234;
        v39 = &unk_1000EBBE0;
        v40 = self;
        id v17 = v10;
        id v41 = v17;
        id v18 = v9;
        id v42 = v18;
        v19 = objc_retainBlock(&v36);
        switch(-[MCInstaller _targetValidationStatusForProfile:](self, "_targetValidationStatusForProfile:", v17, v36, v37, v38, v39, v40))
        {
          case 0:
            os_log_t v20 = _MCLogObjects[9];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = v20;
              v22 = +[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", [v17 targetDeviceType]);
              *(_DWORD *)buf = 138543362;
              v49 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Profile-defined target-device-type %{public}@ successfully validated", buf, 0xCu);
            }
            -[MCInstaller _queueProfileData:profile:forDevice:completion:](self, "_queueProfileData:profile:forDevice:completion:", v8, v17, [v17 targetDeviceType], v18);
            break;
          case 1:
            uint64_t v34 = [(MCInstaller *)self _targetDeviceMismatchError];
            goto LABEL_25;
          case 2:
            uint64_t v34 = [(MCInstaller *)self _targetDevicePreflightFailedError];
            goto LABEL_25;
          case 3:
            uint64_t v34 = [(MCInstaller *)self _targetDeviceUnavailableError];
            goto LABEL_25;
          case 4:
            uint64_t v34 = [(MCInstaller *)self _targetDeviceArchivedError];
LABEL_25:
            v35 = (void *)v34;
            ((void (*)(void ***, uint64_t))v19[2])(v19, v34);

            break;
          default:
            break;
        }

        long long v29 = v41;
      }
      else
      {
        id v23 = +[MCProfile thisDeviceType];
        if (v23 != (id)1)
        {
          id v30 = v23;
          os_log_t v31 = _MCLogObjects[9];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            v33 = [v10 identifier];
            *(_DWORD *)buf = 138543618;
            v49 = v33;
            __int16 v50 = 2050;
            id v51 = v30;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Profile '%{public}@' does not define a target device. Assuming %{public}lu...", buf, 0x16u);
          }
          [(MCInstaller *)self _queueProfileData:v8 profile:v10 forDevice:v30 completion:v9];
          goto LABEL_28;
        }
        v24 = [(MCInstaller *)self _preflightProfileForInstallationOnWatch:v10];

        id v25 = [(MCInstaller *)self _preflightProfileForInstallationOnHomePod:v10];

        os_log_t v26 = _MCLogObjects[9];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = v26;
          long long v28 = [v10 identifier];
          *(_DWORD *)buf = 138543362;
          v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Profile '%{public}@' does not define a target device. Asking user to resolve...", buf, 0xCu);
        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100046220;
        v43[3] = &unk_1000EBBB8;
        v43[4] = self;
        id v44 = v8;
        id v45 = v10;
        id v46 = v9;
        +[MCTargetDeviceResolver showResolutionPromptWithWatchOption:v24 == 0 homePodOption:v25 == 0 completionBlock:v43];

        long long v29 = v44;
      }

LABEL_28:
      id v11 = 0;
      goto LABEL_29;
    }
  }
  v12 = [(MCInstaller *)self _malformedPayloadErrorWithUnderlyingError:v11];
  os_log_t v13 = _MCLogObjects[9];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    unsigned int v14 = v13;
    v15 = [v12 MCVerboseDescription];
    *(_DWORD *)buf = 138543362;
    v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Profile cannot be queued for installation. Error: %{public}@", buf, 0xCu);
  }
  (*((void (**)(id, void *, void *, uint64_t))v9 + 2))(v9, v12, v10, 99);

LABEL_29:
}

- (int64_t)_targetValidationStatusForProfile:(id)a3
{
  id v4 = a3;
  int64_t v5 = 1;
  switch((unint64_t)[v4 targetDeviceType])
  {
    case 1uLL:
      if ((MCGestaltIsPhone() & 1) == 0)
      {
        int IsAppleTV = MCGestaltIsiPad();
        goto LABEL_17;
      }
      int64_t v5 = 0;
      break;
    case 2uLL:
      if ((MCGestaltIsPhone() & 1) == 0 && !MCGestaltIsWatch()) {
        goto LABEL_19;
      }
      id v6 = [(MCInstaller *)self _preflightProfileForInstallationOnWatch:v4];

      if (v6) {
        goto LABEL_13;
      }
      unint64_t v7 = +[MCTargetDeviceResolver watchAvailability];
      if (v7 >= 3) {
        int64_t v5 = 3;
      }
      else {
        int64_t v5 = qword_1000B9318[v7];
      }
      break;
    case 3uLL:
      if ((MCGestaltIsPhone() & 1) != 0 || (MCGestaltIsiPad() & 1) != 0 || MCGestaltIsHomePod())
      {
        id v8 = [(MCInstaller *)self _preflightProfileForInstallationOnHomePod:v4];

        if (v8)
        {
LABEL_13:
          int64_t v5 = 2;
        }
        else if (+[MCTargetDeviceResolver isHomePodAvailable])
        {
          int64_t v5 = 0;
        }
        else
        {
          int64_t v5 = 3;
        }
      }
      else
      {
LABEL_19:
        int64_t v5 = 1;
      }
      break;
    case 4uLL:
      int IsAppleTV = MCGestaltIsAppleTV();
      goto LABEL_17;
    case 6uLL:
      int IsAppleTV = MCGestaltIsVisionDevice();
LABEL_17:
      int64_t v5 = IsAppleTV ^ 1u;
      break;
    default:
      break;
  }

  return v5;
}

+ (void)isInteractiveProfileInstallationAllowedBySDP:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  unint64_t v7 = +[MCPayload payloadsRequiringRatchetWithStolenDeviceProtection];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = v5;
  id v8 = [v5 payloads];
  id v9 = (char *)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    objc_super v10 = v9;
    unsigned __int8 v11 = 0;
    char v12 = 0;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        if ([v7 containsObject:objc_opt_class()])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v11 |= isKindOfClass;
          v12 |= isKindOfClass ^ 1;
        }
      }
      objc_super v10 = (char *)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    unsigned __int8 v11 = 0;
    char v12 = 0;
  }

  if (v12 & 1) != 0 || (v11) {
    +[DMCRatchet isAuthorizedForOperation:v11 & ~v12 & 1 completion:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)_queueProfileData:(id)a3 profile:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  char v12 = (void (**)(id, void, id, uint64_t))a6;
  if (a5 == 99)
  {
    os_log_t v13 = _MCLogObjects[9];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = v13;
      v15 = [v11 identifier];
      *(_DWORD *)buf = 138543362;
      id v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Profile %{public}@ cancelled queueing for installation", buf, 0xCu);
    }
    v12[2](v12, 0, v11, 99);
  }
  else
  {
    v16 = +[MCRestrictionManager sharedManager];
    unsigned int v17 = [v16 effectiveRestrictedBoolForSetting:MCFeatureUIConfigurationProfileInstallationAllowed];

    if (v17 != 2)
    {
      if (a5 == 6
        && (+[DMCFeatureFlags isVisionProfileEnrollEnabled](DMCFeatureFlags, "isVisionProfileEnrollEnabled") & 1) == 0&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& [v11 isMDMProfile])
      {
        os_log_t v27 = _MCLogObjects[9];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v28 = v27;
          long long v29 = [v11 identifier];
          id v30 = +[MCProfile stringForDeviceType:6];
          *(_DWORD *)buf = 138543618;
          id v42 = v29;
          __int16 v43 = 2114;
          id v44 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ because profile-driven MDM enrollment is blocked", buf, 0x16u);
        }
        os_log_t v31 = [(MCInstaller *)self _profileDrivenEnrollmentBlocked];
        ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v31, v11, 6);
      }
      else
      {
        if (![v11 isUserEnrollmentProfile])
        {
          if (a5 == 3)
          {
            [(MCInstaller *)self _continueQueueingProfile:v11 profileData:v10 forDevice:3 completion:v12];
          }
          else
          {
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100046BE0;
            v36[3] = &unk_1000EBC08;
            v39 = v12;
            v36[4] = self;
            id v37 = v11;
            unint64_t v40 = a5;
            id v38 = v10;
            +[MCInstaller isInteractiveProfileInstallationAllowedBySDP:v37 completion:v36];
          }
          goto LABEL_26;
        }
        os_log_t v32 = _MCLogObjects[9];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = v32;
          uint64_t v34 = [v11 identifier];
          v35 = +[MCProfile stringForDeviceType:a5];
          *(_DWORD *)buf = 138543618;
          id v42 = v34;
          __int16 v43 = 2114;
          id v44 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ because profile-driven user enrollment is not supported", buf, 0x16u);
        }
        os_log_t v31 = [(MCInstaller *)self _profileDrivenUserEnrollmentNotSupportedError];
        ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v31, v11, a5);
      }

      goto LABEL_26;
    }
    id v18 = MCErrorRestrictionCauseProfile;
    long long v19 = +[MCRestrictionManager sharedManager];
    unsigned int v20 = [v19 effectiveRestrictedBoolForSetting:MCFeatureLockdownModeAllowed];

    if (v20 == 1)
    {
      id v21 = MCErrorRestrictionCauseLockdownMode;

      id v18 = v21;
    }
    os_log_t v22 = _MCLogObjects[9];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = v22;
      v24 = [v11 identifier];
      id v25 = +[MCProfile stringForDeviceType:a5];
      *(_DWORD *)buf = 138543618;
      id v42 = v24;
      __int16 v43 = 2114;
      id v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ because UI profile installation is restricted", buf, 0x16u);
    }
    os_log_t v26 = [(MCInstaller *)self _uiProfileInstallationDisabledTopLevelErrorWithCause:v18];
    ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v26, v11, a5);
  }
LABEL_26:
}

- (void)_continueQueueingProfile:(id)a3 profileData:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  char v12 = (void (**)(id, void, id, unint64_t))a6;
  os_log_t v13 = +[MCProfile stringForDeviceType:a5];
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:a5])
  {
    *(void *)id v37 = 0;
    *(void *)&v37[8] = v37;
    *(void *)&v37[16] = 0x3032000000;
    id v38 = sub_100047068;
    v39 = sub_100047078;
    id v40 = 0;
    purgatoryWorkerQueue = self->_purgatoryWorkerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047080;
    block[3] = &unk_1000EBC30;
    block[4] = self;
    id v27 = v11;
    id v15 = v10;
    long long v29 = v37;
    unint64_t v30 = a5;
    id v28 = v15;
    dispatch_sync((dispatch_queue_t)purgatoryWorkerQueue, block);
    uint64_t v16 = *(void *)(*(void *)&v37[8] + 40);
    unsigned int v17 = _MCLogObjects[9];
    id v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        long long v19 = [v15 identifier];
        unsigned int v20 = [*(id *)(*(void *)&v37[8] + 40) MCVerboseDescription];
        *(_DWORD *)buf = 138543874;
        os_log_t v32 = v19;
        __int16 v33 = 2114;
        uint64_t v34 = v13;
        __int16 v35 = 2114;
        v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Profile %{public}@ failed queueing for %{public}@ with purgatory error: %{public}@", buf, 0x20u);
      }
      v12[2](v12, *(void *)(*(void *)&v37[8] + 40), v15, a5);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v15 identifier];
        *(_DWORD *)buf = 138543618;
        os_log_t v32 = v24;
        __int16 v33 = 2114;
        uint64_t v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Profile %{public}@ succesfully queued in holding tank for %{public}@", buf, 0x16u);
      }
      id v25 = [(MCInstaller *)self _installationHaltedTopLevelError];
      ((void (**)(id, void *, id, unint64_t))v12)[2](v12, v25, v15, a5);
    }
    _Block_object_dispose(v37, 8);
  }
  else
  {
    [(NSMutableArray *)self->_queuedProfiles addObject:v11];
    os_log_t v21 = _MCLogObjects[9];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v22 = v21;
      id v23 = [v10 identifier];
      *(_DWORD *)id v37 = 138543618;
      *(void *)&v37[4] = v23;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Profile %{public}@ successfully queued for Settings jump for %{public}@", v37, 0x16u);
    }
    v12[2](v12, 0, v10, a5);
  }
}

- (id)_malformedPayloadErrorInternal:(BOOL)a3
{
  uint64_t v3 = (uint64_t *)&MCProfileErrorDomain;
  if (!a3) {
    uint64_t v3 = (uint64_t *)&MCInstallationErrorDomain;
  }
  uint64_t v4 = *v3;
  if (a3) {
    uint64_t v5 = 1000;
  }
  else {
    uint64_t v5 = 4000;
  }
  id v6 = MCErrorArray();
  unint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, v5, v6, MCErrorTypeFatal, 0);

  return v7;
}

- (id)_malformedPayloadErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 4000, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

- (id)_targetDeviceErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 4035, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

- (id)_targetDeviceUnavailableError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1012, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_targetDeviceArchivedError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1014, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_targetDevicePreflightFailedError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1011, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_targetDeviceMismatchError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 1015, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_uiProfileInstallationDisabledTopLevelErrorWithCause:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MCInstallationErrorDomain;
  uint64_t v5 = MCErrorArray();
  uint64_t v6 = MCErrorTypeFatal;
  if (v3)
  {
    uint64_t v10 = MCErrorRestrictionCauseKey;
    id v11 = v3;
    unint64_t v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1, 0);
    id v8 = +[NSError MCErrorWithDomain:v4 code:4037 descriptionArray:v5 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:v6 extraUserInfo:v7];
  }
  else
  {
    id v8 = +[NSError MCErrorWithDomain:v4 code:4037 descriptionArray:v5 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:MCErrorTypeFatal extraUserInfo:0];
  }

  return v8;
}

- (id)_installationHaltedTopLevelError
{
  uint64_t v2 = MCInstallationErrorDomain;
  id v3 = MCErrorArray();
  uint64_t v4 = MCProfileErrorDomain;
  uint64_t v5 = MCErrorArray();
  uint64_t v6 = MCErrorTypeFatal;
  unint64_t v7 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 1013, v5, MCErrorTypeFatal, 0);
  id v8 = +[NSError MCErrorWithDomain:v2 code:4036 descriptionArray:v3 underlyingError:v7 errorType:v6];

  return v8;
}

- (id)_invalidInputError
{
  uint64_t v2 = MCInstallationErrorDomain;
  id v3 = MCErrorArray();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4006, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_userCancelledErrorWithFriendlyName:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  uint64_t v4 = MCErrorArray();
  uint64_t v5 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4004, v4, MCErrorTypeFatal, a3, 0);

  return v5;
}

- (id)_profileDrivenEnrollmentBlocked
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArrayByDevice();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4054, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_profileDrivenUserEnrollmentNotSupportedError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArrayByDevice();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4055, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (BOOL)_promptUserForComplianceWithRestrictions:(id)a3 handler:(id)a4 interactionClient:(id)a5 outPasscode:(id *)a6 outError:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v15)
  {
    uint64_t v16 = +[MCPasscodeManagerWriter sharedManager];
    unsigned int v17 = [v16 currentPasscodeCompliesWithPolicyFromRestrictions:v13 outError:0];

    if (v17)
    {
      currentlyInstallingRestrictions = self->_currentlyInstallingRestrictions;
      self->_currentlyInstallingRestrictions = 0;

      id v19 = 0;
      goto LABEL_48;
    }
    id v71 = 0;
    unsigned __int8 v21 = [v15 requestCurrentPasscodeOutPasscode:&v71];
    id v22 = v71;
    if ((v21 & 1) == 0)
    {
      v53 = [v14 profile];
      v54 = [v53 friendlyName];
      id v19 = [(MCInstaller *)self _userCancelledErrorWithFriendlyName:v54];

LABEL_42:
LABEL_43:

      v57 = self->_currentlyInstallingRestrictions;
      self->_currentlyInstallingRestrictions = 0;

      if (v19)
      {
        if (a7) {
          *a7 = v19;
        }
        BOOL v20 = 0;
        if (a6) {
          *a6 = &stru_1000ECAD0;
        }
        goto LABEL_49;
      }
LABEL_48:
      BOOL v20 = 1;
LABEL_49:

      goto LABEL_50;
    }
    id v23 = +[MCPasscodeManagerWriter sharedManager];
    id v70 = 0;
    [v23 unlockDeviceWithPasscode:v22 outError:&v70];
    id v19 = v70;

    if (v19) {
      goto LABEL_43;
    }
    id v64 = v22;
    v60 = a7;
    v61 = a6;
    v62 = v14;
    objc_storeStrong((id *)&self->_currentlyInstallingRestrictions, a3);
    v63 = +[MCPasscodeManagerWriter sharedManager];
    v24 = +[MCRestrictionManagerWriter sharedManager];
    id v25 = [v24 effectiveValueForSetting:MCFeaturePasscodeKeyboardComplexity];
    unsigned int v26 = [v25 intValue];

    signed int v69 = 0;
    unsigned int v27 = +[MCPasscodeManagerWriter unlockScreenTypeForRestrictions:v13 outSimplePasscodeType:&v69];
    if (v27 <= v26) {
      unsigned int v28 = v26;
    }
    else {
      unsigned int v28 = v27;
    }
    long long v29 = +[MCRestrictionManagerWriter sharedManager];
    unint64_t v30 = [v29 effectiveValueForSetting:MCFeatureSimplePasscodeComplexity];
    signed int v31 = [v30 intValue];

    signed int v32 = v69;
    if (v69 < v31)
    {
      signed int v69 = v31;
      signed int v32 = v31;
    }
    if (v32) {
      int v33 = 3;
    }
    else {
      int v33 = 4;
    }
    if (v32 == 1) {
      unsigned int v34 = 7;
    }
    else {
      unsigned int v34 = v33;
    }
    if (v28) {
      unsigned int v34 = 3;
    }
    v75[0] = @"0";
    if (v28 == 1) {
      uint64_t v35 = 5;
    }
    else {
      uint64_t v35 = v34;
    }
    v74[0] = kMCIDUUIDKey;
    v74[1] = kMCIDTitleKey;
    v65 = MCLocalizedString();
    v75[1] = v65;
    v74[2] = kMCIDDescriptionKey;
    v36 = MCLocalizedString();
    v75[2] = v36;
    v74[3] = kMCIDRetypeDescriptionKey;
    id v37 = MCLocalizedString();
    v75[3] = v37;
    v74[4] = kMCIDMismatchDescriptionKey;
    id v38 = MCLocalizedString();
    v75[4] = v38;
    v74[5] = kMCIDFinePrintKey;
    v39 = +[MCPasscodeManagerWriter localizedDescriptionOfPasscodePolicyFromRestrictions:v13];
    v75[5] = v39;
    v74[6] = kMCIDFieldTypeKey;
    id v40 = +[NSNumber numberWithUnsignedInt:v35];
    v74[7] = kMCIDFlagsKey;
    v75[6] = v40;
    v75[7] = &off_1000F5218;
    id v41 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:8];
    id v42 = [v41 mutableCopy];

    v59 = v42;
    id v72 = v42;
    __int16 v43 = +[NSArray arrayWithObjects:&v72 count:1];
    v73 = v43;
    v66 = +[NSArray arrayWithObjects:&v73 count:1];

    id v44 = 0;
    uint64_t v45 = kMCIDResponseKey;
    while (1)
    {
      id v68 = 0;
      unsigned int v46 = [v15 requestUserInput:v66 delegate:self outResult:&v68];
      id v47 = v68;
      v48 = v47;
      if (!v46 || !v47)
      {
        v49 = [v62 profile];
        v55 = [v49 friendlyName];
        id v19 = [(MCInstaller *)self _userCancelledErrorWithFriendlyName:v55];

        goto LABEL_34;
      }
      if (![v47 count])
      {
        id v19 = [(MCInstaller *)self _invalidInputError];
        goto LABEL_35;
      }
      v49 = [v48 objectAtIndex:0];
      if (![v49 count]) {
        break;
      }
      __int16 v50 = [v48 objectAtIndex:0];
      id v51 = [v50 objectAtIndex:0];
      v52 = [v51 objectForKey:v45];

      id v44 = v52;
      if (+[MCPasscodeManagerWriter passcode:v52 compliesWithPolicyFromRestrictions:v13 checkHistory:1 outError:0])goto LABEL_36; {
    }
      }
    id v19 = [(MCInstaller *)self _invalidInputError];
LABEL_34:

LABEL_35:
    v52 = v44;
    if (v19) {
      goto LABEL_41;
    }
LABEL_36:
    id v67 = 0;
    [v63 changePasscodeFrom:v64 to:v52 skipRecovery:0 senderBundleID:@"com.apple.managedconfiguration.profiled.MCInstaller" outError:&v67];
    id v56 = v67;
    if (v56)
    {
      id v19 = v56;
    }
    else
    {
      [(MCInstaller *)self _updateCDPWithNewPasscode:v52 passcodeType:v69];
      if (v61)
      {
        id v44 = v52;
        id v19 = 0;
        id *v61 = v44;
        goto LABEL_41;
      }
      id v19 = 0;
    }
    id v44 = v52;
LABEL_41:

    a6 = v61;
    id v14 = v62;
    a7 = v60;
    v53 = v63;
    id v22 = v64;
    goto LABEL_42;
  }
  BOOL v20 = 1;
LABEL_50:

  return v20;
}

- (void)_updateCDPWithNewPasscode:(id)a3 passcodeType:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)CDPContext);
  [v6 setType:6];
  if (a4 == -1) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  id v8 = [objc_alloc((Class)CDPStateController) initWithContext:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100048154;
  v9[3] = &unk_1000EBC50;
  v9[4] = v7;
  [v8 localSecretChangedTo:v5 secretType:v7 completion:v9];
}

- (BOOL)_promptUserForMAIDSignIn:(id)a3 personaID:(id)a4 handler:(id)a5 interactionClient:(id)a6 outError:(id *)a7
{
  id v11 = a5;
  char v14 = 0;
  unsigned int v12 = [a6 requestMAIDSignIn:a3 personaID:a4 outError:a7 isCancelled:&v14];
  if (a7 && v14)
  {
    *a7 = [v11 userCancelledError];
  }
  if (a7 && v12 != 1 && !*a7)
  {
    *a7 = +[NSError MCErrorWithDomain:MCInstallationErrorDomain code:4038 descriptionArray:0 errorType:MCErrorTypeFatal];
  }

  return v12;
}

- (void)_promptUserForRestoreWithAccountID:(id)a3 personaID:(id)a4 interactionClient:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _MCLogObjects[9];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting managed restore...", v11, 2u);
  }
  [v9 requestManagedRestoreWithManagedAppleID:v7 personaID:v8];
}

- (id)_validateNewMDMProfile:(id)a3 installationOption:(id)a4
{
  uint64_t v5 = kMCInstallProfileOptionInstallationSource;
  id v6 = a3;
  id v7 = [a4 objectForKeyedSubscript:v5];
  id v8 = [v6 payloadsWithClass:objc_opt_class()];

  id v9 = [v8 firstObject];

  uint64_t v10 = [v9 assignedManagedAppleID];
  if (v10
    && ([v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenUserEnrollment] & 1) == 0)
  {
    unsigned __int8 v15 = [v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenDeviceEnrollment];

    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v11 = [v9 enrollmentMode];
  if ([v11 isEqualToString:kMDMEnrollmentModeBYOD]
    && ([v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenUserEnrollment] & 1) == 0)
  {

LABEL_13:
    uint64_t v16 = MCInstallationErrorDomain;
    id v11 = [v9 friendlyName];
    unsigned int v12 = MCErrorArray();
    char v14 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v16, 4022, v12, MCErrorTypeFatal, v11, 0);
    goto LABEL_14;
  }
  unsigned int v12 = [v9 enrollmentMode];
  if ([v12 isEqualToString:kMDMEnrollmentModeADDE])
  {
    unsigned __int8 v13 = [v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenDeviceEnrollment];

    if (v13)
    {
      char v14 = 0;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  char v14 = 0;
LABEL_14:

LABEL_15:

  return v14;
}

- (id)_validateMDMReplacementNewProfile:(id)a3 oldProfile:(id)a4 client:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 payloadsWithClass:objc_opt_class()];

  uint64_t v10 = [v9 firstObject];

  id v11 = [v8 payloadsWithClass:objc_opt_class()];

  unsigned int v12 = [v11 firstObject];

  unsigned __int8 v13 = objc_opt_new();
  uint64_t v14 = [v12 managedAppleIDName];
  if (!v14) {
    goto LABEL_3;
  }
  unsigned __int8 v15 = (void *)v14;
  uint64_t v5 = [v10 managedAppleIDName];
  uint64_t v16 = [v5 lowercaseString];
  unsigned int v17 = [v12 managedAppleIDName];
  id v18 = [v17 lowercaseString];
  unsigned __int8 v19 = [v16 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
    os_log_t v21 = _MCLogObjects[9];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = v21;
      uint64_t v5 = [v10 managedAppleIDName];
      id v23 = [v12 managedAppleIDName];
      *(_DWORD *)buf = 138543618;
      *(void *)v88 = v5;
      *(_WORD *)&v88[8] = 2114;
      v89 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "appleID doesn't match! Old managedAppleIDName:%{public}@, new managedAppleIDName: %{public}@", buf, 0x16u);
    }
    [v13 addObject:kMDMManagedAppleIDKey];
    int v20 = 1;
  }
  else
  {
LABEL_3:
    int v20 = 0;
  }
  v24 = [v10 enrollmentMode];
  if (!v24)
  {
    uint64_t v5 = [v12 enrollmentMode];
    if (!v5) {
      goto LABEL_11;
    }
  }
  id v25 = [v10 enrollmentMode];
  unsigned int v26 = [v12 enrollmentMode];
  unsigned __int8 v27 = [v25 isEqualToString:v26];

  if (v24)
  {

    if (v27)
    {
LABEL_11:
      int v28 = 0;
      goto LABEL_16;
    }
  }
  else
  {

    if (v27) {
      goto LABEL_11;
    }
  }
  os_log_t v29 = _MCLogObjects[9];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    unint64_t v30 = v29;
    signed int v31 = [v10 enrollmentMode];
    signed int v32 = [v12 enrollmentMode];
    *(_DWORD *)buf = 138543618;
    *(void *)v88 = v31;
    *(_WORD *)&v88[8] = 2114;
    v89 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "enrollmentMode doesn't match! Old enrollmentMode:%{public}@, new enrollmentMode: %{public}@", buf, 0x16u);
  }
  [v13 addObject:kMDMEnrollmentModeKey];
  int v28 = 1;
LABEL_16:
  uint64_t v33 = [v12 requiredAppIDForMDM];
  if (!v33) {
    goto LABEL_18;
  }
  unsigned int v34 = (void *)v33;
  uint64_t v35 = [v10 requiredAppIDForMDM];
  v36 = [v12 requiredAppIDForMDM];
  unsigned __int8 v37 = [v35 isEqualToNumber:v36];

  if ((v37 & 1) == 0)
  {
    os_log_t v38 = _MCLogObjects[9];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = v38;
      id v40 = [v10 requiredAppIDForMDM];
      id v41 = [v12 requiredAppIDForMDM];
      *(_DWORD *)buf = 138543618;
      *(void *)v88 = v40;
      *(_WORD *)&v88[8] = 2114;
      v89 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "requiredAppIDForMDM doesn't match! Old requiredAppIDForMDM:%{public}@, new requiredAppIDForMDM: %{public}@", buf, 0x16u);
    }
    [v13 addObject:kMDMRequiredAppIDForMDMKey];
    int v86 = 1;
  }
  else
  {
LABEL_18:
    int v86 = 0;
  }
  id v42 = [v10 topic];
  __int16 v43 = [v12 topic];
  unsigned __int8 v44 = [v42 isEqualToString:v43];

  uint64_t v45 = +[MCActivationUtilities sharedInstance];
  LODWORD(v43) = [v45 isHRNMode];

  if (v43 | 2) == 2 || (v44)
  {
    int v46 = 0;
  }
  else
  {
    os_log_t v60 = _MCLogObjects[9];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      v62 = [v10 topic];
      v63 = [v12 topic];
      *(_DWORD *)buf = 138543618;
      *(void *)v88 = v62;
      *(_WORD *)&v88[8] = 2114;
      v89 = v63;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "topic doesn't match! Old topic:%{public}@, new topic: %{public}@", buf, 0x16u);
    }
    [v13 addObject:kMDMTopicKey];
    int v46 = 1;
  }
  id v47 = [v10 serverURLString];
  v48 = [v12 serverURLString];
  unsigned int v49 = [v47 isEqualToString:v48];

  unsigned int v85 = v49;
  if ((v49 & 1) == 0)
  {
    os_log_t v50 = _MCLogObjects[9];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      id v51 = v50;
      v48 = [v10 serverURLString];
      v52 = [v12 serverURLString];
      *(_DWORD *)buf = 138543618;
      *(void *)v88 = v48;
      *(_WORD *)&v88[8] = 2114;
      v89 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "serverURLString doesn't match! Old serverURLString:%{public}@, new serverURLString: %{public}@", buf, 0x16u);
    }
    [v13 addObject:kMDMServerURLKey];
  }
  v53 = [v10 checkInURLString];
  if (v53 || ([v12 checkInURLString], (v48 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v84 = v46;
    int v54 = v28;
    v55 = v13;
    int v56 = v20;
    v57 = [v10 checkInURLString];
    v58 = [v12 checkInURLString];
    unsigned __int8 v59 = [v57 isEqualToString:v58];

    if (v53) {
    else
    }

    int v20 = v56;
    if (v59)
    {
      int v64 = 0;
      unsigned __int8 v13 = v55;
    }
    else
    {
      os_log_t v65 = _MCLogObjects[9];
      unsigned __int8 v13 = v55;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = v65;
        id v67 = [v10 checkInURLString];
        id v68 = [v12 checkInURLString];
        *(_DWORD *)buf = 138543618;
        *(void *)v88 = v67;
        *(_WORD *)&v88[8] = 2114;
        v89 = v68;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "checkInURLString doesn't match! Old checkInURLString:%{public}@, new checkInURLString: %{public}@", buf, 0x16u);
      }
      [v55 addObject:kMDMCheckInURLKey];
      int v64 = 1;
    }
    int v28 = v54;
    int v46 = v84;
  }
  else
  {
    int v64 = 0;
  }
  unsigned int v69 = [v10 supportUserChannel];
  unsigned int v70 = v69 ^ [v12 supportUserChannel];
  if (v70 == 1)
  {
    os_log_t v71 = _MCLogObjects[9];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      id v72 = v71;
      unsigned int v73 = [v10 supportUserChannel];
      unsigned int v74 = [v12 supportUserChannel];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v88 = v73;
      *(_WORD *)&v88[4] = 1024;
      *(_DWORD *)&v88[6] = v74;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "supportUserChannel doesn't match! Old supportUserChannel:%d, new supportUserChannel: %d", buf, 0xEu);
    }
    [v13 addObject:kMDMUserChannelCapability];
  }
  if ((v70 | v28 | v20 | v46 | v86 | v64 | v85 ^ 1))
  {
    v75 = [v13 componentsJoinedByString:@", "];
    uint64_t v76 = MCMDMErrorDomain;
    v77 = MCErrorArray();
    v78 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v76, 12012, v77, MCErrorTypeFatal, v75, 0);

LABEL_49:
    goto LABEL_53;
  }
  if (!a5)
  {
    unint64_t v79 = (unint64_t)[v10 accessRights];
    id v80 = (id)((unint64_t)[v12 accessRights] | v79);
    if (v80 != [v10 accessRights])
    {
      uint64_t v82 = MCMDMErrorDomain;
      v75 = MCErrorArray();
      v78 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v82, 12012, v75, MCErrorTypeFatal, 0);
      goto LABEL_49;
    }
  }
  v78 = 0;
LABEL_53:

  return v78;
}

- (id)_guardAgainstNoMDMPayloadWithNewProfile:(id)a3 oldProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [v5 isMDMProfile];
  }
  else {
    unsigned int v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ((v7 | [v6 isMDMProfile] ^ 1) & 1) == 0)
  {
    uint64_t v9 = MCInstallationErrorDomain;
    uint64_t v10 = [v6 friendlyName];
    id v11 = MCErrorArray();
    unsigned int v12 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 4015, v11, MCErrorTypeFatal, v10, 0);
    id v8 = [v12 MCCopyAsPrimaryError];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_deviceLockedError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4009, v3, MCErrorTypeFatal, 0);

  return v4;
}

+ (id)deviceNotSupervisedError
{
  uint64_t v2 = MCChaperoneErrorDomain;
  uint64_t v3 = MCErrorArray();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 29000, v3, MCErrorTypeFatal, 0);
  id v5 = [v4 MCCopyAsPrimaryError];

  return v5;
}

+ (id)deviceIsSupervisedError
{
  uint64_t v2 = MCChaperoneErrorDomain;
  uint64_t v3 = MCErrorArray();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 29004, v3, MCErrorTypeFatal, 0);
  id v5 = [v4 MCCopyAsPrimaryError];

  return v5;
}

+ (id)notInstalledByMDMError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4021, v3, MCErrorTypeFatal, 0);

  return v4;
}

+ (id)notSupportedUnderMultiUserModeError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray();
  uint64_t v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4047, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_installProfileHandler:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v298 = a5;
  id v300 = a6;
  v306 = +[MCRestrictionManagerWriter sharedManager];
  v297 = +[MCDependencyManager sharedManager];
  unsigned __int8 v13 = +[NSMutableDictionary dictionary];
  [(MCInstaller *)self setSetAsideAccountIdentifiersByPayloadClass:v13];

  uint64_t v14 = +[NSMutableDictionary dictionary];
  [(MCInstaller *)self setSetAsideDictionariesByPayloadClass:v14];

  unsigned __int8 v15 = [v11 profile];
  v304 = [v15 identifier];

  v296 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
  v294 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionAdditionalManagedProfileIdentifiers];
  uint64_t v16 = kMCInstallProfileOptionIsInstalledByMDM;
  unsigned int v17 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  unsigned __int8 v18 = [v17 BOOLValue];

  unsigned __int8 v19 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionsIsInstalledByDeclarativeManagement];
  unsigned int v20 = [v19 BOOLValue];

  os_log_t v21 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionFilterFlag];
  unsigned int v290 = [v21 intValue];

  id v22 = [v306 currentRestrictions];
  id v299 = [v22 MCDeepCopy];

  char v355 = 0;
  id v23 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType];
  unsigned int v291 = [v23 intValue];

  uint64_t v349 = 0;
  v350 = (id *)&v349;
  uint64_t v351 = 0x3032000000;
  v352 = sub_100047068;
  v353 = sub_100047078;
  id v354 = 0;
  uint64_t v24 = kMCInstallProfileOptionPersonaID;
  id v303 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionPersonaID];
  id v25 = _MCLogObjects[9];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Beginning profile installation...", buf, 2u);
  }

  unsigned int v26 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionAssumeOwnership];
  unsigned int v27 = [v26 BOOLValue];

  if (v27)
  {
    int v28 = _MCLogObjects[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Beginning profile assume ownership...", buf, 2u);
    }
    id v29 = [(MCInstaller *)self _assumeOwnershipProfileHandler:v11 options:v12 source:v300 outError:a7];
    id v305 = 0;
    id v301 = 0;
    v292 = 0;
    goto LABEL_115;
  }
  unint64_t v30 = [v306 systemProfileRestrictions];
  id v288 = [v30 MCMutableDeepCopy];

  signed int v31 = [v306 userProfileRestrictions];
  id v287 = [v31 MCMutableDeepCopy];

  signed int v32 = _MCLogObjects[5];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v304;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Beginning profile installation for %{public}@", buf, 0xCu);
  }

  uint64_t v33 = +[MCManifest sharedManifest];
  v289 = [v33 installedMDMProfile];

  unsigned int v34 = [v11 profile];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  uint64_t v35 = [v11 profile];
  unsigned int v36 = [v35 isMDMProfile];

  if (!v36)
  {
LABEL_14:
    BOOL v286 = 0;
    int v42 = 1;
    goto LABEL_19;
  }
  BOOL v286 = v289 != 0;
  unsigned __int8 v37 = [v11 profile];
  if (v289)
  {
    id v38 = +[MCManifest sharedManifest];
    v39 = [v38 installedMDMProfile];
    uint64_t v40 = [(MCInstaller *)self _validateMDMReplacementNewProfile:v37 oldProfile:v39 client:v298];
    id v41 = v350[5];
    v350[5] = (id)v40;
  }
  else
  {
    uint64_t v43 = [(MCInstaller *)self _validateNewMDMProfile:v37 installationOption:v12];
    id v38 = v350[5];
    v350[5] = (id)v43;
  }

  unsigned __int8 v44 = [v12 objectForKeyedSubscript:v16];
  unsigned __int8 v45 = [v44 BOOLValue];

  if ((v45 & 1) == 0) {
    [(MCInstaller *)self _checkinWithMdmd];
  }
  int v42 = 0;
LABEL_19:
  if (v350[5])
  {
    id v305 = 0;
    id v301 = 0;
LABEL_51:

    v292 = 0;
    BOOL v75 = 0;
    goto LABEL_52;
  }
  int v283 = v42;
  if (v291 == 2) {
    uint64_t v46 = 2;
  }
  else {
    uint64_t v46 = 1;
  }
  uint64_t v47 = [(MCInstaller *)self _installedProfileWithIdentifier:v304 installationType:v46];
  v285 = (void *)v47;
  if (v47)
  {
    v48 = [v11 profile];
    uint64_t v49 = [(MCInstaller *)self _guardAgainstNoMDMPayloadWithNewProfile:v48 oldProfile:v47];
    id v50 = v350[5];
    v350[5] = (id)v49;

    if (v350[5])
    {
      id v305 = 0;
LABEL_49:
      id v301 = 0;
      goto LABEL_50;
    }
    if (!v286)
    {
      uint64_t v53 = kMCDMManagedProfileToManagingProfileKey;
      int v54 = [v297 dependentsOfParent:v304 inDomain:kMCDMManagedProfileToManagingProfileKey];
      id v55 = [v54 count];

      if (v296 && !v55) {
        goto LABEL_35;
      }
      v146 = [v285 identifier];
      v147 = [v297 dependentsOfParent:v146 inDomain:v53];
      id v148 = [v147 count];

      if (!(v18 & 1 | (v148 == 0)))
      {
        v149 = [v11 profile];
        v150 = [v149 friendlyName];
        v151 = MCErrorArray();
        v152 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12013, v151, MCErrorTypeFatal, v150, 0);
        id v153 = [v152 MCCopyAsPrimaryError];
        id v154 = v350[5];
        v350[5] = v153;

        id v305 = 0;
        id v301 = 0;
        id v61 = v149;
        goto LABEL_44;
      }
      if (v20 && v148)
      {
LABEL_35:
        int v56 = [v11 profile];
        v57 = [v56 friendlyName];
        v58 = MCErrorArray();
        uint64_t v59 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12013, v58, MCErrorTypeFatal, v57, 0);
        id v60 = v350[5];
        v350[5] = (id)v59;

        id v305 = 0;
        id v301 = 0;
        id v61 = v56;
LABEL_44:

LABEL_50:
        goto LABEL_51;
      }
      if (!v296)
      {
        v172 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionIsOTAUpdate];
        unsigned __int8 v173 = [v172 BOOLValue];

        if ((v173 & 1) == 0)
        {
          v174 = [v11 profile];
          unsigned __int8 v175 = [v285 doesSigningAllowReplacementWithProfile:v174];

          if ((v175 & 1) == 0)
          {
            v176 = [v285 friendlyName];
            v177 = MCErrorArray();
            uint64_t v178 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4008, v177, MCErrorTypeFatal, v176, 0);
            id v179 = v350[5];
            v350[5] = (id)v178;

            id v180 = [v350[5] MCCopyAsPrimaryError];
            id v305 = 0;
            id v301 = 0;
            id v61 = v350[5];
            v350[5] = v180;
            goto LABEL_44;
          }
        }
      }
    }
    id v51 = _MCLogObjects[5];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v304;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” is replacing an existing profile having the same identifier.", buf, 0xCu);
    }

    id v305 = [v285 createHandler];
    [v305 setAsideWithInstaller:self];
    if ([v285 isInstalledForUser])
    {
      v52 = [v285 identifier];
      [v287 removeObjectForKey:v52];
    }
    else
    {
      v52 = [v285 identifier];
      [v288 removeObjectForKey:v52];
    }
  }
  else
  {
    id v305 = 0;
  }
  if (v291 == 2) {
    [v287 objectForKey:v304];
  }
  else {
  v62 = [v288 objectForKey:v304];
  }

  if (v62)
  {
    id v61 = [v11 profile];
    v63 = [v61 friendlyName];
    int v64 = MCErrorArray();
    os_log_t v65 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4002, v64, MCErrorTypeFatal, v63, 0);
    id v66 = [v65 MCCopyAsPrimaryError];
    id v67 = v350[5];
    v350[5] = v66;

LABEL_43:
    id v301 = 0;
    goto LABEL_44;
  }
  id v68 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionIsOTAUpdate];
  unsigned int v69 = [v68 BOOLValue];

  [v11 profile];
  if (v69) {
    unsigned int v70 = {;
  }
    os_log_t v71 = v350 + 5;
    id v348 = v350[5];
    [(MCInstaller *)self _showWarningsForUpdatingProfile:v70 originalProfile:v285 interactionClient:v298 outError:&v348];
    id v72 = v348;
  }
  else {
    unsigned int v70 = {;
  }
    os_log_t v71 = v350 + 5;
    id v347 = v350[5];
    [(MCInstaller *)self _showWarningsForProfile:v70 interactionClient:v298 outError:&v347];
    id v72 = v347;
  }
  id v73 = v72;
  unsigned int v74 = *v71;
  *os_log_t v71 = v73;

  if (v350[5]) {
    goto LABEL_49;
  }
  v144 = [v11 profile];
  v145 = v350 + 5;
  id obj = v350[5];
  v282 = [v144 restrictionsWithHeuristicsAppliedOutError:&obj];
  objc_storeStrong(v145, obj);

  if (v350[5]) {
    goto LABEL_119;
  }
  v155 = [v12 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively];
  unsigned int v156 = [v155 BOOLValue];

  if (v156)
  {
    v157 = +[MCRestrictionManager intersectedValuesForFeature:MCFeatureAutonomousSingleAppModePermittedAppIDs withRestrictionsDictionary:v282];
    if (v157)
    {
      v158 = MCErrorArray();
      uint64_t v159 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4020, v158, MCErrorTypeFatal, 0);
      id v160 = v350[5];
      v350[5] = (id)v159;
    }
  }
  id v61 = v282;
  if (v350[5]) {
    goto LABEL_43;
  }
  if ((v18 & 1) == 0)
  {
    if (qword_1001059A0 != -1) {
      dispatch_once(&qword_1001059A0, &stru_1000EBC70);
    }
    if (!os_variant_has_internal_ui()
      || (id v61 = v282,
          !CFPreferencesGetAppBooleanValue(@"AllowMDMOnlyPayloadsWithoutMDM", kMCNotBackedUpPreferencesDomain, 0)))
    {
      long long v344 = 0u;
      long long v345 = 0u;
      long long v342 = 0u;
      long long v343 = 0u;
      v161 = [v11 profile];
      id v302 = [v161 payloads];

      id v162 = [v302 countByEnumeratingWithState:&v342 objects:v361 count:16];
      if (v162)
      {
        uint64_t v163 = *(void *)v343;
        p_cache = &OBJC_METACLASS___MCPasscodeAnalytics.cache;
        uint64_t v280 = *(void *)v343;
        do
        {
          uint64_t v165 = 0;
          id v278 = v162;
          do
          {
            if (*(void *)v343 != v163) {
              objc_enumerationMutation(v302);
            }
            uint64_t v293 = v165;
            long long v338 = 0u;
            long long v339 = 0u;
            long long v340 = 0u;
            long long v341 = 0u;
            id v166 = p_cache[307];
            v167 = (char *)[v166 countByEnumeratingWithState:&v338 objects:v360 count:16];
            if (v167)
            {
              uint64_t v168 = *(void *)v339;
              while (2)
              {
                for (i = 0; i != v167; ++i)
                {
                  if (*(void *)v339 != v168) {
                    objc_enumerationMutation(v166);
                  }
                  if (objc_opt_isKindOfClass())
                  {
                    v170 = [v12 objectForKeyedSubscript:v24];
                    BOOL v171 = v170 == 0;

                    if (v171)
                    {
                      uint64_t v181 = +[MCInstaller notInstalledByMDMError];
                      id v182 = v350[5];
                      v350[5] = (id)v181;

                      goto LABEL_158;
                    }
                  }
                }
                v167 = (char *)[v166 countByEnumeratingWithState:&v338 objects:v360 count:16];
                if (v167) {
                  continue;
                }
                break;
              }
            }

            uint64_t v165 = v293 + 1;
            uint64_t v163 = v280;
            p_cache = (void **)(&OBJC_METACLASS___MCPasscodeAnalytics + 16);
          }
          while ((id)(v293 + 1) != v278);
          uint64_t v163 = v280;
          id v162 = [v302 countByEnumeratingWithState:&v342 objects:v361 count:16];
        }
        while (v162);
      }
LABEL_158:

      id v61 = v282;
    }
  }
  if (v350[5]) {
    goto LABEL_43;
  }
  v183 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v184 = [v183 isSupervised];

  if (v184)
  {
    v185 = [v11 profile];
    v186 = [v185 payloadsWithClass:objc_opt_class()];
    v187 = [v186 firstObject];

    if (v187 && [v187 isUserEnrollment])
    {
      uint64_t v188 = +[MCInstaller deviceIsSupervisedError];
LABEL_174:
      id v193 = v350[5];
      v350[5] = (id)v188;
    }
  }
  else
  {
    long long v336 = 0u;
    long long v337 = 0u;
    long long v334 = 0u;
    long long v335 = 0u;
    v189 = [v11 profile];
    v187 = [v189 payloads];

    id v190 = [v187 countByEnumeratingWithState:&v334 objects:v359 count:16];
    if (v190)
    {
      uint64_t v191 = *(void *)v335;
      while (2)
      {
        for (j = 0; j != v190; j = (char *)j + 1)
        {
          if (*(void *)v335 != v191) {
            objc_enumerationMutation(v187);
          }
          if ([(MCInstaller *)self deviceSupervisionRequiredForPayload:*(void *)(*((void *)&v334 + 1) + 8 * (void)j)])
          {
            uint64_t v188 = +[MCInstaller deviceNotSupervisedError];
            goto LABEL_174;
          }
        }
        id v190 = [v187 countByEnumeratingWithState:&v334 objects:v359 count:16];
        if (v190) {
          continue;
        }
        break;
      }
    }
  }

  if (v350[5]) {
    goto LABEL_119;
  }
  id v194 = v291 == 2 ? v287 : v288;
  [v194 setObject:v282 forKey:v304];
  id v195 = [v12 copy];
  v196 = [v11 profile];
  [v196 setInstallOptions:v195];

  v197 = v350 + 5;
  id v333 = v350[5];
  [v11 stageForInstallationWithInstaller:self interactionClient:v298 outError:&v333];
  objc_storeStrong(v197, v333);
  if (v350[5])
  {
LABEL_119:
    id v301 = 0;
LABEL_120:
    id v61 = v282;
    goto LABEL_44;
  }
  id v301 = v11;
  v198 = [v306 currentRestrictions];
  id v29 = [v306 defaultRestrictions];
  v199 = [v306 systemClientRestrictions];
  v200 = [v306 userClientRestrictions];
  v201 = v350 + 5;
  id v332 = v350[5];
  v281 = +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:v198 defaultRestrictions:v29 systemProfileRestrictions:v288 userProfileRestrictions:v287 systemClientRestrictions:v199 userClientRestrictions:v200 outRestrictionsChanged:0 outError:&v332];
  objc_storeStrong(v201, v332);

  if (v350[5])
  {

    goto LABEL_120;
  }
  v331 = &stru_1000ECAD0;
  v202 = v350 + 5;
  id v330 = v350[5];
  [(MCInstaller *)self _promptUserForComplianceWithRestrictions:v281 handler:v301 interactionClient:v298 outPasscode:&v331 outError:&v330];
  v279 = v331;
  objc_storeStrong(v202, v330);
  if (v350[5])
  {
    BOOL v75 = 0;
    v292 = 0;
    int v203 = 2;
    goto LABEL_281;
  }
  v204 = [v301 profile];
  v205 = [v204 payloadsWithClass:objc_opt_class()];
  v277 = [v205 firstObject];

  if (v277)
  {
    v206 = +[MCPasscodeManager sharedManager];
    if ([v206 isPasscodeSet])
    {
      BOOL v207 = [(__CFString *)v279 length] == 0;

      if (!v207)
      {
LABEL_189:
        if (!v286 && ([v277 accessRights] & 4) != 0)
        {
          if (MCKeybagHasMDMEscrowDataAndSecret())
          {
            id v208 = 0;
          }
          else
          {
            v328[1] = 0;
            char MDMEscrowWithPasscode = MCKeybagCreateMDMEscrowWithPasscode();
            id v208 = 0;
            if ((MDMEscrowWithPasscode & 1) == 0)
            {
              v272 = _MCLogObjects[2];
              if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v208;
                _os_log_impl((void *)&_mh_execute_header, v272, OS_LOG_TYPE_ERROR, "Unable to create unlock token: %{public}@", buf, 0xCu);
              }

              v275 = MCErrorArray();
              +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCInstallationErrorDomain, 4042, v275, v208, MCErrorTypeFatal, v304, 0);
              id v284 = (id)objc_claimAutoreleasedReturnValue();
              id v273 = [v284 MCCopyAsPrimaryError];
              id v274 = v350[5];
              v350[5] = v273;

              BOOL v75 = 0;
              v292 = 0;
              goto LABEL_277;
            }
          }
        }
        if (v279 && ([(__CFString *)v279 isEqualToString:&stru_1000ECAD0] & 1) == 0)
        {
          id v210 = [v12 mutableCopy];
          id v211 = +[NSString _newZStringWithString:v279];
          [v210 setObject:v211 forKeyedSubscript:kMDMPasscodeKey];

          id v212 = [v210 copy];
          id v12 = v212;
        }
        v213 = [v277 managedAppleID];
        id v214 = [v213 length];

        if (v214)
        {
          v215 = _MCLogObjects[5];
          if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEFAULT, "We are doing DS 1.0 user enrollment", buf, 2u);
          }
        }
        if (v286)
        {
          v216 = [v289 payloadsWithClass:objc_opt_class()];
          v217 = [v216 firstObject];

          [v277 setIsUserEnrollment:[v217 isUserEnrollment]];
LABEL_204:

LABEL_211:
          [v277 setPersonaID:v303];
          if (!v350[5])
          {
            v224 = +[ACAccountStore defaultStore];
            v225 = [v224 dmc_remoteManagementAccountForManagementProfileIdentifier:v304];

            id v29 = [v225 identifier];
            if (v29)
            {
              id v226 = [v12 mutableCopy];
              [v226 setObject:v29 forKeyedSubscript:kMDMRMAccountIDKey];
              id v227 = [v226 copy];

              id v12 = v227;
            }
          }
          if (([v277 isUserEnrollment] & 1) == 0
            && (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad") & 1) == 0&& +[DMCMultiUserModeUtilities deviceHasMultipleUsers])
          {
            uint64_t v228 = +[MCInstaller notSupportedUnderMultiUserModeError];
            id v229 = v350[5];
            v350[5] = (id)v228;
          }
          goto LABEL_219;
        }
        v218 = [v277 managedAppleID];
        id v219 = [v218 length];

        if (!v219) {
          goto LABEL_211;
        }
        v275 = +[DMCPersonaHelper enterprisePersonaIdentifier];
        if (!v275) {
          goto LABEL_224;
        }
        v220 = _MCLogObjects[5];
        if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v275;
          _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_ERROR, "Enterprise persona (%{public}@) exists without any MDM enrollment! Cleaning up anyway...", buf, 0xCu);
        }

        v328[0] = 0;
        +[DMCPersonaHelper removePersona:v275 error:v328];
        id v221 = v328[0];
        if (v221)
        {
          v222 = v350;
          id v223 = v221;
        }
        else
        {
LABEL_224:
          id v327 = 0;
          v233 = +[DMCPersonaHelper createEnterprisePersonaWithDevicePasscode:v279 error:&v327];
          id v29 = v327;

          if (v233)
          {
            +[DMCPersonaHelper trackDirtyPersona:v233];
            v234 = [v277 managedAppleID];
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v358 = 0;
            v320[0] = _NSConcreteStackBlock;
            v320[1] = 3221225472;
            v320[2] = sub_10004BF2C;
            v320[3] = &unk_1000EBC98;
            v325 = buf;
            v320[4] = self;
            id v235 = v234;
            id v321 = v235;
            id v322 = v233;
            id v236 = v301;
            id v323 = v236;
            id v324 = v298;
            v326 = &v349;
            id v303 = v322;
            v217 = +[DMCPersonaHelper performBlockUnderPersona:v322 block:v320];

            if (v350[5]) {
              id v237 = v350[5];
            }
            else {
              id v237 = v217;
            }
            objc_storeStrong(v350 + 5, v237);
            if (*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              v238 = +[ACAccountStore defaultStore];
              v239 = v350 + 5;
              id v319 = v350[5];
              v316[0] = _NSConcreteStackBlock;
              v316[1] = 3221225472;
              v316[2] = sub_10004BF9C;
              v316[3] = &unk_1000EBCC0;
              id v240 = v236;
              id v317 = v240;
              id v318 = v277;
              [v238 dmc_updateAppleAccountWithPersonaID:v303 error:&v319 updateBlock:v316];
              objc_storeStrong(v239, v319);

              id v241 = [objc_alloc((Class)NSConditionLock) initWithCondition:1];
              id v29 = +[DMCEnrollmentFlowController enrollmentFlowController];
              v242 = [v240 profile];
              uint64_t v243 = [v242 organization];
              v244 = (void *)v243;
              if (v243) {
                v245 = (void *)v243;
              }
              else {
                v245 = v235;
              }
              id v246 = v245;

              v313[0] = _NSConcreteStackBlock;
              v313[1] = 3221225472;
              v313[2] = sub_10004C068;
              v313[3] = &unk_1000EBCE8;
              v315 = &v349;
              id v247 = v241;
              id v314 = v247;
              [v29 updateMDMUserEnrollmentWithManagedAppleID:v235 profileIdentifier:v304 organizationName:v246 personaID:v303 completionHandler:v313];
              [v247 lockWhenCondition:0];
              [v247 unlock];
            }
            _Block_object_dispose(buf, 8);

            goto LABEL_204;
          }
          v271 = _MCLogObjects[5];
          if (os_log_type_enabled(v271, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v29;
            _os_log_impl((void *)&_mh_execute_header, v271, OS_LOG_TYPE_ERROR, "Failed to create enterprise persona with error: %{public}@", buf, 0xCu);
          }

          v222 = v350;
          id v223 = v29;
          id v303 = 0;
        }
        BOOL v75 = 0;
        v292 = 0;
        id v284 = v222[5];
        id v208 = v223;
        v222[5] = v223;
LABEL_277:
        int v203 = 2;
        goto LABEL_278;
      }
      v329 = v279;
      [v298 requestCurrentPasscodeOutPasscode:&v329];
      v206 = v279;
      v279 = v329;
    }

    goto LABEL_189;
  }
LABEL_219:
  if (!v350[5])
  {
    v292 = objc_alloc_init(MCKeybagUnlockAssertion);
    if (v303
      && (uint64_t v230 = kMDMPersonaKey,
          [v12 objectForKeyedSubscript:kMDMPersonaKey],
          v231 = objc_claimAutoreleasedReturnValue(),
          BOOL v232 = v231 == 0,
          v231,
          v232))
    {
      id v248 = [v12 mutableCopy];
      [v248 setObject:v303 forKeyedSubscript:v230];
      id v29 = [v248 copy];
    }
    else
    {
      id v29 = v12;
    }
    v249 = v350 + 5;
    id v312 = v350[5];
    [v301 installWithInstaller:self options:v29 interactionClient:v298 outError:&v312];
    objc_storeStrong(v249, v312);
    id v208 = [v29 mutableCopy];
    [v208 removeObjectForKey:kMDMPasscodeKey];
    id v12 = [v208 copy];

    id v250 = v350[5];
    BOOL v75 = v250 == 0;
    if (v250) {
      goto LABEL_240;
    }
    v251 = objc_opt_new();
    v252 = [v301 profile];
    [v251 addEventForProfile:v252 operation:@"install" source:v300];

    if (((v283 | v286) & 1) == 0) {
      [(MCInstaller *)self _sendMDMEnrollmentEventWithInstallationOptions:v12];
    }
    id v29 = [v301 profile];
    v253 = [v29 loggingID];
    v254 = v350 + 5;
    id v311 = v350[5];
    [v306 setSystemProfileRestrictions:v288 userProfileRestrictions:v287 sender:v253 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAppWhitelistSettingsChanged:&v355 outRecomputedNag:0 outError:&v311];
    objc_storeStrong(v254, v311);

    if (v350[5])
    {
      BOOL v75 = 1;
LABEL_240:
      int v203 = 2;
LABEL_279:

      goto LABEL_280;
    }
    v275 = +[MDMCloudConfiguration sharedConfiguration];
    if (![v275 isSupervised]) {
      goto LABEL_246;
    }
    if (![v275 isTeslaEnrolled]) {
      goto LABEL_246;
    }
    v255 = [v12 objectForKey:kMCInstallProfileOptionIsCloudProfile];
    unsigned int v256 = [v255 BOOLValue];

    if (!v256) {
      goto LABEL_246;
    }
    v257 = [v301 profile];
    unsigned int v258 = [v257 containsPayloadOfClass:objc_opt_class()];

    if (v258)
    {
      id v284 = +[MCInstaller considerProfilesInstalledDuringBuddyForManagement];
    }
    else
    {
LABEL_246:
      id v284 = 0;
    }
    v259 = [v306 currentRestrictions];
    [v301 didInstallOldGlobalRestrictions:v299 newGlobalRestrictions:v259];

    if ([v296 length] && (objc_msgSend(v296, "isEqualToString:", v304) & 1) == 0) {
      [v297 addDependent:v304 ofParent:v296 inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey toSystem:v291 != 2 user:v291 == 2];
    }
    if ([v294 count])
    {
      long long v309 = 0u;
      long long v310 = 0u;
      long long v307 = 0u;
      long long v308 = 0u;
      id v29 = v294;
      id v260 = [v29 countByEnumeratingWithState:&v307 objects:v356 count:16];
      if (v260)
      {
        uint64_t v261 = *(void *)v308;
        uint64_t v276 = kMCDMManagingProfileToManagedProfileKey;
        uint64_t v262 = kMCDMManagedProfileToManagingProfileKey;
        do
        {
          for (k = 0; k != v260; k = (char *)k + 1)
          {
            if (*(void *)v308 != v261) {
              objc_enumerationMutation(v29);
            }
            v264 = *(void **)(*((void *)&v307 + 1) + 8 * (void)k);
            if (([v264 isEqualToString:v304] & 1) == 0
              && ([v284 containsObject:v264] & 1) == 0)
            {
              [v297 addDependent:v264 ofParent:v304 inDomain:v276 reciprocalDomain:v262 toSystem:v291 != 2 user:v291 == 2];
            }
          }
          id v260 = [v29 countByEnumeratingWithState:&v307 objects:v356 count:16];
        }
        while (v260);
      }
    }
    unsigned int v265 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:v299];
    v266 = [v306 currentRestrictions];
    unsigned int v267 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:v266];

    if (v265 != v267) {
      MCSendWebContentFilterUIActiveChangedNotification();
    }
    v268 = [v277 managedAppleID];
    if ([v268 length]) {
      char v269 = v286;
    }
    else {
      char v269 = 1;
    }

    if ((v269 & 1) == 0)
    {
      v270 = [v277 managedAppleID];
      [(MCInstaller *)self _promptUserForRestoreWithAccountID:v270 personaID:v303 interactionClient:v298];
    }
    int v203 = 0;
    BOOL v75 = 1;
LABEL_278:

    goto LABEL_279;
  }
  BOOL v75 = 0;
  v292 = 0;
  int v203 = 2;
LABEL_280:

LABEL_281:
  if ((v203 | 2) != 2) {
    goto LABEL_115;
  }
LABEL_52:
  id v76 = v350[5];
  if (!v76)
  {
    v91 = [v305 profile];
    id v88 = [v91 installOptions];

    v92 = [v305 profile];
    id v93 = [v92 isInstalledForUser];

    if (v305)
    {
      v94 = _MCLogObjects[5];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "Removing profiles that were set aside...", buf, 2u);
      }

      [v305 removeWithInstaller:self options:0];
      v95 = [v306 currentRestrictions];
      [v305 didRemoveOldGlobalRestrictions:v299 newGlobalRestrictions:v95];

      v96 = [v305 profile];
      v97 = [v96 identifier];

      v98 = [(MCInstaller *)self _managingProfileIdentifierForProfileIdentifier:v97];
      if (v98) {
        [v297 removeDependent:v97 fromParent:v98 inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey fromSystem:v93 ^ 1 user:v93];
      }

      id v99 = [v12 mutableCopy];
      v100 = v99;
      if (v286)
      {
        uint64_t v101 = kMCInstallProfileOptionIsCloudProfile;
        v102 = [v88 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudProfile];
        unsigned int v103 = [v102 BOOLValue];

        if (v103)
        {
          uint64_t v104 = kMCInstallProfileOptionIsCloudLocked;
          v105 = [v88 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
          v106 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v105 BOOLValue]);
          [v100 setObject:v106 forKeyedSubscript:v104];

          v107 = &__kCFBooleanTrue;
        }
        else
        {
          v107 = &__kCFBooleanFalse;
          [v100 setObject:&__kCFBooleanFalse forKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
        }
        [v100 setObject:v107 forKeyedSubscript:v101];
      }
      else
      {
        [v99 setObject:&__kCFBooleanFalse forKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
        uint64_t v101 = kMCInstallProfileOptionIsCloudProfile;
        [v100 setObject:&__kCFBooleanFalse forKeyedSubscript:kMCInstallProfileOptionIsCloudProfile];
      }
      id v111 = +[MCProfile newProfileSignatureVersion];
      [v100 setObject:v111 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

      id v110 = v100;
    }
    else
    {
      id v108 = [v12 mutableCopy];
      id v109 = +[MCProfile newProfileSignatureVersion];
      [v108 setObject:v109 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

      id v110 = v108;
      uint64_t v101 = kMCInstallProfileOptionIsCloudProfile;
    }
    v112 = [v110 objectForKeyedSubscript:v101];
    if ([v112 BOOLValue])
    {
      v113 = [v110 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
      unsigned int v114 = [v113 BOOLValue];

      if (!v114) {
        goto LABEL_88;
      }
      v115 = [v11 profile];
      [v115 setLocked:1];

      v112 = [v11 profile];
      [v112 setRemovalPasscode:0];
    }

LABEL_88:
    v116 = [v11 profile];
    [v116 setInstallOptions:v110];

    v117 = [v11 profile];
    if (v291 == 2) {
      sub_10004579C();
    }
    else {
    v118 = sub_1000457EC();
    }
    [v117 writeStubToDirectory:v118];

    id v119 = +[MCProfile thisDeviceType];
    if (+[MCTargetDeviceResolver purgatorySupportedForDevice:v119])
    {
      [(MCInstaller *)self purgePurgatoryProfileWithIdentifier:v304 targetDevice:v119];
      v120 = [v110 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively];
      unsigned int v121 = [v120 BOOLValue];

      if (v121)
      {
        v122 = [v11 profile];
        sub_1000807D8(v122);
      }
    }
    v123 = +[MCManifest sharedManifest];
    if ((~v290 & 9) != 0) {
      [v123 addIdentifierToSystemManifest:v304 flag:v290];
    }
    else {
      [v123 addIdentifierToUserManifest:v304 flag:v290];
    }

    v124 = [v305 profile];
    if ([v124 containsPayloadOfClass:objc_opt_class()])
    {
    }
    else
    {
      v125 = [v11 profile];
      unsigned int v126 = [v125 containsPayloadOfClass:objc_opt_class()];

      if (!v126) {
        goto LABEL_101;
      }
    }
    notify_post((const char *)[MCDefaultsDidChangeNotification UTF8String]);
LABEL_101:
    v127 = [v305 profile];
    if ([v127 containsPayloadOfClass:objc_opt_class()])
    {
    }
    else
    {
      v128 = [v11 profile];
      unsigned int v129 = [v128 containsPayloadOfClass:objc_opt_class()];

      if (!v129)
      {
LABEL_106:
        v133 = _MCLogObjects[5];
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v304;
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” installed.", buf, 0xCu);
        }

        goto LABEL_109;
      }
    }
    buf[0] = 0;
    v130 = +[MCServerSideHacks sharedHacks];
    v131 = [v306 effectiveUserSettings];
    [v130 recomputeAppOptionsEffectiveUserSettings:v131 outEffectiveChangeDetected:buf];

    if (buf[0])
    {
      MCSendAppWhitelistChangedNotification();
      v132 = +[MDMClient sharedClient];
      [v132 retryNotNowResponse];
    }
    goto LABEL_106;
  }
  if (v301) {
    [v301 unstageFromInstallationWithInstaller:self];
  }
  if (v75)
  {
    v77 = [v306 currentRestrictions];
    id v78 = [v77 copy];

    unint64_t v79 = [v306 systemProfileRestrictions];
    id v80 = [v79 MCMutableDeepCopy];

    v81 = [v306 userProfileRestrictions];
    id v82 = [v81 MCMutableDeepCopy];

    if (v291 == 2) {
      v83 = v82;
    }
    else {
      v83 = v80;
    }
    [v83 removeObjectForKey:v304];
    int v84 = [v11 profile];
    unsigned int v85 = [v84 loggingID];
    [v306 setSystemProfileRestrictions:v80 userProfileRestrictions:v82 sender:v85 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAppWhitelistSettingsChanged:0 outRecomputedNag:0 outError:0];

    [v11 removeWithInstaller:self options:0];
    int v86 = [v306 currentRestrictions];
    [v11 didRemoveOldGlobalRestrictions:v78 newGlobalRestrictions:v86];
  }
  if (v305) {
    [v305 unsetAside];
  }
  if (v303) {
    char v87 = v75;
  }
  else {
    char v87 = 1;
  }
  if ((v87 & 1) == 0) {
    +[DMCPersonaHelper removePersonaAndAccountsWithPersonaID:v303];
  }
  id v88 = +[MCInstaller _installationFailureErrorWithUnderlyingError:v350[5]];
  v89 = _MCLogObjects[5];
  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
  {
    id v90 = [v88 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v304;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v90;
    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Profile “%{public}@” failed to install with error: %{public}@", buf, 0x16u);
  }
  if (a7)
  {
    id v88 = v88;
    *a7 = v88;
  }
LABEL_109:

  [(MCInstaller *)self setSetAsideAccountIdentifiersByPayloadClass:0];
  [(MCInstaller *)self setSetAsideDictionariesByPayloadClass:0];
  if ([v303 length]) {
    +[DMCPersonaHelper untrackDirtyPersona:v303];
  }
  v134 = [v11 profile];
  v135 = +[MCPayload accountPayloads];
  unsigned int v136 = [v134 containsAnyPayloadOfClasses:v135];

  v137 = [v305 profile];
  v138 = +[MCPayload accountPayloads];
  LODWORD(v135) = [v137 containsAnyPayloadOfClasses:v138];

  [(MCInstaller *)self _removeOrphanedResourcesOptions:v12 includingAccounts:v136 | v135];
  v139 = +[MCServerSideHacks sharedHacks];
  v140 = [v306 effectiveUserSettings];
  [v139 recomputeHacksAfterProfileChangesEffectiveUserSettings:v140 sendNotifications:1];

  id v141 = [v139 recomputeAccountVPNAssociations];
  if (v76)
  {
    id v142 = 0;
  }
  else
  {
    id v142 = [v304 copy];
  }
  id v29 = v142;

LABEL_115:
  _Block_object_dispose(&v349, 8);

  return v29;
}

- (BOOL)deviceSupervisionRequiredForPayload:(id)a3
{
  id v3 = a3;
  +[MCPayload supervisedRequiredPayloads];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {

          goto LABEL_13;
        }
      }
      id v6 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "vpnType", v13),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn],
        v9,
        (v10 & 1) != 0))
  {
LABEL_13:
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)addSetAsideAccountIdentifier:(id)a3 forPayloadClass:(Class)a4
{
  id v10 = a3;
  id v6 = NSStringFromClass(a4);
  uint64_t v7 = [(MCInstaller *)self setAsideAccountIdentifiersByPayloadClass];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v8 = +[NSMutableSet set];
    uint64_t v9 = [(MCInstaller *)self setAsideAccountIdentifiersByPayloadClass];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  [v8 addObject:v10];
}

- (id)setAsideAccountIdentifiersForPayloadClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [(MCInstaller *)self setAsideAccountIdentifiersByPayloadClass];
  id v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 allObjects];

  return v7;
}

- (void)addSetAsideDictionary:(id)a3 forPayloadHandlerClass:(Class)a4
{
  id v8 = a3;
  id v6 = NSStringFromClass(a4);
  uint64_t v7 = [(NSMutableDictionary *)self->_setAsideDictionariesByPayloadClass objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v7 = +[NSMutableSet set];
    [(NSMutableDictionary *)self->_setAsideDictionariesByPayloadClass setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (id)setAsideDictionariesForPayloadHandlerClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [(NSMutableDictionary *)self->_setAsideDictionariesByPayloadClass objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)_showWarningsForProfile:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a3 installationWarnings];
  LOBYTE(a5) = [(MCInstaller *)self _showWarnings:v9 interactionClient:v8 outError:a5];

  return (char)a5;
}

- (BOOL)_showWarningsForUpdatingProfile:(id)a3 originalProfile:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [a4 installationWarnings];
  long long v13 = [v11 installationWarnings];

  id v14 = [v13 mutableCopy];
  [v14 removeObjectsInArray:v12];
  LOBYTE(a6) = [(MCInstaller *)self _showWarnings:v14 interactionClient:v10 outError:a6];

  return (char)a6;
}

- (BOOL)_showWarnings:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  char v13 = 0;
  unsigned int v10 = [v8 showUserWarnings:v7 outResult:&v13];
  if (v13 && v10)
  {
    id v8 = 0;
LABEL_5:
    BOOL v11 = 1;
    goto LABEL_6;
  }
  id v8 = +[MCProfileHandler userCancelledError];
  BOOL v11 = v8 == 0;
  if (a5 && v8)
  {
    id v8 = v8;
    BOOL v11 = 0;
    *a5 = v8;
  }
LABEL_6:

  return v11;
}

- (id)existingProfileContainingPayloadClass:(Class)a3 excludingProfileIdentifier:(id)a4
{
  return [(MCInstaller *)self existingProfileContainingPayloadClass:a3 inProfilesWithFilterFlags:3 excludingProfileIdentifier:a4];
}

- (id)existingProfileContainingPayloadClass:(Class)a3 inProfilesWithFilterFlags:(int)a4 excludingProfileIdentifier:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = +[MCManifest sharedManifest];
  uint64_t v9 = [v8 identifiersOfProfilesWithFilterFlags:v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isEqualToString:", v15, (void)v18) & 1) == 0)
        {
          long long v16 = +[MCManifest installedProfileWithIdentifier:v15];
          if ([v16 containsPayloadOfClass:a3]) {
            goto LABEL_12;
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  long long v16 = 0;
LABEL_12:

  return v16;
}

- (id)installProfileData:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v175 = a6;
  uint64_t v13 = kMCInstallProfileOptionFilterFlag;
  id v14 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionFilterFlag];
  unsigned int v15 = [v14 intValue];

  if (v15 <= 1) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  unsigned int v17 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType];
  unsigned int v18 = [v17 intValue];

  if (v18 == 2) {
    int v19 = 8;
  }
  else {
    int v19 = 16;
  }
  uint64_t v20 = v19 | v16;
  if (v11)
  {
    id v21 = [v11 mutableCopy];
  }
  else
  {
    id v21 = +[NSMutableDictionary dictionary];
  }
  id v22 = v21;
  id v23 = +[NSNumber numberWithUnsignedInt:v20];
  [v22 setObject:v23 forKeyedSubscript:v13];

  if (v12) {
    uint64_t v24 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v24 = &__kCFBooleanFalse;
  }
  [v22 setObject:v24 forKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively];
  id v25 = +[MCProfile newProfileSignatureVersion];
  [v22 setObject:v25 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

  unsigned int v26 = +[MCDependencyManager sharedManager];
  [v26 commitChanges];
  id v191 = 0;
  unsigned int v27 = +[MCProfile profileWithData:v10 options:v22 outError:&v191];
  id v28 = v191;
  if (v28)
  {
    id v29 = v28;
    id v30 = 0;
    goto LABEL_88;
  }
  uint64_t v168 = v12;
  id v190 = 0;
  unsigned int v31 = [v27 mayInstallWithOptions:v22 hasInteractionClient:v12 != 0 outError:&v190];
  id v29 = v190;
  if (!v31)
  {
    id v30 = 0;
    id v12 = v168;
    goto LABEL_88;
  }
  v167 = v27;
  id v166 = [v27 createHandler];
  if (!v166)
  {
    id v30 = [(MCInstaller *)self _malformedPayloadErrorInternal:0];
    uint64_t v35 = 0;
    uint64_t v34 = 0;
    id v12 = v168;
    goto LABEL_86;
  }
  signed int v32 = +[MCPasscodeManagerWriter sharedManager];
  unsigned int v33 = [v32 isDeviceLocked];

  id v12 = v168;
  if (v33)
  {
    id v30 = [(MCInstaller *)self _deviceLockedError];
    uint64_t v34 = 0;
    goto LABEL_85;
  }
  if ([v167 targetDeviceType])
  {
    if ([v167 targetDeviceType])
    {
      id v36 = [v167 targetDeviceType];
      if (v36 != +[MCProfile thisDeviceType])
      {
        uint64_t v43 = [(MCInstaller *)self _targetDeviceMismatchError];
        id v30 = [(MCInstaller *)self _targetDeviceErrorWithUnderlyingError:v43];

        uint64_t v34 = 0;
        id v29 = (id)v43;
        goto LABEL_85;
      }
    }
  }
  if ([v167 isStub])
  {
    uint64_t v37 = MCProfileErrorDomain;
    uint64_t v38 = [v167 friendlyName];
    v39 = MCErrorArray();
    uint64_t v40 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v37, 1000, v39, 0, MCErrorTypeFatal, v38, 0);
    id v30 = [v40 MCCopyAsPrimaryError];

    uint64_t v34 = 0;
    id v29 = (id)v38;
    goto LABEL_85;
  }
  id v41 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v42 = [v41 userMode];

  if (v42 != 1)
  {
    id v30 = v29;
    unsigned int v27 = v167;
    goto LABEL_51;
  }
  id v164 = +[MCPayload unavailablePayloadsInEphemeralMultiUser];
  if (v18 == 2) {
    +[MCPayload unavailableUserPayloadsInEphemeralMultiUser];
  }
  else {
  id v162 = +[MCPayload unavailableSystemPayloadsInEphemeralMultiUser];
  }
  unsigned int v27 = v167;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v187 = 0u;
  long long v186 = 0u;
  id obj = [v167 payloads];
  id v44 = [obj countByEnumeratingWithState:&v186 objects:v195 count:16];
  if (!v44) {
    goto LABEL_49;
  }
  id v45 = v44;
  id v159 = v10;
  uint64_t v46 = *(void *)v187;
  while (2)
  {
    for (i = 0; i != v45; i = (char *)i + 1)
    {
      if (*(void *)v187 != v46) {
        objc_enumerationMutation(obj);
      }
      v48 = *(void **)(*((void *)&v186 + 1) + 8 * i);
      if ([v164 containsObject:objc_opt_class()])
      {
        uint64_t v49 = MCInstallationErrorDomain;
        id v50 = [v48 type];
        v155 = v50;
        id v51 = MCErrorArray();
        uint64_t v52 = MCErrorTypeFatal;
        uint64_t v53 = v49;
        uint64_t v54 = 4029;
LABEL_47:
        uint64_t v56 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v53, v54, v51, v52, v155, 0);

        id v29 = (id)v56;
        goto LABEL_48;
      }
      if ([v162 containsObject:objc_opt_class()])
      {
        if (v18 == 2) {
          uint64_t v55 = 4032;
        }
        else {
          uint64_t v55 = 4031;
        }
        uint64_t v158 = MCInstallationErrorDomain;
        id v50 = [v48 type];
        v155 = v50;
        id v51 = MCErrorArray();
        uint64_t v52 = MCErrorTypeFatal;
        uint64_t v53 = v158;
        uint64_t v54 = v55;
        goto LABEL_47;
      }
    }
    id v45 = [obj countByEnumeratingWithState:&v186 objects:v195 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_48:
  id v10 = v159;
  unsigned int v27 = v167;
LABEL_49:

  id v30 = 0;
  if (v29)
  {
LABEL_50:
    uint64_t v35 = v166;
    goto LABEL_87;
  }
LABEL_51:
  if ([v27 containsPayloadOfClass:objc_opt_class()])
  {
    uint64_t v57 = objc_opt_class();
    v58 = [v27 identifier];
    id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v57 excludingProfileIdentifier:v58];

    if (v29)
    {
      uint64_t v170 = MCInstallationErrorDomain;
      uint64_t v59 = [v29 friendlyName];
      unsigned int v156 = v59;
      id v60 = MCErrorArray();
      uint64_t v61 = MCErrorTypeFatal;
      uint64_t v62 = v170;
      uint64_t v63 = 4017;
      goto LABEL_67;
    }
    unsigned int v27 = v167;
    if ((unint64_t)[v167 countOfPayloadsOfClass:objc_opt_class()] >= 2)
    {
      id v164 = NSError;
      id v162 = (void *)MCInstallationErrorDomain;
      int v64 = [v167 friendlyName];
      os_log_t v65 = MCErrorArray();
      uint64_t v66 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v162, 4017, v65, MCErrorTypeFatal, v64, 0);

      id v30 = (id)v66;
      unsigned int v27 = v167;
    }
  }
  if ([v27 containsPayloadOfClass:objc_opt_class()])
  {
    uint64_t v67 = objc_opt_class();
    id v68 = [v27 identifier];
    id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v67 excludingProfileIdentifier:v68];

    if (v29)
    {
      uint64_t v171 = MCInstallationErrorDomain;
      uint64_t v59 = [v29 friendlyName];
      unsigned int v156 = v59;
      id v60 = MCErrorArray();
      uint64_t v61 = MCErrorTypeFatal;
      uint64_t v62 = v171;
      uint64_t v63 = 4019;
      goto LABEL_67;
    }
    unsigned int v27 = v167;
    if ((unint64_t)[v167 countOfPayloadsOfClass:objc_opt_class()] >= 2)
    {
      id v164 = NSError;
      id v162 = (void *)MCInstallationErrorDomain;
      unsigned int v69 = [v167 friendlyName];
      unsigned int v70 = MCErrorArray();
      uint64_t v71 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v162, 4019, v70, MCErrorTypeFatal, v69, 0);

      id v30 = (id)v71;
      unsigned int v27 = v167;
    }
  }
  if (![v27 containsPayloadOfClass:objc_opt_class()])
  {
LABEL_70:
    if ([v27 containsPayloadOfClass:objc_opt_class()])
    {
      if (v18 == 2) {
        uint64_t v79 = 9;
      }
      else {
        uint64_t v79 = 19;
      }
      id v80 = v27;
      uint64_t v81 = objc_opt_class();
      id v82 = [v80 identifier];
      id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v81 inProfilesWithFilterFlags:v79 excludingProfileIdentifier:v82];

      if (v29)
      {
        uint64_t v83 = MCInstallationErrorDomain;
        int v84 = [v29 friendlyName];
        unsigned int v85 = MCErrorArray();
        uint64_t v86 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v83, 4028, v85, MCErrorTypeFatal, v84, 0);

        uint64_t v34 = 0;
        id v30 = (id)v86;
LABEL_84:
        id v12 = v168;
        goto LABEL_85;
      }
      id v160 = v10;
      if ((unint64_t)[v80 countOfPayloadsOfClass:objc_opt_class()] < 2)
      {
        unsigned int v27 = v80;
      }
      else
      {
        uint64_t v106 = MCInstallationErrorDomain;
        v107 = [v167 friendlyName];
        id v108 = MCErrorArray();
        uint64_t v109 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v106, 4028, v108, MCErrorTypeFatal, v107, 0);

        id v30 = (id)v109;
        unsigned int v27 = v167;
      }
    }
    else
    {
      id v160 = v10;
    }
    if (([v27 containsPayloadOfClass:objc_opt_class()] & 1) != 0
      || [v27 containsPayloadOfClass:objc_opt_class()])
    {
      uint64_t v87 = objc_opt_class();
      [v27 identifier];
      v89 = id v88 = v27;
      id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v87 excludingProfileIdentifier:v89];

      if (v29
        || (uint64_t v90 = objc_opt_class(),
            [v88 identifier],
            v91 = objc_claimAutoreleasedReturnValue(),
            [(MCInstaller *)self existingProfileContainingPayloadClass:v90 excludingProfileIdentifier:v91], id v29 = (id)objc_claimAutoreleasedReturnValue(), v91, v29))
      {
        uint64_t v92 = MCInstallationErrorDomain;
        id v93 = [v29 friendlyName];
        uint64_t v94 = MCErrorArray();
        uint64_t v95 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v92, 4018, v94, MCErrorTypeFatal, v93, 0);

        id v30 = (id)v94;
LABEL_82:

        uint64_t v34 = 0;
        id v30 = (id)v95;
LABEL_83:
        id v10 = v160;
        goto LABEL_84;
      }
      id v110 = (char *)[v88 countOfPayloadsOfClass:objc_opt_class()];
      unsigned int v27 = v88;
      if (&v110[(void)[v88 countOfPayloadsOfClass:objc_opt_class()]] >= (char *)2)
      {
        uint64_t v111 = MCInstallationErrorDomain;
        id v29 = [v88 friendlyName];
        id v93 = MCErrorArray();
        uint64_t v95 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v111, 4018, v93, MCErrorTypeFatal, v29, 0);
        goto LABEL_82;
      }
    }
    id v10 = v160;
    id v12 = v168;
    if ([v27 containsPayloadOfClass:objc_opt_class()])
    {
      uint64_t v112 = objc_opt_class();
      v113 = [v27 identifier];
      id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v112 excludingProfileIdentifier:v113];

      if (v29)
      {
        uint64_t v114 = MCInstallationErrorDomain;
        v115 = [v29 friendlyName];
        v157 = v115;
LABEL_119:
        id v119 = MCErrorArray();
        uint64_t v120 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v114, 4034, v119, MCErrorTypeFatal, v157, 0);

        uint64_t v34 = 0;
        id v30 = (id)v120;
        goto LABEL_85;
      }
      unsigned int v27 = v167;
      if ((unint64_t)[v167 countOfPayloadsOfClass:objc_opt_class()] >= 2)
      {
        uint64_t v114 = MCInstallationErrorDomain;
        v115 = [v167 friendlyName];
        v157 = v115;
        goto LABEL_119;
      }
    }
    if ([v27 containsPayloadOfClass:objc_opt_class()])
    {
      id v185 = v30;
      unsigned int v116 = [(MCInstaller *)self _allowsPasswordPoliciesFromProfile:v27 outError:&v185];
      id v29 = v185;

      if (!v116)
      {
        id v30 = 0;
        goto LABEL_50;
      }
      id v30 = v29;
    }
    if ([v27 containsPayloadOfClass:objc_opt_class()])
    {
      uint64_t v117 = objc_opt_class();
      v118 = [v27 identifier];
      id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v117 excludingProfileIdentifier:v118];

      if (v29)
      {
        uint64_t v114 = MCInstallationErrorDomain;
        v115 = [v29 friendlyName];
        v157 = v115;
        goto LABEL_119;
      }
      unsigned int v27 = v167;
      if ((unint64_t)[v167 countOfPayloadsOfClass:objc_opt_class()] >= 2)
      {
        uint64_t v114 = MCInstallationErrorDomain;
        v115 = [v167 friendlyName];
        v157 = v115;
        goto LABEL_119;
      }
    }
    id v29 = [v27 removalDate];
    if (v29)
    {
      unsigned int v121 = +[NSDate date];
      id v122 = [v29 compare:v121];

      if (v122 == (id)-1)
      {
        uint64_t v130 = MCInstallationErrorDomain;
        id v128 = [v167 friendlyName];
        v131 = MCErrorArray();
        uint64_t v132 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v130, 4025, v131, MCErrorTypeFatal, v128, 0);

        uint64_t v34 = 0;
        id v30 = (id)v132;
        goto LABEL_162;
      }
    }
    v123 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionsIsRMUserEnrollment];
    unsigned __int8 v124 = [v123 BOOLValue];
    if (v124) {
      goto LABEL_126;
    }
    v125 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
    if ([v125 BOOLValue])
    {
      id v164 = v125;
      id v162 = +[MDMConfiguration sharedConfiguration];
      if ([v162 isUserEnrollment])
      {
        id v12 = v168;
LABEL_126:
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ((v124 & 1) == 0)
        {
        }
        if (isKindOfClass)
        {
          uint64_t v127 = MCInstallationErrorDomain;
          id v128 = [v167 friendlyName];
          unsigned int v129 = MCErrorArray();
          uint64_t v173 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v127, 4040, v129, MCErrorTypeFatal, v128, 0);

          uint64_t v34 = 0;
          id v30 = (id)v173;
LABEL_162:

          goto LABEL_85;
        }
LABEL_133:
        v133 = +[MCActivationUtilities sharedInstance];
        unsigned int v134 = [v133 isHRNMode];

        if (v134 <= 1)
        {
          v135 = +[MCPayload hrnRequiredPayloads];
          long long v181 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          id v165 = [v167 payloads];
          id v136 = [v165 countByEnumeratingWithState:&v181 objects:v194 count:16];
          if (v136)
          {
            id v137 = v136;
            uint64_t v138 = *(void *)v182;
            while (2)
            {
              for (j = 0; j != v137; j = (char *)j + 1)
              {
                if (*(void *)v182 != v138) {
                  objc_enumerationMutation(v165);
                }
                v140 = *(void **)(*((void *)&v181 + 1) + 8 * (void)j);
                if ([v135 containsObject:objc_opt_class()])
                {
                  uint64_t v163 = MCInstallationErrorDomain;
                  id v141 = [v140 type];
                  id v142 = MCErrorArray();
                  uint64_t v143 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v163, 4044, v142, MCErrorTypeFatal, v141, 0);

                  id v30 = (id)v143;
                  goto LABEL_144;
                }
              }
              id v137 = [v165 countByEnumeratingWithState:&v181 objects:v194 count:16];
              if (v137) {
                continue;
              }
              break;
            }
          }
LABEL_144:

          id v12 = v168;
        }
        if (v30)
        {
          uint64_t v34 = 0;
          id v10 = v160;
          goto LABEL_85;
        }
        v144 = MCLocalizedString();
        [v12 setDefaultStatus:v144];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v180 = 0;
          [(MCInstaller *)self _showWarningsForProfile:v167 interactionClient:v168 outError:&v180];
          id v145 = v180;
          if (v145)
          {
            id v30 = v145;
            uint64_t v34 = 0;
            goto LABEL_83;
          }
          id v178 = 0;
          id v179 = 0;
          id v148 = [v166 fetchFinalProfileWithClient:v168 outProfileData:&v179 outError:&v178];
          id v128 = v179;
          id v149 = v178;
          if (v149)
          {
            id v30 = v149;
            id v146 = v166;
            v150 = v167;
LABEL_161:

            uint64_t v34 = 0;
            id v166 = v146;
            v167 = v150;
            id v10 = v160;
            id v12 = v168;
            goto LABEL_162;
          }
          id v151 = v148;

          v150 = v151;
          id v146 = [v151 createHandler];

          v152 = _MCLogObjects[9];
          if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v193 = v150;
            _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEBUG, "Retrieved Final profile: %{public}@", buf, 0xCu);
          }
          [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsOTAInstallation];
          id v177 = 0;
          unsigned int v153 = [v150 mayInstallWithOptions:v22 hasInteractionClient:v168 != 0 outError:&v177];
          id v30 = v177;
          if (!v153) {
            goto LABEL_161;
          }
          if (v168 && ([v168 didBeginInstallingNextProfileData:v128] & 1) == 0)
          {
            uint64_t v154 = [v146 userCancelledError];

            id v30 = (id)v154;
            goto LABEL_161;
          }

          id v166 = v146;
          v167 = v150;
        }
        else
        {
          id v30 = 0;
          id v146 = v166;
        }
        id v176 = v30;
        id v147 = v146;
        id v12 = v168;
        uint64_t v34 = [(MCInstaller *)self _installProfileHandler:v147 options:v22 interactionClient:v168 source:v175 outError:&v176];
        id v128 = v30;
        id v30 = v176;
        id v10 = v160;
        goto LABEL_162;
      }

      id v12 = v168;
    }

    goto LABEL_133;
  }
  if (v18 == 2) {
    int v72 = 9;
  }
  else {
    int v72 = 19;
  }
  LODWORD(v164) = v72;
  uint64_t v73 = objc_opt_class();
  unsigned int v74 = [v27 identifier];
  id v29 = [(MCInstaller *)self existingProfileContainingPayloadClass:v73 inProfilesWithFilterFlags:v164 excludingProfileIdentifier:v74];

  if (!v29)
  {
    unsigned int v27 = v167;
    if ((unint64_t)[v167 countOfPayloadsOfClass:objc_opt_class()] >= 2)
    {
      id v164 = (id)MCInstallationErrorDomain;
      id v76 = [v167 friendlyName];
      v77 = MCErrorArray();
      uint64_t v78 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v164, 4027, v77, MCErrorTypeFatal, v76, 0);

      id v30 = (id)v78;
      unsigned int v27 = v167;
    }
    goto LABEL_70;
  }
  uint64_t v172 = MCInstallationErrorDomain;
  uint64_t v59 = [v29 friendlyName];
  unsigned int v156 = v59;
  id v60 = MCErrorArray();
  uint64_t v61 = MCErrorTypeFatal;
  uint64_t v62 = v172;
  uint64_t v63 = 4027;
LABEL_67:
  uint64_t v75 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v62, v63, v60, v61, v156, 0);

  uint64_t v34 = 0;
  id v30 = (id)v75;
LABEL_85:
  uint64_t v35 = v166;
LABEL_86:
  id v96 = v30;

  id v30 = (id)v34;
  id v29 = v96;
  unsigned int v27 = v167;
LABEL_87:

LABEL_88:
  [v26 commitChanges];
  if (v30) {
    MCSendProfileListChangedNotification();
  }
  if (v29)
  {
    id v97 = v10;
    uint64_t v98 = MCInstallationErrorDomain;
    id v99 = MCErrorArray();
    v100 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v98, 4001, v99, v29, MCErrorTypeFatal, 0);

    os_log_t v101 = _MCLogObjects[9];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      v102 = v101;
      unsigned int v103 = [v100 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      id v193 = v103;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "Installation failed. Error: %{public}@", buf, 0xCu);
    }
    id v10 = v97;
    if (a7) {
      *a7 = v100;
    }

    id v104 = 0;
  }
  else
  {
    id v104 = v30;
  }

  return v104;
}

- (id)_assumeOwnershipProfileHandler:(id)a3 options:(id)a4 source:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v58 = a5;
  id v12 = [v10 profile];
  uint64_t v13 = [v12 identifier];

  id v14 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType];
  LODWORD(a5) = [v14 intValue];

  uint64_t v57 = +[MCDependencyManager sharedManager];
  int v56 = (int)a5;
  if (a5 == 2) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  int v16 = [(MCInstaller *)self _installedProfileWithIdentifier:v13 installationType:v15];
  uint64_t v17 = kMCInstallProfileOptionsIsInstalledByDeclarativeManagement;
  unsigned int v18 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionsIsInstalledByDeclarativeManagement];
  unsigned __int8 v19 = [v18 BOOLValue];

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = MCInstallationErrorDomain;
    id v21 = MCErrorArray();
    id v22 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v20, 4048, v21, MCErrorTypeFatal, 0);
    id v23 = [v22 MCCopyAsPrimaryError];

    if (v23) {
      goto LABEL_19;
    }
  }
  uint64_t v24 = [v10 profile];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = [v10 profile];
    unsigned int v26 = [v25 isMDMProfile];

    if (v26)
    {
      uint64_t v27 = MCInstallationErrorDomain;
      MCErrorArray();
      v29 = id v28 = a6;
      id v30 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v27, 4049, v29, MCErrorTypeFatal, 0);
      id v23 = [v30 MCCopyAsPrimaryError];

      a6 = v28;
      if (v23) {
        goto LABEL_19;
      }
    }
  }
  else
  {
  }
  if (v16) {
    goto LABEL_12;
  }
  uint64_t v42 = MCInstallationErrorDomain;
  MCErrorArray();
  id v44 = v43 = a6;
  id v45 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v42, 4050, v44, MCErrorTypeFatal, v13, 0);
  id v23 = [v45 MCCopyAsPrimaryError];

  a6 = v43;
  if (!v23)
  {
LABEL_12:
    if ([v16 isManagedByMDM])
    {
      id v23 = 0;
    }
    else
    {
      uint64_t v31 = MCInstallationErrorDomain;
      MCErrorArray();
      v33 = signed int v32 = a6;
      uint64_t v34 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v31, 4051, v33, MCErrorTypeFatal, v13, 0);
      id v23 = [v34 MCCopyAsPrimaryError];

      a6 = v32;
      if (v23) {
        goto LABEL_19;
      }
    }
    if (v16)
    {
      uint64_t v35 = [v16 installOptions];
      id v36 = [v35 mutableCopy];

      uint64_t v37 = kMCInstallProfileOptionManagingProfileIdentifier;
      uint64_t v38 = [v36 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
      [v36 setObject:0 forKeyedSubscript:v37];
      uint64_t v39 = kMCInstallProfileOptionInstalledBy;
      uint64_t v40 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionInstalledBy];
      [v36 setObject:v40 forKeyedSubscript:v39];

      [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:v17];
      id v41 = [v11 objectForKeyedSubscript:@"RemoteManagement.UserInfo"];
      [v36 setObject:v41 forKeyedSubscript:@"RemoteManagement.UserInfo"];

      [v16 setInstallOptions:v36];
      if (v56 == 2) {
        sub_10004579C();
      }
      else {
      uint64_t v52 = sub_1000457EC();
      }
      uint64_t v49 = v57;
      id v51 = v58;
      [v16 writeStubToDirectory:v52];

      uint64_t v53 = [v16 identifier];
      [v57 removeDependent:v53 fromParent:v38 inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey fromSystem:1 user:1];

      [v57 commitChanges];
      uint64_t v54 = objc_opt_new();
      [v54 addEventForProfile:v16 operation:@"assume-ownership" source:v58];

      id v50 = v13;
      id v23 = 0;
      goto LABEL_27;
    }
  }
LABEL_19:
  os_log_t v46 = _MCLogObjects[9];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    uint64_t v47 = v46;
    v48 = [v23 MCVerboseDescription];
    *(_DWORD *)buf = 138543362;
    id v60 = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Installation failed. Error: %{public}@", buf, 0xCu);
  }
  uint64_t v49 = v57;
  if (a6)
  {
    id v23 = v23;
    id v50 = 0;
    *a6 = v23;
  }
  else
  {
    id v50 = 0;
  }
  id v51 = v58;
LABEL_27:

  return v50;
}

- (BOOL)_allowsPasswordPoliciesFromProfile:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  if (+[MCRestrictionManager mayChangePasscode])
  {
    BOOL v6 = 1;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [v5 payloadsOfKindOfClass:objc_opt_class()];
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      id v22 = a4;
      id v23 = v5;
      id v10 = 0;
      uint64_t v11 = *(void *)v26;
LABEL_5:
      id v12 = 0;
      uint64_t v13 = v10;
      while (1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
        uint64_t v15 = +[MCPasscodeManagerWriter sharedManager];
        int v16 = [v14 restrictions];
        id v24 = v13;
        unsigned __int8 v17 = [v15 currentPasscodeCompliesWithPolicyFromRestrictions:v16 outError:&v24];
        id v10 = v24;

        if ((v17 & 1) == 0) {
          break;
        }
        id v12 = (char *)v12 + 1;
        uint64_t v13 = v10;
        if (v9 == v12)
        {
          id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v9) {
            goto LABEL_5;
          }
          BOOL v6 = 1;
          goto LABEL_15;
        }
      }
      BOOL v6 = (char)v22;
      if (v22)
      {
        uint64_t v18 = MCInstallationErrorDomain;
        id v5 = v23;
        unsigned __int8 v19 = [v23 friendlyName];
        uint64_t v20 = MCErrorArray();
        +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v18, 4026, v20, v10, MCErrorTypeFatal, v19, 0);
        id *v22 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v6 = 0;
        goto LABEL_16;
      }
LABEL_15:
      id v5 = v23;
    }
    else
    {
      id v10 = 0;
      BOOL v6 = 1;
    }
LABEL_16:
  }
  return v6;
}

- (BOOL)_overrideProfileValidation
{
  BOOL result = 0;
  if (os_variant_has_internal_ui())
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(kMCInternalOverrideProfileValidationKey, kCFPreferencesAnyApplication, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppBooleanValue != 0) {
      return 1;
    }
  }
  return result;
}

- (id)_errorUnacceptablePayload:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = [a3 type];
  id v5 = MCErrorArray();
  BOOL v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4022, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (id)_preflightProfileForInstallationOnHomePod:(id)a3
{
  id v4 = a3;
  if ([(MCInstaller *)self _overrideProfileValidation])
  {
    id v5 = _MCLogObjects[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding profile validation for HomePod", buf, 2u);
    }
    BOOL v6 = 0;
  }
  else
  {
    id v7 = +[MCPayload remoteQueueableHomePodPayloadClasses];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = [v4 payloads];
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (([v7 containsObject:objc_opt_class()] & 1) == 0)
          {
            os_log_t v14 = _MCLogObjects[9];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = v14;
              int v16 = (objc_class *)objc_opt_class();
              unsigned __int8 v17 = NSStringFromClass(v16);
              uint64_t v18 = [v13 type];
              *(_DWORD *)buf = 138543618;
              long long v25 = v17;
              __int16 v26 = 2114;
              long long v27 = v18;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Payload class %{public}@ (%{public}@) is not available on HomePod", buf, 0x16u);
            }
            BOOL v6 = [(MCInstaller *)self _errorUnacceptablePayload:v13];
            goto LABEL_17;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 0;
LABEL_17:
  }

  return v6;
}

- (id)_preflightProfileForInstallationOnWatch:(id)a3
{
  id v4 = a3;
  if ([(MCInstaller *)self _overrideProfileValidation])
  {
    id v5 = _MCLogObjects[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding profile validation for Watch", buf, 2u);
    }
    BOOL v6 = 0;
  }
  else
  {
    char v33 = 1;
    id v7 = [(MCInstaller *)self _watchInformationOutIsCellularSupported:&v33];
    if (qword_1001059B0 != -1) {
      dispatch_once(&qword_1001059B0, &stru_1000EBD08);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = [v4 payloads];
    id v9 = [v8 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v9)
    {
      id v10 = v9;
      long long v28 = self;
      uint64_t v11 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (([(id)qword_1001059A8 containsObject:objc_opt_class()] & 1) == 0)
          {
            int v16 = _MCLogObjects[9];
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            unsigned __int8 v17 = v16;
            uint64_t v18 = (objc_class *)objc_opt_class();
            unsigned __int8 v19 = NSStringFromClass(v18);
            long long v20 = [v13 type];
            *(_DWORD *)buf = 138543618;
            uint64_t v35 = v19;
            __int16 v36 = 2114;
            uint64_t v37 = v20;
            long long v21 = "Payload class %{public}@ (%{public}@) is not available on Watch";
            goto LABEL_27;
          }
          if ([v7 count]
            && ([v13 isSupportedByWatchVersions:v7] & 1) == 0)
          {
            os_log_t v22 = _MCLogObjects[9];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v17 = v22;
              long long v23 = (objc_class *)objc_opt_class();
              unsigned __int8 v19 = NSStringFromClass(v23);
              long long v20 = [v13 type];
              id v24 = [v7 description];
              *(_DWORD *)buf = 138543874;
              uint64_t v35 = v19;
              __int16 v36 = 2114;
              uint64_t v37 = v20;
              __int16 v38 = 2114;
              uint64_t v39 = v24;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Payload class %{public}@ (%{public}@) is not supported on any Watch version: %{public}@", buf, 0x20u);

              goto LABEL_28;
            }
LABEL_29:
            BOOL v6 = -[MCInstaller _errorUnacceptablePayload:](v28, "_errorUnacceptablePayload:", v13, v28);
            goto LABEL_30;
          }
          if (!v33)
          {
            os_log_t v14 = +[MCPayload cellularRequiredPayloads];
            unsigned int v15 = [v14 containsObject:objc_opt_class()];

            if (v15)
            {
              long long v25 = _MCLogObjects[9];
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_29;
              }
              unsigned __int8 v17 = v25;
              __int16 v26 = (objc_class *)objc_opt_class();
              unsigned __int8 v19 = NSStringFromClass(v26);
              long long v20 = [v13 type];
              *(_DWORD *)buf = 138543618;
              uint64_t v35 = v19;
              __int16 v36 = 2114;
              uint64_t v37 = v20;
              long long v21 = "Payload class %{public}@ (%{public}@) requires a cellular-capable Watch";
LABEL_27:
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
LABEL_28:

              goto LABEL_29;
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v29 objects:v40 count:16];
        BOOL v6 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
LABEL_30:
  }

  return v6;
}

- (id)_watchInformationOutIsCellularSupported:(BOOL *)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v6 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
  id v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];

  if ([v7 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v7;
    id v9 = (char *)[v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[NSNumber numberWithUnsignedInt:NRWatchOSVersionForRemoteDevice()];
          [v4 addObject:v13];
        }
        id v10 = (char *)[v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }
  }
  if (v7 && [v7 count])
  {
    os_log_t v22 = a3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v7;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      while (2)
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          unsigned __int8 v19 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
          LODWORD(v19) = [v19 supportsCapability:v20];

          if (v19)
          {
            BOOL *v22 = 1;
            goto LABEL_22;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }

  return v4;
}

- (id)_profileNotEligibleErrorWithProfile:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = [a3 friendlyName];
  id v5 = MCErrorArray();
  BOOL v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 4012, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 outError:(id *)a6
{
  return [(MCInstaller *)self updateProfileWithIdentifier:a3 interactionClient:a4 installForSystem:1 source:a5 outError:a6];
}

- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 installForSystem:(BOOL)a5 source:(id)a6 outError:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v56 = a6;
  id v12 = +[MCDependencyManager sharedManager];
  uint64_t v13 = +[MCManifest sharedManifest];
  id v14 = [v13 allInstalledUserProfileIdentifiers];

  unsigned int v15 = [v14 containsObject:v10];
  if (v15) {
    MCUserProfileStorageDirectory();
  }
  else {
  id v16 = MCSystemProfileStorageDirectory();
  }
  uint64_t v17 = [v10 MCHashedFilenameWithExtension:@"stub"];
  uint64_t v18 = [v16 stringByAppendingPathComponent:v17];

  unsigned __int8 v19 = +[NSData dataWithContentsOfFile:v18];
  id v60 = 0;
  id v20 = +[MCProfile profileWithData:v19 outError:&v60];
  id v21 = v60;
  if (v21) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = [(MCInstaller *)self _profileNotEligibleErrorWithProfile:v20];
LABEL_10:
    id v24 = v21;
    long long v25 = 0;
    goto LABEL_11;
  }
  uint64_t v54 = [v20 OTAProfile];
  if (v54)
  {
    uint64_t v53 = v11;
    os_log_t v22 = +[MCPasscodeManagerWriter sharedManager];
    unsigned int v23 = [v22 isDeviceLocked];

    if (v23)
    {
      id v24 = [(MCInstaller *)self _deviceLockedError];
      long long v25 = 0;
      id v11 = v53;
    }
    else
    {
      long long v32 = MCLocalizedString();
      [v53 setDefaultStatus:v32];

      id v11 = v53;
      id v58 = 0;
      id v59 = 0;
      id v50 = [v54 createHandler];
      uint64_t v52 = [v50 fetchFinalProfileWithClient:v53 outProfileData:&v59 outError:&v58];
      id v51 = v59;
      id v33 = v58;
      if (v33)
      {
        id v24 = v33;
        long long v25 = 0;
      }
      else
      {
        uint64_t v34 = [v52 identifier];
        uint64_t v35 = [v20 identifier];
        unsigned __int8 v48 = [v34 isEqualToString:v35];

        if (v48)
        {
          id v49 = [v52 createHandler];
          if (v49)
          {
            id v11 = v53;
            if (v53 && ([v53 didBeginInstallingNextProfileData:v51] & 1) == 0)
            {
              id v41 = v49;
              id v24 = [v49 userCancelledError];
              long long v25 = 0;
            }
            else
            {
              __int16 v36 = +[NSMutableDictionary dictionary];
              uint64_t v37 = [v20 identifier];
              id v45 = self;
              uint64_t v38 = [(MCInstaller *)self _managingProfileIdentifierForProfileIdentifier:v37];

              uint64_t v47 = (void *)v38;
              if (v38) {
                [v36 setObject:v38 forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
              }
              if (v15) {
                uint64_t v39 = &off_1000F5230;
              }
              else {
                uint64_t v39 = &off_1000F5248;
              }
              [v36 setObject:v39 forKeyedSubscript:kMCInstallProfileOptionFilterFlag];
              [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsOTAInstallation];
              [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsOTAUpdate];
              id v40 = +[MCProfile newProfileSignatureVersion];
              [v36 setObject:v40 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

              id v57 = 0;
              id v41 = v49;
              id v11 = v53;
              long long v25 = [(MCInstaller *)v45 _installProfileHandler:v49 options:v36 interactionClient:v53 source:v56 outError:&v57];
              os_log_t v46 = v36;
              id v24 = v57;
            }
          }
          else
          {
            id v24 = [(MCInstaller *)self _malformedPayloadErrorInternal:0];
            long long v25 = 0;
            id v11 = v53;
            id v41 = 0;
          }
        }
        else
        {
          uint64_t v42 = MCInstallationErrorDomain;
          id v41 = MCErrorArray();
          +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v42, 4010, v41, MCErrorTypeFatal, 0);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          long long v25 = 0;
          id v11 = v53;
        }
      }
    }
  }
  else
  {
    id v24 = [(MCInstaller *)self _profileNotEligibleErrorWithProfile:v20];
    long long v25 = 0;
  }

LABEL_11:
  [v12 commitChanges];
  if (v25) {
    MCSendProfileListChangedNotification();
  }
  if (v24)
  {
    uint64_t v26 = MCInstallationErrorDomain;
    if (v20)
    {
      unsigned __int8 v19 = [v20 friendlyName];
      uint64_t v43 = v19;
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v43 = 0;
    }
    long long v27 = MCErrorArray();
    long long v29 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v26, 4013, v27, v24, MCErrorTypeFatal, v43, v44);
    if (v20)
    {

      long long v27 = v19;
    }

    long long v30 = _MCLogObjects[9];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v62 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Profile update failed: %{public}@", buf, 0xCu);
    }
    if (a7) {
      *a7 = v29;
    }

    id v28 = 0;
  }
  else
  {
    id v28 = v25;
  }

  return v28;
}

- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6
{
  id v8 = a4;
  if ([v8 count])
  {
    id v9 = [v8 objectAtIndex:0];
    id v10 = [v9 objectForKey:kMCIDResponseKey];
    if (v10)
    {
      currentlyInstallingRestrictions = self->_currentlyInstallingRestrictions;
      id v20 = 0;
      unsigned int v12 = +[MCPasscodeManagerWriter passcode:v10 compliesWithPolicyFromRestrictions:currentlyInstallingRestrictions checkHistory:1 outError:&v20];
      id v13 = v20;
      id v14 = v13;
      if (a6)
      {
        if (v12) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v13 == 0;
        }
        if (!v15)
        {
          id v16 = [v13 userInfo];
          id v17 = [v16 mutableCopy];

          [v17 setObject:MCErrorTypeNeedsRetry forKey:MCErrorTypeKey];
          uint64_t v18 = [v14 domain];
          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, [v14 code], v17);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_removeOrphanedResourcesOptions:(id)a3 includingAccounts:(BOOL)a4
{
  BOOL v82 = a4;
  id v84 = a3;
  id v5 = +[MCDependencyManager sharedManager];
  uint64_t v6 = kMCDMManagedProfileToManagingProfileKey;
  uint64_t v83 = [v5 orphanedParentsForDomain:kMCDMManagedProfileToManagingProfileKey];
  if ([v83 count])
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v7 = v83;
    id v8 = [v7 countByEnumeratingWithState:&v114 objects:v126 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v115;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v115 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v114 + 1) + 8 * i);
          id v13 = [v5 dependentsOfParent:v12 inSystemDomain:v6];
          id v14 = [v13 count];

          if (!v14) {
            id v15 = [(MCInstaller *)self _reallyRemoveInstalledProfileWithIdentifier:v12 installationType:1 options:0 source:@"Orphaned Resource Removal"];
          }
          id v16 = [v5 dependentsOfParent:v12 inUserDomain:v6];
          id v17 = [v16 count];

          if (!v17) {
            id v18 = [(MCInstaller *)self _reallyRemoveInstalledProfileWithIdentifier:v12 installationType:2 options:0 source:@"Orphaned Resource Removal"];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v114 objects:v126 count:16];
      }
      while (v9);
    }

    unsigned __int8 v19 = +[MCServerSideHacks sharedHacks];
    id v20 = +[MCRestrictionManager sharedManager];
    id v21 = [v20 effectiveUserSettings];
    [v19 recomputeHacksAfterProfileChangesEffectiveUserSettings:v21 sendNotifications:1];
  }
  uint64_t v22 = kMCDMProvisioningProfileToManagingProfileKey;
  [v5 orphanedParentsForDomain:kMCDMProvisioningProfileToManagingProfileKey];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v23 = [obj countByEnumeratingWithState:&v110 objects:v125 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v111;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v111 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v110 + 1) + 8 * (void)j);
        id v28 = [v5 dependentsOfParent:v27 inDomain:v22];
        id v29 = [v28 count];

        if (!v29) {
          id v30 = [(MCInstaller *)self removeProvisioningProfileUUID:v27 sender:@"MCInstaller.removeOrphanedResources"];
        }
      }
      id v24 = [obj countByEnumeratingWithState:&v110 objects:v125 count:16];
    }
    while (v24);
  }
  long long v31 = [v5 orphanedParentsForDomain:kMCDMCertificateToPayloadUUIDDependencyKey];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v32 = [v31 countByEnumeratingWithState:&v106 objects:v124 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v107;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(void *)v107 != v34) {
          objc_enumerationMutation(v31);
        }
        [(MCInstaller *)self _removeOrphanedCertificateDependencyManager:v5 persistentID:*(void *)(*((void *)&v106 + 1) + 8 * (void)k) persona:0];
      }
      id v33 = [v31 countByEnumeratingWithState:&v106 objects:v124 count:16];
    }
    while (v33);
  }
  uint64_t v81 = v31;
  __int16 v36 = [v5 orphanedParentsForDomain:kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey];
  if ([v36 count])
  {
    uint64_t v37 = kMDMPersonaKey;
    uint64_t v38 = [v84 objectForKeyedSubscript:kMDMPersonaKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v39 = [v84 objectForKeyedSubscript:v37];
    }
    else
    {
      uint64_t v39 = 0;
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v40 = v36;
    id v41 = [v40 countByEnumeratingWithState:&v102 objects:v123 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v103;
      do
      {
        for (m = 0; m != v42; m = (char *)m + 1)
        {
          if (*(void *)v103 != v43) {
            objc_enumerationMutation(v40);
          }
          [(MCInstaller *)self _removeOrphanedCertificateDependencyManager:v5 persistentID:*(void *)(*((void *)&v102 + 1) + 8 * (void)m) persona:v39];
        }
        id v42 = [v40 countByEnumeratingWithState:&v102 objects:v123 count:16];
      }
      while (v42);
    }
  }
  id v80 = v36;
  id v45 = +[MCRestrictionManagerWriter sharedManager];
  [v45 removeOrphanedClientRestrictions];

  +[MCAirPlayPayloadHandler recomputeAirPlaySettings];
  [v5 orphanedParentsForDomain:kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v86 = (id)objc_claimAutoreleasedReturnValue();
  id v46 = [v86 countByEnumeratingWithState:&v98 objects:v122 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v99;
    uint64_t v49 = kMCAirPlayPasswordServiceKey;
    uint64_t v50 = kMCAppleKeychainGroup;
    do
    {
      for (n = 0; n != v47; n = (char *)n + 1)
      {
        if (*(void *)v99 != v48) {
          objc_enumerationMutation(v86);
        }
        uint64_t v52 = *(const void **)(*((void *)&v98 + 1) + 8 * (void)n);
        uint64_t v53 = _MCLogObjects[9];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          CFTypeRef v121 = v52;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Removing AirPlay password for device name %{public}@", buf, 0xCu);
        }
        +[MCKeychain removeItemForService:v49 account:v52 label:0 description:0 useSystemKeychain:1 group:v50];
      }
      id v47 = [v86 countByEnumeratingWithState:&v98 objects:v122 count:16];
    }
    while (v47);
  }
  uint64_t v54 = kMCDMFontURLToProfileIdentifierKey;
  uint64_t v55 = [v5 orphanedParentsForDomain:kMCDMFontURLToProfileIdentifierKey];
  unsigned int v85 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v55 count]);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v88 = v55;
  id v56 = [v88 countByEnumeratingWithState:&v94 objects:v119 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v95;
    do
    {
      for (ii = 0; ii != v57; ii = (char *)ii + 1)
      {
        if (*(void *)v95 != v58) {
          objc_enumerationMutation(v88);
        }
        uint64_t v60 = *(void *)(*((void *)&v94 + 1) + 8 * (void)ii);
        uint64_t v61 = [v5 dependentsOfParent:v60 inDomain:v54];
        id v62 = [v61 count];

        if (!v62)
        {
          uint64_t v63 = +[NSURL URLWithString:v60];
          int v64 = +[NSFileManager defaultManager];
          os_log_t v65 = [v63 path];
          unsigned int v66 = [v64 fileExistsAtPath:v65];

          if (v66)
          {
            uint64_t v67 = _MCLogObjects[9];
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              CFTypeRef v121 = v63;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Removing font at %{public}@", buf, 0xCu);
            }
            [v85 addObject:v63];
          }
        }
      }
      id v57 = [v88 countByEnumeratingWithState:&v94 objects:v119 count:16];
    }
    while (v57);
  }

  os_log_t v68 = _MCLogObjects[9];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    unsigned int v69 = v68;
    id v70 = [v88 count];
    *(_DWORD *)buf = 134217984;
    CFTypeRef v121 = v70;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Unregistering %lu fonts.", buf, 0xCu);
  }
  CFTypeRef cf = 0;
  GSFontUnregisterPersistentURLs();
  uint64_t v71 = _MCLogObjects[9];
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v121 = cf;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Results: %{public}@", buf, 0xCu);
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v72 = v85;
  id v73 = [v72 countByEnumeratingWithState:&v89 objects:v118 count:16];
  if (v73)
  {
    id v74 = v73;
    uint64_t v75 = *(void *)v90;
    do
    {
      for (jj = 0; jj != v74; jj = (char *)jj + 1)
      {
        if (*(void *)v90 != v75) {
          objc_enumerationMutation(v72);
        }
        uint64_t v77 = *(void *)(*((void *)&v89 + 1) + 8 * (void)jj);
        GSFontUnregisterURL();
        uint64_t v78 = +[NSFileManager defaultManager];
        [v78 removeItemAtURL:v77 error:0];
      }
      id v74 = [v72 countByEnumeratingWithState:&v89 objects:v118 count:16];
    }
    while (v74);
  }

  if (v82)
  {
    uint64_t v79 = _MCLogObjects[9];
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Fixing orphaned accounts...", buf, 2u);
    }
    +[MCAccountUtilities checkAccountConsistencyAndReleaseOrphanedAccounts];
  }
}

- (void)_removeOrphanedCertificateDependencyManager:(id)a3 persistentID:(id)a4 persona:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 dependentsOfParent:v9 inDomain:kMCDMCertificateToHostIdentifierDependencyKey];
  id v12 = [v11 count];

  if (!v12)
  {
    unsigned int v13 = [(MCInstaller *)self isCertificateReference:v9 aliasedInDependencyManager:v8];
    id v14 = _MCLogObjects[9];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping aliased certificate with persistent ID %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing certificate with persistent ID %{public}@", buf, 0xCu);
      }
      id v16 = +[NSData MCDataWithHexString:v9];
      id v17 = +[MCKeychain copyCertificateWithPersistentID:v16 useSystemKeychain:1];
      if (v17)
      {
        id v18 = v17;
        if (SecCertificateIsSelfSignedCA())
        {
          SecTrustStoreForDomain();
          SecTrustStoreRemoveCertificate();
        }
        CFRelease(v18);
      }
      if ([v10 length])
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000506A0;
        v20[3] = &unk_1000EAC80;
        id v21 = v16;
        id v19 = +[DMCPersonaHelper performBlockUnderPersona:v10 block:v20];
      }
      else
      {
        +[MCKeychain removeItemWithPersistentID:v16 useSystemKeychain:1];
      }
    }
  }
}

- (id)_managingProfileIdentifierForProfileIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[MCDependencyManager sharedManager];
  id v5 = [v4 dependentsOfParent:v3 inDomain:kMCDMManagedProfileToManagingProfileKey];

  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndex:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeAllProfilesFromInstallationQueue
{
}

- (id)_reallyRemoveInstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  unsigned int v13 = [(MCInstaller *)self _reallyRemoveProfileWithIdentifier:v12 installationType:a4 profileInstalled:1 targetDeviceType:+[MCProfile thisDeviceType] options:v11 source:v10];

  return v13;
}

- (id)_reallyRemoveProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 profileInstalled:(BOOL)a5 targetDeviceType:(unint64_t)a6 options:(id)a7 source:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  if (!v14)
  {
    id v30 = _MCLogObjects[5];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Profile identifier is nil.", buf, 2u);
    }
    goto LABEL_21;
  }
  if (v11)
  {
    uint64_t v17 = [(MCInstaller *)self pathToInstalledProfileByIdentifier:v14 installationType:a4];
    if (v17)
    {
      id v18 = (void *)v17;
      id v19 = +[NSData dataWithContentsOfFile:v17];
      if (!v19)
      {
        uint64_t v35 = _MCLogObjects[5];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Cannot load profile to uninstall.", buf, 2u);
        }
        id v27 = 0;
        uint64_t v56 = 0;
        int v28 = 0;
        id v29 = 0;
        char v57 = 1;
LABEL_30:

        [(MCInstaller *)self _cleanUpAfterRemovingProfileWithIdentifier:v14 installedForUser:a4 == 2 profileHandler:v29 oldRestrictions:v27];
        if (v28)
        {
          os_log_t v44 = _MCLogObjects[9];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            id v45 = v44;
            id v46 = [v29 profile];
            id v47 = [v46 identifier];
            *(_DWORD *)buf = 138543362;
            id v61 = v47;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Profile “%{public}@“ removed", buf, 0xCu);
          }
          if (v56) {
            notify_post((const char *)[MCDefaultsDidChangeNotification UTF8String]);
          }
          if (HIDWORD(v56)) {
            MDMSendDevicePostureChangedNotification();
          }
          uint64_t v48 = +[NSFileManager defaultManager];
          [v48 removeItemAtPath:v18 error:0];
        }
        char v33 = v57;
        if (a4 == 2) {
          goto LABEL_39;
        }
        goto LABEL_20;
      }
      id v59 = 0;
      id v20 = +[MCProfile profileWithData:v19 outError:&v59];
      id v21 = v59;
      uint64_t v54 = v21;
      uint64_t v55 = v20;
      if (v21)
      {
        uint64_t v22 = v21;
        os_log_t v23 = _MCLogObjects[5];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = v23;
          uint64_t v25 = [v22 MCVerboseDescription];
          *(_DWORD *)buf = 138543362;
          id v61 = v25;
          uint64_t v26 = "Cannot parse profile to uninstall. Error: %{public}@";
LABEL_8:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
        }
      }
      else
      {
        id v36 = [v20 createHandler];
        if (v36)
        {
          id v29 = v36;
          uint64_t v53 = v19;
          uint64_t v37 = +[MCRestrictionManager sharedManager];
          uint64_t v38 = [v37 currentRestrictions];
          id v27 = [v38 MCDeepCopy];

          os_log_t v39 = _MCLogObjects[5];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = v39;
            uint64_t v58 = [v29 profile];
            id v41 = [v58 identifier];
            *(_DWORD *)buf = 138543618;
            id v61 = v41;
            __int16 v62 = 2114;
            id v63 = v16;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Removing profile “%{public}@” on behalf of “%{public}@”...", buf, 0x16u);
          }
          [v29 removeWithInstaller:self options:v15];
          id v42 = objc_opt_new();
          uint64_t v43 = [v29 profile];
          [v42 addEventForProfile:v43 operation:@"remove" source:v16];

          LODWORD(v56) = [v55 containsPayloadOfClass:objc_opt_class()];
          HIDWORD(v56) = [v55 containsPayloadOfClass:objc_opt_class()];
          char v57 = 0;
          int v28 = 1;
          id v19 = v53;
          goto LABEL_29;
        }
        os_log_t v52 = _MCLogObjects[5];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          id v24 = v52;
          uint64_t v25 = [v20 friendlyName];
          *(_DWORD *)buf = 138543362;
          id v61 = v25;
          uint64_t v26 = "Cannot create handler for profile ‚“%{public}@”.";
          goto LABEL_8;
        }
      }
      id v27 = 0;
      uint64_t v56 = 0;
      int v28 = 0;
      id v29 = 0;
      char v57 = 1;
LABEL_29:

      goto LABEL_30;
    }
    goto LABEL_16;
  }
  uint64_t v31 = [(MCInstaller *)self pathToUninstalledProfileByIdentifier:v14 installationType:a4 targetDeviceType:a6];
  if (!v31)
  {
LABEL_16:
    id v32 = _MCLogObjects[5];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v61 = v14;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” is not installed. Ignoring.", buf, 0xCu);
    }
    if (v11)
    {
      [(MCInstaller *)self _cleanUpAfterRemovingProfileWithIdentifier:v14 installedForUser:a4 == 2 profileHandler:0 oldRestrictions:0];
      id v29 = 0;
      id v18 = 0;
      id v27 = 0;
      char v33 = 1;
      if (a4 == 2)
      {
LABEL_39:
        uint64_t v34 = +[MCManifest sharedManifest];
        [v34 removeIdentifierFromUserManifest:v14 flag:3];
LABEL_40:

        if ((v33 & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_41;
      }
LABEL_20:
      uint64_t v34 = +[MCManifest sharedManifest];
      [v34 removeIdentifierFromSystemManifest:v14 flag:3];
      goto LABEL_40;
    }
LABEL_21:
    id v27 = 0;
    id v18 = 0;
    id v29 = 0;
LABEL_41:
    uint64_t v49 = _MCLogObjects[5];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v61 = v14;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Removed profile “%{public}@” from manifest anyway", buf, 0xCu);
    }
    goto LABEL_43;
  }
  id v18 = (void *)v31;
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:a6])
  {
    [(MCInstaller *)self purgePurgatoryProfileWithIdentifier:v14 targetDevice:a6];
  }
  id v27 = 0;
  id v29 = 0;
LABEL_43:
  uint64_t v50 = [v29 profile];

  return v50;
}

- (void)_cleanUpAfterRemovingProfileWithIdentifier:(id)a3 installedForUser:(BOOL)a4 profileHandler:(id)a5 oldRestrictions:(id)a6
{
  BOOL v45 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  BOOL v11 = +[MCRestrictionManagerWriter sharedManager];
  id v12 = +[MCDependencyManager sharedManager];
  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    id v14 = [v11 currentRestrictions];
    id v13 = [v14 MCDeepCopy];
  }
  id v15 = [v11 systemProfileRestrictions];
  id v16 = [v15 MCMutableDeepCopy];

  uint64_t v17 = [v11 userProfileRestrictions];
  id v18 = [v17 MCMutableDeepCopy];

  if (v45) {
    id v19 = v18;
  }
  else {
    id v19 = v16;
  }
  [v19 removeObjectForKey:v8];
  id v20 = [v9 profile];
  id v21 = [v20 loggingID];
  os_log_t v44 = v18;
  [v11 setSystemProfileRestrictions:v16 userProfileRestrictions:v18 sender:v21 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAppWhitelistSettingsChanged:0 outRecomputedNag:0 outError:0];

  uint64_t v22 = [v11 currentRestrictions];
  [v9 didRemoveOldGlobalRestrictions:v13 newGlobalRestrictions:v22];

  uint64_t v23 = kMCDMManagingProfileToManagedProfileKey;
  id v24 = [v12 dependentsOfParent:v8 inDomain:kMCDMManagingProfileToManagedProfileKey];
  uint64_t v25 = kMCDMManagingProfileToProvisioningProfileKey;
  id v47 = [v12 dependentsOfParent:v8 inDomain:kMCDMManagingProfileToProvisioningProfileKey];
  if ([v24 count] || objc_msgSend(v47, "count"))
  {
    id v40 = v16;
    id v41 = v13;
    id v43 = v10;
    id v46 = v9;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    os_log_t v39 = v24;
    id v26 = [v24 copy];
    id v27 = [v26 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v53;
      uint64_t v30 = kMCDMManagedProfileToManagingProfileKey;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v26);
          }
          [v12 removeDependent:*(void *)(*((void *)&v52 + 1) + 8 * i) fromParent:v8 inDomain:v23 reciprocalDomain:v30 fromSystem:1 user:1];
        }
        id v28 = [v26 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v28);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v32 = [v47 copy];
    id v33 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
    id v16 = v40;
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v49;
      uint64_t v36 = kMCDMProvisioningProfileToManagingProfileKey;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          [v12 removeDependent:*(void *)(*((void *)&v48 + 1) + 8 * (void)j) fromParent:v8 inDomain:v25 reciprocalDomain:v36 fromSystem:1 user:1];
        }
        id v34 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v34);
    }

    id v9 = v46;
    id v13 = v41;
    id v10 = v43;
    id v24 = v39;
  }
  else
  {
    uint64_t v38 = [(MCInstaller *)self _managingProfileIdentifierForProfileIdentifier:v8];
    if (v38) {
      [v12 removeDependent:v8 fromParent:v38 inDomain:v23 reciprocalDomain:kMCDMManagedProfileToManagingProfileKey fromSystem:!v45];
    }
  }
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5
{
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v25 = +[MCDependencyManager sharedManager];
  [v25 commitChanges];
  id v13 = +[MCRestrictionManager sharedManager];
  id v14 = [v13 currentRestrictions];
  id v15 = [v14 MCDeepCopy];

  id v16 = [(MCInstaller *)self _reallyRemoveInstalledProfileWithIdentifier:v12 installationType:a4 options:v11 source:v10];

  uint64_t v17 = +[MCPayload accountPayloads];
  id v18 = [v17 setByAddingObject:objc_opt_class()];

  -[MCInstaller _removeOrphanedResourcesOptions:includingAccounts:](self, "_removeOrphanedResourcesOptions:includingAccounts:", v11, [v16 containsAnyPayloadOfClasses:v18]);
  id v19 = +[MCServerSideHacks sharedHacks];
  id v20 = +[MCRestrictionManager sharedManager];
  id v21 = [v20 effectiveUserSettings];
  [v19 recomputeHacksAfterProfileChangesEffectiveUserSettings:v21 sendNotifications:1];

  id v22 = [v19 recomputeAccountVPNAssociations];
  LODWORD(v20) = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:v15];
  uint64_t v23 = +[MCRestrictionManager sharedManager];
  id v24 = [v23 currentRestrictions];
  LODWORD(v21) = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:v24];

  if (v20 != v21) {
    MCSendWebContentFilterUIActiveChangedNotification();
  }
  [v25 commitChanges];
  MCSendProfileListChangedNotification();
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5
{
  id v12 = a3;
  id v8 = +[MCHoldingTankManifest sharedManifest];
  id v9 = [v8 uninstalledProfileDataWithIdentifier:v12 targetDevice:a5];

  id v10 = +[MCProfile profileWithData:v9 outError:0];
  sub_1000807D8(v10);
  id v11 = [(MCInstaller *)self _reallyRemoveProfileWithIdentifier:v12 installationType:a4 profileInstalled:0 targetDeviceType:a5 options:0 source:@"Uninstalled Profile Removal"];
  MCSendProfileListChangedNotification();
}

- (void)removeManagedProfilesIfNecessary
{
  id v3 = +[MCDependencyManager sharedManager];
  id v4 = [v3 parentsInDomain:kMCDMManagingProfileToManagedProfileKey];
  id v8 = [v4 firstObject];

  id v5 = v8;
  if (v8)
  {
    uint64_t v6 = +[MCManifest sharedManifest];
    id v7 = [v6 installedSystemProfileWithIdentifier:v8];

    if (!v7) {
      [(MCInstaller *)self removeProfileWithIdentifier:v8 installationType:1 source:@"Managed Profile Removal"];
    }

    id v5 = v8;
  }
}

- (id)removeProvisioningProfileUUID:(id)a3 sender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MCInstaller removing provisioning profile UUID %{public}@ on behalf of %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = MISRemoveProvisioningProfile();
  if (v8)
  {
    id v9 = +[NSNumber numberWithInt:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)verifiedMDMProfileIdentifierWithCleanUp
{
  id v3 = _MCLogObjects[9];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MCInstaller checking for MDM installation...", buf, 2u);
  }
  id v4 = +[MCManifest sharedManifest];
  id v5 = [v4 identifiersOfProfilesWithFilterFlags:3];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  id v28 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v28)
  {

LABEL_23:
    uint64_t v17 = _MCLogObjects[9];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "MCInstaller could not find an MDM installation. Removing MDM-related files...", buf, 2u);
    }
    id v18 = +[NSFileManager defaultManager];
    id v19 = MDMFilePath();
    [v18 removeItemAtPath:v19 error:0];

    id v20 = MDMOutstandingActivitiesFilePath();
    [v18 removeItemAtPath:v20 error:0];

    id v21 = MDMUserFilePath();
    [v18 removeItemAtPath:v21 error:0];

    id v22 = MDMUserOutstandingActivitiesFilePath();
    [v18 removeItemAtPath:v22 error:0];

    [(MCInstaller *)self removeManagedProfilesIfNecessary];
    uint64_t v23 = +[MDMConfiguration sharedConfiguration];
    [v23 refreshDetailsFromDisk];

    MDMSendManagingOrgInfoChangedNotification();
    id v7 = 0;
    goto LABEL_26;
  }
  id v26 = self;
  id v7 = 0;
  uint64_t v27 = *(void *)v34;
  do
  {
    for (i = 0; i != v28; i = (char *)i + 1)
    {
      if (*(void *)v34 != v27) {
        objc_enumerationMutation(v6);
      }
      id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v10 = +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v9, v26);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      int v11 = [v10 payloads];
      id v12 = (char *)[v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v12)
      {
        __int16 v13 = v12;
        uint64_t v14 = *(void *)v30;
        while (2)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v9;

              id v7 = v16;
              goto LABEL_18;
            }
          }
          __int16 v13 = (char *)[v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
    id v28 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  }
  while (v28);

  self = v26;
  if (!v7) {
    goto LABEL_23;
  }
LABEL_26:
  id v24 = _MCLogObjects[9];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "MCInstaller finished checking for MDM installation", buf, 2u);
  }

  return v7;
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  long long v48 = (void (**)(id, id))a3;
  id v3 = _MCLogObjects[9];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recomputing profile restrictions...", buf, 2u);
  }
  long long v50 = +[NSMutableDictionary dictionary];
  id v47 = +[NSMutableDictionary dictionary];
  long long v49 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = +[MCManifest sharedManifest];
  id v6 = [v5 allInstalledProfileIdentifiers];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v66;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v66 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v12 = sub_1000457EC();
        __int16 v13 = [v11 MCHashedFilenameWithExtension:@"stub"];
        uint64_t v14 = [v12 stringByAppendingPathComponent:v13];

        [v4 setObject:v14 forKey:v11];
      }
      id v8 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v8);
  }

  id v15 = +[MCManifest sharedManifest];
  id v16 = [v15 allInstalledUserProfileIdentifiers];

  long long v64 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  id v51 = v16;
  id v17 = [v51 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v62;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v51);
        }
        id v21 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
        id v22 = sub_10004579C();
        uint64_t v23 = [v21 MCHashedFilenameWithExtension:@"stub"];
        id v24 = [v22 stringByAppendingPathComponent:v23];

        [v4 setObject:v24 forKey:v21];
      }
      id v18 = [v51 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v18);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v25 = v4;
  id v26 = [v25 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v26)
  {
    id v27 = v26;
    id v28 = 0;
    uint64_t v53 = *(void *)v58;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * (void)k);
        long long v31 = [v25 objectForKey:v30];
        long long v32 = +[NSData dataWithContentsOfFile:v31];
        if (v32)
        {
          id v56 = v28;
          long long v33 = +[MCProfile profileWithData:v32 outError:&v56];
          id v34 = v56;

          if (v34)
          {
            os_log_t v35 = _MCLogObjects[9];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              long long v36 = v35;
              uint64_t v37 = [v34 MCVerboseDescription];
              *(_DWORD *)buf = 138543618;
              uint64_t v70 = v30;
              __int16 v71 = 2114;
              id v72 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Error parsing stub for profile ID %{public}@. Error:%{public}@", buf, 0x16u);
            }
          }
          else
          {
            id v55 = 0;
            os_log_t v39 = [v33 restrictionsWithHeuristicsAppliedOutError:&v55];
            id v34 = v55;
            id v40 = [v33 identifier];
            if (v39) {
              [v50 setObject:v39 forKey:v40];
            }
            else {
              [v50 removeObjectForKey:v40];
            }

            id v41 = [v33 appAccessibilityParameters];
            if (v41) {
              [v49 addEntriesFromDictionary:v41];
            }
          }
          id v28 = v34;
        }
        else
        {
          uint64_t v38 = _MCLogObjects[9];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v70 = v30;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Can't read stub for profile ID %{public}@", buf, 0xCu);
          }
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v27);
  }
  else
  {
    id v28 = 0;
  }

  id v42 = MCSystemAppAccessibilityParametersFilePath();
  [v49 MCWriteToBinaryFile:v42];

  id v43 = +[MCRestrictionManagerWriter sharedManager];
  id v54 = 0;
  [v43 setSystemProfileRestrictions:v50 userProfileRestrictions:v47 sender:@"MCInstaller.RecomputeProfileRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAppWhitelistSettingsChanged:0 outRecomputedNag:0 outError:&v54];
  id v44 = v54;
  BOOL v45 = +[MCServerSideHacks sharedHacks];
  id v46 = [v43 effectiveUserSettings];
  [v45 recomputeHacksAfterProfileChangesEffectiveUserSettings:v46 sendNotifications:1];

  if (v48) {
    v48[2](v48, v44);
  }
}

+ (void)_setPathsSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_100105978;
  qword_100105978 = (uint64_t)v5;
  id v9 = v5;

  id v8 = (void *)qword_100105980;
  qword_100105980 = (uint64_t)v6;
}

+ (id)_installationFailureErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:ACErrorDomain]) {
    [v3 code];
  }

  id v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCInstallationErrorDomain, 4001, v5, v3, MCErrorTypeFatal, 0);

  return v6;
}

- (id)_installedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[MCManifest sharedManifest];
  id v7 = v6;
  if (a4 == 2)
  {
    id v8 = [v6 identifiersOfProfilesWithFilterFlags:9];

    if ([v8 containsObject:v5])
    {
      uint64_t v9 = sub_10004579C();
LABEL_6:
      id v10 = (void *)v9;
      int v11 = [v5 MCHashedFilenameWithExtension:@"stub"];
      id v12 = [v10 stringByAppendingPathComponent:v11];

      goto LABEL_8;
    }
  }
  else
  {
    id v8 = [v6 identifiersOfProfilesWithFilterFlags:19];

    if ([v8 containsObject:v5])
    {
      uint64_t v9 = sub_1000457EC();
      goto LABEL_6;
    }
  }
  id v12 = 0;
LABEL_8:

  if (v12)
  {
    __int16 v13 = +[NSData dataWithContentsOfFile:v12];
    uint64_t v14 = +[MCProfile profileWithData:v13 outError:0];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_sendMDMEnrollmentEventWithInstallationOptions:(id)a3
{
  id v3 = a3;
  id v9 = +[MDMCloudConfiguration sharedConfiguration];
  id v4 = +[MDMConfiguration sharedConfiguration];
  [v9 refreshDetailsFromDisk];
  [v4 refreshDetailsFromDisk];
  [v9 isSupervised];
  [v9 isTeslaEnrolled];
  if ([v9 userMode] != 1) {
    +[DMCMultiUserModeUtilities isSharediPad];
  }
  [v4 personaID];

  [v4 isUserEnrollment];
  id v5 = [v4 enrollmentMode];
  if (([v5 isEqualToString:kMDMEnrollmentModeBYOD] & 1) == 0)
  {
    id v6 = [v4 enrollmentMode];
    [v6 isEqualToString:kMDMEnrollmentModeADDE];
  }
  id v7 = [v3 objectForKeyedSubscript:kMCInstallProfileOptionInstallationSource];
  [v7 isEqualToString:kDMCProfileInstallationSourceReturnToService];

  id v8 = [v3 objectForKeyedSubscript:kMCInstallProfileOptionIsESSOEnrollment];

  [v8 BOOLValue];
  DMCAnalyticsSendEnrollmentEvent();
}

- (void)_checkinWithMdmd
{
  uint64_t v2 = _MCLogObjects[9];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking in with mdmd...", buf, 2u);
  }
  *(void *)buf = 0;
  __int16 v13 = buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = +[MDMClient sharedClient];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100052860;
  v9[3] = &unk_1000EB5F0;
  int v11 = buf;
  id v5 = v3;
  id v10 = v5;
  [v4 touchWithCompletion:v9];

  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v5, v6);
  if (!v13[24])
  {
    id v7 = _MCLogObjects[9];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "mdmd didn't respond within 30 seconds, give up waiting.", v8, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

+ (id)considerProfilesInstalledDuringBuddyForManagement
{
  uint64_t v2 = +[MDMCloudConfiguration sharedConfiguration];
  if ([v2 isTeslaEnrolled]) {
    unsigned int v3 = [v2 isSupervised];
  }
  else {
    unsigned int v3 = 0;
  }
  id v4 = MDMFilePath();
  id v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];

  if (v5)
  {
    dispatch_time_t v6 = [v5 objectForKeyedSubscript:kMDMManagingProfileIdentifierKey];
  }
  else
  {
    dispatch_time_t v6 = 0;
  }
  id v7 = +[MCPayload mdmAdoptablePayloads];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v8 = objc_opt_new();
  if (v3 && [v6 length])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100052AF4;
    v17[3] = &unk_1000EBD30;
    id v9 = v6;
    id v18 = v9;
    id v19 = v7;
    id v10 = objc_retainBlock(v17);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100052BB8;
    v13[3] = &unk_1000EBD58;
    id v14 = v9;
    id v15 = v8;
    id v16 = &v20;
    +[MCInstaller _enumerateProfilesWithCriteria:v10 filterFlags:17 block:v13];
  }
  if (*((unsigned char *)v21 + 24))
  {
    int v11 = +[MCDependencyManager sharedManager];
    [v11 commitChanges];
  }
  _Block_object_dispose(&v20, 8);

  return v8;
}

+ (void)_enumerateProfilesWithCriteria:(id)a3 filterFlags:(int)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = (unsigned int (**)(id, void *))a3;
  id v8 = a5;
  id v9 = (unsigned int (**)(void, void))v8;
  if (v7 && v8)
  {
    id v10 = +[MCManifest sharedManifest];
    int v11 = [v10 identifiersOfProfilesWithFilterFlags:v6];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v19 = +[MCManifest sharedManifest];
          uint64_t v20 = [v19 installedProfileWithIdentifier:v17];

          if (v20 && v7[2](v7, v20) && !((unsigned int (**)(void, void *))v9)[2](v9, v20))
          {

            goto LABEL_15;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

- (BOOL)sendPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  [(MCInstaller *)self _replacePurgatoryProfilesForTargetDevice:a5];
  id v12 = +[MCHoldingTankManifest sharedManifest];
  id v18 = 0;
  unsigned __int8 v13 = [v12 addPurgatoryProfileData:v10 identifier:v11 targetDevice:a5 outError:&v18];

  id v14 = v18;
  if (v13)
  {
    [(MCInstaller *)self _postPurgatoryFollowUpForProfileData:v10 targetDevice:a5];
    MCSendProfileListChangedNotification();
  }
  else if (a6)
  {
    uint64_t v15 = MCInstallationErrorDomain;
    id v16 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v15, 4043, v16, v14, MCErrorTypeFatal, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (void)_postPurgatoryFollowUpForProfileData:(id)a3 targetDevice:(unint64_t)a4
{
  id v36 = 0;
  uint64_t v6 = +[MCProfile profileWithData:a3 outError:&v36];
  id v7 = v36;
  if (v7)
  {
    id v8 = v7;
    id v9 = _MCLogObjects[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Profile purgatory followUp failed to create MCProfile with error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    sub_1000806EC(v6);
    id v10 = [(MCInstaller *)self followUpController];
    id v35 = 0;
    unsigned __int8 v11 = [v10 clearPendingFollowUpItems:&v35];
    id v12 = v35;

    if ((v11 & 1) == 0)
    {
      unsigned __int8 v13 = _MCLogObjects[9];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Profile purgatory followUp failed to clear pending followUp items with error: %{public}@", buf, 0xCu);
      }
    }
    id v14 = objc_opt_new();
    uint64_t v15 = objc_opt_new();
    if ([v6 isUserEnrollmentProfile])
    {
      uint64_t v30 = [v6 organization];
      id v16 = MCLocalizedFormat();

      uint64_t v17 = &kMCSettingsURLOnsiteProfileInstallation;
    }
    else
    {
      id v16 = MCLocalizedString();
      uint64_t v17 = &kMCSettingsURLProfilePurgatoryInstallation;
    }
    id v18 = +[NSURL URLWithString:](NSURL, "URLWithString:", *v17, v30);
    [v14 setUrl:v18];

    id v19 = MCLocalizedString();
    [v14 setLabel:v19];

    [v15 setTitle:v16];
    [v15 setDisplayStyle:18];
    uint64_t v37 = v14;
    uint64_t v20 = +[NSArray arrayWithObjects:&v37 count:1];
    [v15 setActions:v20];

    [v15 setGroupIdentifier:FLGroupIdentifierDevice];
    [v15 setUniqueIdentifier:@"com.apple.managedconfiguration.ios-purgatory"];
    long long v21 = [(MCInstaller *)self followUpController];
    id v34 = v12;
    unsigned __int8 v22 = [v21 postFollowUpItem:v15 error:&v34];
    id v8 = v34;

    if ((v22 & 1) == 0)
    {
      long long v23 = _MCLogObjects[9];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Profile purgatory followUp failed to post with error: %{public}@", buf, 0xCu);
      }
    }
    long long v24 = [(MCInstaller *)self purgatoryTimer];
    [v24 invalidate];

    id v25 = objc_alloc((Class)NSTimer);
    id v26 = +[NSDate dateWithTimeIntervalSinceNow:480.0];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000534B0;
    v31[3] = &unk_1000EBDA8;
    v31[4] = self;
    id v32 = v6;
    unint64_t v33 = a4;
    id v27 = [v25 initWithFireDate:v26 interval:0 repeats:v31 block:0.0];
    [(MCInstaller *)self setPurgatoryTimer:v27];

    id v28 = +[NSRunLoop mainRunLoop];
    long long v29 = [(MCInstaller *)self purgatoryTimer];
    [v28 addTimer:v29 forMode:NSRunLoopCommonModes];
  }
}

- (void)_replacePurgatoryProfilesForTargetDevice:(unint64_t)a3
{
  id v4 = +[MCHoldingTankManifest sharedManifest];
  id v5 = [v4 uninstalledProfileIdentifiersForDevice:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unsigned __int8 v11 = [v4 uninstalledProfileDataWithIdentifier:v10 targetDevice:a3];
        id v12 = +[MCProfile profileWithData:v11 outError:0];
        unsigned __int8 v13 = v12;
        if (v12) {
          sub_1000807D8(v12);
        }
        [v4 removeProfileDataWithIdentifier:v10 fromHoldingTankForDevice:a3];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)purgePurgatoryProfilesForTargetDevice:(unint64_t)a3
{
  id v4 = _MCLogObjects[9];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Purging purgatory profiles", buf, 2u);
  }
  id v5 = +[MCHoldingTankManifest sharedManifest];
  id v6 = [v5 uninstalledProfileIdentifiersForDevice:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = _MCLogObjects[9];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purging purgatory profile data for identifier: %@", buf, 0xCu);
        }
        [v5 removeProfileDataWithIdentifier:v11 fromHoldingTankForDevice:a3];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
  -[MCInstaller _purgatoryWorkerQueue_didPurgePurgatory:](self, "_purgatoryWorkerQueue_didPurgePurgatory:", [v6 count] != 0);
}

- (void)purgePurgatoryProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[MCHoldingTankManifest sharedManifest];
  id v8 = [v7 uninstalledProfileIdentifiersForDevice:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 isEqualToString:v6])
        {
          [v7 removeProfileDataWithIdentifier:v13 fromHoldingTankForDevice:a4];
          purgatoryWorkerQueue = self->_purgatoryWorkerQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100053A98;
          block[3] = &unk_1000EAC80;
          block[4] = self;
          dispatch_sync((dispatch_queue_t)purgatoryWorkerQueue, block);
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_purgatoryWorkerQueue_didPurgePurgatory:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MCInstaller *)self purgatoryTimer];
  [v5 invalidate];

  [(MCInstaller *)self setPurgatoryTimer:0];
  id v6 = _MCLogObjects[9];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Profile purgatory clearing pending follow up items...", buf, 2u);
    }
    id v8 = [(MCInstaller *)self followUpController];
    id v12 = 0;
    unsigned __int8 v9 = [v8 clearPendingFollowUpItems:&v12];
    id v10 = v12;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = _MCLogObjects[9];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Profile purgatory failed to clear pending follow up items with error: %@", buf, 0xCu);
      }
    }

    MCSendProfileListChangedNotification();
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Profile purgatory is empty - skipping call to clear pending follow up items.", buf, 2u);
  }
}

- (id)peekPurgatoryProfileDataForTargetDevice:(unint64_t)a3
{
  id v4 = +[MCHoldingTankManifest sharedManifest];
  id v5 = [v4 uninstalledProfileIdentifiersForDevice:a3];
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    BOOL v7 = [v4 uninstalledProfileDataWithIdentifier:v6 targetDevice:a3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCertificateReference:(id)a3 aliasedInDependencyManager:(id)a4
{
  id v5 = a4;
  id v6 = +[NSData MCDataWithHexString:a3];
  BOOL v7 = +[MCKeychain canonicalPersistentReferenceForItemWithPersistentReference:v6 inSystemKeychain:1];
  id v8 = [v5 parentsInDomain:kMCDMCertificateToPayloadUUIDDependencyKey];
  unsigned __int8 v9 = +[NSSet setWithArray:v8];

  id v10 = [v7 MCHexString];
  if ([v9 containsObject:v10])
  {
    os_log_t v11 = _MCLogObjects[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      unsigned __int8 v13 = [v6 MCHexString];
      id v14 = [v7 MCHexString];
      *(_DWORD *)buf = 138543618;
      id v36 = v13;
      __int16 v37 = 2114;
      uint64_t v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Certificate ID %{public}@ is aliased to canonical ID %{public}@, which is still referenced.", buf, 0x16u);
    }
    BOOL v15 = 1;
  }
  else
  {
    id v28 = v10;
    id v29 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v9;
    id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      while (2)
      {
        uint64_t v20 = 0;
        long long v21 = v7;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          unsigned __int8 v22 = +[NSData MCDataWithHexString:](NSData, "MCDataWithHexString:", *(void *)(*((void *)&v30 + 1) + 8 * (void)v20), v28, v29, (void)v30);
          BOOL v7 = +[MCKeychain canonicalPersistentReferenceForItemWithPersistentReference:v22 inSystemKeychain:1];

          if ([v7 isEqualToData:v6])
          {
            os_log_t v23 = _MCLogObjects[9];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              long long v24 = v23;
              id v25 = [v6 MCHexString];
              id v26 = [v7 MCHexString];
              *(_DWORD *)buf = 138543618;
              id v36 = v25;
              __int16 v37 = 2114;
              uint64_t v38 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Certificate ID %{public}@ is aliased to non-canonical ID %{public}@, which is still referenced.", buf, 0x16u);
            }
            BOOL v15 = 1;
            goto LABEL_17;
          }

          uint64_t v20 = (char *)v20 + 1;
          long long v21 = v7;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    BOOL v15 = 0;
LABEL_17:
    id v10 = v28;
    id v5 = v29;
  }

  return v15;
}

- (NSMutableDictionary)setAsideAccountIdentifiersByPayloadClass
{
  return self->_setAsideAccountIdentifiersByPayloadClass;
}

- (void)setSetAsideAccountIdentifiersByPayloadClass:(id)a3
{
}

- (NSMutableDictionary)setAsideDictionariesByPayloadClass
{
  return self->_setAsideDictionariesByPayloadClass;
}

- (void)setSetAsideDictionariesByPayloadClass:(id)a3
{
}

- (NSTimer)purgatoryTimer
{
  return self->_purgatoryTimer;
}

- (void)setPurgatoryTimer:(id)a3
{
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_purgatoryTimer, 0);
  objc_storeStrong((id *)&self->_setAsideDictionariesByPayloadClass, 0);
  objc_storeStrong((id *)&self->_setAsideAccountIdentifiersByPayloadClass, 0);
  objc_storeStrong((id *)&self->_currentlyInstallingRestrictions, 0);
  objc_storeStrong((id *)&self->_purgatoryWorkerQueue, 0);

  objc_storeStrong((id *)&self->_queuedProfiles, 0);
}

@end