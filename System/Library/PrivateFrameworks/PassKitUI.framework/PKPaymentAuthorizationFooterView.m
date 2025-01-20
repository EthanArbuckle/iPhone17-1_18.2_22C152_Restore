@interface PKPaymentAuthorizationFooterView
- (BOOL)_shouldCompact;
- (BOOL)hidesSeparatorView;
- (BOOL)isOffscreen;
- (BOOL)occludesBodyView;
- (BOOL)preventBiometricStateFallbacks;
- (BOOL)preventPasscodeFallbackForBiometricFailure;
- (BOOL)setConstraintState:(int64_t)a3;
- (NSString)authorizingTitle;
- (NSString)biometricConfirmationTitle;
- (NSString)confirmationTitle;
- (PKPaymentAuthorizationFooterView)initWithFrame:(CGRect)a3;
- (PKPaymentAuthorizationFooterView)initWithFrame:(CGRect)a3 layout:(id)a4;
- (PKPaymentAuthorizationFooterViewDelegate)delegate;
- (PKPaymentAuthorizationLayout)layout;
- (id)_payWithPasscodeTitleForState:(int64_t)a3;
- (id)_titleAttributedStringForState:(int64_t)a3;
- (id)_titleLabelAttributedString:(id)a3;
- (id)createDefaultHeightConstraintForConstraintState:(int64_t)a3;
- (int64_t)completionStyle;
- (int64_t)state;
- (int64_t)userIntentStyle;
- (unint64_t)confirmationStyle;
- (unint64_t)requestType;
- (void)_createSubviews;
- (void)_payWithPasscodePressed;
- (void)_prepareConstraints;
- (void)dealloc;
- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4;
- (void)glyphViewUserIntentEdgeDidChange:(id)a3;
- (void)setAuthorizingTitle:(id)a3;
- (void)setBiometricConfirmationTitle:(id)a3;
- (void)setCompletionStyle:(int64_t)a3;
- (void)setConfirmationStyle:(unint64_t)a3;
- (void)setConfirmationTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidesSeparatorView:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setOccludesBodyView:(BOOL)a3;
- (void)setPreventBiometricStateFallbacks:(BOOL)a3;
- (void)setPreventPasscodeFallbackForBiometricFailure:(BOOL)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5;
- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)setUserIntentStyle:(int64_t)a3;
- (void)updateConstraints;
- (void)updateRotation;
@end

@implementation PKPaymentAuthorizationFooterView

- (PKPaymentAuthorizationFooterView)initWithFrame:(CGRect)a3
{
  return -[PKPaymentAuthorizationFooterView initWithFrame:layout:](self, "initWithFrame:layout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPaymentAuthorizationFooterView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentAuthorizationFooterView;
  v11 = -[PKPaymentAuthorizationFooterView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredCompletionHandlers = v11->_deferredCompletionHandlers;
    v11->_deferredCompletionHandlers = v14;

    objc_storeStrong((id *)&v11->_layout, a4);
    v11->_constraintState = 0;
    v11->_queuedConstraintState = 0;
    v16 = [(PKPaymentAuthorizationFooterView *)v11 traitCollection];
    uint64_t v17 = [v16 userInterfaceIdiom];

    v11->_isPad = (v17 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v11->_hasPearl = PKPearlIsAvailable();
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dynamicRegularConstraints = v11->_dynamicRegularConstraints;
    v11->_dynamicRegularConstraints = v18;

    v11->_compact = [(PKPaymentAuthorizationFooterView *)v11 _shouldCompact];
    uint64_t v20 = [(PKPaymentAuthorizationLayout *)v11->_layout style];
    v11->_compactUserIntent = v20 == 0;
    if (v20) {
      char IsAvailable = 0;
    }
    else {
      char IsAvailable = PKSystemApertureIsAvailable();
    }
    v11->_compactBiometrics = IsAvailable;
    [(PKPaymentAuthorizationFooterView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaymentAuthorizationFooterView *)v11 _createSubviews];
    [(PKPaymentAuthorizationFooterView *)v11 _prepareConstraints];
  }

  return v11;
}

- (void)dealloc
{
  [(PKGlyphView *)self->_glyphView setDelegate:0];
  [(PKGlyphView *)self->_glyphView setState:6 animated:0 completionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationFooterView;
  [(PKPaymentAuthorizationFooterView *)&v3 dealloc];
}

- (BOOL)_shouldCompact
{
  return (PKHomeButtonIsAvailable() & 1) == 0 && !self->_isPad;
}

- (BOOL)isOffscreen
{
  return self->_constraintState == 2;
}

- (void)setRequestType:(unint64_t)a3
{
  if (self->_requestType != a3)
  {
    self->_requestType = a3;
    BOOL v4 = [(PKPaymentAuthorizationFooterView *)self _shouldCompact];
    if (self->_compact != v4)
    {
      self->_compact = v4;
      self->_constraintsDirtdouble y = 1;
      [(PKPaymentAuthorizationFooterView *)self setNeedsUpdateConstraints];
    }
    int64_t state = self->_state;
    [(PKPaymentAuthorizationFooterView *)self setState:state];
  }
}

- (void)setConfirmationStyle:(unint64_t)a3
{
  if (self->_confirmationStyle != a3)
  {
    self->_confirmationStyle = a3;
    [(PKPaymentAuthorizationFooterView *)self setState:self->_state];
  }
}

- (BOOL)setConstraintState:(int64_t)a3
{
  if (self->_constraintState == a3 && self->_queuedConstraintState == a3) {
    return 0;
  }
  self->_queuedConstraintState = a3;
  if ([(PKPaymentAuthorizationFooterView *)self isHidden]) {
    return 0;
  }
  [(PKPaymentAuthorizationFooterView *)self setNeedsUpdateConstraints];
  return 1;
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5
{
}

- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v92 = a4;
  id v93 = a6;
  if (self->_deferringState)
  {
    if (a3 == 9)
    {
      id v10 = 0;
      self->_deferredStateRequiresRetrdouble y = 1;
LABEL_15:
      v12 = (NSString *)[v92 copy];
      deferredStateString = self->_deferredStateString;
      self->_deferredStateString = v12;

      if (v93)
      {
        deferredCompletionHandlers = self->_deferredCompletionHandlers;
        v15 = (void *)[v93 copy];
        v16 = _Block_copy(v15);
        [(NSMutableArray *)deferredCompletionHandlers addObject:v16];
      }
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v17 = v10;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v137 objects:v142 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v138;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v138 != v19) {
              objc_enumerationMutation(v17);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v137 + 1) + 8 * i) + 16))();
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v137 objects:v142 count:16];
        }
        while (v18);
      }
      id v21 = v17;
      goto LABEL_134;
    }
