@interface PGDayHighlightTitleGenerator
- (PGDayHighlightTitleGenerator)initWithSummarizedFeatures:(id)a3 momentNodes:(id)a4 titleGenerationContext:(id)a5 loggingConnection:(id)a6;
- (PGTitleTuple)titleTuple;
- (id)dayHighlightMeaningLabels;
- (id)localizedTitleStringForSortedSummarizedFeatures:(id)a3;
- (id)localizedTitleStringFromBusinessFeature:(id)a3;
- (id)localizedTitleStringFromDistrictNode:(id)a3 districtName:(id)a4;
- (id)localizedTitleStringFromHolidayDateFeature:(id)a3;
- (id)localizedTitleStringFromLocationFeature:(id)a3;
- (id)localizedTitleStringFromMeaningFeature:(id)a3;
- (id)localizedTitleStringFromPublicEventFeature:(id)a3;
- (id)nameFromLocationFeature:(id)a3;
@end

@implementation PGDayHighlightTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTuple, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_summarizedFeatures, 0);
}

- (id)dayHighlightMeaningLabels
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Entertainment";
  v4[1] = @"Theater";
  v4[2] = @"Dance";
  v4[3] = @"AmusementPark";
  v4[4] = @"SportEvent";
  v4[5] = @"Performance";
  v4[6] = @"Concert";
  v4[7] = @"Festival";
  v4[8] = @"Museum";
  v4[9] = @"Birthday";
  v4[10] = @"HolidayEvent";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  return v2;
}

- (id)localizedTitleStringFromDistrictNode:(id)a3 districtName:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
  v9 = [v8 cityNodeFromDistrictNode:v6];

  if ([v9 count] == 1)
  {
    id v42 = v6;
    v10 = [v9 anyNode];
    v11 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
    uint64_t v12 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v10 locationHelper:v11];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
    v14 = objc_opt_new();
    v15 = objc_opt_new();
    v41 = (void *)v12;
    [v13 setString:v12];
    v16 = [v13 string];
    uint64_t v17 = [v16 length];

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke;
    v46[3] = &unk_1E68E5CD0;
    id v18 = v13;
    id v47 = v18;
    id v19 = v14;
    id v48 = v19;
    objc_msgSend(v18, "enumerateTokensInRange:usingBlock:", 0, v17, v46);
    [v18 setString:v7];
    v20 = [v18 string];
    uint64_t v21 = [v20 length];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke_2;
    v43[3] = &unk_1E68E5CD0;
    id v22 = v18;
    id v44 = v22;
    id v23 = v15;
    id v45 = v23;
    objc_msgSend(v22, "enumerateTokensInRange:usingBlock:", 0, v21, v43);
    unint64_t v24 = [v23 count];
    unint64_t v25 = [v19 count];
    unint64_t v26 = v24 - v25;
    if (v24 < v25)
    {
LABEL_6:
      v30 = NSString;
      v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:@"PGLocationTitleFormatOneDistrict %@ city %@" value:@"PGLocationTitleFormatOneDistrict %@ city %@" table:@"Localizable"];
      v33 = v41;
      v34 = objc_msgSend(v30, "localizedStringWithFormat:", v32, v7, v41);

      v49[0] = v7;
      v49[1] = v41;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      id v35 = +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:v34 andUsedNames:v29];
    }
    else
    {
      unint64_t v27 = v25;
      uint64_t v28 = 0;
      while (1)
      {
        v29 = objc_msgSend(v23, "subarrayWithRange:", v28, v27);
        if ([v29 isEqualToArray:v19]) {
          break;
        }

        if (++v28 > v26) {
          goto LABEL_6;
        }
      }
      loggingConnection = self->_loggingConnection;
      v33 = v41;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v41;
        __int16 v52 = 2112;
        id v53 = v7;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Only city name %@ used for highlight subtitle, not using district name %@", buf, 0x16u);
      }
      id v35 = v41;
    }
    id v6 = v42;
  }
  else
  {
    v36 = self->_loggingConnection;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v39 = v36;
      v40 = [v6 UUID];
      *(_DWORD *)buf = 138412546;
      v51 = v40;
      __int16 v52 = 2112;
      id v53 = v7;
      _os_log_error_impl(&dword_1D1805000, v39, OS_LOG_TYPE_ERROR, "cityNode from districtNode count is invalid for districtNode: %@ with name: %@", buf, 0x16u);
    }
    id v35 = 0;
  }

  return v35;
}

