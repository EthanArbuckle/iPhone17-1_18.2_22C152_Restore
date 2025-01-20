@interface MCProfileServicer
- (BOOL)isCloudLockedProfileWithIdentifier:(id)a3;
- (BOOL)remoteProcessCanRemoveProfilesOutError:(id *)a3;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3 error:(id *)a4;
- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4;
- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4 error:(id *)a5;
- (NSXPCConnection)xpcConnection;
- (id)_invalidValue:(id)a3 forArgument:(id)a4;
- (id)_missingWatchMDMEnrollmentEntitlementError;
- (id)lacksArrayEntitlementError:(id)a3 withMemberString:(id)a4;
- (id)lacksBooleanEntitlementError:(id)a3;
- (id)prefixedFeaturePromptIdentifierForIdentifier:(id)a3;
- (id)remoteProcessBundleID;
- (id)remoteProcessEntitlementStringArrayForKey:(id)a3;
- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 completion:(id)a4;
- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6;
- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)appleConnect_installMDMAssociatedProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4;
- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 completion:(id)a10;
- (void)areBundlesBlocked:(id)a3 completion:(id)a4;
- (void)cancelFeaturePromptWithIdentifier:(id)a3 completion:(id)a4;
- (void)changePasscode:(id)a3 oldPasscode:(id)a4 isRecovery:(BOOL)a5 skipRecovery:(BOOL)a6 completion:(id)a7;
- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4;
- (void)checkInWithCompletion:(id)a3;
- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 completion:(id)a5;
- (void)clearRecoveryPasscodeWithCompletion:(id)a3;
- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4;
- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4;
- (void)createActivationLockBypassCodeWithCompletion:(id)a3;
- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4;
- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7;
- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)effectiveBoolValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)effectiveValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)effectiveValuesForWatchIntersectionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)effectiveValuesForWatchUnionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)hasMailAccountsWithFilteringEnabled:(BOOL)a3 sourceAccountManagement:(int)a4 completion:(id)a5;
- (void)installProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5;
- (void)isBundleBlocked:(id)a3 completion:(id)a4;
- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4;
- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4;
- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3;
- (void)managedWiFiNetworkNamesWithCompletion:(id)a3;
- (void)managingOrganizationInformationWithCompletion:(id)a3;
- (void)markStoredProfileAsInstalledWithCompletion:(id)a3;
- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4;
- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5;
- (void)monitorEnrollmentStateWithPersonaID:(id)a3;
- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3;
- (void)notifyDeviceUnlockedWithCompletion:(id)a3;
- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4;
- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4;
- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5;
- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4;
- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3;
- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4;
- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7;
- (void)recomputePerClientUserComplianceWithCompletion:(id)a3;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)recomputeUserComplianceWarningWithCompletion:(id)a3;
- (void)reducedMachineInfoDataWithCompletion:(id)a3;
- (void)removeBoolSetting:(id)a3 completion:(id)a4;
- (void)removeExpiredProfilesWithCompletion:(id)a3;
- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3;
- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeProtectedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5;
- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6;
- (void)removeValueSetting:(id)a3 completion:(id)a4;
- (void)rereadManagedAppAttributesWithCompletion:(id)a3;
- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4;
- (void)resetPasscodeMetadataWithCompletion:(id)a3;
- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3;
- (void)setAllowedURLStrings:(id)a3 completion:(id)a4;
- (void)setAutoCorrectionAllowed:(BOOL)a3 completion:(id)a4;
- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 completion:(id)a4;
- (void)setKeyboardShortcutsAllowed:(BOOL)a3 completion:(id)a4;
- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 completion:(id)a9;
- (void)setPredictiveKeyboardAllowed:(BOOL)a3 completion:(id)a4;
- (void)setSmartPunctuationAllowed:(BOOL)a3 completion:(id)a4;
- (void)setSpellCheckAllowed:(BOOL)a3 completion:(id)a4;
- (void)setUserBookmarks:(id)a3 completion:(id)a4;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 completion:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)setupAssistantDidFinishCompletion:(id)a3;
- (void)showFeaturePromptForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 promptIdentifier:(id)a6 completion:(id)a7;
- (void)shutDownWithCompletion:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)storeActivationRecord:(id)a3 completion:(id)a4;
- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5;
- (void)storeProfileData:(id)a3 completion:(id)a4;
- (void)storedProfileDataWithCompletion:(id)a3;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
- (void)updateProfileIdentifier:(id)a3 interactive:(BOOL)a4 completion:(id)a5;
- (void)validateAppBundleIDs:(id)a3 completion:(id)a4;
- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3;
- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4;
@end

@implementation MCProfileServicer

- (void)checkInWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[MCProfileServiceServer sharedServer];
  v6 = [v5 connectionTracker];
  v7 = [(MCProfileServicer *)self xpcConnection];
  [v6 trackRequestFromPID:[v7 processIdentifier]];

  id v8 = +[MCProfileServiceServer sharedServer];
  [v8 checkInWithCompletion:v4];
}

- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[MCProfileServiceServer sharedServer];
  [v6 checkCarrierProfileAndForceReinstallation:v4 completion:v5];
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[MCProfileServiceServer sharedServer];
  [v6 waitForMigrationIncludingPostRestoreMigration:v4 completion:v5];
}

- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[MCProfileServiceServer sharedServer];
  [v4 notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:v3];
}

- (void)notifyDeviceUnlockedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[MCProfileServiceServer sharedServer];
  [v4 notifyDeviceUnlockedWithCompletion:v3];
}

- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[MCProfileServiceServer sharedServer];
  [v12 allowedOpenInAppBundleIDs:v11 originatingAppBundleID:v10 originatingIsManaged:v6 completion:v9];
}

- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[MCProfileServiceServer sharedServer];
  [v12 allowedImportFromAppBundleIDs:v11 importingAppBundleID:v10 importingIsManaged:v6 completion:v9];
}

- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[MCProfileServiceServer sharedServer];
  [v10 defaultAppBundleIDForCommunicationServiceType:v9 forAccountWithIdentifier:v8 completion:v7];
}

