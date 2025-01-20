@interface PKCoreSpotlightUtilities
+ (CGSize)_thumbnailImageSizeForSourceImageSize:(CGSize)result;
+ (id)_extraDataAttributeForPass:(id)a3;
+ (id)passUniqueIdentifierFromCardInformationSpotlightIdentifier:(id)a3;
+ (id)passUniqueIdentifierFromSpotlightIdentifier:(id)a3;
+ (id)spotlightIdentifierForCardInformationUniqueIdentifier:(id)a3;
+ (id)spotlightIdentifierForPassUniqueIdentifier:(id)a3;
+ (id)spotlightIdentifierForTransactionIdentifier:(id)a3;
+ (id)textContentAttributeForPass:(id)a3;
+ (id)transactionIdentifierFromSpotlightIdentifier:(id)a3;
+ (void)searchableItemForCardNumberFromPass:(id)a3 completion:(id)a4;
+ (void)searchableItemForPass:(id)a3 completion:(id)a4;
+ (void)searchableItemForPass:(id)a3 passKitServicesXPCService:(id)a4 completion:(id)a5;
+ (void)searchableItemForTransaction:(id)a3 passUniqueIdentifier:(id)a4 regions:(id)a5 tags:(id)a6 keywords:(id)a7 imageGenerator:(id)a8 contactResolver:(id)a9 completion:(id)a10;
@end

@implementation PKCoreSpotlightUtilities

