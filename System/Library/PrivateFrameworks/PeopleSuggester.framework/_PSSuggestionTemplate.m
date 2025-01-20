@interface _PSSuggestionTemplate
- (INImage)image;
- (NSArray)recipientContactIDs;
- (NSArray)recipientDisplayNames;
- (NSArray)recipientEmailAddresses;
- (NSArray)recipientPhoneNumbers;
- (NSDictionary)contactIdToHandleMapping;
- (NSDictionary)handleToDisplayNameMapping;
- (NSNumber)modelScore;
- (NSString)bundleID;
- (NSString)groupName;
- (NSString)interactionRecipients;
- (NSString)reason;
- (NSString)reasonType;
- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 handleToDisplayNameMapping:(id)a12 reason:(id)a13 reasonType:(id)a14 modelScore:(id)a15;
- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 reason:(id)a12 reasonType:(id)a13;
- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 reason:(id)a12 reasonType:(id)a13 modelScore:(id)a14;
- (id)description;
- (id)suggestionWithContactIDMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 contactStore:(id)a6 contactKeysToFetch:(id)a7;
@end

@implementation _PSSuggestionTemplate

- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 reason:(id)a12 reasonType:(id)a13
{
  v29 = NSNumber;
  id v30 = a13;
  id v27 = a12;
  id v26 = a11;
  id v16 = a10;
  id v17 = a9;
  id v23 = a8;
  id v18 = a7;
  id v19 = a6;
  id v25 = a5;
  id v20 = a4;
  id v21 = a3;
  v32 = [v29 numberWithDouble:-1.0];
  v34 = [(_PSSuggestionTemplate *)self initWithBundleID:v21 interactionRecipients:v20 image:v25 groupName:v19 recipientContactIDs:v18 recipientEmailAddresses:v23 recipientPhoneNumbers:v17 recipientDisplayNames:v16 contactIdToHandleMapping:v26 handleToDisplayNameMapping:0 reason:v27 reasonType:v30 modelScore:v32];

  return v34;
}

- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 reason:(id)a12 reasonType:(id)a13 modelScore:(id)a14
{
  return [(_PSSuggestionTemplate *)self initWithBundleID:a3 interactionRecipients:a4 image:a5 groupName:a6 recipientContactIDs:a7 recipientEmailAddresses:a8 recipientPhoneNumbers:a9 recipientDisplayNames:a10 contactIdToHandleMapping:a11 handleToDisplayNameMapping:0 reason:a12 reasonType:a13 modelScore:a14];
}

- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 handleToDisplayNameMapping:(id)a12 reason:(id)a13 reasonType:(id)a14 modelScore:(id)a15
{
  id v40 = a3;
  id v29 = a4;
  id v39 = a4;
  id v30 = a5;
  id v38 = a5;
  id v31 = a6;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  v41.receiver = self;
  v41.super_class = (Class)_PSSuggestionTemplate;
  id v25 = [(_PSSuggestionTemplate *)&v41 init];
  id v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_bundleID, a3);
    objc_storeStrong((id *)&v26->_interactionRecipients, v29);
    objc_storeStrong((id *)&v26->_image, v30);
    objc_storeStrong((id *)&v26->_groupName, v31);
    objc_storeStrong((id *)&v26->_recipientContactIDs, a7);
    objc_storeStrong((id *)&v26->_recipientEmailAddresses, a8);
    objc_storeStrong((id *)&v26->_recipientPhoneNumbers, a9);
    objc_storeStrong((id *)&v26->_recipientDisplayNames, a10);
    objc_storeStrong((id *)&v26->_contactIdToHandleMapping, a11);
    objc_storeStrong((id *)&v26->_handleToDisplayNameMapping, a12);
    objc_storeStrong((id *)&v26->_reason, a13);
    objc_storeStrong((id *)&v26->_reasonType, a14);
    objc_storeStrong((id *)&v26->_modelScore, a15);
  }

  return v26;
}

