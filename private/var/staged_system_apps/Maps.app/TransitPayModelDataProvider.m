@interface TransitPayModelDataProvider
- (BOOL)_allIdentifiersAreInteroperable:(id)a3;
- (BOOL)_userHasNonDCICardInCurrentMarket;
- (TransitPayModelDataProvider)initWithTransitPaymentMethods:(id)a3 suggestions:(id)a4 isTourist:(BOOL)a5 defaultPaymentCardsIdentifiers:(id)a6 defaultPaymentCardsExpressStatuses:(id)a7 userClosedLoopIdentifiers:(id)a8 availablePasses:(id)a9;
- (id)_filteredClosedLoopIdentifiers;
- (id)_modelDataForOpenLoop;
- (id)_modelDataForPaymentMethodIdentifiers:(id)a3 actionTitle:(id)a4;
- (id)_walletImage;
- (id)description;
- (id)modelData;
@end

@implementation TransitPayModelDataProvider

- (TransitPayModelDataProvider)initWithTransitPaymentMethods:(id)a3 suggestions:(id)a4 isTourist:(BOOL)a5 defaultPaymentCardsIdentifiers:(id)a6 defaultPaymentCardsExpressStatuses:(id)a7 userClosedLoopIdentifiers:(id)a8 availablePasses:(id)a9
{
  id v15 = a3;
  id v70 = a4;
  id v16 = a6;
  id v69 = a7;
  id v17 = a8;
  id v68 = a9;
  v85.receiver = self;
  v85.super_class = (Class)TransitPayModelDataProvider;
  v18 = v17;
  v19 = [(TransitPayModelDataProvider *)&v85 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_suggestions, a4);
    v20->_isTourist = a5;
    v21 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v15 count]];
    routeTNIs = v20->_routeTNIs;
    v20->_routeTNIs = v21;

    v23 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v16];
    defaultPaymentCardsIdentifiers = v20->_defaultPaymentCardsIdentifiers;
    v20->_defaultPaymentCardsIdentifiers = v23;

    objc_storeStrong((id *)&v20->_defaultPaymentCardsExpressStatuses, a7);
    v25 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v17];
    userClosedLoopIdentifiers = v20->_userClosedLoopIdentifiers;
    v20->_userClosedLoopIdentifiers = v25;

    objc_storeStrong((id *)&v20->_availablePasses, a9);
  }
  v27 = v15;
  if ([v15 count])
  {
    id v67 = v16;
    v28 = v70;
    if ([v70 count])
    {
      id v65 = v17;
      v66 = v15;
      v29 = objc_alloc_init((Class)NSMutableIndexSet);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v30 = v70;
      id v31 = [v30 countByEnumeratingWithState:&v81 objects:v88 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v82;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v82 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            v36 = [v35 paymentMethodIndices:v65];
            id v37 = [v36 countByEnumeratingWithState:&v77 objects:v87 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v78;
              do
              {
                for (j = 0; j != v38; j = (char *)j + 1)
                {
                  if (*(void *)v78 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  -[NSObject addIndex:](v29, "addIndex:", [*(id *)(*((void *)&v77 + 1) + 8 * (void)j) unsignedIntegerValue]);
                }
                id v38 = [v36 countByEnumeratingWithState:&v77 objects:v87 count:16];
              }
              while (v38);
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v81 objects:v88 count:16];
        }
        while (v32);
      }

      uint64_t v41 = [v66 objectsAtIndexes:v29];
      paymentMethods = v20->_paymentMethods;
      v20->_paymentMethods = (NSArray *)v41;

      id v43 = [v66 count];
      if (v43 != (id)[(NSArray *)v20->_paymentMethods count])
      {
        v44 = sub_100021338();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Trimmed some unused paymentMethods", buf, 2u);
        }
      }
      v45 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v20->_paymentMethods, "count")];
      paymentMethodToSuggestionMapping = v20->_paymentMethodToSuggestionMapping;
      v20->_paymentMethodToSuggestionMapping = v45;

      v47 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v20->_paymentMethods, "count")];
      identifierToPaymentMethodMapping = v20->_identifierToPaymentMethodMapping;
      v20->_identifierToPaymentMethodMapping = v47;

      v49 = v20->_paymentMethods;
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10082BE24;
      v75[3] = &unk_1012FA158;
      v50 = v20;
      v76 = v50;
      [(NSArray *)v49 enumerateObjectsUsingBlock:v75];
      id v51 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v30, "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v52 = v30;
      id v53 = [v52 countByEnumeratingWithState:&v71 objects:v86 count:16];
      v27 = v66;
      if (v53)
      {
        id v54 = v53;
        uint64_t v55 = *(void *)v72;
        do
        {
          for (k = 0; k != v54; k = (char *)k + 1)
          {
            if (*(void *)v72 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v71 + 1) + 8 * (void)k);
            if (objc_msgSend(v57, "purpose", v65) == 2)
            {
              v58 = [v57 paymentMethodIndices];
              [v51 addObjectsFromArray:v58];
            }
          }
          id v54 = [v52 countByEnumeratingWithState:&v71 objects:v86 count:16];
        }
        while (v54);
      }

      v50->_numberOfIOMethods = (unint64_t)[v51 count];
      v59 = sub_100021338();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v90 = (const char *)v50;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "TransitPayModelDataProvider has been setup. State:\n%@", buf, 0xCu);
      }

      v60 = v50;
      v28 = v70;
      v61 = v67;
      v18 = v65;
    }
    else
    {
      v63 = sub_100021338();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
        __int16 v91 = 1024;
        int v92 = 68;
        __int16 v93 = 2082;
        v94 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIdent"
              "ifiers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
        __int16 v95 = 2082;
        v96 = "suggestions.count == 0u";
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil", buf, 0x26u);
      }

      v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
        __int16 v91 = 1024;
        int v92 = 68;
        __int16 v93 = 2082;
        v94 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIdent"
              "ifiers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
        __int16 v95 = 2082;
        v96 = "suggestions.count == 0u";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil", buf, 0x26u);
      }
      v60 = 0;
      v61 = v16;
    }
  }
  else
  {
    v61 = v16;
    v62 = sub_100021338();
    v28 = v70;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      __int16 v91 = 1024;
      int v92 = 67;
      __int16 v93 = 2082;
      v94 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIdentif"
            "iers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
      __int16 v95 = 2082;
      v96 = "paymentMethods.count == 0u";
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil", buf, 0x26u);
    }

    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      __int16 v91 = 1024;
      int v92 = 67;
      __int16 v93 = 2082;
      v94 = "-[TransitPayModelDataProvider initWithTransitPaymentMethods:suggestions:isTourist:defaultPaymentCardsIdentif"
            "iers:defaultPaymentCardsExpressStatuses:userClosedLoopIdentifiers:availablePasses:]";
      __int16 v95 = 2082;
      v96 = "paymentMethods.count == 0u";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil", buf, 0x26u);
    }
    v60 = 0;
  }

  return v60;
}

