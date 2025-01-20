@interface ICTK2NoteEditorViewController
- (BOOL)languageHasSpaces;
- (BOOL)shouldRenderAuthorHighlights;
- (BOOL)textView:(id)a3 isEndOfDocument:(id)a4;
- (CALayer)maskLayer;
- (ICAttributionSidebarController)tk2AttributionSidebarController;
- (ICTK2TextView)tk2TextView;
- (ICTTTextStorage)textStorage;
- (NSDate)attributionSidebarOpenedDate;
- (NSLayoutConstraint)textViewLeadingConstraint;
- (_NSRange)lastSelectedRangeForAccelerator;
- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4;
- (id)attributionSidebarView;
- (id)nibName;
- (id)textController;
- (int64_t)uniqueCollapsibleSectionAffordanceExposures;
- (int64_t)uniqueCollapsibleSectionAffordanceUsages;
- (int64_t)writingDirection;
- (void)acceleratorOriginNeedsUpdate;
- (void)authorHighlightsControllerDidPerformHighlightUpdates:(id)a3;
- (void)recreateTextView;
- (void)removeTextView;
- (void)renderAuthorHighlights;
- (void)resetCollapsibleSectionAffordanceUsageData;
- (void)setAttributionSidebarOpenedDate:(id)a3;
- (void)setAuthorHighlightsController:(id)a3;
- (void)setMaskLayer:(id)a3;
- (void)setTextViewLeadingConstraint:(id)a3;
- (void)setTk2AttributionSidebarController:(id)a3;
- (void)setTk2TextView:(id)a3;
- (void)textStorageDidUpdateDataDetectionResults:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICTK2NoteEditorViewController

- (void)textStorageDidUpdateDataDetectionResults:(id)a3
{
  v4 = [a3 object];
  v5 = [(ICTK2NoteEditorViewController *)self textStorage];

  if (v4 == v5) {
    dispatchMainAfterDelay();
  }
}

- (void)authorHighlightsControllerDidPerformHighlightUpdates:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];

  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5B060]];
  ICCheckedDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [v11 document];
  v8 = [(ICNoteEditorBaseViewController *)self note];
  v9 = [v8 textStorage];
  v10 = [v9 document];

  if (v7 == v10) {
    [(ICTK2NoteEditorViewController *)self renderAuthorHighlights];
  }
}

void __74__ICTK2NoteEditorViewController_textStorageDidUpdateDataDetectionResults___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) authorHighlightsController];
  v2 = [*(id *)(a1 + 32) textStorage];
  uint64_t v3 = objc_msgSend(v2, "ic_range");
  uint64_t v5 = v4;
  v6 = [*(id *)(a1 + 32) textStorage];
  objc_msgSend(v7, "performHighlightUpdatesForRange:inTextStorage:updates:", v3, v5, v6, 0);
}

- (ICTTTextStorage)textStorage
{
  objc_opt_class();
  uint64_t v3 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v4 = [v3 textContentStorage];
  uint64_t v5 = [v4 textStorage];
  v6 = ICCheckedDynamicCast();

  return (ICTTTextStorage *)v6;
}

