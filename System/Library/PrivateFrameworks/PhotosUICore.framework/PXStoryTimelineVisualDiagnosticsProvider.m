@interface PXStoryTimelineVisualDiagnosticsProvider
- (PXStoryAutoEditMomentsProvider)momentsProvider;
- (PXStoryConfiguration)configuration;
- (PXStoryModel)model;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (PXStoryTimeline)timeline;
- (PXStoryTimelineVisualDiagnosticsProvider)init;
- (PXStoryTimelineVisualDiagnosticsProvider)initWithModel:(id)a3 screenScale:(double)a4;
- (PXStoryVisualDiagnosticsProviderHelper)helper;
- (double)screenScale;
- (id)_autoEditDebugInfoBySegmentInTimeline:(id)a3;
- (id)_descriptionForDurationInfo:(id *)a3;
- (id)_descriptionForFaces:(id)a3 context:(id)a4;
- (id)_descriptionForMovementType:(int64_t)a3;
- (id)_displayStringForPrivateString:(id)a3 context:(id)a4;
- (id)_moduleDescriptionsBySegmentInTimeline:(id)a3;
- (id)_moduleStartSegmentIndexesInTimeline:(id)a3;
- (id)_momentEndSegmentIndexesInTimeline:(id)a3;
- (id)_movementDescriptionForSegmentAtIndex:(int64_t)a3 inTimeline:(id)a4;
- (id)_segmentIndexesWithInvalidOrderOutTransitionInTimeline:(id)a3;
- (id)_tvPreviewRankByAssetUUIDForMemory:(id)a3;
- (unint64_t)_approxLinesInString:(id)a3 lineLength:(unint64_t)a4;
- (void)_addAssetsDetailsTable:(id)a3;
- (void)_addCinematicDiagnostics:(id)a3;
- (void)_addCoverPage:(id)a3;
- (void)_addCropDiagnostics:(id)a3;
- (void)_addDetailedSaliencyDiagnostics:(id)a3;
- (void)_addMiscellaneousDiagnostics:(id)a3;
- (void)_addSegmentDiagnostics:(id)a3;
- (void)_addSegmentsAutoEditDebugInfoTables:(id)a3 debugInfoKeys:(id)a4;
- (void)_addSegmentsDetailsTable:(id)a3;
- (void)_drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5;
- (void)_drawSegmentAtIndex:(int64_t)a3 timeline:(id)a4 inRect:(CGRect)a5 options:(unint64_t)a6 context:(id)a7;
- (void)_drawVerticalInRect:(CGRect)a3 backgroundColor:(id)a4 context:(id)a5 configuration:(id)a6;
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
@end

@implementation PXStoryTimelineVisualDiagnosticsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_momentsProvider, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (PXStoryAutoEditMomentsProvider)momentsProvider
{
  return self->_momentsProvider;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryVisualDiagnosticsProviderHelper)helper
{
  return self->_helper;
}

- (id)_tvPreviewRankByAssetUUIDForMemory:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "rankedPreviewAssetsForLength:targetSize:", 4, 1920.0, 1080.0);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__tvPreviewRankByAssetUUIDForMemory___block_invoke;
  v9[3] = &unk_1E5DC4908;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __79__PXStoryTimelineVisualDiagnosticsProvider__tvPreviewRankByAssetUUIDForMemory___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v9 = [v5 numberWithUnsignedInteger:a3];
  id v7 = *(void **)(a1 + 32);
  v8 = [v6 uuid];

  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (void)_drawVerticalInRect:(CGRect)a3 backgroundColor:(id)a4 context:(id)a5 configuration:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  CGContextSaveGState((CGContextRef)[v9 CGContext]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  PXRectGetCenter();
}

- (void)_drawAsset:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(PXStoryTimelineVisualDiagnosticsProvider *)self helper];
  objc_msgSend(v13, "drawAsset:inRect:context:", v12, v11, x, y, width, height);
}

- (id)_displayStringForPrivateString:(id)a3 context:(id)a4
{
  id v5 = a3;
  if ([a4 isPrivateDataAllowed])
  {
    id v6 = v5;
  }
  else
  {
    objc_msgSend(&stru_1F00B0030, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v5, "length"), @"*", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  return v7;
}

- (void)_drawSegmentAtIndex:(int64_t)a3 timeline:(id)a4 inRect:(CGRect)a5 options:(unint64_t)a6 context:(id)a7
{
  char v8 = a6;
  CGFloat width = a5.size.width;
  CGFloat height = a5.size.height;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = a7;
  uint64_t v12 = [v10 identifierForSegmentAtIndex:a3];
  if (v10) {
    [v10 timeRangeForSegmentWithIdentifier:v12];
  }
  id v13 = (CGContext *)objc_msgSend(v11, "CGContext", *(void *)&y, *(void *)&width, *(void *)&height);
  CGContextSaveGState(v13);
  if ((v8 & 2) != 0) {
    double v14 = 6.0;
  }
  else {
    double v14 = 0.0;
  }
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = v18;
  v24.size.CGFloat width = v20;
  v24.size.CGFloat height = v22;
  v15 = CGPathCreateWithRoundedRect(v24, v14, v14, 0);
  CGContextAddPath(v13, v15);
  id v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
  CGContextSetFillColorWithColor(v13, (CGColorRef)[v16 CGColor]);

  CGContextFillPath(v13);
  CGPathRelease(v15);
  CGContextClip(v13);
  [v10 size];
  PXRectWithOriginAndSize();
}

void __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    uint64_t v22 = a1 + 72;
    uint64_t v7 = a1 + 64;
    uint64_t v8 = a4 + 16;
    id v9 = (uint64_t *)(a5 + 8);
    while (1)
    {
      id v10 = (void *)MEMORY[0x1AD10CB00]();
      uint64_t v11 = *v9;
      uint64_t v12 = [*(id *)(a1 + 32) clipWithIdentifier:*(v9 - 1)];
      if (!v12)
      {
        CGFloat v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 40), @"PXStoryTimelineVisualDiagnosticsProvider.m", 1215, @"Invalid parameter not satisfying: %@", @"clip != nil" object file lineNumber description];
      }
      if (v11 != 3)
      {
        if (v11 == 1)
        {
          id v13 = [v12 resource];
          uint64_t v14 = objc_msgSend(v13, "px_storyResourceDisplayAsset");

          if (!v14)
          {
            v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 40), @"PXStoryTimelineVisualDiagnosticsProvider.m", 1222, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
          }
          PXRectNormalize();
        }
        goto LABEL_15;
      }
      v15 = [v12 resource];
      id v16 = objc_msgSend(v15, "px_storyResourceTextResourceInfo");
      v17 = [v16 string];

      uint64_t v18 = objc_msgSend(v15, "px_storyResourceTextType");
      uint64_t v19 = v7;
      if (!v18) {
        goto LABEL_13;
      }
      if (v18 == 1) {
        break;
      }
LABEL_14:

LABEL_15:
      v9 += 96;

      v8 += 32;
      if (!--v5) {
        return;
      }
    }
    uint64_t v19 = v22;