LABEL_8:
    if (self->_state == a3)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = (void *)[(NSMutableArray *)self->_deferredCompletionHandlers copy];
      [(NSMutableArray *)self->_deferredCompletionHandlers removeAllObjects];
      self->_unint64_t state = a3;
    }
    goto LABEL_15;
  }
  BOOL v91 = v7;
  if (a3 == 9 || !self->_biometricSuccessOutstanding)
  {
    if (a3 == 9)
    {
      v88 = 0;
      goto LABEL_31;
    }
  }
  else if (self->_state != a3)
  {
    self->_deferringState = 1;
    self->_deferredStateRequiresRetrdouble y = 0;
    v11 = self->_deferredStateString;
    self->_deferredStateString = 0;

    if (self->_deferringState) {
      goto LABEL_8;
    }
  }
  ++self->_stateTransitionIndex;
  if (self->_state == a3)
  {
    v88 = 0;
  }
  else
  {
    if ([(NSMutableArray *)self->_completionHandlers count])
    {
      v88 = (void *)[(NSMutableArray *)self->_completionHandlers copy];
      [(NSMutableArray *)self->_completionHandlers removeAllObjects];
    }
    else
    {
      v88 = 0;
    }
    self->_unint64_t state = a3;
  }
  if (v93)
  {
    completionHandlers = self->_completionHandlers;
    objc_super v23 = (void *)[v93 copy];
    v24 = _Block_copy(v23);
    [(NSMutableArray *)completionHandlers addObject:v24];
  }
LABEL_31:
  unint64_t state = self->_state;
  if (state > 9)
  {
LABEL_71:
    BOOL compactBiometrics = 0;
    uint64_t v27 = 0;
    goto LABEL_34;
  }
  if (((1 << state) & 0x3E7) != 0)
  {
    BOOL compactBiometrics = self->_compactBiometrics;
    uint64_t v27 = 2 * self->_compactBiometrics;
    goto LABEL_34;
  }
  if (state == 3)
  {
    if (self->_compactUserIntent)
    {
      BOOL compactBiometrics = self->_userIntentStyle == 1;
      uint64_t v27 = 2 * compactBiometrics;
      goto LABEL_34;
    }
    goto LABEL_71;
  }
  BOOL compactBiometrics = 0;
  uint64_t v27 = 1;
