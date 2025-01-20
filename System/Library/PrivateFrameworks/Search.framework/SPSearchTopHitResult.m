@interface SPSearchTopHitResult
+ (id)richTextArrayFromArray:(id)a3;
- (BOOL)_contentType:(id)a3 orContentTypeTree:(id)a4 representsType:(id)a5;
- (BOOL)audioIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)audioOrVideoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)bookIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)contactIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)documentIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)doesQueryMatchContentForLowEngagementBundle:(__packedFieldArray *)a3 queryContext:(id)a4;
- (BOOL)eventIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)imageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)messageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)playlistOrAlbumIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)reminderIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)videoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (SPResultValueItem_s)clientData;
- (SPSearchTopHitResult)initWithRankingItem:(id)a3 clientData:(SPResultValueItem_s *)a4;
- (SPSearchTopHitResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6;
- (id)authorStringFromValues:(__packedFieldArray *)a3;
- (id)eventAttributesFromValues:(__packedFieldArray *)a3 eventGroupIdentifier:(id)a4;
- (id)makeApplicationResult:(__packedFieldArray *)a3 dataclass:(id)a4 score:;
- (id)makeMailResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 score:(__packedFieldArray *)a3 searchString:(id)a4;
- (id)makeMessagesResult:(__packedFieldArray *)a3 dataclass:(id)a4 queryContext:(id)a5 score:;
- (id)makePersonResult:(__packedFieldArray *)a3 dataclass:(id)a4 queryContext:(id)a5 score:;
- (id)makePersonalAnswersResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 queryContext:(__packedFieldArray *)a3 score:(id)a4 searchString:(id)a5;
- (id)makePhotosResult:(__packedFieldArray *)a3 dataclass:(id)a4 queryContext:(id)a5 score:;
- (id)matchContentForPerson:(__packedFieldArray *)a3 queryContext:(id)a4 spotlightQueryTerms:(id)a5;
- (id)personalAnswerStringFromValues:(__packedFieldArray *)a3 queryContext:(id)a4 eventAttributes:(id)a5;
- (id)personalAnswerTitleStringFromValues:(__packedFieldArray *)a3;
- (id)titleStringFromValues:(__packedFieldArray *)a3;
- (void)attachShadowArray:(id)a3;
- (void)clearClientData;
- (void)dealloc;
- (void)makeContactResult:(__packedFieldArray *)a3 identifier:(id)a4 queryContext:(id)a5 result:(id)a6;
- (void)makeDateBasedResult:(__packedFieldArray *)a3 result:(id)a4;
- (void)populateAttributesForResult:(id)a3 withValues:(__packedFieldArray *)a4;
- (void)populateCoreSpotlightResult:(id)a3 values:(__packedFieldArray *)a4 bundleID:(id)a5 queryContext:(id)a6;
- (void)setupGenericItem:(id)a3 values:(__packedFieldArray *)a4 utiType:(id)a5 bundleID:(id)a6;
- (void)updateDataOwnerTypeForResult:(id)a3 accountID:(id)a4;
@end

@implementation SPSearchTopHitResult

- (SPSearchTopHitResult)initWithRankingItem:(id)a3 clientData:(SPResultValueItem_s *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SPSearchTopHitResult;
  result = -[SPTopHitResult initWithRankingItem:](&v12, "initWithRankingItem:", a3, a4, a5, *(void *)&a7, a9, a10, a6);
  if (result)
  {
    atomic_fetch_add(&a4->var0, 1u);
    result->_clientData = a4;
  }
  return result;
}

- (void)clearClientData
{
  clientData = self->_clientData;
  if (clientData)
  {
    if (atomic_fetch_add(&clientData->var0, 0xFFFFFFFF) == 1) {
      sub_10004E4E4((uint64_t)clientData);
    }
    self->_clientData = 0;
  }
}

- (void)attachShadowArray:(id)a3
{
  id cf = a3;
  clientData = self->_clientData;
  v5 = *(const void **)&clientData[32].var0;
  if (v5) {
    CFRelease(v5);
  }
  *(void *)&clientData[32].var0 = cf;
  CFRetain(cf);
}

- (SPResultValueItem_s)clientData
{
  return self->_clientData;
}

- (void)dealloc
{
  clientData = self->_clientData;
  if (clientData && atomic_fetch_add(&clientData->var0, 0xFFFFFFFF) == 1) {
    sub_10004E4E4((uint64_t)clientData);
  }
  v4.receiver = self;
  v4.super_class = (Class)SPSearchTopHitResult;
  [(SPSearchTopHitResult *)&v4 dealloc];
}

- (id)authorStringFromValues:(__packedFieldArray *)a3
{
  objc_super v4 = 0;
  if (![0 length])
  {
    v5 = sub_10004E8BC((uint64_t)a3, 5);
    objc_super v4 = [v5 firstObject];
  }
  if (![v4 length])
  {
    v6 = sub_10004E8BC((uint64_t)a3, 35);
    uint64_t v7 = [v6 firstObject];

    objc_super v4 = (void *)v7;
  }
  if (![v4 length])
  {
    v8 = sub_10004E8BC((uint64_t)a3, 66);
    uint64_t v9 = [v8 firstObject];

    objc_super v4 = (void *)v9;
  }

  return v4;
}

- (id)titleStringFromValues:(__packedFieldArray *)a3
{
  v5 = 0;
  if (![0 length])
  {
    v5 = sub_10004E20C((uint64_t)a3, 7);
  }
  if (![v5 length])
  {
    uint64_t v6 = sub_10004E20C((uint64_t)a3, 12);

    v5 = (void *)v6;
  }
  if (![v5 length])
  {
    uint64_t v7 = [(SPSearchTopHitResult *)self authorStringFromValues:a3];

    v5 = (void *)v7;
  }
  if (![v5 length])
  {
    uint64_t v8 = sub_10004E20C((uint64_t)a3, 4);

    v5 = (void *)v8;
  }

  return v5;
}

- (id)makeMailResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 score:(__packedFieldArray *)a3 searchString:(id)a4
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  id v10 = a4;
  v11 = sub_10004F638((uint64_t)a3, 2);
  objc_super v12 = [(SPSearchTopHitResult *)self authorStringFromValues:a3];
  id v13 = objc_alloc_init((Class)SPCoreSpotlightResult);
  v14 = +[SFText textWithString:v12];
  [v13 setTitle:v14];

  [v13 setCompatibilityTitle:v12];
  [v13 setIdentifier:v11];
  v15 = sub_10004E20C((uint64_t)a3, 10);
  [v13 setSectionBundleIdentifier:v15];

  v16 = [v13 sectionBundleIdentifier];
  [v13 setApplicationBundleIdentifier:v16];

  v17 = [v13 applicationBundleIdentifier];
  [v13 setSectionBundleIdentifier:v17];

  v18 = [v13 sectionBundleIdentifier];
  [v13 setBundleID:v18];

  objc_msgSend(v13, "setScore:", v7, v6);
  v19 = sub_10004F638((uint64_t)a3, 1);
  [v13 setItemIdentifier:v19];

  [v13 setUserActivityType:CSSearchableItemActionType];
  [v13 setExternalIdentifier:v11];
  v20 = sub_10004E20C((uint64_t)a3, 10);
  [v13 setBundleID:v20];

  [v13 setProtectionClass:v10];
  v21 = sub_10004F638((uint64_t)a3, 32);
  [v13 setInterestingDate:v21];

  v22 = sub_10004F638((uint64_t)a3, 81);
  [v13 setMailConversationIdentifier:v22];

  return v13;
}

- (id)makeMessagesResult:(__packedFieldArray *)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v28 = v5;
  uint64_t v29 = v6;
  id v10 = a5;
  id v30 = a4;
  uint64_t v11 = sub_10004F638((uint64_t)a3, 2);
  objc_super v12 = sub_10004F638((uint64_t)a3, 175);
  id v13 = sub_10004F638((uint64_t)a3, 10);
  v14 = sub_10004E20C((uint64_t)a3, 101);
  v33 = sub_10004E20C((uint64_t)a3, 0);
  sub_10004E8BC((uint64_t)a3, 27);
  v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v16 = [(SPSearchTopHitResult *)self titleStringFromValues:a3];
  id v17 = v13;
  v31 = v12;
  v32 = (void *)v11;
  if ([v14 isEqualToString:@"lnk"])
  {

    id v27 = SSSectionIdentifierSyndicatedLinks;
    v18 = sub_10004E20C((uint64_t)a3, 100);
    v19 = +[NSURL URLWithString:v18];
    v15 = &off_100099230;
  }
  else
  {
    if (!isMessagesAttachmentCoreSpotlightId())
    {
      v19 = 0;
      id v27 = v17;
      goto LABEL_10;
    }
    if ([v12 unsignedIntValue]) {
      v20 = (id *)&SSSectionIdentifierSyndicatedPhotos;
    }
    else {
      v20 = (id *)&SSSectionIdentifierUnsupportedSyndicatedContent;
    }
    id v27 = *v20;
    v19 = 0;
    v18 = v17;
  }

LABEL_10:
  id v21 = objc_alloc_init((Class)SPCoreSpotlightResult);
  [(SPSearchTopHitResult *)self setupGenericItem:v21 values:a3 utiType:v33 bundleID:v17];
  v22 = [v21 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v21 values:a3 bundleID:v22 queryContext:v10];

  v23 = +[SFText textWithString:v16];
  [v21 setTitle:v23];

  [v21 setCompatibilityTitle:v16];
  [v21 setBundleID:v17];
  [v21 setApplicationBundleIdentifier:v17];
  [v21 setSectionBundleIdentifier:v27];
  [v21 setExternalIdentifier:v32];
  [v21 setIdentifier:v32];
  objc_msgSend(v21, "setScore:", v28, v29);
  [v21 setUserActivityType:CSSearchableItemActionType];
  v24 = sub_10004F638((uint64_t)a3, 32);
  [v21 setInterestingDate:v24];

  [v21 setProtectionClass:v30];
  v25 = sub_10004F638((uint64_t)a3, 50);
  [v21 setDomainIdentifier:v25];

  [v21 setContentType:v33];
  [v21 setContentTypeTree:v15];
  if (v19) {
    [v21 setUrl:v19];
  }

  return v21;
}

- (id)makePhotosResult:(__packedFieldArray *)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v27 = v5;
  uint64_t v28 = v6;
  id v10 = a5;
  id v29 = a4;
  v26 = sub_10004F638((uint64_t)a3, 2);
  uint64_t v11 = sub_10004F638((uint64_t)a3, 10);
  objc_super v12 = sub_10004E20C((uint64_t)a3, 0);
  id v13 = sub_10004E8BC((uint64_t)a3, 27);
  v14 = [(SPSearchTopHitResult *)self titleStringFromValues:a3];
  id v30 = sub_10004F638((uint64_t)a3, 175);
  unsigned int v15 = [v30 unsignedIntValue];
  v16 = (id *)&SSSectionIdentifierUnsupportedSyndicatedContent;
  if (v15) {
    v16 = (id *)&SSSectionIdentifierSyndicatedPhotos;
  }
  id v17 = *v16;
  id v18 = objc_alloc_init((Class)SPCoreSpotlightResult);
  [(SPSearchTopHitResult *)self setupGenericItem:v18 values:a3 utiType:v12 bundleID:v11];
  v19 = [v18 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v18 values:a3 bundleID:v19 queryContext:v10];

  v20 = +[SFText textWithString:v14];
  [v18 setTitle:v20];

  [v18 setCompatibilityTitle:v14];
  [v18 setBundleID:v11];
  [v18 setApplicationBundleIdentifier:v11];
  [v18 setSectionBundleIdentifier:v17];
  [v18 setExternalIdentifier:v26];
  [v18 setIdentifier:v26];
  objc_msgSend(v18, "setScore:", v27, v28);
  [v18 setUserActivityType:CSSearchableItemActionType];
  id v21 = sub_10004F638((uint64_t)a3, 32);
  [v18 setInterestingDate:v21];

  [v18 setProtectionClass:v29];
  v22 = sub_10004F638((uint64_t)a3, 50);
  [v18 setDomainIdentifier:v22];

  v23 = sub_10004F638((uint64_t)a3, 3);
  [v18 setContainerIdentifier:v23];

  [v18 setContentType:v12];
  if (v13 && [v13 count])
  {
    [v18 setContentTypeTree:v13];
  }
  else
  {
    v31 = v12;
    v24 = +[NSArray arrayWithObjects:&v31 count:1];
    [v18 setContentTypeTree:v24];
  }

  return v18;
}

