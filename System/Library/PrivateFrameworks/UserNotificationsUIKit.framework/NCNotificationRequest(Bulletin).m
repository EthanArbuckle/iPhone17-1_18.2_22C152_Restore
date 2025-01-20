@interface NCNotificationRequest(Bulletin)
+ (id)_notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:;
+ (id)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:;
+ (uint64_t)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:uuid:;
+ (uint64_t)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:uuid:;
- (id)attachmentImageWithDimension:()Bulletin;
- (id)bulletin;
- (id)contactIdentifier;
- (id)iconRecipe;
- (id)observer;
- (id)subordinateIconRecipe;
- (uint64_t)hasSameContactAsNotificationRequest:()Bulletin;
@end

@implementation NCNotificationRequest(Bulletin)

- (id)bulletin
{
  v1 = [a1 sourceInfo];
  v2 = [v1 objectForKey:@"BBBulletin"];

  return v2;
}

- (id)iconRecipe
{
  v1 = [a1 sourceInfo];
  v2 = [v1 objectForKey:@"NotificationIconRecipe"];

  return v2;
}

- (id)subordinateIconRecipe
{
  v1 = [a1 sourceInfo];
  v2 = [v1 objectForKey:@"NotificationSubordinateIconRecipe"];

  return v2;
}

- (id)observer
{
  v1 = [a1 sourceInfo];
  v2 = [v1 objectForKey:@"BBObserver"];

  return v2;
}

+ (id)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = [a1 notificationRequestForBulletin:v12 observer:v11 sectionInfo:v10 feed:a6 uuid:v13];

  return v14;
}

+ (uint64_t)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:uuid:
{
  return [a1 _notificationRequestForBulletin:a3 observer:a4 sectionInfo:a5 feed:a6 playLightsAndSirens:0 hasPlayLightsAndSirens:0 uuid:a7];
}

+ (uint64_t)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:uuid:
{
  return [a1 _notificationRequestForBulletin:a3 observer:a4 sectionInfo:a5 feed:a6 playLightsAndSirens:a7 hasPlayLightsAndSirens:1 uuid:a8];
}

