@interface STRestrictionsMigrator
- (BOOL)_isEmptyConfiguration:(id)a3;
- (BOOL)hasMigratorRun;
- (BOOL)migrateContentPrivacyConfigurationsInContext:(id)a3 error:(id *)a4;
- (BOOL)performMigrationWithContext:(id)a3 error:(id *)a4;
- (NSArray)restrictionConfigurations;
- (NSDictionary)mcxSettings;
- (NSMutableDictionary)collectedSettings;
- (STBlueprintScheduleRepresentation)downtimeConfiguration;
- (STBlueprintUsageLimitScheduleRepresentation)limitConfiguration;
- (id)allSourceFeatures;
- (id)configurationIdentifierForType:(id)a3;
- (id)dayItemFromCurfew:(id)a3;
- (id)invertBooleanNumber:(id)a3;
- (id)localOrganizationIdentifierWithBase:(id)a3;
- (id)sourceRatingRegionCode;
- (id)typeForConfigurationIdentifier:(id)a3;
- (void)cleanUpAfterMigration;
- (void)collectMCFeatures;
- (void)migrateSettingsToConfigurations;
- (void)setCollectedSettings:(id)a3;
- (void)setDowntimeConfiguration:(id)a3;
- (void)setLimitConfiguration:(id)a3;
- (void)setMcxSettings:(id)a3;
- (void)setRestrictionConfigurations:(id)a3;
@end

@implementation STRestrictionsMigrator

- (id)allSourceFeatures
{
  v4[0] = MCFeatureAccountModificationAllowed;
  v4[1] = MCFeatureAddingGameCenterFriendsAllowed;
  v4[2] = MCFeatureAirDropAllowed;
  v4[3] = MCFeatureAppCellularDataModificationAllowed;
  v4[4] = MCFeatureAppClipsAllowed;
  v4[5] = MCFeatureAppInstallationAllowed;
  v4[6] = MCFeatureAppRemovalAllowed;
  v4[7] = MCFeatureAssistantAllowed;
  v4[8] = MCFeatureAssistantUserGeneratedContentAllowed;
  v4[9] = MCFeatureAutomaticAppUpdatesModificationAllowed;
  v4[10] = MCFeatureBookstoreAllowed;
  v4[11] = MCFeatureBookstoreEroticaAllowed;
  v4[12] = MCFeatureCameraAllowed;
  v4[13] = MCFeatureCellularPlanModificationAllowed;
  v4[14] = MCFeatureDictationAllowed;
  v4[15] = MCFeatureDriverDoNotDisturbModificationsAllowed;
  v4[16] = MCFeatureExplicitContentAllowed;
  v4[17] = MCFeatureFindMyFriendsModificationAllowed;
  v4[18] = MCFeatureGameCenterAllowedOtherPlayerTypes;
  v4[19] = MCFeatureGameCenterNearbyMultiplayerAllowed;
  v4[20] = MCFeatureGameCenterPrivateMessagingAllowed;
  v4[21] = MCFeatureGameCenterProfileModificationAllowed;
  v4[22] = MCFeatureGameCenterProfilePrivacyModificationAllowed;
  v4[23] = MCFeatureInAppPurchasesAllowed;
  v4[24] = MCFeatureITunesAllowed;
  v4[25] = MCFeatureMultiplayerGamingAllowed;
  v4[26] = MCFeatureMusicArtistActivityAllowed;
  v4[27] = MCFeatureMusicVideosAllowed;
  v4[28] = MCFeatureNewsAllowed;
  v4[29] = MCFeaturePodcastsAllowed;
  v4[30] = MCFeatureSafariAllowed;
  v4[31] = MCFeatureScreenRecordingAllowed;
  v4[32] = MCFeatureTVShowingUndownloadedMoviesAllowed;
  v4[33] = MCFeatureTVShowingUndownloadedTVShowsAllowed;
  v4[34] = MCFeatureTVProviderModificationAllowed;
  v4[35] = MCFeatureVehicleUIAllowed;
  v4[36] = MCFeatureVideoConferencingAllowed;
  v4[37] = MCFeatureGroupActivityAllowed;
  v4[38] = MCFeatureAssistantProfanityFilterForced;
  v4[39] = MCFeatureWebContentFilterAutoForced;
  v4[40] = MCFeatureMaximumAppsRating;
  v4[41] = MCFeatureMaximumMoviesRating;
  v4[42] = MCFeatureMaximumTVShowsRating;
  v4[43] = MCFeatureWebContentFilterAutoPermittedURLs;
  v4[44] = MCFeatureWebContentFilterBlacklistedURLs;
  v4[45] = MCFeatureWebContentFilterWhitelistedURLs;
  v2 = +[NSArray arrayWithObjects:v4 count:46];
  return v2;
}