- (id)_walletImage
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  v3 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.Passbook", 2);

  return v3;
}

- (id)_modelDataForPaymentMethodIdentifiers:(id)a3 actionTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v57 = sub_100021338();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "identifiers == nil";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. identifiers CANNOT be nil", buf, 0x26u);
    }

    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "identifiers == nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. identifiers CANNOT be nil", buf, 0x26u);
    }
    goto LABEL_39;
  }
  v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v86 objects:v93 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v87;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v87 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(NSMutableDictionary *)self->_identifierToPaymentMethodMapping objectForKeyedSubscript:*(void *)(*((void *)&v86 + 1) + 8 * i)];
        if (!v14)
        {
          uint64_t v55 = sub_100021338();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 186;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
            *(_WORD *)&buf[28] = 2082;
            *(void *)&buf[30] = "paymentMethod == nil";
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethod SHOULD NOT be nil", buf, 0x26u);
          }

          v56 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 186;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
            *(_WORD *)&buf[28] = 2082;
            *(void *)&buf[30] = "paymentMethod == nil";
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethod SHOULD NOT be nil", buf, 0x26u);
          }

          goto LABEL_39;
        }
        id v15 = (void *)v14;
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v86 objects:v93 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (![v8 count])
  {
    v58 = sub_100021338();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
    {
      v59 = [(TransitPayModelDataProvider *)self description];
      *(_DWORD *)buf = 136447234;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 190;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "paymentMethods.count == 0u";
      __int16 v91 = 2112;
      int v92 = v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethods cannot be nil. %@", buf, 0x30u);
    }
    v60 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      v61 = [(TransitPayModelDataProvider *)self description];
      *(_DWORD *)buf = 136447234;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 190;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "paymentMethods.count == 0u";
      __int16 v91 = 2112;
      int v92 = v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethods cannot be nil. %@", buf, 0x30u);
    }