LABEL_34:
  BOOL v87 = [(PKPaymentAuthorizationFooterView *)self setConstraintState:v27];
  v28 = (NSString *)[v92 copy];
  overrideString = self->_overrideString;
  self->_overrideString = v28;

  if (self->_overrideString) {
    -[PKPaymentAuthorizationFooterView _titleLabelAttributedString:](self, "_titleLabelAttributedString:");
  }
  else {
  id v17 = [(PKPaymentAuthorizationFooterView *)self _titleAttributedStringForState:a3];
  }
  v89 = [(PKPaymentAuthorizationFooterView *)self _payWithPasscodeTitleForState:a3];
  objc_initWeak(&location, self);
  stateTransitionIndedouble x = (void *)self->_stateTransitionIndex;
  if (a3 == 8)
  {
LABEL_50:
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x2020000000;
    uint64_t v135 = 1;
    BOOL v35 = a3 == 8 && v91;
    if (v35) {
      self->_biometricSuccessOutstanding = 1;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke;
    aBlock[3] = &unk_1E59DE908;
    objc_copyWeak(v130, &location);
    v130[1] = stateTransitionIndex;
    aBlock[4] = &v132;
    BOOL v131 = v35;
    v36 = (void (**)(void))_Block_copy(aBlock);
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
      case 6:
      case 7:
        [(UIButton *)self->_payWithPasscodeButton alpha];
        if (v39 > 0.0) {
          [v37 addObject:self->_payWithPasscodeButton];
        }
        if (compactBiometrics)
        {
          [(PKGlyphView *)self->_glyphView alpha];
          if (v40 > 0.0) {
            [v37 addObject:self->_glyphView];
          }
          p_labelView = &self->_labelView;
          [(UILabel *)self->_labelView alpha];
          v42 = v37;
          if (v43 <= 0.0) {
            goto LABEL_69;
          }
        }
        else
        {
          [v38 addObject:self->_glyphView];
          if (!v17)
          {
LABEL_69:
            BOOL v44 = 0;
            uint64_t v45 = 0;
            switch(a3)
            {
              case 1:
                BOOL v44 = 0;
                uint64_t v45 = 3;
                break;
              case 2:
                int IsAvailable = PKPearlIsAvailable();
                BOOL v44 = 0;
                if (IsAvailable) {
                  uint64_t v45 = 5;
                }
                else {
                  uint64_t v45 = 1;
                }
                break;
              case 3:
                if (compactBiometrics)
                {
                  uint64_t v45 = 0;
                  BOOL v44 = 0;
                }
                else
                {
                  BOOL v44 = self->_userIntentStyle == 1;
                  uint64_t v45 = 2 * (self->_userIntentStyle == 1);
                  if (self->_userIntentStyle == 1 && !v91)
                  {
                    [(PKGlyphView *)self->_glyphView setState:6 animated:0 completionHandler:0];
                    BOOL v44 = 1;
                  }
                }
                break;
              case 5:
              case 6:
              case 7:
                BOOL v44 = 0;
                uint64_t v45 = 4;
                break;
              default:
                break;
            }
            ++v133[3];
            glyphView = self->_glyphView;
            uint64_t v72 = v44 | v91;
            v127[0] = MEMORY[0x1E4F143A8];
            v127[1] = 3221225472;
            v127[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_3;
            v127[3] = &unk_1E59CA9F8;
            v128 = v36;
            [(PKGlyphView *)glyphView setState:v45 animated:v72 completionHandler:v127];
            v64 = (id *)&v128;
            goto LABEL_121;
          }
          p_labelView = &self->_labelView;
          v42 = v38;
        }
        [v42 addObject:*p_labelView];
        goto LABEL_69;
      case 4:
        [(PKGlyphView *)self->_glyphView alpha];
        if (v65 > 0.0) {
          [v37 addObject:self->_glyphView];
        }
        [(UILabel *)self->_labelView alpha];
        if (v66 > 0.0) {
          [v37 addObject:self->_labelView];
        }
        [v38 addObject:self->_payWithPasscodeButton];
        ++v133[3];
        if (self->_preventBiometricStateFallbacks)
        {
          v36[2](v36);
        }
        else
        {
          v73 = self->_glyphView;
          v49 = v126;
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_4;
          v126[3] = &unk_1E59CA9F8;
          v126[4] = v36;
          [(PKGlyphView *)v73 setState:0 animated:v91 completionHandler:v126];
LABEL_120:
          v64 = (id *)(v49 + 4);
LABEL_121:
        }
LABEL_122:
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_9;
        v114[3] = &unk_1E59DE930;
        objc_copyWeak(&v118, &location);
        id v86 = v37;
        id v115 = v86;
        id v74 = v17;
        id v116 = v74;
        BOOL v119 = v91;
        id v75 = v38;
        id v117 = v75;
        BOOL v120 = v87;
        v76 = (void (**)(void))_Block_copy(v114);
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_10;
        v110[3] = &unk_1E59CB378;
        objc_copyWeak(&v113, &location);
        id v111 = v74;
        id v112 = v89;
        v77 = (void (**)(void))_Block_copy(v110);
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_11;
        v107[3] = &unk_1E59CB010;
        objc_copyWeak(&v109, &location);
        id v85 = v75;
        id v108 = v85;
        v78 = (void (**)(void))_Block_copy(v107);
        ++v133[3];
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_12;
        v103[3] = &unk_1E59D86F8;
        objc_copyWeak(v105, &location);
        v105[1] = stateTransitionIndex;
        v79 = v36;
        id v104 = v79;
        BOOL v106 = v91;
        v80 = (void (**)(void))_Block_copy(v103);
        if (v91)
        {
          v81 = (void *)MEMORY[0x1E4FB1EB0];
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_14;
          v98[3] = &unk_1E59DE9A8;
          objc_copyWeak(v102, &location);
          v102[1] = stateTransitionIndex;
          v99 = v77;
          v100 = v78;
          v101 = v80;
          [v81 _animateUsingDefaultTimingWithOptions:0 animations:v76 completion:v98];

          objc_destroyWeak(v102);
        }
        else
        {
          v76[2](v76);
          v77[2](v77);
          v78[2](v78);
          v80[2](v80);
        }
        v79[2](v79);

        objc_destroyWeak(v105);
        objc_destroyWeak(&v109);

        objc_destroyWeak(&v113);
        objc_destroyWeak(&v118);

        objc_destroyWeak(v130);
        _Block_object_dispose(&v132, 8);
        goto LABEL_126;
      case 8:
        if (v91) {
          self->_biometricSuccessOutstanding = 1;
        }
        [(UIButton *)self->_payWithPasscodeButton alpha];
        if (v50 > 0.0) {
          [v37 addObject:self->_payWithPasscodeButton];
        }
        [(PKGlyphView *)self->_glyphView alpha];
        if (v51 == 0.0) {
          [v38 addObject:self->_glyphView];
        }
        if (v17) {
          [v38 addObject:self->_labelView];
        }
        ++v133[3];
        v52 = self->_glyphView;
        v49 = v125;
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_5;
        v125[3] = &unk_1E59CA9F8;
        v125[4] = v36;
        [(PKGlyphView *)v52 setState:12 animated:v91 completionHandler:v125];
        goto LABEL_120;
      case 10:
      case 11:
        [(UIButton *)self->_payWithPasscodeButton alpha];
        if (v46 > 0.0) {
          [v37 addObject:self->_payWithPasscodeButton];
        }
        [(PKGlyphView *)self->_glyphView alpha];
        if (v47 == 0.0) {
          [v38 addObject:self->_glyphView];
        }
        if (v17) {
          [v38 addObject:self->_labelView];
        }
        ++v133[3];
        v48 = self->_glyphView;
        v49 = v124;
        v124[0] = MEMORY[0x1E4F143A8];
        v124[1] = 3221225472;
        v124[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_6;
        v124[3] = &unk_1E59CA9F8;
        v124[4] = v36;
        [(PKGlyphView *)v48 setState:7 animated:v91 completionHandler:v124];
        goto LABEL_120;
      case 12:
        [(UIButton *)self->_payWithPasscodeButton alpha];
        if (v67 > 0.0) {
          [v37 addObject:self->_payWithPasscodeButton];
        }
        [(PKGlyphView *)self->_glyphView alpha];
        if (v68 == 0.0) {
          [v38 addObject:self->_glyphView];
        }
        if (v17) {
          [v38 addObject:self->_labelView];
        }
        ++v133[3];
        v69 = self->_glyphView;
        v49 = v123;
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_7;
        v123[3] = &unk_1E59CA9F8;
        v123[4] = v36;
        [(PKGlyphView *)v69 setState:11 animated:v91 completionHandler:v123];
        goto LABEL_120;
      case 13:
        [(UIButton *)self->_payWithPasscodeButton alpha];
        if (v53 > 0.0) {
          [v37 addObject:self->_payWithPasscodeButton];
        }
        [(PKGlyphView *)self->_glyphView alpha];
        if (v54 == 0.0) {
          [v38 addObject:self->_glyphView];
        }
        if (v17) {
          [v38 addObject:self->_labelView];
        }
        [(PKGlyphView *)self->_glyphView setColorMode:3 animated:v91];
        ++v133[3];
        v55 = self->_glyphView;
        v121[0] = MEMORY[0x1E4F143A8];
        v121[1] = 3221225472;
        v121[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_8;
        v121[3] = &unk_1E59CA9F8;
        v122 = v36;
        [(PKGlyphView *)v55 setState:10 animated:v91 completionHandler:v121];
        [(PKPaymentAuthorizationLayout *)self->_layout glyphDimension];
        v57 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:v56 / 43.0 * 34.0];
        v58 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark" withConfiguration:v57];
        v59 = [(PKGlyphView *)self->_glyphView primaryColor];
        v60 = [v58 _flatImageWithColor:v59];

        v61 = self->_glyphView;
        id v62 = v60;
        uint64_t v63 = [v62 CGImage];
        [v62 alignmentRectInsets];
        -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](v61, "setCustomImage:withAlignmentEdgeInsets:", v63);

        v64 = (id *)&v122;
        goto LABEL_121;
      default:
        goto LABEL_122;
    }
  }
  if (a3 != 9)
  {
    self->_biometricSuccessOutstanding = 0;
    goto LABEL_50;
  }
  unint64_t v30 = self->_state;
  if (v30 <= 5)
  {
    if (v17) {
      [(UILabel *)self->_labelView setAttributedText:v17];
    }
    if (!self->_hasPearl || self->_state == 4)
    {
      AudioServicesPlaySystemSound(0x573u);
      uint64_t v31 = 24;
      if (!self->_hasPearl) {
        uint64_t v31 = 23;
      }
      v32 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPaymentAuthorizationFooterView__completionHandlers[v31]) layer];
      v33 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_shakeAnimation");
      id v34 = (id)objc_msgSend(v32, "pkui_addAdditiveAnimation:", v33);
    }
  }
  if (v93) {
    (*((void (**)(id, BOOL))v93 + 2))(v93, v30 < 6);
  }