- (id)sourceRatingRegionCode
{
  CFDictionaryRef v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"SBParentalControlsMCContentRestrictions", STSBDomain);
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFDictionaryGetTypeID())
    {
      v5 = CFDictionaryGetValue(v3, @"countryCode");
    }
    else
    {
      v5 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)collectMCFeatures
{
  v26 = objc_opt_new();
  v25 = self;
  CFDictionaryRef v3 = [(STRestrictionsMigrator *)self allSourceFeatures];
  v30 = +[MCProfileConnection sharedConnection];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v3;
  id v29 = [obj countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v6 = [v30 userValueForUnionSetting:v5];
        id v7 = [v30 userValueForIntersectionSetting:v5];
        id v8 = [v30 userValueForSetting:v5];
        unsigned int v9 = [v30 userBoolValueForSetting:v5];
        if (v9)
        {
          +[NSNumber numberWithInt:v9 == 1];
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          if (!v6) {
            goto LABEL_11;
          }
        }
        else
        {
          id v10 = 0;
          if (!v6)
          {
LABEL_11:
            if (v8) {
              v15 = v8;
            }
            else {
              v15 = v10;
            }
            if (v7) {
              v15 = v7;
            }
            id v11 = v15;
            goto LABEL_17;
          }
        }
        id v11 = v6;
        v12 = [v30 defaultValuesForUnionSetting:v5];
        unsigned __int8 v13 = [v12 isEqual:v11];

        if (v13)
        {
          BOOL v14 = 1;
          goto LABEL_28;
        }
LABEL_17:
        if (v7
          && v11 == v7
          && ([v30 defaultValuesForIntersectionSetting:v5],
              v16 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v17 = [v16 isEqual:v7],
              v16,
              (v17 & 1) != 0))
        {
          BOOL v14 = 1;
          id v11 = v7;
        }
        else if (v8 {
               && v11 == v8
        }
               && ([v30 defaultValueForSetting:v5],
                   v18 = objc_claimAutoreleasedReturnValue(),
                   unsigned __int8 v19 = [v18 isEqual:v8],
                   v18,
                   (v19 & 1) != 0))
        {
          BOOL v14 = 1;
          id v11 = v8;
        }
        else
        {
          BOOL v14 = 0;
          if (v10 && v11 == v10)
          {
            BOOL v14 = [v30 defaultBoolValueForSetting:v5] == v9;
            id v11 = v10;
          }
        }
LABEL_28:
        v20 = +[STLog restrictionsMigrator];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413826;
          *(void *)v36 = v5;
          *(_WORD *)&v36[8] = 2112;
          *(void *)&v36[10] = v10;
          __int16 v37 = 2112;
          id v38 = v8;
          __int16 v39 = 2112;
          id v40 = v7;
          __int16 v41 = 2112;
          v42 = v6;
          __int16 v43 = 2112;
          id v44 = v11;
          __int16 v45 = 1024;
          BOOL v46 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "For feature %@ found values b %@ s %@ i %@ u %@, picked %@, is default %d", buf, 0x44u);
        }

        if (!v14) {
          [v26 setObject:v11 forKeyedSubscript:v5];
        }
      }
      id v29 = [obj countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v29);
  }

  v21 = [v30 userBookmarks];
  v22 = v21;
  if (v21 && [v21 count]) {
    [v26 setObject:v22 forKeyedSubscript:@"MCBookmarks"];
  }
  v23 = +[STLog restrictionsMigrator];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = [obj count];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v36 = v24;
    *(_WORD *)&v36[4] = 2114;
    *(void *)&v36[6] = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Collected changed features (out of %d): %{public}@", buf, 0x12u);
  }

  [(STRestrictionsMigrator *)v25 setCollectedSettings:v26];
}

- (BOOL)_isEmptyConfiguration:(id)a3
{
  id v3 = a3;
  CFTypeID v4 = [v3 serialize];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"Payload"];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = +[STLog restrictionsMigrator];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Built configuration %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v6 == 0;
}

- (id)localOrganizationIdentifierWithBase:(id)a3
{
  return +[NSString stringWithFormat:@"%@_personal", a3];
}

- (id)configurationIdentifierForType:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@", STRestrictionsBaseIdentifier, a3];
}

- (id)typeForConfigurationIdentifier:(id)a3
{
  id v3 = (void *)STRestrictionsBaseIdentifier;
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "substringFromIndex:", (char *)objc_msgSend(v3, "length") + 1);

  return v5;
}

- (id)invertBooleanNumber:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 BOOLValue]) {
      uint64_t v5 = &__kCFBooleanFalse;
    }
    else {
      uint64_t v5 = &__kCFBooleanTrue;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)dayItemFromCurfew:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  uint64_t v5 = objc_opt_new();
  [v5 setFormatOptions:544];
  id v6 = [v4 timeZone];
  [v5 setTimeZone:v6];

  id v7 = [v3 objectForKeyedSubscript:@"start"];
  id v8 = [v3 objectForKeyedSubscript:@"end"];
  int v9 = [v3 objectForKeyedSubscript:@"enabled"];

  id v10 = 0;
  if (![v9 BOOLValue] || !v7)
  {
LABEL_13:

    goto LABEL_14;
  }

  if (v8)
  {
    id v10 = objc_opt_new();
    int v9 = [v5 dateFromString:v7];
    if (v9)
    {
      __int16 v11 = [v4 components:224 fromDate:v9];
      if (v11) {
        [v10 setStartTime:v11];
      }
    }
    v12 = [v5 dateFromString:v8];
    if (v12)
    {
      unsigned __int8 v13 = [v4 components:224 fromDate:v12];
      if (v13) {
        [v10 setEndTime:v13];
      }
    }
    goto LABEL_13;
  }
  id v10 = 0;
LABEL_14:

  return v10;
}