- (void)recreateTextView
{
  v242[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICTK2NoteEditorViewController *)self textView];

  if (v3) {
    [(ICTK2NoteEditorViewController *)self removeTextView];
  }
  id v223 = [(ICNoteEditorBaseViewController *)self note];
  if ([v223 isPasswordProtectedAndLocked]) {
    goto LABEL_6;
  }
  uint64_t v4 = [(ICNoteEditorViewController *)self invitation];
  if (v4)
  {

LABEL_6:

    return;
  }
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  char v6 = [v5 isUnsupported];

  if (v6) {
    return;
  }
  if (objc_opt_respondsToSelector()) {
    [(ICTK2NoteEditorViewController *)self ppt_willLoadNoteIntoEditor];
  }
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  v8 = [v7 textStorage];
  [v8 setIsPausingUndoActions:0];

  v9 = [(ICNoteEditorBaseViewController *)self note];
  v10 = [v9 textStorage];
  if ([v10 alwaysEnumerateTrailingParagraph])
  {
    id v11 = [(ICNoteEditorBaseViewController *)self note];
    v12 = [v11 textStorage];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v14 = [(ICNoteEditorBaseViewController *)self note];
      v15 = [v14 textStorage];
      uint64_t v16 = *MEMORY[0x263F5AB28];
      v17 = [(ICNoteEditorBaseViewController *)self note];
      v18 = [v17 textStorage];
      v19 = objc_msgSend(v15, "attribute:atIndex:effectiveRange:", v16, objc_msgSend(v18, "length") - 1, 0);

      v20 = [v19 uuid];

      if (v20)
      {
        v21 = [(ICNoteEditorBaseViewController *)self note];
        v22 = [v21 textStorage];
        v23 = [v22 outlineController];

        v24 = [v19 uuid];
        v25 = [v23 closestVisibleAncestorForUUID:v24];

        if (v25)
        {
          v26 = (void *)MEMORY[0x263EFFA08];
          v242[0] = v25;
          v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v242 count:1];
          v28 = [v26 setWithArray:v27];
          [v23 expandUUIDs:v28];
        }
      }
    }
  }
  else
  {
  }
  v29 = [(ICNoteEditorBaseViewController *)self note];
  v30 = [v29 textStorage];
  [v30 setAlwaysEnumerateTrailingParagraph:0];

  v31 = [ICTK2TextView alloc];
  v32 = [(ICNoteEditorBaseViewController *)self note];
  v33 = [(ICTK2NoteEditorViewController *)self view];
  [v33 bounds];
  v36 = -[ICTK2TextView initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:](v31, "initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:", v32, [(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper], self, 0, v34, v35);
  [(ICTK2NoteEditorViewController *)self setTk2TextView:v36];

  v37 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  [v38 setClipsToBounds:0];

  v39 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  [v39 setEditorController:self];

  v40 = [(ICNoteEditorBaseViewController *)self note];
  v41 = [v40 documentMergeController];
  v42 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  [v41 addTextView:v42];

  id v224 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v224 setTranslatesAutoresizingMaskIntoConstraints:0];
  v43 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  [v224 addSubview:v43];

  v44 = [(ICTK2NoteEditorViewController *)self traitCollection];
  if (objc_msgSend(v44, "ic_hasCompactWidth"))
  {
    uint64_t v45 = 1;
  }
  else
  {
    v46 = [(ICNoteEditorViewController *)self viewControllerManager];
    if ([v46 isAuxiliary])
    {
      uint64_t v45 = 1;
    }
    else if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
    {
      v47 = [(ICNoteEditorViewController *)self viewControllerManager];
      uint64_t v45 = [v47 isMainSplitViewDisplayModeSecondaryOnly];
    }
    else
    {
      uint64_t v45 = 0;
    }
  }
  v48 = [(ICNoteEditorViewController *)self viewControllerManager];
  BOOL v49 = [v48 noteContainerViewMode] == 0;

  v50 = [(ICNoteEditorViewController *)self viewControllerManager];
  if ([v50 noteContainerViewMode] == 1) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = v45;
  }

  v52 = [(ICNoteEditorViewController *)self backgroundView];
  objc_msgSend(v52, "setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v224, objc_msgSend(MEMORY[0x263F82670], "ic_isVision"), v45, v49, v51, 0);

  v213 = (void *)MEMORY[0x263F08938];
  v220 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  v218 = [v220 leadingAnchor];
  v219 = [v224 leadingAnchor];
  v221 = [v218 constraintEqualToAnchor:v219];
  [(ICTK2NoteEditorViewController *)self setTextViewLeadingConstraint:v221];
  v241[0] = v221;
  v217 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  v215 = [v217 topAnchor];
  v216 = [v224 topAnchor];
  v214 = [v215 constraintEqualToAnchor:v216];
  v241[1] = v214;
  v53 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  v54 = [v53 bottomAnchor];
  v55 = [v224 bottomAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  v241[2] = v56;
  v57 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  v58 = [v57 widthAnchor];
  v59 = [v224 widthAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  v241[3] = v60;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v241 count:4];
  [v213 activateConstraints:v61];

  v62 = [(ICTK2NoteEditorViewController *)self textView];
  [v62 setContentInsetAdjustmentBehavior:0];

  id v222 = objc_alloc_init(MEMORY[0x263F14BA0]);
  [v222 setDelegate:self];
  v63 = [(ICTK2NoteEditorViewController *)self textView];
  [v63 addInteraction:v222];

  v64 = [(ICTK2NoteEditorViewController *)self textView];
  [v64 setDelegate:self];

  v65 = [(ICTK2NoteEditorViewController *)self textView];
  [v65 setIcDelegate:self];

  v66 = [(ICTK2NoteEditorViewController *)self textView];
  [v66 setAttachmentViewDelegate:self];

  v67 = [(ICTK2NoteEditorViewController *)self textView];
  v68 = objc_msgSend(v67, "ic_pkTiledView");
  [v68 setRulerHostingDelegate:self];

  v69 = [(ICTK2NoteEditorViewController *)self textView];
  [v69 setDataDetectorTypes:-1];

  v70 = [(ICTK2NoteEditorViewController *)self textView];
  v71 = [v70 undoManager];

  v72 = [MEMORY[0x263F08A00] defaultCenter];
  [v72 addObserver:self selector:sel_updateBarButtons name:*MEMORY[0x263F08620] object:v71];

  v73 = [MEMORY[0x263F08A00] defaultCenter];
  [v73 addObserver:self selector:sel_updateBarButtons name:*MEMORY[0x263F08638] object:v71];

  v74 = [MEMORY[0x263F08A00] defaultCenter];
  [v74 addObserver:self selector:sel_updateBarButtons name:*MEMORY[0x263F08630] object:v71];

  v75 = [MEMORY[0x263F08A00] defaultCenter];
  [v75 addObserver:self selector:sel_hideInkPicker name:@"ICNoteEditorTitleEditingViewDidShowNotification" object:0];

  v76 = [ICAttributionSidebarController alloc];
  v77 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  v78 = [(ICAttributionSidebarController *)v76 initWithTextView:v77];
  [(ICTK2NoteEditorViewController *)self setTk2AttributionSidebarController:v78];

  v79 = [(ICTK2NoteEditorViewController *)self tk2AttributionSidebarController];
  v80 = [v79 panGestureRecognizer];
  [v80 setDelegate:self];

  objc_initWeak(&location, self);
  v237[0] = MEMORY[0x263EF8330];
  v237[1] = 3221225472;
  v237[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke;
  v237[3] = &unk_2640BB240;
  objc_copyWeak(&v238, &location);
  v237[4] = self;
  v81 = [(ICTK2NoteEditorViewController *)self tk2AttributionSidebarController];
  [v81 setSidebarWidthDidChangeHandler:v237];

  v82 = [(ICTK2NoteEditorViewController *)self textView];
  [v82 updateLayoutMargins];

  if ([(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]
    && +[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote])
  {
    [(ICNoteEditorViewController *)self createSystemPaperLinkBarIfNecessary];
    v83 = [(ICNoteEditorViewController *)self paperLinkBarViewController];
    [v83 refresh];
  }
  v84 = [ICPaperTextAttachmentManager alloc];
  v85 = [(ICNoteEditorBaseViewController *)self note];
  v86 = [(ICTK2NoteEditorViewController *)self textView];
  v87 = [(ICPaperTextAttachmentManager *)v84 initWithNote:v85 textView:v86 delegate:self];
  [(ICNoteEditorViewController *)self setPaperTextAttachmentManager:v87];

  BOOL v88 = [(ICNoteEditorViewController *)self shouldAllowAttributionSidebar];
  v89 = [(ICTK2NoteEditorViewController *)self tk2AttributionSidebarController];
  [v89 setEnabled:v88];

  BOOL v90 = [(ICNoteEditorViewController *)self userWantsToSeeDateLabel];
  if (v90)
  {
    uint64_t v91 = 1;
  }
  else
  {
    v86 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v91 = [v86 isSharedAndEmpty];
  }
  [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:v91];
  if (!v90) {

  }
  v92 = [(ICNoteEditorBaseViewController *)self note];
  v93 = [(ICTK2NoteEditorViewController *)self textView];
  v94 = [v93 dateView];
  [v94 setNote:v92];

  v95 = [(ICTK2NoteEditorViewController *)self textView];
  v96 = [(ICNoteEditorBaseViewController *)self note];
  [v95 createUserTitleViewIfNecessaryForNote:v96];

  v97 = [(ICTK2NoteEditorViewController *)self textView];
  v98 = [(ICNoteEditorBaseViewController *)self note];
  [v97 updateCompatibilityBannerForNote:v98 parentViewController:self updateTextViewContentInsets:0];

  [(ICNoteEditorViewController *)self rebuildInputAccessoryView];
  [(ICNoteEditorViewController *)self updateBarButtons];
  [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
  v99 = [(ICNoteEditorViewController *)self backgroundView];
  v100 = [(ICTK2NoteEditorViewController *)self textView];
  [v99 reparentAccessibilityChildrenOfElement:v100];

  v101 = [(ICNoteEditorViewController *)self backgroundView];
  [v101 setAxChildReparentingController:self];

  v102 = [(ICNoteEditorBaseViewController *)self note];
  LODWORD(v100) = [v102 isNewNoteWithHashtagsInsertedIntoBody];

  if (v100)
  {
    -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", [MEMORY[0x263F5B4F8] noteDefaultNamedStyle]);
    v103 = [(ICNoteEditorBaseViewController *)self note];
    [v103 setIsNewNoteWithHashtagsInsertedIntoBody:0];
  }
  v104 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v105 = [v104 isEditable];
  v106 = [(ICTK2NoteEditorViewController *)self textView];
  [v106 setDisplayingEditableContent:v105];

  id v107 = objc_alloc(MEMORY[0x263F5B228]);
  v108 = [(ICNoteEditorBaseViewController *)self note];
  v109 = (void *)[v107 initWithNote:v108];
  [(ICNoteEditorViewController *)self setAttachmentInsertionController:v109];

  v110 = [(ICNoteEditorViewController *)self attachmentInsertionController];
  [v110 setAttachmentDelegate:self];

  v111 = [(ICNoteEditorViewController *)self attachmentInsertionController];
  v112 = [(ICTK2NoteEditorViewController *)self textController];
  [v112 setAttachmentInsertionController:v111];

  v113 = [ICVisualAssetImportController alloc];
  v114 = [(ICNoteEditorBaseViewController *)self note];
  v115 = [(ICTK2NoteEditorViewController *)self textView];
  v116 = [(ICVisualAssetImportController *)v113 initWithNote:v114 textView:v115];
  [(ICNoteEditorViewController *)self setVisualAssetImportController:v116];

  id v117 = objc_alloc(MEMORY[0x263F5AC88]);
  v118 = [(ICNoteEditorBaseViewController *)self note];
  v119 = (void *)[v117 initWithNote:v118];
  [(ICNoteEditorViewController *)self setMentionsController:v119];

  v120 = [(ICNoteEditorViewController *)self mentionsController];
  [v120 setAnalyticsDelegate:self];

  v121 = [(ICNoteEditorViewController *)self attachmentInsertionController];
  v122 = [(ICNoteEditorViewController *)self mentionsController];
  [v122 setAttachmentInsertionController:v121];

  v123 = [(ICNoteEditorViewController *)self mentionsController];
  v124 = [(ICTK2NoteEditorViewController *)self textController];
  [v124 setMentionsController:v123];

  v125 = [(ICTK2NoteEditorViewController *)self textView];
  v126 = [(ICNoteEditorViewController *)self mentionsController];
  [v126 setTextView:v125];

  id v127 = objc_alloc(MEMORY[0x263F5AC58]);
  v128 = [(ICNoteEditorBaseViewController *)self note];
  v129 = (void *)[v127 initWithNote:v128];
  [(ICNoteEditorViewController *)self setHashtagController:v129];

  v130 = [(ICNoteEditorViewController *)self hashtagController];
  [v130 setAnalyticsDelegate:self];

  v131 = [(ICTK2NoteEditorViewController *)self textView];
  v132 = [(ICNoteEditorViewController *)self hashtagController];
  [v132 setTextView:v131];

  v133 = [(ICNoteEditorViewController *)self attachmentInsertionController];
  v134 = [(ICNoteEditorViewController *)self hashtagController];
  [v134 setAttachmentInsertionController:v133];

  v135 = [(ICNoteEditorViewController *)self hashtagController];
  v136 = [(ICTK2NoteEditorViewController *)self textController];
  [v136 setHashtagController:v135];

  v137 = [ICLinkAcceleratorController alloc];
  v138 = [MEMORY[0x263F5ABD8] sharedConfiguration];
  v139 = [(ICLinkAcceleratorController *)v137 initWithCloudConfiguration:v138 mode:0];
  [(ICNoteEditorViewController *)self setLinkAcceleratorController:v139];

  v140 = [(ICNoteEditorViewController *)self linkAcceleratorController];
  [v140 setDelegate:self];

  v141 = [(ICNoteEditorViewController *)self linkAcceleratorController];
  [v141 setLinkDelegate:self];

  if (ICInternalSettingsIsNotesMathEnabled())
  {
    id v142 = objc_alloc(MEMORY[0x263F5B2B8]);
    v143 = [(ICNoteEditorBaseViewController *)self note];
    v144 = (void *)[v142 initWithNote:v143];
    [(ICNoteEditorViewController *)self setCalculateRecognitionController:v144];

    v145 = [(ICTK2NoteEditorViewController *)self textView];
    v146 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v146 setTextView:v145];

    v147 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    v148 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v148 setAttachmentInsertionController:v147];

    v149 = [(ICTK2NoteEditorViewController *)self textView];
    v150 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v150 setSuggestionsDelegate:v149];

    v151 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v152 = [v151 calculatePreviewBehavior];
    v153 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v153 setInsertsResults:v152 != 1];

    v154 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v155 = [v154 calculatePreviewBehavior];
    v156 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v156 setPreviewBehavior:v155];

    v157 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v157 addErrorInteraction];
  }
  if (ICInternalSettingsIsScrubbingEnabled())
  {
    id v158 = objc_alloc(MEMORY[0x263F5B2D0]);
    v159 = [(ICTK2NoteEditorViewController *)self textView];
    v160 = (void *)[v158 initWithTextView:v159];
    [(ICNoteEditorViewController *)self setCalculateScrubberController:v160];

    v161 = [(ICNoteEditorBaseViewController *)self note];
    v162 = [(ICNoteEditorViewController *)self calculateScrubberController];
    [v162 setNote:v161];
  }
  if (ICInternalSettingsIsGraphingEnabled())
  {
    id v163 = objc_alloc(MEMORY[0x263F5B2A8]);
    v164 = [(ICNoteEditorBaseViewController *)self note];
    v165 = (void *)[v163 initWithNote:v164];
    [(ICNoteEditorViewController *)self setCalculateGraphingController:v165];

    v166 = [(ICTK2NoteEditorViewController *)self textView];
    v167 = [(ICNoteEditorViewController *)self calculateGraphingController];
    [v167 setTextView:v166];

    v168 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    v169 = [(ICNoteEditorViewController *)self calculateGraphingController];
    [v169 setAttachmentInsertionController:v168];

    v170 = [(ICNoteEditorViewController *)self calculateScrubberController];
    v171 = [(ICNoteEditorViewController *)self calculateGraphingController];
    [v171 setScrubberController:v170];
  }
  v172 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:self action:sel_handleLeftOrRightSwipe_];
  [v172 setDirection:1];
  [v172 setDelegate:self];
  v173 = [(ICTK2NoteEditorViewController *)self textView];
  [v173 addGestureRecognizer:v172];

  v174 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:self action:sel_handleLeftOrRightSwipe_];
  [v174 setDirection:2];
  [v174 setDelegate:self];
  v175 = [(ICTK2NoteEditorViewController *)self textView];
  [v175 addGestureRecognizer:v174];

  v240[0] = v172;
  v240[1] = v174;
  v176 = [MEMORY[0x263EFF8C0] arrayWithObjects:v240 count:2];
  [(ICNoteEditorViewController *)self setSwipeGestureRecognizers:v176];

  objc_opt_class();
  v177 = [(ICTK2NoteEditorViewController *)self textView];
  v178 = [v177 textLayoutManager];
  v179 = ICCheckedDynamicCast();

  id v180 = objc_alloc(MEMORY[0x263F5B278]);
  v181 = [(ICNoteEditorBaseViewController *)self note];
  v182 = (void *)[v180 initWithNote:v181 textLayoutManager:v179];
  [(ICTK2NoteEditorViewController *)self setAuthorHighlightsController:v182];

  v183 = [(ICNoteEditorViewController *)self authorHighlightsController];
  v184 = [(ICTK2NoteEditorViewController *)self textController];
  [v184 setAuthorHighlightsController:v183];

  v185 = [ICAuthorHighlightsUpdater alloc];
  v186 = [(ICNoteEditorViewController *)self authorHighlightsController];
  v187 = [(ICAuthorHighlightsUpdater *)v185 initWithAuthorHighlightsController:v186 textLayoutManager:v179];
  [(ICNoteEditorViewController *)self setAuthorHighlightsUpdater:v187];

  v188 = [v179 highlightPatternRegexFinder];
  v189 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
  [v189 setSearchHighlightRegexFinder:v188];

  v190 = [(ICTK2NoteEditorViewController *)self textView];
  v191 = [v190 TTTextStorage];
  [v191 resetHighlightsAttributedString];

  v192 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
  LODWORD(v191) = [v192 hasHighlights];

  if (v191)
  {
    v193 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
    [v193 updateAnimated:0];
  }
  v235[0] = MEMORY[0x263EF8330];
  v235[1] = 3221225472;
  v235[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_4;
  v235[3] = &unk_2640BB268;
  objc_copyWeak(&v236, &location);
  v194 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  [v194 setRenderingAttributesProvider:v235];

  v195 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
  v196 = [(ICTK2NoteEditorViewController *)self attributionSidebarView];
  [v196 setAuthorHighlightsUpdater:v195];

  uint64_t v231 = 0;
  v232 = &v231;
  uint64_t v233 = 0x2020000000;
  char v234 = 0;
  uint64_t v227 = 0;
  v228 = &v227;
  uint64_t v229 = 0x2020000000;
  char v230 = 0;
  v197 = [(ICNoteEditorBaseViewController *)self note];
  v226[0] = MEMORY[0x263EF8330];
  v226[1] = 3221225472;
  v226[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_5;
  v226[3] = &unk_2640BB290;
  v226[4] = &v231;
  v226[5] = &v227;
  [v197 enumerateAttachmentsInOrderUsingBlock:v226];

  if (![MEMORY[0x263F5B468] isEnabled]
    || !*((unsigned char *)v228 + 24)
    && (*((unsigned char *)v232 + 24) || !ICInternalSettingsDefaultToPaperKitAttachments())
    || ([(ICNoteEditorBaseViewController *)self note],
        v198 = objc_claimAutoreleasedReturnValue(),
        char v199 = [v198 isUnsupported],
        v198,
        (v199 & 1) != 0))
  {
    v202 = [(ICTK2NoteEditorViewController *)self textView];
    [v202 setStylusDrawingEnabled:1];
LABEL_58:

    goto LABEL_59;
  }
  v200 = [(ICTK2NoteEditorViewController *)self textView];
  [v200 setPaperEnabled:1];

  if (*((unsigned char *)v232 + 24))
  {
    v201 = [(ICNoteEditorBaseViewController *)self note];
    v202 = [v201 managedObjectContext];

    if (v202)
    {
      v203 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
      v204 = [(ICNoteEditorBaseViewController *)self note];
      v205 = [(ICTK2NoteEditorViewController *)self textView];
      v206 = [(ICInlineDrawingUpgradeHelper *)v203 initWithNote:v204 managedObjectContext:v202 textView:v205];

      [(ICInlineDrawingUpgradeHelper *)v206 upgradeAllAttachmentsInNote];
    }
    goto LABEL_58;
  }
LABEL_59:
  v207 = [(ICTK2NoteEditorViewController *)self textView];
  [v207 setDrawingDelegate:self];

  [(ICNoteEditorViewController *)self updatePencilKitPaperStyleType];
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    v208 = [(ICTK2NoteEditorViewController *)self textView];
    v209 = objc_msgSend(v208, "ic_pkTiledView");
    [v209 setOverrideUserInterfaceStyle:1];
  }
  v210 = [(ICNoteEditorBaseViewController *)self note];
  v211 = [v210 calculateDocumentController];
  [v211 updateHighlights];

  dispatch_time_t v212 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_6;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_after(v212, MEMORY[0x263EF83A0], block);
  _Block_object_dispose(&v227, 8);
  _Block_object_dispose(&v231, 8);
  objc_destroyWeak(&v236);

  objc_destroyWeak(&v238);
  objc_destroyWeak(&location);
}