LABEL_126:
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v21 = v88;
  uint64_t v82 = [v21 countByEnumeratingWithState:&v94 objects:v141 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v82; ++j)
      {
        if (*(void *)v95 != v83) {
          objc_enumerationMutation(v21);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v94 + 1) + 8 * j) + 16))();
      }
      uint64_t v82 = [v21 countByEnumeratingWithState:&v94 objects:v141 count:16];
    }
    while (v82);
  }

  objc_destroyWeak(&location);
LABEL_134:
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[58] == *(id *)(a1 + 48))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v5 = *(void *)(v4 + 24) - 1;
      *(void *)(v4 + 24) = v5;
      if (!v5)
      {
        if (*(unsigned char *)(a1 + 56)) {
          *((unsigned char *)WeakRetained + 488) = 0;
        }
        int v6 = *((unsigned __int8 *)WeakRetained + 472);
        id v7 = WeakRetained[74];
        id v8 = WeakRetained[60];
        int v9 = *((unsigned __int8 *)v3 + 473);
        *((unsigned char *)v3 + 472) = 0;
        *((unsigned char *)v3 + 473) = 0;
        id v10 = v3[60];
        v3[60] = 0;

        if ([v3[62] count]) {
          v11 = (void *)[v3[62] copy];
        }
        else {
          v11 = 0;
        }
        [v3[62] removeAllObjects];
        if ([v3[63] count]) {
          v12 = (void *)[v3[63] copy];
        }
        else {
          v12 = 0;
        }
        [v3[63] removeAllObjects];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * i) + 16))();
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v15);
        }

        if (v6)
        {
          if (v9) {
            id v18 = 0;
          }
          else {
            id v18 = v8;
          }
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_2;
          v28[3] = &unk_1E59CB6D8;
          id v29 = v12;
          [v3 setState:v7 string:v18 animated:1 withCompletion:v28];
          if (v9) {
            [v3 setState:9 string:v8 animated:1];
          }
          id v19 = v29;
        }
        else
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v19 = v12;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v34 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v25 != v22) {
                  objc_enumerationMutation(v19);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v24 + 1) + 8 * j));
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v34 count:16];
            }
            while (v21);
          }
        }
      }
    }
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setAlpha:", 0.0, (void)v10);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    if (*(void *)(a1 + 40))
    {
      long long v8 = [WeakRetained[51] attributedText];
      if ((PKEqualObjects() & 1) != 0 || !*(unsigned char *)(a1 + 64))
      {
      }
      else
      {
        int v9 = [*(id *)(a1 + 48) containsObject:WeakRetained[51]];

        if (v9) {
          [WeakRetained[51] setAlpha:0.0];
        }
      }
    }
    if (*(unsigned char *)(a1 + 65))
    {
      [WeakRetained updateConstraintsIfNeeded];
      [WeakRetained layoutIfNeeded];
    }
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_10(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[51], "setAttributedText:");
      WeakRetained = v4;
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      [v4[53] setTitle:v3 forState:0];
      WeakRetained = v4;
    }
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_11(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setAlpha:", 1.0, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[58] == *(void *)(a1 + 48))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if (v4[74] == 1 && !*((unsigned char *)v4 + 590))
      {
        dispatch_time_t v5 = dispatch_time(0, 1850000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_13;
        block[3] = &unk_1E59D9850;
        objc_copyWeak(v7, v2);
        v7[1] = *(id *)(a1 + 48);
        char v8 = *(unsigned char *)(a1 + 56);
        dispatch_after(v5, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(v7);
      }
    }
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[58] == *(void *)(a1 + 40) && WeakRetained[74] == 1)
  {
    id v3 = WeakRetained;
    [WeakRetained setState:4 string:0 animated:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_14(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_15;
  block[3] = &unk_1E59DE980;
  objc_copyWeak(v6, a1 + 7);
  v6[1] = a1[8];
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v6);
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 58) == *(void *)(a1 + 64))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_16;
    v7[3] = &unk_1E59DE958;
    objc_copyWeak(v9, v2);
    v9[1] = *(id *)(a1 + 64);
    id v8 = *(id *)(a1 + 48);
    [v5 _animateUsingDefaultTimingWithOptions:0 animations:v6 completion:v7];

    objc_destroyWeak(v9);
  }
}