LABEL_13:
    objc_storeStrong((id *)(*(void *)(*(void *)v19 + 8) + 40), v17);
    goto LABEL_14;
  }
}

void __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_3(void *a1, void *a2)
{
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_4;
  id v16 = &unk_1E5DB5F38;
  id v4 = (void *)a1[5];
  uint64_t v17 = a1[4];
  id v18 = v4;
  id v5 = a2;
  id v6 = (void (**)(void *, void))_Block_copy(&aBlock);
  id v7 = [NSString alloc];
  uint64_t v8 = v6[2](v6, *(void *)(*(void *)(a1[6] + 8) + 40));
  id v9 = v6[2](v6, *(void *)(*(void *)(a1[7] + 8) + 40));
  id v10 = (void *)[v7 initWithFormat:@"%@\n%@", v8, v9, aBlock, v14, v15, v16, v17];
  [v5 setText:v10];

  uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
  [v5 setTextColor:v11];

  uint64_t v12 = [MEMORY[0x1E4FB1618] orangeColor];
  [v5 setBackgroundColor:v12];

  [v5 setFontSize:8.0];
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.0);
}

uint64_t __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_4(uint64_t a1, __CFString *a2)
{
  if (a2) {
    v2 = a2;
  }
  else {
    v2 = &stru_1F00B0030;
  }
  return [*(id *)(a1 + 32) _displayStringForPrivateString:v2 context:*(void *)(a1 + 40)];
}

void __96__PXStoryTimelineVisualDiagnosticsProvider__drawSegmentAtIndex_timeline_inRect_options_context___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = NSString;
  id v4 = *(void **)(a1 + 32);
  id v11 = a2;
  id v5 = [v4 uuid];
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) localCreationDate];
  uint64_t v8 = [v6 stringFromDate:v7];
  id v9 = [v3 stringWithFormat:@"%@\n%@", v5, v8];
  [v11 setText:v9];

  id v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [v11 setTextColor:v10];

  [v11 setFontSize:4.0];
  objc_msgSend(v11, "setRelativePosition:", 0.0, 1.0);
}

- (id)_descriptionForFaces:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v5 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      id v9 = [v5 objectAtIndexedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
LABEL_15:

      if (++v8 >= (unint64_t)[v5 count]) {
        goto LABEL_19;
      }
    }
    id v10 = (void *)MEMORY[0x1E4F391F0];
    id v11 = [v9 photoLibrary];
    uint64_t v12 = [v11 librarySpecificFetchOptions];
    id v13 = [v10 fetchPersonWithFace:v9 options:v12];
    uint64_t v14 = [v13 firstObject];

    if (v14)
    {
      if (![v6 isPrivateDataAllowed]
        || ([v14 name], (v15 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0)
        && ([v14 displayName], (v15 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v15 = [v14 localIdentifier];
        if (!v8) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (![(__CFString *)v15 length])
      {

        v15 = @"<unnamed>";
        if (!v8) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else
    {
      v15 = @"?";
    }
    if (!v8)
    {
LABEL_14:
      [v7 appendFormat:@"%li: %@", v8, v15];

      goto LABEL_15;
    }
LABEL_13:
    [v7 appendString:@", "];
    goto LABEL_14;
  }
LABEL_19:
  id v16 = (void *)[v7 copy];

  return v16;
}

- (void)_addMiscellaneousDiagnostics:(id)a3
{
  id v4 = a3;
  [v4 addTitlePageWithTitle:@"Timeline" subtitle:@"Miscellaneous"];
  [v4 beginPage];
  [v4 currentPageBounds];
  CGRect v17 = CGRectInset(v16, 20.0, 20.0);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __73__PXStoryTimelineVisualDiagnosticsProvider__addMiscellaneousDiagnostics___block_invoke;
  id v13 = &unk_1E5DB5EE8;
  uint64_t v14 = self;
  id v15 = v4;
  id v9 = v4;
  objc_msgSend(v9, "drawTextInRect:configuration:", &v10, x, y, width, height);
  objc_msgSend(v9, "endPage", v10, v11, v12, v13, v14);
}

void __73__PXStoryTimelineVisualDiagnosticsProvider__addMiscellaneousDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [*(id *)(a1 + 32) configuration];
  id v5 = [v4 assetCollection];

  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    [v3 appendFormat:@"%@\n", v7];

    uint64_t v8 = [v5 uuid];
    [v3 appendFormat:@"\tUUID: %@\n", v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v5;
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39160], "stringForCategory:", objc_msgSend(v9, "category"));
      [v3 appendFormat:@"\tCategory: %@", v10];

      uint64_t v11 = [v9 subcategory];
      if (v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F39160] stringForSubcategory:v11];
        [v3 appendFormat:@" (%@)", v12];
      }
      [v3 appendString:@"\n"];
      id v13 = [v9 featuredPersonLocalIdentifiers];
      objc_msgSend(v3, "appendFormat:", @"\tFeatured: %li\n", objc_msgSend(v13, "count"));
      v38 = v9;
      uint64_t v14 = [v9 photoLibrary];
      id v15 = [v14 librarySpecificFetchOptions];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v16 = v13;
      uint64_t v40 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v40)
      {
        uint64_t v17 = *(void *)v42;
        uint64_t v39 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v16);
            }
            uint64_t v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            CGFloat v20 = (void *)MEMORY[0x1E4F391F0];
            v45 = v19;
            v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
            uint64_t v22 = [v20 fetchPersonsWithLocalIdentifiers:v21 options:v15];
            v23 = [v22 firstObject];

            if ([*(id *)(a1 + 40) isPrivateDataAllowed])
            {
              id v24 = [NSString alloc];
              uint64_t v25 = [v23 name];
              v26 = (void *)v25;
              if (v25)
              {
                id v27 = (id)[v24 initWithFormat:@"%@ (%@)", v25, v19];
              }
              else
              {
                [v23 displayName];
                id v28 = v16;
                v29 = v15;
                uint64_t v30 = a1;
                v32 = id v31 = v3;
                id v27 = (id)[v24 initWithFormat:@"%@ (%@)", v32, v19];

                id v3 = v31;
                a1 = v30;
                id v15 = v29;
                id v16 = v28;
                uint64_t v17 = v39;
              }
            }
            else
            {
              id v27 = v19;
            }
            [v3 appendFormat:@"\t\t%@\n", v27];
          }
          uint64_t v40 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v40);
      }
    }
  }
  v33 = [MEMORY[0x1E4F28B50] mainBundle];
  v34 = [v33 infoDictionary];
  v35 = [v33 bundleIdentifier];
  v36 = [v34 objectForKeyedSubscript:@"CFBundleShortVersionString"];
  v37 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
  [v3 appendFormat:@"Main Bundle: %@ %@ (%@)\n", v35, v36, v37];

  [*(id *)(a1 + 32) model];
  [(id)objc_claimAutoreleasedReturnValue() timelineSpec];
  [(id)objc_claimAutoreleasedReturnValue() layoutDirection];
  PXUserInterfaceLayoutDirectionDescription();
}