LABEL_39:
    v62 = 0;
    goto LABEL_40;
  }
  id v16 = [v8 objectAtIndexedSubscript:0];
  id v17 = [(NSMutableDictionary *)self->_paymentMethodToSuggestionMapping objectForKeyedSubscript:v16];
  v18 = sub_100021338();
  v19 = v18;
  long long v84 = v17;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Suggesting: %@, %@", buf, 0x16u);
    }

    v20 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:self->_defaultPaymentCardsIdentifiers];
    [v20 addEntriesFromDictionary:self->_userClosedLoopIdentifiers];
    [v20 addEntriesFromDictionary:self->_availablePasses];
    v21 = [v16 identifier];
    v22 = [v20 objectForKey:v21];

    if (v22)
    {
      id v74 = v7;
      id v79 = v6;
      v23 = [v17 tipSubtitle];
      long long v83 = v16;
      v24 = [v16 identifier];
      long long v82 = v20;
      v25 = [v20 objectForKeyedSubscript:v24];
      id v26 = v23;
      char IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
      CFStringRef v94 = @"{CardName}";
      __int16 v95 = v25;
      v28 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
      buf[0] = 1;
      memset(&buf[1], 0, 17);
      buf[18] = IsRightToLeft;
      v29 = v17;
      *(void *)&buf[19] = 0;
      *(void *)&buf[24] = 0;
      uint64_t v80 = +[NSString _navigation_stringForServerFormattedString:v26 options:buf overrideVariables:v28];

      id v85 = objc_alloc_init((Class)NSMutableString);
      id v30 = [v17 educationalScreenPaymentBody];
      id v31 = [v30 count];

      if (v31)
      {
        unint64_t v32 = 0;
        do
        {
          uint64_t v33 = [v29 educationalScreenPaymentBody];
          v34 = [v33 objectAtIndexedSubscript:v32];

          v35 = [v16 identifier];
          v36 = [v82 objectForKeyedSubscript:v35];
          id v37 = v34;
          LOBYTE(v34) = MKApplicationLayoutDirectionIsRightToLeft();
          CFStringRef v94 = @"{CardName}";
          __int16 v95 = v36;
          id v38 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          buf[0] = 1;
          memset(&buf[1], 0, 17);
          buf[18] = (_BYTE)v34;
          *(void *)&buf[19] = 0;
          *(void *)&buf[24] = 0;
          uint64_t v39 = +[NSString _navigation_stringForServerFormattedString:v37 options:buf overrideVariables:v38];

          v40 = +[NSCharacterSet whitespaceCharacterSet];
          uint64_t v41 = [v39 stringByTrimmingCharactersInSet:v40];

          v42 = [v41 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_101324E70];

          v29 = v84;
          [v85 appendString:v42];
          id v43 = [v84 educationalScreenPaymentBody];
          v44 = (char *)[v43 count] - 1;

          if (v32 < (unint64_t)v44) {
            [v85 appendString:@"\n\n"];
          }

          ++v32;
          v45 = [v84 educationalScreenPaymentBody];
          id v46 = [v45 count];
        }
        while (v32 < (unint64_t)v46);
      }
      id v81 = [objc_alloc((Class)NSString) initWithString:v85];
      v75 = [TransitPayModelData alloc];
      v47 = [v29 tipTitle];
      v48 = [v47 formatStrings];
      v76 = [v48 firstObject];
      uint64_t v49 = [(TransitPayModelDataProvider *)self _walletImage];
      id v50 = v16;
      id v51 = v29;
      long long v77 = v48;
      long long v78 = v47;
      if ([v50 paymentMethodType] == 1)
      {
        id v52 = (void *)v49;
        if ([v51 type] == 1) {
          int v53 = 1;
        }
        else {
          int v53 = 2;
        }
        unsigned int v73 = v53;
        id v7 = v74;
        uint64_t v54 = v80;
      }
      else
      {
        id v7 = v74;
        uint64_t v54 = v80;
        id v52 = (void *)v49;
        if ([v50 paymentMethodType] == 2)
        {
          if ([v51 purpose] == 2) {
            int v65 = 4;
          }
          else {
            int v65 = 3;
          }
          unsigned int v73 = v65;
        }
        else
        {
          unsigned int v73 = 0;
        }
      }

      id v66 = [v8 copy];
      id v67 = [v51 educationalScreenTitle];
      id v68 = [v67 formatStrings];
      id v69 = [v68 firstObject];
      id v70 = [v51 educationalScreenAssets];
      LOBYTE(v72) = 0;
      v62 = [(TransitPayModelData *)v75 initWithTitle:v76 subtitle:v54 actionTitle:v7 image:v52 suggestionType:v73 paymentMethods:v66 educationScreenTitle:v69 educationScreenAssetURLs:v70 educationScreenText:v81 topUpPassUniqueID:0 isForRemoteDevice:v72];

      long long v71 = sub_100021338();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v62;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Returning Model: %@", buf, 0xCu);
      }

      id v6 = v79;
      v64 = v80;
      v20 = v82;
      id v16 = v83;
    }
    else
    {
      v64 = sub_100021338();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Unable to create a modelData object because combinedPasses[paymentMethod.identifier] is nil", buf, 2u);
      }
      v62 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 198;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "suggestion == nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethodSuggestion SHOULD NOT be nil", buf, 0x26u);
    }

    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 198;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[TransitPayModelDataProvider _modelDataForPaymentMethodIdentifiers:actionTitle:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "suggestion == nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. paymentMethodSuggestion SHOULD NOT be nil", buf, 0x26u);
    }
    v62 = 0;
  }