void __76__PKPaymentAuthorizationFooterView_setState_string_animated_withCompletion___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[58] == *(void *)(a1 + 48))
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_createSubviews
{
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  [(UIView *)self->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self->_separatorView;
  uint64_t v6 = PKAuthorizationSeparatorColor();
  [(UIView *)v5 setBackgroundColor:v6];

  [(PKPaymentAuthorizationFooterView *)self addSubview:self->_separatorView];
  uint64_t v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  lockupView = self->_lockupView;
  self->_lockupView = v7;

  [(UIView *)self->_lockupView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKPaymentAuthorizationFooterView *)self addSubview:self->_lockupView];
  long long v9 = (PKGlyphView *)[objc_alloc(MEMORY[0x1E4F88120]) initWithStyle:1];
  glyphView = self->_glyphView;
  self->_glyphView = v9;

  [(PKGlyphView *)self->_glyphView setDelegate:self];
  [(PKGlyphView *)self->_glyphView updateRasterizationScale:PKUIScreenScale()];
  [(PKGlyphView *)self->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKGlyphView *)self->_glyphView setAlpha:0.0];
  [(UIView *)self->_lockupView addSubview:self->_glyphView];
  self->_emphasizedEdge = [(PKGlyphView *)self->_glyphView userIntentEdge];
  PKFloatRoundToPixel();
  double v12 = v11;
  uint64_t v13 = (NSString *)*MEMORY[0x1E4FB2790];
  uint64_t v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], (NSString *)*MEMORY[0x1E4FB2790]);
  [v14 lineHeight];
  PKFloatRoundToPixel();
  uint64_t v30 = v15;
  long long v31 = xmmword_1A040E960;
  int64x2_t v32 = vdupq_n_s64(2uLL);
  uint64_t v16 = [[PKContinuousButton alloc] initWithConfiguration:&v30];
  payWithPasscodeButton = self->_payWithPasscodeButton;
  self->_payWithPasscodeButton = &v16->super;

  -[UIButton setContentEdgeInsets:](self->_payWithPasscodeButton, "setContentEdgeInsets:", v12, 25.0, 16.0 - v12, 25.0);
  [(UIButton *)self->_payWithPasscodeButton addTarget:self action:sel__payWithPasscodePressed forControlEvents:64];
  [(UIButton *)self->_payWithPasscodeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v18 = self->_payWithPasscodeButton;
  id v19 = [(PKPaymentAuthorizationFooterView *)self _payWithPasscodeTitleForState:self->_state];
  [(UIButton *)v18 setTitle:v19 forState:0];

  uint64_t v20 = [(UIButton *)self->_payWithPasscodeButton titleLabel];
  [v20 setFont:v14];
  [v20 setLineBreakMode:4];
  [(UIButton *)self->_payWithPasscodeButton sizeToFit];
  [(UIButton *)self->_payWithPasscodeButton setAlpha:0.0];
  [(PKPaymentAuthorizationFooterView *)self addSubview:self->_payWithPasscodeButton];
  uint64_t v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelView = self->_labelView;
  self->_labelView = v21;

  [(UILabel *)self->_labelView setAlpha:0.0];
  [(UILabel *)self->_labelView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v23 = self->_labelView;
  long long v24 = PKLocalizedPaymentString(&cfstr_InAppPaymentTo_0.isa);
  long long v25 = [(PKPaymentAuthorizationFooterView *)self _titleLabelAttributedString:v24];
  [(UILabel *)v23 setAttributedText:v25];

  [(UILabel *)self->_labelView setOpaque:0];
  [(UILabel *)self->_labelView setAdjustsFontSizeToFitWidth:1];
  int64_t v26 = [(PKPaymentAuthorizationLayout *)self->_layout style];
  long long v27 = (NSString **)MEMORY[0x1E4FB28C8];
  if (v26 != 1) {
    long long v27 = (NSString **)MEMORY[0x1E4FB2998];
  }
  v28 = self->_labelView;
  id v29 = PKFontForDefaultDesign(*v27, v13);
  [(UILabel *)v28 setFont:v29];

  [(UIView *)self->_lockupView addSubview:self->_labelView];
}

- (void)updateRotation
{
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationFooterView;
  -[PKPaymentAuthorizationFooterView setHidden:](&v6, sel_setHidden_);
  if (v3)
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_staticRegularConstraints];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_dynamicRegularConstraints];
    id v5 = &OBJC_IVAR___PKPaymentAuthorizationFooterView__hiddenConstraints;
  }
  else
  {
    if (self->_constraintState != self->_queuedConstraintState || self->_constraintsDirty)
    {
      [(PKPaymentAuthorizationFooterView *)self setNeedsUpdateConstraints];
      [(PKPaymentAuthorizationFooterView *)self updateConstraintsIfNeeded];
    }
    id v5 = &OBJC_IVAR___PKPaymentAuthorizationFooterView__dynamicRegularConstraints;
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_hiddenConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_staticRegularConstraints];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v5)];
}

- (void)setHidesSeparatorView:(BOOL)a3
{
  if (((!self->_hidesSeparatorView ^ a3) & 1) == 0)
  {
    self->_hidesSeparatorView = a3;
    -[UIView setHidden:](self->_separatorView, "setHidden:");
  }
}

- (id)createDefaultHeightConstraintForConstraintState:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      objc_super v6 = [(PKPaymentAuthorizationFooterView *)self heightAnchor];
      uint64_t v7 = v6;
      double v8 = 0.0;
      goto LABEL_15;
    }
    return 0;
  }
  else
  {
    if ([(PKPaymentAuthorizationLayout *)self->_layout style])
    {
      if (a3 != 1)
      {
        double v12 = 0.0;
        if (!self->_compact)
        {
          uint64_t v13 = PKConstrainedAuthorizationViewBodyFont((NSString *)*MEMORY[0x1E4FB2790]);
          [v13 _bodyLeading];
          double v12 = v14;
        }
        uint64_t v7 = [(PKPaymentAuthorizationFooterView *)self bottomAnchor];
        uint64_t v15 = [(UILabel *)self->_labelView lastBaselineAnchor];
        long long v9 = [v7 constraintEqualToAnchor:v15 constant:v12];

        goto LABEL_16;
      }
      if (self->_compact) {
        double v5 = 101.0;
      }
      else {
        double v5 = fmax(self->_minimumHeight, 101.0);
      }
      objc_super v6 = [(PKPaymentAuthorizationFooterView *)self heightAnchor];
      uint64_t v7 = v6;
      double v8 = v5;
LABEL_15:
      long long v9 = [v6 constraintEqualToConstant:v8];
LABEL_16:

      return v9;
    }
    long long v10 = [(PKPaymentAuthorizationFooterView *)self heightAnchor];
    long long v9 = [v10 constraintEqualToConstant:201.0];

    LODWORD(v11) = 1144750080;
    [v9 setPriority:v11];
  }
  return v9;
}