void __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) string];
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v7];
}

void __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) string];
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v7];
}

- (id)localizedTitleStringFromHolidayDateFeature:(id)a3
{
  id v4 = a3;
  v5 = [PGTitleGeneratorDateMatching alloc];
  id v6 = [(MAElementCollection *)self->_momentNodes set];
  titleGenerationContext = self->_titleGenerationContext;
  v8 = [v4 holidayName];

  v9 = [(PGTitleGeneratorDateMatching *)v5 initWithType:4 referenceDateInterval:0 momentNodes:v6 titleGenerationContext:titleGenerationContext holidayName:v8 isForHighlight:1];
  [(PGTitleGeneratorDateMatching *)v9 setLineBreakBehavior:2];
  v10 = [(PGTitleGeneratorDateMatching *)v9 title];
  v11 = [v10 stringValue];

  return v11;
}

- (id)localizedTitleStringFromLocationFeature:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGDayHighlightTitleGenerator *)self nameFromLocationFeature:v4];
  id v6 = [v4 locationNode];

  if (v5)
  {
    id v7 = [v6 label];
    int v8 = [v7 isEqualToString:@"District"];

    if (v8)
    {
      v9 = [(PGDayHighlightTitleGenerator *)self localizedTitleStringFromDistrictNode:v6 districtName:v5];
    }
    else
    {
      v11 = NSString;
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"PGDayHighlightTitleFormatOneLocation %@" value:@"PGDayHighlightTitleFormatOneLocation %@" table:@"Localizable"];
      v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v5);

      v9 = [v14 stringByReplacingOccurrencesOfString:@" " withString:@" "];
    }
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      v16 = loggingConnection;
      uint64_t v17 = [v6 name];
      *(_DWORD *)buf = 138412290;
      id v19 = v17;
      _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Nil beautified locationName for locationNode %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)localizedTitleStringFromPublicEventFeature:(id)a3
{
  id v4 = a3;
  v5 = [PGSpecBasedHighlightTitleGenerator alloc];
  id v6 = [(MAElementCollection *)self->_momentNodes set];
  id v7 = [v4 publicEventLabel];

  int v8 = [(PGSpecBasedHighlightTitleGenerator *)v5 initWithMomentNodes:v6 meaningLabel:v7 createVerboseTitle:0 titleGenerationContext:self->_titleGenerationContext];
  [(PGTitleGenerator *)v8 setLineBreakBehavior:2];
  v9 = [(PGTitleGenerator *)v8 title];
  v10 = [v9 stringValue];

  return v10;
}

- (id)localizedTitleStringFromBusinessFeature:(id)a3
{
  v3 = [a3 businessNode];
  id v4 = [v3 name];

  v5 = NSString;
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"PGDayHighlightTitleFormatOneBusinessLocation %@" value:@"PGDayHighlightTitleFormatOneBusinessLocation %@" table:@"Localizable"];
  int v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);

  v9 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  return v9;
}

- (id)localizedTitleStringFromMeaningFeature:(id)a3
{
  id v4 = a3;
  v5 = [PGSpecBasedHighlightTitleGenerator alloc];
  id v6 = [(MAElementCollection *)self->_momentNodes set];
  id v7 = [v4 meaningLabel];

  int v8 = [(PGSpecBasedHighlightTitleGenerator *)v5 initWithMomentNodes:v6 meaningLabel:v7 createVerboseTitle:0 titleGenerationContext:self->_titleGenerationContext];
  [(PGTitleGenerator *)v8 setLineBreakBehavior:2];
  v9 = [(PGTitleGenerator *)v8 title];
  v10 = [v9 stringValue];

  return v10;
}