LABEL_40:

  return v62;
}

- (id)_modelDataForOpenLoop
{
  id v3 = objc_alloc((Class)NSMutableSet);
  v4 = [(NSMutableDictionary *)self->_defaultPaymentCardsIdentifiers allKeys];
  id v5 = [v3 initWithArray:v4];

  [v5 intersectSet:self->_routeTNIs];
  if ([v5 count])
  {
    identifierToPaymentMethodMapping = self->_identifierToPaymentMethodMapping;
    id v7 = [v5 anyObject];
    v8 = [(NSMutableDictionary *)identifierToPaymentMethodMapping objectForKeyedSubscript:v7];

    id v9 = [(NSMutableDictionary *)self->_paymentMethodToSuggestionMapping objectForKeyedSubscript:v8];
    if ([v9 type] == 1)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v10 = v5;
      id v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = -[NSDictionary objectForKeyedSubscript:](self->_defaultPaymentCardsExpressStatuses, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * i), (void)v26);
            unsigned int v16 = [v15 BOOLValue];

            if (v16)
            {
              v21 = sub_100021338();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Showing Open Loop Express Suggestion", buf, 2u);
              }

              v22 = [v10 allObjects];
              v23 = +[NSBundle mainBundle];
              v24 = [v23 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_SEE_HOW_IT_WORKS" value:@"localized string not found" table:0];

              id v17 = [(TransitPayModelDataProvider *)self _modelDataForPaymentMethodIdentifiers:v22 actionTitle:v24];

              goto LABEL_23;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v10 = sub_100021338();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "User had no express-enabled default cards", buf, 2u);
      }
      id v17 = 0;
    }
    else
    {
      v18 = sub_100021338();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Showing Open Loop Non-Express Suggestion", buf, 2u);
      }

      id v10 = [v5 allObjects];
      v19 = +[NSBundle mainBundle];
      v20 = [v19 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_SEE_HOW_IT_WORKS" value:@"localized string not found" table:0];

      id v17 = [(TransitPayModelDataProvider *)self _modelDataForPaymentMethodIdentifiers:v10 actionTitle:v20];
    }
