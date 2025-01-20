@interface UIKeyboardGlobeKeyIntroductionView
- (NSDate)startDate;
- (UIButton)continueButton;
- (UIKeyboardGlobeKeyIntroductionView)initWithFrame:(CGRect)a3 completion:(id)a4;
- (UILabel)titleLabel;
- (UITextView)descriptionLabel;
- (_UIBackdropView)backdropView;
- (id)completionBlock;
- (int64_t)backdropStyleForRenderConfig:(id)a3;
- (void)continueButtonTapped;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation UIKeyboardGlobeKeyIntroductionView

- (UIKeyboardGlobeKeyIntroductionView)initWithFrame:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UIKeyboardGlobeKeyIntroductionView;
  v10 = -[UIView initWithFrame:](&v46, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIKeyboardGlobeKeyIntroductionView *)v10 setCompletionBlock:v9];
    [(UIView *)v11 setUserInteractionEnabled:1];
    [(UIView *)v11 setAutoresizingMask:18];
    v12 = [(UIView *)v11 _inheritedRenderConfig];
    v13 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", [v12 backdropStyle]);
    [(UIKeyboardGlobeKeyIntroductionView *)v11 setBackdropView:v13];

    v14 = [(UIKeyboardGlobeKeyIntroductionView *)v11 backdropView];
    [(UIView *)v11 addSubview:v14];

    v15 = _UILocalizedStringInSystemLanguage(@"Quickly Change Keyboards", @"Quickly Change Keyboards");
    v16 = _UILocalizedStringInSystemLanguage(@"Continue", @"Continue");
    if ([v12 lightKeyboard]) {
      +[UIColor blackColor];
    }
    else {
    v17 = +[UIColor whiteColor];
    }
    v18 = [UILabel alloc];
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v23 = -[UILabel initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
    [(UIKeyboardGlobeKeyIntroductionView *)v11 setTitleLabel:v23];

    v24 = [(UIKeyboardGlobeKeyIntroductionView *)v11 titleLabel];
    [v24 setTextColor:v17];

    v25 = [(UIKeyboardGlobeKeyIntroductionView *)v11 titleLabel];
    [v25 setTextAlignment:1];

    v26 = [(UIKeyboardGlobeKeyIntroductionView *)v11 titleLabel];
    [v26 setText:v15];

    v27 = [(UIKeyboardGlobeKeyIntroductionView *)v11 titleLabel];
    [(UIView *)v11 addSubview:v27];

    v28 = -[UITextView initWithFrame:]([UITextView alloc], "initWithFrame:", v19, v20, v21, v22);
    [(UIKeyboardGlobeKeyIntroductionView *)v11 setDescriptionLabel:v28];

    v29 = [(UIKeyboardGlobeKeyIntroductionView *)v11 descriptionLabel];
    [v29 setTextColor:v17];

    v30 = +[UIColor clearColor];
    v31 = [(UIKeyboardGlobeKeyIntroductionView *)v11 descriptionLabel];
    [v31 setBackgroundColor:v30];

    v32 = [(UIKeyboardGlobeKeyIntroductionView *)v11 descriptionLabel];
    [v32 setEditable:0];

    v33 = [(UIKeyboardGlobeKeyIntroductionView *)v11 descriptionLabel];
    [v33 setTextAlignment:1];

    v34 = [(UIKeyboardGlobeKeyIntroductionView *)v11 descriptionLabel];
    [v34 setUserInteractionEnabled:0];

    v35 = [(UIKeyboardGlobeKeyIntroductionView *)v11 descriptionLabel];
    [(UIView *)v11 addSubview:v35];

    v36 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v19, v20, v21, v22);
    [(UIKeyboardGlobeKeyIntroductionView *)v11 setContinueButton:v36];

    v37 = [(UIKeyboardGlobeKeyIntroductionView *)v11 continueButton];
    [v37 setTitle:v16 forState:0];

    v38 = [(UIKeyboardGlobeKeyIntroductionView *)v11 continueButton];
    v39 = +[UIColor linkColor];
    [v38 setTitleColor:v39 forState:0];

    v40 = [(UIKeyboardGlobeKeyIntroductionView *)v11 continueButton];
    v41 = +[UIColor linkColor];
    [v40 setTitleColor:v41 forState:0];

    v42 = [(UIKeyboardGlobeKeyIntroductionView *)v11 continueButton];
    [v42 addTarget:v11 action:sel_continueButtonTapped forControlEvents:64];

    v43 = [(UIKeyboardGlobeKeyIntroductionView *)v11 continueButton];
    [(UIView *)v11 addSubview:v43];

    v44 = [MEMORY[0x1E4F1C9C8] date];
    [(UIKeyboardGlobeKeyIntroductionView *)v11 setStartDate:v44];
  }
  return v11;
}