+ (void)searchableItemForTransaction:(id)a3 passUniqueIdentifier:(id)a4 regions:(id)a5 tags:(id)a6 keywords:(id)a7 imageGenerator:(id)a8 contactResolver:(id)a9 completion:(id)a10
{
  v172[2] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v150 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v22)
  {
    id v148 = v18;
    id v149 = v19;
    v138 = v21;
    v143 = v20;
    v145 = +[PKPaymentTransactionPresentation presentationInformationForTransaction:v16 transactionSource:0 secondaryTransactionSource:0 familyMember:0 account:0 deviceName:0 context:2];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.pktransaction"];
    v24 = [v16 merchant];
    v25 = [v24 mapsMerchant];
    v142 = v24;
    v146 = [v24 mapsBrand];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke;
    aBlock[3] = &unk_1E56E43A8;
    id v170 = a1;
    id v26 = v16;
    id v166 = v26;
    id v167 = v17;
    id v27 = v23;
    id v168 = v27;
    id v141 = v22;
    id v169 = v22;
    v136 = (void (**)(void))_Block_copy(aBlock);
    v28 = [v26 transactionDate];
    [v27 setAddedDate:v28];

    v29 = [v26 transactionStatusChangedDate];

    v151 = v27;
    if (v29)
    {
      v30 = [v26 transactionDate];
      v172[0] = v30;
      v31 = [v26 transactionStatusChangedDate];
      v172[1] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:2];
      [v27 setImportantDates:v32];
    }
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionAmount" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
    v34 = [v26 amount];
    v135 = (void *)v33;
    [v27 setValue:v34 forCustomKey:v33];

    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionCurrencyCode" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
    v36 = [v26 currencyCode];
    v134 = (void *)v35;
    [v27 setValue:v36 forCustomKey:v35];

    uint64_t v37 = [v26 transactionType];
    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionType" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
    unint64_t v127 = v37;
    v39 = [NSNumber numberWithInteger:v37];
    v133 = (void *)v38;
    [v27 setValue:v39 forCustomKey:v38];

    uint64_t v40 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionStatus" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
    v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "transactionStatus"));
    v132 = (void *)v40;
    [v27 setValue:v41 forCustomKey:v40];

    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionSource" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
    v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "effectiveTransactionSource"));
    v131 = (void *)v42;
    [v27 setValue:v43 forCustomKey:v42];

    if (v25)
    {
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_POImuid" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "identifier"));
      v46 = [v45 stringValue];
      [v27 setValue:v46 forCustomKey:v44];
    }
    v47 = v149;
    if (v146)
    {
      v48 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_Brandmuid" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      v49 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v146, "identifier"));
      v50 = [v49 stringValue];
      [v151 setValue:v50 forCustomKey:v48];
    }
    id v139 = v17;
    id v140 = v16;
    v144 = v25;
    if ([v150 count])
    {
      id v51 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v161 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v53 = v150;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v161 objects:v171 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v162;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v162 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = *(void **)(*((void *)&v161 + 1) + 8 * i);
            v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v58, "type"));
            [v51 addObject:v59];

            v60 = [v58 localizedTitle];
            if (v60) {
              [v52 addObject:v60];
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v161 objects:v171 count:16];
        }
        while (v55);
      }

      v61 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionTags" searchable:1 searchableByDefault:1 unique:0 multiValued:1];
      v62 = [v51 allObjects];
      [v151 setValue:v62 forCustomKey:v61];

      v63 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionTagKeywords" searchable:1 searchableByDefault:1 unique:0 multiValued:1];
      v64 = [v52 allObjects];
      [v151 setValue:v64 forCustomKey:v63];

      id v18 = v148;
      v47 = v149;
    }
    if ([v47 count]) {
      [v151 setKeywords:v47];
    }
    uint64_t v65 = [v26 identifier];
    if (v65)
    {
      v66 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionIdentifier" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      [v151 setValue:v65 forCustomKey:v66];
    }
    v129 = [v26 transactionSourceIdentifier];
    if (v129)
    {
      v67 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionSourceIdentifier" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      v68 = [v26 transactionSourceIdentifier];
      [v151 setValue:v68 forCustomKey:v67];
    }
    uint64_t v69 = [v26 altDSID];
    if (v69)
    {
      v70 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionAltDSID" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      [v151 setValue:v69 forCustomKey:v70];
    }
    v130 = (void *)v65;
    v128 = (void *)v69;
    if ([v26 transactionType] == 3)
    {
      v71 = [v145 secondaryString];
      v147 = [v145 tertiaryString];
      if ([(__CFString *)v71 length])
      {
        v72 = &stru_1EE0F5368;
        if ([&stru_1EE0F5368 length])
        {
          v72 = [&stru_1EE0F5368 stringByAppendingString:@"\n"];
        }
        v73 = [(__CFString *)v72 stringByAppendingFormat:@"%@", v71];
      }
      else
      {
        v73 = &stru_1EE0F5368;
      }
      if ([v147 length])
      {
        if ([(__CFString *)v73 length])
        {
          uint64_t v81 = [(__CFString *)v73 stringByAppendingString:@"\n"];

          v73 = (__CFString *)v81;
        }
        uint64_t v82 = [(__CFString *)v73 stringByAppendingFormat:@"%@", v147];

        v73 = (__CFString *)v82;
      }
      [v151 setContentDescription:v73];
      uint64_t v83 = [v26 peerPaymentCounterpartHandle];
      if (v83)
      {
        v84 = (void *)v83;
        v85 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionHandle" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
        [v151 setValue:v84 forCustomKey:v85];
        v86 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionSubType" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
        v87 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "peerPaymentType"));
        [v151 setValue:v87 forCustomKey:v86];

        id v18 = v148;
        v156[0] = MEMORY[0x1E4F143A8];
        v156[1] = 3221225472;
        v156[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_2;
        v156[3] = &unk_1E56E43D0;
        id v77 = v84;
        id v157 = v77;
        id v158 = v151;
        id v159 = v26;
        v79 = v136;
        v160 = v136;
        id v21 = v138;
        [v138 contactForHandle:v77 withCompletion:v156];

        id v20 = v143;
      }
      else
      {
        v79 = v136;
        v136[2](v136);
        id v77 = 0;
        id v20 = v143;
        id v21 = v138;
      }
      v98 = v146;