- (void)_addDetailedSaliencyDiagnostics:(id)a3
{
  id v4 = a3;
  [v4 addTitlePageWithTitle:@"Assets" subtitle:@"Detailed Saliency"];
  uint64_t v12 = v4;
  [v4 CGContext];
  id v5 = [(PXStoryTimelineVisualDiagnosticsProvider *)self resourcesDataSource];
  id v6 = [v5 detailedSaliency];
  char v13 = objc_opt_respondsToSelector();
  if ([v5 numberOfDisplayAssetResources] >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v5 displayAssetResourceAtIndex:v7];
      id v9 = objc_msgSend(v8, "px_storyResourceDisplayAsset");

      uint64_t v10 = [v6 saliencyAreasForDisplayAsset:v9];
      if (v13)
      {
        uint64_t v11 = [v6 rawSaliencyAreasForDisplayAsset:v9];
      }
      else
      {
        uint64_t v11 = 0;
      }
      if ([v10 count] || objc_msgSend(v11, "count"))
      {
        [v12 beginPage];
        memset(&slice, 0, sizeof(slice));
        [v12 currentPageBounds];
        CGRect slice = CGRectInset(v17, 10.0, 10.0);
        memset(&remainder, 0, sizeof(remainder));
        memset(&v14, 0, sizeof(v14));
        CGRectDivide(slice, &slice, &remainder, 40.0, CGRectMaxYEdge);
        CGRectDivide(slice, &v14, &slice, 30.0, CGRectMaxYEdge);
        [v9 aspectRatio];
        PXRectWithAspectRatioFittingRect();
      }

      ++v7;
    }
    while (v7 < [v5 numberOfDisplayAssetResources]);
  }
}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6, void *a7)
{
  id v12 = a6;
  id v13 = a7;
  v14.origin.double x = a1;
  v14.origin.double y = a2;
  v14.size.double width = a3;
  v14.size.double height = a4;
  if (!CGRectIsEmpty(v14)) {
    PXRectFlippedVertically();
  }
}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  id obj = a2;
  if ([obj countByEnumeratingWithState:v3 objects:v4 count:16])
  {
    [**((id **)&v3[0] + 1) confidence];
    PXFloatDenormalize();
  }
}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

void __76__PXStoryTimelineVisualDiagnosticsProvider__addDetailedSaliencyDiagnostics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setText:v3];
  [v4 setFontSize:7.0];
  [v4 setTextColor:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setRelativePosition:", 0.0, *(double *)(a1 + 48));
}

- (void)_addCropDiagnostics:(id)a3
{
  [a3 addTitlePageWithTitle:@"Timeline" subtitle:@"Crops"];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self helper];
  objc_claimAutoreleasedReturnValue();
  id v4 = [(PXStoryTimelineVisualDiagnosticsProvider *)self timeline];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self resourcesDataSource];
  objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  [v5 setTimeZone:v6];

  [v5 setTimeStyle:2];
  [v5 setDateStyle:1];
  uint64_t v7 = [(PXStoryTimelineVisualDiagnosticsProvider *)self configuration];
  uint64_t v8 = [v7 assetCollection];

  [[PXStoryDefaultDisplayAssetCroppingContext alloc] initWithAssetCollection:v8 detailedSaliency:0];
  id v9 = +[PXStorySettings sharedInstance];
  int v10 = [v9 showTVPreviewInDiagnostics];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PXStoryTimelineVisualDiagnosticsProvider *)self _tvPreviewRankByAssetUUIDForMemory:v8];
      objc_claimAutoreleasedReturnValue();
    }
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__70524;
  v12[4] = __Block_byref_object_dispose__70525;
  v12[5] = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4) {
    [v4 timeRange];
  }
  [v4 size];
  PXRectWithOriginAndSize();
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    uint64_t v7 = (void *)(a5 + 8);
    do
    {
      uint64_t v8 = (void *)MEMORY[0x1AD10CB00]();
      if (*v7 == 1)
      {
        id v9 = [*(id *)(a1 + 32) clipWithIdentifier:*(v7 - 1)];
        int v10 = [v9 resource];

        id v11 = objc_msgSend(v10, "px_storyResourceDisplayAsset");

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          id v13 = *(void **)(a1 + 48);
          CGRect v14 = [v12 localIdentifier];
          [v13 addObject:v14];

          if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
            uint64_t v15 = [v12 photoLibrary];
            uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
            CGRect v17 = *(void **)(v16 + 40);
            *(void *)(v16 + 40) = v15;
          }
        }
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a2 >= 1)
  {
    for (uint64_t i = 0; i != a2; ++i)
    {
      context = (void *)MEMORY[0x1AD10CB00]();
      uint64_t v5 = (uint64_t *)(a5 + 768 * i);
      uint64_t v7 = *v5;
      uint64_t v6 = v5[1];
      long long v41 = *((_OWORD *)v5 + 1);
      long long v8 = *(_OWORD *)(v5 + 11);
      long long v9 = *(_OWORD *)(v5 + 15);
      long long v38 = *(_OWORD *)(v5 + 13);
      long long v39 = v9;
      long long v40 = *(_OWORD *)(v5 + 17);
      long long v10 = *(_OWORD *)(v5 + 7);
      long long v34 = *(_OWORD *)(v5 + 5);
      long long v35 = v10;
      long long v11 = *(_OWORD *)(v5 + 9);
      long long v37 = v8;
      long long v36 = v11;
      uint64_t v25 = v5[19];
      memcpy(__dst, v5 + 20, sizeof(__dst));
      if (v6 == 1)
      {
        id v12 = [*(id *)(a1 + 32) clipWithIdentifier:v7];
        if (!v12)
        {
          CGFloat v20 = [MEMORY[0x1E4F28B00] currentHandler];
          [v20 handleFailureInMethod:*(void *)(a1 + 112), *(void *)(a1 + 40), @"PXStoryTimelineVisualDiagnosticsProvider.m", 925, @"Invalid parameter not satisfying: %@", @"clip != nil" object file lineNumber description];

          id v12 = 0;
        }
        id v13 = [v12 resource];
        id v27 = objc_msgSend(v13, "px_storyResourceDisplayAsset");

        if (!v27)
        {
          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:*(void *)(a1 + 112), *(void *)(a1 + 40), @"PXStoryTimelineVisualDiagnosticsProvider.m", 927, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
        }
        CGRect v14 = *(void **)(a1 + 48);
        id v15 = objc_alloc((Class)off_1E5DA55E0);
        long long v16 = *((_OWORD *)off_1E5DAB028 + 1);
        v29[0] = *(_OWORD *)off_1E5DAB028;
        v29[1] = v16;
        CGRect v17 = (void *)[v15 initWithSectionObject:v27 itemObject:0 subitemObject:0 indexPath:v29];
        uint64_t v18 = [v14 indexForDisplayAssetReference:v17];

        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v19 = [*(id *)(a1 + 48) movieHighlightsForDisplayAssetAtIndex:v18];
          PXStoryMovieHighlightForPlaybackStyle(v19, v25);
          objc_claimAutoreleasedReturnValue();
        }
        [*(id *)(a1 + 56) beginPage];
        memset(&slice, 0, sizeof(slice));
        [*(id *)(a1 + 56) currentPageBounds];
        CGRect slice = CGRectInset(v43, 10.0, 10.0);
        memset(&remainder, 0, sizeof(remainder));
        memset(&v30, 0, sizeof(v30));
        CGRectDivide(slice, &slice, &remainder, 260.0, CGRectMaxYEdge);
        CGRectDivide(slice, &v30, &slice, 250.0, CGRectMaxYEdge);
        [v27 aspectRatio];
        PXRectWithAspectRatioFittingRect();
      }
    }
  }
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(_OWORD *)(a1 + 672);
  v7[4] = *(_OWORD *)(a1 + 656);
  v7[5] = v4;
  v7[6] = *(_OWORD *)(a1 + 688);
  uint64_t v8 = *(void *)(a1 + 704);
  long long v5 = *(_OWORD *)(a1 + 608);
  v7[0] = *(_OWORD *)(a1 + 592);
  v7[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 640);
  v7[2] = *(_OWORD *)(a1 + 624);
  v7[3] = v6;
  [v3 setKenBurnsAnimationInfo:v7];
  [v3 setMovieHighlight:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 808)) {
    objc_msgSend(v3, "setTVPreviewSize:", 1920.0, 1080.0);
  }
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  uint64_t v6 = [*(id *)(a1 + 32) _descriptionForFaces:a5 context:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length]) {
    [*(id *)(a1 + 32) appendFormat:@" %@", v3];
  }
}

