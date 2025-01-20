@interface PPRankableSocialHighlightUtils
+ (BOOL)isSearchableItemCollaboration:(id)a3;
+ (id)rankableHighlightFromSearchableItem:(id)a3 attribution:(id)a4 autoDonatingChats:(id)a5 applicationIdentifiers:(id)a6 clientIdentifier:(id)a7 variant:(id)a8;
+ (id)rankableHighlightFromSyncedItem:(id)a3 applicationIdentifiers:(id)a4 clientIdentifier:(id)a5;
+ (int)socialContactSourceForContactSource:(unsigned __int8)a3;
@end

@implementation PPRankableSocialHighlightUtils

+ (BOOL)isSearchableItemCollaboration:(id)a3
{
  v3 = [a3 attributeSet];
  v4 = [v3 attributeForKey:*MEMORY[0x1E4F230A8]];

  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)([v4 unsignedIntegerValue] - 1) < 2;

  return v5;
}

+ (id)rankableHighlightFromSearchableItem:(id)a3 attribution:(id)a4 autoDonatingChats:(id)a5 applicationIdentifiers:(id)a6 clientIdentifier:(id)a7 variant:(id)a8
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  v19 = objc_opt_new();
  v20 = (void *)[v16 mutableCopy];
  [v19 setApplicationIdentifiers:v20];

  [v19 setClientIdentifier:v18];
  [v19 setVariant:v17];

  v21 = [v13 attributeSet];
  v22 = [v21 URL];
  v23 = [v22 absoluteString];
  [v19 setResourceUrl:v23];

  v24 = [v19 resourceUrl];

  if (v24)
  {
    v25 = [v13 attributeSet];
    v26 = [v25 attributeForKey:@"com_apple_mobilesms_resolvedURL"];

    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v19 setResolvedUrl:v26];
      }
    }
    v27 = [v13 attributeSet];
    v28 = [v27 URL];

    v29 = [v19 resolvedUrl];

    if (v29 && objc_msgSend(v28, "nr_isNewsURL"))
    {
      id v30 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v31 = [v19 resolvedUrl];
      uint64_t v32 = [v30 initWithString:v31];

      v28 = (void *)v32;
    }
    objc_msgSend(v28, "_lp_simplifiedURLStringForFuzzyMatching");
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v34 = [v28 absoluteString];
      v35 = v34;
      if (v34)
      {
        id v33 = v34;
      }
      else
      {
        v37 = [v13 attributeSet];
        [v37 URL];
        v84 = v26;
        id v38 = v16;
        v39 = v28;
        v41 = id v40 = v15;
        id v33 = [v41 absoluteString];

        id v15 = v40;
        v28 = v39;
        id v16 = v38;
        v26 = v84;
      }
    }
    v86 = v28;
    v42 = pp_default_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138739971;
      id v88 = v33;
      _os_log_debug_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_DEBUG, "RankableSocialHighlight using comparisonURL: '%{sensitive}@'", buf, 0xCu);
    }

    v85 = [v33 dataUsingEncoding:4];
    v43 = objc_msgSend(MEMORY[0x1E4F89FC8], "Sha256ForData:withSalt:");
    uint64_t v44 = [v43 base64EncodedStringWithOptions:0];

    v83 = (void *)v44;
    [v19 setHighlightIdentifier:v44];
    if ([v14 isStarred]) {
      uint64_t v45 = 2;
    }
    else {
      uint64_t v45 = 1;
    }
    [v19 setHighlightType:v45];
    v46 = [v13 attributeSet];
    v47 = [v46 contentCreationDate];
    [v47 timeIntervalSinceReferenceDate];
    objc_msgSend(v19, "setContentCreationSecondsSinceReferenceDate:");

    v82 = [v14 timestamp];
    [v82 timeIntervalSinceReferenceDate];
    objc_msgSend(v19, "setSyndicationSecondsSinceReferenceDate:");
    v48 = [v13 bundleID];
    [v19 setSourceBundleId:v48];

    v49 = [v19 sourceBundleId];

    if (v49)
    {
      v81 = v15;
      v50 = [v14 groupDisplayName];
      [v19 setDisplayName:v50];

      v51 = [v14 groupPhotoPath];
      v52 = [v51 dataRepresentation];

      if (v52)
      {
        v53 = [MEMORY[0x1E4F89FC8] Sha256ForData:v52 withSalt:0];
        v54 = [v53 base64EncodedStringWithOptions:0];
        v55 = [v54 substringToIndex:8];
        [v19 setGroupPhotoPathDigest:v55];
      }
      v56 = [v14 identifier];
      [v19 setAttributionIdentifier:v56];

      v57 = [v14 conversationIdentifier];
      [v19 setDomainIdentifier:v57];

      v58 = objc_opt_new();
      objc_msgSend(v58, "setIsMe:", objc_msgSend(v14, "isFromMe"));
      v59 = [v14 sender];
      v60 = [v59 handle];
      [v58 setHandle:v60];

      [v58 setIsSignificant:0];
      [v19 setSender:v58];
      v61 = [v14 conversationIdentifier];

      if (v61)
      {
        v62 = [v14 conversationIdentifier];
        objc_msgSend(v19, "setIsConversationAutoDonating:", objc_msgSend(v81, "containsObject:", v62));
      }
      v63 = [v13 attributeSet];
      v64 = [v63 filename];
      [v19 setContentDisplayName:v64];

      v65 = [v19 contentDisplayName];

      if (!v65)
      {
        v66 = [v13 attributeSet];
        v67 = [v66 contentSnippet];
        [v19 setContentDisplayName:v67];
      }
      v68 = [v13 attributeSet];
      v69 = [v68 contentType];
      [v19 setContentType:v69];

      v70 = [v13 attributeSet];
      v71 = [v70 attributeForKey:@"com_apple_mobilesms_collaborationIdentifier"];
      [v19 setCollaborationIdentifier:v71];

      objc_msgSend(v19, "setIsCollaboration:", +[PPRankableSocialHighlightUtils isSearchableItemCollaboration:](PPRankableSocialHighlightUtils, "isSearchableItemCollaboration:", v13));
      v72 = [v13 attributeSet];
      v73 = [v72 fileProviderID];
      [v19 setFileProviderId:v73];

      v74 = [v13 attributeSet];
      v75 = [v74 attributeForKey:@"com_apple_mobilesms_localIdentity"];
      [v19 setLocalIdentity:v75];

      v76 = [v13 attributeSet];
      v77 = [v76 attributeForKey:@"com_apple_mobilesms_localIdentityProof"];
      [v19 setLocalIdentityProof:v77];

      objc_msgSend(v19, "setFromMeEntitlementOverrideIsPresent:", objc_msgSend(v16, "containsObject:", @"fromMe"));
      if ([v16 containsObject:@"com.apple.private.sociallayer.highlights"])
      {
        v78 = [v13 attributeSet];
        v79 = [v78 attributeForKey:@"com_apple_mobilesms_handleToIdentityMap"];
        [v19 setHandleToIdentityMap:v79];
      }
      id v36 = v19;

      id v15 = v81;
      v28 = v86;
    }
    else
    {
      v52 = pp_default_log_handle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_FAULT, "RankableSocialHighlight attribute error: bundleID on CSSI is nil", buf, 2u);
      }
      id v36 = 0;
    }
  }
  else
  {
    v26 = pp_default_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_FAULT, "RankableSocialHighlight attribute error: resourceURL cannot be nil on CSSI", buf, 2u);
    }
    id v36 = 0;
  }

  return v36;
}

