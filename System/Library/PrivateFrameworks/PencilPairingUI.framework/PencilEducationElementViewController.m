@interface PencilEducationElementViewController
+ (id)keyPathsForValuesAffectingAnimationInProgress;
- (BOOL)_canShowWhileLocked;
- (BOOL)_pkScribbleInteractionShouldDisableInputAssistant:(id)a3;
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)didDisappear;
- (BOOL)didRunInitialAppearActions;
- (BOOL)hasCustomHeightRatioForAnimationType:(int64_t)a3;
- (BOOL)hasCustomWidthRatioForAnimationType:(int64_t)a3;
- (BOOL)hasPencilInteraction;
- (BOOL)hasRemainingAnimation;
- (BOOL)isAnimating;
- (BOOL)isRunningAnimationSequence;
- (BOOL)isSecondaryAnimationForType:(int64_t)a3;
- (BOOL)isTextAddedForAnimationType:(int64_t)a3;
- (BOOL)isTextFieldRTL;
- (BOOL)isUIRTL;
- (CGAffineTransform)applyLocalizationScaleOffsetsIfNecesssaryForDrawing:(SEL)a3 animationType:(id)a4 transform:(int64_t)a5;
- (CGAffineTransform)transformDrawing:(SEL)a3 toFitBounds:(id)a4 dimension:(CGRect)a5 offset:(int64_t)a6 animationType:(CGPoint)a7;
- (CGAffineTransform)transformForAnimationType:(SEL)a3 drawing:(int64_t)a4 bounds:(id)a5;
- (CGPoint)offsetForAnimationType:(int64_t)a3;
- (CGRect)textFieldBoundsForRange:(_NSRange)a3;
- (NSDictionary)localizationOffsetDictionary;
- (NSMutableArray)animationQueue;
- (NSString)processedString;
- (PKDrawingReplayController)delayDrawingReplayController;
- (PKDrawingReplayController)drawingReplayController;
- (PKPencilEducationOffset)localizationOffsetsForAnimationType:(int64_t)a3;
- (PKTextInputInteraction)textInputInteraction;
- (PKTextInputSettings)textInputSettings;
- (PencilEducationElementData)elementData;
- (PencilEducationElementTextField)textField;
- (PencilEducationElementViewController)initWithElementData:(id)a3;
- (PencilEducationElementViewControllerDelegate)delegate;
- (UIButton)replayButton;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (UITextCursorAssertion)cursorAssertion;
- (_NSRange)textRangeForAnimationType:(int64_t)a3;
- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3;
- (double)customHeightRatioForAnimationType:(int64_t)a3;
- (double)customWidthRatioForAnimationType:(int64_t)a3;
- (double)nextAnimationDelayForAnimationType:(int64_t)a3;
- (double)scaleRatioForAnimationType:(int64_t)a3;
- (double)speedRatioForAnimationType:(int64_t)a3;
- (id)allowedCalloutActionsForType:(int64_t)a3;
- (id)defaultAllowedCalloutActions;
- (id)drawingForAnimationType:(int64_t)a3;
- (id)endWritingCompletionBlock;
- (id)localizationOffsetKeyForAnimationType:(int64_t)a3;
- (id)replacePlaceholdersInString:(id)a3;
- (int64_t)inProgressAnimationType;
- (int64_t)transformDimensionAnimationType:(int64_t)a3;
- (int64_t)type;
- (unint64_t)performAnimationAsyncIndex;
- (unint64_t)replayButtonHiddenIndex;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)beginAnimationIfNecessary;
- (void)cancelAnimation;
- (void)cancelPendingReplayHiddenCommands;
- (void)handleEndAnimation;
- (void)reloadAnimationQueue;
- (void)reloadStrings;
- (void)replayButtonPressed:(id)a3;
- (void)setAnimationQueue:(id)a3;
- (void)setCursorAssertion:(id)a3;
- (void)setDelayDrawingReplayController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDisappear:(BOOL)a3;
- (void)setDidRunInitialAppearActions:(BOOL)a3;
- (void)setDrawingReplayController:(id)a3;
- (void)setElementData:(id)a3;
- (void)setEndWritingCompletionBlock:(id)a3;
- (void)setHasPencilInteraction:(BOOL)a3;
- (void)setInProgressAnimationType:(int64_t)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsRunningAnimationSequence:(BOOL)a3;
- (void)setIsTextFieldRTL:(BOOL)a3;
- (void)setLocalizationOffsetDictionary:(id)a3;
- (void)setPerformAnimationAsyncIndex:(unint64_t)a3;
- (void)setProcessedString:(id)a3;
- (void)setReplayButton:(id)a3;
- (void)setReplayButtonHiddenIndex:(unint64_t)a3;
- (void)setStackView:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextInputSettings:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateIsAnimatingUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PencilEducationElementViewController

- (PencilEducationElementViewController)initWithElementData:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PencilEducationElementViewController;
  v6 = [(PencilEducationElementViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementData, a3);
    v8 = [v5 textContent];
    uint64_t v9 = [(PencilEducationElementViewController *)v7 replacePlaceholdersInString:v8];
    processedString = v7->_processedString;
    v7->_processedString = (NSString *)v9;
  }
  return v7;
}