- (void)setAutoCorrectionAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MCProfileServicer *)self xpcConnection];
  id v8 = [v7 processIdentifier];

  id v10 = +[MCProfileServiceServer sharedServer];
  id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v10 setAutoCorrectionAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setSmartPunctuationAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MCProfileServicer *)self xpcConnection];
  id v8 = [v7 processIdentifier];

  id v10 = +[MCProfileServiceServer sharedServer];
  id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v10 setSmartPunctuationAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MCProfileServicer *)self xpcConnection];
  id v8 = [v7 processIdentifier];

  id v10 = +[MCProfileServiceServer sharedServer];
  id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v10 setPredictiveKeyboardAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MCProfileServicer *)self xpcConnection];
  id v8 = [v7 processIdentifier];

  id v10 = +[MCProfileServiceServer sharedServer];
  id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v10 setContinuousPathKeyboardAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MCProfileServicer *)self xpcConnection];
  id v8 = [v7 processIdentifier];

  id v10 = +[MCProfileServiceServer sharedServer];
  id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v10 setKeyboardShortcutsAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setSpellCheckAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MCProfileServicer *)self xpcConnection];
  id v8 = [v7 processIdentifier];

  id v10 = +[MCProfileServiceServer sharedServer];
  id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v10 setSpellCheckAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setAllowedURLStrings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MCProfileServicer *)self xpcConnection];
  id v9 = [v8 processIdentifier];

  id v11 = +[MCProfileServiceServer sharedServer];
  id v10 = [(MCProfileServicer *)self remoteProcessBundleID];
  [v11 setAllowedURLStrings:v7 senderPID:v9 sender:v10 completion:v6];
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MCProfileServicer.m" lineNumber:215 description:@"Improper use. Entitlement required for call"];
  }
  id v6 = [(MCProfileServicer *)self xpcConnection];
  id v7 = [v6 valueForEntitlement:v5];

  BOOL v8 = 0;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue]) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (id)remoteProcessEntitlementStringArrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MCProfileServicer *)self xpcConnection];
  id v6 = [v5 valueForEntitlement:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    BOOL v8 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v12 = 0;
            goto LABEL_14;
          }
        }
        id v9 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v12 = v7;
LABEL_14:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [(MCProfileServicer *)self remoteProcessEntitlementStringArrayForKey:v7];
    uint64_t v10 = v9;
    if (v8)
    {
      unsigned __int8 v11 = [v9 containsObject:v8];
    }
    else if (v9)
    {
      id v12 = _MCLogObjects[2];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No containing string demanded from process with array entitlement %{public}@. Granting entitlement since array is present.", (uint8_t *)&v15, 0xCu);
      }
      unsigned __int8 v11 = 1;
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    long long v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MCProfileServicer.m" lineNumber:252 description:@"Improper use. No array entitlement demanded from process."];

    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)remoteProcessBundleID
{
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = [(MCProfileServicer *)self xpcConnection];
  id v3 = v2;
  if (v2)
  {
    [v2 auditToken];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }

  id v4 = MCBundleIDFromAuditToken();
  if (!v4)
  {
    id v5 = _MCLogObjects[2];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "The process XPC-ing to profiled is missing an application-identifier entitlement. Check client logs from the ManagedConfiguration framework for a log fault.", v7, 2u);
    }
  }

  return v4;
}

- (id)lacksBooleanEntitlementError:(id)a3
{
  uint64_t v3 = MCXPCErrorDomain;
  id v4 = MCErrorArray();
  id v5 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 39000, v4, MCErrorTypeFatal, a3, 0);

  return v5;
}

- (id)lacksArrayEntitlementError:(id)a3 withMemberString:(id)a4
{
  uint64_t v4 = MCXPCErrorDomain;
  id v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 39000, v5, MCErrorTypeFatal, a3, a4, 0);

  return v6;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:v6]
    && ![(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled-access"])
  {
    id v7 = [(MCProfileServicer *)self lacksBooleanEntitlementError:v6];
    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v7 = 0;
  BOOL v8 = 1;
  if (a4) {
LABEL_4:
  }
    *a4 = v7;
LABEL_5:

  return v8;
}

- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(MCProfileServicer *)self remoteProcessHasEntitlementArray:v8 containingString:v9]&& ![(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled-access"])
  {
    uint64_t v10 = [(MCProfileServicer *)self lacksArrayEntitlementError:v8 withMemberString:v9];
    BOOL v11 = 0;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v10 = 0;
  BOOL v11 = 1;
  if (a5) {
LABEL_4:
  }
    *a5 = v10;
LABEL_5:

  return v11;
}

- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id, void))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled-access" error:&v8];
  id v6 = v8;
  if (v5)
  {
    id v7 = +[MCProfileServiceServer sharedServer];
    [v7 verifiedMDMProfileIdentifierWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6, 0);
  }
}

- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  if ([(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.profile-list-read"])
  {
    id v8 = 0;
  }
  else
  {
    id v13 = 0;
    unsigned __int8 v9 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"Inspection" error:&v13];
    id v8 = v13;
    if ((v9 & 1) == 0)
    {
      if (v7) {
        v7[2](v7, v8, 0);
      }
      goto LABEL_11;
    }
  }
  if (v6)
  {
    uint64_t v10 = +[MCManifest sharedManifest];
    BOOL v11 = [v10 allInstalledProfileIdentifiers];
    id v12 = [v11 containsObject:v6];

    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v12 = 0;
  if (v7) {
LABEL_8:
  }
    ((void (**)(id, id, id))v7)[2](v7, 0, v12);
LABEL_11:
}

- (void)installProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  if (v8)
  {
    v34 = 0;
    unsigned __int8 v13 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"CustomUIInstallation" error:&v34];
    long long v14 = v34;
  }
  else
  {
    v33 = 0;
    unsigned __int8 v13 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"SilentNonUIInstallation" error:&v33];
    long long v14 = v33;
  }
  id v15 = v14;
  if (v13)
  {
    id v16 = [v11 objectForKey:kMCInstallProfileOptionFilterFlag];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 integerValue] == (id)2)
    {
      id v32 = v15;
      unsigned __int8 v17 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"CarrierInstallation" error:&v32];
      id v18 = v32;

      if ((v17 & 1) == 0)
      {
        if (v12) {
          v12[2](v12, 0, v18);
        }
LABEL_21:

        id v15 = v18;
        goto LABEL_22;
      }
    }
    else
    {
      id v18 = v15;
    }
    id v19 = v11;
    v20 = [(MCProfileServicer *)self remoteProcessBundleID];
    v30 = v16;
    id v21 = v10;
    id v22 = v18;
    if (v20)
    {
      id v23 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v19];
      [v23 setObject:v20 forKey:kMCInstallProfileOptionInstalledBy];
      id v24 = [v23 copy];

      id v19 = v24;
    }
    else
    {
      v25 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process. Not marking profile's installer.", buf, 2u);
      }
    }
    if (v8)
    {
      v26 = [MCInteractionClient alloc];
      v27 = [(MCProfileServicer *)self xpcConnection];
      v28 = [(MCInteractionClient *)v26 initWithXPCClientConnection:v27];
    }
    else
    {
      v28 = 0;
    }
    id v18 = v22;
    id v10 = v21;
    id v16 = v30;
    v29 = +[MCProfileServiceServer sharedServer];
    [v29 installProfileData:v10 interactionClient:v28 options:v19 source:v20 completion:v12];

    goto LABEL_21;
  }
  if (v12) {
    v12[2](v12, 0, v15);
  }