- (void)updateConstraints
{
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentAuthorizationFooterView;
  [(PKPaymentAuthorizationFooterView *)&v29 updateConstraints];
  if ([(PKPaymentAuthorizationFooterView *)self isHidden]) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained authorizationFooterViewWillChangeConstraints:self];
  }
  self->_constraintsDirtdouble y = 0;
  int64_t queuedConstraintState = self->_queuedConstraintState;
  if (self->_constraintState != queuedConstraintState)
  {
    self->_constraintState = queuedConstraintState;
    if (queuedConstraintState != 1 || !self->_isPad)
    {
      self->_minimumHeight = 0.0;
    }
    else
    {
      [(PKPaymentAuthorizationFooterView *)self frame];
      self->_minimumHeight = fmax(v6, self->_minimumHeight);
    }
  }
  if ([(NSMutableArray *)self->_dynamicRegularConstraints count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_dynamicRegularConstraints];
    [(NSMutableArray *)self->_dynamicRegularConstraints removeAllObjects];
  }
  if (![(PKPaymentAuthorizationLayout *)self->_layout shouldSuppressTotal]
    || (double v7 = 0.0, !self->_occludesBodyView))
  {
    [(PKPaymentAuthorizationLayout *)self->_layout contentHorizontalMargin];
    double v7 = (double)(uint64_t)v8;
  }
  separatorLeftConstraint = self->_separatorLeftConstraint;
  if (separatorLeftConstraint)
  {
    [(NSLayoutConstraint *)separatorLeftConstraint setConstant:v7];
  }
  else
  {
    long long v10 = [(UIView *)self->_separatorView leftAnchor];
    double v11 = [(PKPaymentAuthorizationFooterView *)self leftAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11 constant:v7];
    uint64_t v13 = self->_separatorLeftConstraint;
    self->_separatorLeftConstraint = v12;
  }
  [(NSMutableArray *)self->_dynamicRegularConstraints addObject:self->_separatorLeftConstraint];
  BOOL compact = self->_compact;
  dynamicRegularConstraints = self->_dynamicRegularConstraints;
  uint64_t v16 = [(UIView *)self->_lockupView bottomAnchor];
  labelView = self->_labelView;
  if (compact) {
    [(UILabel *)labelView lastBaselineAnchor];
  }
  else {
  id v18 = [(UILabel *)labelView bottomAnchor];
  }
  id v19 = [v16 constraintEqualToAnchor:v18];
  [(NSMutableArray *)dynamicRegularConstraints addObject:v19];

  uint64_t v20 = self->_dynamicRegularConstraints;
  id v21 = [(PKPaymentAuthorizationFooterView *)self createDefaultHeightConstraintForConstraintState:self->_constraintState];
  [(NSMutableArray *)v20 addObject:v21];

  int64_t v22 = self->_queuedConstraintState;
  if (!v22 || v22 == 2)
  {
    objc_super v23 = self->_dynamicRegularConstraints;
    payWithPasscodeButton = self->_payWithPasscodeButton;
    goto LABEL_28;
  }
  if (v22 == 1)
  {
    objc_super v23 = self->_dynamicRegularConstraints;
    payWithPasscodeButton = self->_payWithPasscodeButton;
    if (self->_compact)
    {
      long long v25 = [(UIButton *)payWithPasscodeButton topAnchor];
      int64_t v26 = [(PKPaymentAuthorizationFooterView *)self topAnchor];
      uint64_t v27 = [v25 constraintEqualToAnchor:v26 constant:34.0];
LABEL_29:
      v28 = (void *)v27;
      [(NSMutableArray *)v23 addObject:v27];

      goto LABEL_30;
    }
LABEL_28:
    long long v25 = [(UIButton *)payWithPasscodeButton centerYAnchor];
    int64_t v26 = [(PKPaymentAuthorizationFooterView *)self centerYAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    goto LABEL_29;
  }
LABEL_30:
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_dynamicRegularConstraints];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained authorizationFooterViewDidChangeConstraints:self];
  }
}

