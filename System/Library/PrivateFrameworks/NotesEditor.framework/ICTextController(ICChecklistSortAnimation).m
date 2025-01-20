@interface ICTextController(ICChecklistSortAnimation)
- (ICTrackedParagraphImageInfo)imageInfoForTrackedParagraph:()ICChecklistSortAnimation textView:characterRangeToRender:visibleRectToRender:;
- (void)addImageViewsAfterSortIfNecessaryForTrackedInfos:()ICChecklistSortAnimation existingInfos:textView:textContainerOrigin:todoUUIDsToImageViews:;
- (void)addImageViewsBeforeSortIfNecessaryForTrackedInfos:()ICChecklistSortAnimation textView:textContainerOrigin:todoUUIDsToImageViews:;
- (void)performAnimatedSortForTrackedParagraphs:()ICChecklistSortAnimation expandedRange:textView:sortChecklistsBlock:;
- (void)setFinalFramesForSortedInfos:()ICChecklistSortAnimation textView:textContainerOrigin:todoUUIDsToImageViews:;
@end

@implementation ICTextController(ICChecklistSortAnimation)

- (void)performAnimatedSortForTrackedParagraphs:()ICChecklistSortAnimation expandedRange:textView:sortChecklistsBlock:
{
  id v12 = a6;
  v13 = (objc_class *)MEMORY[0x263EFF9A0];
  v14 = a7;
  id v15 = a3;
  id v73 = objc_alloc_init(v13);
  objc_msgSend(v12, "ic_textContainerOrigin");
  double v17 = v16;
  double v19 = v18;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v20 = [v12 icLayoutManager];
    v21 = [v12 textContainer];
    [v20 ensureLayoutForTextContainer:v21];
  }
  [v12 clampTextView];
  [v12 visibleBounds];
  uint64_t v23 = v22;
  double v25 = v24;
  double v28 = v27 + v26 * 0.3 * -0.5;
  double v29 = v26 + v26 * 0.3;
  TSDMultiplyPointScalar();
  double v71 = v28;
  uint64_t v72 = v23;
  TSDAddPoints();
  double v31 = v30;
  double v33 = v32;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v34 = [v12 icTextLayoutManager];
    double v35 = v25;
    double v36 = v29;
    uint64_t v37 = objc_msgSend(v34, "characterRangeForBoundingRect:", v31, v33, v25, v29);
    uint64_t v39 = v38;
  }
  else
  {
    v34 = [v12 icLayoutManager];
    v40 = [v12 textContainer];
    double v35 = v25;
    double v36 = v29;
    uint64_t v37 = objc_msgSend(v34, "glyphRangeForBoundingRect:inTextContainer:", v40, v31, v33, v25, v29);
    uint64_t v39 = v41;

    objc_msgSend(v34, "ensureGlyphsForCharacterRange:", a4, a5);
    [v34 setShouldManuallyRenderSeparateSubviews:1];
    [v34 setIsDraggingChecklistItem:1];
  }
  uint64_t v68 = v37;

  objc_msgSend(v12, "ic_rectForRange:", a4, a5);
  double v69 = v43;
  double v70 = v42;
  TSDAddPoints();
  double v67 = v44;
  double v46 = v45;
  v47 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v94[0] = MEMORY[0x263EF8330];
  v94[1] = 3221225472;
  v94[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke;
  v94[3] = &unk_2640BAED0;
  v94[4] = a1;
  id v48 = v12;
  uint64_t v97 = v37;
  uint64_t v98 = v39;
  uint64_t v99 = v72;
  double v100 = v71;
  double v101 = v35;
  double v102 = v36;
  id v95 = v48;
  id v96 = v47;
  id v49 = v47;
  [v15 enumerateObjectsUsingBlock:v94];
  id v50 = objc_alloc_init(MEMORY[0x263F82E00]);
  objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
  v52 = uint64_t v51 = a5;
  objc_msgSend(v50, "setIc_backgroundColor:", v52);

  objc_msgSend(v50, "setFrame:", v67, v46, v70, v69);
  [v48 addSubview:v50];
  objc_msgSend(a1, "addImageViewsBeforeSortIfNecessaryForTrackedInfos:textView:textContainerOrigin:todoUUIDsToImageViews:", v49, v48, v73, v17, v19);
  v14[2](v14);

  v53 = [v48 icLayoutManager];
  objc_msgSend(v53, "ensureLayoutForCharacterRange:", a4, v51);
  v54 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_2;
  v85[3] = &unk_2640BAED0;
  v85[4] = a1;
  id v55 = v48;
  id v86 = v55;
  uint64_t v88 = v68;
  uint64_t v89 = v39;
  uint64_t v90 = v72;
  double v91 = v71;
  double v92 = v35;
  double v93 = v36;
  id v56 = v54;
  id v87 = v56;
  [v15 enumerateObjectsUsingBlock:v85];

  objc_msgSend(a1, "addImageViewsAfterSortIfNecessaryForTrackedInfos:existingInfos:textView:textContainerOrigin:todoUUIDsToImageViews:", v56, v49, v55, v73, v17, v19);
  [v53 setShouldManuallyRenderSeparateSubviews:0];
  [v53 setIsDraggingChecklistItem:0];
  LODWORD(v57) = 1051260355;
  LODWORD(v58) = 1045220557;
  LODWORD(v59) = 1.0;
  v60 = [MEMORY[0x263F15808] functionWithControlPoints:v57 :0.0 :v58 :v59];
  v61 = (void *)MEMORY[0x263F82E00];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_3;
  v79[3] = &unk_2640BAEF8;
  v79[4] = a1;
  id v80 = v56;
  id v81 = v55;
  double v83 = v17;
  double v84 = v19;
  id v82 = v73;
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_4;
  v74[3] = &unk_2640B8C20;
  id v75 = v53;
  id v76 = v50;
  id v77 = v82;
  id v78 = v81;
  id v62 = v81;
  id v63 = v82;
  id v64 = v50;
  id v65 = v53;
  id v66 = v56;
  objc_msgSend(v61, "ic_animateWithDuration:timingFunction:animations:completion:", v60, v79, v74, 0.35);
}