- (void)migrateSettingsToConfigurations
{
  id v4 = objc_opt_new();
  uint64_t v5 = [(STRestrictionsMigrator *)self collectedSettings];
  if (!v5)
  {
    v160 = +[NSAssertionHandler currentHandler];
    [v160 handleFailureInMethod:a2, self, @"STRestrictionsMigrator.m", 263, @"Invalid parameter not satisfying: %@", @"features" object file lineNumber description];
  }
  id v6 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"account.settings"];
  id v7 = +[CEMAccountSettingsDeclaration buildRequiredOnlyWithIdentifier:v6];

  uint64_t v8 = MCFeatureAccountModificationAllowed;
  int v9 = [v5 objectForKeyedSubscript:MCFeatureAccountModificationAllowed];
  [v7 setPayloadAllowAccountModification:v9];

  [v5 setObject:0 forKeyedSubscript:v8];
  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v7]) {
    [v4 addObject:v7];
  }

  id v10 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"application.settings"];
  __int16 v11 = +[CEMApplicationSettingsDeclaration buildRequiredOnlyWithIdentifier:v10];

  uint64_t v12 = MCFeatureAutomaticAppUpdatesModificationAllowed;
  unsigned __int8 v13 = [v5 objectForKeyedSubscript:MCFeatureAutomaticAppUpdatesModificationAllowed];
  [v11 setPayloadAllowAutomaticAppUpdatesModification:v13];

  [v5 setObject:0 forKeyedSubscript:v12];
  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v11]) {
    [v4 addObject:v11];
  }

  BOOL v14 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"application.store"];
  v15 = +[CEMApplicationStoreDeclaration buildRequiredOnlyWithIdentifier:v14];

  uint64_t v16 = MCFeatureAppClipsAllowed;
  unsigned __int8 v17 = [v5 objectForKeyedSubscript:MCFeatureAppClipsAllowed];
  [v15 setPayloadAllowAppClips:v17];

  uint64_t v18 = MCFeatureAppInstallationAllowed;
  unsigned __int8 v19 = [v5 objectForKeyedSubscript:MCFeatureAppInstallationAllowed];
  [v15 setPayloadAllowAppInstallation:v19];

  uint64_t v20 = MCFeatureAppRemovalAllowed;
  v21 = [v5 objectForKeyedSubscript:MCFeatureAppRemovalAllowed];
  [v15 setPayloadAllowAppRemoval:v21];

  uint64_t v22 = MCFeatureInAppPurchasesAllowed;
  v23 = [v5 objectForKeyedSubscript:MCFeatureInAppPurchasesAllowed];
  [v15 setPayloadAllowInAppPurchases:v23];

  uint64_t v24 = MCFeatureITunesStorePasswordEntryForced;
  v25 = [v5 objectForKeyedSubscript:MCFeatureITunesStorePasswordEntryForced];
  [v15 setPayloadForceITunesStorePasswordEntry:v25];

  v200[0] = v16;
  v200[1] = v18;
  v200[2] = v20;
  v200[3] = v22;
  v200[4] = v24;
  v26 = +[NSArray arrayWithObjects:v200 count:5];
  [v5 removeObjectsForKeys:v26];

  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v15]) {
    [v4 addObject:v15];
  }

  v27 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"legacy.restrictions.apps"];
  uint64_t v28 = +[CEMLegacyRestrictionsAppsDeclaration buildRequiredOnlyWithIdentifier:v27];

  uint64_t v29 = MCFeatureITunesAllowed;
  v30 = [v5 objectForKeyedSubscript:MCFeatureITunesAllowed];
  [v28 setPayloadAllowiTunes:v30];

  uint64_t v31 = MCFeatureNewsAllowed;
  long long v32 = [v5 objectForKeyedSubscript:MCFeatureNewsAllowed];
  [v28 setPayloadAllowNews:v32];

  uint64_t v33 = MCFeaturePodcastsAllowed;
  long long v34 = [v5 objectForKeyedSubscript:MCFeaturePodcastsAllowed];
  [v28 setPayloadAllowPodcasts:v34];

  uint64_t v35 = MCFeatureSafariAllowed;
  v36 = [v5 objectForKeyedSubscript:MCFeatureSafariAllowed];
  [v28 setPayloadAllowSafari:v36];

  uint64_t v37 = MCFeatureVideoConferencingAllowed;
  id v38 = [v5 objectForKeyedSubscript:MCFeatureVideoConferencingAllowed];
  [v28 setPayloadAllowVideoConferencing:v38];

  uint64_t v39 = MCFeatureGroupActivityAllowed;
  [v5 objectForKeyedSubscript:MCFeatureGroupActivityAllowed];
  id v40 = v176 = v5;
  [v28 setPayloadAllowGroupActivity:v40];

  v199[0] = v29;
  v199[1] = v31;
  v199[2] = v33;
  v199[3] = v35;
  v199[4] = v37;
  v199[5] = v39;
  __int16 v41 = +[NSArray arrayWithObjects:v199 count:6];
  [v176 removeObjectsForKeys:v41];

  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v28]) {
    [v4 addObject:v28];
  }

  v42 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"media.settings"];
  __int16 v43 = +[CEMMediaSettingsDeclaration buildRequiredOnlyWithIdentifier:v42];

  uint64_t v44 = MCFeatureBookstoreAllowed;
  __int16 v45 = [v176 objectForKeyedSubscript:MCFeatureBookstoreAllowed];
  [v43 setPayloadAllowBookstore:v45];

  uint64_t v46 = MCFeatureBookstoreEroticaAllowed;
  v47 = [v176 objectForKeyedSubscript:MCFeatureBookstoreEroticaAllowed];
  [v43 setPayloadAllowBookstoreErotica:v47];

  v198[0] = v44;
  v198[1] = v46;
  v48 = +[NSArray arrayWithObjects:v198 count:2];
  [v176 removeObjectsForKeys:v48];

  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v43]) {
    [v4 addObject:v43];
  }

  v49 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"network.cellular.settings"];
  v50 = +[CEMNetworkCellularSettingsDeclaration buildRequiredOnlyWithIdentifier:v49];

  uint64_t v51 = MCFeatureCellularPlanModificationAllowed;
  v52 = [v176 objectForKeyedSubscript:MCFeatureCellularPlanModificationAllowed];
  [v50 setPayloadAllowCellularPlanModification:v52];

  uint64_t v53 = MCFeatureAppCellularDataModificationAllowed;
  v54 = [v176 objectForKeyedSubscript:MCFeatureAppCellularDataModificationAllowed];
  [v50 setPayloadAllowAppCellularDataModification:v54];

  v197[0] = v51;
  v197[1] = v53;
  v55 = +[NSArray arrayWithObjects:v197 count:2];
  [v176 removeObjectsForKeys:v55];

  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v50]) {
    [v4 addObject:v50];
  }

  v56 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"system.airdrop"];
  v57 = +[CEMSystemAirdropDeclaration buildRequiredOnlyWithIdentifier:v56];

  uint64_t v58 = MCFeatureAirDropAllowed;
  v59 = [v176 objectForKeyedSubscript:MCFeatureAirDropAllowed];
  [v57 setPayloadAllowAirDrop:v59];

  [v176 setObject:0 forKeyedSubscript:v58];
  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v57]) {
    [v4 addObject:v57];
  }

  v60 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"system.camera"];
  v61 = +[CEMSystemCameraDeclaration buildRequiredOnlyWithIdentifier:v60];

  uint64_t v62 = MCFeatureCameraAllowed;
  v63 = [v176 objectForKeyedSubscript:MCFeatureCameraAllowed];
  [v61 setPayloadAllowCamera:v63];

  uint64_t v64 = MCFeatureScreenRecordingAllowed;
  v65 = [v176 objectForKeyedSubscript:MCFeatureScreenRecordingAllowed];
  [v61 setPayloadAllowScreenRecording:v65];

  v196[0] = v62;
  v196[1] = v64;
  v66 = +[NSArray arrayWithObjects:v196 count:2];
  [v176 removeObjectsForKeys:v66];

  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v61]) {
    [v4 addObject:v61];
  }

  v67 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"system.carplay"];
  v68 = +[CEMSystemCarPlayDeclaration buildRequiredOnlyWithIdentifier:v67];

  uint64_t v69 = MCFeatureVehicleUIAllowed;
  v70 = [v176 objectForKeyedSubscript:MCFeatureVehicleUIAllowed];
  [v68 setPayloadAllowVehicleUI:v70];

  [v176 setObject:0 forKeyedSubscript:v69];
  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v68]) {
    [v4 addObject:v68];
  }

  v71 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"system.donotdisturb"];
  v72 = +[CEMSystemDoNotDisturbDeclaration buildRequiredOnlyWithIdentifier:v71];

  uint64_t v73 = MCFeatureDriverDoNotDisturbModificationsAllowed;
  v74 = [v176 objectForKeyedSubscript:MCFeatureDriverDoNotDisturbModificationsAllowed];
  [v72 setPayloadAllowDriverDoNotDisturbModifications:v74];

  [v176 setObject:0 forKeyedSubscript:v73];
  if (![(STRestrictionsMigrator *)self _isEmptyConfiguration:v72]) {
    [v4 addObject:v72];
  }

  v75 = [(STRestrictionsMigrator *)self configurationIdentifierForType:@"system.gamecenter"];
  v76 = +[CEMSystemGameCenterDeclaration buildRequiredOnlyWithIdentifier:v75];

  uint64_t v77 = MCFeatureMultiplayerGamingAllowed;
  v78 = [v176 objectForKeyedSubscript:MCFeatureMultiplayerGamingAllowed];
  [v76 setPayloadAllowMultiplayerGaming:v78];

  uint64_t v79 = MCFeatureGameCenterAllowedOtherPlayerTypes;
  v80 = [v176 objectForKeyedSubscript:MCFeatureGameCenterAllowedOtherPlayerTypes];
  [v76 setPayloadAllowedGameCenterOtherPlayerTypes:v80];

  uint64_t v81 = MCFeatureAddingGameCenterFriendsAllowed;
  v82 = [v176 objectForKeyedSubscript:MCFeatureAddingGameCenterFriendsAllowed];
  [v76 setPayloadAllowAddingGameCenterFriends:v82];

  uint64_t v83 = MCFeatureGameCenterNearbyMultiplayerAllowed;
  v84 = [v176 objectForKeyedSubscript:MCFeatureGameCenterNearbyMultiplayerAllowed];
  [v76 setPayloadAllowGameCenterNearbyMultiplayer:v84];

  v85 = [v176 objectForKeyedSubscript:MCFeatureGameCenterFriendsSharingModificationAllowed];
  [v76 setPayloadAllowGameCenterFriendsSharingModification:v85];

  uint64_t v86 = MCFeatureGameCenterPrivateMessagingAllowed;
  v87 = [v176 objectForKeyedSubscript:MCFeatureGameCenterPrivateMessagingAllowed];
  [v76 setPayloadAllowGameCenterPrivateMessaging:v87];

  uint64_t v88 = MCFeatureGameCenterProfilePrivacyModificationAllowed;
  v89 = [v176 objectForKeyedSubscript:MCFeatureGameCenterProfilePrivacyModificationAllowed];
  [v76 setPayloadAllowGameCenterProfilePrivacyModification:v89];

  uint64_t v90 = MCFeatureGameCenterProfileModificationAllowed;
  [v176 objectForKeyedSubscript:MCFeatureGameCenterProfileModificationAllowed];
  v91 = v175 = self;
  [v76 setPayloadAllowGameCenterProfileModification:v91];

  v195[0] = v77;
  v195[1] = v79;
  v195[2] = v81;
  v195[3] = v83;
  v195[4] = v86;
  v195[5] = v88;
  v195[6] = v90;
  v92 = +[NSArray arrayWithObjects:v195 count:7];
  [v176 removeObjectsForKeys:v92];

  if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v76]) {
    [v4 addObject:v76];
  }

  v93 = [(STRestrictionsMigrator *)v175 configurationIdentifierForType:@"system.icloud"];
  v94 = +[CEMSystemiCloudDeclaration buildRequiredOnlyWithIdentifier:v93];

  uint64_t v95 = MCFeatureFindMyFriendsModificationAllowed;
  v96 = [v176 objectForKeyedSubscript:MCFeatureFindMyFriendsModificationAllowed];
  [v94 setPayloadAllowFindMyFriendsModification:v96];

  [v176 setObject:0 forKeyedSubscript:v95];
  if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v94]) {
    [v4 addObject:v94];
  }

  v97 = [(STRestrictionsMigrator *)v175 configurationIdentifierForType:@"system.music"];
  v98 = +[CEMSystemMusicDeclaration buildRequiredOnlyWithIdentifier:v97];

  uint64_t v99 = MCFeatureMusicArtistActivityAllowed;
  v100 = [v176 objectForKeyedSubscript:MCFeatureMusicArtistActivityAllowed];
  [v98 setPayloadAllowMusicArtistActivity:v100];

  uint64_t v101 = MCFeatureMusicVideosAllowed;
  v102 = [v176 objectForKeyedSubscript:MCFeatureMusicVideosAllowed];
  [v98 setPayloadAllowMusicVideos:v102];

  [v176 setObject:0 forKeyedSubscript:v99];
  [v176 setObject:0 forKeyedSubscript:v101];
  if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v98]) {
    [v4 addObject:v98];
  }

  uint64_t v103 = MCFeatureMaximumAppsRating;
  v104 = [v176 objectForKeyedSubscript:MCFeatureMaximumAppsRating];
  v171 = v4;
  if (v104)
  {

    uint64_t v105 = MCFeatureMaximumMoviesRating;
LABEL_34:
    v172 = [(STRestrictionsMigrator *)v175 sourceRatingRegionCode];
    uint64_t v107 = MCFeatureMaximumTVShowsRating;
    goto LABEL_35;
  }
  uint64_t v105 = MCFeatureMaximumMoviesRating;
  v106 = [v176 objectForKeyedSubscript:MCFeatureMaximumMoviesRating];
  if (v106)
  {

    goto LABEL_34;
  }
  uint64_t v107 = MCFeatureMaximumTVShowsRating;
  v108 = [v176 objectForKeyedSubscript:MCFeatureMaximumTVShowsRating];

  if (v108) {
    goto LABEL_34;
  }
  v172 = 0;