void __64__PXStoryTimelineVisualDiagnosticsProvider__addCropDiagnostics___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:10.0];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setTextColor:v4];
}

- (id)_segmentIndexesWithInvalidOrderOutTransitionInTimeline:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v3) {
    [v3 timeRange];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __99__PXStoryTimelineVisualDiagnosticsProvider__segmentIndexesWithInvalidOrderOutTransitionInTimeline___block_invoke;
  id v12 = &unk_1E5DC01A0;
  id v13 = v3;
  id v14 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 enumerateSegmentsInTimeRange:v15 usingBlock:&v9];
  uint64_t v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

uint64_t __99__PXStoryTimelineVisualDiagnosticsProvider__segmentIndexesWithInvalidOrderOutTransitionInTimeline___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 >= 2)
  {
    uint64_t v19 = v9;
    uint64_t v20 = v8;
    uint64_t v21 = v7;
    uint64_t v22 = v6;
    uint64_t v23 = v5;
    uint64_t v24 = v4;
    uint64_t v25 = v10;
    uint64_t v26 = v11;
    uint64_t v13 = result;
    uint64_t v14 = 0;
    uint64_t v15 = a2 - 1;
    do
    {
      uint64_t v16 = *a4;
      uint64_t v17 = *((char *)a4 + 48);
      uint64_t v18 = a4[25];
      a4 += 25;
      result = +[PXStoryTransitionProducer isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:](PXStoryTransitionProducer, "isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:", v17, v16, v18, *(void *)(v13 + 32), v19, v20, v21, v22, v23, v24, v25, v26);
      if ((result & 1) == 0) {
        result = [*(id *)(v13 + 40) addIndex:v14];
      }
      ++v14;
    }
    while (v15 != v14);
  }
  return result;
}

- (id)_moduleStartSegmentIndexesInTimeline:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v7 = [(PXStoryTimelineVisualDiagnosticsProvider *)self model];
  uint64_t v8 = [v7 currentStyle];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 autoEditDecisionList];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      if (v5) {
        [v5 timeRange];
      }
      else {
        memset(v20, 0, sizeof(v20));
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke;
      v14[3] = &unk_1E5DB5DD0;
      id v15 = v5;
      uint64_t v16 = self;
      SEL v19 = a2;
      id v17 = v10;
      id v18 = v6;
      id v11 = v10;
      [v15 enumerateSegmentsInTimeRange:v20 usingBlock:v14];
    }
  }
  id v12 = (void *)[v6 copy];

  return v12;
}

uint64_t __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    id v3 = *(void **)(result + 32);
    uint64_t v4 = [v3 identifierForSegmentAtIndex:0];
    if (v3)
    {
      [v3 timeRangeForSegmentWithIdentifier:v4];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    char v6 = 0;
    [*(id *)(v2 + 32) size];
    PXRectWithOriginAndSize();
  }
  return result;
}

void __81__PXStoryTimelineVisualDiagnosticsProvider__moduleStartSegmentIndexesInTimeline___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    long long v7 = (void *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        long long v8 = [*(id *)(a1 + 32) clipWithIdentifier:*(v7 - 1)];
        long long v9 = [v8 resource];

        uint64_t v10 = objc_msgSend(v9, "px_storyResourceDisplayAsset");

        id v11 = [*(id *)(a1 + 48) clipForDisplayAsset:v10];
        [v11 moduleInfo];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v12 & 1;
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

- (id)_autoEditDebugInfoBySegmentInTimeline:(id)a3
{
  id v5 = a3;
  char v6 = objc_opt_new();
  long long v7 = [(PXStoryTimelineVisualDiagnosticsProvider *)self model];
  long long v8 = [v7 currentStyle];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 autoEditDecisionList];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      if (v5) {
        [v5 timeRange];
      }
      else {
        memset(v20, 0, sizeof(v20));
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke;
      v14[3] = &unk_1E5DB5DD0;
      id v15 = v5;
      uint64_t v16 = self;
      SEL v19 = a2;
      id v17 = v10;
      id v18 = v6;
      id v11 = v10;
      [v15 enumerateSegmentsInTimeRange:v20 usingBlock:v14];
    }
  }
  char v12 = (void *)[v6 copy];

  return v12;
}

uint64_t __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
    id v3 = *(void **)(result + 32);
    uint64_t v4 = [v3 identifierForSegmentAtIndex:0];
    if (v3)
    {
      [v3 timeRangeForSegmentWithIdentifier:v4];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
    }
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3032000000;
    void v5[3] = __Block_byref_object_copy__70524;
    v5[4] = __Block_byref_object_dispose__70525;
    v5[5] = MEMORY[0x1E4F1CC08];
    [*(id *)(v2 + 32) size];
    PXRectWithOriginAndSize();
  }
  return result;
}

void __82__PXStoryTimelineVisualDiagnosticsProvider__autoEditDebugInfoBySegmentInTimeline___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    long long v7 = (void *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        long long v8 = [*(id *)(a1 + 32) clipWithIdentifier:*(v7 - 1)];
        uint64_t v9 = [v8 resource];

        uint64_t v10 = objc_msgSend(v9, "px_storyResourceDisplayAsset");

        id v11 = [*(id *)(a1 + 48) clipForDisplayAsset:v10];
        char v12 = [v11 debugInfo];

        if (v12)
        {
          uint64_t v13 = [v11 debugInfo];
          uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
          id v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;
        }
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

- (id)_moduleDescriptionsBySegmentInTimeline:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v7 = [(PXStoryTimelineVisualDiagnosticsProvider *)self model];
  long long v8 = [v7 currentStyle];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 autoEditDecisionList];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      if (v5) {
        [v5 timeRange];
      }
      else {
        memset(v20, 0, sizeof(v20));
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke;
      v14[3] = &unk_1E5DB5DD0;
      id v15 = v5;
      uint64_t v16 = self;
      SEL v19 = a2;
      id v17 = v10;
      id v18 = v6;
      id v11 = v10;
      [v15 enumerateSegmentsInTimeRange:v20 usingBlock:v14];
    }
  }
  char v12 = (void *)[v6 copy];

  return v12;
}