- (void)viewDidLoad
{
  v103.receiver = self;
  v103.super_class = (Class)PencilEducationElementViewController;
  [(PencilEducationElementViewController *)&v103 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v3 setAlignment:3];
  [v3 setAxis:1];
  [v3 setSpacing:15.0];
  id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v102 = v4;
  id v5 = [v4 heightAnchor];
  v6 = [v5 constraintEqualToConstant:42.0];
  [v6 setActive:1];

  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v7 setNumberOfLines:0];
  [v7 setTextAlignment:1];
  v8 = (void *)MEMORY[0x263F81708];
  uint64_t v9 = *MEMORY[0x263F1D260];
  v10 = [(PencilEducationElementViewController *)self traitCollection];
  uint64_t v96 = v9;
  uint64_t v11 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v10];

  v100 = (void *)v11;
  [v7 setFont:v11];
  id v12 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v101 = v12;
  v13 = [v12 heightAnchor];
  v14 = [v13 constraintEqualToConstant:27.0];
  [v14 setActive:1];

  v15 = objc_alloc_init(PencilEducationElementTextField);
  [(PencilEducationElementTextField *)v15 setBorderStyle:3];
  [(PencilEducationElementTextField *)v15 _setRoundedRectBackgroundCornerRadius:10.0];
  v16 = (void *)MEMORY[0x263EFF960];
  v17 = [(PencilEducationElementViewController *)self elementData];
  v18 = [v17 languageID];
  v19 = [v16 localeWithLocaleIdentifier:v18];

  v20 = (void *)MEMORY[0x263F81658];
  v99 = v19;
  v21 = [v19 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v22 = [v20 defaultWritingDirectionForLanguage:v21];

  v23 = [(PencilEducationElementViewController *)self elementData];
  v24 = [v23 languageID];
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = PKLocalizedDrawingBundleForLanguage(v24, v25);

  v27 = [(PencilEducationElementViewController *)self elementData];
  v28 = [v27 languageID];
  v98 = v26;
  v29 = [v26 URLForResource:@"localizationOffsets" withExtension:@"plist" subdirectory:0 localization:v28];

  if (v29
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v30 = objc_claimAutoreleasedReturnValue(),
        [v30 URLForResource:@"localizationOffsets" withExtension:@"plist"],
        v29 = objc_claimAutoreleasedReturnValue(),
        v30,
        v29))
  {
    v31 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v29 error:0];
    [(PencilEducationElementViewController *)self setLocalizationOffsetDictionary:v31];
  }
  BOOL v32 = v22 == 1;
  BOOL v33 = v22 == 1;
  if (v32) {
    uint64_t v34 = 4;
  }
  else {
    uint64_t v34 = 3;
  }
  [(PencilEducationElementTextField *)v15 setSemanticContentAttribute:v34];
  [(PencilEducationElementTextField *)v15 setTextAlignment:2 * v33];
  [(PencilEducationElementViewController *)self setIsTextFieldRTL:v33];
  id v35 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  v93 = v35;
  v36 = [v35 heightAnchor];
  v37 = [v36 constraintEqualToConstant:6.0];
  [v37 setActive:1];

  id v38 = objc_alloc_init(MEMORY[0x263F1C488]);
  v39 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.counterclockwise"];
  [v38 setImage:v39 forState:0];

  v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v41 = [v40 localizedStringForKey:@"REPLAY_BUTTON_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  [v38 setTitle:v41 forState:0];

  v42 = [(PencilEducationElementViewController *)self view];
  v43 = [v42 tintColor];
  [v38 setTitleColor:v43 forState:0];

  v97 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v96 variant:1024];
  v44 = [v38 titleLabel];
  [v44 setFont:v97];

  uint64_t v45 = [MEMORY[0x263F1C6C8] configurationWithFont:v97 scale:-1];
  v95 = (void *)v45;
  BOOL v46 = [(PencilEducationElementViewController *)self isUIRTL];
  double v47 = 7.0;
  if (!v46) {
    double v47 = -7.0;
  }
  objc_msgSend(v38, "setImageEdgeInsets:", 0.0, v47, 0.0, 0.0);
  [v38 setPreferredSymbolConfiguration:v45 forImageInState:0];
  [v38 addTarget:self action:sel_replayButtonPressed_ forControlEvents:64];
  [v38 setHidden:1];
  id v48 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  v49 = [v48 heightAnchor];
  v50 = [v49 constraintGreaterThanOrEqualToConstant:5.0];
  [v50 setActive:1];

  id v94 = objc_alloc_init(MEMORY[0x263F14BA0]);
  [v94 setDelegate:self];
  [(PencilEducationElementTextField *)v15 addInteraction:v94];
  [v3 addArrangedSubview:v102];
  [v3 addArrangedSubview:v7];
  objc_msgSend(v3, "addArrangedSubview:");
  [v3 addArrangedSubview:v15];
  [v3 addArrangedSubview:v35];
  [v3 addArrangedSubview:v38];
  [v3 addArrangedSubview:v48];
  v51 = [(PencilEducationElementViewController *)self view];
  [v51 addSubview:v3];

  v52 = [v102 widthAnchor];
  v53 = [v3 widthAnchor];
  v54 = [v52 constraintEqualToAnchor:v53 multiplier:1.0];
  [v54 setActive:1];

  v55 = [v101 widthAnchor];
  v56 = [v3 widthAnchor];
  v57 = [v55 constraintEqualToAnchor:v56 multiplier:1.0];
  [v57 setActive:1];

  v58 = [v48 widthAnchor];
  v59 = [v3 widthAnchor];
  v60 = [v58 constraintEqualToAnchor:v59 multiplier:1.0];
  [v60 setActive:1];

  v61 = [v38 widthAnchor];
  v62 = [v3 widthAnchor];
  v63 = [v61 constraintEqualToAnchor:v62 multiplier:1.0];
  [v63 setActive:1];

  LODWORD(v64) = 1148846080;
  [v7 setContentHuggingPriority:1 forAxis:v64];
  LODWORD(v65) = 1148846080;
  [(PencilEducationElementTextField *)v15 setContentHuggingPriority:1 forAxis:v65];
  v66 = [(PencilEducationElementTextField *)v15 heightAnchor];
  v67 = [v66 constraintEqualToConstant:44.0];
  [v67 setActive:1];

  v68 = [(PencilEducationElementTextField *)v15 widthAnchor];
  v69 = [v3 widthAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  [v70 setActive:1];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v71 = [v3 leadingAnchor];
  v72 = [(PencilEducationElementViewController *)self view];
  v73 = [v72 leadingAnchor];
  v74 = [v71 constraintEqualToAnchor:v73];
  [v74 setActive:1];

  v75 = [v3 trailingAnchor];
  v76 = [(PencilEducationElementViewController *)self view];
  v77 = [v76 trailingAnchor];
  v78 = [v75 constraintEqualToAnchor:v77];
  [v78 setActive:1];

  v79 = [v3 topAnchor];
  v80 = [(PencilEducationElementViewController *)self view];
  v81 = [v80 topAnchor];
  v82 = [v79 constraintEqualToAnchor:v81];
  [v82 setActive:1];

  v83 = [v3 bottomAnchor];
  v84 = [(PencilEducationElementViewController *)self view];
  v85 = [v84 bottomAnchor];
  v86 = [v83 constraintEqualToAnchor:v85];
  [v86 setActive:1];

  LODWORD(v87) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v87];
  LODWORD(v88) = 1148846080;
  [v7 setContentCompressionResistancePriority:1 forAxis:v88];
  LODWORD(v89) = 1148846080;
  [(PencilEducationElementTextField *)v15 setContentCompressionResistancePriority:1 forAxis:v89];
  [(PencilEducationElementViewController *)self setTitleLabel:v7];
  [(PencilEducationElementViewController *)self setTextField:v15];
  [(PencilEducationElementViewController *)self setReplayButton:v38];
  [(PencilEducationElementViewController *)self setStackView:v3];
  id v90 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(PencilEducationElementViewController *)self setAnimationQueue:v90];

  [(PencilEducationElementViewController *)self reloadStrings];
  [(PencilEducationElementViewController *)self reloadAnimationQueue];
  id v91 = objc_alloc_init(MEMORY[0x263F14BF0]);
  [(PencilEducationElementViewController *)self setTextInputSettings:v91];

  v92 = [(PencilEducationElementViewController *)self textInputSettings];
  [v92 loadSettingsFromUserDefaults];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PencilEducationElementViewController;
  [(PencilEducationElementViewController *)&v6 viewWillAppear:a3];
  if (![(PencilEducationElementViewController *)self didRunInitialAppearActions]
    || [(PencilEducationElementViewController *)self didDisappear])
  {
    [(PencilEducationElementViewController *)self setDidRunInitialAppearActions:1];
    [(PencilEducationElementViewController *)self setDidDisappear:0];
    [(PencilEducationElementViewController *)self reloadStrings];
    [(PencilEducationElementViewController *)self reloadAnimationQueue];
    [(PencilEducationElementViewController *)self cancelPendingReplayHiddenCommands];
    id v4 = [(PencilEducationElementViewController *)self replayButton];
    [v4 setHidden:1];

    id v5 = [(PencilEducationElementViewController *)self textField];
    [v5 setEnabled:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PencilEducationElementViewController;
  [(PencilEducationElementViewController *)&v4 viewWillDisappear:a3];
  [(PencilEducationElementViewController *)self cancelAnimation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PencilEducationElementViewController;
  [(PencilEducationElementViewController *)&v6 viewDidDisappear:a3];
  [(PencilEducationElementViewController *)self cancelPendingReplayHiddenCommands];
  objc_super v4 = [(PencilEducationElementViewController *)self replayButton];
  [v4 setHidden:1];

  id v5 = [(PencilEducationElementViewController *)self textField];
  [v5 setEnabled:0];

  [(PencilEducationElementViewController *)self setDidDisappear:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PencilEducationElementViewController;
  [(PencilEducationElementViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(PencilEducationElementViewController *)self delegate];
  [v4 elementControllerDidAppear:self];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(PencilEducationElementViewController *)self cancelAnimation];
  v8.receiver = self;
  v8.super_class = (Class)PencilEducationElementViewController;
  -[PencilEducationElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3
{
  objc_super v5 = [(PencilEducationElementViewController *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(PencilEducationElementViewController *)self replayButton];
  uint64_t v15 = [v14 isHidden];

  [(PencilEducationElementViewController *)self cancelPendingReplayHiddenCommands];
  v16 = [(PencilEducationElementViewController *)self replayButton];
  [v16 setHidden:0];

  v17 = [(PencilEducationElementViewController *)self view];
  objc_msgSend(v17, "setFrame:", v7, v9, a3, v13);

  v18 = [(PencilEducationElementViewController *)self view];
  [v18 layoutIfNeeded];

  v19 = [(PencilEducationElementViewController *)self stackView];
  objc_msgSend(v19, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
  double v21 = v20;

  [(PencilEducationElementViewController *)self cancelPendingReplayHiddenCommands];
  uint64_t v22 = [(PencilEducationElementViewController *)self replayButton];
  [v22 setHidden:v15];

  v23 = [(PencilEducationElementViewController *)self view];
  objc_msgSend(v23, "setFrame:", v7, v9, v11, v13);

  return v21;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadStrings
{
  id v3 = [(PencilEducationElementViewController *)self elementData];
  objc_super v4 = [v3 title];
  objc_super v5 = [(PencilEducationElementViewController *)self titleLabel];
  [v5 setText:v4];

  double v6 = [(PencilEducationElementViewController *)self processedString];
  double v7 = [(PencilEducationElementViewController *)self textField];
  [v7 setText:v6];

  double v8 = [(PencilEducationElementViewController *)self textField];
  objc_msgSend(v8, "setSelectionRange:", 0, 0);

  id v11 = [(PencilEducationElementViewController *)self elementData];
  double v9 = [v11 placeholderTextContent];
  double v10 = [(PencilEducationElementViewController *)self textField];
  [v10 setPlaceholder:v9];
}

- (void)reloadAnimationQueue
{
  id v8 = [(PencilEducationElementViewController *)self animationQueue];
  [v8 removeAllObjects];
  id v3 = [(PencilEducationElementViewController *)self elementData];
  uint64_t v4 = [v3 type];

  objc_super v5 = &unk_26ECE7720;
  switch(v4)
  {
    case 0:
      goto LABEL_6;
    case 1:
      objc_super v5 = &unk_26ECE7738;
      goto LABEL_6;
    case 2:
      [v8 addObject:&unk_26ECE7750];
      [v8 addObject:&unk_26ECE7768];
      objc_super v5 = &unk_26ECE7780;
      goto LABEL_6;
    case 3:
      [v8 addObject:&unk_26ECE77C8];
      objc_super v5 = &unk_26ECE77E0;
      goto LABEL_6;
    case 4:
      [v8 addObject:&unk_26ECE7798];
      objc_super v5 = &unk_26ECE77B0;
LABEL_6:
      [v8 addObject:v5];
      break;
    default:
      break;
  }
  double v6 = objc_msgSend(v8, "reverseObjectEnumerator", v5);
  double v7 = [v6 allObjects];

  [v8 removeAllObjects];
  [v8 addObjectsFromArray:v7];
}

- (void)beginAnimationIfNecessary
{
  id v3 = [(PencilEducationElementViewController *)self animationQueue];
  uint64_t v4 = [v3 lastObject];
  objc_super v5 = (void *)[v4 unsignedIntegerValue];

  BOOL v6 = [(PencilEducationElementViewController *)self isSecondaryAnimationForType:v5];
  double v7 = (void *)MEMORY[0x263F14B00];
  id v8 = [(PencilEducationElementViewController *)self view];
  double v9 = [v8 window];
  LODWORD(v7) = [v7 isDrawingInProgressForWindow:v9];

  if (!v7 || v6)
  {
    if (![(PencilEducationElementViewController *)self isAnimating]
      && [(PencilEducationElementViewController *)self hasRemainingAnimation])
    {
      [(PencilEducationElementViewController *)self setIsAnimating:1];
      [(PencilEducationElementViewController *)self setIsRunningAnimationSequence:1];
      [(PencilEducationElementViewController *)self setInProgressAnimationType:v5];
      double v10 = [(PencilEducationElementViewController *)self animationQueue];
      [v10 removeLastObject];

      id v11 = [(PencilEducationElementViewController *)self drawingForAnimationType:v5];
      objc_initWeak(location, self);
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke;
      v55[3] = &unk_264DA5968;
      id v48 = v56;
      objc_copyWeak(v56, location);
      v56[1] = v5;
      [(PencilEducationElementViewController *)self setEndWritingCompletionBlock:v55];
      if (v11)
      {
        uint64_t v12 = -[PencilEducationElementViewController textRangeForAnimationType:](self, "textRangeForAnimationType:", v5, v56);
        uint64_t v14 = v13;
        [(PencilEducationElementViewController *)self offsetForAnimationType:v5];
        double v16 = v15;
        double v18 = v17;
        -[PencilEducationElementViewController textFieldBoundsForRange:](self, "textFieldBoundsForRange:", v12, v14);
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        [(PencilEducationElementViewController *)self speedRatioForAnimationType:v5];
        double v28 = v27;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        -[PencilEducationElementViewController transformForAnimationType:drawing:bounds:](self, "transformForAnimationType:drawing:bounds:", v5, v11, v20, v22, v24, v26);
        id v29 = objc_alloc(MEMORY[0x263F14B00]);
        v30 = [(PencilEducationElementViewController *)self textField];
        v51[0] = v52;
        v51[1] = v53;
        v51[2] = v54;
        v31 = (void *)[v29 initWithDrawing:v11 transform:v51 sourceTextField:v30];

        [v31 setSpeedRatio:v28];
        [(PencilEducationElementViewController *)self setDrawingReplayController:v31];
        if (!v5)
        {
          BOOL v32 = [(PencilEducationElementViewController *)self textField];
          [v32 setIgnoreScribbleInsertText:1];

          BOOL v33 = [(PencilEducationElementViewController *)self textField];
          uint64_t v34 = [v33 _textInteraction];
          id v35 = [v34 _assertionController];
          v36 = [v35 nonBlinkingAssertionWithReason:@"add_text_replay"];
          [(PencilEducationElementViewController *)self setCursorAssertion:v36];
        }
        v37 = [(PencilEducationElementViewController *)self allowedCalloutActionsForType:v5];
        id v38 = [(PencilEducationElementViewController *)self textField];
        [v38 setAllowedCalloutActions:v37];

        v39 = [(PencilEducationElementViewController *)self drawingReplayController];
        objc_msgSend(v39, "beginDrawingAnimationAtRange:offset:completion:", v12, v14, 0, v16, v18);
      }
      else if (v5 == (void *)8)
      {
        BOOL v46 = [(PencilEducationElementViewController *)self textField];
        objc_msgSend(v46, "setSelectionRange:", 0, 0);

        id WeakRetained = objc_loadWeakRetained(location);
        [WeakRetained handleEndAnimation];
      }
      else if (v5 == (void *)4)
      {
        v40 = [(PencilEducationElementViewController *)self drawingReplayController];
        [v40 cancel];

        uint64_t v41 = [(PencilEducationElementViewController *)self textRangeForAnimationType:4];
        v42 = [(PencilEducationElementViewController *)self textField];
        objc_msgSend(v42, "setSelectionRange:", v41, 0);

        id v43 = objc_alloc(MEMORY[0x263F14B00]);
        v44 = [(PencilEducationElementViewController *)self textField];
        uint64_t v45 = (void *)[v43 initWithSourceTextField:v44];

        [(PencilEducationElementViewController *)self setDrawingReplayController:v45];
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_3;
        v49[3] = &unk_264DA5990;
        objc_copyWeak(&v50, location);
        objc_msgSend(v45, "beginInsertTextAnimationAtIndex:offset:completion:", v41, v49, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
        objc_destroyWeak(&v50);
      }
      objc_destroyWeak(v48);
      objc_destroyWeak(location);
    }
  }
  else
  {
    [(PencilEducationElementViewController *)self cancelAnimation];
  }
}

void __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (!v7)
      {
        id v8 = [WeakRetained textField];
        [v8 setIgnoreScribbleInsertText:0];

        double v9 = [v6 textField];
        [v9 setText:&stru_26ECD9920];

        uint64_t v7 = *(void *)(a1 + 40);
      }
      if (v7 != 3)
      {
        double v10 = [v6 textField];
        [v10 resignFirstResponder];
      }
      id v11 = [v6 cursorAssertion];
      [v11 invalidate];

      [v6 nextAnimationDelayForAnimationType:*(void *)(a1 + 40)];
      double v13 = v12;
      uint64_t v14 = (void *)([v6 performAnimationAsyncIndex] + 1);
      [v6 setPerformAnimationAsyncIndex:v14];
      objc_msgSend(v6, "setIsRunningAnimationSequence:", objc_msgSend(v6, "hasRemainingAnimation"));
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_2;
      block[3] = &unk_264DA5940;
      objc_copyWeak(v17, v4);
      v17[1] = v14;
      block[4] = v6;
      dispatch_after(v15, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(v17);
    }
    [v6 setIsAnimating:0];
    objc_msgSend(v6, "setIsRunningAnimationSequence:", objc_msgSend(v6, "hasRemainingAnimation"));
  }
}

void __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained performAnimationAsyncIndex] == *(void *)(a1 + 48)) {
    [WeakRetained beginAnimationIfNecessary];
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "setIsRunningAnimationSequence:", objc_msgSend(*(id *)(a1 + 32), "hasRemainingAnimation"));
  }
}

void __65__PencilEducationElementViewController_beginAnimationIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleEndAnimation];
}

- (void)handleEndAnimation
{
  id v3 = [(PencilEducationElementViewController *)self endWritingCompletionBlock];

  if (v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = [(PencilEducationElementViewController *)self textInputSettings];
    [v4 textInputStrokeFadeOutDelay];
    double v6 = v5;

    uint64_t v7 = (void *)([(PencilEducationElementViewController *)self performAnimationAsyncIndex]
                + 1);
    [(PencilEducationElementViewController *)self setPerformAnimationAsyncIndex:v7];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PencilEducationElementViewController_handleEndAnimation__block_invoke;
    block[3] = &unk_264DA59B8;
    objc_copyWeak(v11, &location);
    v11[1] = v7;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v9 = [(PencilEducationElementViewController *)self hasRemainingAnimation];
    [(PencilEducationElementViewController *)self setIsRunningAnimationSequence:v9];
  }
}

void __58__PencilEducationElementViewController_handleEndAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained performAnimationAsyncIndex] == *(void *)(a1 + 40))
  {
    v2 = [WeakRetained endWritingCompletionBlock];
    v2[2](v2, 1);

    [WeakRetained setEndWritingCompletionBlock:0];
    objc_msgSend(WeakRetained, "setIsRunningAnimationSequence:", objc_msgSend(WeakRetained, "hasRemainingAnimation"));
  }
}