LABEL_35:
  uint64_t v165 = v105;
  uint64_t v162 = v107;
  v161 = [(STRestrictionsMigrator *)v175 configurationIdentifierForType:@"system.ratings"];
  v109 = [v176 objectForKeyedSubscript:v103];
  v110 = [v176 objectForKeyedSubscript:v105];
  [v176 objectForKeyedSubscript:v107];
  v111 = uint64_t v169 = v103;
  uint64_t v167 = MCFeatureExplicitContentAllowed;
  v112 = objc_msgSend(v176, "objectForKeyedSubscript:");
  uint64_t v113 = MCFeatureTVShowingUndownloadedTVShowsAllowed;
  v114 = [v176 objectForKeyedSubscript:MCFeatureTVShowingUndownloadedTVShowsAllowed];
  uint64_t v115 = MCFeatureTVShowingUndownloadedMoviesAllowed;
  v116 = [v176 objectForKeyedSubscript:MCFeatureTVShowingUndownloadedMoviesAllowed];
  v117 = +[CEMSystemRatingsDeclaration buildWithIdentifier:v161 withRatingRegion:v172 withRatingApps:v109 withRatingMovies:v110 withRatingTVShows:v111 withAllowExplicitContent:v112 withAllowShowingUndownloadedTV:v114 withAllowShowingUndownloadedMovies:v116];

  v194[0] = v169;
  v194[1] = v165;
  v194[2] = v162;
  v194[3] = v167;
  v194[4] = v113;
  v194[5] = v115;
  v118 = +[NSArray arrayWithObjects:v194 count:6];
  [v176 removeObjectsForKeys:v118];

  if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v117]) {
    [v4 addObject:v117];
  }

  v119 = [(STRestrictionsMigrator *)v175 configurationIdentifierForType:@"system.siri"];
  v120 = +[CEMSystemSiriDeclaration buildRequiredOnlyWithIdentifier:v119];

  uint64_t v121 = MCFeatureAssistantAllowed;
  v122 = [v176 objectForKeyedSubscript:MCFeatureAssistantAllowed];
  [v120 setPayloadAllowAssistant:v122];

  uint64_t v123 = MCFeatureDictationAllowed;
  v124 = [v176 objectForKeyedSubscript:MCFeatureDictationAllowed];
  [v120 setPayloadAllowDictation:v124];

  uint64_t v125 = MCFeatureAssistantUserGeneratedContentAllowed;
  v126 = [v176 objectForKeyedSubscript:MCFeatureAssistantUserGeneratedContentAllowed];
  [v120 setPayloadAllowAssistantUserGeneratedContent:v126];

  uint64_t v127 = MCFeatureAssistantProfanityFilterForced;
  v128 = [v176 objectForKeyedSubscript:MCFeatureAssistantProfanityFilterForced];
  [v120 setPayloadForceAssistantProfanityFilter:v128];

  v193[0] = v121;
  v193[1] = v125;
  v193[2] = v127;
  v193[3] = v123;
  v129 = +[NSArray arrayWithObjects:v193 count:4];
  [v176 removeObjectsForKeys:v129];

  if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v120]) {
    [v4 addObject:v120];
  }

  v130 = [(STRestrictionsMigrator *)v175 configurationIdentifierForType:@"system.tvprovider"];
  uint64_t v131 = MCFeatureTVProviderModificationAllowed;
  v132 = [v176 objectForKeyedSubscript:MCFeatureTVProviderModificationAllowed];
  v133 = +[CEMSystemTVProviderDeclaration buildWithIdentifier:v130 withAllowTVProviderModification:v132];

  [v176 setObject:0 forKeyedSubscript:v131];
  if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v133]) {
    [v4 addObject:v133];
  }

  uint64_t v170 = MCFeatureWebContentFilterAutoForced;
  v134 = objc_msgSend(v176, "objectForKeyedSubscript:");
  uint64_t v168 = MCFeatureWebContentFilterBlacklistedURLs;
  v135 = objc_msgSend(v176, "objectForKeyedSubscript:");
  uint64_t v164 = MCFeatureWebContentFilterAutoPermittedURLs;
  v136 = objc_msgSend(v176, "objectForKeyedSubscript:");
  uint64_t v163 = MCFeatureWebContentFilterWhitelistedURLs;
  v137 = objc_msgSend(v176, "objectForKeyedSubscript:");
  uint64_t v138 = [v176 objectForKeyedSubscript:@"MCBookmarks"];
  v166 = (void *)v138;
  if (v137)
  {
    v139 = (void *)v138;
    v173 = v137;

    v140 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v139 count]);
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id v141 = v139;
    id v142 = [v141 countByEnumeratingWithState:&v177 objects:v192 count:16];
    if (v142)
    {
      id v143 = v142;
      uint64_t v144 = *(void *)v178;
      do
      {
        for (i = 0; i != v143; i = (char *)i + 1)
        {
          if (*(void *)v178 != v144) {
            objc_enumerationMutation(v141);
          }
          v146 = *(void **)(*((void *)&v177 + 1) + 8 * i);
          v147 = [v146 URL];
          v148 = [v147 absoluteString];
          v149 = [v146 title];
          v150 = +[CEMSystemBasicWebContentFilterDeclaration_SiteWhiteListItem buildWithAddress:v148 withPageTitle:v149];

          [v140 addObject:v150];
        }
        id v143 = [v141 countByEnumeratingWithState:&v177 objects:v192 count:16];
      }
      while (v143);
    }

    v135 = 0;
    v136 = 0;
    v151 = &__kCFBooleanTrue;
    v134 = &__kCFBooleanFalse;
    id v4 = v171;
    v137 = v173;
  }
  else
  {
    v140 = 0;
    v151 = 0;
  }
  if ([v134 BOOLValue] && objc_msgSend(v136, "count"))
  {

    v137 = 0;
    v151 = &__kCFBooleanFalse;
  }
  v152 = v135;
  if (([v134 BOOLValue] & 1) != 0 || objc_msgSend(v151, "BOOLValue"))
  {
    char v153 = 0;
    v154 = &__kCFBooleanTrue;
  }
  else
  {
    v154 = 0;
    char v153 = 1;
  }
  v155 = +[STLog restrictionsMigrator];
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v183 = v134;
    __int16 v184 = 2114;
    v185 = v151;
    __int16 v186 = 2112;
    v187 = v136;
    __int16 v188 = 2112;
    v189 = v152;
    __int16 v190 = 2112;
    v191 = v140;
    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "Web filter migration: auto %{public}@ manual %{public}@, auto whitelist %@, auto blacklist %@, manual sites %@", buf, 0x34u);
  }

  if ((v153 & 1) == 0)
  {
    v174 = v137;
    v156 = [(STRestrictionsMigrator *)v175 configurationIdentifierForType:@"system.webcontentfilter.basic"];
    v157 = +[CEMSystemBasicWebContentFilterDeclaration buildWithIdentifier:v156 withRestrictWeb:v154 withUseContentFilter:v134 withWhiteListEnabled:v151 withSiteWhiteList:v140 withFilterWhiteList:v136 withFilterBlackList:v152];

    if (![(STRestrictionsMigrator *)v175 _isEmptyConfiguration:v157]) {
      [v4 addObject:v157];
    }

    v137 = v174;
  }
  v181[0] = v170;
  v181[1] = v164;
  v181[2] = v163;
  v181[3] = v168;
  v158 = +[NSArray arrayWithObjects:v181 count:4];
  [v176 removeObjectsForKeys:v158];

  id v159 = [v4 copy];
  [(STRestrictionsMigrator *)v175 setRestrictionConfigurations:v159];
}