uint64_t __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
    id v3 = *(void **)(result + 32);
    uint64_t v4 = [v3 identifierForSegmentAtIndex:0];
    if (v3)
    {
      [v3 timeRangeForSegmentWithIdentifier:v4];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
    }
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3032000000;
    void v5[3] = __Block_byref_object_copy__70524;
    v5[4] = __Block_byref_object_dispose__70525;
    v5[5] = objc_opt_new();
    [*(id *)(v2 + 32) size];
    PXRectWithOriginAndSize();
  }
  return result;
}

void __83__PXStoryTimelineVisualDiagnosticsProvider__moduleDescriptionsBySegmentInTimeline___block_invoke_450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    long long v7 = (void *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        long long v8 = [*(id *)(a1 + 32) clipWithIdentifier:*(v7 - 1)];
        uint64_t v9 = [v8 resource];

        uint64_t v10 = objc_msgSend(v9, "px_storyResourceDisplayAsset");

        id v11 = [*(id *)(a1 + 48) clipForDisplayAsset:v10];
        if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length]) {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) appendString:@" / "];
        }
        char v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        unint64_t v13 = [v11 moduleInfo];
        uint64_t v14 = @"??";
        if (v13 <= 3) {
          uint64_t v14 = off_1E5DB4F20[v13];
        }
        id v15 = v14;
        [v11 moduleInfo];
        if (v16) {
          id v17 = @" start";
        }
        else {
          id v17 = &stru_1F00B0030;
        }
        [v11 moduleInfo];
        SEL v19 = @" empty space break";
        if ((v18 & 0x100) == 0) {
          SEL v19 = &stru_1F00B0030;
        }
        [v12 appendFormat:@"%@%@%@", v15, v17, v19];
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

- (id)_momentEndSegmentIndexesInTimeline:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v7 = [(PXStoryTimelineVisualDiagnosticsProvider *)self momentsProvider];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke;
  v22[3] = &unk_1E5DC6EF8;
  id v8 = v6;
  id v23 = v8;
  [v7 enumerateMomentsUsingBlock:v22];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_2;
  _OWORD v15[3] = &unk_1E5DB5DD0;
  id v19 = v9;
  SEL v20 = a2;
  id v16 = v5;
  id v17 = self;
  id v18 = v8;
  id v10 = v9;
  id v11 = v8;
  id v12 = v5;
  [v12 enumerateSegmentsInTimeRange:v21 usingBlock:v15];
  unint64_t v13 = (void *)[v10 copy];

  return v13;
}

void __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lastAsset];
  id v5 = [v3 uuid];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

uint64_t __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    id v3 = *(void **)(result + 32);
    uint64_t v4 = [v3 identifierForSegmentAtIndex:0];
    if (v3)
    {
      [v3 timeRangeForSegmentWithIdentifier:v4];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    char v6 = 0;
    [*(id *)(v2 + 32) size];
    PXRectWithOriginAndSize();
  }
  return result;
}

void __79__PXStoryTimelineVisualDiagnosticsProvider__momentEndSegmentIndexesInTimeline___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2 >= 1)
  {
    uint64_t v7 = a2;
    long long v9 = (void *)(a5 + 8);
    do
    {
      if (*v9 == 1)
      {
        id v10 = [*(id *)(a1 + 32) clipWithIdentifier:*(v9 - 1)];
        id v11 = [v10 resource];

        id v12 = objc_msgSend(v11, "px_storyResourceDisplayAsset");

        unint64_t v13 = [v12 uuid];
        if (v13)
        {
          uint64_t v14 = *(void **)(a1 + 48);
          id v15 = [v12 uuid];
          LODWORD(v14) = [v14 containsObject:v15];

          if (v14)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
            *a6 = 1;
          }
        }
      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

- (id)_descriptionForMovementType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return @"??";
  }
  else {
    return off_1E5DB5FF8[a3];
  }
}

- (id)_movementDescriptionForSegmentAtIndex:(int64_t)a3 inTimeline:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v5 identifierForSegmentAtIndex:a3];
  if (v5) {
    [v5 timeRangeForSegmentWithIdentifier:v7];
  }
  [v5 size];
  PXRectWithOriginAndSize();
}

void __93__PXStoryTimelineVisualDiagnosticsProvider__movementDescriptionForSegmentAtIndex_inTimeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    __dst[90] = v5;
    __dst[91] = v6;
    uint64_t v7 = a2;
    long long v8 = (void *)(a5 + 16);
    do
    {
      uint64_t v9 = *(v8 - 1);
      memcpy(__dst, v8, 0x290uLL);
      if (v9 == 1)
      {
        v10[4] = *(_OWORD *)&__dst[75];
        v10[5] = *(_OWORD *)&__dst[77];
        v10[6] = *(_OWORD *)&__dst[79];
        uint64_t v11 = __dst[81];
        v10[0] = *(_OWORD *)&__dst[67];
        v10[1] = *(_OWORD *)&__dst[69];
        v10[2] = *(_OWORD *)&__dst[71];
        v10[3] = *(_OWORD *)&__dst[73];
        PXStoryClipKenBurnsAnimationInfoGetMovementType(v10);
      }
      v8 += 96;
      --v7;
    }
    while (v7);
  }
}

