@interface PGTextFeature
+ (id)_localizedNameForLocalizableNode:(id)a3;
+ (id)_stringToIndexFromTokens:(id)a3;
+ (id)_tokensFromString:(id)a3 lemmatize:(BOOL)a4;
+ (id)graphNamesForNode:(id)a3 locationHelper:(id)a4;
+ (id)mergedTextFeatureFromTextFeatures:(id)a3;
+ (id)stringForFeatureOrigin:(unint64_t)a3;
+ (id)stringForFeatureType:(unint64_t)a3;
+ (id)textFeaturesFromNode:(id)a3 type:(unint64_t)a4 weight:(double)a5 options:(unint64_t)a6 locationHelper:(id)a7;
+ (id)textFeaturesFromString:(id)a3 synonyms:(id)a4 type:(unint64_t)a5 weight:(double)a6 options:(unint64_t)a7;
+ (id)textFeaturesFromString:(id)a3 type:(unint64_t)a4 weight:(double)a5 options:(unint64_t)a6;
+ (id)vipTextFeatureTypes;
+ (unint64_t)_mostImportantTextFeatureTypeAmongTypes:(id)a3;
- (NSString)originalString;
- (NSString)string;
- (PGTextFeature)initWithString:(id)a3 originalString:(id)a4 type:(unint64_t)a5 weight:(double)a6 origin:(unint64_t)a7;
- (double)weight;
- (id)description;
- (unint64_t)origin;
- (unint64_t)type;
- (void)markAsStrippedOut;
@end

@implementation PGTextFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (unint64_t)origin
{
  return self->_origin;
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)originalString
{
  return self->_originalString;
}

- (NSString)string
{
  return self->_string;
}

- (void)markAsStrippedOut
{
  self->_origin = 5;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)PGTextFeature;
  v3 = [(PGTextFeature *)&v12 description];
  v4 = +[PGFeature stringForFeatureType:self->_type];
  v5 = [(PGTextFeature *)self string];
  v6 = [(PGTextFeature *)self originalString];
  [(PGTextFeature *)self weight];
  uint64_t v8 = v7;
  v9 = +[PGTextFeature stringForFeatureOrigin:[(PGTextFeature *)self origin]];
  v10 = [v3 stringByAppendingFormat:@": %@ -> %@ (original: %@, weight: %f, origin: %@)", v4, v5, v6, v8, v9];

  return v10;
}

- (PGTextFeature)initWithString:(id)a3 originalString:(id)a4 type:(unint64_t)a5 weight:(double)a6 origin:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGTextFeature;
  v15 = [(PGTextFeature *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_string, a3);
    objc_storeStrong((id *)&v16->_originalString, a4);
    v16->_type = a5;
    v16->_weight = a6;
    v16->_origin = a7;
  }

  return v16;
}

+ (unint64_t)_mostImportantTextFeatureTypeAmongTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 vipTextFeatureTypes];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v9, (void)v11))
        {
          unint64_t v6 = [v9 unsignedIntegerValue];
          goto LABEL_11;
        }
      }
      unint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)vipTextFeatureTypes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F28D0F90, &unk_1F28D0FA8, &unk_1F28D0FC0, &unk_1F28D0FD8, &unk_1F28D0FF0, 0);
}

+ (id)mergedTextFeatureFromTextFeatures:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 anyObject];
    if (v6 == 1)
    {
      uint64_t v8 = v7;
      v9 = (PGTextFeature *)v8;
    }
    else
    {
      id v38 = a1;
      v39 = v7;
      long long v11 = [v7 string];
      v42 = [MEMORY[0x1E4F1CA48] array];
      long long v12 = [MEMORY[0x1E4F28BD0] set];
      long long v13 = [MEMORY[0x1E4F28BD0] set];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v40 = v4;
      id v14 = v4;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v44;
        double v18 = 0.0;
        id obj = v14;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v44 != v17) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v21 = [v20 string];
            char v22 = [v21 isEqualToString:v11];

            if ((v22 & 1) == 0)
            {
              v27 = +[PGLogging sharedLogging];
              v28 = [v27 loggingConnection];

              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1D1805000, v28, OS_LOG_TYPE_ERROR, "Request to squash text features that don't have the same string", buf, 2u);
              }

              v9 = 0;
              uint64_t v8 = v39;
              id v4 = v40;
              v30 = obj;
              v29 = v42;
              goto LABEL_33;
            }
            v23 = [v20 originalString];
            [v42 addObject:v23];

            [v20 weight];
            if (v24 > v18) {
              double v18 = v24;
            }
            v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "type"));
            [v12 addObject:v25];

            v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "origin"));
            [v13 addObject:v26];
          }
          id v14 = obj;
          uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      else
      {
        double v18 = 0.0;
      }

      if ([v13 count] == 1)
      {
        v31 = [v13 anyObject];
        uint64_t v32 = [v31 integerValue];
      }
      else if ([v13 containsObject:&unk_1F28D0F78])
      {
        uint64_t v32 = 1;
      }
      else
      {
        uint64_t v32 = 6;
      }
      uint64_t v8 = v39;
      v29 = v42;
      if ([v12 count] == 1)
      {
        v33 = [v12 anyObject];
        uint64_t v34 = [v33 integerValue];
      }
      else
      {
        uint64_t v35 = [v38 _mostImportantTextFeatureTypeAmongTypes:v12];
        if (v35) {
          uint64_t v34 = v35;
        }
        else {
          uint64_t v34 = 22;
        }
      }
      v36 = [PGTextFeature alloc];
      v30 = [v42 componentsJoinedByString:@" / "];
      v9 = [(PGTextFeature *)v36 initWithString:v11 originalString:v30 type:v34 weight:v32 origin:v18];
      id v4 = v40;