- (BOOL)hasMigratorRun
{
  CFDictionaryRef v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = (uint64_t)[v2 integerForKey:@"RestrictionsMigrationVersion"] > 1;

  return v3;
}

- (BOOL)migrateContentPrivacyConfigurationsInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v108 = 0;
  id v7 = +[STCoreUser fetchLocalUserInContext:v6 error:&v108];
  id v8 = v108;
  if (v7)
  {
    if ([v7 screenTimeEnabled])
    {
      int v9 = +[STLog restrictionsMigrator];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1002653B4();
      }
    }
    else
    {
      [v7 setScreenTimeEnabled:1];
      int v9 = +[STLog restrictionsMigrator];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1002653E8();
      }
    }

    uint64_t v12 = [v7 localSettings];
    unsigned __int8 v13 = [v12 organization];

    if (!v13)
    {
      v15 = +[STLog restrictionsMigrator];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100264EF0();
      }
      BOOL v11 = 0;
      goto LABEL_90;
    }
    v96 = self;
    BOOL v14 = [v7 dsid];
    v15 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v14 fromOrganization:v13];

    id v107 = v8;
    uint64_t v16 = [v15 execute:&v107];
    id v17 = v107;

    if (!v16)
    {
      unsigned __int8 v19 = +[STLog restrictionsMigrator];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100264F30();
      }

      if (a4)
      {
        id v17 = v17;
        BOOL v11 = 0;
        *a4 = v17;
      }
      else
      {
        BOOL v11 = 0;
      }
      goto LABEL_89;
    }
    if ([v16 count])
    {
      uint64_t v18 = +[STLog restrictionsMigrator];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100265374();
      }

      BOOL v11 = 1;
      goto LABEL_89;
    }
    v93 = [(STRestrictionsMigrator *)v96 restrictionConfigurations];
    v91 = a4;
    v92 = v16;
    uint64_t v90 = v15;
    if ([v93 count])
    {
      id v20 = [objc_alloc((Class)STBlueprint) initWithContext:v6];
      [v20 setType:STBlueprintTypeRestrictions];
      [v20 setIdentifier:STRestrictionsBaseIdentifier];
      [v20 setOrganization:v13];
      v87 = v7;
      v21 = +[NSSet setWithObject:v7];
      [v20 setUsers:v21];

      [v20 setEnabled:1];
      [v20 setIsDirty:1];
      uint64_t v22 = +[STLog restrictionsMigrator];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_10026530C();
      }
      v84 = v13;
      id v23 = v6;

      uint64_t v95 = objc_opt_new();
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v24 = v93;
      id v25 = [v24 countByEnumeratingWithState:&v103 objects:v109 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v104;
        id obj = v24;
        while (2)
        {
          uint64_t v28 = 0;
          uint64_t v29 = v17;
          do
          {
            if (*(void *)v104 != v27) {
              objc_enumerationMutation(obj);
            }
            v30 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v28);
            [v30 updateServerHash];
            id v102 = v29;
            uint64_t v31 = [v30 serializeAsDataWithError:&v102];
            id v17 = v102;

            if (!v31)
            {
              v55 = +[STLog restrictionsMigrator];
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
                sub_1002652A4();
              }

              id v6 = v23;
              unsigned __int8 v13 = v84;
              v15 = v90;
              uint64_t v16 = v92;
              if (v91)
              {
                id v17 = v17;
                BOOL v11 = 0;
                id *v91 = v17;
              }
              else
              {
                BOOL v11 = 0;
              }
              id v7 = v87;
              goto LABEL_88;
            }
            id v32 = [objc_alloc((Class)STBlueprintConfiguration) initWithContext:v23];
            [v30 declarationIdentifier];
            v34 = id v33 = v20;
            [v32 setIdentifier:v34];

            uint64_t v35 = [v30 declarationIdentifier];
            v36 = [(STRestrictionsMigrator *)v96 typeForConfigurationIdentifier:v35];
            [v32 setType:v36];

            id v20 = v33;
            [v32 setPayloadPlist:v31];
            [v32 setBlueprint:v33];
            [v95 addObject:v32];

            uint64_t v28 = (char *)v28 + 1;
            uint64_t v29 = v17;
          }
          while (v26 != v28);
          id v24 = obj;
          id v26 = [obj countByEnumeratingWithState:&v103 objects:v109 count:16];
          uint64_t v16 = v92;
          if (v26) {
            continue;
          }
          break;
        }
      }

      uint64_t v37 = +[STLog restrictionsMigrator];
      v15 = v90;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_10026523C();
      }

      id v6 = v23;
      unsigned __int8 v13 = v84;
      id v7 = v87;
    }
    STAvailableVersion1CategoriesExcludingSystemCategories();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = STAvailableCategoriesExcludingSystemCategories();
    id obj = [(STRestrictionsMigrator *)v96 downtimeConfiguration];
    uint64_t v95 = (void *)v38;
    if (obj)
    {
      id v39 = [objc_alloc((Class)STBlueprint) initWithContext:v6];
      [v39 setType:STBlueprintTypeDowntime];
      id v40 = [(STRestrictionsMigrator *)v96 localOrganizationIdentifierWithBase:STActivationIdentifierDowntime];
      [v39 setIdentifier:v40];

      [v39 setOrganization:v13];
      __int16 v41 = +[NSSet setWithObject:v7];
      [v39 setUsers:v41];

      [v39 setEnabled:1];
      [v39 setIsDirty:1];
      id v42 = [objc_alloc((Class)STBlueprintSchedule) initWithContext:v6];
      [v42 setScheduleRepresentation:obj];
      [v42 setCalendarIdentifier:NSCalendarIdentifierGregorian];
      __int16 v43 = +[NSNumber numberWithDouble:STDefaultTimeIntervalBeforeDowntime];
      [v42 setNotificationTimeInterval:v43];

      v85 = v39;
      id v79 = v42;
      [v39 setSchedule:v42];
      uint64_t v44 = [(STRestrictionsMigrator *)v96 localOrganizationIdentifierWithBase:STConfigurationIdentifierDowntime];
      __int16 v45 = +[CEMPolicyCategoryDeclaration buildWithIdentifier:v44 withMode:CEMPolicyCategoryDeclaration_Mode_warn withCategories:v20 withCategoriesVersion2:v95];

      [v45 updateServerHash];
      id v101 = v17;
      uint64_t v46 = [v45 serializeAsDataWithError:&v101];
      id v82 = v101;

      v80 = v45;
      if (v46)
      {
        id v88 = v20;
        id v47 = [objc_alloc((Class)STBlueprintConfiguration) initWithContext:v6];
        [v45 declarationType];
        v49 = v48 = v45;
        [v47 setType:v49];

        v50 = [v48 declarationIdentifier];
        [v47 setIdentifier:v50];

        uint64_t v51 = (void *)v46;
        [v47 setPayloadPlist:v46];
        [v47 setBlueprint:v85];
        v52 = +[STLog restrictionsMigrator];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
          sub_1002651D4();
        }

        uint64_t v53 = +[STLog restrictionsMigrator];
        uint64_t v16 = v92;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
          sub_10026516C();
        }

        id v20 = v88;
        v54 = v79;
      }
      else
      {
        uint64_t v51 = 0;
        v56 = +[STLog restrictionsMigrator];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_100265034();
        }

        uint64_t v16 = v92;
        v54 = v79;
        if (v91) {
          id *v91 = v82;
        }
      }

      if (!v51)
      {
        BOOL v11 = 0;
        id v17 = v82;
LABEL_88:

LABEL_89:
        id v8 = v17;
LABEL_90:

        goto LABEL_91;
      }
      id v17 = v82;
    }
    uint64_t v57 = [(STRestrictionsMigrator *)v96 limitConfiguration];
    uint64_t v86 = (void *)v57;
    if (v57)
    {
      uint64_t v58 = v57;
      id v89 = v20;
      id v59 = [objc_alloc((Class)STBlueprint) initWithContext:v6];
      [v59 setType:STBlueprintTypeUsageLimit];
      v60 = [(STRestrictionsMigrator *)v96 localOrganizationIdentifierWithBase:STActivationIdentifierUsageLimit];
      [v59 setIdentifier:v60];

      [v59 setOrganization:v13];
      v61 = +[NSSet setWithObject:v7];
      [v59 setUsers:v61];

      [v59 setIsDirty:1];
      id v62 = [objc_alloc((Class)STBlueprintUsageLimit) initWithContext:v6];
      [v62 setBudgetLimitScheduleRepresentation:v58];
      [v62 setCategoryIdentifiers:v89];
      [v62 setCategoryIdentifiersVersion2:v95];
      v63 = +[NSNumber numberWithDouble:STDefaultTimeIntervalBeforeDowntime];
      [v62 setNotificationTimeInterval:v63];

      id v83 = v62;
      [v59 setUsageLimit:v62];
      uint64_t v64 = [(STRestrictionsMigrator *)v96 localOrganizationIdentifierWithBase:STConfigurationIdentifierUsageLimit];
      v65 = +[CEMPolicyCategoryDeclaration buildWithIdentifier:v64 withMode:CEMPolicyCategoryDeclaration_Mode_warn withCategories:v89 withCategoriesVersion2:v95];

      [v65 updateServerHash];
      id v100 = v17;
      uint64_t v66 = [v65 serializeAsDataWithError:&v100];
      id v97 = v100;

      uint64_t v81 = (void *)v66;
      if (v66)
      {
        id v67 = [objc_alloc((Class)STBlueprintConfiguration) initWithContext:v6];
        v68 = [v65 declarationType];
        [v67 setType:v68];

        uint64_t v69 = [v65 declarationIdentifier];
        [v67 setIdentifier:v69];

        [v67 setPayloadPlist:v66];
        [v67 setBlueprint:v59];
        v70 = +[STLog restrictionsMigrator];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
          sub_100265104();
        }

        v71 = +[STLog restrictionsMigrator];
        v72 = v91;
        uint64_t v16 = v92;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
          sub_10026509C();
        }

        id v17 = v97;
      }
      else
      {
        uint64_t v73 = +[STLog restrictionsMigrator];
        id v17 = v97;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
          sub_100265034();
        }

        v72 = v91;
        uint64_t v16 = v92;
        if (v91) {
          id *v91 = v97;
        }
      }

      if (!v81)
      {
        BOOL v11 = 0;
        id v20 = v89;
        v15 = v90;
        goto LABEL_86;
      }
      id v20 = v89;
      v15 = v90;
    }
    else
    {
      v72 = v91;
    }
    if ([v6 hasChanges])
    {
      id v99 = v17;
      unsigned __int8 v74 = [v6 save:&v99];
      id v98 = v99;

      v75 = +[STLog restrictionsMigrator];
      v76 = v75;
      if (v74)
      {
        uint64_t v16 = v92;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
          sub_100264F98();
        }

        BOOL v11 = 1;
        uint64_t v77 = v86;
        id v17 = v98;
        goto LABEL_87;
      }
      id v17 = v98;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        sub_100264FCC();
      }

      uint64_t v16 = v92;
      if (v72)
      {
        id v17 = v98;
        BOOL v11 = 0;
        id *v72 = v17;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
LABEL_86:
    uint64_t v77 = v86;
LABEL_87:

    goto LABEL_88;
  }
  id v10 = +[STLog restrictionsMigrator];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100264E88();
  }

  if (a4)
  {
    id v8 = v8;
    BOOL v11 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_91:

  return v11;
}