+ (id)_notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:
{
  v223[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v191 = a4;
  id v189 = a5;
  id v184 = a9;
  v188 = [v11 sectionID];
  id v12 = objc_opt_new();
  [v12 setUuid:v184];
  v195 = v12;
  [v12 setSectionIdentifier:v188];
  v13 = [v11 subsectionIDs];
  [v195 setSubSectionIdentifiers:v13];

  v14 = [v11 publisherMatchID];
  [v195 setNotificationIdentifier:v14];

  v15 = [v11 categoryID];
  [v195 setCategoryIdentifier:v15];

  v16 = [v11 intentIDs];
  [v195 setIntentIdentifiers:v16];

  v17 = [v11 parentSectionID];
  [v195 setParentSectionIdentifier:v17];

  v183 = [v11 eventBehavior];
  [v195 setEventBehavior:v183];
  objc_msgSend(v195, "setIsHighlight:", objc_msgSend(v11, "isHighlight"));
  uint64_t v18 = [v11 priorityNotificationStatus];
  if ((unint64_t)(v18 - 1) >= 5) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v18;
  }
  [v195 setPriorityStatus:v19];
  uint64_t v20 = [v11 notificationSummaryStatus];
  if ((unint64_t)(v20 - 1) >= 4) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v20;
  }
  [v195 setSummaryStatus:v21];
  [v195 setIsPresentedAsBanner:0];
  [v195 setIsRemoved:0];
  v22 = [v11 threadID];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    v24 = [v11 threadID];
    v25 = v195;
    [v195 setThreadIdentifier:v24];
  }
  else
  {
    v26 = NSString;
    v24 = [v195 sectionIdentifier];
    v27 = [v26 stringWithFormat:@"req-%@", v24];
    v25 = v195;
    [v195 setThreadIdentifier:v27];
  }
  [v25 setThreadIdentifierUnique:v23 != 0];
  objc_msgSend(v25, "setCriticalAlert:", objc_msgSend(v11, "hasCriticalIcon"));
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  v28 = [v189 subsections];
  v29 = 0;
  uint64_t v30 = [v28 countByEnumeratingWithState:&v211 objects:v221 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v212;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v212 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v211 + 1) + 8 * i);
        v34 = [v11 subsectionIDs];
        v35 = [v33 subsectionID];
        int v36 = [v34 containsObject:v35];

        if (v36)
        {
          if (!v29 || (uint64_t v37 = [v29 subsectionPriority], v37 < objc_msgSend(v33, "subsectionPriority")))
          {
            id v38 = v33;

            v29 = v38;
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v211 objects:v221 count:16];
    }
    while (v30);
  }

  v39 = [v29 subsectionID];
  [v195 setHighestPrioritySubSectionIdentifier:v39];

  v40 = [v11 recencyDate];
  if (v40)
  {
    [v195 setTimestamp:v40];
  }
  else
  {
    v41 = [v11 date];
    if (v41)
    {
      [v195 setTimestamp:v41];
    }
    else
    {
      v42 = [v11 publicationDate];
      [v195 setTimestamp:v42];
    }
  }

  v43 = [MEMORY[0x1E4F1CA80] set];
  v44 = v43;
  unint64_t v45 = a6;
  if (a6)
  {
    [v43 addObject:@"BulletinDestinationNotificationCenter"];
    [v44 addObject:@"BulletinDestinationCoverSheet"];
    unint64_t v45 = a6;
  }
  char v46 = (a8 ^ 1 | a7) ^ 1;
  if ((v45 & 6) == 0) {
    char v46 = 1;
  }
  if ((v46 & 1) == 0)
  {
    [v44 addObject:@"BulletinDestinationBanner"];
    unint64_t v45 = a6;
  }
  if ((v45 & 0x2000) != 0)
  {
    [v44 addObject:@"BulletinDestinationDigest"];
    [v44 addObject:@"BulletinDestinationCoverSheet"];
    unint64_t v45 = a6;
  }
  if ((v45 & 8) != 0)
  {
    [v44 addObject:@"BulletinDestinationLockScreen"];
    [v44 addObject:@"BulletinDestinationCoverSheet"];
    unint64_t v45 = a6;
  }
  if ((v45 & 0x80) != 0)
  {
    [v44 addObject:@"BulletinDestinationCar"];
  }
  else if (!v45)
  {
    goto LABEL_44;
  }
  if (![v44 count])
  {
    v47 = *MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = a6;
      _os_log_impl(&dword_1D7C04000, v47, OS_LOG_TYPE_DEFAULT, "Unhandled BBObserver feed: %lu", buf, 0xCu);
    }
  }