- (id)matchContentForPerson:(__packedFieldArray *)a3 queryContext:(id)a4 spotlightQueryTerms:(id)a5
{
  id v78 = a4;
  id v91 = a5;
  if (qword_1000A9050 != -1) {
    dispatch_once(&qword_1000A9050, &stru_1000939B8);
  }
  v85 = sub_10004E20C((uint64_t)a3, 7);
  v84 = sub_10004F638((uint64_t)a3, 156);
  v79 = sub_10004F638((uint64_t)a3, 59);
  v83 = sub_10004F638((uint64_t)a3, 40);
  v82 = sub_10004F638((uint64_t)a3, 61);
  v81 = sub_10004F638((uint64_t)a3, 39);
  v80 = sub_10004F638((uint64_t)a3, 62);
  uint64_t v7 = +[NSMutableArray array];
  if ([v84 count]) {
    [v7 addObjectsFromArray:v84];
  }
  if ([v79 count]) {
    [v7 addObjectsFromArray:v79];
  }
  if ([v83 count]) {
    [v7 addObjectsFromArray:v83];
  }
  if ([v82 count]) {
    [v7 addObjectsFromArray:v82];
  }
  if ([v81 count]) {
    [v7 addObjectsFromArray:v81];
  }
  if ([v80 count]) {
    [v7 addObjectsFromArray:v80];
  }
  v90 = [v78 normalizedSearchString];
  v87 = [v90 componentsSeparatedByString:@" "];
  id v86 = [v87 count];
  if (v85)
  {
    uint64_t v8 = [v85 lowercaseString];
    uint64_t v9 = SSNormalizedQueryString();

    if (v90) {
      uint64_t v10 = (uint64_t)objc_msgSend(v9, "localizedStandardRangeOfString:");
    }
    else {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_super v12 = v85;
    uint64_t v134 = 0;
    v135 = &v134;
    uint64_t v136 = 0x2020000000;
    BOOL v137 = v10 == 0;
    if (v10)
    {
      uint64_t v130 = 0;
      v131 = &v130;
      uint64_t v132 = 0x2020000000;
      uint64_t v133 = 0;
      id v13 = [v9 length];
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472;
      v125[2] = sub_1000517AC;
      v125[3] = &unk_1000939E0;
      id v126 = v87;
      v127 = &v130;
      id v129 = v86;
      v128 = &v134;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 3, v125);

      _Block_object_dispose(&v130, 8);
      int v14 = *((unsigned __int8 *)v135 + 24);
      objc_super v12 = v85;
    }
    else
    {
      int v14 = 1;
    }
    BOOL v11 = v14 != 0;
    if (v14)
    {
      id v89 = v12;
    }
    else
    {
      if (v91)
      {
        unsigned int v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        v16 = [v85 stringByTrimmingCharactersInSet:v15];
        id v17 = +[NSString stringWithFormat:@"name=%@", v16];
        [v91 addObject:v17];
      }
      id v89 = 0;
    }
    _Block_object_dispose(&v134, 8);
  }
  else
  {
    BOOL v11 = 0;
    id v89 = 0;
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v7;
  id v18 = [obj countByEnumeratingWithState:&v121 objects:v144 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v122;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v122 != v19) {
          objc_enumerationMutation(obj);
        }
        if (v11)
        {
          BOOL v11 = 1;
        }
        else
        {
          id v21 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          v22 = [v21 lowercaseString];
          v23 = SSNormalizedQueryString();

          if (v90) {
            uint64_t v24 = (uint64_t)[v23 localizedStandardRangeOfString:v90];
          }
          else {
            uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
          }
          uint64_t v134 = 0;
          v135 = &v134;
          uint64_t v136 = 0x2020000000;
          BOOL v137 = v24 == 0;
          if (v24)
          {
            uint64_t v130 = 0;
            v131 = &v130;
            uint64_t v132 = 0x2020000000;
            uint64_t v133 = 0;
            id v25 = [v23 length];
            v116[0] = _NSConcreteStackBlock;
            v116[1] = 3221225472;
            v116[2] = sub_10005191C;
            v116[3] = &unk_1000939E0;
            id v117 = v87;
            v118 = &v130;
            id v120 = v86;
            v119 = &v134;
            objc_msgSend(v23, "enumerateSubstringsInRange:options:usingBlock:", 0, v25, 3, v116);

            _Block_object_dispose(&v130, 8);
            int v26 = *((unsigned __int8 *)v135 + 24);
          }
          else
          {
            int v26 = 1;
          }
          BOOL v11 = v26 != 0;
          if (v26)
          {
            id v27 = v21;

            id v89 = v27;
          }
          _Block_object_dispose(&v134, 8);
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v121 objects:v144 count:16];
    }
    while (v18);
  }

  if (v91)
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v28 = v84;
    id v29 = [v28 countByEnumeratingWithState:&v112 objects:v143 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v113;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v113 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v112 + 1) + 8 * (void)j);
          v33 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v34 = [v32 stringByTrimmingCharactersInSet:v33];
          v35 = +[NSString stringWithFormat:@"name=%@", v34];
          [v91 addObject:v35];
        }
        id v29 = [v28 countByEnumeratingWithState:&v112 objects:v143 count:16];
      }
      while (v29);
    }

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v36 = v83;
    id v37 = [v36 countByEnumeratingWithState:&v108 objects:v142 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v109;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v109 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v108 + 1) + 8 * (void)k);
          v41 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v42 = [v40 stringByTrimmingCharactersInSet:v41];
          v43 = +[NSString stringWithFormat:@"email=%@", v42];
          [v91 addObject:v43];
        }
        id v37 = [v36 countByEnumeratingWithState:&v108 objects:v142 count:16];
      }
      while (v37);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v44 = v82;
    id v45 = [v44 countByEnumeratingWithState:&v104 objects:v141 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v105;
      do
      {
        for (m = 0; m != v45; m = (char *)m + 1)
        {
          if (*(void *)v105 != v46) {
            objc_enumerationMutation(v44);
          }
          v48 = *(void **)(*((void *)&v104 + 1) + 8 * (void)m);
          v49 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v50 = [v48 stringByTrimmingCharactersInSet:v49];
          v51 = +[NSString stringWithFormat:@"sharedEmail=%@", v50];
          [v91 addObject:v51];
        }
        id v45 = [v44 countByEnumeratingWithState:&v104 objects:v141 count:16];
      }
      while (v45);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v52 = v81;
    id v53 = [v52 countByEnumeratingWithState:&v100 objects:v140 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v101;
      do
      {
        for (n = 0; n != v53; n = (char *)n + 1)
        {
          if (*(void *)v101 != v54) {
            objc_enumerationMutation(v52);
          }
          v56 = *(void **)(*((void *)&v100 + 1) + 8 * (void)n);
          v57 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v58 = [v56 stringByTrimmingCharactersInSet:v57];
          v59 = +[NSString stringWithFormat:@"phone=%@", v58];
          [v91 addObject:v59];
        }
        id v53 = [v52 countByEnumeratingWithState:&v100 objects:v140 count:16];
      }
      while (v53);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v60 = v80;
    id v61 = [v60 countByEnumeratingWithState:&v96 objects:v139 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v97;
      do
      {
        for (ii = 0; ii != v61; ii = (char *)ii + 1)
        {
          if (*(void *)v97 != v62) {
            objc_enumerationMutation(v60);
          }
          v64 = *(void **)(*((void *)&v96 + 1) + 8 * (void)ii);
          v65 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v66 = [v64 stringByTrimmingCharactersInSet:v65];
          v67 = +[NSString stringWithFormat:@"sharedPhone=%@", v66];
          [v91 addObject:v67];
        }
        id v61 = [v60 countByEnumeratingWithState:&v96 objects:v139 count:16];
      }
      while (v61);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v68 = v79;
    id v69 = [v68 countByEnumeratingWithState:&v92 objects:v138 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v93;
      do
      {
        for (jj = 0; jj != v69; jj = (char *)jj + 1)
        {
          if (*(void *)v93 != v70) {
            objc_enumerationMutation(v68);
          }
          v72 = *(void **)(*((void *)&v92 + 1) + 8 * (void)jj);
          v73 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v74 = [v72 stringByTrimmingCharactersInSet:v73];
          v75 = +[NSString stringWithFormat:@"rawName=%@", v74];
          [v91 addObject:v75];
        }
        id v69 = [v68 countByEnumeratingWithState:&v92 objects:v138 count:16];
      }
      while (v69);
    }
  }
  id v76 = v89;

  return v76;
}

- (id)makePersonResult:(__packedFieldArray *)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  id v12 = a4;
  id v41 = a5;
  id v37 = v12;
  if (qword_1000A9070 != -1) {
    dispatch_once(&qword_1000A9070, &stru_100093A00);
  }
  id v13 = sub_10004F638((uint64_t)a3, 2);
  int v14 = sub_10004E20C((uint64_t)a3, 96);
  v40 = sub_10004F638((uint64_t)a3, 10);
  v39 = sub_10004F638((uint64_t)a3, 50);
  id v36 = sub_10004F638((uint64_t)a3, 94);
  sub_10004F638((uint64_t)a3, 0);
  v43 = CFStringRef v42 = @"public.contact";
  v34 = (void *)v43;
  v35 = +[NSArray arrayWithObjects:&v42 count:2];
  unsigned int v15 = objc_opt_new();
  v16 = [(SPSearchTopHitResult *)self matchContentForPerson:a3 queryContext:v41 spotlightQueryTerms:v15];
  if (v14)
  {
    id v17 = +[NSString stringWithFormat:@"contactIdentifier=%@", v14];
    [v15 addObject:v17];
  }
  if (v13)
  {
    id v18 = +[NSString stringWithFormat:@"personIdentifier=%@", v13];
    [v15 addObject:v18];
  }
  uint64_t v38 = v15;
  if (v16)
  {
    BOOL v19 = 1;
  }
  else
  {
    uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)LOBYTE(a3->var0[0]));
    v20.i16[0] = vaddlv_u8(v20);
    BOOL v19 = (xmmword_1000A9060 & *((_OWORD *)a3->var3[v20.u32[0]] + 2)) != 0;
  }
  id v21 = objc_alloc_init((Class)SPCoreSpotlightResult);
  [(SPSearchTopHitResult *)self setupGenericItem:v21 values:a3 utiType:@"com.apple.spotlight.contact" bundleID:v40];
  v22 = [v21 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v21 values:a3 bundleID:v22 queryContext:v41];

  [v21 setPersonIdentifier:v13];
  v23 = [v38 componentsJoinedByString:@"\t"];
  [v21 setPersonQueryIdentifier:v23];

  [v21 setContactIdentifier:v14];
  [v21 setCompletion:v16];
  uint64_t v24 = [v21 completion];
  id v25 = +[SFText textWithString:v24];
  [v21 setTitle:v25];

  int v26 = [v21 completion];
  [v21 setCompatibilityTitle:v26];

  [v21 setBundleID:v39];
  id v27 = &SSSectionIdentifierPeopleSuggestions;
  if (!v19) {
    id v27 = &SSPeopleBundleIdentifier;
  }
  [v21 setSectionBundleIdentifier:*v27];
  [v21 setExternalIdentifier:v13];
  [v21 setIdentifier:v13];
  objc_msgSend(v21, "setScore:", v8, v7);
  [v21 setType:37];
  if (v36) {
    [v36 doubleValue];
  }
  else {
    double v28 = 0.0;
  }
  [v21 setRankingScore:v28];
  [v21 setUserActivityType:CSSearchableItemActionType];
  id v29 = sub_10004F638((uint64_t)a3, 32);
  [v21 setInterestingDate:v29];

  [v21 setProtectionClass:v37];
  uint64_t v30 = sub_10004F638((uint64_t)a3, 50);
  [v21 setDomainIdentifier:v30];

  v31 = [v21 domainIdentifier];
  [v21 setApplicationBundleIdentifier:v31];

  [v21 setContentType:v34];
  [v21 setContentTypeTree:v35];
  [v21 setHasTextContentMatch:v19];
  v32 = sub_10004F638((uint64_t)a3, 95);
  [v21 setPersonType:v32];

  return v21;
}

- (id)eventAttributesFromValues:(__packedFieldArray *)a3 eventGroupIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (!v5 || ![v5 length])
  {
    id v8 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = [v6 componentsSeparatedByString:@"|"];
  if ((unint64_t)[v7 count] >= 2)
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:0];
    uint64_t v10 = +[NSMutableDictionary dictionary];
    if ([v9 hasPrefix:@"flight"])
    {
      if ((unint64_t)[v7 count] >= 5)
      {
        [v10 setObject:@"flight" forKeyedSubscript:@"eventType"];
        BOOL v11 = [v7 objectAtIndexedSubscript:1];
        [v10 setObject:v11 forKeyedSubscript:@"flightDepartureAirportCode"];

        id v12 = [v7 objectAtIndexedSubscript:2];
        [v10 setObject:v12 forKeyedSubscript:@"flightArrivalAirportCode"];

        id v13 = [v7 objectAtIndexedSubscript:3];
        [v10 setObject:v13 forKeyedSubscript:@"flightDesignator"];

        int v14 = [v7 objectAtIndexedSubscript:4];
        CFStringRef v15 = @"flightConfirmationNumber";
LABEL_16:
        [v10 setObject:v14 forKeyedSubscript:v15];

        id v8 = [v10 copy];
        goto LABEL_17;
      }
    }
    else if ([v9 isEqualToString:@"hotel"])
    {
      if ((unint64_t)[v7 count] >= 3)
      {
        [v10 setObject:@"hotel" forKeyedSubscript:@"eventType"];
        v16 = [v7 objectAtIndexedSubscript:1];
        [v10 setObject:v16 forKeyedSubscript:@"hotelReservationForName"];

        id v17 = [v7 objectAtIndexedSubscript:2];
        [v10 setObject:v17 forKeyedSubscript:@"hotelStartDate"];

        int v14 = sub_10004E20C((uint64_t)a3, 208);
        CFStringRef v15 = @"hotelReservationForAddress";
        goto LABEL_16;
      }
    }
    else if ([v9 isEqualToString:@"food"] {
           && (unint64_t)[v7 count] >= 3)
    }
    {
      [v10 setObject:@"restaurant" forKeyedSubscript:@"eventType"];
      id v18 = [v7 objectAtIndexedSubscript:1];
      [v10 setObject:v18 forKeyedSubscript:@"restaurantReservationForName"];

      int v14 = [v7 objectAtIndexedSubscript:2];
      CFStringRef v15 = @"restaurantStartDate";
      goto LABEL_16;
    }
    id v8 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v8 = 0;
