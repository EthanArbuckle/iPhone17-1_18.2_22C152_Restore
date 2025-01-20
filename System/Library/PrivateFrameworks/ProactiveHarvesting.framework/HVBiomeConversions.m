@interface HVBiomeConversions
+ (id)_bmNamedHandleFromCSPerson:(uint64_t)a1;
+ (id)_bmNamedHandlesFromCSPersons:(uint64_t)a1;
+ (id)_generateRandomVersionString;
+ (id)_messagesContentEventFromSearchableItem:(id)a3 error:(id *)a4;
+ (id)_safariPageViewFromSearchableItem:(void *)a3 error:;
+ (id)_thirdPartyAppContentEventFromSearchableItem:(uint64_t)a1 error:(void *)a2;
+ (id)biomeEventFromSearchableItem:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
@end

@implementation HVBiomeConversions

+ (id)_messagesContentEventFromSearchableItem:(id)a3 error:(id *)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v100[0] = MEMORY[0x263EF8330];
  v100[1] = 3221225472;
  v100[2] = __68__HVBiomeConversions__messagesContentEventFromSearchableItem_error___block_invoke;
  v100[3] = &unk_2647D5918;
  id v7 = v6;
  id v101 = v7;
  v8 = (void (**)(void))MEMORY[0x22A6669E0](v100);
  v9 = [v7 attributeSet];
  v10 = [v7 domainIdentifier];
  int v11 = [v10 isEqualToString:@"attachmentDomain"];

  if (v11)
  {
    v12 = [v9 accountIdentifier];
    v13 = [v9 contentURL];
    v14 = [v13 lastPathComponent];

    if ([v14 length])
    {
      id v15 = objc_alloc(MEMORY[0x263F2A770]);
      v16 = [v9 contentURL];
      [v16 absoluteString];
      v18 = v17 = v8;
      v19 = (void *)[v15 initWithType:@"application/octet-stream" filename:v14 path:v18];

      v8 = v17;
    }
    else
    {
      v19 = 0;
    }

    if (!v12)
    {
LABEL_15:
      v27 = hv_default_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v40 = v8[2](v8);
        *(_DWORD *)buf = 138543362;
        v103 = v40;
        _os_log_error_impl(&dword_226C41000, v27, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ with missing conversation identifier.", buf, 0xCu);
      }
      if (a4)
      {
        v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = 5;
        goto LABEL_19;
      }
LABEL_20:
      v28 = 0;
      goto LABEL_73;
    }
  }
  else
  {
    v12 = [v7 domainIdentifier];
    v19 = 0;
    if (!v12) {
      goto LABEL_15;
    }
  }
  v20 = [v9 authors];
  uint64_t v21 = [v20 count];

  if (!v21)
  {
    v24 = hv_default_log_handle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v64 = v8[2](v8);
      *(_DWORD *)buf = 138543362;
      v103 = v64;
      _os_log_error_impl(&dword_226C41000, v24, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ with no authors.", buf, 0xCu);
    }
    if (a4)
    {
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = 4;
LABEL_19:
      [v25 errorWithDomain:@"HVErrorDomain" code:v26 userInfo:0];
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_73;
    }
    goto LABEL_20;
  }
  v22 = +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:v7];
  if (v22)
  {
    uint64_t v23 = [objc_alloc(MEMORY[0x263F02A38]) initWithKeyName:@"com_apple_mobilesms_suggested_contact_photo" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
    v97 = (void *)v23;
    if (v23)
    {
      v99 = [v9 valueForCustomKey:v23];
    }
    else
    {
      v99 = 0;
    }
    v30 = [v9 primaryRecipients];
    v31 = +[HVBiomeConversions _bmNamedHandlesFromCSPersons:]((uint64_t)a1, v30);

    v98 = v31;
    if ([v31 count])
    {
      id v74 = objc_alloc(MEMORY[0x263F2A810]);
      v95 = [v7 uniqueIdentifier];
      v94 = [v7 domainIdentifier];
      v93 = +[HVBiomeConversions _generateRandomVersionString]();
      v78 = [v9 contentCreationDate];
      [v78 timeIntervalSinceReferenceDate];
      double v33 = v32;
      v77 = [v9 authors];
      v76 = [v77 firstObject];
      v92 = +[HVBiomeConversions _bmNamedHandleFromCSPerson:]((uint64_t)a1, v76);
      v91 = [v9 attributeForKey:*MEMORY[0x263F029E0]];
      v90 = [v9 accountHandles];
      v89 = [v9 accountType];
      v88 = [v9 URL];
      v87 = [v7 protection];
      v86 = [v9 isNew];
      v85 = [v9 isTwoFactorCode];
      id v81 = [v9 isFromMe];
      v75 = v81;
      if (!v81)
      {
        v34 = v22;
        v35 = [v9 attributeForKey:@"com_apple_mobilesms_fromMe"];
        Class v36 = NSClassFromString(&cfstr_Nsnumber.isa);
        id v37 = v35;
        if (v36)
        {
          if (objc_opt_isKindOfClass()) {
            v38 = v37;
          }
          else {
            v38 = 0;
          }
        }
        else
        {
          v38 = 0;
        }
        id v81 = v38;

        v22 = v34;
      }
      v96 = v22;
      id v80 = [v9 isGroupThread];
      v73 = v80;
      if (!v80)
      {
        v41 = [v9 attributeForKey:@"com_apple_mobilesms_isGroupChat"];
        Class v42 = NSClassFromString(&cfstr_Nsnumber.isa);
        id v43 = v41;
        if (v42)
        {
          if (objc_opt_isKindOfClass()) {
            v44 = v43;
          }
          else {
            v44 = 0;
          }
        }
        else
        {
          v44 = 0;
        }
        id v80 = v44;
      }
      v45 = [v9 isLikelyJunk];
      uint64_t v46 = [v9 messageRead];
      uint64_t v47 = [v9 isPinned];
      v48 = [v9 attributeForKey:@"com_apple_mobilesms_businessChat"];
      Class v49 = NSClassFromString(&cfstr_Nsnumber.isa);
      id v50 = v48;
      if (v49)
      {
        if (objc_opt_isKindOfClass()) {
          v51 = v50;
        }
        else {
          v51 = 0;
        }
      }
      else
      {
        v51 = 0;
      }
      id v83 = v51;

      v72 = [v9 tapbackAssociatedMessageID];
      v71 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "messageTapbackType"));
      v70 = [v9 messageType];
      id v52 = [v9 messageService];
      v69 = v52;
      if (!v52)
      {
        v53 = [v9 attributeForKey:@"com_apple_mobilesms_service"];
        Class v54 = NSClassFromString(&cfstr_Nsstring.isa);
        id v55 = v53;
        if (v54)
        {
          if (objc_opt_isKindOfClass()) {
            v56 = v55;
          }
          else {
            v56 = 0;
          }
        }
        else
        {
          v56 = 0;
        }
        id v52 = v56;
      }
      v79 = v52;
      v82 = (void *)v47;
      v84 = (void *)v46;
      v68 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "messageEffectType"));
      v57 = [v9 isMessageFromKnownSender];
      v58 = [v9 attributeForKey:@"com_apple_mobilesms_chatUniqueIdentifier"];
      Class v59 = NSClassFromString(&cfstr_Nsstring.isa);
      id v60 = v58;
      if (v59)
      {
        if (objc_opt_isKindOfClass()) {
          v61 = v60;
        }
        else {
          v61 = 0;
        }
      }
      else
      {
        v61 = 0;
      }
      id v62 = v61;

      v28 = objc_msgSend(v74, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", v95, v94, v93, v12, v92, v98, v33, v91, v99, v96, &stru_26DAC8728, v90, v89,
                      v19,
                      v88,
                      v87,
                      v86,
                      v85,
                      v81,
                      v80,
                      v45,
                      v84,
                      v82,
                      v83,
                      v72,
                      v71,
                      v70,
                      v79,
                      v68,
                      v57,
                      v62);

      if (!v69) {
      if (!v73)
      }

      v22 = v96;
      if (!v75) {
    }
      }
    else
    {
      v39 = hv_default_log_handle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v8[2](v8);
        v67 = v66 = v22;
        *(_DWORD *)buf = 138543362;
        v103 = v67;
        _os_log_error_impl(&dword_226C41000, v39, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ missing recipients.", buf, 0xCu);

        v22 = v66;
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:4 userInfo:0];
        v28 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
    }
  }
  else
  {
    v29 = hv_default_log_handle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v65 = v8[2](v8);
      *(_DWORD *)buf = 138543362;
      v103 = v65;
      _os_log_error_impl(&dword_226C41000, v29, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _messagesContentEventFromSearchableItem: ignoring CSSI %{public}@ missing text content.", buf, 0xCu);

      v22 = 0;
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:4 userInfo:0];
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
  }