- (void)cleanUpAfterMigration
{
  CFStringRef v2 = (const __CFString *)STSBCapabilitiesKey;
  CFStringRef v3 = (const __CFString *)STSBDomain;
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(STSBCapabilitiesKey, STSBDomain);
  +[SFRestrictionsController resetRestrictions];
  uint64_t v5 = +[MCProfileConnection sharedConnection];
  [v5 setUserBookmarks:0];
  CFPreferencesSetAppValue(@"SBParentalControlsMCContentRestrictions", 0, v3);
  CFPreferencesSetAppValue(v2, v4, v3);
  CFPreferencesAppSynchronize(v3);
  if (v4) {
    CFRelease(v4);
  }
  id v6 = +[STLog restrictionsMigrator];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10026541C();
  }
}

- (BOOL)performMigrationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[STLog restrictionsMigrator];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Content & Privacy migration starting", (uint8_t *)&v22, 2u);
  }

  [(STRestrictionsMigrator *)self collectMCFeatures];
  id v8 = [(STRestrictionsMigrator *)self collectedSettings];
  id v9 = [v8 count];
  [(STRestrictionsMigrator *)self migrateSettingsToConfigurations];
  id v10 = [(STRestrictionsMigrator *)self collectedSettings];
  id v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = +[STLog restrictionsMigrator];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [v8 count];
      BOOL v14 = [v8 allKeys];
      int v22 = 67109378;
      *(_DWORD *)id v23 = v13;
      *(_WORD *)&v23[4] = 2114;
      *(void *)&v23[6] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Incomplete migration, %d features left behind: %{public}@", (uint8_t *)&v22, 0x12u);
    }
  }
  v15 = +[STLog restrictionsMigrator];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      CFStringRef v16 = @"needed";
    }
    else {
      CFStringRef v16 = @"not needed";
    }
    id v17 = [(STRestrictionsMigrator *)self restrictionConfigurations];
    unsigned int v18 = [v17 count];
    int v22 = 138543874;
    *(void *)id v23 = v16;
    *(_WORD *)&v23[8] = 1024;
    *(_DWORD *)&v23[10] = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Content & Privacy migration is %{public}@ - %d features -> %d configurations", (uint8_t *)&v22, 0x18u);
  }
  if (v9)
  {
    if (![(STRestrictionsMigrator *)self migrateContentPrivacyConfigurationsInContext:v6 error:a4])
    {
      BOOL v20 = 0;
      goto LABEL_17;
    }
    [(STRestrictionsMigrator *)self cleanUpAfterMigration];
  }
  unsigned __int8 v19 = +[NSUserDefaults standardUserDefaults];
  [v19 setValue:&off_10030FD90 forKey:@"RestrictionsMigrationVersion"];

  BOOL v20 = 1;
LABEL_17:

  return v20;
}

- (NSDictionary)mcxSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMcxSettings:(id)a3
{
}

- (NSMutableDictionary)collectedSettings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCollectedSettings:(id)a3
{
}

- (NSArray)restrictionConfigurations
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRestrictionConfigurations:(id)a3
{
}

- (STBlueprintScheduleRepresentation)downtimeConfiguration
{
  return (STBlueprintScheduleRepresentation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDowntimeConfiguration:(id)a3
{
}

- (STBlueprintUsageLimitScheduleRepresentation)limitConfiguration
{
  return (STBlueprintUsageLimitScheduleRepresentation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLimitConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitConfiguration, 0);
  objc_storeStrong((id *)&self->_downtimeConfiguration, 0);
  objc_storeStrong((id *)&self->_restrictionConfigurations, 0);
  objc_storeStrong((id *)&self->_collectedSettings, 0);
  objc_storeStrong((id *)&self->_mcxSettings, 0);
}

@end