LABEL_18:

LABEL_19:

  return v8;
}

- (id)personalAnswerStringFromValues:(__packedFieldArray *)a3 queryContext:(id)a4 eventAttributes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 answerAttributes];
  id v10 = [v9 count];

  if (!v10)
  {
    int v14 = &stru_100094088;
    goto LABEL_22;
  }
  BOOL v11 = [v7 answerAttributes];
  id v12 = [v11 firstObject];

  if ([v12 isEqualToString:MDItemEventFlightDepartureAirportCode])
  {
    id v13 = [v8 objectForKeyedSubscript:@"flightDepartureAirportCode"];
    +[NSString stringWithFormat:@"Your Flight is departing from %@", v13];
LABEL_19:
    int v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if ([v12 isEqualToString:MDItemEventFlightArrivalAirportCode])
  {
    id v13 = [v8 objectForKeyedSubscript:@"flightArrivalAirportCode"];
    +[NSString stringWithFormat:@"Your Flight is arriving at %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemEventFlightDesignator])
  {
    id v13 = [v8 objectForKeyedSubscript:@"flightDesignator"];
    +[NSString stringWithFormat:@"Your Flight Number is %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemEventFlightConfirmationNumber])
  {
    id v13 = [v8 objectForKeyedSubscript:@"flightConfirmationNumber"];
    +[NSString stringWithFormat:@"Your Flight Confirmation Number is %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemEventFlightPassengerSeatNumbers])
  {
    id v13 = [v8 objectForKeyedSubscript:@"flightPassengerSeatNumbers"];
    +[NSString stringWithFormat:@"Your Flight Seat Numbers are %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemEventHotelReservationForName])
  {
    id v13 = [v8 objectForKeyedSubscript:@"hotelReservationForName"];
    +[NSString stringWithFormat:@"Your Hotel Name is %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemEventHotelReservationForAddress])
  {
    id v13 = [v8 objectForKeyedSubscript:@"hotelReservationForAddress"];
    +[NSString stringWithFormat:@"Your Hotel Address is %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemEventRestaurantReservationForName])
  {
    id v13 = [v8 objectForKeyedSubscript:@"restaurantReservationForName"];
    +[NSString stringWithFormat:@"Your Restaurant Name is %@", v13];
    goto LABEL_19;
  }
  if ([v12 isEqualToString:MDItemStartDate])
  {
    id v13 = sub_10004EA18((uint64_t)a3, 17);
    id v16 = objc_alloc_init((Class)NSDateFormatter);
    [v16 setDateStyle:3];
    [v16 setTimeStyle:1];
    id v17 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
    [v16 setLocale:v17];

    id v18 = [v16 stringFromDate:v13];
    BOOL v19 = [v8 objectForKeyedSubscript:@"eventType"];
    unsigned int v20 = [v19 isEqualToString:@"flight"];

    if (v20)
    {
      +[NSString stringWithFormat:@"Your Flight Departs on %@", v18];
    }
    else
    {
      uint64_t v24 = [v8 objectForKeyedSubscript:@"eventType"];
      unsigned int v25 = [v24 isEqualToString:@"hotel"];

      if (v25) {
        +[NSString stringWithFormat:@"Your Hotel Check In is at %@", v18];
      }
      else {
        +[NSString stringWithFormat:@"Your Restaurant Check In is at %@", v18];
      }
    }
  }
  else
  {
    if (![v12 isEqualToString:MDItemEndDate])
    {
      int v14 = 0;
      goto LABEL_21;
    }
    id v13 = sub_10004EA18((uint64_t)a3, 18);
    id v16 = objc_alloc_init((Class)NSDateFormatter);
    [v16 setDateStyle:3];
    [v16 setTimeStyle:1];
    id v21 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
    [v16 setLocale:v21];

    id v18 = [v16 stringFromDate:v13];
    v22 = [v8 objectForKeyedSubscript:@"eventType"];
    unsigned int v23 = [v22 isEqualToString:@"flight"];

    if (v23)
    {
      +[NSString stringWithFormat:@"Your Flight Arrives on %@", v18];
    }
    else
    {
      int v26 = [v8 objectForKeyedSubscript:@"eventType"];
      unsigned int v27 = [v26 isEqualToString:@"hotel"];

      if (v27) {
        +[NSString stringWithFormat:@"Your Hotel Check out is at %@", v18];
      }
      else {
        +[NSString stringWithFormat:@"Your Restaurant Check out is at %@", v18];
      }
    }
  }
  int v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

LABEL_22:

  return v14;
}

- (id)personalAnswerTitleStringFromValues:(__packedFieldArray *)a3
{
  return sub_10004E20C((uint64_t)a3, 12);
}

- (id)makePersonalAnswersResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 queryContext:(__packedFieldArray *)a3 score:(id)a4 searchString:(id)a5
{
  id v7 = a5;
  id v8 = objc_opt_new();
  objc_msgSend(v8, "setScore:", *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0);
  [v8 setProtectionClass:*(void *)&self->_clientData[8].var0];
  uint64_t v9 = sub_10004E20C((uint64_t)a3, 10);
  [v8 setBundleID:v9];

  id v10 = [v8 bundleID];
  [v8 setApplicationBundleIdentifier:v10];

  BOOL v11 = [v8 bundleID];
  [v8 setSectionBundleIdentifier:v11];

  id v12 = sub_10004F638((uint64_t)a3, 2);
  [v8 setIdentifier:v12];

  id v13 = [v8 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v8 values:a3 bundleID:v13 queryContext:v7];

  int v14 = sub_10004F638((uint64_t)a3, 0);
  if (v14)
  {
    sub_10004F638((uint64_t)a3, 0);
    CFStringRef v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v15 = @"com.apple.spotlight.events";
  }

  id v21 = v15;
  id v16 = +[NSArray arrayWithObjects:&v21 count:1];
  [v8 setContentType:v15];
  [v8 setContentTypeTree:v16];
  id v17 = sub_10004E20C((uint64_t)a3, 207);
  id v18 = [(SPSearchTopHitResult *)self eventAttributesFromValues:a3 eventGroupIdentifier:v17];
  BOOL v19 = [(SPSearchTopHitResult *)self personalAnswerStringFromValues:a3 queryContext:v7 eventAttributes:v18];
  [v8 setPersonalAnswerString:v19];

  return v8;
}

- (id)makeApplicationResult:(__packedFieldArray *)a3 dataclass:(id)a4 score:
{
  uint64_t v6 = v5;
  uint64_t v51 = v4;
  id v52 = a4;
  id v8 = SPFastApplicationsGetNoBuild();
  uint64_t v9 = sub_10004E20C((uint64_t)a3, 2);
  id v10 = [v8 objectForKeyedSubscript:v9];
  if (!v10)
  {
    if (([v9 isEqualToString:@"com.apple.TVRemoteUIService"] & 1) == 0)
    {
      if (v8
        || (SPCopyVisibleApps(),
            v39 = objc_claimAutoreleasedReturnValue(),
            unsigned int v40 = [v39 containsObject:v9],
            v39,
            !v40))
      {
        id v11 = 0;
        goto LABEL_40;
      }
    }
    sub_10004E20C((uint64_t)a3, 10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = objc_alloc_init((Class)SPCoreSpotlightResult);
    [v23 setIdentifier:v9];
    uint64_t v24 = sub_10004E20C((uint64_t)a3, 7);
    id v25 = objc_alloc_init((Class)SFText);
    id v26 = v25;
    v50 = v25;
    if (v24)
    {
      [v25 setText:v24];
      id v26 = v50;
    }
    [v23 setTitle:v26];
    unsigned int v27 = sub_10004E20C((uint64_t)a3, 155);
    v47 = (void *)v24;
    if (v27)
    {
      double v28 = +[SFRichText textWithString:v27];
      id v53 = v28;
      +[NSArray arrayWithObjects:&v53 count:1];
      id v29 = v9;
      v31 = uint64_t v30 = v6;
      [v23 setDescriptions:v31];

      uint64_t v6 = v30;
      uint64_t v9 = v29;
      id v10 = 0;
    }
    [v23 setSectionBundleIdentifier:v11];
    uint64_t v48 = v6;
    if ([v11 isEqualToString:PRSRankingAppClipsBundleString])
    {
      [v23 setBundleID:SPApplicationBundleIdGeneralApplication];
      [v23 setType:22];
      id v32 = objc_alloc((Class)SFAppIconImage);
      v33 = [v23 identifier];
      [v32 setBundleIdentifier:v33];

      [v23 setThumbnail:v32];
      v34 = sub_10004E20C((uint64_t)a3, 72);
      [v23 setApplicationBundleIdentifier:v34];
    }
    else
    {
      if (sub_10004ED4C((uint64_t)a3, 178))
      {
        [v23 setType:24];
        CFIndex v41 = 10;
      }
      else
      {
        CFIndex v41 = 2;
      }
      CFStringRef v42 = sub_10004E20C((uint64_t)a3, v41);
      [v23 setApplicationBundleIdentifier:v42];

      uint64_t v43 = sub_10004E20C((uint64_t)a3, 2);
      [v23 setExternalIdentifier:v43];

      id v44 = [v23 applicationBundleIdentifier];
      [v23 setBundleID:v44];

      id v32 = [v23 externalIdentifier];
      [v23 setResultBundleId:v32];
    }

    objc_msgSend(v23, "setScore:", v51, v48);
    [v23 setProtectionClass:v52];
    [v23 setIsLocalApplicationResult:1];
    id v45 = [v23 applicationBundleIdentifier];

    if (!v45)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v23;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
      }

      id v23 = 0;
    }

    goto LABEL_39;
  }
  id v11 = objc_alloc_init((Class)SPCoreSpotlightResult);
  [v10 copyToSearchFoundationResult:v11];
  id v12 = [v11 compatibilityTitle];

  if (!v12)
  {
    id v13 = sub_10004E20C((uint64_t)a3, 7);
    [v11 title];
    CFStringRef v15 = v14 = v6;
    [v15 setText:v13];

    uint64_t v6 = v14;
  }
  id v16 = [v10 subtitle];

  if (!v16)
  {
    id v17 = sub_10004E20C((uint64_t)a3, 155);
    if (v17)
    {
      +[SFRichText textWithString:v17];
      v49 = v9;
      v19 = uint64_t v18 = v6;
      v56 = v19;
      unsigned int v20 = +[NSArray arrayWithObjects:&v56 count:1];
      [v11 setDescriptions:v20];

      uint64_t v6 = v18;
      uint64_t v9 = v49;
    }
  }
  if ([v10 isWebClip]) {
    [v11 setType:24];
  }
  if ([v10 isAppClip])
  {
    [v11 setSectionBundleIdentifier:PRSRankingAppClipsBundleString];
    [v11 setBundleID:SPApplicationBundleIdGeneralApplication];
    [v11 setType:22];
    id v21 = objc_alloc((Class)SFAppIconImage);
    v22 = [v11 identifier];
    [v21 setBundleIdentifier:v22];

    [v11 setThumbnail:v21];
  }
  else
  {
    [v11 setSectionBundleIdentifier:PRSRankingAppsBundleString];
    if ([v10 isWebClip]) {
      CFIndex v35 = 10;
    }
    else {
      CFIndex v35 = 2;
    }
    id v36 = sub_10004E20C((uint64_t)a3, v35);
    [v11 setApplicationBundleIdentifier:v36];

    id v37 = sub_10004E20C((uint64_t)a3, 2);
    [v11 setExternalIdentifier:v37];

    id v21 = [v11 applicationBundleIdentifier];
    [v11 setBundleID:v21];
  }

  objc_msgSend(v11, "setScore:", v51, v6);
  [v11 setProtectionClass:v52];
  [v11 setIsLocalApplicationResult:1];
  uint64_t v38 = [v11 applicationBundleIdentifier];

  if (!v38)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
    }
    id v23 = 0;
LABEL_39:

    id v11 = v23;
  }
LABEL_40:

  return v11;
}

- (void)makeDateBasedResult:(__packedFieldArray *)a3 result:(id)a4
{
  id v14 = a4;
  uint64_t v5 = sub_10004EA18((uint64_t)a3, 28);
  uint64_t v6 = sub_10004EA18((uint64_t)a3, 32);
  id v7 = sub_10004EA18((uint64_t)a3, 29);
  id v8 = sub_10004EA18((uint64_t)a3, 25);
  uint64_t v9 = sub_10004EA18((uint64_t)a3, 17);
  id v10 = sub_10004E20C((uint64_t)a3, 69);
  [v14 setCalendarIdentifier:v10];
  id v11 = v9;
  if (v9 || (id v11 = v5) != 0 || (id v11 = v7) != 0 || (id v11 = v8) != 0 || (id v11 = v6) != 0)
  {
    [v14 setInterestingDate:v11];
  }
  else
  {
    id v13 = [v14 interestingDate];
    [v14 setInterestingDate:v13];
  }
  id v12 = sub_10004F638((uint64_t)a3, 50);
  [v14 setDomainIdentifier:v12];

  if (v5) {
    [v14 setCompleted:1];
  }
}

- (void)makeContactResult:(__packedFieldArray *)a3 identifier:(id)a4 queryContext:(id)a5 result:(id)a6
{
  id v24 = a4;
  id v10 = a6;
  id v11 = [(SPSearchTopHitResult *)self matchContentForPerson:a3 queryContext:a5 spotlightQueryTerms:0];
  [v10 setContactIdentifier:v24];
  if (v11)
  {
    [v10 setCompletion:v11];
    [v10 setIdentifier:v24];
    [v10 setType:36];
    if (qword_1000A9090 != -1) {
      dispatch_once(&qword_1000A9090, &stru_100093A20);
    }
    BOOL v12 = 1;
  }
  else
  {
    id v13 = sub_10004E20C((uint64_t)a3, 7);
    [v10 setCompletion:v13];

    [v10 setIdentifier:v24];
    [v10 setType:36];
    if (qword_1000A9090 != -1) {
      dispatch_once(&qword_1000A9090, &stru_100093A20);
    }
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)LOBYTE(a3->var0[0]));
    v14.i16[0] = vaddlv_u8(v14);
    BOOL v12 = (xmmword_1000A9080 & *((_OWORD *)a3->var3[v14.u32[0]] + 2)) != 0;
  }
  [v10 setHasTextContentMatch:v12];
  unint64_t v15 = a3->var0[5];
  if ((v15 & 0x200000) != 0
    && (id v16 = a3->var3[(vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)a3->var0)))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)&a3->var0[2])))))+ vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v15 & 0x1FFFFF)))+ vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)a3->var0[4])))]) != 0&& *((_DWORD *)v16 + 6) == 7&& *((_DWORD *)v16 + 5) == 3)
  {
    uint64_t v17 = *((void *)v16 + 4);
    [v10 setIncomingCount:*((void *)v16 + 5)];
    if (v17)
    {
      uint64_t v18 = 0;
      while (*((uint64_t *)[v10 incomingCount] + v18) < 1)
      {
        if (v17 == ++v18) {
          goto LABEL_18;
        }
      }
      [v10 setHasCommunicationContent:1];
    }
  }
  else
  {
    [v10 setIncomingCount:0];
  }