LABEL_73:

  return v28;
}

id __68__HVBiomeConversions__messagesContentEventFromSearchableItem_error___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v3 = [*(id *)(a1 + 32) bundleID];
  v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  v5 = [*(id *)(a1 + 32) domainIdentifier];
  id v6 = (void *)[v2 initWithFormat:@"bid:%@, uid:%@, did:%@", v3, v4, v5];

  return v6;
}

+ (id)_bmNamedHandlesFromCSPersons:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HVBiomeConversions__bmNamedHandlesFromCSPersons___block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__CSPerson_8l;
  v6[4] = v3;
  v4 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v6);

  return v4;
}

+ (id)_generateRandomVersionString
{
  self;
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"%08x", arc4random());

  return v0;
}

+ (id)_bmNamedHandleFromCSPerson:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = objc_alloc(MEMORY[0x263F2A820]);
  v4 = [v2 displayName];
  v5 = [v2 handleIdentifier];
  id v6 = [v2 handles];
  id v7 = [v6 firstObject];
  v8 = [v2 contactIdentifier];

  v9 = (void *)[v3 initWithName:v4 handleType:v5 handle:v7 contactIdentifier:v8];

  return v9;
}

id __51__HVBiomeConversions__bmNamedHandlesFromCSPersons___block_invoke(uint64_t a1, void *a2)
{
  return +[HVBiomeConversions _bmNamedHandleFromCSPerson:](*(void *)(a1 + 32), a2);
}