LABEL_23:
  }
  else
  {
    v8 = sub_100021338();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Market does not support any of the user's default cards", buf, 2u);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)_filteredClosedLoopIdentifiers
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableDictionary count](self->_paymentMethodToSuggestionMapping, "count")];
  paymentMethodToSuggestionMapping = self->_paymentMethodToSuggestionMapping;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10082D1F0;
  v8[3] = &unk_1012FA180;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)paymentMethodToSuggestionMapping enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (BOOL)_userHasNonDCICardInCurrentMarket
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = self->_paymentMethods;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_userClosedLoopIdentifiers allKeys];
        id v10 = [v8 identifier];
        unsigned int v11 = [v9 containsObject:v10];

        if (v11)
        {
          id v12 = [(NSMutableDictionary *)self->_paymentMethodToSuggestionMapping objectForKeyedSubscript:v8];
          unsigned int v13 = [v12 type];

          if (v13 == 4)
          {
            id v15 = sub_100021338();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              unsigned int v16 = [v8 identifier];
              *(_DWORD *)buf = 138412290;
              v23 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "User owns card %@ which is non-DCI", buf, 0xCu);
            }
            BOOL v14 = 1;
            goto LABEL_14;
          }
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)_allIdentifiersAreInteroperable:(id)a3
{
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        paymentMethodToSuggestionMapping = self->_paymentMethodToSuggestionMapping;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10082D7B8;
        v14[3] = &unk_1012FA1A8;
        v14[4] = v8;
        v14[5] = &v19;
        [(NSMutableDictionary *)paymentMethodToSuggestionMapping enumerateKeysAndObjectsUsingBlock:v14];
      }
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  id v10 = sub_100021338();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (*((unsigned char *)v20 + 24)) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "areAllInteroperable? %@", buf, 0xCu);
  }

  BOOL v12 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)modelData
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_paymentMethods)
  {
    CFStringRef v11 = sub_100021338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      __int16 v59 = 1024;
      *(_DWORD *)v60 = 362;
      *(_WORD *)&v60[4] = 2082;
      *(void *)&v60[6] = "-[TransitPayModelDataProvider modelData]";
      __int16 v61 = 2082;
      v62 = "_paymentMethods == nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil", buf, 0x26u);
    }

    id v5 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446978;
    v58 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
    __int16 v59 = 1024;
    *(_DWORD *)v60 = 362;
    *(_WORD *)&v60[4] = 2082;
    *(void *)&v60[6] = "-[TransitPayModelDataProvider modelData]";
    __int16 v61 = 2082;
    v62 = "_paymentMethods == nil";
    BOOL v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method cannot be nil";
    goto LABEL_21;
  }
  if (!v2->_suggestions)
  {
    unsigned int v13 = sub_100021338();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
      __int16 v59 = 1024;
      *(_DWORD *)v60 = 363;
      *(_WORD *)&v60[4] = 2082;
      *(void *)&v60[6] = "-[TransitPayModelDataProvider modelData]";
      __int16 v61 = 2082;
      v62 = "_suggestions == nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil", buf, 0x26u);
    }

    id v5 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446978;
    v58 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPayModelDataProvider.m";
    __int16 v59 = 1024;
    *(_DWORD *)v60 = 363;
    *(_WORD *)&v60[4] = 2082;
    *(void *)&v60[6] = "-[TransitPayModelDataProvider modelData]";
    __int16 v61 = 2082;
    v62 = "_suggestions == nil";
    BOOL v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Payment Method Suggestions cannot be nil";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, v12, buf, 0x26u);