- (void)addImageViewsBeforeSortIfNecessaryForTrackedInfos:()ICChecklistSortAnimation textView:textContainerOrigin:todoUUIDsToImageViews:
{
  id v11 = a6;
  id v12 = a7;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __147__ICTextController_ICChecklistSortAnimation__addImageViewsBeforeSortIfNecessaryForTrackedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke;
  v15[3] = &unk_2640BAF20;
  double v18 = a1;
  double v19 = a2;
  id v16 = v11;
  id v17 = v12;
  id v13 = v12;
  id v14 = v11;
  [a5 enumerateKeysAndObjectsUsingBlock:v15];
}

- (void)addImageViewsAfterSortIfNecessaryForTrackedInfos:()ICChecklistSortAnimation existingInfos:textView:textContainerOrigin:todoUUIDsToImageViews:
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __160__ICTextController_ICChecklistSortAnimation__addImageViewsAfterSortIfNecessaryForTrackedInfos_existingInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke;
  v19[3] = &unk_2640BAF48;
  id v20 = v15;
  id v21 = v13;
  double v23 = a1;
  double v24 = a2;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v15;
  [a5 enumerateKeysAndObjectsUsingBlock:v19];
}

- (void)setFinalFramesForSortedInfos:()ICChecklistSortAnimation textView:textContainerOrigin:todoUUIDsToImageViews:
{
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __126__ICTextController_ICChecklistSortAnimation__setFinalFramesForSortedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke;
  v16[3] = &unk_2640BAF48;
  v16[4] = a1;
  id v17 = v12;
  id v18 = v13;
  double v19 = a2;
  double v20 = a3;
  id v14 = v13;
  id v15 = v12;
  [a5 enumerateKeysAndObjectsUsingBlock:v16];
}

- (ICTrackedParagraphImageInfo)imageInfoForTrackedParagraph:()ICChecklistSortAnimation textView:characterRangeToRender:visibleRectToRender:
{
  id v17 = a7;
  id v18 = a8;
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x3032000000;
  double v57 = __Block_byref_object_copy__15;
  double v58 = __Block_byref_object_dispose__15;
  id v59 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x4010000000;
  uint64_t v51 = &unk_20C1E2BF2;
  long long v39 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v40 = *MEMORY[0x263F001A8];
  long long v52 = *MEMORY[0x263F001A8];
  long long v53 = v39;
  v61.NSUInteger location = [v17 characterRange];
  NSUInteger location = v61.location;
  NSUInteger length = v61.length;
  v62.NSUInteger location = a9;
  v62.NSUInteger length = a10;
  NSUInteger v21 = NSIntersectionRange(v61, v62).length;
  if (v21)
  {
    id v22 = objc_msgSend(v18, "ic_platformAppearanceObject");
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __127__ICTextController_ICChecklistSortAnimation__imageInfoForTrackedParagraph_textView_characterRangeToRender_visibleRectToRender___block_invoke;
    v41[3] = &unk_2640BAF70;
    id v42 = v18;
    id v43 = v17;
    double v44 = &v48;
    NSUInteger v46 = location;
    NSUInteger v47 = length - (length > 1);
    double v45 = &v54;
    objc_msgSend(v22, "ic_performAsCurrent:", v41);
  }
  else
  {
    double v23 = v49;
    *((_OWORD *)v49 + 2) = v40;
    *((_OWORD *)v23 + 3) = v39;
    uint64_t v24 = [v17 characterRange];
    if (v24 + v25 <= a9)
    {
      double v28 = (CGFloat *)v49;
      *((CGFloat *)v49 + 4) = a1;
      v28[5] = a2;
    }
    else
    {
      v63.origin.x = a1;
      v63.origin.y = a2;
      v63.size.width = a3;
      v63.size.height = a4;
      CGFloat MaxY = CGRectGetMaxY(v63);
      double v27 = (CGFloat *)v49;
      v49[4] = 0;
      v27[5] = MaxY;
    }
  }
  double v29 = objc_alloc_init(ICTrackedParagraphImageInfo);
  double v30 = v49;
  TSDMultiplyPointScalar();
  TSDAddPoints();
  v30[4] = v31;
  v30[5] = v32;
  [(ICTrackedParagraphImageInfo *)v29 setImage:v55[5]];
  double v33 = [0 firstObject];
  objc_msgSend(v33, "ic_rectValue");
  -[ICTrackedParagraphImageInfo setBoundingRect:](v29, "setBoundingRect:");

  [(ICTrackedParagraphImageInfo *)v29 setTrackedParagraph:v17];
  -[ICTrackedParagraphImageInfo setRect:](v29, "setRect:", *((double *)v49 + 4), *((double *)v49 + 5), *((double *)v49 + 6), *((double *)v49 + 7));
  v34 = [v17 paragraph];
  double v35 = [v34 todo];
  double v36 = [v35 uuid];
  uint64_t v37 = [v36 UUIDString];
  [(ICTrackedParagraphImageInfo *)v29 setUuid:v37];

  [(ICTrackedParagraphImageInfo *)v29 setEstimated:v21 == 0];
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v29;
}

@end