+ (id)biomeEventFromSearchableItem:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v211 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:@"com.apple.mobilemail"])
  {
    id v10 = v8;
    uint64_t v11 = self;
    v12 = [v10 attributeSet];
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v202 = __64__HVBiomeConversions__mailContentEventFromSearchableItem_error___block_invoke;
    v203 = &unk_2647D58C8;
    id v13 = v12;
    id v204 = v13;
    id v14 = v10;
    id v205 = v14;
    id v15 = (void (**)(void))MEMORY[0x22A6669E0](&buf);
    v16 = [v13 accountIdentifier];

    if (!v16)
    {
      v45 = hv_default_log_handle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v131 = v15[2](v15);
        *(_DWORD *)v206 = 138543362;
        *(void *)&v206[4] = v131;
        _os_log_error_impl(&dword_226C41000, v45, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with no account identifier.", v206, 0xCu);
      }
      if (a5)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:5 userInfo:0];
        v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      goto LABEL_80;
    }
    v17 = [v13 emailHeaders];
    if (v17)
    {
      v18 = [v13 authors];
      uint64_t v19 = [v18 count];

      if (v19)
      {
        v183 = v15;
        id v20 = objc_alloc(MEMORY[0x263F08968]);
        uint64_t v21 = objc_msgSend(MEMORY[0x263F08968], "hv_headerKeyFunctions");
        objc_msgSend(MEMORY[0x263F08968], "hv_headerValueFunctions");
        v22 = v194 = v17;
        uint64_t v23 = objc_msgSend(v20, "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v21, v22, objc_msgSend(v194, "count"));

        v17 = v194;
        v24 = v23;
        objc_msgSend(v23, "hv_addEntriesFromHeadersDictionary:", v194);
        uint64_t v25 = [v13 mailMessageID];
        if (v25
          || (objc_msgSend(v23, "hv_firstHeaderForKey:", @"message-id"),
              (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v178 = (void *)v25;
          uint64_t v26 = [v13 HTMLContentDataNoCopy];

          if (v26)
          {
            uint64_t v27 = +[HVSearchableItemHelper htmlContentDataNoCopyRetainingBackingBuffer:v14];
            uint64_t v28 = 0;
          }
          else
          {
            uint64_t v28 = +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:v14];
            uint64_t v27 = 0;
          }
          v177 = (void *)v27;
          v182 = (void *)v28;
          if (v27 | v28)
          {
            id v80 = [v23 objectForKey:@"reply-to"];
            v154 = v80;
            if ([v80 count])
            {
              id v81 = objc_alloc(MEMORY[0x263F2A820]);
              v82 = [v80 firstObject];
              v175 = (void *)[v81 initWithString:v82];

              v24 = v23;
            }
            else
            {
              v175 = 0;
            }
            v155 = v24;
            v89 = [v24 objectForKey:@"list-id"];
            v153 = v89;
            if ([v89 count])
            {
              id v90 = objc_alloc(MEMORY[0x263F2A820]);
              v91 = [v89 firstObject];
              v173 = (void *)[v90 initWithString:v91];
            }
            else
            {
              v173 = 0;
            }
            v95 = hv_default_log_handle();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              v96 = v183[2](v183);
              *(_DWORD *)v206 = 138543362;
              *(void *)&v206[4] = v96;
              _os_log_impl(&dword_226C41000, v95, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _mailContentEventFromSearchableItem: CSSI %{public}@ will be queued by ProactiveHarvesting", v206, 0xCu);
            }
            id v147 = objc_alloc(MEMORY[0x263F2A800]);
            uint64_t v97 = [v14 uniqueIdentifier];
            v171 = [v14 domainIdentifier];
            v170 = +[HVBiomeConversions _generateRandomVersionString]();
            v152 = [v13 contentCreationDate];
            [v152 timeIntervalSinceReferenceDate];
            double v99 = v98;
            v169 = [v13 accountIdentifier];
            v151 = [v13 authors];
            v150 = [v151 firstObject];
            v168 = +[HVBiomeConversions _bmNamedHandleFromCSPerson:](v11, v150);
            v149 = [v13 primaryRecipients];
            v167 = +[HVBiomeConversions _bmNamedHandlesFromCSPersons:](v11, v149);
            v148 = [v13 additionalRecipients];
            v166 = +[HVBiomeConversions _bmNamedHandlesFromCSPersons:](v11, v148);
            v146 = [v13 hiddenAdditionalRecipients];
            v165 = +[HVBiomeConversions _bmNamedHandlesFromCSPersons:](v11, v146);
            uint64_t v100 = [v13 subject];
            id v101 = &stru_26DAC8728;
            v145 = (void *)v100;
            if (v100) {
              id v101 = (__CFString *)v100;
            }
            v143 = v101;
            v144 = [v13 isPartiallyDownloaded];
            int v142 = [v144 BOOLValue] ^ 1;
            v164 = [v13 securityMethod];
            v163 = [v13 accountHandles];
            v162 = [v13 mailboxIdentifiers];
            v161 = [v13 accountType];
            id v102 = v13;
            self;
            v103 = [v102 attachmentTypes];
            uint64_t v104 = [v103 count];

            v105 = [v102 attachmentNames];
            uint64_t v106 = [v105 count];

            v107 = [v102 attachmentPaths];
            uint64_t v108 = [v107 count];

            id v189 = v9;
            id v193 = v8;
            id v156 = v14;
            v172 = (void *)v97;
            if (v104 == v106 && v104 == v108)
            {
              uint64_t v109 = objc_opt_new();
              v157 = (void *)v109;
              if (v104)
              {
                id v159 = v13;
                uint64_t v110 = 0;
                uint64_t v199 = v104;
                v111 = (void *)v109;
                do
                {
                  id v112 = objc_alloc(MEMORY[0x263F2A770]);
                  v113 = [v102 attachmentTypes];
                  v114 = [v113 objectAtIndexedSubscript:v110];
                  v115 = [v102 attachmentNames];
                  v116 = [v115 objectAtIndexedSubscript:v110];
                  v117 = [v102 attachmentPaths];
                  v118 = [v117 objectAtIndexedSubscript:v110];
                  v119 = (void *)[v112 initWithType:v114 filename:v116 path:v118];
                  [v111 addObject:v119];

                  ++v110;
                }
                while (v199 != v110);
                id v13 = v159;
                id v14 = v156;
              }
            }
            else
            {
              v120 = hv_default_log_handle();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v206 = 134218496;
                *(void *)&v206[4] = v104;
                __int16 v207 = 2048;
                uint64_t v208 = v106;
                __int16 v209 = 2048;
                uint64_t v210 = v108;
                _os_log_error_impl(&dword_226C41000, v120, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _bmAttachmentsFromSearchableItemAttributes: attachment info length mismatch: %tu types, %tu names, %tu paths", v206, 0x20u);
              }

              v157 = 0;
            }

            v200 = [v14 protection];
            v160 = [v102 mailConversationID];
            v158 = [v102 mailDateReceived];
            v141 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "mailCategories"));
            v121 = [v102 isNew];
            v140 = [v102 isTwoFactorCode];
            v139 = [v102 isFromMe];
            v122 = [v102 isLikelyJunk];
            v138 = [v102 mailRead];
            v123 = [v102 mailVIP];
            v124 = [v102 mailFlagged];
            v92 = v177;
            LOBYTE(v137) = v142;
            v17 = v194;
            v30 = objc_msgSend(v147, "initWithUniqueId:domainId:personaId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:contentProtection:conversationId:dateReceived:mailCategories:isNew:isTwoFactorCode:isFromMe:isJunk:isRead:isVIP:isFlagged:", v172, v171, v170, v169, v178, v168, v99, v167, v166, v165, v194, v143, v177,
                            v182,
                            v137,
                            v164,
                            v163,
                            v175,
                            v162,
                            v173,
                            v161,
                            v157,
                            v200,
                            v160,
                            v158,
                            v141,
                            v121,
                            v140,
                            v139,
                            v122,
                            v138,
                            v123,
                            v124);

            v93 = v178;
            id v14 = v156;

            v94 = v182;
            id v15 = v183;
            id v9 = v189;
            id v8 = v193;
            v24 = v155;
          }
          else
          {
            id v83 = hv_default_log_handle();
            id v15 = v183;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              v183[2](v183);
              v133 = v132 = v24;
              *(_DWORD *)v206 = 138543362;
              *(void *)&v206[4] = v133;
              _os_log_error_impl(&dword_226C41000, v83, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ missing html and text content.", v206, 0xCu);

              v24 = v132;
            }

            if (a5)
            {
              [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:4 userInfo:0];
              v30 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = 0;
            }
            v92 = v177;
            v93 = v178;
            v94 = v182;
          }
        }
        else
        {
          v126 = hv_default_log_handle();
          id v15 = v183;
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            v183[2](v183);
            v135 = v134 = v24;
            *(_DWORD *)v206 = 138543362;
            *(void *)&v206[4] = v135;
            _os_log_error_impl(&dword_226C41000, v126, OS_LOG_TYPE_ERROR, "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with missing message identifier.", v206, 0xCu);

            v24 = v134;
          }

          if (a5)
          {
            [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:5 userInfo:0];
            v30 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v30 = 0;
          }
        }

        goto LABEL_79;
      }
      Class v59 = hv_default_log_handle();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