- (id)suggestionWithContactIDMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 contactStore:(id)a6 contactKeysToFetch:(id)a7
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v115 = a4;
  id v114 = a5;
  v11 = [(_PSSuggestionTemplate *)self bundleID];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    v121 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT)) {
      -[_PSSuggestionTemplate suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:]();
    }
    v85 = 0;
    goto LABEL_82;
  }
  v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v15 = +[_PSConstants mobileMessagesBundleId];
  id v16 = +[_PSConstants shareSheetTargetBundleIdMessages];
  id v17 = objc_msgSend(v14, "initWithObjects:", v15, v16, 0);

  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v19 = +[_PSConstants mobileMailBundleId];
  id v20 = +[_PSConstants shareSheetTargetBundleIdMail];
  uint64_t v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, 0);

  id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v23 = +[_PSConstants sharePlayBundleId];
  id v24 = (void *)v13;
  id v25 = +[_PSConstants collaborationSuggestionBundleId];
  v110 = objc_msgSend(v22, "initWithObjects:", v23, v25, 0);

  v112 = v17;
  v109 = (void *)v21;
  v111 = [v17 setByAddingObjectsFromSet:v21];
  id v113 = v10;
  v120 = v13;
  if ([v10 count])
  {
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v26 = [(_PSSuggestionTemplate *)self recipientContactIDs];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v138 objects:v148 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v139;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v139 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v138 + 1) + 8 * i);
          if (([v24 containsObject:v31] & 1) == 0)
          {
            v32 = [v10 objectForKeyedSubscript:v31];
            [v24 addObject:v31];
            if (v32)
            {
              id v33 = [(_PSSuggestionTemplate *)self contactIdToHandleMapping];
              id v34 = [v33 objectForKeyedSubscript:v31];

              if (!v34)
              {
                id v35 = [(_PSSuggestionTemplate *)self contactIdToHandleMapping];
                id v36 = [v32 identifier];
                id v34 = [v35 objectForKeyedSubscript:v36];
              }
              id v37 = [_PSRecipient alloc];
              id v38 = [v32 identifier];
              id v39 = [(_PSRecipient *)v37 initWithIdentifier:v38 handle:v34 displayName:0 contact:v32];

              [v121 addObject:v39];
              id v24 = v120;
              [v120 addObject:v31];
              if (v34) {
                [v120 addObject:v34];
              }

              id v10 = v113;
            }
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v138 objects:v148 count:16];
      }
      while (v28);
    }
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  obuint64_t j = [(_PSSuggestionTemplate *)self recipientEmailAddresses];
  uint64_t v40 = [obj countByEnumeratingWithState:&v134 objects:v147 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v135;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v135 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void *)(*((void *)&v134 + 1) + 8 * j);
        if (([v24 containsObject:v44] & 1) == 0)
        {
          v45 = [v114 objectForKeyedSubscript:v44];
          v46 = [v45 identifier];
          if (v46)
          {
            if (([v24 containsObject:v46] & 1) == 0)
            {
              v47 = [_PSRecipient alloc];
              v48 = [(_PSSuggestionTemplate *)self handleToDisplayNameMapping];
              v49 = [v48 objectForKeyedSubscript:v44];
              v50 = [(_PSRecipient *)v47 initWithIdentifier:v46 handle:v44 displayName:v49 contact:v45];

              id v24 = v120;
              [v121 addObject:v50];
              v51 = v120;
              v52 = v46;
              goto LABEL_29;
            }
          }
          else
          {
            v53 = [_PSRecipient alloc];
            v54 = [(_PSSuggestionTemplate *)self handleToDisplayNameMapping];
            v55 = [v54 objectForKeyedSubscript:v44];
            v50 = [(_PSRecipient *)v53 initWithIdentifier:&stru_1EF653EA8 handle:v44 displayName:v55 contact:0];

            id v24 = v120;
            v51 = v121;
            v52 = v50;
LABEL_29:
            [v51 addObject:v52];
          }
          [v24 addObject:v44];

          continue;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v134 objects:v147 count:16];
    }
    while (v41);
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id obja = [(_PSSuggestionTemplate *)self recipientPhoneNumbers];
  uint64_t v56 = [obja countByEnumeratingWithState:&v130 objects:v146 count:16];
  if (!v56) {
    goto LABEL_47;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v131;
  do
  {
    for (uint64_t k = 0; k != v57; ++k)
    {
      if (*(void *)v131 != v58) {
        objc_enumerationMutation(obja);
      }
      uint64_t v60 = *(void *)(*((void *)&v130 + 1) + 8 * k);
      if (([v24 containsObject:v60] & 1) == 0)
      {
        v61 = [v115 objectForKeyedSubscript:v60];
        v62 = [v61 identifier];
        if (v62)
        {
          if (([v24 containsObject:v62] & 1) == 0)
          {
            v63 = [_PSRecipient alloc];
            v64 = [(_PSSuggestionTemplate *)self handleToDisplayNameMapping];
            v65 = [v64 objectForKeyedSubscript:v60];
            v66 = [(_PSRecipient *)v63 initWithIdentifier:v62 handle:v60 displayName:v65 contact:v61];

            id v24 = v120;
            [v121 addObject:v66];
            v67 = v120;
            v68 = v62;
            goto LABEL_43;
          }
        }
        else
        {
          v69 = [_PSRecipient alloc];
          v70 = [(_PSSuggestionTemplate *)self handleToDisplayNameMapping];
          v71 = [v70 objectForKeyedSubscript:v60];
          v66 = [(_PSRecipient *)v69 initWithIdentifier:&stru_1EF653EA8 handle:v60 displayName:v71 contact:0];

          id v24 = v120;
          v67 = v121;
          v68 = v66;
LABEL_43:
          [v67 addObject:v68];
        }
        [v24 addObject:v60];

        continue;
      }
    }
    uint64_t v57 = [obja countByEnumeratingWithState:&v130 objects:v146 count:16];
  }
  while (v57);
LABEL_47:

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v116 = [(_PSSuggestionTemplate *)self recipientDisplayNames];
  uint64_t v72 = [v116 countByEnumeratingWithState:&v126 objects:v145 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    id objb = *(id *)v127;
    do
    {
      for (uint64_t m = 0; m != v73; ++m)
      {
        if (*(id *)v127 != objb) {
          objc_enumerationMutation(v116);
        }
        uint64_t v75 = *(void *)(*((void *)&v126 + 1) + 8 * m);
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        v76 = [(NSDictionary *)self->_handleToDisplayNameMapping allKeys];
        id v77 = (id)[v76 countByEnumeratingWithState:&v122 objects:v144 count:16];
        if (v77)
        {
          uint64_t v78 = *(void *)v123;
          while (2)
          {
            for (n = 0; n != v77; n = (char *)n + 1)
            {
              if (*(void *)v123 != v78) {
                objc_enumerationMutation(v76);
              }
              v80 = *(void **)(*((void *)&v122 + 1) + 8 * (void)n);
              v81 = [(NSDictionary *)self->_handleToDisplayNameMapping objectForKeyedSubscript:v80];
              if ([v81 isEqualToString:v75])
              {
                id v77 = v80;

                goto LABEL_62;
              }
            }
            id v77 = (id)[v76 countByEnumeratingWithState:&v122 objects:v144 count:16];
            if (v77) {
              continue;
            }
            break;
          }
LABEL_62:
          id v24 = v120;
        }

        v82 = [[_PSRecipient alloc] initWithIdentifier:&stru_1EF653EA8 handle:v77 displayName:v75 contact:0];
        [v121 addObject:v82];
      }
      uint64_t v73 = [v116 countByEnumeratingWithState:&v126 objects:v145 count:16];
    }
    while (v73);
  }

  v83 = [(_PSSuggestionTemplate *)self bundleID];
  if ([v112 containsObject:v83])
  {

    id v10 = v113;
    v84 = v110;
    goto LABEL_71;
  }
  v86 = [(_PSSuggestionTemplate *)self bundleID];
  int v87 = [v109 containsObject:v86];

  id v10 = v113;
  v84 = v110;
  if (v87)
  {
LABEL_71:
    v88 = [(_PSSuggestionTemplate *)self interactionRecipients];
  }
  else
  {
    v104 = [(_PSSuggestionTemplate *)self bundleID];
    int v105 = [v110 containsObject:v104];

    if (v105)
    {
      v106 = NSString;
      v107 = [(_PSSuggestionTemplate *)self interactionRecipients];
      v108 = [(_PSSuggestionTemplate *)self bundleID];
      v88 = [v106 stringWithFormat:@"%@_%@", v107, v108];
    }
    else
    {
      v88 = 0;
    }
  }
  v89 = [(_PSSuggestionTemplate *)self bundleID];
  char v90 = [v111 containsObject:v89];

  if (v90)
  {
    v91 = 0;
  }
  else
  {
    v91 = [(_PSSuggestionTemplate *)self interactionRecipients];
  }
  v92 = [(_PSSuggestionTemplate *)self groupName];
  if (v92)
  {

    goto LABEL_78;
  }
  if ([v121 count])
  {
LABEL_78:
    v93 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      v94 = [(_PSSuggestionTemplate *)self description];
      *(_DWORD *)buf = 138412290;
      v143 = v94;
      _os_log_impl(&dword_1A314B000, v93, OS_LOG_TYPE_INFO, "templateToSuggestion: %@", buf, 0xCu);
    }
    v95 = [_PSSuggestion alloc];
    v96 = [(_PSSuggestionTemplate *)self bundleID];
    v97 = [(_PSSuggestionTemplate *)self groupName];
    id v98 = [v121 copy];
    v99 = [(_PSSuggestionTemplate *)self image];
    v100 = [(_PSSuggestionTemplate *)self reason];
    v101 = [(_PSSuggestionTemplate *)self reasonType];
    v102 = [(_PSSuggestionTemplate *)self modelScore];
    v85 = [(_PSSuggestion *)v95 initWithBundleID:v96 conversationIdentifier:v88 groupName:v97 recipients:v98 derivedIntentIdentifier:v91 image:v99 reason:v100 reasonType:v101 score:v102];

    id v10 = v113;
    id v24 = v120;
    v84 = v110;
  }
  else
  {
    v96 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggestionTemplate suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:]();
    }
    v85 = 0;
  }