- (id)_descriptionForDurationInfo:(id *)a3
{
  id v4 = [NSString alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
  uint64_t v5 = PXStoryTimeDescription((CMTime *)&var1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var0;
  uint64_t v6 = PXStoryTimeDescription((CMTime *)&var1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var2;
  uint64_t v7 = PXStoryTimeDescription((CMTime *)&var1);
  long long v8 = (void *)[v4 initWithFormat:@"%@ (%@ - %@)", v5, v6, v7];

  return v8;
}

- (void)_addAssetsDetailsTable:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_2;
  v10[3] = &unk_1E5DB5C90;
  uint64_t v11 = @"Assets";
  id v12 = @"Distance";
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_5;
  v6[3] = &unk_1E5DB5D80;
  v6[4] = self;
  uint64_t v7 = @"Assets";
  id v8 = v4;
  uint64_t v9 = @"Distance";
  id v5 = v4;
  [v5 addPagesForTableWithConfiguration:&__block_literal_global_376 columnsConfiguration:v10 rowsConfiguration:v6];
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 addColumnWithIdentifier:v3 configuration:&__block_literal_global_381];
  [v4 addColumnWithIdentifier:*(void *)(a1 + 40) configuration:&__block_literal_global_383];
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] resourcesDataSource];
  uint64_t v5 = [v4 numberOfDisplayAssetResources];
  if (v5 >= 2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = v5 - 1;
    do
    {
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_6;
      v11[3] = &unk_1E5DB5D58;
      id v12 = v4;
      uint64_t v17 = v6;
      id v9 = a1[5];
      id v10 = a1[4];
      id v13 = v9;
      id v14 = v10;
      id v15 = a1[6];
      id v16 = a1[7];
      [v3 addRowWithConfiguration:v11];

      ++v6;
    }
    while (v8 != v6);
  }
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Assets Pairs"];
  [v2 setDefaultRowHeight:30.0];
  [v2 setDefaultRowFontSize:7.0];
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_6(uint64_t a1, void *a2)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_7;
  aBlock[3] = &unk_1E5DB5D08;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 72);
  id v20 = v4;
  uint64_t v21 = v5;
  id v6 = a2;
  uint64_t v7 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v8 = v7[2](v7, 0);
  id v9 = v7[2](v7, 1);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_8;
  v14[3] = &unk_1E5DB5D30;
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 56);
  void v14[4] = *(void *)(a1 + 48);
  id v15 = v8;
  id v16 = v11;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  [v6 addCellForColumnWithIdentifier:v10 rendering:v14];
  [v6 addCellForColumnWithIdentifier:*(void *)(a1 + 64) text:@"..."];
}

id __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) displayAssetResourceAtIndex:*(void *)(a1 + 40) + a2];
  id v3 = objc_msgSend(v2, "px_storyResourceDisplayAsset");

  return v3;
}

uint64_t __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_8(uint64_t a1, void *a2, double a3, CGFloat a4, double a5, CGFloat a6)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_9;
  v12[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v12[4] = *(void *)(a1 + 64);
  [a2 drawTextInRect:v12 configuration:a3];
  CGFloat v10 = a3 + 25.0;
  objc_msgSend(*(id *)(a1 + 32), "_drawAsset:inRect:context:", *(void *)(a1 + 40), *(void *)(a1 + 48), v10, a4, a6, a6);
  v13.origin.double x = v10;
  v13.origin.double y = a4;
  v13.size.double width = a6;
  v13.size.double height = a6;
  return objc_msgSend(*(id *)(a1 + 32), "_drawAsset:inRect:context:", *(void *)(a1 + 56), *(void *)(a1 + 48), CGRectGetMaxX(v13) + 2.0, a4, a6, a6);
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v5 = a2;
  id v4 = objc_msgSend([v3 alloc], "initWithFormat:", @"%li-%li", *(void *)(a1 + 32), *(void *)(a1 + 32) + 1);
  [v5 setText:v4];

  [v5 setFontSize:7.0];
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Distance"];
  [v2 setWidth:200.0];
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addAssetsDetailsTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Assets"];
  [v2 setWidth:100.0];
}

- (void)_addSegmentsAutoEditDebugInfoTables:(id)a3 debugInfoKeys:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  [(PXStoryTimelineVisualDiagnosticsProvider *)self timeline];
  v17 = id v19 = self;
  id v20 = -[PXStoryTimelineVisualDiagnosticsProvider _autoEditDebugInfoBySegmentInTimeline:](self, "_autoEditDebugInfoBySegmentInTimeline:");
  uint64_t v7 = [v20 allValues];
  uint64_t v8 = [v7 firstObject];

  id v9 = [v8 allKeys];
  CGFloat v10 = [v9 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if (!v6 || [v6 containsObject:*(void *)(*((void *)&v31 + 1) + 8 * i)])
        {
          uint64_t v29 = v15;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke;
          v30[3] = &unk_1E5DB5C40;
          v30[4] = v15;
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_2;
          v27[3] = &unk_1E5DB5C90;
          id v28 = @"Segment";
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_5;
          v22[3] = &unk_1E5DB5CE0;
          void v22[4] = v19;
          id v23 = @"Segment";
          id v16 = v21;
          id v24 = v16;
          id v25 = v20;
          uint64_t v26 = v15;
          [v16 addPagesForTableWithConfiguration:v30 columnsConfiguration:v27 rowsConfiguration:v22];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  id v4 = [v2 stringWithFormat:@"Segment AutoEdit Debug Info: %@", v3];
  [v5 setTitle:v4];

  [v5 setDefaultRowHeight:30.0];
  [v5 setDefaultRowFontSize:7.0];
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 addColumnWithIdentifier:v3 configuration:&__block_literal_global_368];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_4;
  id v9 = &unk_1E5DB5C68;
  uint64_t v10 = v5;
  objc_msgSend(v4, "addColumnWithIdentifier:configuration:");
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) timeline];
  uint64_t v5 = [v4 numberOfSegments];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    do
    {
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_6;
      v13[3] = &unk_1E5DB5CB8;
      id v9 = *(id *)(a1 + 40);
      uint64_t v20 = v7;
      uint64_t v10 = *(void *)(a1 + 32);
      id v14 = v9;
      uint64_t v15 = v10;
      id v16 = v4;
      id v17 = *(id *)(a1 + 48);
      id v11 = *(id *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 64);
      id v18 = v11;
      uint64_t v19 = v12;
      [v3 addRowWithConfiguration:v13];

      ++v7;
    }
    while (v6 != v7);
  }
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_7;
  id v17 = &unk_1E5DB5BA0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 80);
  uint64_t v18 = v4;
  id v19 = v6;
  id v20 = *(id *)(a1 + 56);
  id v7 = a2;
  [v7 addCellForColumnWithIdentifier:v5 rendering:&v14];
  uint64_t v8 = *(void **)(a1 + 64);
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 80), v14, v15, v16, v17, v18);
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 72)];
  unint64_t v12 = [*(id *)(a1 + 40) _approxLinesInString:v11 lineLength:100];
  [v7 height];
  if (v13 < (double)v12 * 8.5) {
    double v13 = (double)v12 * 8.5;
  }
  [v7 setHeight:v13];
  [v7 addCellForColumnWithIdentifier:*(void *)(a1 + 72) text:v11];
}

uint64_t __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_7(uint64_t a1, void *a2, double a3, double a4)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_8;
  v8[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  v8[4] = *(void *)(a1 + 56);
  [a2 drawTextInRect:v8 configuration:a3];
  return objc_msgSend(*(id *)(a1 + 32), "_drawSegmentAtIndex:timeline:inRect:options:context:", *(void *)(a1 + 56), *(void *)(a1 + 40), 0, *(void *)(a1 + 48), a3 + 25.0, a4, 30.0, 30.0);
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v5 = a2;
  uint64_t v4 = objc_msgSend([v3 alloc], "initWithFormat:", @"#%li", *(void *)(a1 + 32));
  [v5 setText:v4];

  [v5 setFontSize:7.0];
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setTitle:v2];
  [v3 setWidth:500.0];
}

void __94__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsAutoEditDebugInfoTables_debugInfoKeys___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Segment"];
  [v2 setWidth:70.0];
}