- (BOOL)hasRemainingAnimation
{
  v2 = [(PencilEducationElementViewController *)self animationQueue];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)type
{
  v2 = [(PencilEducationElementViewController *)self elementData];
  int64_t v3 = [v2 type];

  return v3;
}

- (void)replayButtonPressed:(id)a3
{
  uint64_t v4 = [(PencilEducationElementViewController *)self delegate];
  [v4 elementControllerWillReplay:self];

  double v5 = [(PencilEducationElementViewController *)self replayButton];
  [v5 setHidden:1];

  double v6 = [(PencilEducationElementViewController *)self textField];
  [v6 resignFirstResponder];

  [(PencilEducationElementViewController *)self cancelAnimation];
  [(PencilEducationElementViewController *)self reloadStrings];
  [(PencilEducationElementViewController *)self reloadAnimationQueue];
  uint64_t v7 = (void *)([(PencilEducationElementViewController *)self performAnimationAsyncIndex]
              + 1);
  [(PencilEducationElementViewController *)self setPerformAnimationAsyncIndex:v7];
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PencilEducationElementViewController_replayButtonPressed___block_invoke;
  block[3] = &unk_264DA59B8;
  objc_copyWeak(v10, &location);
  v10[1] = v7;
  dispatch_after(v8, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __60__PencilEducationElementViewController_replayButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained performAnimationAsyncIndex] == *(void *)(a1 + 40)) {
    [WeakRetained beginAnimationIfNecessary];
  }
}