- (void)layoutSubviews
{
  v107[3] = *MEMORY[0x1E4F143B8];
  v103.receiver = self;
  v103.super_class = (Class)UIKeyboardGlobeKeyIntroductionView;
  [(UIView *)&v103 layoutSubviews];
  v107[0] = @"UICTFontTextStyleBody";
  v107[1] = @"UICTFontTextStyleSubhead";
  v107[2] = @"UICTFontTextStyleSubhead";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:3];
  v106[0] = @"UICTFontTextStyleBody";
  v106[1] = @"UICTFontTextStyleSubhead";
  v106[2] = @"UICTFontTextStyleFootnote";
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:3];
  v4 = [(UIView *)self _inheritedRenderConfig];
  if ([v4 lightKeyboard]) {
    +[UIColor blackColor];
  }
  else {
  v5 = +[UIColor whiteColor];
  }

  v99 = _UILocalizedStringInSystemLanguage(@"Tap %@ to switch keyboards.\n\nTouch and hold to select from a list.", @"Tap %@ to switch keyboards.\n\nTouch and hold to select from a list.");
  uint64_t v6 = [v99 rangeOfString:@"%@"];
  uint64_t v8 = v7;
  id v9 = (void *)[objc_alloc((Class)off_1E52D2EB0) initWithData:0 ofType:0];
  v10 = +[UIImage systemImageNamed:@"globe"];
  v11 = [v10 imageWithTintColor:v5 renderingMode:1];
  v98 = v9;
  [v9 setImage:v11];

  v12 = [off_1E52D2DD0 defaultParagraphStyle];
  v13 = (void *)[v12 mutableCopy];

  v97 = v13;
  [v13 setAlignment:1];
  unint64_t v14 = 0;
  uint64_t v94 = *(void *)off_1E52D2040;
  uint64_t v89 = v8;
  uint64_t v90 = v6;
  BOOL v16 = v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0;
  BOOL v93 = v16;
  uint64_t v91 = *(void *)off_1E52D21B8;
  uint64_t v92 = *(void *)off_1E52D2048;
  v95 = v5;
  v96 = v3;
  while (v14 < [v3 count])
  {
    v102 = [v3 objectAtIndexedSubscript:v14];
    v101 = objc_msgSend(off_1E52D39C0, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
    v17 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", 0.0);
    v18 = [(UIKeyboardGlobeKeyIntroductionView *)self titleLabel];
    [v18 setFont:v17];

    double v19 = [v100 objectAtIndexedSubscript:v14];
    double v20 = [off_1E52D39B8 preferredFontForTextStyle:v19];
    double v21 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v98];
    id v22 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v104 = v94;
    v105 = v20;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    v24 = (void *)[v22 initWithString:v99 attributes:v23];

    if (v93) {
      objc_msgSend(v24, "replaceCharactersInRange:withAttributedString:", v90, v89, v21);
    }
    objc_msgSend(v24, "addAttribute:value:range:", v92, v5, 0, objc_msgSend(v24, "length"));
    objc_msgSend(v24, "addAttribute:value:range:", v91, v97, 0, objc_msgSend(v24, "length"));
    v25 = [(UIKeyboardGlobeKeyIntroductionView *)self descriptionLabel];
    [v25 setAttributedText:v24];

    [(UIView *)self bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [(UIView *)self window];
    [v34 safeAreaInsets];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    double v41 = 0.12;
    if (!v14)
    {
      if (v33 < 335.0
        || (double v41 = 0.2, v38 == 0.0) && (v42 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL, double v41 = 0.2, v42 != 1))
      {
        double v41 = 0.16;
      }
    }
    double v43 = 19.0;
    if (v38 != 0.0) {
      double v43 = v38;
    }
    if (v36 == 0.0)
    {
      double v44 = 24.0;
      if (v14) {
        double v45 = v40;
      }
      else {
        double v45 = 24.0;
      }
      if (v14) {
        double v44 = v36;
      }
      if (v31 < 414.0) {
        double v40 = v45;
      }
      else {
        double v40 = 44.0;
      }
      if (v31 < 414.0) {
        double v36 = v44;
      }
      else {
        double v36 = 44.0;
      }
    }
    double v46 = round(v33 * v41);
    double v47 = v27 + v36;
    double v48 = v29 + v46;
    double v49 = v31 - (v40 + v36);
    double v50 = v33 - (v43 + v46);
    v51 = [(UIKeyboardGlobeKeyIntroductionView *)self titleLabel];
    v52 = [v51 font];
    [v52 lineHeight];
    double v54 = ceil(v53);

    v108.origin.double x = v47;
    v108.origin.double y = v48;
    v108.size.double width = v49;
    v108.size.double height = v50;
    double MinX = CGRectGetMinX(v108);
    v109.origin.double x = v47;
    v109.origin.double y = v48;
    v109.size.double width = v49;
    v109.size.double height = v50;
    double MinY = CGRectGetMinY(v109);
    double v57 = 15.0;
    if (v14 > 1) {
      double v57 = 8.0;
    }
    double v58 = v57 + MinY;
    v110.origin.double x = v47;
    v110.origin.double y = v48;
    v110.size.double width = v49;
    v110.size.double height = v50;
    double Width = CGRectGetWidth(v110);
    v60 = [(UIKeyboardGlobeKeyIntroductionView *)self titleLabel];
    objc_msgSend(v60, "setFrame:", MinX, v58, Width, v54);

    v111.origin.double x = v47;
    v111.origin.double y = v48;
    v111.size.double width = v49;
    v111.size.double height = v50;
    double v61 = CGRectGetMinX(v111);
    v112.origin.double x = v47;
    v112.origin.double y = v48;
    v112.size.double width = v49;
    v112.size.double height = v50;
    CGFloat v62 = CGRectGetMaxY(v112) - v54;
    v113.origin.double x = v47;
    v113.origin.double y = v48;
    v113.size.double width = v49;
    v113.size.double height = v50;
    double v63 = CGRectGetWidth(v113);
    v64 = [(UIKeyboardGlobeKeyIntroductionView *)self continueButton];
    objc_msgSend(v64, "setFrame:", v61, v62, v63, v54);

    v114.origin.double x = v47;
    v114.origin.double y = v48;
    v114.size.double width = v49;
    v114.size.double height = v50;
    double v65 = CGRectGetMinX(v114);
    v66 = [(UIKeyboardGlobeKeyIntroductionView *)self titleLabel];
    [v66 frame];
    CGFloat v67 = CGRectGetMaxY(v115) + 18.0;
    v116.origin.double x = v47;
    v116.origin.double y = v48;
    v116.size.double width = v49;
    v116.size.double height = v50;
    double v68 = CGRectGetWidth(v116);
    v69 = [(UIKeyboardGlobeKeyIntroductionView *)self continueButton];
    [v69 frame];
    double v70 = CGRectGetMinY(v117);
    v71 = [(UIKeyboardGlobeKeyIntroductionView *)self titleLabel];
    [v71 frame];
    double v72 = v70 - CGRectGetMaxY(v118) + -18.0;
    v73 = [(UIKeyboardGlobeKeyIntroductionView *)self descriptionLabel];
    objc_msgSend(v73, "setFrame:", v65, v67, v68, v72);

    v74 = [(UIKeyboardGlobeKeyIntroductionView *)self descriptionLabel];
    [v74 contentSize];
    double v76 = v75;
    v77 = [(UIKeyboardGlobeKeyIntroductionView *)self descriptionLabel];
    [v77 frame];
    double v79 = v78;

    if (v76 <= v79)
    {

      v5 = v95;
      v3 = v96;
      break;
    }
    [(UIView *)self bounds];
    double v81 = v80;
    double v83 = v82;
    double v85 = v84;
    double v87 = v86;
    v88 = [(UIKeyboardGlobeKeyIntroductionView *)self backdropView];
    objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);

    ++v14;
    v5 = v95;
    v3 = v96;
    if (v14 == 3) {
      break;
    }
  }
}

- (int64_t)backdropStyleForRenderConfig:(id)a3
{
  return [a3 backdropStyle];
}

- (void)continueButtonTapped
{
  v3 = [(UIKeyboardGlobeKeyIntroductionView *)self completionBlock];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    v5 = [(UIKeyboardGlobeKeyIntroductionView *)self startDate];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    +[UIKBAnalyticsDispatcher globeKeyEducationShown:v7];
    uint64_t v8 = [(UIKeyboardGlobeKeyIntroductionView *)self completionBlock];
    v8[2]();
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end