- (ICTK2TextView)tk2TextView
{
  return self->_tk2TextView;
}

- (id)textController
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v3 = [v2 tk2TextController];

  return v3;
}

- (void)setTk2TextView:(id)a3
{
}

- (void)setTk2AttributionSidebarController:(id)a3
{
}

- (void)setTextViewLeadingConstraint:(id)a3
{
}

- (id)attributionSidebarView
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v3 = [v2 attributionSidebarView];

  return v3;
}

- (void)renderAuthorHighlights
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  Class v3 = NSClassFromString(&cfstr_Uitextcontaine.isa);
  Class v4 = NSClassFromString(&cfstr_Uitextlayoutca.isa);
  uint64_t v5 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  char v6 = [v5 subviews];
  id v7 = objc_msgSend(v6, "ic_firstObjectOfClass:", v3);

  v8 = [v7 subviews];
  v9 = objc_msgSend(v8, "ic_firstObjectOfClass:", v4);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = objc_msgSend(v9, "subviews", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setNeedsDisplay];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) note];
  Class v3 = [v2 calculateDocumentController];
  [v3 scheduleUpdateAffectingChangeCounts:0 isHighPriority:1];

  id v5 = [*(id *)(a1 + 32) note];
  id v4 = (id)[v5 calculateAccessibilityController];
}