- (void)cancelPendingReplayHiddenCommands
{
  unint64_t v3 = [(PencilEducationElementViewController *)self replayButtonHiddenIndex] + 1;
  [(PencilEducationElementViewController *)self setReplayButtonHiddenIndex:v3];
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    [(PencilEducationElementViewController *)self setHasPencilInteraction:0];
    [(PencilEducationElementViewController *)self updateIsAnimatingUI];
  }
}

- (void)setIsRunningAnimationSequence:(BOOL)a3
{
  if (self->_isRunningAnimationSequence != a3)
  {
    self->_isRunningAnimationSequence = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x263F14B00]);
      id v6 = [(PencilEducationElementViewController *)self textField];
      double v5 = (void *)[v4 initWithSourceTextField:v6];
      [(PencilEducationElementViewController *)self setDelayDrawingReplayController:v5];
    }
    else
    {
      [(PencilEducationElementViewController *)self setDelayDrawingReplayController:0];
    }
  }
}

- (void)setDelayDrawingReplayController:(id)a3
{
  id v5 = a3;
  p_delayDrawingReplayController = (id *)&self->_delayDrawingReplayController;
  id v7 = *p_delayDrawingReplayController;
  if (*p_delayDrawingReplayController != v5)
  {
    id v8 = v5;
    [v7 setDisablePencilInput:0];
    objc_storeStrong(p_delayDrawingReplayController, a3);
    id v7 = (id)[*p_delayDrawingReplayController setDisablePencilInput:1];
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v7, v5);
}