LABEL_18:
  unint64_t v19 = a3->var0[5];
  if ((v19 & 0x400000) != 0
    && (unsigned int v20 = a3->var3[(vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)a3->var0)))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)&a3->var0[2])))))+ vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v19 & 0x3FFFFF)))+ vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)a3->var0[4])))]) != 0&& *((_DWORD *)v20 + 6) == 7&& *((_DWORD *)v20 + 5) == 3)
  {
    uint64_t v22 = *((void *)v20 + 4);
    uint64_t v21 = *((void *)v20 + 5);
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v21 = 0;
  }
  [v10 setOutgoingCount:v21];
  if (([v10 hasCommunicationContent] & 1) == 0 && v22)
  {
    uint64_t v23 = 0;
    while (*((uint64_t *)[v10 outgoingCount] + v23) < 1)
    {
      if (v22 == ++v23) {
        goto LABEL_31;
      }
    }
    [v10 setHasCommunicationContent:1];
  }
LABEL_31:
}

- (BOOL)doesQueryMatchContentForLowEngagementBundle:(__packedFieldArray *)a3 queryContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_10004E20C((uint64_t)a3, 7);
  if (!v6)
  {
    uint64_t v6 = sub_10004E20C((uint64_t)a3, 12);
  }
  id v7 = (void *)v6;
  id v8 = [v5 normalizedSearchString];
  BOOL v9 = 0;
  uint64_t v38 = v7;
  if (v7 && v8)
  {
    id v10 = v8;
    if ((unint64_t)[v8 length] >= 4)
    {
      id v11 = [v38 lowercaseString];
      BOOL v12 = SSNormalizedQueryString();

      id v36 = v10;
      id v13 = [v10 componentsSeparatedByString:@" "];
      CFIndex v35 = v12;
      uint64_t v43 = [v12 componentsSeparatedByString:@" "];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v14 = v13;
      id v42 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v42)
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        int v39 = 0;
        uint64_t v40 = *(void *)v53;
        CFIndex v41 = v14;
        id v37 = v5;
        while (2)
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v53 != v40) {
              objc_enumerationMutation(v14);
            }
            uint64_t v46 = v15;
            unint64_t v47 = v16;
            uint64_t v45 = v17;
            uint64_t v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
            id v44 = [v18 length];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v19 = v43;
            id v20 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v20)
            {
              id v21 = v20;
              char v22 = 0;
              uint64_t v23 = *(void *)v49;
              unint64_t v24 = 0x7FFFFFFFLL;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v23) {
                    objc_enumerationMutation(v19);
                  }
                  id v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                  if ([v26 localizedStandardRangeOfString:v18] != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    id v28 = v27;
                    id v29 = [v26 length];
                    id v30 = [v26 length];
                    unint64_t v31 = (unint64_t)v30;
                    if (v28 == v29)
                    {

                      unint64_t v24 = v31;
                      id v14 = v41;
                      uint64_t v33 = v46;
                      unint64_t v32 = v47;
                      goto LABEL_32;
                    }
                    if ((unint64_t)v30 < v24) {
                      unint64_t v24 = (unint64_t)[v26 length];
                    }
                    char v22 = 1;
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
            else
            {
              char v22 = 0;
              unint64_t v24 = 0x7FFFFFFFLL;
            }

            id v14 = v41;
            if ((v22 & 1) == 0
              || v39 > 0
              || (unint64_t)[v18 length] <= 3
              && 3 * v24 > 4 * (uint64_t)[v18 length])
            {

              BOOL v9 = 0;
              id v5 = v37;
              goto LABEL_39;
            }
            int v39 = 1;
            uint64_t v33 = v46;
            unint64_t v32 = v47;
LABEL_32:
            unint64_t v16 = (unint64_t)v44 + v32;
            uint64_t v15 = v24 + v33;
            uint64_t v17 = v45 + 1;
          }
          while ((id)(v45 + 1) != v42);
          id v5 = v37;
          id v42 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (v42) {
            continue;
          }
          break;
        }

        if (v16 > 3)
        {
          BOOL v9 = 1;
          goto LABEL_39;
        }
      }
      else
      {

        unint64_t v16 = 0;
        uint64_t v15 = 0;
      }
      BOOL v9 = 3 * v15 <= 4 * v16;
LABEL_39:

      id v8 = v36;
    }
    else
    {
      BOOL v9 = 0;
      id v8 = v10;
    }
  }

  return v9;
}

- (BOOL)imageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeImage];
}

- (BOOL)videoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SPSearchTopHitResult *)self _contentType:v6 orContentTypeTree:v7 representsType:kUTTypeVideo])
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = [(SPSearchTopHitResult *)self _contentType:v6 orContentTypeTree:v7 representsType:kUTTypeMovie];
  }

  return v8;
}

- (BOOL)audioIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeAudio];
}

- (BOOL)audioOrVideoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeAudiovisualContent];
}

- (BOOL)playlistOrAlbumIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypePlaylist];
}

- (BOOL)bookIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:off_1000A8A50[0]];
}

- (BOOL)eventIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeCalendarEvent];
}

- (BOOL)reminderIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeToDoItem];
}

- (BOOL)messageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeMessage];
}

- (BOOL)contactIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeContact];
}

- (BOOL)documentIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:kUTTypeContent];
}

- (BOOL)_contentType:(id)a3 orContentTypeTree:(id)a4 representsType:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([a3 isEqualToString:v8]) {
    unsigned __int8 v9 = 1;
  }
  else {
    unsigned __int8 v9 = [v7 containsObject:v8];
  }

  return v9;
}

- (void)setupGenericItem:(id)a3 values:(__packedFieldArray *)a4 utiType:(id)a5 bundleID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_10004F638((uint64_t)a4, 27);
  id v14 = sub_10004F638((uint64_t)a4, 38);
  CFIndex v41 = sub_10004F638((uint64_t)a4, 83);
  uint64_t v40 = sub_10004F638((uint64_t)a4, 85);
  uint64_t v15 = sub_10004F638((uint64_t)a4, 15);
  unint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    sub_10004F638((uint64_t)a4, 64);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v18 = v17;

  id v19 = sub_10004F638((uint64_t)a4, 30);
  id v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    sub_10004F638((uint64_t)a4, 30);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v22 = v21;

  if (v18)
  {
    [v10 setRelatedUniqueIdentifier:v18];
  }
  else
  {
    uint64_t v23 = [v10 relatedUniqueIdentifier];
    [v10 setRelatedUniqueIdentifier:v23];
  }
  if (v22)
  {
    [v10 setAccountIdentifier:v22];
  }
  else
  {
    unint64_t v24 = [v10 accountIdentifier];
    [v10 setAccountIdentifier:v24];
  }
  [v10 setFileProviderIdentifier:v41];
  [v10 setFileProviderDomainIdentifier:v40];
  id v25 = sub_10004F638((uint64_t)a4, 86);
  [v10 setRelatedBundleID:v25];

  id v26 = sub_10004F638((uint64_t)a4, 164);
  [v10 setDisplayOrder:v26];

  if (([(SPSearchTopHitResult *)self audioOrVideoIsRepresentedByContentType:v11 orContentTypeTree:v13]|| [(SPSearchTopHitResult *)self audioIsRepresentedByContentType:v11 orContentTypeTree:v13]|| [(SPSearchTopHitResult *)self playlistOrAlbumIsRepresentedByContentType:v11 orContentTypeTree:v13]|| [(SPSearchTopHitResult *)self bookIsRepresentedByContentType:v11 orContentTypeTree:v13])
    && ([v12 isEqualToString:@"com.apple.podcasts"] & 1) == 0)
  {
    [v10 setStoreIdentifier:v14];
  }
  else
  {
    unsigned int v27 = [v10 compatibilityTitle];
    if (v27)
    {
    }
    else if ([(SPSearchTopHitResult *)self messageIsRepresentedByContentType:v11 orContentTypeTree:v13]|| [(SPSearchTopHitResult *)self contactIsRepresentedByContentType:v11 orContentTypeTree:v13])
    {
      id v28 = [(SPSearchTopHitResult *)self authorStringFromValues:a4];
      [v10 setCompatibilityTitle:v28];
    }
  }
  id v29 = SPLogForSPLogCategoryDefault();
  os_log_type_t v30 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v38 = v14;
    id v39 = v11;
    uint64_t v31 = sub_10004F638((uint64_t)a4, 7);
    unint64_t v32 = (void *)v31;
    id v37 = v13;
    id v33 = v12;
    if (v31)
    {
      int v34 = 0;
      CFIndex v35 = (void *)v31;
    }
    else
    {
      uint64_t v36 = sub_10004F638((uint64_t)a4, 12);
      if (v36)
      {
        int v34 = 0;
        id v13 = (void *)v36;
        CFIndex v35 = (void *)v36;
      }
      else
      {
        CFIndex v35 = sub_10004F638((uint64_t)a4, 4);
        id v13 = 0;
        int v34 = 1;
      }
    }
    *(_DWORD *)buf = 138412802;
    id v43 = v33;
    __int16 v44 = 2112;
    uint64_t v45 = v41;
    __int16 v46 = 2112;
    unint64_t v47 = v35;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Bundle id: %@ FPId: %@ Title:%@", buf, 0x20u);
    if (v34) {

    }
    if (!v32) {
    id v12 = v33;
    }
    id v14 = v38;
    id v11 = v39;
    id v13 = v37;
  }
}