LABEL_86:

      id v17 = v139;
      id v16 = v140;
      id v19 = v149;
      goto LABEL_87;
    }
    v74 = [v145 primaryString];
    v75 = [v74 stringByReplacingOccurrencesOfString:@" " withString:@" "];
    [v151 setDisplayName:v75];

    v76 = [v145 secondaryString];
    v73 = [v145 tertiaryString];
    id v77 = [v145 badgeString];
    v147 = v76;
    if ([v76 length])
    {
      v78 = &stru_1EE0F5368;
      v79 = v136;
      if ([&stru_1EE0F5368 length])
      {
        v78 = [&stru_1EE0F5368 stringByAppendingString:@"\n"];
      }
      v80 = v151;
      v71 = [(__CFString *)v78 stringByAppendingFormat:@"%@", v147];
    }
    else
    {
      v71 = &stru_1EE0F5368;
      v80 = v151;
      v79 = v136;
    }
    if ([(__CFString *)v73 length])
    {
      if ([(__CFString *)v71 length])
      {
        uint64_t v88 = [(__CFString *)v71 stringByAppendingString:@"\n"];

        v71 = (__CFString *)v88;
      }
      uint64_t v89 = [(__CFString *)v71 stringByAppendingFormat:@"%@", v73];

      v71 = (__CFString *)v89;
    }
    [v80 setContentDescription:v71];
    if ([v77 length]) {
      [v80 setComment:v77];
    }
    v90 = [v26 merchant];
    uint64_t v91 = [v90 category];

    if (v91 && v127 <= 0xE && ((1 << v127) & 0x4003) != 0)
    {
      v92 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionCategory" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      v93 = [NSNumber numberWithInteger:v91];
      [v80 setValue:v93 forCustomKey:v92];
    }
    v94 = [v144 postalAddress];
    v95 = [v26 locality];

    if (v95)
    {
      v96 = [v26 locality];
      [v80 setCity:v96];

      v97 = [v26 administrativeArea];
      [v80 setStateOrProvince:v97];
    }
    else
    {
      if (!v94)
      {
LABEL_61:
        v137 = v94;
        v104 = [v26 preferredLocation];
        v105 = v104;
        if (v104)
        {
          [v104 coordinate];
          double latitude = v173.latitude;
          double longitude = v173.longitude;
          if (CLLocationCoordinate2DIsValid(v173))
          {
            v108 = [NSNumber numberWithDouble:latitude];
            [v80 setLatitude:v108];

            v109 = [NSNumber numberWithDouble:longitude];
            [v80 setLongitude:v109];
          }
        }
        if ([v18 count])
        {
          v110 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionRegions" searchable:1 searchableByDefault:1 unique:0 multiValued:1];
          v111 = [v18 valueForKey:@"identifier"];
          [v151 setValue:v111 forCustomKey:v110];
        }
        v112 = [v142 originURL];

        if (v112)
        {
          uint64_t v113 = [v142 originURL];
        }
        else
        {
          v114 = [v144 url];

          if (v114)
          {
            v115 = v144;
          }
          else
          {
            v116 = [v146 url];

            if (!v116)
            {
LABEL_74:
              v118 = [v26 rewards];
              v119 = [v118 rewardsItems];
              uint64_t v120 = [v119 count];

              if (v120)
              {
                v121 = [v118 totalEligibleValueForUnit:1];
                v122 = v121;
                if (v121 && (objc_msgSend(v121, "pk_isZeroNumber") & 1) == 0)
                {
                  v123 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionRewardsPercentAggregate" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
                  [v151 setValue:v122 forCustomKey:v123];
                }
                v124 = [v118 totalEligibleValueForUnit:2];
                v125 = v124;
                if (v124 && (objc_msgSend(v124, "pk_isZeroNumber") & 1) == 0)
                {
                  v126 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_transactionRewardsCashAggregate" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
                  [v151 setValue:v125 forCustomKey:v126];

                  id v22 = v141;
                }
              }
              id v18 = v148;
              if (v143)
              {
                v152[0] = MEMORY[0x1E4F143A8];
                v152[1] = 3221225472;
                v152[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_4;
                v152[3] = &unk_1E56E43F8;
                id v153 = v151;
                v155 = v79;
                id v154 = v143;
                objc_msgSend(v154, "imageDataForTransaction:size:completion:", v26, v152, 75.0, 75.0);
              }
              else
              {
                v79[2](v79);
              }
              id v21 = v138;
              v98 = v146;

              id v20 = v143;
              goto LABEL_86;
            }
            v115 = v146;
          }
          uint64_t v113 = [v115 url];
        }
        v117 = (void *)v113;
        [v151 setURL:v113];

        goto LABEL_74;
      }
      v99 = [v94 street];
      [v80 setThoroughfare:v99];

      v100 = [v94 city];
      [v80 setCity:v100];

      v101 = [v94 state];
      [v80 setStateOrProvince:v101];

      v102 = [v94 country];
      [v80 setCountry:v102];

      v103 = [v94 postalCode];
      [v80 setPostalCode:v103];

      v97 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v94 style:0];
      [v80 setFullyFormattedAddress:v97];
    }

    goto LABEL_61;
  }