- (void)updateIsAnimatingUI
{
  if ([(PencilEducationElementViewController *)self isAnimating]
    || [(PencilEducationElementViewController *)self hasRemainingAnimation])
  {
    [(PencilEducationElementViewController *)self cancelPendingReplayHiddenCommands];
    id v8 = [(PencilEducationElementViewController *)self replayButton];
    [v8 setHidden:1];
  }
  else
  {
    unint64_t v3 = [(PencilEducationElementViewController *)self replayButtonHiddenIndex] + 1;
    [(PencilEducationElementViewController *)self setReplayButtonHiddenIndex:v3];
    id v4 = [(PencilEducationElementViewController *)self replayButton];
    if ([(PencilEducationElementViewController *)self replayButtonHiddenIndex] == v3)
    {
      if ([v4 isHidden])
      {
        [v4 setAlpha:0.0];
        [v4 setHidden:0];
        id v5 = (void *)MEMORY[0x263F1CB60];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __59__PencilEducationElementViewController_updateIsAnimatingUI__block_invoke;
        v9[3] = &unk_264DA56A0;
        id v10 = v4;
        [v5 animateWithDuration:v9 animations:0.25];
      }
      id v6 = [(PencilEducationElementViewController *)self defaultAllowedCalloutActions];
      id v7 = [(PencilEducationElementViewController *)self textField];
      [v7 setAllowedCalloutActions:v6];
    }
  }
}