LABEL_44:
  [v195 setRequestDestinations:v44];

  v48 = [v11 context];
  [v195 setContext:v48];

  v49 = [v11 subsectionIDs];
  [v195 setSettingsSections:v49];

  v194 = objc_opt_new();
  v50 = [v11 contentType];
  if ([v50 isEqualToString:*MEMORY[0x1E4F50C60]])
  {
    v51 = (id *)MEMORY[0x1E4F44730];
  }
  else if ([v50 isEqualToString:*MEMORY[0x1E4F50C70]])
  {
    v51 = (id *)MEMORY[0x1E4F44738];
  }
  else if ([v50 isEqualToString:*MEMORY[0x1E4F50C58]])
  {
    v51 = (id *)MEMORY[0x1E4F44720];
  }
  else if ([v50 isEqualToString:*MEMORY[0x1E4F50C88]])
  {
    v51 = (id *)MEMORY[0x1E4F44750];
  }
  else if ([v50 isEqualToString:*MEMORY[0x1E4F50C48]])
  {
    v51 = (id *)MEMORY[0x1E4F44710];
  }
  else if ([v50 isEqualToString:*MEMORY[0x1E4F50C98]])
  {
    v51 = (id *)MEMORY[0x1E4F44758];
  }
  else
  {
    int v52 = [v50 isEqualToString:*MEMORY[0x1E4F50C38]];
    v51 = (id *)MEMORY[0x1E4F44700];
    if (v52) {
      v51 = (id *)MEMORY[0x1E4F446F8];
    }
  }
  id v53 = *v51;

  [v194 setContentType:v53];
  v54 = [v11 header];
  if ([v54 length])
  {
    v55 = [v11 header];
    [v194 setCustomHeader:v55];
  }
  else
  {
    [v194 setCustomHeader:0];
  }

  v56 = [v189 displayName];
  if ([v56 length]) {
    [v189 displayName];
  }
  else {
  v57 = [v189 appName];
  }
  [v194 setDefaultHeader:v57];

  v58 = [v11 title];
  [v194 setTitle:v58];

  v59 = [v11 subtitle];
  [v194 setSubtitle:v59];

  uint64_t v60 = [v11 attributedMessage];
  if (!v60)
  {
    v61 = [v11 message];
    uint64_t v62 = objc_msgSend(MEMORY[0x1E4F28B18], "nc_safeAttributedStringWithString:", v61);

    uint64_t v60 = v62;
  }
  v181 = (void *)v60;
  objc_msgSend(v194, "setAttributedMessage:");
  if (UNCCatchMe())
  {
    v63 = [v11 summary];
    [v194 setSummary:v63];

    v64 = [v11 threadSummary];
    [v194 setThreadSummary:v64];

    v65 = [v11 spotlightIdentifier];
    [v194 setSpotlightIdentifier:v65];

    v66 = (id *)MEMORY[0x1E4FB3790];
    v67 = (id)*MEMORY[0x1E4FB3790];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = [v194 spotlightIdentifier];
      v69 = NSNumber;
      v70 = [v194 threadSummary];
      v71 = objc_msgSend(v69, "numberWithInt:", objc_msgSend(v70, "length") != 0);
      v72 = NSNumber;
      v73 = [v194 summary];
      objc_msgSend(v72, "numberWithInt:", objc_msgSend(v73, "length") != 0);
      v74 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v68;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v71;
      *(_WORD *)&buf[22] = 2112;
      v218 = v74;
      _os_log_impl(&dword_1D7C04000, v67, OS_LOG_TYPE_DEFAULT, "notification request for bulletin with spotlightID: %@ hasThreadSummary: %@ hasSummary: %@", buf, 0x20u);
    }
    v75 = *v66;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
      +[NCNotificationRequest(Bulletin) _notificationRequestForBulletin:observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:](v194, v75);
    }
  }
  v76 = [v11 footer];
  [v194 setFooter:v76];

  v77 = [v11 date];
  [v194 setDate:v77];

  objc_msgSend(v194, "setDateAllDay:", objc_msgSend(v11, "dateIsAllDay"));
  v78 = [v11 timeZone];
  [v194 setTimeZone:v78];

  v79 = [v11 hiddenPreviewsBodyPlaceholder];
  [v194 setHiddenPreviewsBodyPlaceholder:v79];

  v80 = [v11 subtypeSummaryFormat];
  [v194 setCategorySummaryFormat:v80];

  v81 = [v11 summaryArgument];
  [v194 setSummaryArgument:v81];

  objc_msgSend(v194, "setSummaryArgumentCount:", objc_msgSend(v11, "summaryArgumentCount"));
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v218 = __Block_byref_object_copy__9;
  v219 = __Block_byref_object_dispose__9;
  id v220 = 0;
  uint64_t v205 = 0;
  v206 = &v205;
  uint64_t v207 = 0x3032000000;
  v208 = __Block_byref_object_copy__9;
  v209 = __Block_byref_object_dispose__9;
  id v210 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__NCNotificationRequest_Bulletin___notificationRequestForBulletin_observer_sectionInfo_feed_playLightsAndSirens_hasPlayLightsAndSirens_uuid___block_invoke;
  aBlock[3] = &unk_1E6A93E60;
  id v82 = v11;
  id v201 = v82;
  id v186 = v189;
  id v202 = v186;
  v203 = buf;
  v204 = &v205;
  v185 = (void (**)(void *, void *, void, uint64_t, uint64_t))_Block_copy(aBlock);
  v190 = [MEMORY[0x1E4F1CA48] array];
  v185[2](v185, v190, 0, 26, 1);
  [v194 setIcons:v190];
  if (_NCIsFullScreenBannerPresentationPossible())
  {
    v83 = [MEMORY[0x1E4F1CA48] array];
    v185[2](v185, v83, 33, 34, 0);
    [v194 setFullScreenIcons:v83];
  }
  v84 = _iconRecipeForBulletinAndSectionInfo(v82, v186, 14);
  v85 = [v84 imagesForIconFormat:14];
  v182 = [v85 firstObject];
  v180 = v84;

  if (v182)
  {
    v216[0] = v182;
    v85 = [MEMORY[0x1E4F1CA98] null];
    v216[1] = v85;
    v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v216 count:2];
  }
  else
  {
    v86 = 0;
  }
  [v194 setCarPlayIcons:v86];
  if (v182)
  {
  }
  v87 = [v82 communicationContext];
  if (v87)
  {
    v88 = v87;
    v89 = [v87 recipients];
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v198 = 0u;
    long long v199 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    id v91 = v89;
    uint64_t v92 = [v91 countByEnumeratingWithState:&v196 objects:v215 count:16];
    if (v92)
    {
      uint64_t v93 = *(void *)v197;
      do
      {
        for (uint64_t j = 0; j != v92; ++j)
        {
          if (*(void *)v197 != v93) {
            objc_enumerationMutation(v91);
          }
          v95 = _unContactFromBBContact(*(void **)(*((void *)&v196 + 1) + 8 * j));
          [v90 addObject:v95];
        }
        uint64_t v92 = [v91 countByEnumeratingWithState:&v196 objects:v215 count:16];
      }
      while (v92);
    }

    id v96 = objc_alloc_init(MEMORY[0x1E4F44688]);
    v97 = [v88 identifier];
    [v96 setIdentifier:v97];

    v98 = [v88 associatedObjectUri];
    [v96 setAssociatedObjectUri:v98];

    v99 = [v88 bundleIdentifier];
    [v96 setBundleIdentifier:v99];

    v100 = [v88 displayName];
    [v96 setDisplayName:v100];

    v101 = [v88 sender];

    if (v101)
    {
      v102 = [v88 sender];
      v103 = _unContactFromBBContact(v102);

      [v96 setSender:v103];
      v104 = [MEMORY[0x1E4FB3820] sharedInstance];
      v105 = [v195 topLevelSectionIdentifier];
      id v106 = (id)[v104 updateServiceWithContact:v103 bundleIdentifier:v105];
    }
    [v96 setRecipients:v90];
    v107 = [v88 contentURL];
    [v96 setContentURL:v107];

    v108 = [v88 imageName];
    [v96 setImageName:v108];

    objc_msgSend(v96, "setSystemImage:", objc_msgSend(v88, "systemImage"));
    objc_msgSend(v96, "setMentionsCurrentUser:", objc_msgSend(v88, "mentionsCurrentUser"));
    objc_msgSend(v96, "setNotifyRecipientAnyway:", objc_msgSend(v88, "notifyRecipientAnyway"));
    objc_msgSend(v96, "setReplyToCurrentUser:", objc_msgSend(v88, "isReplyToCurrentUser"));
    objc_msgSend(v96, "setRecipientCount:", objc_msgSend(v88, "recipientCount"));
    v109 = [v82 communicationContext];
    char v110 = [v109 capabilities];

    [v96 setCapabilities:v110 & 1];
    objc_msgSend(v96, "setBusinessCorrespondence:", objc_msgSend(v88, "isBusinessCorrespondence"));
    [v194 setCommunicationContext:v96];

    v87 = v88;
  }
  v179 = v87;
  v111 = _attachmentImageForBulletin(v82, 35.0);
  if (v111) {
    [v194 setAttachmentImage:v111];
  }
  [v195 setContent:v194];
  v112 = objc_opt_new();
  v113 = [v82 alertSuppressionContexts];
  [v112 setAlertSuppressionContexts:v113];

  v114 = [v82 fullAlternateActionLabel];
  BOOL v115 = [v114 length] == 0;

  if (v115)
  {
    v117 = [v82 fullUnlockActionLabel];
    BOOL v118 = [v117 length] == 0;

    if (v118)
    {
      v119 = [v82 alternateActionLabel];
      BOOL v120 = [v119 length] == 0;

      if (v120)
      {
        v121 = [v82 unlockActionLabel];
        BOOL v122 = [v121 length] == 0;

        if (v122) {
          goto LABEL_101;
        }
        v116 = [v82 unlockActionLabel];
        [v112 setAlternateActionLabel:v116];
      }
      else
      {
        v116 = [v82 alternateActionLabel];
        [v112 setAlternateActionLabel:v116];
      }
    }
    else
    {
      v116 = [v82 fullUnlockActionLabel];
      [v112 setAlternateActionLabel:v116];
    }
  }
  else
  {
    v116 = [v82 fullAlternateActionLabel];
    [v112 setAlternateActionLabel:v116];
  }