- (unint64_t)_approxLinesInString:(id)a3 lineLength:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(a3, "componentsSeparatedByString:", @"\n", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v12 + 1) + 8 * i) length] / a4 + 1;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)_addSegmentsDetailsTable:(id)a3
{
  id v4 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_2;
  v13[3] = &unk_1E5DB5B78;
  long long v14 = @"Segment";
  long long v15 = @"Duration";
  id v16 = @"Movement";
  uint64_t v17 = @"Transition";
  uint64_t v18 = @"MomentBoundary";
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_8;
  v6[3] = &unk_1E5DB5C18;
  v6[4] = self;
  uint64_t v7 = @"Segment";
  id v8 = v4;
  uint64_t v9 = @"Duration";
  uint64_t v10 = @"Movement";
  id v11 = @"Transition";
  long long v12 = @"MomentBoundary";
  id v5 = v4;
  [v5 addPagesForTableWithConfiguration:&__block_literal_global_70755 columnsConfiguration:v13 rowsConfiguration:v6];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 addColumnWithIdentifier:v3 configuration:&__block_literal_global_342];
  [v4 addColumnWithIdentifier:a1[5] configuration:&__block_literal_global_344];
  [v4 addColumnWithIdentifier:a1[6] configuration:&__block_literal_global_346];
  [v4 addColumnWithIdentifier:a1[7] configuration:&__block_literal_global_348];
  [v4 addColumnWithIdentifier:a1[8] configuration:&__block_literal_global_350];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_8(id *a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [a1[4] timeline];
  uint64_t v4 = [v3 numberOfSegments];
  id v5 = [a1[4] _momentEndSegmentIndexesInTimeline:v3];
  uint64_t v6 = [a1[4] _moduleStartSegmentIndexesInTimeline:v3];
  uint64_t v7 = [a1[4] _moduleDescriptionsBySegmentInTimeline:v3];
  id v8 = [a1[4] _segmentIndexesWithInvalidOrderOutTransitionInTimeline:v3];
  if (v4 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    do
    {
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_9;
      v14[3] = &unk_1E5DB5BF0;
      id v15 = v3;
      uint64_t v27 = v9;
      id v11 = a1[5];
      id v12 = a1[4];
      id v16 = v11;
      id v17 = v12;
      id v18 = a1[6];
      id v19 = a1[7];
      id v20 = a1[8];
      id v21 = v8;
      id v22 = a1[9];
      id v23 = a1[10];
      id v24 = v5;
      id v25 = v6;
      id v26 = v7;
      [v13 addRowWithConfiguration:v14];

      ++v9;
    }
    while (v4 != v9);
  }
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Segments"];
  [v2 setDefaultRowHeight:30.0];
  [v2 setDefaultRowFontSize:7.0];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v33 = 0u;
  memset(v34, 0, 120);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 identifierForSegmentAtIndex:*(void *)(a1 + 128)];
  if (v4)
  {
    [v4 infoForSegmentWithIdentifier:v5];
  }
  else
  {
    long long v33 = 0u;
    memset(v34, 0, 120);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_10;
  v25[3] = &unk_1E5DB5BA0;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v28 = *(void *)(a1 + 128);
  v25[4] = v6;
  id v26 = *(id *)(a1 + 32);
  id v27 = *(id *)(a1 + 56);
  [v3 addCellForColumnWithIdentifier:v7 rendering:v25];
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 48);
  v24[4] = *(_OWORD *)((char *)&v34[4] + 8);
  v24[5] = *(_OWORD *)((char *)&v34[5] + 8);
  v24[6] = *(_OWORD *)((char *)&v34[6] + 8);
  v24[0] = *(_OWORD *)((char *)v34 + 8);
  v24[1] = *(_OWORD *)((char *)&v34[1] + 8);
  v24[2] = *(_OWORD *)((char *)&v34[2] + 8);
  v24[3] = *(_OWORD *)((char *)&v34[3] + 8);
  uint64_t v10 = [v9 _descriptionForDurationInfo:v24];
  [v3 addCellForColumnWithIdentifier:v8 text:v10];

  uint64_t v11 = *(void *)(a1 + 72);
  id v12 = [*(id *)(a1 + 48) _movementDescriptionForSegmentAtIndex:*(void *)(a1 + 128) inTimeline:*(void *)(a1 + 32)];
  [v3 addCellForColumnWithIdentifier:v11 text:v12];

  if (v32 > 0xAuLL) {
    id v13 = @"??";
  }
  else {
    id v13 = off_1E5DC5088[v32];
  }
  long long v14 = v13;
  if ([*(id *)(a1 + 80) containsIndex:*(void *)(a1 + 128)])
  {
    uint64_t v15 = [[NSString alloc] initWithFormat:@"⚠️(%@)", v14];

    long long v14 = (__CFString *)v15;
  }
  [v3 addCellForColumnWithIdentifier:*(void *)(a1 + 88) text:v14];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_12;
  v19[3] = &unk_1E5DB5BA0;
  uint64_t v16 = *(void *)(a1 + 96);
  id v17 = *(id *)(a1 + 104);
  uint64_t v18 = *(void *)(a1 + 128);
  id v20 = v17;
  uint64_t v23 = v18;
  id v21 = *(id *)(a1 + 112);
  id v22 = *(id *)(a1 + 120);
  [v3 addCellForColumnWithIdentifier:v16 rendering:v19];
}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_10(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_11;
  v11[3] = &__block_descriptor_40_e52_v16__0___PXVisualDiagnosticsDrawTextConfiguration__8l;
  void v11[4] = *(void *)(a1 + 56);
  [a2 drawTextInRect:v11 configuration:a3];
  return objc_msgSend(*(id *)(a1 + 32), "_drawSegmentAtIndex:timeline:inRect:options:context:", *(void *)(a1 + 56), *(void *)(a1 + 40), 0, *(void *)(a1 + 48), a3 + 25.0, a4, a6, a6);
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_12(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  if ([*(id *)(a1 + 32) containsIndex:*(void *)(a1 + 56)])
  {
    id v12 = (CGContext *)[v11 CGContext];
    id v13 = [MEMORY[0x1E4FB1618] yellowColor];
LABEL_5:
    id v14 = v13;
    CGContextSetFillColorWithColor(v12, (CGColorRef)[v14 CGColor]);

    uint64_t v15 = (CGContext *)[v11 CGContext];
    v21.origin.double x = a3;
    v21.origin.double y = a4;
    v21.size.double width = a5;
    v21.size.double height = a6;
    CGContextFillRect(v15, v21);
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 40) containsIndex:*(void *)(a1 + 56)])
  {
    id v12 = (CGContext *)[v11 CGContext];
    id v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.6 green:0.96 blue:0.92 alpha:1.0];
    goto LABEL_5;
  }