uint64_t __59__PencilEducationElementViewController_updateIsAnimatingUI__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

+ (id)keyPathsForValuesAffectingAnimationInProgress
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"isRunningAnimationSequence", 0);
}

- (void)cancelAnimation
{
  unint64_t v3 = [(PencilEducationElementViewController *)self drawingReplayController];
  [v3 cancel];

  [(PencilEducationElementViewController *)self setDrawingReplayController:0];
  [(PencilEducationElementViewController *)self setEndWritingCompletionBlock:0];
  id v4 = [(PencilEducationElementViewController *)self animationQueue];
  [v4 removeAllObjects];

  [(PencilEducationElementViewController *)self setIsAnimating:0];
  [(PencilEducationElementViewController *)self setIsRunningAnimationSequence:0];
  [(PencilEducationElementViewController *)self updateIsAnimatingUI];
  unint64_t v5 = [(PencilEducationElementViewController *)self performAnimationAsyncIndex] + 1;
  [(PencilEducationElementViewController *)self setPerformAnimationAsyncIndex:v5];
}

- (id)drawingForAnimationType:(int64_t)a3
{
  if (unint64_t)a3 <= 7 && ((0xEFu >> a3))
  {
    unint64_t v5 = off_264DA5A00[a3];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [(PencilEducationElementViewController *)self elementData];
    id v8 = [v7 languageID];
    BOOL v9 = PKLocalizedDrawingBundleForLanguage(v8, v6);

    id v10 = [(PencilEducationElementViewController *)self elementData];
    id v11 = [v10 languageID];
    double v12 = [v9 URLForResource:v5 withExtension:@"pkdrawingdata" subdirectory:0 localization:v11];

    if (!v12)
    {
      double v12 = [v6 URLForResource:v5 withExtension:@"pkdrawingdata"];
    }
    double v13 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v12];
    uint64_t v15 = 0;
    unint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F14AE0]) initWithData:v13 error:&v15];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)replacePlaceholdersInString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v3 length];

  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 17);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"{", v6, 0, 0, v5);

  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 18);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"}", v7, 0, 0, v5);

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 19);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"[", v8, 0, 0, v5);

  BOOL v9 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 20);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"]", v9, 0, 0, v5);

  id v10 = (void *)[v4 copy];
  return v10;
}

- (_NSRange)textRangeForAnimationType:(int64_t)a3
{
  id v4 = [(PencilEducationElementViewController *)self textField];
  uint64_t v5 = [v4 text];

  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 17);
  uint64_t v7 = [v5 rangeOfString:v6];

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 18);
  uint64_t v9 = [v5 rangeOfString:v8];

  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 19);
  uint64_t v11 = [v5 rangeOfString:v10];

  double v12 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 20);
  uint64_t v13 = [v5 rangeOfString:v12];

  switch(a3)
  {
    case 0:
      NSUInteger v17 = 0;
      BOOL v16 = v9 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    case 1:
    case 2:
    case 4:
    case 6:
      BOOL v14 = v7 != 0x7FFFFFFFFFFFFFFFLL;
      BOOL v15 = v9 != 0x7FFFFFFFFFFFFFFFLL;
      BOOL v16 = !v14 || !v15;
      if (v14 && v15) {
        NSUInteger v17 = v9 - v7;
      }
      else {
        NSUInteger v17 = 0;
      }
LABEL_15:
      if (v16) {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      break;
    case 3:
    case 7:
      BOOL v18 = v11 != 0x7FFFFFFFFFFFFFFFLL;
      BOOL v19 = v13 != 0x7FFFFFFFFFFFFFFFLL;
      if (v18 && v19) {
        NSUInteger v17 = v13 - v11;
      }
      else {
        NSUInteger v17 = 0;
      }
      if (v18 && v19) {
        uint64_t v7 = v11;
      }
      else {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      break;
    case 5:
      uint64_t v22 = v9 - v7;
      uint64_t v23 = v7 - 1;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = 0;
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        NSUInteger v17 = 0;
      }
      else {
        NSUInteger v17 = v22;
      }
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v23;
      }
      break;
    case 8:
      NSUInteger v17 = 0;
      uint64_t v7 = 0;
      break;
    default:
      NSUInteger v17 = 0;
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }

  NSUInteger v20 = v7;
  NSUInteger v21 = v17;
  result.length = v21;
  result.id location = v20;
  return result;
}

- (CGPoint)offsetForAnimationType:(int64_t)a3
{
  double v5 = 0.0;
  switch(a3)
  {
    case 5:
      goto LABEL_4;
    case 2:
      uint64_t v6 = [(PencilEducationElementViewController *)self textRangeForAnimationType:2];
      -[PencilEducationElementViewController textFieldBoundsForRange:](self, "textFieldBoundsForRange:", v6, v7);
      double v5 = v8 * 0.5;
      break;
    case 0:
LABEL_4:
      [(PencilEducationElementViewController *)self isTextFieldRTL];
      [(PencilEducationElementViewController *)self isTextFieldRTL];
      break;
  }
  [(PencilEducationElementViewController *)self localizationOffsetsForAnimationType:a3];
  double v10 = v9 + 0.0;
  double v12 = v5 + v11;
  result.y = v12;
  result.x = v10;
  return result;
}

- (double)speedRatioForAnimationType:(int64_t)a3
{
  double result = 2.2;
  if (a3 == 5) {
    double result = 2.0;
  }
  if (!a3) {
    return 5.0;
  }
  return result;
}

- (double)nextAnimationDelayForAnimationType:(int64_t)a3
{
  double result = 0.75;
  if ((unint64_t)(a3 - 2) <= 2) {
    return dbl_2397FAA60[a3 - 2];
  }
  return result;
}