LABEL_82:

  return v85;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_PSSuggestionTemplate *)self groupName];
  v6 = [(_PSSuggestionTemplate *)self bundleID];
  v7 = [(_PSSuggestionTemplate *)self reason];
  v8 = [(_PSSuggestionTemplate *)self reasonType];
  v9 = [(_PSSuggestionTemplate *)self image];
  id v10 = [(_PSSuggestionTemplate *)self modelScore];
  v11 = [v3 stringWithFormat:@"<%@ %p> groupName: %@, bundleID: %@, reason: %@, reasonType: %@, image: %@ modelScore: %@", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)interactionRecipients
{
  return self->_interactionRecipients;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSArray)recipientContactIDs
{
  return self->_recipientContactIDs;
}

- (NSArray)recipientEmailAddresses
{
  return self->_recipientEmailAddresses;
}

- (NSArray)recipientPhoneNumbers
{
  return self->_recipientPhoneNumbers;
}

- (NSArray)recipientDisplayNames
{
  return self->_recipientDisplayNames;
}

- (NSDictionary)contactIdToHandleMapping
{
  return self->_contactIdToHandleMapping;
}

- (NSDictionary)handleToDisplayNameMapping
{
  return self->_handleToDisplayNameMapping;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (NSNumber)modelScore
{
  return self->_modelScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelScore, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_handleToDisplayNameMapping, 0);
  objc_storeStrong((id *)&self->_contactIdToHandleMapping, 0);
  objc_storeStrong((id *)&self->_recipientDisplayNames, 0);
  objc_storeStrong((id *)&self->_recipientPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_recipientEmailAddresses, 0);
  objc_storeStrong((id *)&self->_recipientContactIDs, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_interactionRecipients, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1A314B000, v0, OS_LOG_TYPE_FAULT, "Empty or nil bundleID on _PSSuggestion %@", v1, 0xCu);
}

- (void)suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "No groupName and recipients in _PSSuggestion %@", v2, v3, v4, v5, v6);
}

@end