id __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v13);
  char v15 = [WeakRetained shouldRenderAuthorHighlights];

  if (v15)
  {
    id v16 = objc_loadWeakRetained(v13);
    long long v17 = [v16 authorHighlightsController];
    id v18 = objc_loadWeakRetained(v13);
    v19 = [v18 tk2TextView];
    objc_msgSend(v17, "attributesForHighlightingTextLineFragment:characterRange:defaultRenderingAttributes:effectiveRange:textView:", v11, a3, a4, v12, a6, v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = v12;
  }

  return v20;
}

- (BOOL)shouldRenderAuthorHighlights
{
  Class v3 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
  if ([v3 hasHighlights])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(ICNoteEditorBaseViewController *)self note];
    char v6 = [v5 calculateDocumentController];
    char v4 = [v6 hasExpressions];
  }
  return v4;
}

- (id)nibName
{
  return @"ICNoteEditorViewController";
}

- (void)setAuthorHighlightsController:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self authorHighlightsController];

  char v6 = (uint64_t *)MEMORY[0x263F5B050];
  if (v5)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *v6;
    v9 = [(ICNoteEditorViewController *)self authorHighlightsController];
    [v7 removeObserver:self name:v8 object:v9];
  }
  v14.receiver = self;
  v14.super_class = (Class)ICTK2NoteEditorViewController;
  [(ICNoteEditorViewController *)&v14 setAuthorHighlightsController:v4];
  v10 = [(ICNoteEditorViewController *)self authorHighlightsController];

  if (v10)
  {
    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v12 = *v6;
    uint64_t v13 = [(ICNoteEditorViewController *)self authorHighlightsController];
    [v11 addObserver:self selector:sel_authorHighlightsControllerDidPerformHighlightUpdates_ name:v12 object:v13];
  }
}