LABEL_87:
}

void __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F23840]);
  v3 = *(void **)(a1 + 64);
  v4 = [*(id *)(a1 + 32) identifier];
  v5 = [v3 spotlightIdentifierForTransactionIdentifier:v4];
  id v7 = (id)[v2 initWithUniqueIdentifier:v5 domainIdentifier:*(void *)(a1 + 40) attributeSet:*(void *)(a1 + 48)];

  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v7 setExpirationDate:v6];

  +[PKAppIntentUtilities associateSearchableItem:v7 withEntityForTransaction:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_3;
  block[3] = &unk_1E56D8C20;
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_3(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:*(void *)(a1 + 32) contact:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setDisplayName:v2];
  id v3 = *(void **)(a1 + 48);
  v16[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v3 setAccountHandles:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F23810]);
  uint64_t v15 = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v7 = [*(id *)(a1 + 40) identifier];
  id v8 = (void *)[v5 initWithDisplayName:v2 handles:v6 handleIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 56) peerPaymentType];
    if (v9 == 2)
    {
      v12 = *(void **)(a1 + 48);
      v13 = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [v12 setAuthors:v11];
      goto LABEL_6;
    }
    if (v9 == 1)
    {
      id v10 = *(void **)(a1 + 48);
      v14 = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      [v10 setPrimaryRecipients:v11];
LABEL_6:
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setThumbnailData:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

+ (void)searchableItemForPass:(id)a3 completion:(id)a4
{
}

+ (void)searchableItemForPass:(id)a3 passKitServicesXPCService:(id)a4 completion:(id)a5
{
  v111[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    goto LABEL_50;
  }
  id v98 = a1;
  v11 = [v8 paymentPass];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.pkpass"];
  v13 = [v8 localizedDescription];
  v14 = [v13 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  [v12 setDisplayName:v14];

  v99 = (void (**)(void, void))v10;
  v100 = v11;
  uint64_t v15 = v11;
  if (v11)
  {
    uint64_t v16 = [v11 cobrandName];
    id v17 = (void *)v16;
    if (v16)
    {
      v111[0] = v16;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:1];
      [v12 setAlternateNames:v18];
    }
    if ([v15 isTransitPass])
    {
      id v19 = @"TRANSIT_CARD";
    }
    else if ([v15 isAccessPass])
    {
      id v19 = @"ACCESS_BADGE";
    }
    else
    {
      if ([v15 isIdentityPass])
      {
        uint64_t v22 = PKLocalizedIdentityString(&cfstr_GovernmentId.isa, 0);
LABEL_14:
        uint64_t v20 = v22;
        if ([v15 hasAssociatedPeerPaymentAccount])
        {
          v94 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo.isa, 0);
          v95 = v17;
          v93 = [v94 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[0] = v93;
          v92 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_0.isa, 0);
          uint64_t v91 = [v92 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[1] = v91;
          v90 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_1.isa, 0);
          uint64_t v89 = [v90 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[2] = v89;
          uint64_t v88 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_2.isa, 0);
          v87 = [v88 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[3] = v87;
          v86 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_3.isa, 0);
          v85 = [v86 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[4] = v85;
          v84 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_4.isa, 0);
          uint64_t v83 = [v84 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[5] = v83;
          uint64_t v82 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_5.isa, 0);
          uint64_t v81 = [v82 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[6] = v81;
          v80 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_6.isa, 0);
          v79 = [v80 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[7] = v79;
          v78 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_7.isa, 0);
          id v77 = [v78 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[8] = v77;
          v76 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_8.isa, 0);
          [v76 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v23 = uint64_t v101 = v20;
          v110[9] = v23;
          v24 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_9.isa, 0);
          [v24 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v25 = id v96 = v9;
          v110[10] = v25;
          id v26 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_10.isa, 0);
          id v27 = [v26 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[11] = v27;
          v28 = PKLocalizedPeerPaymentString(&cfstr_SpotlightKeywo_11.isa, 0);
          v29 = [v28 stringByReplacingOccurrencesOfString:@" " withString:@" "];
          v110[12] = v29;
          v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:13];

          uint64_t v15 = v100;
          id v9 = v96;

          uint64_t v20 = v101;
          [v12 setKeywords:v30];

          id v17 = v95;
        }

        id v21 = &unk_1EE22BC30;
        goto LABEL_17;
      }
      id v19 = @"PAYMENT_CARD";
    }
    uint64_t v22 = PKLocalizedPaymentString(&v19->isa, 0);
    goto LABEL_14;
  }
  uint64_t v20 = [v8 localizedName];
  id v21 = &unk_1EE22BC48;
LABEL_17:
  v102 = (void *)v20;
  [v12 setContentDescription:v20];
  uint64_t v31 = MEMORY[0x1E4F1CC38];
  [v12 setUserOwned:MEMORY[0x1E4F1CC38]];
  [v12 setUserCurated:v31];
  v32 = [v8 organizationName];
  [v12 setCreator:v32];

  v97 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"Passbook_isPaymentPass" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
  objc_msgSend(v12, "setValue:forCustomKey:", v21);
  if (v15)
  {
    uint64_t v33 = PKSanitizedPrimaryAccountRepresentationForPass(v15);
    if ([v33 length]) {
      [v12 setPrimaryAccountNumberSuffix:v33];
    }
    v34 = [v15 localizedValueForFieldKey:@"contactNumber"];
    if ([v34 length])
    {
      v109 = v34;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
      [v12 setPhoneNumbers:v35];

      [v12 setSupportsPhoneCall:MEMORY[0x1E4F1CC38]];
    }
    v36 = [v15 localizedValueForFieldKey:@"contactEmail"];
    if ([v36 length])
    {
      v108 = v36;
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
      [v12 setRecipientEmailAddresses:v37];
    }
    uint64_t v38 = NSString;
    v39 = [v8 uniqueID];
    uint64_t v40 = [v38 stringWithFormat:@"wallet://%@/%@/%@", @"card", v39, @"details"];

    v41 = [MEMORY[0x1E4F1CB10] URLWithString:v40];
    [v12 setCardDetailsActionURL:v41];

    if ([v15 cardType] == 1 && !objc_msgSend(v15, "activationState"))
    {
      int v42 = [v15 isAppleCardPass];
      v43 = NSString;
      if (v42)
      {
        v44 = [NSString stringWithFormat:@"wallet://%@/%@", @"credit", @"numbers"];
      }
      else
      {
        v45 = [v15 uniqueID];
        v44 = [v43 stringWithFormat:@"wallet://%@/%@/%@", @"card", v45, @"cardInformation"];
      }
      v46 = [MEMORY[0x1E4F1CB10] URLWithString:v44];
      [v12 setCardNumberActionURL:v46];

      uint64_t v15 = v100;
    }
    if ([v15 isAppleCardPass] && !objc_msgSend(v15, "activationState"))
    {
      v47 = [NSString stringWithFormat:@"wallet://%@/%@", @"credit", @"billPayment"];
      v48 = [MEMORY[0x1E4F1CB10] URLWithString:v47];
      [v12 setPayBalanceActionURL:v48];

      uint64_t v15 = v100;
    }
  }
  v49 = [v8 ingestedDate];
  [v12 setAddedDate:v49];
  if (!v15)
  {
    v50 = [v8 webServiceURL];

    if (v50)
    {
      id v51 = [v8 modifiedDate];
      [v12 setContentModificationDate:v51];
    }
  }
  id v52 = [v8 relevantDates];
  if ([v52 count])
  {
    id v53 = objc_msgSend(v52, "pk_arrayByApplyingBlock:", &__block_literal_global_79);
    [v12 setImportantDates:v53];
  }
  uint64_t v54 = [v8 embeddedLocationsArray];
  if ([v54 count] == 1)
  {
    uint64_t v55 = [v54 firstObject];
    uint64_t v56 = [v55 name];
    [v12 setNamedLocation:v56];

    [v12 setSupportsNavigation:MEMORY[0x1E4F1CC38]];
    v57 = NSNumber;
    [v55 latitude];
    v58 = objc_msgSend(v57, "numberWithDouble:");
    [v12 setLatitude:v58];

    v59 = NSNumber;
    [v55 longitude];
    v60 = objc_msgSend(v59, "numberWithDouble:");
    [v12 setLongitude:v60];

    if ([v55 hasAltitude])
    {
      v61 = NSNumber;
      [v55 altitude];
      v62 = objc_msgSend(v61, "numberWithDouble:");
      [v12 setAltitude:v62];
    }
  }
  if (_os_feature_enabled_impl() && ![v8 passType])
  {
    v63 = +[PKCoreSpotlightUtilities _extraDataAttributeForPass:v8];
    v64 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"kMDItemExtraData" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
    [v12 setValue:v63 forCustomKey:v64];
    uint64_t v65 = +[PKCoreSpotlightUtilities textContentAttributeForPass:v8];
    [v12 setTextContent:v65];
  }
  v66 = [v8 groupingID];
  v67 = [v8 uniqueID];
  id v68 = objc_alloc(MEMORY[0x1E4F23840]);
  uint64_t v69 = [v98 spotlightIdentifierForPassUniqueIdentifier:v67];
  v70 = (void *)[v68 initWithUniqueIdentifier:v69 domainIdentifier:v66 attributeSet:v12];

  v71 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v70 setExpirationDate:v71];

  +[PKAppIntentUtilities associateSearchableItem:v70 withEntityForPass:v8];
  if (v9)
  {
    PKPassViewFrontSize([v8 style]);
    +[PKCoreSpotlightUtilities _thumbnailImageSizeForSourceImageSize:](PKCoreSpotlightUtilities, "_thumbnailImageSizeForSourceImageSize:");
    double v73 = v72;
    double v75 = v74;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __87__PKCoreSpotlightUtilities_searchableItemForPass_passKitServicesXPCService_completion___block_invoke_2;
    v103[3] = &unk_1E56E4440;
    id v104 = v12;
    id v10 = v99;
    v107 = v99;
    id v105 = v70;
    id v106 = v9;
    objc_msgSend(v106, "snapshotDataForPassUniqueIdentifier:size:completion:", v67, v103, v73, v75);
  }
  else
  {
    id v10 = v99;
    ((void (**)(void, void *))v99)[2](v99, v70);
  }