- (void)_prepareConstraints
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:0.0];
  [v3 addObject:v4];

  double v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v5];

  double v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:PKUIPixelLength()];
  [v3 addObject:v6];

  double v7 = PKConstrainedAuthorizationViewBodyFont((NSString *)*MEMORY[0x1E4FB2790]);
  [v7 _bodyLeading];

  double v8 = [(UIView *)self->_lockupView leadingAnchor];
  long long v9 = [(PKPaymentAuthorizationFooterView *)self leadingAnchor];
  long long v10 = [v8 constraintEqualToAnchor:v9];
  [v3 addObject:v10];

  double v11 = [(UIView *)self->_lockupView trailingAnchor];
  double v12 = [(PKPaymentAuthorizationFooterView *)self trailingAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  [v3 addObject:v13];

  double v14 = [(UIView *)self->_lockupView topAnchor];
  uint64_t v15 = [(PKPaymentAuthorizationFooterView *)self topAnchor];
  PKFloatRoundToPixel();
  uint64_t v16 = objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15);
  [v3 addObject:v16];

  id v17 = [(UIView *)self->_lockupView centerYAnchor];
  id v18 = [(PKPaymentAuthorizationFooterView *)self centerYAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  LODWORD(v20) = 1144750080;
  [v19 setPriority:v20];
  [v3 addObject:v19];
  id v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_glyphView attribute:9 relatedBy:0 toItem:self->_lockupView attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v21];

  int64_t v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_glyphView attribute:3 relatedBy:0 toItem:self->_lockupView attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v22];

  objc_super v23 = (void *)MEMORY[0x1E4F28DC8];
  glyphView = self->_glyphView;
  [(PKPaymentAuthorizationLayout *)self->_layout glyphDimension];
  int64_t v26 = [v23 constraintWithItem:glyphView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v25];
  [v3 addObject:v26];

  uint64_t v27 = (void *)MEMORY[0x1E4F28DC8];
  v28 = self->_glyphView;
  [(PKPaymentAuthorizationLayout *)self->_layout glyphDimension];
  uint64_t v30 = [v27 constraintWithItem:v28 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v29];
  [v3 addObject:v30];

  long long v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_payWithPasscodeButton attribute:9 relatedBy:0 toItem:self->_lockupView attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v31];

  int64x2_t v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_payWithPasscodeButton attribute:7 relatedBy:-1 toItem:self attribute:7 multiplier:1.0 constant:-20.0];
  [v3 addObject:v32];

  if ([(PKPaymentAuthorizationLayout *)self->_layout style])
  {
    PKFloatRoundToPixel();
    double v34 = v33;
  }
  else
  {
    double v34 = 30.0;
  }
  BOOL v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_labelView attribute:5 relatedBy:0 toItem:self->_lockupView attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v35];

  uint64_t v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_labelView attribute:6 relatedBy:0 toItem:self->_lockupView attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v36];

  id v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_labelView attribute:12 relatedBy:0 toItem:self->_glyphView attribute:4 multiplier:1.0 constant:v34];
  [v3 addObject:v37];

  id v38 = (NSArray *)[v3 copy];
  staticRegularConstraints = self->_staticRegularConstraints;
  self->_staticRegularConstraints = v38;

  double v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
  v43[0] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  hiddenConstraints = self->_hiddenConstraints;
  self->_hiddenConstraints = v41;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_staticRegularConstraints];
  [(PKPaymentAuthorizationFooterView *)self setNeedsUpdateConstraints];
}

- (id)_titleLabelAttributedString:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB0848];
  id v4 = a3;
  double v5 = [v3 defaultParagraphStyle];
  double v6 = (void *)[v5 mutableCopy];

  [v6 setAlignment:1];
  v14[0] = *MEMORY[0x1E4FB06F8];
  double v7 = PKConstrainedAuthorizationViewBodyFont((NSString *)*MEMORY[0x1E4FB2790]);
  uint64_t v8 = *MEMORY[0x1E4FB0738];
  v15[0] = v7;
  v15[1] = v6;
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v14[1] = v8;
  v14[2] = v9;
  long long v10 = PKAuthorizationViewValueLabelColor();
  v15[2] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v11];

  return v12;
}

- (id)_titleAttributedStringForState:(int64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 5:
      if (PKPearlIsAvailable()) {
        goto LABEL_12;
      }
      biometricConfirmationTitle = self->_biometricConfirmationTitle;
      if (!biometricConfirmationTitle)
      {
        switch(self->_confirmationStyle)
        {
          case 0uLL:
            double v6 = @"IN_APP_PAYMENT_TOUCH_ID";
            goto LABEL_27;
          case 1uLL:
            double v6 = @"IN_APP_PAYMENT_CONFIRM_WITH_TOUCH_ID";
            goto LABEL_27;
          case 2uLL:
            double v6 = @"IN_APP_PAYMENT_GET_WITH_TOUCH_ID";
            goto LABEL_27;
          case 3uLL:
            double v6 = @"IN_APP_PAYMENT_INSTALL_WITH_TOUCH_ID";
            goto LABEL_27;
          case 4uLL:
            double v6 = @"IN_APP_PAYMENT_RENT_WITH_TOUCH_ID";
            goto LABEL_27;
          case 5uLL:
            double v6 = @"IN_APP_PAYMENT_REDEEM_WITH_TOUCH_ID";
            goto LABEL_27;
          case 6uLL:
            double v6 = @"IN_APP_PAYMENT_ADD_WITH_TOUCH_ID";
            goto LABEL_27;
          case 7uLL:
            double v6 = @"IN_APP_PAYMENT_SUBSCRIBE_WITH_TOUCH_ID";
            goto LABEL_27;
          case 8uLL:
            double v6 = @"IN_APP_PAYMENT_SUBSCRIBE_AND_INSTALL_WITH_TOUCH_ID";
            goto LABEL_27;
          default:
            goto LABEL_30;
        }
      }
      goto LABEL_17;
    case 1:
      double v7 = @"GENERIC_PEARL_FAILURE";
      goto LABEL_13;
    case 3:
      if (self->_queuedConstraintState == 2)
      {
        uint64_t v8 = @" ";
        goto LABEL_29;
      }
      int64_t userIntentStyle = self->_userIntentStyle;
      switch(userIntentStyle)
      {
        case 1:
          if (self->_isPad)
          {
            if (self->_emphasizedEdge == 1) {
              double v7 = @"IN_APP_PAYMENT_PUSH_BUTTON_SECONDARY_PAD_TOP";
            }
            else {
              double v7 = @"IN_APP_PAYMENT_PUSH_BUTTON_SECONDARY_PAD";
            }
          }
          else
          {
            double v7 = @"IN_APP_PAYMENT_PUSH_BUTTON_SECONDARY";
          }
          goto LABEL_13;
        case 3:
          double v7 = @"ACCESSIBILITY_PUSH_BUTTON_SWITCH_CONTROL";
          goto LABEL_13;
        case 2:
          double v7 = @"ACCESSIBILITY_PUSH_BUTTON_ASSISTIVE_TOUCH";
LABEL_13:
          uint64_t v9 = PKLocalizedPearlString(&v7->isa);
          goto LABEL_28;
      }
LABEL_30:
      id v3 = 0;
LABEL_31:
      return v3;
    case 6:
      double v7 = @"CAMERA_OBSCURED_FOOTER_INSTRUCTION";
      goto LABEL_13;
    case 7:
      double v7 = @"POSE_OUT_OF_RANGE_DOWN_INSTRUCTION";
      goto LABEL_13;
    case 8:
      if (!self->_hasPearl) {
        goto LABEL_30;
      }
LABEL_12:
      double v7 = @"GENERIC_PEARL";
      goto LABEL_13;
    case 9:
      if (self->_state == 1) {
        goto LABEL_30;
      }
      double v6 = @"IN_APP_PAYMENT_TRY_AGAIN";
      goto LABEL_27;
    case 10:
      goto LABEL_26;
    case 11:
      biometricConfirmationTitle = self->_authorizingTitle;
      if (biometricConfirmationTitle)
      {
LABEL_17:
        uint64_t v8 = biometricConfirmationTitle;
        goto LABEL_29;
      }
      unint64_t requestType = self->_requestType;
      if (requestType == 3)
      {
LABEL_26:
        double v6 = @"IN_APP_PAYMENT_PROCESSING";
      }
      else
      {
        if (requestType == 4)
        {
          uint64_t v9 = PKLocalizedFeatureString();
          goto LABEL_28;
        }
        double v6 = @"IN_APP_PAYMENT_AUTHORIZING";
      }
LABEL_27:
      uint64_t v9 = PKLocalizedPaymentString(&v6->isa);
LABEL_28:
      uint64_t v8 = (__CFString *)v9;
      if (!v9) {
        goto LABEL_30;
      }
LABEL_29:
      id v3 = [(PKPaymentAuthorizationFooterView *)self _titleLabelAttributedString:v8];

      goto LABEL_31;
    case 12:
      double v6 = @"IN_APP_PAYMENT_AUTHORIZED";
      goto LABEL_27;
    default:
      goto LABEL_31;
  }
}

