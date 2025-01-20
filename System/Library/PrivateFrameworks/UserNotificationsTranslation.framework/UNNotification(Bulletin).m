@interface UNNotification(Bulletin)
+ (id)notificationForBulletin:()Bulletin;
@end

@implementation UNNotification(Bulletin)

+ (id)notificationForBulletin:()Bulletin
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 context];
  v113 = [v4 objectForKey:@"contentDate"];

  v112 = [v3 date];
  v111 = [v3 defaultAction];
  v5 = [v3 context];
  v110 = [v5 objectForKey:@"recordDate"];

  v6 = [v3 publisherBulletinID];
  v7 = [v3 dismissalID];
  unsigned int v109 = [v6 isEqualToString:v7];

  v120 = [MEMORY[0x263EFF8C0] array];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [v3 primaryAttachment];

  if (v9)
  {
    v10 = [v3 primaryAttachment];
    [v8 addObject:v10];
  }
  v11 = [v3 additionalAttachments];

  if (v11)
  {
    v12 = [v3 additionalAttachments];
    [v8 addObjectsFromArray:v12];
  }
  v114 = v3;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = v8;
  uint64_t v123 = [obj countByEnumeratingWithState:&v125 objects:v129 count:16];
  if (v123)
  {
    uint64_t v121 = *(void *)v126;
    uint64_t v115 = *MEMORY[0x263F1E0C0];
    uint64_t v118 = *MEMORY[0x263F1E0B0];
    uint64_t v117 = *MEMORY[0x263F1E0A0];
    do
    {
      for (uint64_t i = 0; i != v123; ++i)
      {
        if (*(void *)v126 != v121) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v125 + 1) + 8 * i);
        v15 = [v14 URL];
        v16 = [v15 path];

        if (v16)
        {
          v17 = (void *)[objc_alloc(MEMORY[0x263F1DF90]) initFileURLWithPath:v16 sandboxExtensionClass:@"com.apple.usernotifications.attachments.read-only"];
          v18 = [v14 thumbnailGeneratorUserInfo];
          v19 = v18;
          if (v18)
          {
            uint64_t v20 = [v18 mutableCopy];
          }
          else
          {
            uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
          }
          v21 = (void *)v20;
          v22 = [v14 uniformType];
          if (v22) {
            [v21 setObject:v22 forKey:v115];
          }
          v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "thumbnailHidden"));
          [v21 setObject:v23 forKey:v118];

          v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "hiddenFromDefaultExpandedView"));
          [v21 setObject:v24 forKey:v117];

          v25 = (void *)MEMORY[0x263F1DF20];
          v26 = [v14 identifier];
          v27 = (void *)[v21 copy];
          v28 = [v25 attachmentWithIdentifier:v26 URL:v17 options:v27 error:0];

          if (v28)
          {
            uint64_t v29 = [v120 arrayByAddingObject:v28];

            v120 = (void *)v29;
          }
        }
      }
      uint64_t v123 = [obj countByEnumeratingWithState:&v125 objects:v129 count:16];
    }
    while (v123);
  }

  v30 = v114;
  v31 = [v114 icon];

  if (!v31)
  {
    v40 = 0;
    goto LABEL_33;
  }
  v32 = [v114 icon];
  v33 = [v32 _bestVariantForFormat:0];

  v34 = [v33 applicationIdentifier];
  v35 = [v33 imagePath];
  v36 = [v33 imageName];
  v37 = [v33 systemImageName];
  uint64_t v38 = [v33 isPrecomposed];
  if (v34)
  {
    uint64_t v39 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:v34];
  }
  else if (v35)
  {
    uint64_t v39 = [MEMORY[0x263F1DF40] iconAtPath:v35 shouldSuppressMask:v38];
  }
  else if (v36)
  {
    uint64_t v39 = [MEMORY[0x263F1DF40] iconNamed:v36 shouldSuppressMask:v38];
  }
  else
  {
    if (!v37)
    {
      v40 = 0;
      goto LABEL_32;
    }
    uint64_t v39 = objc_msgSend(MEMORY[0x263F1DF40], "iconForSystemImageNamed:", v37, v38);
  }
  v40 = (void *)v39;
LABEL_32:

  v30 = v114;