LABEL_50:
}

uint64_t __87__PKCoreSpotlightUtilities_searchableItemForPass_passKitServicesXPCService_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 earliestDate];
}

uint64_t __87__PKCoreSpotlightUtilities_searchableItemForPass_passKitServicesXPCService_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setThumbnailData:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

+ (void)searchableItemForCardNumberFromPass:(id)a3 completion:(id)a4
{
  v110[12] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v5 = (objc_class *)MEMORY[0x1E4F23850];
    v109 = (void (**)(id, void *))a4;
    id v104 = a3;
    id v6 = (void *)[[v5 alloc] initWithItemContentType:@"com.apple.pkpassdetail"];
    id v7 = [v104 localizedDescription];
    v107 = v6;
    [v6 setDisplayName:v7];

    v13 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_ITEM_DESCRIPTION", 2, 0, v8, v9, v10, v11, v12, v90);
    [v6 setContentDescription:v13];

    id v106 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_CARD_NUMBERS", 2, 0, v14, v15, v16, v17, v18, v91);
    v110[0] = v106;
    id v105 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_INFO", 2, 0, v19, v20, v21, v22, v23, v92);
    v110[1] = v105;
    v103 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_NAME", 2, 0, v24, v25, v26, v27, v28, v93);
    v110[2] = v103;
    v34 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_CVV", 2, 0, v29, v30, v31, v32, v33, v94);
    v110[3] = v34;
    uint64_t v40 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_CVC", 2, 0, v35, v36, v37, v38, v39, v95);
    v110[4] = v40;
    v46 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_SECURITY_CODE", 2, 0, v41, v42, v43, v44, v45, v96);
    v110[5] = v46;
    id v52 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_CODE", 2, 0, v47, v48, v49, v50, v51, v97);
    v110[6] = v52;
    v58 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_EXPIRATION", 2, 0, v53, v54, v55, v56, v57, v98);
    v110[7] = v58;
    v64 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_EXPIRE", 2, 0, v59, v60, v61, v62, v63, v99);
    v110[8] = v64;
    v70 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_NETWORK", 2, 0, v65, v66, v67, v68, v69, v100);
    v110[9] = v70;
    v76 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_ADVANCED_FRAUD_PROTECTION", 2, 0, v71, v72, v73, v74, v75, v101);
    v110[10] = v76;
    uint64_t v82 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SPOTLIGHT_CARD_ADVANCED_FRAUD_PROTECTION", 2, 0, v77, v78, v79, v80, v81, v102);
    v110[11] = v82;
    uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:12];

    v84 = (void *)v83;
    [v107 setKeywords:v83];
    v85 = [v104 groupingID];
    v86 = [v104 uniqueID];

    v87 = [a1 spotlightIdentifierForCardInformationUniqueIdentifier:v86];

    uint64_t v88 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v87 domainIdentifier:v85 attributeSet:v107];
    uint64_t v89 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v88 setExpirationDate:v89];

    v109[2](v109, v88);
  }
}

