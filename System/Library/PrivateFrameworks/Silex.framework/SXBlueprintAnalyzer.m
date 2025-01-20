@interface SXBlueprintAnalyzer
- (BOOL)componentPlacedAboveComponentBlueprint:(id)a3 blueprint:(id)a4;
- (id)markersFromBlueprint:(id)a3 components:(id)a4 DOMObjectProvider:(id)a5 cursor:(id)a6;
- (void)analyzeBlueprint:(id)a3 DOMObjectProvider:(id)a4 onMarkerFound:(id)a5 then:(id)a6 onEndReached:(id)a7;
- (void)iterateMarkers:(id)a3 onMarkerFound:(id)a4 then:(id)a5 onEndReached:(id)a6;
@end

@implementation SXBlueprintAnalyzer

- (void)analyzeBlueprint:(id)a3 DOMObjectProvider:(id)a4 onMarkerFound:(id)a5 then:(id)a6 onEndReached:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (v12 && a4 && a5 && a6 && a7)
  {
    id v13 = a7;
    id v14 = a6;
    id v15 = a5;
    id v16 = a4;
    v17 = objc_opt_new();
    v18 = [v16 components];
    v19 = [(SXBlueprintAnalyzer *)self markersFromBlueprint:v12 components:v18 DOMObjectProvider:v16 cursor:v17];

    v20 = (void *)SXInsertionLog;
    if (os_log_type_enabled((os_log_t)SXInsertionLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      int v22 = 134218240;
      uint64_t v23 = [v19 count];
      __int16 v24 = 2048;
      id v25 = v12;
      _os_log_impl(&dword_222AC5000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu marker(s) available for insertion, blueprint=%p", (uint8_t *)&v22, 0x16u);
    }
    [(SXBlueprintAnalyzer *)self iterateMarkers:v19 onMarkerFound:v15 then:v14 onEndReached:v13];
  }
}

- (void)iterateMarkers:(id)a3 onMarkerFound:(id)a4 then:(id)a5 onEndReached:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)[v10 mutableCopy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__SXBlueprintAnalyzer_iterateMarkers_onMarkerFound_then_onEndReached___block_invoke;
  v20[3] = &unk_264652578;
  id v21 = v10;
  id v22 = v14;
  uint64_t v23 = self;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v14;
  id v18 = v11;
  id v19 = v10;
  [v19 enumerateObjectsUsingBlock:v20];
}

void __70__SXBlueprintAnalyzer_iterateMarkers_onMarkerFound_then_onEndReached___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  [*(id *)(a1 + 32) count];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() == 1) {
    [*(id *)(a1 + 40) removeObject:v8];
  }
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  if (v6 == 2) {
    goto LABEL_6;
  }
  if (v6 == 1)
  {
    [*(id *)(a1 + 48) iterateMarkers:*(void *)(a1 + 40) onMarkerFound:*(void *)(a1 + 56) then:*(void *)(a1 + 64) onEndReached:*(void *)(a1 + 72)];
LABEL_6:
    *a4 = 1;
  }
  id v7 = [*(id *)(a1 + 32) lastObject];

  if (v7 == v8 && (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))() == 1)
  {
    [*(id *)(a1 + 48) iterateMarkers:*(void *)(a1 + 40) onMarkerFound:*(void *)(a1 + 56) then:*(void *)(a1 + 64) onEndReached:*(void *)(a1 + 72)];
    *a4 = 1;
  }
}