LABEL_28:

        if (a5)
        {
          [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:4 userInfo:0];
          v30 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
LABEL_79:

LABEL_80:
        goto LABEL_81;
      }
      id v60 = v15[2](v15);
      *(_DWORD *)v206 = 138543362;
      *(void *)&v206[4] = v60;
      v61 = "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with no authors.";
    }
    else
    {
      Class v59 = hv_default_log_handle();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      id v60 = v15[2](v15);
      *(_DWORD *)v206 = 138543362;
      *(void *)&v206[4] = v60;
      v61 = "HVBiomeConversions: _mailContentEventFromSearchableItem: ignoring CSSI %{public}@ with no email headers.";
    }
    _os_log_error_impl(&dword_226C41000, v59, OS_LOG_TYPE_ERROR, v61, v206, 0xCu);

    goto LABEL_28;
  }
  if ([v9 isEqualToString:@"com.apple.MobileSMS"])
  {
    uint64_t v29 = [a1 _messagesContentEventFromSearchableItem:v8 error:a5];
LABEL_11:
    v30 = (void *)v29;
    goto LABEL_81;
  }
  if ([v9 isEqualToString:@"com.apple.news"])
  {
    id v31 = v8;
    self;
    double v32 = +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:v31];
    if (v32)
    {
      double v33 = [v31 attributeSet];
      id v184 = objc_alloc(MEMORY[0x263F2A828]);
      v180 = [v31 uniqueIdentifier];
      [v31 domainIdentifier];
      v34 = id v190 = v8;
      +[HVBiomeConversions _generateRandomVersionString]();
      v35 = v197 = v31;
      v195 = [v33 contentCreationDate];
      [v195 timeIntervalSinceReferenceDate];
      double v37 = v36;
      [v33 title];
      v38 = id v186 = v9;
      uint64_t v39 = [v33 contentDescription];
      v40 = (void *)v39;
      if (v39) {
        v41 = (__CFString *)v39;
      }
      else {
        v41 = &stru_26DAC8728;
      }
      Class v42 = [v33 namedLocation];
      [v197 protection];
      v44 = id v43 = v32;
      v30 = (void *)[v184 initWithUniqueId:v180 domainId:v34 personaId:v35 absoluteTimestamp:v38 title:v43 content:v41 summary:v37 publication:v42 contentProtection:v44];

      double v32 = v43;
      id v9 = v186;

      id v31 = v197;
      id v8 = v190;
    }
    else
    {
      v76 = hv_default_log_handle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_226C41000, v76, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _newsArticleViewFromSearchableItem: received news item with no content: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5)
      {
        v77 = (void *)MEMORY[0x263F087E8];
        *(void *)v206 = *MEMORY[0x263F08320];
        *(void *)&long long buf = @"received news item with no content";
        [NSDictionary dictionaryWithObjects:&buf forKeys:v206 count:1];
        v79 = id v78 = v9;
        *a5 = [v77 errorWithDomain:@"HVErrorDomain" code:4 userInfo:v79];

        id v9 = v78;
      }
      v30 = 0;
    }

    goto LABEL_56;
  }
  if ([v9 isEqualToString:@"com.apple.mobilenotes"])
  {
    id v31 = v8;
    self;
    uint64_t v46 = +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:v31];
    if (v46)
    {
      uint64_t v47 = [v31 attributeSet];
      v48 = v46;
      id v49 = objc_alloc(MEMORY[0x263F2A838]);
      id v50 = [v31 uniqueIdentifier];
      [v31 domainIdentifier];
      v51 = id v191 = v8;
      +[HVBiomeConversions _generateRandomVersionString]();
      id v52 = v187 = v9;
      v53 = [v47 contentCreationDate];
      [v53 timeIntervalSinceReferenceDate];
      double v55 = v54;
      v56 = [v47 title];
      v57 = [v31 protection];
      v58 = v49;
      uint64_t v46 = v48;
      v30 = (void *)[v58 initWithUniqueId:v50 domainId:v51 personaId:v52 absoluteTimestamp:v56 title:v48 content:v57 contentProtection:v55];

      id v9 = v187;
      id v8 = v191;
    }
    else
    {
      v84 = hv_default_log_handle();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_226C41000, v84, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _notesContentEventFromSearchableItem: received notes item with no content: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5)
      {
        v85 = (void *)MEMORY[0x263F087E8];
        *(void *)v206 = *MEMORY[0x263F08320];
        *(void *)&long long buf = @"received notes item with no content";
        [NSDictionary dictionaryWithObjects:&buf forKeys:v206 count:1];
        v87 = id v86 = v9;
        v88 = v85;
        uint64_t v46 = 0;
        *a5 = [v88 errorWithDomain:@"HVErrorDomain" code:4 userInfo:v87];

        id v9 = v86;
      }
      v30 = 0;
    }

    goto LABEL_56;
  }
  if ([v9 isEqualToString:@"com.apple.reminders"])
  {
    id v62 = v8;
    self;
    id v31 = [v62 attributeSet];
    id v63 = objc_alloc(MEMORY[0x263F2A8C8]);
    v64 = [v62 uniqueIdentifier];
    v65 = [v62 domainIdentifier];
    v185 = +[HVBiomeConversions _generateRandomVersionString]();
    v198 = [v31 contentCreationDate];
    [v198 timeIntervalSinceReferenceDate];
    double v67 = v66;
    v179 = [v31 title];
    v176 = [v31 comment];
    v196 = [v31 allDay];
    unsigned int v174 = [v196 BOOLValue];
    v181 = [v31 completionDate];
    [v181 timeIntervalSinceReferenceDate];
    double v69 = v68;
    [v31 dueDate];
    v70 = id v192 = v8;
    [v70 timeIntervalSinceReferenceDate];
    double v72 = v71;
    [v31 rankingHint];
    v73 = id v188 = v9;
    int v74 = [v73 intValue];
    v75 = [v62 protection];

    LODWORD(v136) = v74;
    v30 = (void *)[v63 initWithUniqueId:v64 domainId:v65 personaId:v185 absoluteTimestamp:v179 title:v176 notes:v174 isAllDay:v67 completionDateTimestamp:v69 dueDateTimestamp:v72 priority:v136 contentProtection:v75];

    id v9 = v188;
    id v8 = v192;

LABEL_56:
    goto LABEL_81;
  }
  if ([v9 isEqualToString:@"com.apple.mobilesafari"])
  {
    uint64_t v29 = +[HVBiomeConversions _safariPageViewFromSearchableItem:error:]((uint64_t)a1, v8, a5);
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"com.apple.usernotificationsd"])
  {
    v127 = hv_default_log_handle();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      v128 = "HVBiomeConversions: biomeEventFromSearchableItem: harvesting notifications is no longer supported";
      v129 = v127;
      uint32_t v130 = 2;
LABEL_94:
      _os_log_impl(&dword_226C41000, v129, OS_LOG_TYPE_INFO, v128, (uint8_t *)&buf, v130);
    }
  }
  else
  {
    if (![v9 hasPrefix:@"com.apple."])
    {
      uint64_t v29 = +[HVBiomeConversions _thirdPartyAppContentEventFromSearchableItem:error:]((uint64_t)a1, v8);
      goto LABEL_11;
    }
    v127 = hv_default_log_handle();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      v128 = "HVBiomeConversions: biomeEventFromSearchableItem: ignoring CSSI from unsupported first party app: %@.";
      v129 = v127;
      uint32_t v130 = 12;
      goto LABEL_94;
    }
  }

  v30 = 0;