LABEL_22:
}

- (void)appleConnect_installMDMAssociatedProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  os_log_t v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = v13;
    id v15 = [(MCProfileServicer *)self remoteProcessBundleID];
    *(_DWORD *)buf = 138543362;
    id v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AppleConnect installing MDM associated profile data from process: %{public}@", buf, 0xCu);
  }
  id v22 = 0;
  unsigned __int8 v16 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"AppleConnectMDMInstallation" error:&v22];
  id v17 = v22;
  if (v16)
  {
    id v18 = +[DMCPersonaHelper enterprisePersonaIdentifier];
    id v19 = _MCLogObjects[0];
    if (v18)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AppleConnect adding enterprise persona ID to MDM associated profile data", buf, 2u);
      }
      id v20 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v11];
      [v20 setObject:v18 forKey:kMCInstallProfileOptionPersonaID];
      id v21 = [v20 copy];

      id v11 = v21;
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "AppleConnect missing enterprise persona ID when installing MDM associated profile data", buf, 2u);
    }
    [(MCProfileServicer *)self installProfileData:v10 interactive:v8 options:v11 completion:v12];
  }
  else if (v12)
  {
    v12[2](v12, 0, v17);
  }
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, uint64_t, id))a7;
  if ([(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.vpn-profile-access"])
  {
    id v16 = 0;
LABEL_4:
    id v18 = +[MCProfileServiceServer sharedServer];
    [v18 queueProfileDataForInstallation:v12 originalFileName:v13 originatingBundleID:v14 transitionToUI:v8 completion:v15];

    goto LABEL_5;
  }
  id v19 = 0;
  unsigned __int8 v17 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"UIInstallation" error:&v19];
  id v16 = v19;
  if (v17) {
    goto LABEL_4;
  }
  if (v15) {
    v15[2](v15, 0, 99, v16);
  }
LABEL_5:
}

- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"PopInstallationQueue" error:&v8];
  id v6 = v8;
  if (v5)
  {
    id v7 = +[MCProfileServiceServer sharedServer];
    [v7 popProfileDataFromHeadOfInstallationQueueWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  id v13 = 0;
  unsigned int v7 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"PopInstallationQueue" error:&v13];
  id v8 = v13;
  if (a3 >= 8 && v7)
  {
    unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:a3];
    id v10 = [v9 stringValue];
    uint64_t v11 = [(MCProfileServicer *)self _invalidValue:v10 forArgument:@"MCProfileTargetDeviceType"];

    id v8 = (id)v11;
  }
  else if (v7)
  {
    id v12 = +[MCProfileServiceServer sharedServer];
    [v12 peekProfileDataFromPurgatoryForDeviceType:a3 withCompletion:v6];

    goto LABEL_8;
  }
  if (v6) {
    v6[2](v6, 0, v8);
  }
LABEL_8:
}

- (void)updateProfileIdentifier:(id)a3 interactive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void, id))a5;
  if (v6)
  {
    id v19 = 0;
    unsigned __int8 v10 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"CustomUIInstallation" error:&v19];
    id v11 = v19;
    if (v10)
    {
      id v12 = [MCInteractionClient alloc];
      id v13 = [(MCProfileServicer *)self xpcConnection];
      id v14 = [(MCInteractionClient *)v12 initWithXPCClientConnection:v13];

LABEL_6:
      id v16 = +[MCProfileServiceServer sharedServer];
      unsigned __int8 v17 = [(MCProfileServicer *)self remoteProcessBundleID];
      [v16 updateProfileIdentifier:v8 interactionClient:v14 source:v17 completion:v9];

      goto LABEL_9;
    }
  }
  else
  {
    id v18 = 0;
    unsigned __int8 v15 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"SilentNonUIInstallation" error:&v18];
    id v11 = v18;
    if (v15)
    {
      id v14 = 0;
      goto LABEL_6;
    }
  }
  if (v9) {
    v9[2](v9, 0, v11);
  }
LABEL_9:
}

- (id)_invalidValue:(id)a3 forArgument:(id)a4
{
  uint64_t v4 = MCProfileRemovalErrorDomain;
  unsigned __int8 v5 = MCErrorArray();
  BOOL v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 1010, v5, MCErrorTypeFatal, a4, a3, 0);

  return v6;
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, id))a5;
  id v18 = 0;
  unsigned int v10 = [(MCProfileServicer *)self remoteProcessCanRemoveProfilesOutError:&v18];
  id v11 = v18;
  if (v10)
  {
    if ([(MCProfileServicer *)self isCloudLockedProfileWithIdentifier:v8])
    {
      uint64_t v12 = MCProfileRemovalErrorDomain;
      id v13 = MCErrorArray();
      uint64_t v14 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v12, 52000, v13, MCErrorTypeFatal, 0);
    }
    else
    {
      if ((unint64_t)a4 < 3)
      {
        unsigned __int8 v15 = +[MCProfileServiceServer sharedServer];
        id v16 = [(MCProfileServicer *)self remoteProcessBundleID];
        [v15 removeProfileWithIdentifier:v8 installationType:a4 source:v16 completion:v9];

        goto LABEL_10;
      }
      id v13 = +[NSNumber numberWithInteger:a4];
      uint64_t v17 = [v13 stringValue];
      uint64_t v14 = [(MCProfileServicer *)self _invalidValue:v17 forArgument:@"MCProfileInstallationType"];

      id v11 = (id)v17;
    }

    id v11 = (id)v14;
  }
  if (v9) {
    v9[2](v9, v11);
  }
LABEL_10:
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, id))a6;
  id v20 = 0;
  unsigned int v12 = [(MCProfileServicer *)self remoteProcessCanRemoveProfilesOutError:&v20];
  id v13 = v20;
  if ((unint64_t)a4 >= 3 && v12)
  {
    uint64_t v14 = +[NSNumber numberWithInteger:a4];
    unsigned __int8 v15 = [v14 stringValue];
    CFStringRef v16 = @"MCProfileInstallationType";
LABEL_8:
    uint64_t v18 = [(MCProfileServicer *)self _invalidValue:v15 forArgument:v16];

    id v13 = (id)v18;
    goto LABEL_9;
  }
  char v17 = v12 ^ 1;
  if (a5 < 8) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    uint64_t v14 = +[NSNumber numberWithUnsignedInteger:a5];
    unsigned __int8 v15 = [v14 stringValue];
    CFStringRef v16 = @"MCProfileTargetDeviceType";
    goto LABEL_8;
  }
  if (v12)
  {
    id v19 = +[MCProfileServiceServer sharedServer];
    [v19 removeUninstalledProfileWithIdentifier:v10 installationType:a4 targetDeviceType:a5 completion:v11];

    goto LABEL_13;
  }