- (ICAttributionSidebarController)tk2AttributionSidebarController
{
  return self->_tk2AttributionSidebarController;
}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 attachmentType] == 10)
  {
    Class v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v4 = v6;
LABEL_6:
    *Class v3 = 1;
    goto LABEL_7;
  }
  BOOL v5 = [v6 attachmentType] == 13;
  id v4 = v6;
  if (v5)
  {
    Class v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    goto LABEL_6;
  }
LABEL_7:
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICTK2NoteEditorViewController;
  [(ICNoteEditorViewController *)&v4 viewDidLoad];
  Class v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_textStorageDidUpdateDataDetectionResults_ name:*MEMORY[0x263F5B1E8] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICTK2NoteEditorViewController;
  [(ICNoteEditorViewController *)&v7 viewWillDisappear:a3];
  objc_super v4 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  BOOL v5 = [v4 attributionSidebarView];
  [v5 unfocusAttributionDetails];

  id v6 = [(ICTK2NoteEditorViewController *)self attributionSidebarController];
  [v6 hideSidebarAnimated:0];
}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke(uint64_t a1, uint64_t a2, int a3, double a4, double a5)
{
  v10 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = [WeakRetained tk2TextView];
  uint64_t v13 = [v12 attributionSidebarView];

  id v14 = objc_loadWeakRetained(v10);
  char v15 = [v14 attributionSidebarOpenedDate];
  [v15 timeIntervalSinceNow];
  double v17 = v16;

  id v18 = [*(id *)(a1 + 32) attributionSidebarView];
  [v18 visibleContentWidth];
  if (a4 != 0.0 || v19 <= 0.0) {
    goto LABEL_7;
  }
  if (v17 < 0.0) {
    double v17 = -v17;
  }

  if (v17 > 2.0)
  {
    id v18 = [MEMORY[0x263EFF910] now];
    id v20 = objc_loadWeakRetained(v10);
    v21 = [v20 note];
    [v21 setLastAttributionsViewedDate:v18];

LABEL_7:
  }
  [v13 fullContentWidth];
  BOOL v23 = v22 == a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_2;
  aBlock[3] = &unk_2640BB1F0;
  objc_copyWeak(v35, v10);
  BOOL v36 = v23;
  v35[1] = *(id *)&a4;
  id v24 = v13;
  id v34 = v24;
  char v37 = a2;
  v25 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  [v24 setVisibleContentWidth:a2 isGestureActive:a4];
  if (a3)
  {
    double v26 = 1.0;
    if (a5 > 0.0)
    {
      [v24 visibleContentWidth];
      double v26 = (a4 - v27) / a5;
    }
    v28 = (void *)MEMORY[0x263F82E00];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_3;
    v31[3] = &unk_2640BB218;
    objc_copyWeak(v32, v10);
    v32[1] = *(id *)&a4;
    [v28 animateWithDuration:0 delay:v31 usingSpringWithDamping:v25 initialSpringVelocity:0.3 options:0.0 animations:0.65 completion:v26];
    objc_destroyWeak(v32);
  }
  else
  {
    id v29 = objc_loadWeakRetained(v10);
    v30 = [v29 textViewLeadingConstraint];
    [v30 setConstant:a4];

    v25[2](v25, 1);
  }

  objc_destroyWeak(v35);
}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = [WeakRetained textView];
  [v4 unclampTextView];

  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v5 = [MEMORY[0x263EFF910] now];
    id v6 = objc_loadWeakRetained(v2);
    [v6 setAttributionSidebarOpenedDate:v5];

    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    if (*(double *)(a1 + 48) != 0.0) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 32) reload];
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = v7;
    uint64_t v9 = 0;
  }
  [v7 setIgnoresTaps:v9];