LABEL_6:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_13;
  v18[3] = &unk_1E5DB5BC8;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  id v19 = v16;
  uint64_t v20 = v17;
  objc_msgSend(v11, "drawTextInRect:configuration:", v18, a3, a4, a5, a6);
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = a2;
  uint64_t v5 = [v2 numberWithInteger:v4];
  uint64_t v6 = [v3 objectForKeyedSubscript:v5];
  [v7 setText:v6];

  [v7 setFontSize:7.0];
  objc_msgSend(v7, "setRelativePosition:", 0.0, 0.5);
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v5 = a2;
  uint64_t v4 = objc_msgSend([v3 alloc], "initWithFormat:", @"#%li", *(void *)(a1 + 32));
  [v5 setText:v4];

  [v5 setFontSize:7.0];
  objc_msgSend(v5, "setRelativePosition:", 0.0, 0.5);
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Module"];
  [v2 setWidth:120.0];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Transition"];
  [v2 setWidth:120.0];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Movement"];
  [v2 setWidth:120.0];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Duration"];
  [v2 setWidth:120.0];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addSegmentsDetailsTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:@"Segment"];
  [v2 setWidth:70.0];
}

- (void)_addCinematicDiagnostics:(id)a3
{
  id v4 = a3;
  [(PXStoryTimelineVisualDiagnosticsProvider *)self timeline];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXSizeGetAspectRatio();
}

__n128 __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginPage];
  [*(id *)(a1 + 32) currentPageBounds];
  *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectInset(v3, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  *(__n128 *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = result;
  return result;
}

__n128 __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endPage];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v2 + 32) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v2 + 48) = v4;
  return result;
}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_3(void *a1)
{
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1[6] + 8) + 32))) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  uint64_t v2 = *(uint64_t (**)(void))(a1[5] + 16);
  return v2();
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_4(uint64_t a1, double a2, double a3)
{
  CGFloat v5 = a2 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  if (v5 > CGRectGetMaxX(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)))
  {
    *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                           + 32));
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(a1 + 56)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
    CGFloat v6 = a3 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6 > CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32))) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  PXRectWithOriginAndSize();
}

double __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_5(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 32) + a2;
  *(double *)(v2 + 32) = result;
  return result;
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v19 = v12;
    uint64_t v20 = v11;
    uint64_t v21 = v10;
    uint64_t v22 = v9;
    uint64_t v23 = v8;
    uint64_t v24 = v7;
    uint64_t v25 = v5;
    uint64_t v26 = v6;
    uint64_t v13 = a2;
    id v14 = (void *)(a5 + 160);
    uint64_t v15 = a4 + 16;
    do
    {
      id v16 = (void *)MEMORY[0x1AD10CB00]();
      uint64_t v17 = *(v14 - 19);
      memcpy(__dst, v14, sizeof(__dst));
      if (v17 == 1) {
        PXRectNormalize();
      }
      v14 += 96;
      v15 += 32;
      --v13;
    }
    while (v13);
  }
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_8(uint64_t a1, void *a2)
{
  CGRect v3 = (objc_class *)NSString;
  id v5 = a2;
  long long v4 = objc_msgSend([v3 alloc], "initWithFormat:", @"#%li", *(void *)(a1 + 32));
  [v5 setText:v4];

  [v5 setFontSize:4.0];
  objc_msgSend(v5, "setRelativePosition:", 0.0, 1.0);
}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setSymbolName:*(void *)(a1 + 32)];
}

void __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_10(uint64_t a1, void *a2)
{
  unint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  if (v3 > 0xA) {
    id v5 = @"??";
  }
  else {
    id v5 = off_1E5DC5088[v3];
  }
  uint64_t v8 = v5;
  if ([*(id *)(a1 + 32) containsIndex:*(void *)(a1 + 40)])
  {
    uint64_t v6 = [[NSString alloc] initWithFormat:@"⚠️(%@)", v8];

    id v7 = (id)v6;
  }
  else
  {
    id v7 = v8;
  }
  id v9 = v7;
  [v4 setText:v7];
  [v4 setFontSize:7.0];
  objc_msgSend(v4, "setRelativePosition:", 0.5, 0.5);
}

uint64_t __69__PXStoryTimelineVisualDiagnosticsProvider__addCinematicDiagnostics___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setSymbolName:*(void *)(a1 + 32)];
}

- (void)_addSegmentDiagnostics:(id)a3
{
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:7.0];
  objc_msgSend(v3, "setRelativePosition:", 0.0, 0.0);
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:7.0];
  objc_msgSend(v3, "setRelativePosition:", 0.5, 0.0);
}

void __67__PXStoryTimelineVisualDiagnosticsProvider__addSegmentDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:7.0];
  objc_msgSend(v3, "setRelativePosition:", 0.5, 0.5);
}

- (void)_addCoverPage:(id)a3
{
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addCoverPage:v6];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addSegmentDiagnostics:v6];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addCinematicDiagnostics:v6];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addSegmentsDetailsTable:v6];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addSegmentsAutoEditDebugInfoTables:v6 debugInfoKeys:&unk_1F02D3D48];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addCropDiagnostics:v6];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addDetailedSaliencyDiagnostics:v6];
  [(PXStoryTimelineVisualDiagnosticsProvider *)self _addMiscellaneousDiagnostics:v6];

  v7[2](v7, 1, 0);
}

- (PXStoryTimelineVisualDiagnosticsProvider)initWithModel:(id)a3 screenScale:(double)a4
{
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXStoryTimelineVisualDiagnosticsProvider;
  uint64_t v8 = [(PXStoryTimelineVisualDiagnosticsProvider *)&v27 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    double v10 = 1.0;
    if (a4 >= 1.0) {
      double v10 = a4;
    }
    v9->_screenScale = v10;
    uint64_t v11 = [(PXStoryModel *)v9->_model timeline];
    timeline = v9->_timeline;
    v9->_timeline = (PXStoryTimeline *)v11;

    uint64_t v13 = [(PXStoryModel *)v9->_model configuration];
    configuration = v9->_configuration;
    v9->_configuration = (PXStoryConfiguration *)v13;

    uint64_t v15 = [(PXStoryModel *)v9->_model timelineManager];
    id v16 = [v15 resourcesDataSourceManager];
    uint64_t v17 = [v16 recipeManager];
    uint64_t v18 = [v17 diagnosticsMomentsProvider];
    momentsProvider = v9->_momentsProvider;
    v9->_momentsProvider = (PXStoryAutoEditMomentsProvider *)v18;

    uint64_t v20 = [(PXStoryModel *)v9->_model timelineManager];
    uint64_t v21 = [v20 resourcesDataSourceManager];
    uint64_t v22 = [v21 dataSource];
    resourcesDataSource = v9->_resourcesDataSource;
    v9->_resourcesDataSource = (PXStoryResourcesDataSource *)v22;

    uint64_t v24 = [[PXStoryVisualDiagnosticsProviderHelper alloc] initWithConfiguration:v9->_configuration];
    helper = v9->_helper;
    v9->_helper = v24;
  }
  return v9;
}

- (PXStoryTimelineVisualDiagnosticsProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTimelineVisualDiagnosticsProvider.m", 85, @"%s is not available as initializer", "-[PXStoryTimelineVisualDiagnosticsProvider init]");

  abort();
}

@end