LABEL_9:
  if (v11) {
    v11[2](v11, v13);
  }
LABEL_13:
}

- (void)removeProtectedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, id))a5;
  id v19 = 0;
  unsigned int v10 = [(MCProfileServicer *)self remoteProcessCanRemoveProfilesOutError:&v19];
  id v11 = v19;
  if (v10)
  {
    unsigned int v12 = [(MCProfileServicer *)self isCloudLockedProfileWithIdentifier:v8];
    unsigned __int8 v13 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"CloudLockedRemoval"];
    if (!v12 || (v13 & 1) != 0)
    {
      if ((unint64_t)a4 < 3)
      {
        unsigned __int8 v15 = +[MCProfileServiceServer sharedServer];
        CFStringRef v16 = [(MCProfileServicer *)self remoteProcessBundleID];
        [v15 removeProfileWithIdentifier:v8 installationType:a4 source:v16 completion:v9];

        goto LABEL_11;
      }
      char v17 = +[NSNumber numberWithInteger:a4];
      uint64_t v18 = [v17 stringValue];
      uint64_t v14 = [(MCProfileServicer *)self _invalidValue:v18 forArgument:@"MCProfileInstallationType"];

      id v11 = v17;
    }
    else
    {
      uint64_t v14 = [(MCProfileServicer *)self lacksArrayEntitlementError:@"com.apple.managedconfiguration.profiled.configurationprofiles" withMemberString:@"CloudLockedRemoval"];
    }

    id v11 = (id)v14;
  }
  if (v9) {
    v9[2](v9, v11);
  }
LABEL_11:
}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessCanRemoveProfilesOutError:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    [v7 removePostSetupAutoInstallSetAsideProfileWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"CloudConfiguration" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    [v7 removeSetAsideCloudConfigurationProfileWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (BOOL)isCloudLockedProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MCManifest sharedManifest];
  unsigned __int8 v5 = [v4 installedProfileWithIdentifier:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v6 = [v5 isCloudLocked];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)remoteProcessCanRemoveProfilesOutError:(id *)a3
{
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.vpn-profile-access"];
  return v5 | [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"Removal" error:a3];
}

- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 completion:(id)a10
{
  BOOL v26 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v27 = 0;
  unsigned __int8 v22 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"ClientRestrictions" error:&v27];
  id v23 = v27;
  if (v22)
  {
    id v24 = +[MCProfileServiceServer sharedServer];
    v25 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v24 applyRestrictionDictionary:v15 overrideRestrictions:v26 appsAndOptions:v16 clientType:v17 clientUUID:v18 sender:v25 localizedClientDescription:v19 localizedWarningMessage:v20 completion:v21];
  }
  else if (v21)
  {
    (*((void (**)(id, void, void, id))v21 + 2))(v21, 0, 0, v23);
  }
}

- (void)clearRecoveryPasscodeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v9 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"Passcode" error:&v9];
  id v6 = v9;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    id v8 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v7 clearRecoveryPasscodeWithSenderBundleID:v8 completion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)changePasscode:(id)a3 oldPasscode:(id)a4 isRecovery:(BOOL)a5 skipRecovery:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void, id))a7;
  id v19 = 0;
  unsigned __int8 v15 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"Passcode" error:&v19];
  id v16 = v19;
  if (v15)
  {
    id v17 = +[MCProfileServiceServer sharedServer];
    id v18 = [(MCProfileServicer *)self remoteProcessBundleID];
    if (v9) {
      [v17 changePasscode:v12 recoveryPasscode:v13 skipRecovery:v8 senderBundleID:v18 completion:v14];
    }
    else {
      [v17 changePasscode:v12 oldPasscode:v13 skipRecovery:v8 senderBundleID:v18 completion:v14];
    }
  }
  else if (v14)
  {
    v14[2](v14, 0, v16);
  }
}

- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id))a5;
  id v15 = 0;
  unsigned __int8 v11 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"Passcode" error:&v15];
  id v12 = v15;
  if (v11)
  {
    id v13 = +[MCProfileServiceServer sharedServer];
    uint64_t v14 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v13 clearPasscodeWithEscrowKeybagData:v8 secret:v9 senderBundleID:v14 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"PasscodeCompliance" error:&v11];
  id v9 = v11;
  if (v8)
  {
    unsigned int v10 = +[MCProfileServiceServer sharedServer];
    [v10 isPasscodeCompliantWithNamedPolicy:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }
}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"PasscodeMetadata" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    [v7 resetPasscodeMetadataWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"ClientRestrictions" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    [v7 removeOrphanedClientRestrictionsWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"NetworkExtension" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    [v7 managedSystemConfigurationServiceIDsWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)managedWiFiNetworkNamesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"WiFiNetworks" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[MCProfileServiceServer sharedServer];
    [v7 managedWiFiNetworkNamesWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = (void (**)(id, id))a5;
  id v12 = 0;
  unsigned __int8 v9 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.migration" error:&v12];
  id v10 = v12;
  if (v9)
  {
    id v11 = +[MCProfileServiceServer sharedServer];
    [v11 migrateWithContext:v6 passcodeWasSetInBackup:v5 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void (**)(id, id))a4;
  id v10 = 0;
  unsigned __int8 v7 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.migration" error:&v10];
  id v8 = v10;
  if (v7)
  {
    unsigned __int8 v9 = +[MCProfileServiceServer sharedServer];
    [v9 migrateCleanupMigratorWithContext:v4 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, v8);
  }
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 completion:(id)a9
{
  BOOL v57 = a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void (**)(id, id))a9;
  id v72 = 0;
  LOBYTE(a8) = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"UserSettings" error:&v72];
  id v58 = v72;
  if (a8) {
    goto LABEL_2;
  }
  v59 = self;
  unsigned int v51 = v11;
  id v53 = v17;
  id v54 = v16;
  v25 = +[NSMutableArray array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  BOOL v26 = [v14 allKeys];
  id v27 = [v26 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v69;
    id v55 = v14;
    v52 = v18;
    while (2)
    {
      v30 = 0;
      id v50 = v28;
      do
      {
        if (*(void *)v69 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v30);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_30:

          id v18 = v52;
          goto LABEL_31;
        }
        id v32 = [v14 objectForKeyedSubscript:v31];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v33 = v32;
        id v34 = [v33 countByEnumeratingWithState:&v64 objects:v78 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v65;
          while (2)
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v65 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                id v14 = v55;
                goto LABEL_30;
              }
              [v25 addObject:v38];
            }
            id v35 = [v33 countByEnumeratingWithState:&v64 objects:v78 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        v30 = (char *)v30 + 1;
        id v14 = v55;
      }
      while (v30 != v50);
      id v28 = [v26 countByEnumeratingWithState:&v68 objects:v79 count:16];
      id v18 = v52;
      if (v28) {
        continue;
      }
      break;
    }
  }

  if ([v25 count])
  {
    id v56 = v14;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v39 = v25;
    id v40 = [v39 countByEnumeratingWithState:&v60 objects:v77 count:16];
    if (!v40)
    {
LABEL_28:

      id v14 = v56;
      id v17 = v53;
      id v16 = v54;
      uint64_t v11 = v51;
      self = v59;
LABEL_2:
      id v19 = [(MCProfileServicer *)self xpcConnection];
      unsigned int v20 = [v19 processIdentifier];

      id v21 = +[MCProfileServiceServer sharedServer];
      unsigned __int8 v22 = [(MCProfileServicer *)self remoteProcessBundleID];
      LODWORD(v49) = v20;
      [v21 setParametersForSettingsByType:v14 configurationUUID:v15 toSystem:v11 user:v57 passcode:v16 credentialSet:v17 senderPID:v49 sender:v22 completion:v18];

      id v23 = 0;
      id v24 = v58;
      goto LABEL_34;
    }
    id v41 = v40;
    uint64_t v42 = *(void *)v61;
LABEL_22:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v61 != v42) {
        objc_enumerationMutation(v39);
      }
      uint64_t v44 = *(void *)(*((void *)&v60 + 1) + 8 * v43);
      id v23 = +[NSString stringWithFormat:@"%@%@", @"com.apple.managedconfiguration.feature-setting.", v44];
      if (![(MCProfileServicer *)v59 remoteProcessHasBooleanEntitlement:v23]) {
        break;
      }

      if (v41 == (id)++v43)
      {
        id v41 = [v39 countByEnumeratingWithState:&v60 objects:v77 count:16];
        if (v41) {
          goto LABEL_22;
        }
        goto LABEL_28;
      }
    }
    os_log_t v46 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v47 = v46;
      v48 = [(MCProfileServicer *)v59 remoteProcessBundleID];
      *(_DWORD *)buf = 138543618;
      v74 = v48;
      __int16 v75 = 2114;
      v76 = v23;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Process %{public}@ needs the entitlement “%{public}@”", buf, 0x16u);
    }

    id v14 = v56;
    id v17 = v53;
    if (!v23) {
      goto LABEL_32;
    }
    id v21 = [(MCProfileServicer *)v59 lacksBooleanEntitlementError:v23];
    id v16 = v54;
    id v24 = v58;
    if (v18) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_31:

    id v17 = v53;
LABEL_32:
    id v24 = v58;
    id v21 = v58;
    id v23 = 0;
    id v16 = v54;
    if (v18) {
LABEL_33:
    }
      v18[2](v18, v21);
  }
LABEL_34:
}

- (void)removeBoolSetting:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v12 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"UserSettings" error:&v12];
  id v9 = v12;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    uint64_t v11 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v10 removeBoolSetting:v6 sender:v11 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)removeValueSetting:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v12 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"UserSettings" error:&v12];
  id v9 = v12;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    uint64_t v11 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v10 removeValueSetting:v6 sender:v11 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v14 = 0;
  unsigned __int8 v10 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled-access" error:&v14];
  id v11 = v14;
  if (v10)
  {
    if ([(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.springboard.opensensitiveurl"])
    {
      id v12 = +[MCProfileServiceServer sharedServer];
      [v12 openSensitiveURL:v8 unlock:v6 completion:v9];
    }
    else
    {
      id v13 = [(MCProfileServicer *)self lacksBooleanEntitlementError:@"com.apple.springboard.opensensitiveurl"];
      if (v9) {
        v9[2](v9, v13);
      }
    }
  }
  else if (v9)
  {
    v9[2](v9, v11);
  }
}

- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, id))a5;
  id v14 = 0;
  unsigned __int8 v11 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"Certificates" error:&v14];
  id v12 = v14;
  if (v11)
  {
    id v13 = +[MCProfileServiceServer sharedServer];
    [v13 storeCertificateData:v8 forIPCUIdentifier:v9 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, id))a5;
  id v14 = 0;
  unsigned __int8 v11 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.provisioningprofiles" containingString:@"Installation" error:&v14];
  id v12 = v14;
  if (v11)
  {
    id v13 = +[MCProfileServiceServer sharedServer];
    [v13 installProvisioningProfileData:v8 managingProfileIdentifier:v9 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void, id))a5;
  id v15 = 0;
  unsigned __int8 v11 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.provisioningprofiles" containingString:@"Removal" error:&v15];
  id v12 = v15;
  if (v11)
  {
    id v13 = +[MCProfileServiceServer sharedServer];
    id v14 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v13 removeProvisioningProfileWithUUID:v8 managingProfileIdentifier:v9 sender:v14 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, 0, v12);
  }
}

- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  id v12 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.provisioningprofiles" containingString:@"AddTrusted" error:&v12];
  id v9 = v12;
  if (v8)
  {
    unsigned __int8 v10 = +[MCProfileServiceServer sharedServer];
    unsigned __int8 v11 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v10 addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:v6 sender:v11 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }
}

- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MCProfileServiceServer sharedServer];
  [v7 provisiongProfileUUIDsForSignerIdentity:v6 completion:v5];
}

- (void)isBundleBlocked:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id, id, void))a4;
  id v16 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled-access" error:&v16];
  id v9 = v16;
  if (v8)
  {
    unsigned __int8 v10 = +[MCProfileServiceServer sharedServer];
    id v14 = 0;
    id v15 = 0;
    id v11 = [v10 isBundleBlocked:v6 outHash:&v15 outHashType:&v14];
    id v12 = v15;
    id v13 = v14;
    v7[2](v7, v11, v12, v13, 0);
  }
  else if (v7)
  {
    ((void (**)(id, id, id, id, id))v7)[2](v7, 0, 0, 0, v9);
  }
}