- (void)updateDataOwnerTypeForResult:(id)a3 accountID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && ![v5 dataOwnerType])
  {
    if (qword_1000A90A0 != -1) {
      dispatch_once(&qword_1000A90A0, &stru_100093A40);
    }
    id v7 = [(id)qword_1000A9098 objectForKey:v6];
    if (v7) {
      goto LABEL_20;
    }
    id v8 = +[ACAccountStore defaultStore];
    id v13 = 0;
    unsigned __int8 v9 = [v8 accountWithIdentifier:v6 error:&v13];
    id v10 = v13;

    if (v9)
    {
      uint64_t v11 = (uint64_t)[v9 MCIsManaged];
    }
    else
    {
      if (!v10 || [v10 code] == (id)10002)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v11 = 1;
    }
    id v7 = +[NSNumber numberWithBool:v11];
    [(id)qword_1000A9098 setObject:v7 forKey:v6];

    if (v7)
    {
LABEL_20:
      if ([v7 BOOLValue]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      [v5 setDataOwnerType:v12];
      id v10 = v7;
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)populateCoreSpotlightResult:(id)a3 values:(__packedFieldArray *)a4 bundleID:(id)a5 queryContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v57 = a6;
  if (qword_1000A90B0 != -1) {
    dispatch_once(&qword_1000A90B0, &stru_100093A60);
  }
  uint64_t v56 = sub_10004E8BC((uint64_t)a4, 27);
  uint64_t v54 = sub_10004E20C((uint64_t)a4, 101);
  uint64_t v12 = sub_10004F638((uint64_t)a4, 0);
  id v13 = sub_10004F638((uint64_t)a4, 11);
  id v14 = sub_10004F638((uint64_t)a4, 2);
  uint64_t v62 = sub_10004F638((uint64_t)a4, 1);
  uint64_t v15 = sub_10004F638((uint64_t)a4, 13);
  uint64_t v16 = sub_10004F638((uint64_t)a4, 14);
  v58 = sub_10004F638((uint64_t)a4, 175);
  id v60 = self;
  id v17 = [(SPSearchTopHitResult *)self titleStringFromValues:a4];
  uint64_t v18 = [v17 stringByTrimmingCharactersInSet:qword_1000A90A8];

  v59 = (void *)v18;
  [v10 setCompatibilityTitle:v18];
  [v10 setIdentifier:v14];
  id v19 = sub_10004F638((uint64_t)a4, 10);
  [v10 setResultBundleId:v19];

  long long v55 = (void *)v15;
  [v10 setContentURL:v15];
  id v20 = sub_10004F638((uint64_t)a4, 51);
  [v10 setFileIdentifier:v20];

  id v21 = sub_10004F638((uint64_t)a4, 52);
  [v10 setParentFileIdentifier:v21];

  char v22 = sub_10004F638((uint64_t)a4, 53);
  [v10 setFilename:v22];

  uint64_t v23 = sub_10004F638((uint64_t)a4, 54);
  [v10 setDocumentIdentifier:v23];

  [v10 setUserActivityType:v13];
  id v61 = (void *)v16;
  [v10 setUserActivityRequiredString:v16];
  unint64_t v24 = sub_10004F638((uint64_t)a4, 72);
  [v10 setRelatedBundleID:v24];

  unsigned __int8 v25 = [v11 isEqualToString:off_1000A8A68];
  unsigned int v26 = [v12 hasPrefix:INInteractionContentType];
  if (v13 || (v25 & 1) != 0 || v26)
  {
    id v33 = SPLogForSPLogCategoryQuery();
    os_log_type_t v34 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v33, v34))
    {
      *(_DWORD *)buf = 138412290;
      id v64 = v11;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Found #apphistory item for %@", buf, 0xCu);
    }

    if (v62) {
      CFIndex v35 = v62;
    }
    else {
      CFIndex v35 = (void *)v16;
    }
    objc_msgSend(v10, "setUserActivityRequiredString:", v35, v13);
    uint64_t v36 = sub_10004F638((uint64_t)a4, 21);
    id v37 = v36;
    if (v36) {
      objc_msgSend(v10, "setPubliclyIndexable:", objc_msgSend(v36, "BOOLValue"));
    }
    [(SPSearchTopHitResult *)v60 setupGenericItem:v10 values:a4 utiType:v12 bundleID:v11];

    unsigned int v27 = v57;
    id v29 = (void *)v56;
    unint64_t v32 = (void *)v54;
    id v13 = log;
    goto LABEL_19;
  }
  unsigned int v27 = v57;
  if (([v12 isEqualToString:@"com.apple.mobilenotes.spotlightrecord"] & 1) != 0
    || ([v12 isEqualToString:@"com.apple.notes.spotlightrecord"] & 1) != 0
    || [v11 isEqualToString:@"com.apple.mobilenotes"])
  {
    [(SPSearchTopHitResult *)v60 setupGenericItem:v10 values:a4 utiType:v12 bundleID:v11];
    id v28 = v58;
    id v29 = (void *)v56;
    if ([v58 unsignedIntValue])
    {
      os_log_type_t v30 = &SSSectionIdentifierSyndicatedPhotos;
      unint64_t v32 = (void *)v54;
      uint64_t v31 = v55;
    }
    else
    {
      unint64_t v32 = (void *)v54;
      uint64_t v31 = v55;
      if (!isImageOrVideoContentType())
      {
LABEL_23:
        [v10 setUserActivityType:CSSearchableItemActionType];
        goto LABEL_24;
      }
      os_log_type_t v30 = &SSSectionIdentifierUnsupportedSyndicatedContent;
    }
    [v10 setSectionBundleIdentifier:*v30];
    goto LABEL_23;
  }
  id v29 = (void *)v56;
  id v28 = v58;
  if (([v11 isEqualToString:@"com.apple.reminders"] & 1) != 0
    || [v11 isEqualToString:@"com.apple.mobilecal"])
  {
    if ([v12 isEqualToString:@"public.to-do-item"]) {
      [(SPSearchTopHitResult *)v60 makeDateBasedResult:a4 result:v10];
    }
    uint64_t v38 = sub_10004F638((uint64_t)a4, 30);
    [(SPSearchTopHitResult *)v60 updateDataOwnerTypeForResult:v10 accountID:v38];

    goto LABEL_30;
  }
  if ([v11 isEqualToString:@"com.apple.VoiceMemos"])
  {
    id v39 = SPLogForSPLogCategoryQuery();
    os_log_type_t v40 = 2 * (gSPLogDebugAsDefault == 0);
    os_log_t loga = v39;
    if (!os_log_type_enabled(v39, v40))
    {
LABEL_35:

      [(SPSearchTopHitResult *)v60 setupGenericItem:v10 values:a4 utiType:v12 bundleID:v11];
LABEL_30:
      unint64_t v32 = (void *)v54;
      uint64_t v31 = v55;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    id v64 = v59;
    CFIndex v41 = "Adding voice memo: %@";
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, loga, v40, v41, buf, 0xCu);
    goto LABEL_35;
  }
  if (![v11 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    if (![v11 isEqualToString:@"com.apple.CoreSuggestions"])
    {
      [v10 setUserActivityType:CSSearchableItemActionType];
      long long v51 = SPLogForSPLogCategoryQuery();
      os_log_type_t v40 = 2 * (gSPLogDebugAsDefault == 0);
      os_log_t loga = v51;
      if (!os_log_type_enabled(v51, v40)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 138412290;
      id v64 = v12;
      CFIndex v41 = "Adding app search UTI: %@";
      goto LABEL_34;
    }
    id v42 = v12;
    id v43 = v11;
    long long v49 = v14;
    uint64_t v45 = v54;
    __int16 v46 = v49;
    -[SPSearchTopHitResult makeContactResult:identifier:queryContext:result:](v60, "makeContactResult:identifier:queryContext:result:", a4);
    unint64_t v47 = SPLogForSPLogCategoryQuery();
    os_log_type_t v48 = 2 * (gSPLogDebugAsDefault == 0);
    if (!os_log_type_enabled(v47, v48)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 138412290;
    id v64 = v59;
    goto LABEL_42;
  }
  id v42 = v12;
  id v43 = v11;
  __int16 v44 = v14;
  uint64_t v45 = v54;
  __int16 v46 = v44;
  -[SPSearchTopHitResult makeContactResult:identifier:queryContext:result:](v60, "makeContactResult:identifier:queryContext:result:", a4);
  unint64_t v47 = SPLogForSPLogCategoryQuery();
  os_log_type_t v48 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v47, v48))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v59;
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Adding contact: %@", buf, 0xCu);
  }
LABEL_43:

  long long v50 = (void *)v45;
  id v14 = v46;
  id v13 = 0;
  id v11 = v43;
  uint64_t v12 = v42;
  unint64_t v32 = v50;
LABEL_19:
  uint64_t v31 = v55;
  id v28 = v58;
LABEL_24:
}

+ (id)richTextArrayFromArray:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 addObject:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = +[SFRichText textWithString:](SFRichText, "textWithString:", v10, (void)v15);
            [v4 addObject:v11];
          }
        }
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (SPSearchTopHitResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v11 disabledApps];
  if ([v12 count])
  {
    id v13 = +[NSSet setWithArray:v12];
  }
  else
  {
    id v13 = 0;
  }
  clientData = self->_clientData;
  if (!clientData)
  {
    unsigned __int8 v25 = 0;
    goto LABEL_116;
  }
  BOOL v96 = v7;
  uint64_t v15 = (uint64_t)&clientData[16];
  sub_10004E20C((uint64_t)&clientData[16], 10);
  long long v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
  long long v100 = sub_10004F638(v15, 72);
  long long v103 = sub_10004E20C(v15, 0);
  long long v99 = sub_10004F638(v15, 175);
  long long v16 = sub_10004EA18(v15, 32);
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;
  id v19 = sub_10004EA18(v15, 25);
  [v19 timeIntervalSinceReferenceDate];
  long long v101 = self;
  if ((v18 >= a3 || a3 - v18 >= 300.0) && (v20 >= a3 || a3 - v20 >= 300.0))
  {

    unint64_t v24 = v102;
    if ([(__CFString *)v102 isEqualToString:SPApplicationBundleIdGeneralApplication] & 1) != 0|| ([(__CFString *)v102 isEqualToString:SPApplicationBundleIdGeneralAppClips] & 1) != 0|| ([(__CFString *)v102 isEqualToString:@"com.apple.MobileAddressBook"])
    {
      int v23 = 0;
    }
    else
    {
      CFIndex v41 = sub_10004E20C(v15, 58);
      id v42 = v41;
      if (v10 && [v41 hasPrefix:v10])
      {
        if ([v42 isEqualToString:v10]) {
          int v23 = 2;
        }
        else {
          int v23 = 1;
        }
      }
      else
      {
        int v23 = 0;
      }

      unint64_t v24 = v102;
    }
  }
  else
  {
    id v21 = SPLogForSPLogCategoryQuery();
    os_log_type_t v22 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v105 = @"Very recently created/modified";
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@", buf, 0xCu);
    }

    int v23 = 1;
    self = v101;
    unint64_t v24 = v102;
  }
  if ([v103 isEqualToString:SPUTIAppType]
    && (([(__CFString *)v24 isEqualToString:SPApplicationBundleIdGeneralApplication] & 1) != 0
     || [(__CFString *)v24 isEqualToString:SPApplicationBundleIdGeneralAppClips]))
  {
    unsigned int v26 = -[SPSearchTopHitResult makeApplicationResult:dataclass:score:](self, "makeApplicationResult:dataclass:score:", v15, *(void *)&self->_clientData[8].var0, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0);
    if (v26)
    {
      id v27 = v26;
      id v28 = [v26 applicationBundleIdentifier];
      unsigned int v29 = [v13 containsObject:v28];

      if (v29)
      {
        os_log_type_t v30 = SPLogForSPLogCategoryDefault();
        os_log_type_t v31 = 2 * (gSPLogDebugAsDefault == 0);
        unint64_t v32 = v102;
        if (!os_log_type_enabled(v30, v31))
        {
LABEL_76:
          unsigned __int8 v25 = 0;
LABEL_114:

          goto LABEL_115;
        }
        id v33 = [v27 applicationBundleIdentifier];
        *(_DWORD *)buf = 138412290;
        CFStringRef v105 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "disabledAppSet contains  %@", buf, 0xCu);
LABEL_24:

        goto LABEL_76;
      }
      goto LABEL_36;
    }
LABEL_65:
    CFIndex v35 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "*warn* Couldn't determine score for nil result", buf, 2u);
    }
    id v27 = 0;
    int v40 = 1;