- (id)nameFromLocationFeature:(id)a3
{
  id v4 = a3;
  int v5 = [v4 subtype];
  if ((v5 - 2) >= 4)
  {
    if (v5 == 1)
    {
      int v8 = [v4 locationName];
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    id v6 = [v4 locationNode];
    id v7 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
    int v8 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v6 locationHelper:v7];
  }
  return v8;
}

- (id)localizedTitleStringForSortedSummarizedFeatures:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        int v15 = [v14 type];
        v16 = v4;
        if (v15 == 1) {
          goto LABEL_11;
        }
        int v17 = [v14 type];
        v16 = v5;
        if (v17 != 3)
        {
          int v18 = [v14 type];
          v16 = v6;
          if (v18 != 2)
          {
            int v19 = [v14 type];
            v16 = v7;
            if (v19 != 4)
            {
              int v20 = [v14 type];
              v16 = v8;
              if (v20 != 5) {
                continue;
              }
            }
          }
        }
LABEL_11:
        [v16 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v21 = [(PGDayHighlightTitleGenerator *)self dayHighlightMeaningLabels];
  id v22 = [v5 firstObject];
  if ([v5 count] != 1
    || ([v22 meaningLabel],
        id v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v21 containsObject:v23],
        v23,
        !v24)
    || ([(PGDayHighlightTitleGenerator *)self localizedTitleStringFromMeaningFeature:v22], (unint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v8 count] != 1
      || ([v8 firstObject],
          unint64_t v26 = objc_claimAutoreleasedReturnValue(),
          [(PGDayHighlightTitleGenerator *)self localizedTitleStringFromHolidayDateFeature:v26], unint64_t v25 = objc_claimAutoreleasedReturnValue(), v26, !v25))
    {
      if ([v7 count] != 1
        || ([v7 firstObject],
            unint64_t v27 = objc_claimAutoreleasedReturnValue(),
            [(PGDayHighlightTitleGenerator *)self localizedTitleStringFromPublicEventFeature:v27], unint64_t v25 = objc_claimAutoreleasedReturnValue(), v27, !v25))
      {
        if ([v6 count] != 1
          || ([v6 firstObject],
              uint64_t v28 = objc_claimAutoreleasedReturnValue(),
              [(PGDayHighlightTitleGenerator *)self localizedTitleStringFromBusinessFeature:v28], unint64_t v25 = objc_claimAutoreleasedReturnValue(), v28, !v25))
        {
          if ([v4 count] == 1)
          {
            v29 = [v4 firstObject];
            unint64_t v25 = [(PGDayHighlightTitleGenerator *)self localizedTitleStringFromLocationFeature:v29];
          }
          else
          {
            unint64_t v25 = 0;
          }
        }
      }
    }
  }

  return v25;
}

- (PGTitleTuple)titleTuple
{
  titleTuple = self->_titleTuple;
  if (!titleTuple)
  {
    id v4 = [(PGDayHighlightTitleGenerator *)self localizedTitleStringForSortedSummarizedFeatures:self->_summarizedFeatures];
    if (v4)
    {
      id v5 = +[PGTitle titleWithString:v4 category:4];
      id v6 = +[PGTitle titleWithString:&stru_1F283BC78 category:0];
      id v7 = [[PGTitleTuple alloc] initWithWithTitle:v5 subtitle:v6];
      id v8 = self->_titleTuple;
      self->_titleTuple = v7;
    }
    titleTuple = self->_titleTuple;
  }
  return titleTuple;
}

- (PGDayHighlightTitleGenerator)initWithSummarizedFeatures:(id)a3 momentNodes:(id)a4 titleGenerationContext:(id)a5 loggingConnection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGDayHighlightTitleGenerator;
  int v15 = [(PGDayHighlightTitleGenerator *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_summarizedFeatures, a3);
    objc_storeStrong((id *)&v16->_momentNodes, a4);
    objc_storeStrong((id *)&v16->_loggingConnection, a6);
    objc_storeStrong((id *)&v16->_titleGenerationContext, a5);
  }

  return v16;
}

@end