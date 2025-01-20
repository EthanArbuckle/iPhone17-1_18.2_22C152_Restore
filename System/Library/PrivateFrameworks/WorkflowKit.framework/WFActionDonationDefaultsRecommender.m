@interface WFActionDonationDefaultsRecommender
+ (id)defaultRecommendations;
@end

@implementation WFActionDonationDefaultsRecommender

+ (id)defaultRecommendations
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *MEMORY[0x1E4FB4AE8];
  int v4 = [v2 applicationIsInstalled:*MEMORY[0x1E4FB4AE8]];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mail.mailbox"];
    [v5 setEligibleForSearch:1];
    [v5 setEligibleForPrediction:1];
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"mailActivityType", @"specialMailboxType", 0);
    [v5 setRequiredUserInfoKeys:v6];

    [v5 setUserInfo:&unk_1F2317F58];
    v7 = WFLocalizedString(@"Show VIP Mailbox");
    [v5 setTitle:v7];

    id v8 = objc_alloc(MEMORY[0x1E4FB4530]);
    v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = [v9 UUIDString];
    v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = (void *)[v8 initWithUserActivity:v5 identifier:v10 sourceAppIdentifier:v3 date:v11];

    [v104 addObject:v12];
  }
  v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v14 = (void *)*MEMORY[0x1E4FB4BD0];
  int v15 = [v13 applicationIsInstalled:*MEMORY[0x1E4FB4BD0]];

  if (v15)
  {
    v16 = INIntentFromAppBundleIdAndName(v14, @"RecordVoiceMemoIntent");
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v16 response:0];
    id v18 = objc_alloc(MEMORY[0x1E4FB4520]);
    v19 = [MEMORY[0x1E4F29128] UUID];
    v20 = [v19 UUIDString];
    v21 = (void *)[v18 initWithIdentifier:v20 sourceAppIdentifier:v14 interaction:v17];

    [v104 addObject:v21];
    v22 = INIntentFromAppBundleIdAndName(v14, @"PlaybackVoiceMemoIntent");
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v22 response:0];
    id v24 = objc_alloc(MEMORY[0x1E4FB4520]);
    v25 = [MEMORY[0x1E4F29128] UUID];
    v26 = [v25 UUIDString];
    v27 = (void *)[v24 initWithIdentifier:v26 sourceAppIdentifier:v14 interaction:v23];

    [v104 addObject:v27];
  }
  v28 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v111 = *MEMORY[0x1E4FB4AF0];
  int v29 = objc_msgSend(v28, "applicationIsInstalled:");

  if (v29)
  {
    if (WFCNContactIsAuthorizedToAccessContact())
    {
      v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v102 = objc_alloc_init((Class)getCNContactStoreClass());
      *(void *)&long long v116 = 0;
      *((void *)&v116 + 1) = &v116;
      *(void *)&long long v117 = 0x2020000000;
      v31 = (id *)getCNContactPostalAddressesKeySymbolLoc_ptr;
      *((void *)&v117 + 1) = getCNContactPostalAddressesKeySymbolLoc_ptr;
      if (!getCNContactPostalAddressesKeySymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCNContactPostalAddressesKeySymbolLoc_block_invoke;
        v122 = &unk_1E6558B78;
        v123 = &v116;
        v32 = ContactsLibrary_52426();
        v33 = dlsym(v32, "CNContactPostalAddressesKey");
        *(void *)(*((void *)v123 + 1) + 24) = v33;
        getCNContactPostalAddressesKeySymbolLoc_ptr = *(void *)(*((void *)v123 + 1) + 24);
        v31 = *(id **)(*((void *)&v116 + 1) + 24);
      }
      _Block_object_dispose(&v116, 8);
      if (!v31) {
        goto LABEL_67;
      }
      v110 = v30;
      id v120 = *v31;
      v34 = (void *)MEMORY[0x1E4F1C978];
      id v35 = v120;
      v36 = [v34 arrayWithObjects:&v120 count:1];
      id v115 = 0;
      v100 = [v102 _crossPlatformUnifiedMeContactWithKeysToFetch:v36 error:&v115];
      id v105 = v115;

      if (v105)
      {
        v37 = getWFActionDonationsLogObject();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "GetDirectionsUserActivityDonations";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v105;
          _os_log_impl(&dword_1C7F0A000, v37, OS_LOG_TYPE_ERROR, "%s Error getting me contact: %@", buf, 0x16u);
        }

        v38 = MEMORY[0x1E4F1CBF0];
      }
      else
      {
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        obuint64_t j = [v100 postalAddresses];
        uint64_t v40 = [obj countByEnumeratingWithState:&v116 objects:buf count:16];
        if (v40)
        {
          uint64_t v113 = *(void *)v117;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v117 != v113) {
                objc_enumerationMutation(obj);
              }
              id v42 = [*(id *)(*((void *)&v116 + 1) + 8 * i) value];
              v43 = [v42 street];
              if ([v43 length])
              {
                v44 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.Maps"];
                [v44 setEligibleForSearch:1];
                [v44 setEligibleForPrediction:1];
                v45 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"MapsActionLaunchURLKey", @"MapsActionDestinationStringKey", @"MapsActionKey", 0);
                [v44 setRequiredUserInfoKeys:v45];

                v129 = 0;
                v130 = &v129;
                uint64_t v131 = 0x2050000000;
                v46 = (__CFString *)getGEOMapURLBuilderClass_softClass;
                uint64_t v132 = getGEOMapURLBuilderClass_softClass;
                if (!getGEOMapURLBuilderClass_softClass)
                {
                  v124 = (void *)MEMORY[0x1E4F143A8];
                  uint64_t v125 = 3221225472;
                  v126 = (__CFString *)__getGEOMapURLBuilderClass_block_invoke;
                  v127 = &unk_1E6558B78;
                  v128 = &v129;
                  __getGEOMapURLBuilderClass_block_invoke((uint64_t)&v124);
                  v46 = v130[3];
                }
                v47 = v46;
                _Block_object_dispose(&v129, 8);
                v48 = [(__CFString *)v47 URLForSearch:v43];
                v129 = @"MapsActionLaunchURLKey";
                v130 = (__CFString **)@"MapsActionDestinationStringKey";
                v124 = v48;
                uint64_t v125 = (uint64_t)v43;
                uint64_t v131 = @"MapsActionKey";
                v126 = @"MapsDirectionsActionKey";
                v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v129 count:3];
                [v44 setUserInfo:v49];

                v50 = NSString;
                v51 = WFLocalizedString(@"Get directions to %@");
                v52 = objc_msgSend(v50, "localizedStringWithFormat:", v51, v43);
                [v44 setTitle:v52];

                id v53 = objc_alloc(MEMORY[0x1E4FB4530]);
                v54 = [MEMORY[0x1E4F29128] UUID];
                v55 = [v54 UUIDString];
                v56 = [MEMORY[0x1E4F1C9C8] date];
                v57 = (void *)[v53 initWithUserActivity:v44 identifier:v55 sourceAppIdentifier:v111 date:v56];
              }
              else
              {
                v57 = 0;
              }

              if (v57) {
                [v110 addObject:v57];
              }
            }
            uint64_t v40 = [obj countByEnumeratingWithState:&v116 objects:buf count:16];
          }
          while (v40);
        }

        v38 = v110;
      }

      v39 = v110;
    }
    else
    {
      v39 = getWFActionDonationsLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "GetDirectionsUserActivityDonations";
        _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_DEFAULT, "%s Can’t get me-contact; no access to contacts",
          buf,
          0xCu);
      }
      v38 = MEMORY[0x1E4F1CBF0];
    }

    [v104 addObjectsFromArray:v38];
  }
  v58 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v106 = (void *)*MEMORY[0x1E4FB4AD0];
  int v59 = objc_msgSend(v58, "applicationIsInstalled:");

  if (v59)
  {
    id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (WFCNContactIsAuthorizedToAccessContact())
    {
      id v103 = objc_alloc_init((Class)getCNContactStoreClass());
      *(void *)&long long v116 = 0;
      *((void *)&v116 + 1) = &v116;
      *(void *)&long long v117 = 0x2050000000;
      v60 = (void *)getCNFavoritesClass_softClass;
      *((void *)&v117 + 1) = getCNFavoritesClass_softClass;
      if (!getCNFavoritesClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCNFavoritesClass_block_invoke;
        v122 = &unk_1E6558B78;
        v123 = &v116;
        __getCNFavoritesClass_block_invoke((uint64_t)buf);
        v60 = *(void **)(*((void *)&v116 + 1) + 24);
      }
      v61 = v60;
      _Block_object_dispose(&v116, 8);
      v101 = (void *)[[v61 alloc] initWithContactStore:v103];
      v62 = [v101 entries];
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      obja = v62;
      uint64_t v63 = [obja countByEnumeratingWithState:&v116 objects:buf count:16];
      if (v63)
      {
        uint64_t v114 = *(void *)v117;
        v107 = (void *)*MEMORY[0x1E4FB4B08];
        do
        {
          for (uint64_t j = 0; j != v63; ++j)
          {
            if (*(void *)v117 != v114) {
              objc_enumerationMutation(obja);
            }
            v65 = *(void **)(*((void *)&v116 + 1) + 8 * j);
            v66 = [v65 contactProperty];
            v67 = [v66 contact];

            v68 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithContact:v67];
            v69 = [v65 actionType];
            v129 = 0;
            v130 = &v129;
            uint64_t v131 = 0x2020000000;
            v70 = (__CFString *)getCNActionTypeAudioCallSymbolLoc_ptr;
            uint64_t v132 = getCNActionTypeAudioCallSymbolLoc_ptr;
            if (!getCNActionTypeAudioCallSymbolLoc_ptr)
            {
              v124 = (void *)MEMORY[0x1E4F143A8];
              uint64_t v125 = 3221225472;
              v126 = (__CFString *)__getCNActionTypeAudioCallSymbolLoc_block_invoke;
              v127 = &unk_1E6558B78;
              v128 = &v129;
              v71 = ContactsLibrary_52426();
              v72 = dlsym(v71, "CNActionTypeAudioCall");
              v128[1]->length = (uint64_t)v72;
              getCNActionTypeAudioCallSymbolLoc_ptr = v128[1]->length;
              v70 = v130[3];
            }
            _Block_object_dispose(&v129, 8);
            if (!v70)
            {
              v94 = [MEMORY[0x1E4F28B00] currentHandler];
              v95 = [NSString stringWithUTF8String:"NSString *getCNActionTypeAudioCall(void)"];
              objc_msgSend(v94, "handleFailureInFunction:file:lineNumber:description:", v95, @"WFActionDonationDefaultsRecommender.m", 27, @"%s", dlerror());

              goto LABEL_66;
            }
            char v73 = [v69 isEqualToString:v70->isa];

            if (v73)
            {
              v74 = v107;
              uint64_t v75 = 1;
LABEL_53:
              v81 = (objc_class *)MEMORY[0x1E4F30760];
              id v82 = v74;
              id v83 = [v81 alloc];
              id v120 = v68;
              v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
              v85 = (void *)[v83 initWithAudioRoute:0 destinationType:1 contacts:v84 recordTypeForRedialing:1 callCapability:v75];

              [v85 _setLaunchId:@"com.apple.InCallService"];
              [v85 _setExtensionBundleId:@"com.apple.TelephonyUtilities.PhoneIntentHandler"];
              v86 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v85 response:0];
              id v87 = objc_alloc(MEMORY[0x1E4FB4520]);
              v88 = [MEMORY[0x1E4F29128] UUID];
              v89 = [v88 UUIDString];
              v90 = (void *)[v87 initWithIdentifier:v89 sourceAppIdentifier:v82 interaction:v86];

              [v112 addObject:v90];
              goto LABEL_54;
            }
            v76 = [v65 actionType];
            v129 = 0;
            v130 = &v129;
            uint64_t v131 = 0x2020000000;
            v77 = (__CFString *)getCNActionTypeVideoCallSymbolLoc_ptr;
            uint64_t v132 = getCNActionTypeVideoCallSymbolLoc_ptr;
            if (!getCNActionTypeVideoCallSymbolLoc_ptr)
            {
              v124 = (void *)MEMORY[0x1E4F143A8];
              uint64_t v125 = 3221225472;
              v126 = (__CFString *)__getCNActionTypeVideoCallSymbolLoc_block_invoke;
              v127 = &unk_1E6558B78;
              v128 = &v129;
              v78 = ContactsLibrary_52426();
              v79 = dlsym(v78, "CNActionTypeVideoCall");
              v128[1]->length = (uint64_t)v79;
              getCNActionTypeVideoCallSymbolLoc_ptr = v128[1]->length;
              v77 = v130[3];
            }
            _Block_object_dispose(&v129, 8);
            if (!v77)
            {
              v96 = [MEMORY[0x1E4F28B00] currentHandler];
              v97 = [NSString stringWithUTF8String:"NSString *getCNActionTypeVideoCall(void)"];
              objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, @"WFActionDonationDefaultsRecommender.m", 28, @"%s", dlerror());

              while (1)
              {
LABEL_66:
                __break(1u);
LABEL_67:
                v98 = [MEMORY[0x1E4F28B00] currentHandler];
                v99 = [NSString stringWithUTF8String:"NSString *getCNContactPostalAddressesKey(void)"];
                objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, @"WFActionDonationDefaultsRecommender.m", 29, @"%s", dlerror());
              }
            }
            int v80 = [v76 isEqualToString:v77->isa];

            if (v80)
            {
              v74 = v106;
              uint64_t v75 = 2;
              goto LABEL_53;
            }
LABEL_54:
          }
          uint64_t v63 = [obja countByEnumeratingWithState:&v116 objects:buf count:16];
        }
        while (v63);
      }

      id v91 = v112;
      v92 = obja;
    }
    else
    {
      v92 = getWFActionDonationsLogObject();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "StartVideoCallOrAudioCallToFavoriteContactsDonations";
        _os_log_impl(&dword_1C7F0A000, v92, OS_LOG_TYPE_DEFAULT, "%s Can’t get favorite contacts; no access to contacts",
          buf,
          0xCu);
      }
      id v91 = (id)MEMORY[0x1E4F1CBF0];
    }

    [v104 addObjectsFromArray:v91];
  }
  return v104;
}

@end