+ (CGSize)_thumbnailImageSizeForSourceImageSize:(CGSize)result
{
  double v3 = result.width / result.height;
  if (fabs(result.width / result.height + -1.0) >= 0.1)
  {
    if (result.height <= result.width)
    {
      if (result.width > 180.0) {
        result.width = 180.0;
      }
      result.height = ceil(result.width / v3);
    }
    else
    {
      if (result.height > 270.0) {
        result.height = 270.0;
      }
      result.width = ceil(v3 * result.height);
    }
  }
  else
  {
    if (result.width <= result.height) {
      result.width = result.height;
    }
    if (result.width > 180.0) {
      result.width = 180.0;
    }
    result.height = result.width;
  }
  return result;
}

+ (id)spotlightIdentifierForCardInformationUniqueIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"card-information-", a3];
}

+ (id)passUniqueIdentifierFromCardInformationSpotlightIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"card-information-"])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"card-information-" withString:&stru_1EE0F5368];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)spotlightIdentifierForPassUniqueIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"pass-", a3];
}

+ (id)passUniqueIdentifierFromSpotlightIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"pass-"])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"pass-" withString:&stru_1EE0F5368];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)spotlightIdentifierForTransactionIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"transaction-", a3];
}

+ (id)transactionIdentifierFromSpotlightIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"transaction-"])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"transaction-" withString:&stru_1EE0F5368];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_extraDataAttributeForPass:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 passType])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = [v3 frontFieldBuckets];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __55__PKCoreSpotlightUtilities__extraDataAttributeForPass___block_invoke;
    v43[3] = &unk_1E56E4468;
    id v31 = v3;
    id v7 = v3;
    id v44 = v7;
    id v8 = v5;
    id v45 = v8;
    [v6 enumerateObjectsUsingBlock:v43];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = [v7 backFieldBuckets];
    uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v48 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v36 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                uint64_t v19 = objc_msgSend(v18, "label", v31);
                uint64_t v20 = v19;
                if (v19)
                {
                  id v21 = v19;
                }
                else
                {
                  id v21 = [v18 key];
                }
                uint64_t v22 = v21;

                uint64_t v23 = [v18 value];
                uint64_t v24 = (void *)v23;
                if (v22) {
                  BOOL v25 = v23 == 0;
                }
                else {
                  BOOL v25 = 1;
                }
                if (!v25) {
                  [v8 setObject:v23 forKey:v22];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v48 count:16];
            }
            while (v15);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v10);
    }

    id v34 = 0;
    id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:&v34];
    id v26 = v34;
    if (v4)
    {
      id v27 = v4;
    }
    else
    {
      uint64_t v28 = PKLogFacilityTypeGetObject(0x13uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [v26 localizedDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v30;
        _os_log_error_impl(&dword_190E10000, v28, OS_LOG_TYPE_ERROR, "Failed to serialize pass fields: %@", buf, 0xCu);
      }
    }
    id v3 = v31;
  }
  return v4;
}