+ (id)rankableHighlightFromSyncedItem:(id)a3 applicationIdentifiers:(id)a4 clientIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [v9 highlight];
  v12 = [v11 identifier];
  [v10 setHighlightIdentifier:v12];

  id v13 = [v9 highlight];
  id v14 = [v13 score];
  [v14 doubleValue];
  objc_msgSend(v10, "setScore:");

  id v15 = (void *)[v8 mutableCopy];
  [v10 setApplicationIdentifiers:v15];

  [v10 setClientIdentifier:v7];
  id v16 = [v9 highlight];
  id v17 = [v16 resourceURL];
  id v18 = [v17 absoluteString];
  [v10 setResourceUrl:v18];

  v19 = [v9 highlight];
  v20 = [v19 timestamp];
  [v20 timeIntervalSinceReferenceDate];
  objc_msgSend(v10, "setSyndicationSecondsSinceReferenceDate:");

  v21 = [v9 originatingDeviceId];
  [v10 setOriginatingDeviceId:v21];

  v22 = [v9 rankingDate];

  [v22 timeIntervalSinceReferenceDate];
  objc_msgSend(v10, "setRankingSecondsSinceReferenceDate:");

  return v10;
}

+ (int)socialContactSourceForContactSource:(unsigned __int8)a3
{
  if (a3 == 2) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

@end