LABEL_33:
    }
  }
  else
  {
    v10 = +[PGLogging sharedLogging];
    uint64_t v8 = [v10 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Request to merge text features with empty array", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)stringForFeatureType:(unint64_t)a3
{
  return +[PGFeature stringForFeatureType:a3];
}

+ (id)stringForFeatureOrigin:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E68E61F8[a3 - 1];
  }
}

+ (id)graphNamesForNode:(id)a3 locationHelper:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  v9 = [v6 label];
  int v10 = [v6 domain];
  if ([v6 domain] == 103)
  {
    long long v11 = [v6 label];
    int v12 = [v11 isEqualToString:@"ShortTrip"];

    if (v12)
    {
      if ([@"PGHighlightShortTripSearchableText" length])
      {
        [v8 addObject:@"PGHighlightShortTripSearchableText"];
      }
      else
      {
        v21 = +[PGLogging sharedLogging];
        char v22 = [v21 loggingConnection];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v32 = 138412290;
          id v33 = v6;
          _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "Error: nil or empty localizedName from node %@", (uint8_t *)&v32, 0xCu);
        }
      }
      v23 = [v6 graph];
      id v14 = [v23 anyNodeForLabel:@"LongTrip" domain:103 properties:0];

      if (v14)
      {
        if ([@"PGHighlightTripSearchableText" length])
        {
          [v8 addObject:@"PGHighlightTripSearchableText"];
          goto LABEL_49;
        }
        v29 = +[PGLogging sharedLogging];
        uint64_t v17 = [v29 loggingConnection];

        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
LABEL_48:

          goto LABEL_49;
        }
        int v32 = 138412290;
        id v33 = v14;
        v25 = "Error: nil or empty localizedName from node %@";
        v26 = v17;
        uint32_t v27 = 12;
      }
      else
      {
        double v24 = +[PGLogging sharedLogging];
        uint64_t v17 = [v24 loggingConnection];

        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        LOWORD(v32) = 0;
        v25 = "Highlight type node 'kPGGraphNodeHighlightTypeTrip' non found in graph";
        v26 = v17;
        uint32_t v27 = 2;
      }
      _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v32, v27);
      goto LABEL_48;
    }
  }
  if (![(id)objc_opt_class() conformsToProtocol:&unk_1F28E7380])
  {
    if (v10 == 300)
    {
      v20 = [v6 name];
      double v18 = [v20 lowercaseString];

      if (![v18 length]) {
        goto LABEL_42;
      }
    }
    else
    {
      if (v10 != 201)
      {
        if (v10 == 200 && [v9 isEqualToString:@"Country"])
        {
          uint64_t v15 = [v6 fullname];
          id v14 = v15;
          if (!v15 || ![v15 length])
          {
            v31 = +[PGLogging sharedLogging];
            uint64_t v17 = [v31 loggingConnection];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              int v32 = 138412290;
              id v33 = v6;
              _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Error: nil or empty fullname from node %@", (uint8_t *)&v32, 0xCu);
            }
            goto LABEL_48;
          }
          goto LABEL_15;
        }
        double v18 = [v6 name];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = [v18 stringValue];
        }
        else
        {
          id v19 = v18;
        }
        v28 = v19;
        if (!v19 || ![v19 length]) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
      double v18 = [v6 shortenedNameWithLocationHelper:v7];
      if (![v18 length])
      {
        v28 = [v6 name];
        if (![v28 length])
        {
LABEL_41:

          goto LABEL_42;
        }
LABEL_40:
        [v8 addObject:v28];
        goto LABEL_41;
      }
    }
    [v8 addObject:v18];