LABEL_81:

  return v30;
}

+ (id)_safariPageViewFromSearchableItem:(void *)a3 error:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a2;
  self;
  v5 = [v4 attributeSet];
  id v6 = [v5 textContentDataSource];
  unsigned int v7 = [v6 isEqualToString:@"ReaderText"];

  id v8 = [v5 contentURL];
  id v9 = [v8 absoluteString];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:v4];
    if (v11)
    {
      v35 = (void *)v11;
      v12 = [v5 lastUsedDate];
      if (!v12)
      {
        id v13 = hv_default_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_226C41000, v13, OS_LOG_TYPE_FAULT, "HVBiomeConversions: attributes.lastUsedDate nil on Safari event", buf, 2u);
        }

        v12 = [MEMORY[0x263EFF910] date];
      }
      id v14 = objc_alloc(MEMORY[0x263F2A8F8]);
      v34 = [v4 uniqueIdentifier];
      id v15 = [v4 domainIdentifier];
      v16 = +[HVBiomeConversions _generateRandomVersionString]();
      [v12 timeIntervalSinceReferenceDate];
      double v18 = v17;
      uint64_t v19 = [v5 title];
      [v4 protection];
      id v20 = v4;
      v22 = uint64_t v21 = v5;
      uint64_t v23 = v14;
      v24 = v35;
      uint64_t v25 = (void *)[v23 initWithUniqueId:v34 domainId:v15 personaId:v16 absoluteTimestamp:v19 title:v35 content:v7 contentIsReaderText:v18 url:v8 contentProtection:v22];

      v5 = v21;
      id v4 = v20;

      goto LABEL_17;
    }
    id v31 = hv_default_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v41 = v4;
      _os_log_impl(&dword_226C41000, v31, OS_LOG_TYPE_DEFAULT, "HVBiomeConversions: _safariPageViewFromSearchableItem: received item with no content: %@", buf, 0xCu);
    }

    if (a3)
    {
      double v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08320];
      double v37 = @"received item with no content";
      v12 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v30 = [v32 errorWithDomain:@"HVErrorDomain" code:4 userInfo:v12];
      v24 = 0;
      goto LABEL_16;
    }
    v24 = 0;
  }
  else
  {
    id v26 = [NSString alloc];
    uint64_t v27 = [v4 uniqueIdentifier];
    v24 = (void *)[v26 initWithFormat:@"ignoring CSSI %@ due to missing contentURL", v27];

    uint64_t v28 = hv_default_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v41 = v24;
      _os_log_error_impl(&dword_226C41000, v28, OS_LOG_TYPE_ERROR, "HVBiomeConversions: safariPageViewFromSearchableItem: %@", buf, 0xCu);
    }

    if (a3)
    {
      uint64_t v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F08320];
      uint64_t v39 = v24;
      v12 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v30 = [v29 errorWithDomain:@"HVErrorDomain" code:7 userInfo:v12];