- (void)areBundlesBlocked:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v37 = 0;
  LOBYTE(a4) = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled-access" error:&v37];
  id v8 = v37;
  id v9 = v8;
  if (a4)
  {
    id v22 = v8;
    id v23 = v7;
    v30 = +[MCProfileServiceServer sharedServer];
    uint64_t v29 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v6;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v28 = *(void *)v34;
      uint64_t v12 = kMCMISIsBlockedKey;
      uint64_t v27 = kMCMISHashKey;
      uint64_t v26 = kMCMISHashTypeKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v31 = 0;
          id v32 = 0;
          id v15 = [v30 isBundleBlocked:v14 outHash:&v32 outHashType:&v31];
          id v16 = v32;
          id v17 = v31;
          id v18 = objc_alloc((Class)NSMutableDictionary);
          uint64_t v38 = v12;
          id v19 = +[NSNumber numberWithBool:v15];
          id v39 = v19;
          unsigned int v20 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          id v21 = [v18 initWithDictionary:v20];

          if (v16) {
            [v21 setObject:v16 forKeyedSubscript:v27];
          }
          if (v17) {
            [v21 setObject:v17 forKeyedSubscript:v26];
          }
          [v29 setObject:v21 forKeyedSubscript:v14];
        }
        id v11 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v11);
    }

    id v7 = v23;
    ((void (**)(id, void *, id))v23)[2](v23, v29, 0);

    id v6 = v24;
    id v9 = v22;
  }
  else if (v7)
  {
    v7[2](v7, 0, v8);
  }
}

- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.usercompliance" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 notifyStartComplianceTimer:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.usercompliance" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 notifyHaveSeenComplianceMessageWithLastLockDate:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)recomputeUserComplianceWarningWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.usercompliance" error:&v8];
  id v6 = v8;
  if (v5)
  {
    id v7 = +[MCProfileServiceServer sharedServer];
    [v7 recomputeUserComplianceWarningWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)recomputePerClientUserComplianceWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.usercompliance" error:&v8];
  id v6 = v8;
  if (v5)
  {
    id v7 = +[MCProfileServiceServer sharedServer];
    [v7 recomputePerClientUserComplianceWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v7 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"UserSettings" error:&v11];
  id v8 = v11;
  if (v7)
  {
    id v9 = +[MCProfileServiceServer sharedServer];
    id v10 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v9 resetAllSettingsToDefaultsIsUserInitiated:v4 sender:v10 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, v8);
  }
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v15 = 0;
  unsigned __int8 v11 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"ClientRestrictions" error:&v15];
  id v12 = v15;
  if (v11)
  {
    id v13 = +[MCProfileServiceServer sharedServer];
    uint64_t v14 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v13 setUserInfo:v8 forClientUUID:v9 sender:v14 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)removeExpiredProfilesWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.provisioningprofiles" containingString:@"Removal" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned __int8 v7 = +[MCProfileServiceServer sharedServer];
    [v7 removeExpiredProfilesWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"DEPInstallation" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 storeProfileData:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)storedProfileDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"DEPInstallation" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned __int8 v7 = +[MCProfileServiceServer sharedServer];
    [v7 storedProfileDataWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)markStoredProfileAsInstalledWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"DEPInstallation" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned __int8 v7 = +[MCProfileServiceServer sharedServer];
    [v7 markStoredProfileAsInstalledWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)rereadManagedAppAttributesWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"ManagedApplications" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned __int8 v7 = +[MCProfileServiceServer sharedServer];
    [v7 rereadManagedAppAttributesWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)reducedMachineInfoDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"MachineInfo" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned __int8 v7 = +[MCProfileServiceServer sharedServer];
    [v7 reducedMachineInfoDataWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"MachineInfo" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 cloudConfigurationMachineInfoDataWithAdditionalInfo:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }
}

- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"CloudConfiguration" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 cloudConfigurationStoreDetails:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v11 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"CloudConfiguration" error:&v11];
  id v6 = v11;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    unsigned __int8 v8 = +[MCProfileServiceServer sharedServer];
    [v8 restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:v4];
  }
  else if (v6)
  {
    id v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Remote process doesn't have the right entitlment!", v10, 2u);
    }
    if (v4) {
      v4[2](v4, v7);
    }
  }
}

- (void)createActivationLockBypassCodeWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"ActivationLock" error:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned __int8 v7 = +[MCProfileServiceServer sharedServer];
    [v7 createActivationLockBypassCodeWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)storeActivationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"ActivationRecord" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 storeActivationRecord:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)setUserBookmarks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v14 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"Safari" error:&v14];
  id v9 = v14;
  if (v8)
  {
    id v10 = [(MCProfileServicer *)self xpcConnection];
    id v11 = [v10 processIdentifier];

    id v12 = +[MCProfileServiceServer sharedServer];
    id v13 = [(MCProfileServicer *)self remoteProcessBundleID];
    [v12 setUserBookmarks:v6 senderPID:v11 sender:v13 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [(MCProfileServicer *)self xpcConnection];
  id v14 = v13;
  if (v13)
  {
    [v13 auditToken];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }

  id v15 = MCBundleIDFromAuditToken();
  if (v15)
  {
    id v16 = +[MCProfileServiceServer sharedServer];
    [v16 allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:v10 messageSendingAppBundleID:v15 hostAppBundleID:v11 accountIsManaged:v7 completion:v12];
LABEL_10:

    goto LABEL_11;
  }
  id v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process. Denying access to all keyboards.", buf, 2u);
  }
  if (v12)
  {
    id v18 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000595E4;
    block[3] = &unk_1000EADD8;
    id v20 = v12;
    dispatch_async(v18, block);

    id v16 = v20;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)hasMailAccountsWithFilteringEnabled:(BOOL)a3 sourceAccountManagement:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v8 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(MCProfileServicer *)self xpcConnection];
  id v10 = v9;
  if (v9)
  {
    [v9 auditToken];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }

  id v11 = +[MCProfileServiceServer sharedServer];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100059708;
  v14[3] = &unk_1000EBDF8;
  id v15 = v8;
  v13[0] = v16;
  v13[1] = v17;
  id v12 = v8;
  [v11 loadMailAccountsWithAuditToken:v13 filteringEnabled:v6 sourceAccountManagement:v5 completion:v14];
}