- (double)scaleRatioForAnimationType:(int64_t)a3
{
  double result = 1.0;
  if ((unint64_t)a3 <= 7) {
    return dbl_2397FAA78[a3];
  }
  return result;
}

- (BOOL)hasCustomHeightRatioForAnimationType:(int64_t)a3
{
  [(PencilEducationElementViewController *)self customHeightRatioForAnimationType:a3];
  return v3 != 1.0;
}

- (double)customHeightRatioForAnimationType:(int64_t)a3
{
  double result = 0.1;
  if (a3 != 2) {
    return 1.0;
  }
  return result;
}

- (id)allowedCalloutActionsForType:(int64_t)a3
{
  if (a3 == 3)
  {
    double v5 = [(PencilEducationElementViewController *)self defaultAllowedCalloutActions];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)defaultAllowedCalloutActions
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"cut:", @"copy:", @"selectAll:", @"paste:", @"replace:", 0);
}

- (BOOL)hasCustomWidthRatioForAnimationType:(int64_t)a3
{
  [(PencilEducationElementViewController *)self customWidthRatioForAnimationType:a3];
  return v3 != 1.0;
}

- (double)customWidthRatioForAnimationType:(int64_t)a3
{
  double result = 0.1;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6) {
    return 1.0;
  }
  return result;
}

- (BOOL)isSecondaryAnimationForType:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x188u >> a3);
}

- (BOOL)isTextAddedForAnimationType:(int64_t)a3
{
  return !a3 || a3 == 5;
}

- (CGAffineTransform)transformForAnimationType:(SEL)a3 drawing:(int64_t)a4 bounds:(id)a5
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a5;
  int64_t v14 = [(PencilEducationElementViewController *)self transformDimensionAnimationType:a4];
  if ([(PencilEducationElementViewController *)self isTextFieldRTL]
    && [(PencilEducationElementViewController *)self isTextAddedForAnimationType:a4])
  {
    [v13 bounds];
  }
  [(PencilEducationElementViewController *)self scaleRatioForAnimationType:a4];
  double v16 = height * v15 - height;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  -[PencilEducationElementViewController transformDrawing:toFitBounds:dimension:offset:animationType:](self, "transformDrawing:toFitBounds:dimension:offset:animationType:", v13, v14, a4, x, y, width);
  long long v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v17;
  *(_OWORD *)&v22.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v23, &v22, 0.0, v16 * -0.5);
  long long v18 = *(_OWORD *)&v23.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v23.tx;
  long long v19 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tdouble x = *(_OWORD *)&retstr->tx;
  [(PencilEducationElementViewController *)self applyLocalizationScaleOffsetsIfNecesssaryForDrawing:v13 animationType:a4 transform:&v22];
  long long v20 = *(_OWORD *)&v23.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v23.tx;

  return result;
}

- (int64_t)transformDimensionAnimationType:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 0;
  }
  else {
    return qword_2397FAAB8[a3];
  }
}

- (CGAffineTransform)transformDrawing:(SEL)a3 toFitBounds:(id)a4 dimension:(CGRect)a5 offset:(int64_t)a6 animationType:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  double height = a5.size.height;
  double width = a5.size.width;
  objc_msgSend(a4, "bounds", a5.origin.x, a5.origin.y);
  double v17 = v16;
  double v19 = v18;
  BOOL v20 = [(PencilEducationElementViewController *)self hasCustomWidthRatioForAnimationType:a8];
  BOOL v21 = [(PencilEducationElementViewController *)self hasCustomHeightRatioForAnimationType:a8];
  if (v20)
  {
    [(PencilEducationElementViewController *)self customWidthRatioForAnimationType:a8];
    double v23 = v22;
  }
  else
  {
    double v23 = 1.0;
    if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      double v23 = width / v17;
    }
  }
  if (v21)
  {
    [(PencilEducationElementViewController *)self customHeightRatioForAnimationType:a8];
    double v25 = v24;
  }
  else
  {
    double v25 = 1.0;
    if ((unint64_t)(a6 - 2) <= 2) {
      double v25 = height / v19;
    }
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  if (a6 == 4) {
    CGFloat v26 = v25;
  }
  else {
    CGFloat v26 = v23;
  }
  *(_OWORD *)&retstr->a = 0uLL;
  CGAffineTransformMakeScale(retstr, v26, v25);
  long long v27 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v30.c = v27;
  *(_OWORD *)&v30.tCGFloat x = *(_OWORD *)&retstr->tx;
  double result = CGAffineTransformTranslate(&v31, &v30, x, y);
  long long v29 = *(_OWORD *)&v31.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v31.a;
  *(_OWORD *)&retstr->c = v29;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v31.tx;
  return result;
}

- (CGAffineTransform)applyLocalizationScaleOffsetsIfNecesssaryForDrawing:(SEL)a3 animationType:(id)a4 transform:(int64_t)a5
{
  long long v7 = *(_OWORD *)&a6->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a6->a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&a6->tx;
  double result = (CGAffineTransform *)[(PencilEducationElementViewController *)self localizationOffsetsForAnimationType:a5];
  double v11 = 1.0;
  if (v9 != 1.0 || v10 != 1.0)
  {
    double v13 = fabs(v9);
    double v14 = fmax(v9, 0.1);
    if (v13 <= 0.1) {
      double v15 = 1.0;
    }
    else {
      double v15 = v14;
    }
    double v16 = fabs(v10);
    double v17 = fmax(v10, 0.1);
    if (v16 > 0.1) {
      double v11 = v17;
    }
    long long v18 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v19.c = v18;
    *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)&retstr->tx;
    return CGAffineTransformScale(retstr, &v19, v15, v11);
  }
  return result;
}