void __55__PKCoreSpotlightUtilities__extraDataAttributeForPass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 == 1 && [*(id *)(a1 + 32) style] == 4 && objc_msgSend(v5, "count") == 2)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 label];
    if (v7) {
      [*(id *)(a1 + 40) setObject:v7 forKey:@"ORIGIN NAME"];
    }
    id v8 = [v6 value];
    if (v8) {
      [*(id *)(a1 + 40) setObject:v8 forKey:@"ORIGIN CODE"];
    }
    uint64_t v9 = [v5 objectAtIndexedSubscript:1];
    uint64_t v10 = [v9 label];
    if (v10) {
      [*(id *)(a1 + 40) setObject:v10 forKey:@"DESTINATION NAME"];
    }
    uint64_t v11 = [v9 value];
    if (v11) {
      [*(id *)(a1 + 40) setObject:v11 forKey:@"DESTINATION CODE"];
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v5;
    uint64_t v12 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v16, "label", (void)v24);
          uint64_t v18 = v17;
          if (v17)
          {
            id v19 = v17;
          }
          else
          {
            id v19 = [v16 key];
          }
          uint64_t v20 = v19;

          uint64_t v21 = [v16 value];
          uint64_t v22 = (void *)v21;
          if (v20) {
            BOOL v23 = v21 == 0;
          }
          else {
            BOOL v23 = 1;
          }
          if (!v23) {
            [*(id *)(a1 + 40) setObject:v21 forKey:v20];
          }
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
  }
}