LABEL_33:
  v41 = [v30 sound];

  if (v41)
  {
    v42 = [v30 sound];
    v43 = [v42 alertConfiguration];

    uint64_t v44 = [v43 type];
    v45 = [MEMORY[0x263F1DF00] soundWithAlertType:v44];
    v46 = [v43 topic];
    v47 = __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v46, v46);
    [v45 setAlertTopic:v47];

    v48 = [v43 audioCategory];
    v49 = __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v48, v48);
    [v45 setAudioCategory:v49];

    v50 = [v114 context];
    v51 = [v50 objectForKey:@"audioVolume"];
    [v45 setAudioVolume:v51];

    v52 = [v43 topic];
    objc_msgSend(v45, "setCritical:", objc_msgSend(v52, "isEqualToString:", *MEMORY[0x263F7FCC8]));

    [v43 maximumDuration];
    objc_msgSend(v45, "setMaximumDuration:");
    objc_msgSend(v45, "setShouldIgnoreRingerSwitch:", objc_msgSend(v43, "shouldIgnoreRingerSwitch"));
    objc_msgSend(v45, "setShouldRepeat:", objc_msgSend(v43, "shouldRepeat"));
    v53 = [v43 externalToneFileURL];
    v54 = [v53 lastPathComponent];
    [v45 setToneFileName:v54];

    v55 = [v43 externalToneFileURL];
    [v45 setToneFileURL:v55];

    v56 = [v43 toneIdentifier];
    v57 = __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v56, v56);
    [v45 setToneIdentifier:v57];

    objc_msgSend(v45, "setToneMediaLibraryItemIdentifier:", objc_msgSend(v43, "externalToneMediaLibraryItemIdentifier"));
    v58 = [v43 vibrationIdentifier];
    v59 = __52__UNNotification_Bulletin__notificationForBulletin___block_invoke((uint64_t)v58, v58);
    [v45 setVibrationIdentifier:v59];

    v30 = v114;
    v60 = [v43 externalVibrationPatternFileURL];
    [v45 setVibrationPatternFileURL:v60];
  }
  else
  {
    v45 = 0;
  }
  v61 = [v30 communicationContext];
  if (v61)
  {
    v62 = [v30 communicationContext];
    v63 = UNCommunicationContextFromBBCommunicationContext(v62);
  }
  else
  {
    v63 = 0;
  }

  v64 = [v30 contentType];
  v119 = v64;
  if ([v64 isEqualToString:*MEMORY[0x263F2BC10]])
  {
    v65 = (id *)MEMORY[0x263F1E128];
  }
  else if ([v64 isEqualToString:*MEMORY[0x263F2BC18]])
  {
    v65 = (id *)MEMORY[0x263F1E130];
  }
  else if ([v64 isEqualToString:*MEMORY[0x263F2BC08]])
  {
    v65 = (id *)MEMORY[0x263F1E120];
  }
  else if ([v64 isEqualToString:*MEMORY[0x263F2BC20]])
  {
    v65 = (id *)MEMORY[0x263F1E138];
  }
  else if ([v64 isEqualToString:*MEMORY[0x263F2BC00]])
  {
    v65 = (id *)MEMORY[0x263F1E118];
  }
  else if ([v64 isEqualToString:*MEMORY[0x263F2BC28]])
  {
    v65 = (id *)MEMORY[0x263F1E140];
  }
  else
  {
    int v66 = [v64 isEqualToString:*MEMORY[0x263F2BBF0]];
    v65 = (id *)MEMORY[0x263F1E110];
    if (v66) {
      v65 = (id *)MEMORY[0x263F1E108];
    }
  }
  id v67 = *v65;
  id v68 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v68 setAttachments:v120];
  v69 = [v114 context];
  v70 = [v69 objectForKey:@"badge"];
  [v68 setBadge:v70];

  v71 = [v114 message];
  [v68 setBody:v71];

  v72 = [v114 categoryID];
  [v68 setCategoryIdentifier:v72];

  [v68 setCommunicationContext:v63];
  [v68 setContentType:v67];
  [v68 setDate:v113];
  v73 = [v111 appearance];
  v74 = [v73 title];
  [v68 setDefaultActionTitle:v74];

  [v68 setHasDefaultAction:v111 != 0];
  v75 = [v111 launchURL];
  [v68 setDefaultActionURL:v75];

  v76 = [v111 launchBundleID];
  [v68 setDefaultActionBundleIdentifier:v76];

  v77 = [v114 expirationDate];
  [v68 setExpirationDate:v77];

  v78 = [v114 context];
  v79 = [v78 objectForKey:*MEMORY[0x263F2BD08]];
  [v68 setLaunchImageName:v79];

  v80 = [v114 header];
  [v68 setHeader:v80];

  v81 = [v114 footer];
  [v68 setFooter:v81];

  [v68 setIcon:v40];
  [v68 setSound:v45];
  objc_msgSend(v68, "setShouldShowSubordinateIcon:", objc_msgSend(v114, "hasSubordinateIcon"));
  [v68 setShouldHideDate:v112 == 0];
  objc_msgSend(v68, "setShouldHideTime:", objc_msgSend(v114, "dateIsAllDay"));
  v82 = [v114 context];
  v83 = [v82 objectForKey:@"shouldIgnoreDoNotDisturb"];
  objc_msgSend(v68, "setShouldIgnoreDoNotDisturb:", objc_msgSend(v83, "BOOLValue"));

  objc_msgSend(v68, "setShouldIgnoreDowntime:", objc_msgSend(v114, "ignoresDowntime"));
  objc_msgSend(v68, "setShouldSuppressScreenLightUp:", objc_msgSend(v114, "turnsOnDisplay") ^ 1);
  objc_msgSend(v68, "setShouldAuthenticateDefaultAction:", objc_msgSend(v111, "isAuthenticationRequired"));
  objc_msgSend(v68, "setShouldBackgroundDefaultAction:", objc_msgSend(v111, "activationMode") == 1);
  objc_msgSend(v68, "setShouldPreventNotificationDismissalAfterDefaultAction:", objc_msgSend(v111, "shouldDismissBulletin") ^ 1);
  objc_msgSend(v68, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v114, "usesExternalSync"));
  [v68 setShouldUseRequestIdentifierForDismissalSync:v109];
  v84 = [v114 subtitle];
  [v68 setSubtitle:v84];

  v85 = [v114 threadID];
  [v68 setThreadIdentifier:v85];

  v86 = [v114 title];
  [v68 setTitle:v86];

  v87 = [v114 subsectionIDs];
  [v68 setTopicIdentifiers:v87];

  objc_msgSend(v68, "setRealertCount:", objc_msgSend(v114, "realertCount"));
  v88 = [v114 context];
  v89 = [v88 objectForKey:@"userInfo"];
  [v68 setUserInfo:v89];

  v90 = [v114 summaryArgument];
  [v68 setSummaryArgument:v90];

  objc_msgSend(v68, "setSummaryArgumentCount:", objc_msgSend(v114, "summaryArgumentCount"));
  v91 = [v114 context];
  v92 = [v91 objectForKey:@"targetContentIdentifier"];
  [v68 setTargetContentIdentifier:v92];

  unint64_t v93 = [v114 interruptionLevel];
  if (v93 >= 4) {
    unint64_t v94 = *MEMORY[0x263F1E0E0];
  }
  else {
    unint64_t v94 = v93;
  }
  [v68 setInterruptionLevel:v94];
  [v114 relevanceScore];
  [v68 setRelevanceScore:v95];
  v96 = [v114 filterCriteria];
  [v68 setFilterCriteria:v96];

  objc_msgSend(v68, "setScreenCaptureProhibited:", objc_msgSend(v114, "screenCaptureProhibited"));
  v97 = [v114 speechLanguage];
  [v68 setSpeechLanguage:v97];

  v98 = [v114 context];
  v99 = [v98 objectForKey:@"notificationTriggerData"];

  v122 = v45;
  v124 = v40;
  if (v99)
  {
    v100 = objc_msgSend(MEMORY[0x263F1DF80], "bs_secureDecodedFromData:", v99);
  }
  else
  {
    v100 = 0;
  }
  v101 = (void *)MEMORY[0x263F1DF48];
  v102 = [v114 recordID];
  v103 = [v101 requestWithIdentifier:v102 content:v68 trigger:v100];

  v104 = (void *)MEMORY[0x263F1DF08];
  v105 = [v114 section];
  v106 = [v114 intentIDs];
  v107 = [v104 notificationWithRequest:v103 date:v110 sourceIdentifier:v105 intentIdentifiers:v106];

  return v107;
}

@end