LABEL_101:
  [v112 setDismissAutomatically:(a6 & 4) == 0];
  if ((a6 & 4) != 0) {
    uint64_t v123 = [v82 allowsPersistentBannersInCarPlay] ^ 1;
  }
  else {
    uint64_t v123 = 1;
  }
  [v112 setDismissAutomaticallyForCarPlay:v123];
  objc_msgSend(v112, "setOverridesQuietMode:", objc_msgSend(v82, "ignoresQuietMode"));
  objc_msgSend(v112, "setOverridesDowntime:", objc_msgSend(v82, "ignoresDowntime"));
  objc_msgSend(v112, "setAlertsWhenLocked:", objc_msgSend(v82, "inertWhenLocked") ^ 1);
  [v112 setAddToLockScreenWhenUnlocked:1];
  if ([v82 allowsAutomaticRemovalFromLockScreen]
    && ![v82 preventAutomaticRemovalFromLockScreen])
  {
    uint64_t v124 = 0;
  }
  else
  {
    uint64_t v124 = 2;
  }
  [v112 setLockScreenPersistence:v124];
  if ([v82 lockScreenPriority] == 2)
  {
    if ([@"com.apple.ScreenTimeDowntimeNotifications" isEqualToString:v188])
    {
      uint64_t v125 = 304;
    }
    else if ([@"com.apple.donotdisturb" isEqualToString:v188])
    {
      uint64_t v125 = 303;
    }
    else if ([@"com.apple.powerui.smartcharging" isEqualToString:v188])
    {
      uint64_t v125 = 302;
    }
    else if ([@"com.apple.Siri.ActionPredictionNotifications" isEqualToString:v188])
    {
      uint64_t v125 = 301;
    }
    else if ([@"com.apple.shortcuts" isEqualToString:v188])
    {
      uint64_t v125 = 301;
    }
    else
    {
      uint64_t v125 = 300;
    }
  }
  else if ([v82 lockScreenPriority] == 1 {
         || [v82 prioritizeAtTopOfLockScreen])
  }
  {
    uint64_t v125 = 200;
  }
  else
  {
    uint64_t v125 = 100;
  }
  [v112 setLockScreenPriority:v125];
  objc_msgSend(v112, "setSilencedByMenuButtonPress:", objc_msgSend(v82, "canBeSilencedByMenuButtonPress"));
  objc_msgSend(v112, "setOverridesPocketMode:", objc_msgSend(v82, "ignoresQuietMode"));
  objc_msgSend(v112, "setRealertCount:", objc_msgSend(v82, "realertCount"));
  objc_msgSend(v112, "setSuppressesAlertsWhenAppIsActive:", objc_msgSend(v82, "suppressesAlertsWhenAppIsActive"));
  [v112 setCanPlaySound:a7];
  if (a7 && [v82 turnsOnDisplay]) {
    uint64_t v126 = (a6 >> 11) & 1;
  }
  else {
    uint64_t v126 = 0;
  }
  [v112 setCanTurnOnDisplay:v126];
  objc_msgSend(v112, "setRequestsFullScreenPresentation:", objc_msgSend(v82, "wantsFullscreenPresentation") & (a6 >> 3));
  [v112 setHideClearActionInList:0];
  if ([v82 messageNumberOfLines] == -1) {
    uint64_t v127 = 1;
  }
  else {
    uint64_t v127 = [v82 displaysActionsInline];
  }
  [v112 setNumberOfLinesInfinite:v127];
  objc_msgSend(v112, "setPreemptsPresentedNotification:", objc_msgSend(v82, "preemptsPresentedAlert"));
  objc_msgSend(v112, "setDisplaysActionsInline:", objc_msgSend(v82, "displaysActionsInline"));
  objc_msgSend(v112, "setRevealsAdditionalContentOnPresentation:", objc_msgSend(v82, "revealsAdditionalContentOnPresentation"));
  char v128 = [v82 privacySettings];
  uint64_t v129 = [v82 contentPreviewSetting];
  BOOL v131 = (v128 & 1) == 0 && v129 != 1;
  [v112 setSuppressesTitleWhenLocked:v131];
  uint64_t v132 = [v82 contentPreviewSetting];
  BOOL v134 = (v128 & 2) == 0 && v132 != 1;
  [v112 setSuppressesSubtitleWhenLocked:v134];
  uint64_t v135 = [v82 contentPreviewSetting];
  BOOL v137 = (v128 & 4) == 0 && v135 != 1;
  [v112 setSuppressesBodyWhenLocked:v137];
  uint64_t v138 = [v82 contentPreviewSetting];
  if (v138 == 3) {
    uint64_t v139 = 2;
  }
  else {
    uint64_t v139 = v138 == 2;
  }
  [v112 setContentPreviewSetting:v139];
  objc_msgSend(v112, "setCoalescesWhenLocked:", objc_msgSend(v82, "coalescesWhenLocked"));
  objc_msgSend(v112, "setPreventsAutomaticLock:", objc_msgSend(v82, "preventLock"));
  [v112 setRevealsAdditionalContentIfNoDefaultAction:1];
  v140 = [v82 defaultAction];
  if (v140) {
    uint64_t v141 = [v82 hasCriticalIcon];
  }
  else {
    uint64_t v141 = 1;
  }
  [v112 setLauchUsingSiriForCarPlayDefaultAction:v141];

  objc_msgSend(v112, "setAllowActionsForCarPlay:", objc_msgSend(v82, "allowsSupplementaryActionsInCarPlay"));
  objc_msgSend(v112, "setPlayMediaWhenRaised:", objc_msgSend(v82, "playsMediaWhenRaised"));
  objc_msgSend(v112, "setHideCloseActionForCarPlay:", objc_msgSend(v82, "hideDismissActionInCarPlay"));
  [v112 setShouldAnnounceForCarPlay:(a6 >> 12) & 1];
  objc_msgSend(v112, "setSuppressPresentationInAmbient:", objc_msgSend(v82, "suppressPresentationInAmbient"));
  objc_msgSend(v112, "setScreenCaptureProhibited:", objc_msgSend(v82, "screenCaptureProhibited"));
  objc_msgSend(v112, "setCanShowSummary:", objc_msgSend(v186, "summarizationSetting") == 2);
  v142 = [v82 speechLanguage];
  [v112 setSpeechLanguage:v142];

  [v195 setOptions:v112];
  if ((a6 & 0x10) != 0)
  {
    v143 = [v82 sound];
    v144 = v143;
    if (v143)
    {
      id v145 = v143;
      v146 = objc_opt_new();
      [v146 setSoundType:2];
      v147 = [v145 alertConfiguration];

      [v146 setAlertConfiguration:v147];
    }
    else
    {
      v146 = 0;
    }

    [v195 setSound:v146];
  }
  v148 = (void *)MEMORY[0x1E4FB37D8];
  v149 = [v82 dismissAction];
  v150 = [v148 notificationActionForDismissAction:v149 bulletin:v82 observer:v191];

  if ([v82 wantsFullscreenPresentation])
  {
    if ([v188 isEqualToString:@"com.apple.mobiletimer"]) {
      v151 = v150;
    }
    else {
      v151 = 0;
    }
  }
  else
  {
    v151 = 0;
  }
  [v195 setCancelAction:v151];
  [v195 setClearAction:v150];
  if ([v82 shouldDismissBulletinWhenClosed]) {
    v152 = v150;
  }
  else {
    v152 = 0;
  }
  [v195 setCloseAction:v152];
  v153 = (void *)MEMORY[0x1E4FB37D8];
  v154 = [v82 defaultAction];
  v155 = [v153 notificationActionForDefaultAction:v154 bulletin:v82 observer:v191];
  [v195 setDefaultAction:v155];

  v156 = (void *)MEMORY[0x1E4FB37D8];
  v157 = [v82 silenceAction];
  v158 = [v156 notificationActionForSilenceAction:v157 bulletin:v82 observer:v191];
  [v195 setSilenceAction:v158];

  v159 = (void *)MEMORY[0x1E4FB37D8];
  v160 = [v82 followActivityAction];
  v161 = [v159 notificationActionForFollowActivityAction:v160 bulletin:v82 observer:v191];
  [v195 setInlineAction:v161];

  id v162 = v191;
  id v163 = v82;
  v164 = _actionsForLayout(v163, v162, 0);
  v165 = _actionsForLayout(v163, v162, 1);

  if ([v165 count])
  {
    v166 = v165;
  }
  else
  {
    if ((unint64_t)[v164 count] < 3)
    {
      id v167 = v164;
    }
    else
    {
      objc_msgSend(v164, "subarrayWithRange:", 0, 2);
      id v167 = (id)objc_claimAutoreleasedReturnValue();
    }
    v166 = v167;
  }
  uint64_t v168 = *MEMORY[0x1E4FB3748];
  v222[0] = *MEMORY[0x1E4FB3740];
  v222[1] = v168;
  v223[0] = v164;
  v223[1] = v166;
  v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v223 forKeys:v222 count:2];

  [v195 setSupplementaryActions:v169];
  v170 = [MEMORY[0x1E4F445C8] notificationForBulletin:v163];
  [v195 setUserNotification:v170];

  [v195 setIsCollapsedNotification:0];
  [v195 setCollapsedNotificationsCount:0];
  v171 = objc_opt_new();
  [v171 setObject:v163 forKey:@"BBBulletin"];
  [v171 setObject:v162 forKey:@"BBObserver"];
  uint64_t v172 = *(void *)(*(void *)&buf[8] + 40);
  if (v172) {
    [v171 setObject:v172 forKey:@"NotificationIconRecipe"];
  }
  uint64_t v173 = v206[5];
  if (v173) {
    [v171 setObject:v173 forKey:@"NotificationSubordinateIconRecipe"];
  }
  [v195 setSourceInfo:v171];
  uint64_t v174 = [v163 interruptionLevel];
  if ((unint64_t)(v174 - 1) >= 3) {
    uint64_t v175 = 0;
  }
  else {
    uint64_t v175 = v174;
  }
  [v195 setInterruptionLevel:v175];
  [v163 relevanceScore];
  objc_msgSend(v195, "setRelevanceScore:");
  v176 = [v163 filterCriteria];
  [v195 setFilterCriteria:v176];

  id v177 = (id)[v195 copy];
  _Block_object_dispose(&v205, 8);

  _Block_object_dispose(buf, 8);

  return v177;
}