LABEL_6:
  BOOL v10 = *(unsigned char *)(a1 + 57) == 0;
  id v12 = objc_loadWeakRetained(v2);
  id v11 = [v12 tk2TextView];
  [v11 setShowsVerticalScrollIndicator:v10];
}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = [WeakRetained textViewLeadingConstraint];
  [v4 setConstant:v1];

  id v6 = objc_loadWeakRetained(v2);
  BOOL v5 = [v6 view];
  [v5 layoutIfNeeded];
}

- (void)removeTextView
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  Class v3 = [(ICTK2NoteEditorViewController *)self textView];
  objc_super v4 = [v3 undoManager];

  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F08620] object:v4];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F08638] object:v4];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x263F08630] object:v4];

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self name:@"ICNoteEditorTitleEditingViewDidShowNotification" object:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(ICNoteEditorViewController *)self previousNote];
  BOOL v10 = [v9 allDocumentMergeControllers];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        double v16 = [(ICTK2NoteEditorViewController *)self textView];
        [v15 removeTextView:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  double v17 = [(ICTK2NoteEditorViewController *)self textView];
  [v17 setDelegate:0];

  id v18 = [(ICTK2NoteEditorViewController *)self textView];
  [v18 removeFromSuperview];
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  id v5 = a4;
  id v6 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  id v7 = [v6 icTextLayoutManager];
  uint64_t v8 = [v5 identifier];

  uint64_t v9 = [v7 existingAttachmentViewForIdentifier:v8];

  BOOL v10 = [v9 superview];
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)textView:(id)a3 isEndOfDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 beginningOfDocument];
  unint64_t v9 = [v6 offsetFromPosition:v8 toPosition:v7];

  BOOL v10 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v11 = [v10 textContentStorage];
  id v12 = [v11 outlineController];
  uint64_t v13 = [v12 visibleRange];
  uint64_t v15 = v14;

  if (v9 >= v15 + v13 - 1)
  {
    char v17 = 1;
  }
  else
  {
    double v16 = [v6 endOfDocument];
    char v17 = [v7 isEqual:v16];
  }
  return v17;
}