LABEL_68:

    if (v23 > (int)[v27 topHit]) {
      [v27 setTopHit:SSSetTopHitWithReasonString()];
    }
    if ([v103 isEqualToString:@"public.calendar-event"])
    {
      uint64_t v56 = [v27 title];
      id v57 = [v56 text];
      [v27 setCompletedQuery:v57];
    }
    if (v40)
    {
      os_log_type_t v30 = SPLogForSPLogCategoryDefault();
      os_log_type_t v58 = gSPLogInfoAsDefault ^ 1;
      unint64_t v32 = v102;
      if (os_log_type_enabled(v30, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        sub_10004F638(v15, 2);
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        CFStringRef v105 = v59;
        __int16 v106 = 2112;
        long long v107 = v102;
        _os_log_impl((void *)&_mh_execute_header, v30, v58, "No result object for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);
      }
      id v27 = 0;
      goto LABEL_76;
    }
    id v60 = [v27 compatibilityTitle];
    if (v60) {
      goto LABEL_85;
    }
    id v60 = [v27 bundleID];
    if ([v60 isEqualToString:SSPhotosBundleIdentifier]) {
      goto LABEL_85;
    }
    id v61 = [v27 sectionBundleIdentifier];
    if (SSSectionIsSyndicatedPhotos())
    {
LABEL_84:

LABEL_85:
      goto LABEL_86;
    }
    id v62 = [v11 queryKind];
    id v63 = [v11 clientBundleID];
    if (qword_1000A90C0 != -1) {
      dispatch_once(&qword_1000A90C0, &stru_100093A80);
    }
    if (byte_1000A90B9)
    {
LABEL_83:

      goto LABEL_84;
    }
    if (byte_1000A90B8)
    {
      if (([v63 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v63 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
        goto LABEL_83;
      }
      unsigned __int8 v98 = [v63 hasPrefix:@"com.apple.ondeviceeval"];

      if (v62 == (id)12 || (v98 & 1) != 0)
      {
LABEL_86:
        [v27 setUserInput:v10];
        if (![v27 type])
        {
          id v64 = sub_10004F638(v15, 14);
          if (v64) {
            uint64_t v65 = 4;
          }
          else {
            uint64_t v65 = 2;
          }
          [v27 setType:v65];
        }
        v66 = sub_10004F638(v15, 58);
        [v27 setLaunchString:v66];

        [v27 setRelatedBundleID:v100];
        [v27 setRelatedAppIdentifier:v100];
        v67 = sub_10004F638(v15, 67);
        [v27 setLaunchDates:v67];

        id v68 = sub_10004F638(v15, 79);
        [v27 setItemProviderDataTypes:v68];

        id v69 = sub_10004F638(v15, 80);
        [v27 setItemProviderFileTypes:v69];

        if ([(__CFString *)v102 isEqualToString:SSTipsBundleIdentifier]
          || ([(__CFString *)v102 hasPrefix:@"com.apple"] & 1) == 0
          && +[SSLocalCEP isLowEngagementBundle:v102])
        {
          unint64_t v70 = [(SPSearchTopHitResult *)v101 doesQueryMatchContentForLowEngagementBundle:v15 queryContext:v11];
        }
        else
        {
          if (([(__CFString *)v102 isEqualToString:SSPeopleBundleIdentifier] & 1) != 0
            || ([(__CFString *)v102 isEqualToString:SSContactsBundleIdentifier] & 1) != 0)
          {
LABEL_98:
            uint64_t v71 = [v27 contentType];
            if (!v71
              || (v72 = (void *)v71,
                  [v27 contentTypeTree],
                  v73 = objc_claimAutoreleasedReturnValue(),
                  v73,
                  v72,
                  !v73))
            {
              v74 = sub_10004F638(v15, 0);
              [v27 setContentType:v74];

              v75 = sub_10004F638(v15, 27);
              [v27 setContentTypeTree:v75];
            }
            id v76 = sub_10004F638(v15, 84);
            objc_msgSend(v27, "setDataOwnerType:", -[NSObject integerValue](v76, "integerValue"));
            v77 = [v27 contentCreationDate];

            if (!v77)
            {
              id v78 = sub_10004F638(v15, 32);
              [v27 setContentCreationDate:v78];
            }
            if (v96)
            {
              v79 = [v11 searchString];
              [v27 setCorrectedQuery:v79];
            }
            long long v97 = v76;
            v80 = [(SPTopHitResult *)v101 rankingItem];
            objc_msgSend(v27, "setQueryId:", objc_msgSend(v11, "queryIdent"));
            v81 = [v27 sectionBundleIdentifier];
            if ([v81 isEqualToString:PRSRankingAppsBundleString])
            {

              unint64_t v32 = v102;
            }
            else
            {
              [v27 sectionBundleIdentifier];
              v82 = v13;
              v83 = v12;
              id v84 = v11;
              id v86 = v85 = v10;
              unsigned int v87 = [v86 isEqualToString:PRSRankingAppClipsBundleString];

              id v10 = v85;
              id v11 = v84;
              uint64_t v12 = v83;
              id v13 = v82;

              unint64_t v32 = v102;
              if (!v87)
              {
LABEL_113:
                [v27 setRankingItem:v80];
                [v80 score];
                objc_msgSend(v27, "setL2score:");
                id v89 = [v11 answerAttributes];
                id v90 = [v89 copy];
                [v27 setAnswerAttributes:v90];

                objc_msgSend(v27, "setHasAppTopHitShortcut:", sub_10004F6B4(v15, 119) != 0);
                [(SPSearchTopHitResult *)v101 populateAttributesForResult:v27 withValues:v15];
                id v27 = v27;

                unsigned __int8 v25 = v27;
                os_log_type_t v30 = v97;
                goto LABEL_114;
              }
            }
            if (([v80 didMatchRankingDescriptor:PRSRankingEscapedWords] & 1) != 0
              || ([v80 didMatchRankingDescriptor:PRSRankingTextContentMatch] & 1) != 0)
            {
              id v88 = 0;
            }
            else
            {
              id v88 = [v80 didMatchRankingDescriptor:PRSRankingDisplayNameCorrectionsMatch];
            }
            [v27 setIsStaticCorrection:v88];
            goto LABEL_113;
          }
          unint64_t v70 = sub_10004F6B4(v15, 107) != 0;
        }
        [v27 setHasTextContentMatch:v70];
        goto LABEL_98;
      }
    }
    else
    {
    }
    os_log_type_t v30 = SPLogForSPLogCategoryDefault();
    os_log_type_t v92 = gSPLogInfoAsDefault ^ 1;
    unint64_t v32 = v102;
    if (!os_log_type_enabled(v30, (os_log_type_t)(gSPLogInfoAsDefault ^ 1))) {
      goto LABEL_76;
    }
    id v33 = [v27 identifier];
    [v27 bundleID];
    long long v93 = v30;
    id v94 = v10;
    long long v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    CFStringRef v105 = v33;
    __int16 v106 = 2112;
    long long v107 = v95;
    _os_log_impl((void *)&_mh_execute_header, v93, v92, "No title for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);

    id v10 = v94;
    os_log_type_t v30 = v93;
    goto LABEL_24;
  }
  if ([(__CFString *)v24 isEqualToString:SSMailBundleIdentifier])
  {
    os_log_type_t v34 = -[SPSearchTopHitResult makeMailResult:dataclass:score:searchString:](self, "makeMailResult:dataclass:score:searchString:", v15, *(void *)&self->_clientData[8].var0, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0, v10);
    goto LABEL_35;
  }
  if ([(__CFString *)v24 isEqualToString:SSMessagesBundleIdentifier])
  {
    os_log_type_t v34 = -[SPSearchTopHitResult makeMessagesResult:dataclass:queryContext:score:](self, "makeMessagesResult:dataclass:queryContext:score:", v15, *(void *)&self->_clientData[8].var0, v11, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0);
    goto LABEL_35;
  }
  if ([(__CFString *)v24 isEqualToString:SSPhotosBundleIdentifier])
  {
    os_log_type_t v34 = -[SPSearchTopHitResult makePhotosResult:dataclass:queryContext:score:](self, "makePhotosResult:dataclass:queryContext:score:", v15, *(void *)&self->_clientData[8].var0, v11, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0);
    goto LABEL_35;
  }
  if ([(__CFString *)v24 isEqualToString:SSPeopleBundleIdentifier])
  {
    os_log_type_t v34 = -[SPSearchTopHitResult makePersonResult:dataclass:queryContext:score:](self, "makePersonResult:dataclass:queryContext:score:", v15, *(void *)&self->_clientData[8].var0, v11, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0);
    goto LABEL_35;
  }
  if ([(__CFString *)v24 isEqualToString:SSEventBundleIdentifier])
  {
    os_log_type_t v34 = -[SPSearchTopHitResult makePersonalAnswersResult:dataclass:queryContext:score:searchString:](self, "makePersonalAnswersResult:dataclass:queryContext:score:searchString:", v15, *(void *)&self->_clientData[8].var0, v11, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0, v10);
LABEL_35:
    id v27 = v34;
    [v34 setResultBundleId:v24];
    if (!v27) {
      goto LABEL_65;
    }
LABEL_36:
    CFIndex v35 = SPLogForSPLogCategoryDefault();
    os_log_type_t v36 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = v10;
      CFStringRef v38 = (const __CFString *)[v27 score];
      [v27 score];
      *(_DWORD *)buf = 134218240;
      CFStringRef v105 = v38;
      id v10 = v37;
      __int16 v106 = 2048;
      long long v107 = v39;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Result score: 0x%08llx 0x%08llx", buf, 0x16u);
    }
    int v40 = 0;
    goto LABEL_68;
  }
  id v43 = self;
  id v27 = (id)objc_opt_new();
  objc_msgSend(v27, "setScore:", *(void *)&v43->_clientData[4].var0, *(void *)&v43->_clientData[6].var0);
  [v27 setProtectionClass:*(void *)&v43->_clientData[8].var0];
  [(SPSearchTopHitResult *)v43 populateCoreSpotlightResult:v27 values:v15 bundleID:v24 queryContext:v11];
  if (sub_10004DD50(v27))
  {
    __int16 v44 = off_1000A8A58[0];

    if ([v99 unsignedIntValue]) {
      [v27 setSectionBundleIdentifier:SSSectionIdentifierSyndicatedPhotos];
    }
    uint64_t v45 = SPLogForSPLogCategoryDefault();
    os_log_type_t v46 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v45, v46))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v105 = v44;
      __int16 v106 = 2112;
      long long v107 = off_1000A8A58[0];
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "remap %@ to %@", buf, 0x16u);
    }

LABEL_56:
    [v27 setBundleID:v44];
    uint64_t v51 = [v27 sectionBundleIdentifier];
    long long v52 = (void *)v51;
    if (v51) {
      uint64_t v53 = v51;
    }
    else {
      uint64_t v53 = (uint64_t)v44;
    }
    [v27 setSectionBundleIdentifier:v53];

    [v27 setApplicationBundleIdentifier:v44];
    if ([(__CFString *)v44 isEqualToString:off_1000A8A68] && v100) {
      [v27 setApplicationBundleIdentifier:v100];
    }
    if ([(__CFString *)v44 isEqualToString:PRSRankingPodcastsBundleString])
    {
      uint64_t v54 = sub_10004E20C(v15, 31);
      [v27 setStringForDedupe:v54];
      long long v55 = sub_10004E20C(v15, 50);
      [v27 setDomainIdentifier:v55];
    }
    long long v102 = v44;
    if (!v27) {
      goto LABEL_65;
    }
    goto LABEL_36;
  }
  unint64_t v47 = [v27 userActivityRequiredString];
  id v48 = [v47 length];

  if (!v48
    || (sub_10004E20C(v15, 86),
        long long v49 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v50 = [v49 isEqualToString:off_1000A8A60[0]],
        v49,
        (v50 & 1) == 0))
  {
    __int16 v44 = v102;
    goto LABEL_56;
  }
  unsigned __int8 v25 = 0;
  unint64_t v32 = v102;
LABEL_115:

LABEL_116:

  return (SPSearchTopHitResult *)v25;
}

- (void)populateAttributesForResult:(id)a3 withValues:(__packedFieldArray *)a4
{
  id v5 = a3;
  uint64_t v118 = sub_10004F6B4((uint64_t)a4, 49);
  unsigned int v69 = sub_10004ED4C((uint64_t)a4, 89);
  id v6 = sub_10004F638((uint64_t)a4, 57);
  if (v6)
  {
    BOOL v7 = v6;
    [v6 doubleValue];
    v222 = +[NSNumber numberWithDouble:v8 * 1000000.0];
  }
  else
  {
    v222 = 0;
  }
  uint64_t v9 = sub_10004E8BC((uint64_t)a4, 45);
  v220 = sub_10004E8BC((uint64_t)a4, 359);
  v219 = sub_10004E8BC((uint64_t)a4, 59);
  v218 = sub_10004F638((uint64_t)a4, 152);
  v217 = sub_10004E8BC((uint64_t)a4, 154);
  v216 = sub_10004E8BC((uint64_t)a4, 357);
  v215 = sub_10004E8BC((uint64_t)a4, 158);
  v214 = sub_10004E8BC((uint64_t)a4, 157);
  v213 = sub_10004E8BC((uint64_t)a4, 47);
  v212 = sub_10004E8BC((uint64_t)a4, 66);
  v211 = sub_10004F638((uint64_t)a4, 151);
  v210 = sub_10004E8BC((uint64_t)a4, 35);
  v209 = sub_10004E8BC((uint64_t)a4, 5);
  uint64_t v10 = sub_10004E8BC((uint64_t)a4, 39);
  uint64_t v116 = sub_10004F6B4((uint64_t)a4, 41);
  uint64_t v11 = sub_10004E8BC((uint64_t)a4, 128);
  v206 = sub_10004F638((uint64_t)a4, 184);
  v205 = sub_10004E8BC((uint64_t)a4, 161);
  v204 = sub_10004E7F0((uint64_t)a4, 130);
  v203 = sub_10004E7F0((uint64_t)a4, 131);
  v202 = sub_10004F638((uint64_t)a4, 186);
  v201 = sub_10004F638((uint64_t)a4, 133);
  v200 = sub_10004E7F0((uint64_t)a4, 183);
  v199 = sub_10004F638((uint64_t)a4, 185);
  v198 = sub_10004E8BC((uint64_t)a4, 40);
  v197 = sub_10004E8BC((uint64_t)a4, 358);
  v196 = sub_10004E8BC((uint64_t)a4, 332);
  v195 = sub_10004E8BC((uint64_t)a4, 48);
  v194 = sub_10004E8BC((uint64_t)a4, 149);
  unint64_t v12 = a4->var0[5];
  v221 = (void *)v9;
  if ((v12 & 0x200000000000) == 0
    || (double v13 = COERCE_DOUBLE(vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)a4->var0)))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)&a4->var0[2])))))), (v14 = *((void *)a4->var3[(LOBYTE(v13)+ vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v12 & 0x1FFFFFFFFFFFLL)))+ vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)a4->var0[4])))]+ 4)) == 0))
  {
    v223 = 0;
    goto LABEL_31;
  }
  uint64_t v15 = sub_10004FB74((double *)(v14 + 32), *(_DWORD *)(v14 + 64), v13);
  double v17 = v15;
  int v18 = *(_DWORD *)(v14 + 64);
  BOOL v19 = v18 == 16 || v18 == 1;
  if (!v19 || ([v15 isEqualToString:@"kMDItemTextContent"] & 1) == 0)
  {
    double v20 = sub_10004FB74((double *)(v14 + 80), *(_DWORD *)(v14 + 112), v16);
    if (v20)
    {
      id v21 = v20;
      v223 = 0;
      int v22 = *(_DWORD *)(v14 + 112);
      if (v22 > 16)
      {
        if (v22 != 19 && v22 != 17) {
          goto LABEL_29;
        }
        id v24 = v20;
      }
      else
      {
        if (v22 != 1 && v22 != 16) {
          goto LABEL_29;
        }
        v227 = v20;
        id v24 = +[NSArray arrayWithObjects:&v227 count:1];
      }
      v223 = v24;
LABEL_29:

      goto LABEL_30;
    }
  }
  v223 = 0;