- (uint64_t)hasSameContactAsNotificationRequest:()Bulletin
{
  id v4 = a3;
  v5 = [a1 bulletin];
  v6 = [v5 context];
  uint64_t v7 = *MEMORY[0x1E4F50CF0];
  v8 = [v6 objectForKey:*MEMORY[0x1E4F50CF0]];

  v9 = [v4 bulletin];

  id v10 = [v9 context];
  id v11 = [v10 objectForKey:v7];

  if ([v8 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL
    && ([MEMORY[0x1E4F28B88] letterCharacterSet],
        id v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v8 rangeOfCharacterFromSet:v12],
        v12,
        v13 == 0x7FFFFFFFFFFFFFFFLL))
  {
    [v8 UTF8String];
    [v11 UTF8String];
    active = (const void *)CPPhoneNumberCopyActiveCountryCode();
    uint64_t v15 = CPPhoneNumbersEqual();
    CFRelease(active);
  }
  else
  {
    uint64_t v15 = [v8 isEqualToString:v11];
  }

  return v15;
}

- (id)contactIdentifier
{
  v1 = [a1 bulletin];
  v2 = [v1 context];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F50CF0]];

  return v3;
}

- (id)attachmentImageWithDimension:()Bulletin
{
  id v4 = [a1 content];
  v5 = [v4 attachmentImage];

  if (a2 > 0.0 && a2 != 35.0 && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [a1 bulletin];
    uint64_t v7 = _attachmentImageForBulletin(v6, a2);

    v5 = (void *)v7;
  }

  return v5;
}

+ (void)_notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 spotlightIdentifier];
  id v5 = [a1 title];
  id v6 = [a1 threadSummary];
  id v7 = [a1 summary];
  int v8 = 138413059;
  id v9 = v4;
  __int16 v10 = 2117;
  id v11 = v5;
  __int16 v12 = 2117;
  id v13 = v6;
  __int16 v14 = 2117;
  id v15 = v7;
  _os_log_debug_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_DEBUG, "notification request for bulletin with spotlightID: %@ title: %{sensitive}@ threadSummary: %{sensitive}@ summary: %{sensitive}@", (uint8_t *)&v8, 0x2Au);
}

@end