- (void)acceleratorOriginNeedsUpdate
{
  Class v3 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  id v26 = [v3 selectedTextRange];

  objc_super v4 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  id v5 = [v26 end];
  [v4 caretRectForPosition:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v15 = [(ICTK2NoteEditorViewController *)self view];
  double v16 = [v15 window];
  objc_msgSend(v14, "convertRect:toView:", v16, v7, v9, v11, v13);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = [(ICNoteEditorViewController *)self linkAcceleratorController];
  objc_msgSend(v25, "updateAcceleratorOriginWith:", v18, v20, v22, v24);
}

- (BOOL)languageHasSpaces
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  char v3 = [v2 languageHasSpaces];

  return v3;
}

- (int64_t)writingDirection
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  int64_t v3 = objc_msgSend(v2, "ic_currentWritingDirection");

  return v3;
}

- (_NSRange)lastSelectedRangeForAccelerator
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v3 = [v2 selectedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.id location = v6;
  return result;
}

- (int64_t)uniqueCollapsibleSectionAffordanceExposures
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v3 = [v2 outlineRenderer];
  int64_t v4 = [v3 collapsibleSectionAffordanceExposures];

  return v4;
}

- (int64_t)uniqueCollapsibleSectionAffordanceUsages
{
  v2 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  uint64_t v3 = [v2 outlineRenderer];
  int64_t v4 = [v3 collapsibleSectionAffordanceUsages];

  return v4;
}

- (void)resetCollapsibleSectionAffordanceUsageData
{
  id v3 = [(ICTK2NoteEditorViewController *)self tk2TextView];
  v2 = [v3 outlineRenderer];
  [v2 resetCollapsibleSectionsAffordanceUsageData];
}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (NSDate)attributionSidebarOpenedDate
{
  return self->_attributionSidebarOpenedDate;
}

- (void)setAttributionSidebarOpenedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarOpenedDate, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_tk2AttributionSidebarController, 0);

  objc_storeStrong((id *)&self->_tk2TextView, 0);
}

@end