LABEL_42:

    goto LABEL_43;
  }
  long long v13 = [a1 _localizedNameForLocalizableNode:v6];
  id v14 = v13;
  if (!v13 || ![v13 length])
  {
    uint64_t v16 = +[PGLogging sharedLogging];
    uint64_t v17 = [v16 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138412290;
      id v33 = v6;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Error: nil or empty localizedName from node %@", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_48;
  }
LABEL_15:
  [v8 addObject:v14];
LABEL_49:

LABEL_43:
  return v8;
}

+ (id)_localizedNameForLocalizableNode:(id)a3
{
  return (id)[a3 localizedName];
}

+ (id)textFeaturesFromString:(id)a3 synonyms:(id)a4 type:(unint64_t)a5 weight:(double)a6 options:(unint64_t)a7
{
  char v7 = a7;
  v79[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  long long v13 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v14 = v7 & 8;
  id v15 = v11;
  uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
  if ((v7 & 0x4C) != 0)
  {
    uint64_t v17 = [a1 _tokensFromString:v15 lemmatize:v14 != 0];
  }
  else
  {
    v79[0] = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
  }
  double v18 = (void *)v17;
  v51 = [MEMORY[0x1E4F1CA60] dictionary];
  char v46 = v7;
  v47 = v18;
  if ((v7 & 0x40) != 0)
  {
    v52 = v16;
    v20 = v13;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v19 = v18;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v74 != v23) {
            objc_enumerationMutation(v19);
          }
          [v51 setObject:&unk_1F28D5628 forKeyedSubscript:*(void *)(*((void *)&v73 + 1) + 8 * i)];
        }
        uint64_t v22 = [v19 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }
      while (v22);
    }
    long long v13 = v20;
    uint64_t v16 = v52;
  }
  else
  {
    id v19 = [a1 _stringToIndexFromTokens:v18];
    if (v19) {
      [v51 setObject:&unk_1F28D5628 forKeyedSubscript:v19];
    }
  }

  unint64_t v45 = [v51 count];
  if (v45 < 2) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 4;
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke;
  v66[3] = &unk_1E68E61B0;
  double v70 = a6;
  id v49 = v15;
  id v67 = v49;
  unint64_t v71 = a5;
  uint64_t v72 = v25;
  id v48 = v13;
  id v68 = v48;
  id v53 = v16;
  id v69 = v53;
  [v51 enumerateKeysAndObjectsUsingBlock:v66];
  long long v65 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v62 = 0u;
  id v26 = v12;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v77 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v63;
    v30 = @"_";
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v63 != v29) {
          objc_enumerationMutation(v26);
        }
        int v32 = [a1 _tokensFromString:*(void *)(*((void *)&v62 + 1) + 8 * j) lemmatize:v14 != 0];
        if ((unint64_t)[v32 count] <= 2)
        {
          id v33 = [v32 componentsJoinedByString:v30];
          if (([v53 containsObject:v33] & 1) == 0)
          {
            unint64_t v34 = v14;
            id v35 = a1;
            id v36 = v26;
            v37 = v30;
            id v38 = [[PGTextFeature alloc] initWithString:v33 originalString:v49 type:a5 weight:2 origin:a6 * 0.75];
            [v48 addObject:v38];
            [v53 addObject:v33];

            v30 = v37;
            id v26 = v36;
            a1 = v35;
            unint64_t v14 = v34;
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v62 objects:v77 count:16];
    }
    while (v28);
  }

  if ((v46 & 0x10) != 0 && v45 <= 1)
  {
    v39 = [MEMORY[0x1E4F1CA20] currentLocale];
    LODWORD(v40) = 1063675494;
    v41 = [MEMORY[0x1E4F76D18] wordEmbeddingNeighborsWithDistanceForNgram:v49 locale:v39 limit:10 distance:v40];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke_2;
    v54[3] = &unk_1E68E61D8;
    id v58 = a1;
    char v61 = v14 >> 3;
    id v55 = v53;
    double v59 = a6;
    id v56 = v49;
    unint64_t v60 = a5;
    id v57 = v48;
    [v41 enumerateKeysAndObjectsUsingBlock:v54];
  }
  v42 = v69;
  id v43 = v48;

  return v43;
}

void __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(double *)(a1 + 56);
  id v6 = a2;
  [a3 doubleValue];
  uint64_t v8 = [[PGTextFeature alloc] initWithString:v6 originalString:*(void *)(a1 + 32) type:*(void *)(a1 + 64) weight:*(void *)(a1 + 72) origin:v5 * (1.0 - v7)];
  [*(id *)(a1 + 40) addObject:v8];
  [*(id *)(a1 + 48) addObject:v6];
}