LABEL_22:
    BOOL v14 = 0;
    goto LABEL_89;
  }
  id v3 = objc_alloc((Class)NSMutableSet);
  id v4 = [(NSMutableDictionary *)v2->_defaultPaymentCardsIdentifiers allKeys];
  id v5 = [v3 initWithArray:v4];

  id v6 = objc_alloc((Class)NSMutableSet);
  id v7 = [(NSMutableDictionary *)v2->_userClosedLoopIdentifiers allKeys];
  id v8 = [v6 initWithArray:v7];

  if (!v2->_numberOfCLNonDCIMethods) {
    goto LABEL_112;
  }
  if (!v2->_numberOfOLMethods)
  {
    if ([(TransitPayModelDataProvider *)v2 _userHasNonDCICardInCurrentMarket])
    {
      id v9 = sub_100021338();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v10 = "No suggestion for a non-DCI card in a market without OL support";
        goto LABEL_84;
      }
LABEL_86:
      BOOL v14 = 0;
      goto LABEL_87;
    }
    if (!v2->_numberOfOLMethods) {
      goto LABEL_112;
    }
  }
  if (![(TransitPayModelDataProvider *)v2 _userHasNonDCICardInCurrentMarket])
  {
    long long v20 = sub_100021338();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Showing an open loop suggestion. The user does NOT have a DCI card in Wallet", buf, 2u);
    }
  }
  else
  {
LABEL_112:
    if (v2->_numberOfCLDCIMethods && v2->_numberOfOLMethods)
    {
      if (!v2->_isTourist)
      {
        if (([(NSMutableSet *)v2->_routeTNIs intersectsSet:v8] & 1) == 0)
        {
          id v9 = [(TransitPayModelDataProvider *)v2 _filteredClosedLoopIdentifiers];
          v47 = sub_100021338();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v58 = (const char *)v9;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "isTourist = NO. Showing Closed Loop Suggestions for: %@", buf, 0xCu);
          }

          if ([v9 count] == (id)1)
          {
            availablePasses = v2->_availablePasses;
            uint64_t v49 = [v9 objectAtIndexedSubscript:0];
            id v50 = [(NSDictionary *)availablePasses objectForKeyedSubscript:v49];
            +[NSBundle mainBundle];
            if (v50) {
              id v51 = {;
            }
              id v52 = [v51 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_SINGLE_CLOSED_LOOP_CARD_WITH_NAME" value:@"localized string not found" table:0];

              id v53 = [objc_alloc((Class)NSString) initWithFormat:v52, v50];
            }
            else {
              id v52 = {;
            }
              id v53 = [v52 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS" value:@"localized string not found" table:0];
            }
            uint64_t v55 = v53;
          }
          else
          {
            uint64_t v49 = +[NSBundle mainBundle];
            uint64_t v55 = [v49 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS" value:@"localized string not found" table:0];
          }

          BOOL v14 = [(TransitPayModelDataProvider *)v2 _modelDataForPaymentMethodIdentifiers:v9 actionTitle:v55];

          goto LABEL_87;
        }
        id v9 = sub_100021338();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_86;
        }
        *(_WORD *)buf = 0;
        id v10 = "No Suggestion. Route has a combination of OL and CL methods and the user is not a Tourist. Looks like the "
              "user already has a compatible CL card.";
        goto LABEL_84;
      }
      if (![v5 count]
        || ([v5 intersectsSet:v2->_routeTNIs] & 1) == 0)
      {
        id v9 = sub_100021338();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v10 = "Tourist. No Suggestion. No payment card in the wallet has an identifier that the route needs.";
LABEL_84:
          v25 = v9;
          uint32_t v26 = 2;
LABEL_85:
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v10, buf, v26);
          goto LABEL_86;
        }
        goto LABEL_86;
      }
    }
    else
    {
      if (v2->_numberOfIOMethods && [(NSMutableSet *)v2->_routeTNIs intersectsSet:v8])
      {
        long long v15 = sub_100021338();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Checking _numberOfIOMethods >= 1 && [_routeIdentifiers intersectsSet:userClosedLoopIdentifiers]", buf, 2u);
        }

        id v9 = [(NSMutableSet *)v2->_routeTNIs mutableCopy];
        [v9 intersectSet:v8];
        long long v16 = sub_100021338();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v58 = (const char *)v9;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Showing Interoperable Suggestion for: %@", buf, 0xCu);
        }

        if ([(TransitPayModelDataProvider *)v2 _allIdentifiersAreInteroperable:v9])
        {
          long long v17 = [v9 allObjects];
          long long v18 = +[NSBundle mainBundle];
          uint64_t v19 = [v18 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_SEE_HOW_IT_WORKS" value:@"localized string not found" table:0];

          BOOL v14 = [(TransitPayModelDataProvider *)v2 _modelDataForPaymentMethodIdentifiers:v17 actionTitle:v19];

LABEL_87:
          goto LABEL_88;
        }
        uint64_t v21 = sub_100021338();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Falling through. _allIdentifiersAreInteroperable check didn't pass.", buf, 2u);
        }
      }
      unint64_t numberOfCLDCIMethods = v2->_numberOfCLDCIMethods;
      if (numberOfCLDCIMethods >= 2)
      {
        if (([(NSMutableSet *)v2->_routeTNIs intersectsSet:v8] & 1) == 0)
        {
          long long v28 = sub_100021338();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Checking _numberOfCLMethods >= 1 && ![_routeIdentifiers intersectsSet:userClosedLoopIdentifiers]", buf, 2u);
          }

          id v9 = [(TransitPayModelDataProvider *)v2 _filteredClosedLoopIdentifiers];
          id v29 = [v9 count];
          id v30 = sub_100021338();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
          if (v29)
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412290;
              v58 = (const char *)v9;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Showing Closed Loop Suggestions from multiple options for: %@", buf, 0xCu);
            }

            if ([v9 count] == (id)1)
            {
              unint64_t v32 = v2->_availablePasses;
              uint64_t v33 = [v9 objectAtIndexedSubscript:0];
              id v34 = [(NSDictionary *)v32 objectForKeyedSubscript:v33];
              +[NSBundle mainBundle];
              if (v34) {
                v35 = {;
              }
                v36 = [v35 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_SINGLE_CLOSED_LOOP_CARD_WITH_NAME" value:@"localized string not found" table:0];

                id v37 = [objc_alloc((Class)NSString) initWithFormat:v36, v34];
              }
              else {
                v36 = {;
              }
                id v37 = [v36 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS" value:@"localized string not found" table:0];
              }
              id v30 = v37;
            }
            else
            {
              uint64_t v33 = +[NSBundle mainBundle];
              id v30 = [v33 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS" value:@"localized string not found" table:0];
            }

            BOOL v14 = [(TransitPayModelDataProvider *)v2 _modelDataForPaymentMethodIdentifiers:v9 actionTitle:v30];
          }
          else
          {
            if (v31)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "No Suggestion. Could not parse an identifier that has a valid paymentMethodSuggestion.", buf, 2u);
            }
            BOOL v14 = 0;
          }

          goto LABEL_87;
        }
        unint64_t numberOfCLDCIMethods = v2->_numberOfCLDCIMethods;
      }
      if (numberOfCLDCIMethods == 1)
      {
        v23 = sub_100021338();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Checking _numberOfCLMethods == 1", buf, 2u);
        }

        if (![(NSMutableSet *)v2->_routeTNIs intersectsSet:v8])
        {
          id v38 = [(TransitPayModelDataProvider *)v2 _filteredClosedLoopIdentifiers];
          id v9 = v38;
          if (v38 && [v38 count])
          {
            uint64_t v39 = sub_100021338();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              v40 = [v9 objectAtIndexedSubscript:0];
              *(_DWORD *)buf = 138412290;
              v58 = v40;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Showing Closed Loop Suggestion for: %@", buf, 0xCu);
            }
            uint64_t v41 = v2->_availablePasses;
            v42 = [v9 objectAtIndexedSubscript:0];
            id v43 = [(NSDictionary *)v41 objectForKeyedSubscript:v42];
            +[NSBundle mainBundle];
            if (v43) {
              v44 = {;
            }
              v45 = [v44 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_SINGLE_CLOSED_LOOP_CARD_WITH_NAME" value:@"localized string not found" table:0];

              id v46 = [objc_alloc((Class)NSString) initWithFormat:v45, v43];
            }
            else {
              v45 = {;
            }
              id v46 = [v45 localizedStringForKey:@"MAPS_TRANSIT_PAY_ACTION_BUTTON_MULTIPLE_CLOSED_LOOP_CARDS" value:@"localized string not found" table:0];
            }
            v56 = v46;

            BOOL v14 = [(TransitPayModelDataProvider *)v2 _modelDataForPaymentMethodIdentifiers:v9 actionTitle:v56];
          }
          else
          {
            v42 = sub_100021338();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "No Suggestion. Could not parse an identifier that has a valid paymentMethodSuggestion.", buf, 2u);
            }
            BOOL v14 = 0;
          }

          goto LABEL_87;
        }
        id v9 = sub_100021338();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_86;
        }
        routeTNIs = v2->_routeTNIs;
        *(_DWORD *)buf = 138412546;
        v58 = (const char *)routeTNIs;
        __int16 v59 = 2112;
        *(void *)v60 = v8;
        id v10 = "No Suggestion. User already has CL pass in their Wallet: Suggested: \n%@\nExisting passes:\n%@";
        v25 = v9;
        uint32_t v26 = 22;
        goto LABEL_85;
      }
      if (!v2->_numberOfOLMethods)
      {
        BOOL v14 = 0;
        goto LABEL_88;
      }
      long long v27 = sub_100021338();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Checking _numberOfOLMethods >= 1", buf, 2u);
      }

      if (([v5 intersectsSet:v2->_routeTNIs] & 1) == 0)
      {
        id v9 = sub_100021338();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v10 = "No Suggestion. The default payment card in Wallet does not has an identifier that the route needs.";
          goto LABEL_84;
        }
        goto LABEL_86;
      }
      if (![v5 count])
      {
        id v9 = sub_100021338();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v10 = "User does not have even a single payment card. Not showing any Suggestion";
          goto LABEL_84;
        }
        goto LABEL_86;
      }
    }
  }
  BOOL v14 = [(TransitPayModelDataProvider *)v2 _modelDataForOpenLoop];