LABEL_30:

LABEL_31:
  v207 = (void *)v11;
  v193 = sub_10004E20C((uint64_t)a4, 163);
  v192 = sub_10004F638((uint64_t)a4, 164);
  v191 = sub_10004F638((uint64_t)a4, 162);
  v190 = sub_10004F638((uint64_t)a4, 193);
  v189 = sub_10004F638((uint64_t)a4, 166);
  v188 = sub_10004E20C((uint64_t)a4, 167);
  v187 = sub_10004F638((uint64_t)a4, 168);
  v186 = sub_10004E20C((uint64_t)a4, 169);
  v185 = sub_10004F638((uint64_t)a4, 170);
  v184 = sub_10004F638((uint64_t)a4, 171);
  v183 = sub_10004E20C((uint64_t)a4, 174);
  v182 = sub_10004E20C((uint64_t)a4, 173);
  v181 = sub_10004EA18((uint64_t)a4, 28);
  v180 = sub_10004EA18((uint64_t)a4, 32);
  v179 = sub_10004EA18((uint64_t)a4, 29);
  v178 = sub_10004EA18((uint64_t)a4, 18);
  v177 = sub_10004EA18((uint64_t)a4, 36);
  unint64_t v70 = sub_10004EA18((uint64_t)a4, 9);
  v176 = sub_10004EA18((uint64_t)a4, 25);
  v226 = sub_10004EA18((uint64_t)a4, 82);
  v175 = sub_10004EA18((uint64_t)a4, 17);
  v174 = sub_10004F638((uint64_t)a4, 150);
  v173 = sub_10004F638((uint64_t)a4, 153);
  v172 = sub_10004F638((uint64_t)a4, 179);
  v171 = sub_10004F638((uint64_t)a4, 19);
  v170 = sub_10004F638((uint64_t)a4, 42);
  v169 = sub_10004F638((uint64_t)a4, 43);
  uint64_t v26 = sub_10004F6B4((uint64_t)a4, 44);
  v168 = sub_10004F638((uint64_t)a4, 16);
  v167 = sub_10004E20C((uint64_t)a4, 26);
  v166 = sub_10004E20C((uint64_t)a4, 37);
  v165 = sub_10004E20C((uint64_t)a4, 70);
  v164 = sub_10004E20C((uint64_t)a4, 96);
  v163 = sub_10004E20C((uint64_t)a4, 91);
  v162 = sub_10004E20C((uint64_t)a4, 13);
  v161 = sub_10004E20C((uint64_t)a4, 31);
  v224 = sub_10004E20C((uint64_t)a4, 7);
  v160 = sub_10004E20C((uint64_t)a4, 1);
  v159 = sub_10004E20C((uint64_t)a4, 71);
  v158 = sub_10004E20C((uint64_t)a4, 101);
  v157 = sub_10004E20C((uint64_t)a4, 20);
  v156 = sub_10004E20C((uint64_t)a4, 93);
  v155 = sub_10004E20C((uint64_t)a4, 90);
  v154 = sub_10004E20C((uint64_t)a4, 55);
  v153 = sub_10004E20C((uint64_t)a4, 72);
  v152 = sub_10004E20C((uint64_t)a4, 6);
  v151 = sub_10004E20C((uint64_t)a4, 46);
  v150 = sub_10004E20C((uint64_t)a4, 4);
  v149 = sub_10004E20C((uint64_t)a4, 176);
  v148 = sub_10004E20C((uint64_t)a4, 177);
  v147 = sub_10004E20C((uint64_t)a4, 34);
  v146 = sub_10004E20C((uint64_t)a4, 180);
  v145 = sub_10004F638((uint64_t)a4, 23);
  v144 = sub_10004F638((uint64_t)a4, 24);
  v143 = sub_10004E20C((uint64_t)a4, 12);
  v142 = sub_10004E20C((uint64_t)a4, 2);
  v141 = sub_10004E20C((uint64_t)a4, 100);
  v140 = sub_10004E20C((uint64_t)a4, 14);
  v139 = sub_10004E20C((uint64_t)a4, 11);
  id v27 = sub_10004E20C((uint64_t)a4, 0);
  v138 = sub_10004F638((uint64_t)a4, 56);
  BOOL v137 = sub_10004F638((uint64_t)a4, 380);
  uint64_t v136 = sub_10004E8BC((uint64_t)a4, 381);
  v225 = sub_10004E20C((uint64_t)a4, 382);
  if (!v225)
  {
    v225 = sub_10004E20C((uint64_t)a4, 148);
  }
  v208 = (void *)v10;
  v135 = sub_10004F638((uint64_t)a4, 102);
  uint64_t v134 = sub_10004EA18((uint64_t)a4, 383);
  uint64_t v133 = sub_10004F638((uint64_t)a4, 181);
  uint64_t v132 = sub_10004F638((uint64_t)a4, 198);
  v131 = sub_10004F638((uint64_t)a4, 199);
  uint64_t v130 = sub_10004F638((uint64_t)a4, 138);
  id v129 = sub_10004E20C((uint64_t)a4, 50);
  uint64_t v28 = sub_10004F6B4((uint64_t)a4, 343);
  v128 = sub_10004E20C((uint64_t)a4, 195);
  v127 = sub_10004E8BC((uint64_t)a4, 194);
  id v126 = sub_10004F638((uint64_t)a4, 196);
  v125 = sub_10004F638((uint64_t)a4, 197);
  uint64_t v29 = sub_10004F6B4((uint64_t)a4, 200);
  uint64_t v30 = sub_10004F6B4((uint64_t)a4, 201);
  long long v124 = sub_10004E20C((uint64_t)a4, 202);
  long long v123 = sub_10004E20C((uint64_t)a4, 203);
  long long v122 = sub_10004E20C((uint64_t)a4, 204);
  long long v121 = sub_10004E20C((uint64_t)a4, 205);
  id v120 = sub_10004E20C((uint64_t)a4, 206);
  if (_os_feature_enabled_impl())
  {
    uint64_t v31 = [v5 resultBundleId];
    unint64_t v32 = v5;
    if (v31
      && (id v33 = (void *)v31,
          [v5 resultBundleId],
          os_log_type_t v34 = objc_claimAutoreleasedReturnValue(),
          unsigned int v35 = [v34 isEqualToString:SSEventBundleIdentifier],
          v34,
          v33,
          v35))
    {
      os_log_type_t v36 = v32;
      uint64_t v37 = [v32 personalAnswerString];

      v224 = (void *)v37;
    }
    else
    {
      os_log_type_t v36 = v32;
    }
  }
  else
  {
    os_log_type_t v36 = v5;
  }
  BOOL v68 = v29 != 0;
  BOOL v61 = v28 != 0;
  BOOL v38 = v26 != 0;
  BOOL v39 = v116 != 0;
  BOOL v40 = v118 != 0;
  CFIndex v41 = sub_10004E8BC((uint64_t)a4, 209);
  v119 = sub_10004E20C((uint64_t)a4, 210);
  id v117 = sub_10004E20C((uint64_t)a4, 211);
  long long v115 = sub_10004E20C((uint64_t)a4, 212);
  long long v114 = sub_10004E20C((uint64_t)a4, 213);
  long long v113 = sub_10004F638((uint64_t)a4, 214);
  long long v112 = sub_10004E8BC((uint64_t)a4, 215);
  long long v111 = sub_10004E8BC((uint64_t)a4, 216);
  long long v110 = sub_10004E8BC((uint64_t)a4, 218);
  long long v109 = sub_10004E8BC((uint64_t)a4, 219);
  long long v108 = sub_10004E8BC((uint64_t)a4, 220);
  long long v107 = sub_10004E20C((uint64_t)a4, 221);
  __int16 v106 = sub_10004E20C((uint64_t)a4, 222);
  CFStringRef v105 = sub_10004E20C((uint64_t)a4, 223);
  long long v104 = sub_10004F638((uint64_t)a4, 224);
  long long v103 = sub_10004F638((uint64_t)a4, 225);
  long long v102 = sub_10004E20C((uint64_t)a4, 226);
  long long v101 = sub_10004E20C((uint64_t)a4, 227);
  long long v100 = sub_10004E20C((uint64_t)a4, 229);
  long long v99 = sub_10004E20C((uint64_t)a4, 230);
  unsigned __int8 v98 = sub_10004E20C((uint64_t)a4, 231);
  long long v97 = sub_10004E20C((uint64_t)a4, 232);
  BOOL v96 = sub_10004E20C((uint64_t)a4, 233);
  long long v95 = sub_10004E20C((uint64_t)a4, 234);
  id v94 = sub_10004E20C((uint64_t)a4, 235);
  long long v93 = sub_10004E20C((uint64_t)a4, 236);
  os_log_type_t v92 = sub_10004E20C((uint64_t)a4, 237);
  id v91 = sub_10004E20C((uint64_t)a4, 238);
  id v90 = sub_10004E20C((uint64_t)a4, 239);
  id v89 = sub_10004E20C((uint64_t)a4, 240);
  id v88 = sub_10004E20C((uint64_t)a4, 241);
  unsigned int v87 = sub_10004E20C((uint64_t)a4, 242);
  id v86 = sub_10004E20C((uint64_t)a4, 245);
  id v85 = sub_10004E20C((uint64_t)a4, 246);
  id v84 = sub_10004E20C((uint64_t)a4, 255);
  v83 = sub_10004E20C((uint64_t)a4, 256);
  v82 = sub_10004E20C((uint64_t)a4, 257);
  v81 = sub_10004E20C((uint64_t)a4, 258);
  v80 = sub_10004E20C((uint64_t)a4, 259);
  v79 = sub_10004E20C((uint64_t)a4, 208);
  id v78 = sub_10004E20C((uint64_t)a4, 260);
  v77 = sub_10004E20C((uint64_t)a4, 263);
  id v76 = sub_10004F638((uint64_t)a4, 268);
  v75 = sub_10004E20C((uint64_t)a4, 269);
  v74 = sub_10004E20C((uint64_t)a4, 270);
  v73 = sub_10004E20C((uint64_t)a4, 271);
  v72 = sub_10004E8BC((uint64_t)a4, 122);
  uint64_t v71 = sub_10004E20C((uint64_t)a4, 140);
  v67 = sub_10004E8BC((uint64_t)a4, 129);
  v66 = sub_10004E8BC((uint64_t)a4, 134);
  uint64_t v65 = sub_10004E8BC((uint64_t)a4, 137);
  id v64 = sub_10004E20C((uint64_t)a4, 274);
  id v63 = sub_10004EAF0((uint64_t)a4, 275);
  id v62 = sub_10004E20C((uint64_t)a4, 288);
  uint64_t v42 = [v36 contentType];
  id v43 = (void *)v42;
  if (v42) {
    __int16 v44 = (void *)v42;
  }
  else {
    __int16 v44 = v27;
  }
  id v45 = v44;

  os_log_type_t v46 = objc_opt_new();
  [v46 beginDictionary];
  unint64_t v47 = +[NSNumber numberWithBool:v40];
  [v46 encodeObject:v47 withKey:MDItemIsAllDay];

  id v48 = +[NSNumber numberWithBool:v69];
  [v46 encodeObject:v48 withKey:MDItemBackgroundRunnable];

  [v46 encodeObject:v222 withKey:MDItemFileSize];
  [v46 encodeObject:v138 withKey:MDItemNumberOfPages];
  [v46 encodeObject:v221 withKey:MDItemActionIdentifiers];
  [v46 encodeObject:v220 withKey:MDItemAdditionalRecipientEmailAddresses];
  [v46 encodeObject:v167 withKey:MDItemAlbum];
  [v46 encodeObject:v219 withKey:MDItemAlternateNames];
  [v46 encodeObject:v173 withKey:MDItemApprovedStatus];
  [v46 encodeObject:v174 withKey:MDItemApprovedStatusString];
  [v46 encodeObject:v218 withKey:MDItemApproverContactDSID];
  [v46 encodeObject:v217 withKey:MDItemApprovers];
  [v46 encodeObject:v166 withKey:MDItemArtist];
  [v46 encodeObject:v216 withKey:MDItemAttachmentNames];
  [v46 encodeObject:v215 withKey:MDItemAttachmentPaths];
  [v46 encodeObject:v214 withKey:MDItemAttachmentTypes];
  [v46 encodeObject:v212 withKey:MDItemAuthorAddresses];
  [v46 encodeObject:v213 withKey:MDItemAuthorContactIdentifiers];
  [v46 encodeObject:v211 withKey:MDItemAuthorContactDSID];
  [v46 encodeObject:v210 withKey:MDItemAuthorEmailAddresses];
  [v46 encodeObject:v209 withKey:MDItemAuthors];
  [v46 encodeObject:v172 withKey:MDItemBackgroundColor];
  [v46 encodeObject:v165 withKey:MDItemCalendarDelegateIdentifier];
  [v46 encodeObject:v181 withKey:MDItemCompletionDate];
  [v46 encodeObject:v162 withKey:MDItemContentURL];
  [v46 encodeObject:v178 withKey:MDItemEndDate];
  [v46 encodeObject:v177 withKey:MDItemExpirationDate];
  [v46 encodeObject:v164 withKey:MDItemContactIdentifier];
  [v46 encodeObject:v163 withKey:MDItemContainerDisplayName];
  [v46 encodeObject:v180 withKey:MDItemContentCreationDate];
  [v46 encodeObject:v161 withKey:MDItemDescription];
  [v46 encodeObject:v224 withKey:MDItemDisplayName];
  [v46 encodeObject:v179 withKey:MDItemDueDate];
  [v46 encodeObject:v171 withKey:MDItemDurationSeconds];
  [v46 encodeObject:v160 withKey:MDItemIdentifier];
  [v46 encodeObject:v159 withKey:MDItemKind];
  [v46 encodeObject:v170 withKey:MDItemLatitude];
  [v46 encodeObject:v169 withKey:MDItemLongitude];
  long long v49 = +[NSNumber numberWithBool:v38];
  [v46 encodeObject:v49 withKey:MDItemSupportsNavigation];

  [v46 encodeObject:v176 withKey:MDItemContentModificationDate];
  [v46 encodeObject:v158 withKey:MDMessageIndexType];
  [v46 encodeObject:v157 withKey:MDItemNamedLocation];
  [v46 encodeObject:v156 withKey:MDItemPersonIdentifier];
  [v46 encodeObject:v208 withKey:MDItemPhoneNumbers];
  unsigned __int8 v50 = +[NSNumber numberWithBool:v39];
  [v46 encodeObject:v50 withKey:MDItemSupportsPhoneCall];

  [v46 encodeObject:v207 withKey:MDItemPhotosPeopleNames];
  [v46 encodeObject:v206 withKey:MDItemPhotosPeopleNamesIndex];
  [v46 encodeObject:v205 withKey:MDItemPhotosPeoplePersonIdentifiers];
  [v46 encodeObject:v199 withKey:MDItemPhotosSceneClassificationLabelsIndex];
  [v46 encodeObject:v200 withKey:MDItemPhotosSceneClassificationSynonymsCounts];
  [v46 encodeObject:v202 withKey:MDItemPhotosSceneClassificationSynonymsIndex];
  [v46 encodeObject:v201 withKey:MDItemPhotosSceneClassificationSynonyms];
  [v46 encodeObject:v204 withKey:MDItemPhotosSceneClassificationIdentifiers];
  [v46 encodeObject:v203 withKey:MDItemPhotosSceneClassificationTypes];
  [v46 encodeObject:v198 withKey:MDItemEmailAddresses];
  [v46 encodeObject:v155 withKey:MDItemPunchoutLabel];
  [v46 encodeObject:v197 withKey:MDItemPrimaryRecipientEmailAddresses];
  [v46 encodeObject:v154 withKey:MDItemRatingDescription];
  [v46 encodeObject:v168 withKey:MDItemStarRating];
  [v46 encodeObject:v196 withKey:MDItemRecipients];
  [v46 encodeObject:v195 withKey:MDItemRecipientContactIdentifiers];
  [v46 encodeObject:v194 withKey:MDItemRelatedObjects];
  [v46 encodeObject:v153 withKey:MDItemRelatedAppBundleIdentifier];
  [v46 encodeObject:v191 withKey:MDItemRunnableShortcutsData];
  [v46 encodeObject:v193 withKey:MDItemRunnableShortcutsAccessorySymbol];
  [v46 encodeObject:v192 withKey:MDItemRunnableShortcutsDisplayOrder];
  [v46 encodeObject:v189 withKey:MDItemRunnableShortcutsIsAppShortcutTopHit];
  [v46 encodeObject:v188 withKey:MDItemRunnableShortcutsAssociatedSettingsPreference];
  [v46 encodeObject:v187 withKey:MDItemRunnableShortcutsEntityThumbnailDisplayStyle];
  [v46 encodeObject:v186 withKey:MDItemRunnableShortcutsActionIdentifier];
  [v46 encodeObject:v185 withKey:MDItemRunnableShortcutsIsAppTopHitExclusive];
  [v46 encodeObject:v184 withKey:MDItemRunnableShortcutsTopHitBadge];
  [v46 encodeObject:v183 withKey:MDItemRunnableShortcutsLNPropertyIdentifier];
  [v46 encodeObject:v182 withKey:MDItemRunnableShortcutsBiomeStreamIdentifier];
  [v46 encodeObject:v151 withKey:MDItemSharedItemContentType];
  [v46 encodeObject:v152 withKey:MDItemSnippet];
  [v46 encodeObject:v175 withKey:MDItemStartDate];
  [v46 encodeObject:v150 withKey:MDItemSubject];
  [v46 encodeObject:v149 withKey:MDItemThumbnailBundleID];
  [v46 encodeObject:v148 withKey:MDItemThumbnailContentType];
  [v46 encodeObject:v147 withKey:MDItemThumbnailDataPath];
  [v46 encodeObject:v146 withKey:MDItemThumbnailSymbolName];
  [v46 encodeObject:v145 withKey:MDItemThumbnailURL];
  [v46 encodeObject:v190 withKey:MDItemUserActivityData];
  [v46 encodeObject:v144 withKey:MDItemDarkThumbnailURL];
  [v46 encodeObject:v143 withKey:MDItemTitle];
  [v46 encodeObject:v223 withKey:@"SSAttributeTopMatchedStrings"];
  [v46 encodeObject:v142 withKey:MDItemUniqueIdentifier];
  [v46 encodeObject:v141 withKey:MDItemURL];
  [v46 encodeObject:v140 withKey:MDItemUserActivityRequiredString];
  [v46 encodeObject:v139 withKey:MDItemUserActivityType];
  [v46 encodeObject:v45 withKey:MDItemContentType];

  [v46 encodeObject:v137 withKey:MDItemHasLPMedia];
  [v46 encodeObject:v136 withKey:MDItemLPMediaPaths];
  [v46 encodeObject:v225 withKey:MDItemGroupPhotoPath];
  [v46 encodeObject:v135 withKey:MDItemSyndicationStatus];
  [v46 encodeObject:v134 withKey:MDItemSyndicatedContentServerDate];
  [v46 encodeObject:v133 withKey:MDItemCachedViewData];
  [v46 encodeObject:v132 withKey:MDItemPhotosKeywordsIndex];
  [v46 encodeObject:v131 withKey:MDItemPhotosLocationKeywordsIndex];
  [v46 encodeObject:v130 withKey:MDItemPhotosLocationKeywords];
  [v46 encodeObject:v129 withKey:MDItemDomainIdentifier];
  [v46 encodeObject:v128 withKey:MDItemComment];
  [v46 encodeObject:v127 withKey:MDItemHashtags];
  [v46 encodeObject:v126 withKey:MDItemReminderFlagged];
  [v46 encodeObject:v125 withKey:MDItemReminderRecurring];
  uint64_t v51 = +[NSNumber numberWithBool:v61];
  [v46 encodeObject:v51 withKey:MDItemContentRating];

  [v46 encodeObject:v124 withKey:MDItemNoteFolderName];
  [v46 encodeObject:v123 withKey:MDItemNoteAccountName];
  long long v52 = +[NSNumber numberWithBool:v68];
  [v46 encodeObject:v52 withKey:MDItemNoteIsShared];

  uint64_t v53 = +[NSNumber numberWithBool:v30 != 0];
  [v46 encodeObject:v53 withKey:MDItemNoteIsLocked];

  [v46 encodeObject:v122 withKey:MDItemPhoneCallStatus];
  [v46 encodeObject:v121 withKey:MDItemPhoneCallBackURL];
  [v46 encodeObject:v120 withKey:MDItemPhoneCallType];
  [v46 encodeObject:v41 withKey:MDItemAdditionalRecipients];
  [v46 encodeObject:v119 withKey:MDItemCity];
  [v46 encodeObject:v117 withKey:MDItemCountry];
  [v46 encodeObject:v115 withKey:MDItemCreator];
  [v46 encodeObject:v114 withKey:MDItemFullyFormattedAddress];
  [v46 encodeObject:v113 withKey:MDItemHTMLContentData];
  [v46 encodeObject:v112 withKey:MDItemInstantMessageAddresses];
  [v46 encodeObject:v111 withKey:MDItemPhotosPeopleContactIdentifiers];
  [v46 encodeObject:v110 withKey:MDItemPrimaryRecipients];
  [v46 encodeObject:v109 withKey:MDItemRecipientAddresses];
  [v46 encodeObject:v108 withKey:MDItemRecipientEmailAddresses];
  [v46 encodeObject:v107 withKey:MDItemStateOrProvince];
  [v46 encodeObject:v106 withKey:MDItemTextContent];
  [v46 encodeObject:v105 withKey:MDItemMessagesChatId];
  [v46 encodeObject:v104 withKey:MDItemInterestingDate];
  [v46 encodeObject:v103 withKey:MDItemPassbookTransactionAmount];
  [v46 encodeObject:v102 withKey:MDItemPassbookTransactionCurrencyCode];
  [v46 encodeObject:v101 withKey:MDMailMessageID];
  [v46 encodeObject:v100 withKey:MDItemEventType];
  [v46 encodeObject:v99 withKey:MDItemEventFlightDesignator];
  [v46 encodeObject:v98 withKey:MDItemEventFlightNumber];
  [v46 encodeObject:v97 withKey:MDItemEventFlightCheckInUrl];
  [v46 encodeObject:v96 withKey:MDItemEventFlightBookingInfoUrl];
  [v46 encodeObject:v95 withKey:MDItemEventFlightCarrier];
  [v46 encodeObject:v94 withKey:MDItemEventFlightCarrierCode];
  [v46 encodeObject:v93 withKey:MDItemEventFlightArrivalTimeZone];
  [v46 encodeObject:v92 withKey:MDItemEventFlightDepartureTimeZone];
  [v46 encodeObject:v91 withKey:MDItemEventFlightArrivalAirportCode];
  [v46 encodeObject:v90 withKey:MDItemEventFlightArrivalAirportName];
  [v46 encodeObject:v89 withKey:MDItemEventFlightDepartureAirportCode];
  [v46 encodeObject:v88 withKey:MDItemEventFlightDepartureAirportName];
  [v46 encodeObject:v87 withKey:MDItemEventFlightConfirmationNumber];
  [v46 encodeObject:v86 withKey:MDItemEventFlightArrivalTerminal];
  [v46 encodeObject:v85 withKey:MDItemEventFlightDepartureTerminal];
  [v46 encodeObject:v84 withKey:MDItemEventHotelReservationId];
  [v46 encodeObject:v83 withKey:MDItemEventHotelUnderName];
  [v46 encodeObject:v82 withKey:MDItemEventHotelTimeZone];
  [v46 encodeObject:v81 withKey:MDItemEventHotelModifyReservationUrl];
  [v46 encodeObject:v80 withKey:MDItemEventHotelReservationForName];
  [v46 encodeObject:v79 withKey:MDItemEventHotelReservationForAddress];
  [v46 encodeObject:v78 withKey:MDItemEventHotelReservationForTelephone];
  [v46 encodeObject:v77 withKey:MDItemEventRestaurantPartySize];
  [v46 encodeObject:v76 withKey:MDItemMailCategories];
  [v46 encodeObject:v75 withKey:MDItemAppEntityInstanceId];
  [v46 encodeObject:v74 withKey:MDItemAppEntityType];
  [v46 encodeObject:v73 withKey:MDItemSafariCloudTabDeviceName];
  [v46 encodeObject:v72 withKey:MDItemPhotosBusinessNames];
  [v46 encodeObject:v71 withKey:MDItemPhotosDescription];
  objc_msgSend(v46, "encodeObject:withKey:");
  objc_msgSend(v46, "encodeObject:withKey:");
  objc_msgSend(v46, "encodeObject:withKey:");
  objc_msgSend(v46, "encodeObject:withKey:");
  objc_msgSend(v46, "encodeObject:withKey:");
  objc_msgSend(v46, "encodeObject:withKey:");
  [v46 endDictionary];
  uint64_t v54 = [v46 data];
  id v55 = [v54 copy];
  [v36 setAttributeData:v55];

  uint64_t v56 = [v36 lastUsedDate];
  id v57 = (void *)v56;
  if (v226) {
    uint64_t v58 = (uint64_t)v226;
  }
  else {
    uint64_t v58 = (uint64_t)v70;
  }
  if (v56) {
    uint64_t v59 = v56;
  }
  else {
    uint64_t v59 = v58;
  }
  [v36 setLastUsedDate:v59];

  if (v226 && v70)
  {
    id v60 = [v226 laterDate:v70];
    [v36 setLastUsedDate:v60];
  }
}

@end