- (void)setupAssistantDidFinishCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  BOOL v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setup Assistant finished.", buf, 2u);
  }
  id v5 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-SetupAssistantFinished"];
  BOOL v6 = +[MDMClient sharedClient];
  BOOL v7 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v8 = [v7 isSupervised];

  id v9 = +[NSFileManager defaultManager];
  id v10 = MDMFilePath();
  unsigned int v11 = [v9 fileExistsAtPath:v10 isDirectory:0];

  unint64_t v12 = (unint64_t)[v6 accessRights] & 4;
  id v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v33 = v11;
    __int16 v34 = 1024;
    unsigned int v35 = v8;
    __int16 v36 = 1024;
    int v37 = v12 >> 2;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Buddy completed. Enrolled in MDM: %u, supervised: %u, hasPasscodeRemovalRight: %u", buf, 0x14u);
  }
  id v14 = _MCLogObjects[0];
  if (v11 && v12)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Scheduling token update to inform the server about the new unlock token", buf, 2u);
    }
    [v6 scheduleTokenUpdate];
  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Deleting any unlock token created during Buddy", buf, 2u);
    }
    MCKeybagDeleteMDMEscrowData();
    MCKeybagDeleteMDMEscrowSecret();
  }
  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  long long v16 = dispatch_get_global_queue(0, 0);
  uint64_t v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_100059B40;
  uint64_t v29 = &unk_1000EBE20;
  char v31 = v11;
  id v17 = v5;
  id v30 = v17;
  dispatch_after(v15, v16, &v26);

  id v18 = +[MDMCloudConfiguration sharedConfiguration];
  id v19 = [v18 MAIDUsername];

  id v20 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v21 = [v20 hasMAIDCredential];

  long long v22 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned __int8 v23 = [v22 alreadySignedIntoFaceTime];

  if (v19 && v21 && (v23 & 1) == 0)
  {
    id v24 = +[MCProfileServiceServer sharedServer];
    [v24 signIntoFaceTimeWithUsername:v19];
  }
  else
  {
    v25 = _MCLogObjects[2];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No FT credentials provided in the DEP", buf, 2u);
    }
  }
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v12 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.provisioningprofiles" containingString:@"Validation" error:&v12];
  id v9 = v12;
  if (v8)
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Validate app bundle IDs: %{public}@", buf, 0xCu);
    }
    unsigned int v11 = +[MCProfileServiceServer sharedServer];
    [v11 validateAppBundleIDs:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.migration" error:&v8];
  id v6 = v8;
  if (v5)
  {
    BOOL v7 = +[MCProfileServiceServer sharedServer];
    [v7 recomputeProfileRestrictionsWithCompletionBlock:v4];
  }
  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)shutDownWithCompletion:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.shutdown" error:&v15];
  id v6 = v15;
  if (v5)
  {
    xpc_transaction_exit_clean();
    if (v4)
    {
      BOOL v7 = dispatch_get_global_queue(0, 0);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100059F40;
      v10[3] = &unk_1000EADD8;
      id v8 = &v11;
      id v11 = v4;
      dispatch_async(v7, v10);
LABEL_6:
    }
  }
  else if (v4)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059F2C;
    block[3] = &unk_1000EAEF0;
    id v8 = &v14;
    id v14 = v4;
    id v13 = v6;
    dispatch_async(v9, block);

    BOOL v7 = v13;
    goto LABEL_6;
  }
}

- (void)showFeaturePromptForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 promptIdentifier:(id)a6 completion:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005A220;
  v29[3] = &unk_1000EBE70;
  id v12 = a7;
  id v30 = v12;
  id v13 = objc_retainBlock(v29);
  id v28 = 0;
  LOBYTE(a7) = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"UserSettings" error:&v28];
  id v14 = v28;
  if (a7)
  {
    id v15 = +[MCUserNotificationManager sharedManager];
    id v23 = v11;
    long long v16 = [(MCProfileServicer *)self prefixedFeaturePromptIdentifierForIdentifier:v11];
    long long v22 = [v10 objectForKeyedSubscript:kMCFeaturePromptTitleKey];
    v25 = [v10 objectForKeyedSubscript:kMCFeaturePromptMessageKey];
    id v24 = MCLocalizedString();
    id v17 = MCLocalizedString();
    id v18 = [v10 objectForKeyedSubscript:kMCFeaturePromptShowAlwaysAllowButtonKey];
    unsigned int v19 = [v18 BOOLValue];
    if (v19)
    {
      id v20 = MCLocalizedString();
    }
    else
    {
      id v20 = 0;
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005A30C;
    v26[3] = &unk_1000EB838;
    uint64_t v27 = v13;
    BYTE2(v21) = 1;
    LOWORD(v21) = 1;
    [v15 displayUserNotificationWithIdentifier:v16 title:v22 message:v25 defaultButtonText:v24 alternateButtonText:v17 textfieldPlaceholder:v20 displayOnLockScreen:0.0 dismissOnLock:0 displayInAppWhitelistModes:v21 dismissAfterTimeInterval:0 assertion:v26];
    if (v19) {

    }
    id v11 = v23;
  }
  else
  {
    ((void (*)(void *, void, id))v13[2])(v13, 0, v14);
  }
}

- (void)cancelFeaturePromptWithIdentifier:(id)a3 completion:(id)a4
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005A658;
  v17[3] = &unk_1000EB490;
  id v6 = a4;
  id v18 = v6;
  id v7 = a3;
  id v8 = objc_retainBlock(v17);
  if (!v7)
  {
    uint64_t v9 = MCFeaturePromptErrorDomain;
    id v10 = MCErrorArray();
    id v11 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 50002, v10, MCErrorTypeFatal, 0);
    ((void (*)(void *, void *))v8[2])(v8, v11);
  }
  id v12 = +[MCUserNotificationManager sharedManager];
  id v13 = [(MCProfileServicer *)self prefixedFeaturePromptIdentifierForIdentifier:v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005A738;
  v15[3] = &unk_1000EADD8;
  id v16 = v8;
  id v14 = v8;
  [v12 cancelNotificationsWithIdentifier:v13 completionBlock:v15];
}

- (id)prefixedFeaturePromptIdentifierForIdentifier:(id)a3
{
  if (a3)
  {
    @"feature-prompt:"stringByAppendingString:
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"feature-prompt:";
  }
  return v4;
}

- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [(MCProfileServicer *)self xpcConnection];
  id v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }

  id v12 = MCBundleIDFromAuditToken();
  if (!v8)
  {
    id v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No originating app bundle id passed. Using caller's bundle id.", buf, 2u);
    }
    id v8 = v12;
    goto LABEL_11;
  }
  if ([v8 isEqualToString:v12])
  {
LABEL_11:
    id v15 = +[MCProfileServiceServer sharedServer];
    [v15 mayShareToMessagesForOriginatingAppBundleID:v8 originatingAccountIsManaged:v6 completion:v9];
    goto LABEL_12;
  }
  id v17 = 0;
  unsigned __int8 v13 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.sharing-access-check-messages" error:&v17];
  id v14 = v17;
  id v15 = v14;
  if (v13)
  {

    goto LABEL_11;
  }
  if (v9) {
    v9[2](v9, 0, v14);
  }
LABEL_12:
}

- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [(MCProfileServicer *)self xpcConnection];
  id v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }

  id v12 = MCBundleIDFromAuditToken();
  if (!v8)
  {
    id v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No originating app bundle id passed. Using caller's bundle id.", buf, 2u);
    }
    id v8 = v12;
    goto LABEL_11;
  }
  if ([v8 isEqualToString:v12])
  {
LABEL_11:
    id v15 = +[MCProfileServiceServer sharedServer];
    [v15 mayShareToAirDropForOriginatingAppBundleID:v8 originatingAccountIsManaged:v6 completion:v9];
    goto LABEL_12;
  }
  id v17 = 0;
  unsigned __int8 v13 = [(MCProfileServicer *)self remoteProcessHasBooleanEntitlement:@"com.apple.managedconfiguration.profiled.sharing-access-check-air-drop" error:&v17];
  id v14 = v17;
  id v15 = v14;
  if (v13)
  {

    goto LABEL_11;
  }
  if (v9) {
    v9[2](v9, 0, v14);
  }
LABEL_12:
}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v11 = 0;
  unsigned __int8 v8 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.set" containingString:@"Passcode" error:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = +[MCProfileServiceServer sharedServer];
    [v10 createMDMUnlockTokenIfNeededWithPasscode:v6 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)monitorEnrollmentStateWithPersonaID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [MCInteractionClient alloc];
  id v6 = [(MCProfileServicer *)self xpcConnection];
  unsigned __int8 v8 = [(MCInteractionClient *)v5 initWithXPCClientConnection:v6];

  id v7 = +[MCProfileServiceServer sharedServer];
  [v7 monitorEnrollmentStateForClient:v8 personaID:v4];
}

- (void)managingOrganizationInformationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"MDMInfo" error:&v8];
  id v6 = v8;
  if (v5)
  {
    id v7 = +[MCProfileServiceServer sharedServer];
    [v7 managingOrganizationInformationWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }
}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  long long v19 = (void (**)(id, void *))a9;
  long long v20 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v20)
  {
    if (v19) {
      v19[2](v19, v20);
    }
  }
  else
  {
    uint64_t v21 = +[MCProfileServiceServer sharedServer];
    [v21 stageMDMEnrollmentInfoForPairingWatchWithProfileData:v22 orServiceURL:v15 anchorCertificates:v16 supervised:v11 declarationKeys:v17 declarationConfiguration:v18 completion:v19];
  }
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  id v4 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v4)
  {
    if (v6) {
      v6[2](v6, v4);
    }
  }
  else
  {
    unsigned __int8 v5 = +[MCProfileServiceServer sharedServer];
    [v5 unstageMDMEnrollmentInfoForPairingWatchWithCompletion:v6];
  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void, void *))a3;
  id v4 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v4)
  {
    if (v6) {
      v6[2](v6, 0, v4);
    }
  }
  else
  {
    unsigned __int8 v5 = +[MCProfileServiceServer sharedServer];
    [v5 fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:v6];
  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v7)
  {
    if (v6) {
      v6[2](v6, 0, v7);
    }
  }
  else
  {
    id v8 = +[MCProfileServiceServer sharedServer];
    [v8 fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:v9 completion:v6];
  }
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void, void *))a3;
  id v4 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v4)
  {
    if (v6) {
      v6[2](v6, 0, v4);
    }
  }
  else
  {
    unsigned __int8 v5 = +[MCProfileServiceServer sharedServer];
    [v5 fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:v6];
  }
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }
  else
  {
    id v9 = [(MCProfileServicer *)self remoteProcessBundleID];
    if (!v9)
    {
      id v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process. Not marking profile's installer.", v12, 2u);
      }
    }
    BOOL v11 = +[MCProfileServiceServer sharedServer];
    [v11 applyPairingWatchMDMEnrollmentData:v6 source:v9 completion:v7];
  }
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(MCProfileServicer *)self _missingWatchMDMEnrollmentEntitlementError];
  if (v7)
  {
    if (v6) {
      v6[2](v6, 0, v7);
    }
  }
  else
  {
    id v8 = +[MCProfileServiceServer sharedServer];
    [v8 updateMDMEnrollmentInfoForPairingWatch:v9 completion:v6];
  }
}

- (id)_missingWatchMDMEnrollmentEntitlementError
{
  id v7 = 0;
  unsigned __int8 v2 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.configurationprofiles" containingString:@"WatchMDMEnrollment" error:&v7];
  id v3 = v7;
  id v4 = v3;
  id v5 = 0;
  if ((v2 & 1) == 0) {
    id v5 = v3;
  }

  return v5;
}

- (void)effectiveBoolValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = (void (**)(id, void, id))a6;
  id v17 = 0;
  unsigned __int8 v14 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"WatchSettings" error:&v17];
  id v15 = v17;
  if (v14)
  {
    id v16 = +[MCProfileServiceServer sharedServer];
    [v16 effectiveBoolValueForWatchSetting:v10 pairingID:v11 pairingDataStore:v12 completion:v13];
  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }
}

- (void)effectiveValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = (void (**)(id, void, id))a6;
  id v17 = 0;
  unsigned __int8 v14 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"WatchSettings" error:&v17];
  id v15 = v17;
  if (v14)
  {
    id v16 = +[MCProfileServiceServer sharedServer];
    [v16 effectiveValueForWatchSetting:v10 pairingID:v11 pairingDataStore:v12 completion:v13];
  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }
}

- (void)effectiveValuesForWatchIntersectionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = (void (**)(id, void, id))a6;
  id v17 = 0;
  unsigned __int8 v14 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"WatchSettings" error:&v17];
  id v15 = v17;
  if (v14)
  {
    id v16 = +[MCProfileServiceServer sharedServer];
    [v16 effectiveValuesForWatchIntersectionSetting:v10 pairingID:v11 pairingDataStore:v12 completion:v13];
  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }
}

- (void)effectiveValuesForWatchUnionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = (void (**)(id, void, id))a6;
  id v17 = 0;
  unsigned __int8 v14 = [(MCProfileServicer *)self remoteProcessHasEntitlementArray:@"com.apple.managedconfiguration.profiled.get" containingString:@"WatchSettings" error:&v17];
  id v15 = v17;
  if (v14)
  {
    id v16 = +[MCProfileServiceServer sharedServer];
    [v16 effectiveValuesForWatchUnionSetting:v10 pairingID:v11 pairingDataStore:v12 completion:v13];
  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }
}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = +[MCProfileServiceServer sharedServer];
  [v15 debugRescheduleBackgroundActivity:a3 startDate:v14 gracePeriod:v13 repeatingInterval:v12 completion:v11];
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end