- (CGRect)textFieldBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(PencilEducationElementViewController *)self textField];
  long long v7 = [v6 beginningOfDocument];
  double v8 = [v6 positionFromPosition:v7 offset:location];

  double v9 = [v6 beginningOfDocument];
  double v10 = [v6 positionFromPosition:v9 offset:location + length];

  double v11 = [v6 textRangeFromPosition:v8 toPosition:v10];
  [v6 firstRectForRange:v11];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  if (CGRectIsInfinite(v22) || !length)
  {
    CGFloat x = *MEMORY[0x263F001A8];
    CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = [(PencilEducationElementViewController *)self textField];
    [v16 bounds];
    CGFloat height = v17;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (PKPencilEducationOffset)localizationOffsetsForAnimationType:(int64_t)a3
{
  double v5 = [(PencilEducationElementViewController *)self localizationOffsetDictionary];
  uint64_t v6 = [(PencilEducationElementViewController *)self localizationOffsetKeyForAnimationType:a3];
  long long v7 = [v5 objectForKeyedSubscript:v6];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 objectForKeyedSubscript:@"x"];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = [v8 objectForKeyedSubscript:@"y"];
    [v12 doubleValue];
    double v14 = v13;

    double v15 = [v8 objectForKeyedSubscript:@"widthRatio"];
    [v15 doubleValue];
    double v17 = v16;

    double v18 = [v8 objectForKeyedSubscript:@"heightRatio"];
    [v18 doubleValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 0.0;
    double v17 = 0.0;
    double v14 = 0.0;
    double v11 = 0.0;
  }

  double v21 = v11;
  double v22 = v14;
  double v23 = v17;
  double v24 = v20;
  result.var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (id)localizationOffsetKeyForAnimationType:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 0;
  }
  else {
    return off_264DA5A40[a3];
  }
}

- (BOOL)isUIRTL
{
  v2 = [(PencilEducationElementViewController *)self traitCollection];
  BOOL v3 = [v2 layoutDirection] == 1;

  return v3;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  if (![(PencilEducationElementViewController *)self isAnimating]
    && [(PencilEducationElementViewController *)self hasPencilInteraction])
  {
    double v5 = +[PencilSettingsStatisticsManager sharedInstance];
    uint64_t v6 = [(PencilEducationElementViewController *)self elementData];
    objc_msgSend(v5, "recordEducationPencilInputInteraction:", objc_msgSend(v6, "type"));

    [(PencilEducationElementViewController *)self setHasPencilInteraction:0];
  }
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  BOOL v5 = [(PencilEducationElementViewController *)self isAnimating];
  if (v5) {
    LOBYTE(v5) = [(PencilEducationElementViewController *)self inProgressAnimationType] == 0;
  }
  return v5;
}

- (BOOL)_pkScribbleInteractionShouldDisableInputAssistant:(id)a3
{
  return 1;
}

- (PencilEducationElementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PencilEducationElementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)isRunningAnimationSequence
{
  return self->_isRunningAnimationSequence;
}

- (PencilEducationElementData)elementData
{
  return self->_elementData;
}

- (void)setElementData:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (PencilEducationElementTextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return (PencilEducationElementTextField *)WeakRetained;
}

- (void)setTextField:(id)a3
{
}

- (NSString)processedString
{
  return self->_processedString;
}

- (void)setProcessedString:(id)a3
{
}

- (UITextCursorAssertion)cursorAssertion
{
  return self->_cursorAssertion;
}

- (void)setCursorAssertion:(id)a3
{
}

- (PKTextInputSettings)textInputSettings
{
  return self->_textInputSettings;
}

- (void)setTextInputSettings:(id)a3
{
}

- (NSDictionary)localizationOffsetDictionary
{
  return self->_localizationOffsetDictionary;
}

- (void)setLocalizationOffsetDictionary:(id)a3
{
}

- (UIButton)replayButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_replayButton);
  return (UIButton *)WeakRetained;
}

- (void)setReplayButton:(id)a3
{
}

- (PKTextInputInteraction)textInputInteraction
{
  return self->_textInputInteraction;
}

- (PKDrawingReplayController)drawingReplayController
{
  return self->_drawingReplayController;
}

- (void)setDrawingReplayController:(id)a3
{
}

- (PKDrawingReplayController)delayDrawingReplayController
{
  return self->_delayDrawingReplayController;
}

- (NSMutableArray)animationQueue
{
  return self->_animationQueue;
}

- (void)setAnimationQueue:(id)a3
{
}

- (int64_t)inProgressAnimationType
{
  return self->_inProgressAnimationType;
}

- (void)setInProgressAnimationType:(int64_t)a3
{
  self->_inProgressAnimationType = a3;
}

- (BOOL)hasPencilInteraction
{
  return self->_hasPencilInteraction;
}

- (void)setHasPencilInteraction:(BOOL)a3
{
  self->_hasPencilInteraction = a3;
}

- (unint64_t)replayButtonHiddenIndex
{
  return self->_replayButtonHiddenIndex;
}

- (void)setReplayButtonHiddenIndex:(unint64_t)a3
{
  self->_replayButtonHiddenIndeCGFloat x = a3;
}

- (unint64_t)performAnimationAsyncIndex
{
  return self->_performAnimationAsyncIndex;
}

- (void)setPerformAnimationAsyncIndex:(unint64_t)a3
{
  self->_performAnimationAsyncIndeCGFloat x = a3;
}

- (id)endWritingCompletionBlock
{
  return self->_endWritingCompletionBlock;
}

- (void)setEndWritingCompletionBlock:(id)a3
{
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (BOOL)didRunInitialAppearActions
{
  return self->_didRunInitialAppearActions;
}

- (void)setDidRunInitialAppearActions:(BOOL)a3
{
  self->_didRunInitialAppearActions = a3;
}

- (BOOL)isTextFieldRTL
{
  return self->_isTextFieldRTL;
}

- (void)setIsTextFieldRTL:(BOOL)a3
{
  self->_isTextFieldRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endWritingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
  objc_storeStrong((id *)&self->_delayDrawingReplayController, 0);
  objc_storeStrong((id *)&self->_drawingReplayController, 0);
  objc_storeStrong((id *)&self->_textInputInteraction, 0);
  objc_destroyWeak((id *)&self->_replayButton);
  objc_storeStrong((id *)&self->_localizationOffsetDictionary, 0);
  objc_storeStrong((id *)&self->_textInputSettings, 0);
  objc_storeStrong((id *)&self->_cursorAssertion, 0);
  objc_storeStrong((id *)&self->_processedString, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_elementData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end