void __69__PGTextFeature_textFeaturesFromString_synonyms_type_weight_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 56) _tokensFromString:v5 lemmatize:*(unsigned __int8 *)(a1 + 80)];
  unint64_t v8 = [v7 count];
  if (v8 > 2)
  {
    unint64_t v13 = v8;
    unint64_t v14 = +[PGLogging sharedLogging];
    id v15 = [v14 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Ignoring PGTextFeature embedding n gram %@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v16 = +[PGLogging sharedLogging];
    uint64_t v17 = [v16 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = [*(id *)(a1 + 56) stringForFeatureType:*(void *)(a1 + 72)];
      int v19 = 138413058;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      __int16 v23 = 2048;
      unint64_t v24 = v13;
      __int16 v25 = 2048;
      uint64_t v26 = 7;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Ignoring PGTextFeature %@ (%@) because it exceeds the maximum number of tokens %lu > %lu", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    v9 = [v7 componentsJoinedByString:@"_"];
    if (v9 && ([*(id *)(a1 + 32) containsObject:v9] & 1) == 0)
    {
      double v10 = *(double *)(a1 + 64);
      [v6 doubleValue];
      id v12 = [[PGTextFeature alloc] initWithString:v9 originalString:*(void *)(a1 + 40) type:*(void *)(a1 + 72) weight:3 origin:v10 * (1.0 - v11)];
      [*(id *)(a1 + 48) addObject:v12];
      [*(id *)(a1 + 32) addObject:v9];
    }
  }
}

+ (id)_tokensFromString:(id)a3 lemmatize:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v4 = [MEMORY[0x1E4F76D18] tokensFromString:a3 options:1];
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = objc_msgSend(MEMORY[0x1E4F8A9D0], "lemmasForToken:locale:options:", v11, 0, 4, (void)v17);
          if ([v12 count])
          {
            unint64_t v13 = [v12 firstObject];
          }
          else
          {
            unint64_t v14 = (void *)MEMORY[0x1E4F8A9D0];
            id v15 = [v11 lowercaseString];
            unint64_t v13 = [v14 stringWithoutDiacriticsFromString:v15];
          }
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F76D18] tokensFromString:a3 options:4];
  }
  return v5;
}

+ (id)textFeaturesFromString:(id)a3 type:(unint64_t)a4 weight:(double)a5 options:(unint64_t)a6
{
  double v10 = [a3 lowercaseString];
  double v11 = [a1 textFeaturesFromString:v10 synonyms:MEMORY[0x1E4F1CBF0] type:a4 weight:a6 options:a5];

  return v11;
}

+ (id)_stringToIndexFromTokens:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    uint64_t v5 = [v3 firstObject];
LABEL_5:
    uint64_t v7 = (void *)v5;
    goto LABEL_9;
  }
  unint64_t v6 = v4;
  if (v4 <= 7)
  {
    uint64_t v5 = [v3 componentsJoinedByString:@"_"];
    goto LABEL_5;
  }
  uint64_t v8 = +[PGLogging sharedLogging];
  uint64_t v9 = [v8 loggingConnection];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412802;
    id v12 = v3;
    __int16 v13 = 2048;
    unint64_t v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = 7;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Ignoring PGTextFeature %@ because it exceeds the maximum number of tokens %lu > %lu", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

+ (id)textFeaturesFromNode:(id)a3 type:(unint64_t)a4 weight:(double)a5 options:(unint64_t)a6 locationHelper:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  __int16 v13 = +[PGTextFeature graphNamesForNode:v12 locationHelper:a7];
  uint64_t v26 = v12;
  if ((a6 & 0x20) != 0)
  {
    if ([(id)objc_opt_class() conformsToProtocol:&unk_1F2909FB0])
    {
      unint64_t v14 = [v12 localizedSynonyms];
      goto LABEL_8;
    }
    __int16 v15 = +[PGLogging sharedLogging];
    uint64_t v16 = [v15 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = [v12 label];
      *(_DWORD *)buf = 138412546;
      id v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = [v12 domain];
      _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Node label %@ domain %lu doesn't comform to PGGraphSynonymSupport protocol -> cannot get synonyms", buf, 0x16u);
    }
  }
  unint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:
  uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = [a1 textFeaturesFromString:*(void *)(*((void *)&v27 + 1) + 8 * i) synonyms:v14 type:a4 weight:a6 options:a5];
        [v17 unionSet:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  return v17;
}

@end