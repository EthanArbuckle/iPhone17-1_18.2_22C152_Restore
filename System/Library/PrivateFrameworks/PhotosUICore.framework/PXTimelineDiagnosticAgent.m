@interface PXTimelineDiagnosticAgent
+ (id)errorMessage:(id)a3 jsonFormat:(BOOL)a4;
+ (id)jsonStringFromObject:(id)a3;
+ (id)timelineDiagnosticForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5;
+ (id)timelineDiagnosticForWidgetSize:(id)a3 jsonFormat:(BOOL)a4;
@end

@implementation PXTimelineDiagnosticAgent

+ (id)jsonStringFromObject:(id)a3
{
  id v9 = 0;
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:3 error:&v9];
  id v5 = v9;
  if (v4)
  {
    v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    v7 = [NSString stringWithFormat:@"[PXTimelineDiagnosticAgent] Error serializing json. Error: %@", v5];
    v6 = [a1 errorMessage:v7 jsonFormat:1];
  }
  return v6;
}

+ (id)errorMessage:(id)a3 jsonFormat:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    id v8 = v6;
  }
  else
  {
    v11 = @"Error";
    v12[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v8 = [a1 jsonStringFromObject:v9];
  }
  return v8;
}

+ (id)timelineDiagnosticForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5
{
  BOOL v5 = a5;
  v44[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  int v11 = [v8 isEqualToString:@"favorites"];
  v12 = (void *)MEMORY[0x1E4F38EE8];
  if (v11)
  {
    v13 = [v10 librarySpecificFetchOptions];
    v14 = [v12 fetchAssetCollectionsWithType:2 subtype:203 options:v13];
    v15 = [v14 firstObject];
  }
  else
  {
    v16 = [MEMORY[0x1E4F38EE8] localIdentifierWithUUID:v8];
    v17 = (void *)MEMORY[0x1E4F38EE8];
    v44[0] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    v19 = [v10 librarySpecificFetchOptions];
    [v17 fetchAssetCollectionsWithLocalIdentifiers:v18 options:v19];
    v21 = id v20 = a1;
    v15 = [v21 firstObject];

    a1 = v20;
  }
  v22 = [v15 localIdentifier];
  if (v22)
  {
    uint64_t v23 = *MEMORY[0x1E4F1DB30];
    double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v25 = +[PXWidgetTimeline timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:](PXWidgetTimeline, "timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:", v10, v22, 0, *MEMORY[0x1E4F1DB30], v24);
    if ([v25 count])
    {
      id v36 = a1;
      id v37 = v9;
      v26 = [NSString stringWithFormat:@"%lu Timeline Entries Generated widget size %@ {%.2f, %.2f}", objc_msgSend(v25, "count"), v9, v23, *(void *)&v24];
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@\n", v26];
      id v28 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v42 = @"Summary";
      v43 = v26;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v30 = (void *)[v28 initWithDictionary:v29];

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __78__PXTimelineDiagnosticAgent_timelineDiagnosticForAlbum_widgetSize_jsonFormat___block_invoke;
      v38[3] = &unk_1E5DB4DE0;
      BOOL v41 = v5;
      id v31 = v30;
      id v39 = v31;
      id v32 = v27;
      id v40 = v32;
      [v25 enumerateObjectsUsingBlock:v38];
      if (v5)
      {
        id v33 = [v36 jsonStringFromObject:v31];
      }
      else
      {
        id v33 = v32;
      }
      v34 = v33;

      id v9 = v37;
    }
    else
    {
      v34 = [a1 errorMessage:@"No timeline entries generated." jsonFormat:v5];
    }
  }
  else
  {
    v34 = [a1 errorMessage:@"No album found." jsonFormat:v5];
  }

  return v34;
}

void __78__PXTimelineDiagnosticAgent_timelineDiagnosticForAlbum_widgetSize_jsonFormat___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"TimelineEntry[%lu]", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = [v6 dictionaryRepresentation];

    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
    id v6 = (id)v7;
  }
  else
  {
    [*(id *)(a1 + 40) appendFormat:@"%@ %@\n", v8, v6];
  }
}

+ (id)timelineDiagnosticForWidgetSize:(id)a3 jsonFormat:(BOOL)a4
{
  BOOL v4 = a4;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    if ([v6 isEqualToString:@"small"])
    {
      +[PXTimelineSize widgetSizeForSizeClass:0];
      double v8 = v7;
      double v10 = v9;
      uint64_t v11 = 0;
    }
    else
    {
      if ([v6 isEqualToString:@"medium"])
      {
        uint64_t v11 = 1;
        uint64_t v12 = 1;
      }
      else if ([v6 isEqualToString:@"large"])
      {
        uint64_t v11 = 2;
        uint64_t v12 = 2;
      }
      else
      {
        if (![v6 isEqualToString:@"extraLarge"])
        {
          v15 = [NSString stringWithFormat:@"Unsupported widget size: %@. Only support small, medium, large or extraLarge", v6];
          v25 = [a1 errorMessage:v15 jsonFormat:v4];
          goto LABEL_19;
        }
        uint64_t v11 = 3;
        uint64_t v12 = 3;
      }
      +[PXTimelineSize widgetSizeForSizeClass:v12];
      double v8 = v13;
      double v10 = v14;
    }
  }
  else
  {
    uint64_t v11 = 0;
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v15 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v16 = +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v15, v11, v8, v10);
  if ([v16 count])
  {
    v17 = [NSString stringWithFormat:@"%lu Timeline Entries Generated widget size %@ {%.2f, %.2f}", objc_msgSend(v16, "count"), v6, *(void *)&v8, *(void *)&v10];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@\n", v17];
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v31 = @"Summary";
    v32[0] = v17;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v21 = (void *)[v19 initWithDictionary:v20];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__PXTimelineDiagnosticAgent_timelineDiagnosticForWidgetSize_jsonFormat___block_invoke;
    v27[3] = &unk_1E5DB4DE0;
    BOOL v30 = v4;
    id v22 = v21;
    id v28 = v22;
    id v23 = v18;
    id v29 = v23;
    [v16 enumerateObjectsUsingBlock:v27];
    if (v4)
    {
      id v24 = [a1 jsonStringFromObject:v22];
    }
    else
    {
      id v24 = v23;
    }
    v25 = v24;
  }
  else
  {
    v25 = [a1 errorMessage:@"No timeline entries generated." jsonFormat:v4];
  }

LABEL_19:
  return v25;
}

void __72__PXTimelineDiagnosticAgent_timelineDiagnosticForWidgetSize_jsonFormat___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"TimelineEntry[%lu]", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = [v6 dictionaryRepresentation];

    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
    id v6 = (id)v7;
  }
  else
  {
    [*(id *)(a1 + 40) appendFormat:@"%@ %@\n", v8, v6];
  }
}

@end