- (id)_payWithPasscodeTitleForState:(int64_t)a3
{
  confirmationTitle = self->_confirmationTitle;
  if (confirmationTitle)
  {
    id v4 = confirmationTitle;
  }
  else
  {
    unint64_t confirmationStyle = self->_confirmationStyle;
    id v4 = 0;
    switch(confirmationStyle)
    {
      case 0uLL:
        if (![(PKPaymentAuthorizationLayout *)self->_layout isAMPPayment]) {
          goto LABEL_6;
        }
        double v7 = @"IN_APP_PAYMENT_STORE_PURCHASE";
        goto LABEL_15;
      case 1uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_CONFIRM";
        goto LABEL_15;
      case 2uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_GET";
        goto LABEL_15;
      case 3uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_INSTALL";
        goto LABEL_15;
      case 4uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_RENT";
        goto LABEL_15;
      case 5uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_REDEEM";
        goto LABEL_15;
      case 6uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_ADD";
        goto LABEL_15;
      case 7uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_SUBSCRIBE";
        goto LABEL_15;
      case 8uLL:
        double v7 = @"IN_APP_PAYMENT_STORE_SUBSCRIBE_AND_INSTALL";
        goto LABEL_15;
      case 9uLL:
        break;
      default:
LABEL_6:
        double v7 = @"IN_APP_PAYMENT_PAY_WITH_PASSCODE";
LABEL_15:
        PKLocalizedPaymentString(&v7->isa);
        id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }

  return v4;
}

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  if (self->_state == 12)
  {
    double v5 = [(PKPaymentAuthorizationFooterView *)self window];

    if (v5)
    {
      kdebug_trace();
      int64_t completionStyle = self->_completionStyle;
      if (completionStyle)
      {
        if (completionStyle != 1) {
          return;
        }
        SystemSoundID v7 = 1275;
      }
      else
      {
        SystemSoundID v7 = 1394;
      }
      AudioServicesPlaySystemSound(v7);
    }
  }
}

- (void)glyphViewUserIntentEdgeDidChange:(id)a3
{
  unsigned int v4 = [a3 userIntentEdge];
  if (self->_emphasizedEdge != v4)
  {
    self->_emphasizedEdge = v4;
    if (self->_isPad)
    {
      int64_t state = self->_state;
      overrideString = self->_overrideString;
      [(PKPaymentAuthorizationFooterView *)self setState:state string:overrideString animated:1];
    }
  }
}

- (void)_payWithPasscodePressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained authorizationFooterViewPasscodeButtonPressed:self];
}

- (int64_t)state
{
  return self->_state;
}

- (PKPaymentAuthorizationLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unint64_t)confirmationStyle
{
  return self->_confirmationStyle;
}

- (int64_t)userIntentStyle
{
  return self->_userIntentStyle;
}

- (void)setUserIntentStyle:(int64_t)a3
{
  self->_int64_t userIntentStyle = a3;
}

- (NSString)biometricConfirmationTitle
{
  return self->_biometricConfirmationTitle;
}

- (void)setBiometricConfirmationTitle:(id)a3
{
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(id)a3
{
}

- (NSString)authorizingTitle
{
  return self->_authorizingTitle;
}

- (void)setAuthorizingTitle:(id)a3
{
}

- (BOOL)occludesBodyView
{
  return self->_occludesBodyView;
}

- (void)setOccludesBodyView:(BOOL)a3
{
  self->_occludesBodyView = a3;
}

- (BOOL)hidesSeparatorView
{
  return self->_hidesSeparatorView;
}

- (int64_t)completionStyle
{
  return self->_completionStyle;
}

- (void)setCompletionStyle:(int64_t)a3
{
  self->_int64_t completionStyle = a3;
}

- (BOOL)preventPasscodeFallbackForBiometricFailure
{
  return self->_preventPasscodeFallbackForBiometricFailure;
}

- (void)setPreventPasscodeFallbackForBiometricFailure:(BOOL)a3
{
  self->_preventPasscodeFallbackForBiometricFailure = a3;
}

- (BOOL)preventBiometricStateFallbacks
{
  return self->_preventBiometricStateFallbacks;
}

- (void)setPreventBiometricStateFallbacks:(BOOL)a3
{
  self->_preventBiometricStateFallbacks = a3;
}

- (PKPaymentAuthorizationFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizingTitle, 0);
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_biometricConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_dynamicRegularConstraints, 0);
  objc_storeStrong((id *)&self->_staticRegularConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenConstraints, 0);
  objc_storeStrong((id *)&self->_separatorLeftConstraint, 0);
  objc_storeStrong((id *)&self->_deferredCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_deferredStateString, 0);
  objc_storeStrong((id *)&self->_overrideString, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_passbookPaymentDetailsView, 0);
  objc_storeStrong((id *)&self->_payWithPasscodeButton, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end