+ (id)textContentAttributeForPass:(id)a3
{
  id v3 = a3;
  if ([v3 passType])
  {
    id v4 = PKLogFacilityTypeGetObject(0x13uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Text content for non-barcode pass is not supported", buf, 2u);
    }
    id v5 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [v3 frontFieldBuckets];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __56__PKCoreSpotlightUtilities_textContentAttributeForPass___block_invoke;
    uint64_t v12 = &unk_1E56E4468;
    id v13 = v3;
    id v14 = v6;
    id v4 = v6;
    [v7 enumerateObjectsUsingBlock:&v9];

    id v5 = [v4 componentsJoinedByString:@", ", v9, v10, v11, v12];
  }
  return v5;
}

void __56__PKCoreSpotlightUtilities_textContentAttributeForPass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 == 1 && [*(id *)(a1 + 32) style] == 4 && objc_msgSend(v5, "count") == 2)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v5 objectAtIndexedSubscript:1];
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v6 label];
    [v8 safelyAddObject:v9];

    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = [v6 value];
    [v10 safelyAddObject:v11];

    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = [v7 label];
    [v12 safelyAddObject:v13];

    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = [v7 value];
    [v14 safelyAddObject:v15];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v16 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v6);
          }
          uint64_t v20 = *(void **)(a1 + 40);
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v19), "value", (void)v22);
          [v20 safelyAddObject:v21];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
}

@end