- (id)markersFromBlueprint:(id)a3 components:(id)a4 DOMObjectProvider:(id)a5 cursor:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v78 = a5;
  id v11 = (id *)a6;
  id v12 = [MEMORY[0x263EFF980] array];
  if ([v10 count])
  {
    unint64_t v13 = 0;
    v81 = v11;
    v82 = v12;
    id v76 = v10;
    id v77 = v9;
    while (1)
    {
      id v14 = [v10 componentAtIndex:v13];
      id v15 = [v14 identifier];
      v86 = [v9 componentBlueprintForComponentIdentifier:v15];

      unint64_t v16 = v13 + 1;
      unint64_t v83 = v16;
      if (v16 >= [v10 count])
      {
        uint64_t v19 = 0;
        id v17 = 0;
      }
      else
      {
        id v17 = [v10 componentAtIndex:v16];
        id v18 = [v17 identifier];
        uint64_t v19 = [v9 componentBlueprintForComponentIdentifier:v18];
      }
      v84 = (void *)v19;
      objc_opt_class();
      v85 = v17;
      if (objc_opt_isKindOfClass()) {
        break;
      }
LABEL_16:
      v37 = [v17 anchor];
      v38 = [v37 targetComponentIdentifier];
      v39 = [v14 identifier];
      if ([v38 isEqualToString:v39])
      {

        unint64_t v13 = v83;
      }
      else
      {
        v42 = [v14 anchor];
        v43 = [v42 targetComponentIdentifier];
        v44 = [v17 identifier];
        char v45 = [v43 isEqualToString:v44];

        id v11 = v81;
        unint64_t v46 = 0x26464E000;

        unint64_t v13 = v83;
        v41 = v84;
        v40 = v86;
        if (v45) {
          goto LABEL_25;
        }
        [v84 absoluteFrame];
        double MinY = CGRectGetMinY(v88);
        [v86 absoluteFrame];
        double MaxY = CGRectGetMaxY(v89);
        double v49 = MaxY;
        if (v85)
        {
          if (MinY < MaxY) {
            goto LABEL_25;
          }
        }
        if (v84)
        {
          [v84 absoluteFrame];
          double v50 = CGRectGetMinY(v90);
          if (v50 < -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v81)) {
            goto LABEL_25;
          }
        }
        if ([(SXBlueprintAnalyzer *)self componentPlacedAboveComponentBlueprint:v86 blueprint:v9])
        {
          goto LABEL_25;
        }
        v53 = v82;
        if ([v14 role] == 3)
        {
          v54 = [v86 infoFromLayouting];
          v55 = [v54 objectForKey:@"TextLayouter"];

          v80 = v55;
          v56 = [v55 paragraphRanges];
          unint64_t v57 = [v56 count];
          if (v57 >= 2)
          {
            unint64_t v58 = v57;
            for (uint64_t i = 1; i != v58; ++i)
            {
              v60 = [v56 objectAtIndex:i];
              uint64_t v61 = [v60 rangeValue];

              [v80 verticalLocationOfCharacterAtIndex:v61];
              double v63 = v62;
              [v86 absoluteFrame];
              double v64 = v63 + CGRectGetMinY(v92);
              v65 = [SXComponentAnchor alloc];
              v66 = [v14 identifier];
              v67 = [(SXComponentAnchor *)v65 initWithTargetComponentIdentifier:v66];

              -[SXComponentAnchor setRange:](v67, "setRange:", v61, 1);
              v68 = [SXBlueprintMarker alloc];
              v69 = -[SXBlueprintAnalyzerCursor path](v81);
              v70 = -[SXBlueprintMarker initWithLeadingComponent:trailingComponent:approximateLocation:path:](v68, "initWithLeadingComponent:trailingComponent:approximateLocation:path:", v14, v85, v69, 0.0, v64);

              [(SXBlueprintMarker *)v70 setComponentAnchor:v67];
              [v82 addObject:v70];
            }
          }

          id v11 = v81;
          v53 = v82;
          unint64_t v13 = v83;
          unint64_t v46 = 0x26464E000uLL;
        }
        id v71 = objc_alloc(*(Class *)(v46 + 3632));
        double v72 = -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v11);
        if (v72 >= v49) {
          double v49 = v72;
        }
        v73 = -[SXBlueprintAnalyzerCursor path](v11);
        v37 = objc_msgSend(v71, "initWithLeadingComponent:trailingComponent:approximateLocation:path:", v14, v85, v73, 0.0, v49);

        [v53 addObject:v37];
      }

      v40 = v86;
      v41 = v84;
LABEL_25:
      [v40 absoluteFrame];
      double v51 = CGRectGetMaxY(v91);
      double v52 = -[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v11);
      if (v51 >= v52) {
        double v52 = v51;
      }
      -[SXBlueprintAnalyzerCursor setHighestMaxY:]((uint64_t)v11, v52);

      id v12 = v82;
      if (v13 >= [v10 count]) {
        goto LABEL_37;
      }
    }
    id v20 = v14;
    id v21 = v86;
    id v22 = [v20 identifier];
    uint64_t v79 = [v10 componentsForContainerComponentWithIdentifier:v22];

    uint64_t v23 = [v9 layoutOptions];
    id v24 = [v23 columnLayout];
    uint64_t v25 = [v24 numberOfColumns];
    [v21 columnRange];
    uint64_t v27 = v26;

    v28 = [v20 contentDisplay];

    v29 = [v78 componentStyleForComponent:v20];
    v30 = [v29 fill];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = (void *)v79;
      v31 = v81;
    }
    else
    {
      v33 = [v29 fill];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      BOOL v35 = v25 == v27;
      v32 = (void *)v79;
      v31 = v81;
      if (!v35 || v28 || (isKindOfClass & 1) != 0) {
        goto LABEL_15;
      }
      -[SXBlueprintAnalyzerCursor addPathComponent:]((uint64_t)v81, (uint64_t)v20);
      v36 = [v21 layoutBlueprint];
      v30 = [(SXBlueprintAnalyzer *)self markersFromBlueprint:v36 components:v79 DOMObjectProvider:v78 cursor:v81];

      [v82 addObjectsFromArray:v30];
      -[SXBlueprintAnalyzerCursor removePathComponent:]((uint64_t)v81, (uint64_t)v20);
    }

LABEL_15:
    id v10 = v76;
    id v9 = v77;
    id v17 = v85;
    id v11 = v31;
    goto LABEL_16;
  }
LABEL_37:

  return v12;
}

- (BOOL)componentPlacedAboveComponentBlueprint:(id)a3 blueprint:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 componentIdentifiers];
  id v8 = [v5 component];
  id v9 = [v8 identifier];
  uint64_t v10 = [v7 indexOfObject:v9];

  id v11 = [v6 componentIdentifiers];
  unint64_t v12 = [v11 count];

  if (v10 + 1 >= v12)
  {
    BOOL v27 = 0;
  }
  else
  {
    unint64_t v13 = [v6 componentIdentifiers];
    id v14 = [v6 componentIdentifiers];
    id v15 = objc_msgSend(v13, "subarrayWithRange:", v10 + 1, objc_msgSend(v14, "count") - (v10 + 1));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = [v6 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v5 absoluteFrame];
          double MaxY = CGRectGetMaxY(v36);
          [v20 absoluteFrame];
          if (MaxY > CGRectGetMinY(v37))
          {

            BOOL v27 = 1;
            goto LABEL_15;
          }
          [v20 columnRange];
          uint64_t v23 = v22;
          id v24 = [v6 layoutOptions];
          uint64_t v25 = [v24 columnLayout];
          uint64_t v26 = [v25 numberOfColumns];

          if (v23 == v26) {
            goto LABEL_13;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        BOOL v27 = 0;
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_13:
      BOOL v27 = 0;
    }
LABEL_15:
  }
  return v27;
}

@end