LABEL_16:
      uint64_t v25 = 0;
      *a3 = v30;
LABEL_17:

      goto LABEL_20;
    }
  }
  uint64_t v25 = 0;
LABEL_20:

  return v25;
}

+ (id)_thirdPartyAppContentEventFromSearchableItem:(uint64_t)a1 error:(void *)a2
{
  id v2 = a2;
  self;
  id v3 = [v2 attributeSet];
  id v4 = +[HVSearchableItemHelper textContentNoCopyRetainingBackingBuffer:v2];
  id v5 = objc_alloc(MEMORY[0x263F2A9D8]);
  double v17 = [v2 uniqueIdentifier];
  v16 = [v2 domainIdentifier];
  id v15 = [v2 bundleID];
  id v6 = +[HVBiomeConversions _generateRandomVersionString]();
  double v18 = [v3 contentCreationDate];
  [v18 timeIntervalSinceReferenceDate];
  double v8 = v7;
  id v9 = [v3 title];
  uint64_t v10 = [v3 contentDescription];
  uint64_t v11 = [v3 comment];
  v12 = [v2 protection];

  id v14 = (id)[v5 initWithUniqueId:v17 domainId:v16 bundleId:v15 personaId:v6 absoluteTimestamp:v9 title:v10 desc:v8 comment:v11 content:v4 contentProtection:v12];

  return v14;
}

id __64__HVBiomeConversions__mailContentEventFromSearchableItem_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [*(id *)(a1 + 32) emailHeaders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (![@"message-id" caseInsensitiveCompare:v7])
        {
          id v9 = [*(id *)(a1 + 32) emailHeaders];
          uint64_t v10 = [v9 objectForKeyedSubscript:v7];
          objc_msgSend(v10, "_pas_componentsJoinedByString:", @", ");
          double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  double v8 = 0;
LABEL_11:

  id v11 = [NSString alloc];
  v12 = [*(id *)(a1 + 40) bundleID];
  id v13 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v14 = [*(id *)(a1 + 40) domainIdentifier];
  id v15 = (void *)v14;
  v16 = @"UNKNOWN!";
  if (v8) {
    v16 = v8;
  }
  double v17 = (void *)[v11 initWithFormat:@"bid:%@, uid:%@, did:%@, mid:%@", v12, v13, v14, v16];

  return v17;
}

@end