LABEL_88:

LABEL_89:
  objc_sync_exit(v2);

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"TransitPayModelDataProvider:\n"];
  [v3 appendFormat:@"paymentMethods:                        %@\n", self->_paymentMethods];
  [v3 appendFormat:@"suggestions:                           %@\n", self->_suggestions];
  if (self->_isTourist) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  [v3 appendFormat:@"isTourist:                             %@\n", v4];
  [v3 appendFormat:@"routeIdentifiers:                      %@\n", self->_routeTNIs];
  [v3 appendFormat:@"defaultPaymentCardsIdentifiers:        %@\n", self->_defaultPaymentCardsIdentifiers];
  [v3 appendFormat:@"defaultPaymentCardsExpressStatuses:    %@\n", self->_defaultPaymentCardsExpressStatuses];
  [v3 appendFormat:@"userClosedLoopIdentifiers:             %@\n", self->_userClosedLoopIdentifiers];
  [v3 appendFormat:@"paymentMethod-->suggestion:            %@\n", self->_paymentMethodToSuggestionMapping];
  [v3 appendFormat:@"identifier-->paymentMethod:            %@\n", self->_identifierToPaymentMethodMapping];
  [v3 appendFormat:@"allAvailablePasses:                    %@\n", self->_availablePasses];
  [v3 appendFormat:@"numberOfOLMethods:                     %lu\n", self->_numberOfOLMethods];
  [v3 appendFormat:@"numberOfCLDCIMethods:                  %lu\n", self->_numberOfCLDCIMethods];
  [v3 appendFormat:@"numberOfCLNonDCIMethods:               %lu\n", self->_numberOfCLNonDCIMethods];
  [v3 appendFormat:@"numberOfIOMethods:                     %lu\n", self->_numberOfIOMethods];
  id v5 = [objc_alloc((Class)NSString) initWithString:v3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToPaymentMethodMapping, 0);
  objc_storeStrong((id *)&self->_paymentMethodToSuggestionMapping, 0);
  objc_storeStrong((id *)&self->_availablePasses, 0);
  objc_storeStrong((id *)&self->_userClosedLoopIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultPaymentCardsIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultPaymentCardsExpressStatuses, 0);
  objc_storeStrong((id *)&self->_routeTNIs, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);

  objc_storeStrong((id *)&self->_paymentMethods, 0);
}

@end