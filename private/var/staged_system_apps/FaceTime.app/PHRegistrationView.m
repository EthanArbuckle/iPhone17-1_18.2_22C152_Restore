@interface PHRegistrationView
- (BOOL)showsAuthKitUI;
- (PHRegistrationViewDelegate)registrationDelegate;
- (UIActivityIndicatorView)signingInSpinner;
- (UIButton)continueButton;
- (UIButton)learnMoreButton;
- (UILabel)errorLabel;
- (UILabel)signingInLabel;
- (UILabel)supplementalVerbiageLabel;
- (UILabel)titleLabel;
- (UILabel)verbiageLabel;
- (UILabel)waitingForActivationLabel;
- (UIView)authKitSignInView;
- (UIView)privacyLinkView;
- (double)originalAuthKitViewHeight;
- (void)_continueDragEnter:(id)a3;
- (void)_continueDragExit:(id)a3;
- (void)_continueTouchDown:(id)a3;
- (void)_continueTouchUpInside:(id)a3;
- (void)_continueTouchUpOutside:(id)a3;
- (void)_learnMorePressed:(id)a3;
- (void)_setContinueButtonTouched:(BOOL)a3;
- (void)layoutSubviews;
- (void)setActivationFailed:(BOOL)a3;
- (void)setAuthKitSignInView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setOriginalAuthKitViewHeight:(double)a3;
- (void)setPrivacyLinkView:(id)a3;
- (void)setRegistrationDelegate:(id)a3;
- (void)setShowsAuthKitUI:(BOOL)a3;
- (void)setSigningIn:(BOOL)a3;
- (void)setSigningInLabel:(id)a3;
- (void)setSigningInSpinner:(id)a3;
- (void)setSupplementalVerbiageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerbiageLabel:(id)a3;
- (void)setWaitingForActivationLabel:(id)a3;
@end

@implementation PHRegistrationView

- (void)setAuthKitSignInView:(id)a3
{
  v4 = (UIView *)a3;
  if (v4) {
    [(PHRegistrationView *)self setShowsAuthKitUI:1];
  }
  [(UIView *)self->_authKitSignInView removeFromSuperview];
  authKitSignInView = self->_authKitSignInView;
  self->_authKitSignInView = v4;
  v6 = v4;

  v7 = self->_authKitSignInView;
  v8 = +[UIColor clearColor];
  [(UIView *)v7 setBackgroundColor:v8];

  [(UIView *)self->_authKitSignInView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(PHRegistrationView *)self addSubview:self->_authKitSignInView];
  [(UIView *)self->_authKitSignInView frame];
  double v10 = v9;

  [(PHRegistrationView *)self setOriginalAuthKitViewHeight:v10];
}

- (void)setPrivacyLinkView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_privacyLinkView removeFromSuperview];
  privacyLinkView = self->_privacyLinkView;
  self->_privacyLinkView = v4;
  v6 = v4;

  [(UIView *)self->_privacyLinkView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(PHRegistrationView *)self addSubview:self->_privacyLinkView];
}

- (void)setSigningIn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHRegistrationView *)self showsAuthKitUI])
  {
    [(UIView *)self->_authKitSignInView setHidden:v3];
    v5 = [(PHRegistrationView *)self signingInLabel];
    uint64_t v6 = v3 ^ 1;
    [v5 setHidden:v6];

    v7 = [(PHRegistrationView *)self signingInSpinner];
    [v7 setHidden:v6];

    v8 = [(PHRegistrationView *)self signingInSpinner];
    double v9 = v8;
    if (v6) {
      [v8 stopAnimating];
    }
    else {
      [v8 startAnimating];
    }

    [(PHRegistrationView *)self setNeedsDisplay];
  }
  else
  {
    double v10 = [(PHRegistrationView *)self continueButton];
    v11 = v10;
    if (v3)
    {
      [v10 setHidden:1];

      v12 = [(PHRegistrationView *)self waitingForActivationLabel];
      id v14 = v12;
      uint64_t v13 = 0;
    }
    else
    {
      [v10 setHidden:0];

      v12 = [(PHRegistrationView *)self waitingForActivationLabel];
      id v14 = v12;
      uint64_t v13 = 1;
    }
    [v12 setHidden:v13];
  }
}

- (void)setActivationFailed:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PHRegistrationView *)self showsAuthKitUI])
  {
    id v5 = [(PHRegistrationView *)self errorLabel];
    [v5 setHidden:!v3];
  }
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    uint64_t v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"FACETIME" value:&stru_1000A3488 table:@"General"];
    [(UILabel *)self->_titleLabel setText:v7];

    if ([(PHRegistrationView *)self showsAuthKitUI]) {
      +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    }
    else {
    v8 = +[UIFont _thinSystemFontOfSize:35.0];
    }
    [(UILabel *)self->_titleLabel setFont:v8];

    double v9 = +[UIColor whiteColor];
    [(UILabel *)self->_titleLabel setTextColor:v9];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    double v10 = +[UIColor clearColor];
    [(UILabel *)self->_titleLabel setBackgroundColor:v10];

    [(UILabel *)self->_titleLabel sizeToFit];
    [(PHRegistrationView *)self addSubview:self->_titleLabel];
    [(PHRegistrationView *)self setNeedsLayout];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)verbiageLabel
{
  verbiageLabel = self->_verbiageLabel;
  if (!verbiageLabel)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_verbiageLabel;
    self->_verbiageLabel = v4;

    id v6 = objc_alloc_init((Class)TUFeatureFlags);
    if ([(PHRegistrationView *)self showsAuthKitUI])
    {
      unsigned int v7 = [v6 appleAccountRebrandEnabled];
      v8 = +[NSBundle mainBundle];
      double v9 = v8;
      if (v7) {
        CFStringRef v10 = @"FACETIME_REGISTRATION_BLURB_APPLEACCOUNT";
      }
      else {
        CFStringRef v10 = @"FACETIME_REGISTRATION_BLURB";
      }
    }
    else
    {
      v8 = +[NSBundle mainBundle];
      double v9 = v8;
      CFStringRef v10 = @"FACETIME_REGISTRATION_BLURB_NON_AUTHKIT";
    }
    v11 = [v8 localizedStringForKey:v10 value:&stru_1000A3488 table:@"General"];

    [(UILabel *)self->_verbiageLabel setText:v11];
    if ([(PHRegistrationView *)self showsAuthKitUI]) {
      +[UIFont systemFontOfSize:17.0];
    }
    else {
    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    [(UILabel *)self->_verbiageLabel setFont:v12];

    uint64_t v13 = +[UIColor whiteColor];
    [(UILabel *)self->_verbiageLabel setTextColor:v13];

    [(UILabel *)self->_verbiageLabel setNumberOfLines:0];
    [(UILabel *)self->_verbiageLabel setLineBreakMode:0];
    [(UILabel *)self->_verbiageLabel setTextAlignment:1];
    id v14 = +[UIColor clearColor];
    [(UILabel *)self->_verbiageLabel setBackgroundColor:v14];

    [(UILabel *)self->_verbiageLabel setAutoresizingMask:18];
    [(PHRegistrationView *)self addSubview:self->_verbiageLabel];
    [(PHRegistrationView *)self setNeedsLayout];

    verbiageLabel = self->_verbiageLabel;
  }

  return verbiageLabel;
}

- (UILabel)supplementalVerbiageLabel
{
  supplementalVerbiageLabel = self->_supplementalVerbiageLabel;
  if (!supplementalVerbiageLabel)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_supplementalVerbiageLabel;
    self->_supplementalVerbiageLabel = v4;

    id v6 = +[NSBundle mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"FACETIME_REGISTRATION_BLURB_NON_AUTHKIT_SUPPLEMENT" value:&stru_1000A3488 table:@"General"];
    [(UILabel *)self->_supplementalVerbiageLabel setText:v7];

    v8 = +[UIFont systemFontOfSize:17.0];
    [(UILabel *)self->_supplementalVerbiageLabel setFont:v8];

    double v9 = +[UIColor whiteColor];
    [(UILabel *)self->_supplementalVerbiageLabel setTextColor:v9];

    [(UILabel *)self->_supplementalVerbiageLabel setNumberOfLines:0];
    [(UILabel *)self->_supplementalVerbiageLabel setLineBreakMode:0];
    [(UILabel *)self->_supplementalVerbiageLabel setTextAlignment:1];
    CFStringRef v10 = +[UIColor clearColor];
    [(UILabel *)self->_supplementalVerbiageLabel setBackgroundColor:v10];

    [(UILabel *)self->_supplementalVerbiageLabel setAutoresizingMask:18];
    [(PHRegistrationView *)self addSubview:self->_supplementalVerbiageLabel];
    [(PHRegistrationView *)self setNeedsLayout];
    supplementalVerbiageLabel = self->_supplementalVerbiageLabel;
  }

  return supplementalVerbiageLabel;
}

- (UILabel)signingInLabel
{
  signingInLabel = self->_signingInLabel;
  if (!signingInLabel)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_signingInLabel;
    self->_signingInLabel = v4;

    id v6 = +[NSBundle mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"FACETIME_REGISTRATION_SIGNING_IN" value:&stru_1000A3488 table:@"General"];
    [(UILabel *)self->_signingInLabel setText:v7];

    v8 = +[UIFont systemFontOfSize:17.0];
    [(UILabel *)self->_signingInLabel setFont:v8];

    double v9 = +[UIColor whiteColor];
    [(UILabel *)self->_signingInLabel setTextColor:v9];

    [(UILabel *)self->_signingInLabel setNumberOfLines:0];
    [(UILabel *)self->_signingInLabel setLineBreakMode:0];
    [(UILabel *)self->_signingInLabel setTextAlignment:1];
    CFStringRef v10 = +[UIColor clearColor];
    [(UILabel *)self->_signingInLabel setBackgroundColor:v10];

    [(UILabel *)self->_signingInLabel setAutoresizingMask:18];
    [(UILabel *)self->_signingInLabel setHidden:1];
    [(PHRegistrationView *)self addSubview:self->_signingInLabel];
    [(PHRegistrationView *)self setNeedsLayout];
    signingInLabel = self->_signingInLabel;
  }

  return signingInLabel;
}

- (UILabel)waitingForActivationLabel
{
  waitingForActivationLabel = self->_waitingForActivationLabel;
  if (!waitingForActivationLabel)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_waitingForActivationLabel;
    self->_waitingForActivationLabel = v4;

    id v6 = +[NSBundle mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"FACETIME_REGISTRATION_WAITING_FOR_ACTIVATION" value:&stru_1000A3488 table:@"General"];
    [(UILabel *)self->_waitingForActivationLabel setText:v7];

    v8 = +[UIFont systemFontOfSize:17.0];
    [(UILabel *)self->_waitingForActivationLabel setFont:v8];

    double v9 = +[UIColor whiteColor];
    [(UILabel *)self->_waitingForActivationLabel setTextColor:v9];

    [(UILabel *)self->_waitingForActivationLabel setNumberOfLines:0];
    [(UILabel *)self->_waitingForActivationLabel setLineBreakMode:0];
    [(UILabel *)self->_waitingForActivationLabel setTextAlignment:1];
    CFStringRef v10 = +[UIColor clearColor];
    [(UILabel *)self->_waitingForActivationLabel setBackgroundColor:v10];

    [(UILabel *)self->_waitingForActivationLabel setAutoresizingMask:18];
    [(UILabel *)self->_waitingForActivationLabel setHidden:1];
    [(PHRegistrationView *)self addSubview:self->_waitingForActivationLabel];
    [(PHRegistrationView *)self setNeedsLayout];
    waitingForActivationLabel = self->_waitingForActivationLabel;
  }

  return waitingForActivationLabel;
}

- (UILabel)errorLabel
{
  errorLabel = self->_errorLabel;
  if (!errorLabel)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_errorLabel;
    self->_errorLabel = v4;

    id v6 = +[NSBundle mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"FACETIME_REGISTRATION_ACTIVATION_ERROR" value:&stru_1000A3488 table:@"General"];
    [(UILabel *)self->_errorLabel setText:v7];

    v8 = +[UIFont systemFontOfSize:17.0];
    [(UILabel *)self->_errorLabel setFont:v8];

    double v9 = +[UIColor redColor];
    [(UILabel *)self->_errorLabel setTextColor:v9];

    [(UILabel *)self->_errorLabel setNumberOfLines:0];
    [(UILabel *)self->_errorLabel setLineBreakMode:0];
    [(UILabel *)self->_errorLabel setTextAlignment:1];
    CFStringRef v10 = +[UIColor clearColor];
    [(UILabel *)self->_errorLabel setBackgroundColor:v10];

    [(UILabel *)self->_errorLabel setAutoresizingMask:18];
    [(UILabel *)self->_errorLabel setHidden:1];
    [(PHRegistrationView *)self addSubview:self->_errorLabel];
    [(PHRegistrationView *)self setNeedsLayout];
    errorLabel = self->_errorLabel;
  }

  return errorLabel;
}

- (UIActivityIndicatorView)signingInSpinner
{
  signingInSpinner = self->_signingInSpinner;
  if (!signingInSpinner)
  {
    v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_signingInSpinner;
    self->_signingInSpinner = v4;

    id v6 = +[UIColor whiteColor];
    [(UIActivityIndicatorView *)self->_signingInSpinner setColor:v6];

    [(UIActivityIndicatorView *)self->_signingInSpinner setHidden:1];
    [(PHRegistrationView *)self addSubview:self->_signingInSpinner];
    [(PHRegistrationView *)self setNeedsLayout];
    signingInSpinner = self->_signingInSpinner;
  }

  return signingInSpinner;
}

- (UIButton)learnMoreButton
{
  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    v4 = +[UIButton buttonWithType:1];
    id v5 = self->_learnMoreButton;
    self->_learnMoreButton = v4;

    id v6 = self->_learnMoreButton;
    unsigned int v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"FACETIME_REGISTRATION_LEARN_MORE" value:&stru_1000A3488 table:@"General"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    double v9 = [(UIButton *)self->_learnMoreButton titleLabel];
    CFStringRef v10 = +[UIFont systemFontOfSize:17.0];
    [v9 setFont:v10];

    [(UIButton *)self->_learnMoreButton setAutoresizingMask:5];
    [(UIButton *)self->_learnMoreButton addTarget:self action:"_learnMorePressed:" forControlEvents:64];
    [(PHRegistrationView *)self addSubview:self->_learnMoreButton];
    [(PHRegistrationView *)self setNeedsLayout];
    learnMoreButton = self->_learnMoreButton;
  }

  return learnMoreButton;
}

- (UIButton)continueButton
{
  continueButton = self->_continueButton;
  if (!continueButton)
  {
    v4 = +[UIButton buttonWithType:1];
    id v5 = self->_continueButton;
    self->_continueButton = v4;

    id v6 = self->_continueButton;
    unsigned int v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"CONTINUE" value:&stru_1000A3488 table:@"General"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    double v9 = [(UIButton *)self->_continueButton titleLabel];
    CFStringRef v10 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightMedium];
    [v9 setFont:v10];

    v11 = self->_continueButton;
    v12 = +[UIColor whiteColor];
    [(UIButton *)v11 setTitleColor:v12 forState:0];

    uint64_t v13 = self->_continueButton;
    id v14 = +[UIColor whiteColor];
    v15 = [v14 colorWithAlphaComponent:0.25];
    [(UIButton *)v13 setTitleColor:v15 forState:1];

    v16 = self->_continueButton;
    v17 = [UIApp applicationTintColor];
    [(UIButton *)v16 setBackgroundColor:v17];

    [(UIButton *)self->_continueButton _setCornerRadius:8.0];
    [(UIButton *)self->_continueButton setAutoresizingMask:5];
    [(UIButton *)self->_continueButton addTarget:self action:"_continueTouchUpInside:" forControlEvents:64];
    [(UIButton *)self->_continueButton addTarget:self action:"_continueTouchDown:" forControlEvents:1];
    [(UIButton *)self->_continueButton addTarget:self action:"_continueTouchUpOutside:" forEvents:128];
    [(UIButton *)self->_continueButton addTarget:self action:"_continueDragExit:" forEvents:32];
    [(UIButton *)self->_continueButton addTarget:self action:"_continueDragEnter:" forEvents:16];
    [(PHRegistrationView *)self addSubview:self->_continueButton];
    [(PHRegistrationView *)self setNeedsLayout];
    continueButton = self->_continueButton;
  }

  return continueButton;
}

- (void)layoutSubviews
{
  [(PHRegistrationView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  rect_16 = [(PHRegistrationView *)self titleLabel];
  [rect_16 frame];
  double v12 = v11;
  double v14 = v13;
  CGFloat rect = v4;
  CGFloat rect_8 = v6;
  v166.origin.x = v4;
  v166.origin.y = v6;
  v166.size.width = v8;
  v166.size.height = v10;
  double v15 = floor(CGRectGetMidX(v166) + v12 * -0.5);
  v16 = [rect_16 font];
  [v16 ascender];
  double v18 = v17;

  if ([(PHRegistrationView *)self showsAuthKitUI])
  {
    double v19 = floor(87.0 - v18);
  }
  else
  {
    [(PHRegistrationView *)self bounds];
    double v19 = -(UIStatusBarHeight - v20 * 0.33);
  }
  [rect_16 setFrame:v15, v19, v12, v14];
  v167.origin.x = v15;
  v167.origin.y = v19;
  v167.size.width = v12;
  v167.size.height = v14;
  double MaxY = CGRectGetMaxY(v167);
  v22 = [rect_16 font];
  [v22 descender];
  double v24 = MaxY + v23 + 43.0;

  v25 = [(PHRegistrationView *)self verbiageLabel];
  v168.origin.x = rect;
  v168.origin.y = v6;
  v168.size.width = v8;
  v168.size.height = v10;
  [v25 sizeThatFits:CGRectGetWidth(v168) + -20.0, 1.79769313e308];
  double v27 = v26;
  double v29 = v28;
  v169.origin.x = rect;
  v169.origin.y = v6;
  v169.size.width = v8;
  v169.size.height = v10;
  CGFloat v30 = floor(CGRectGetMidX(v169) + v27 * -0.5);
  v31 = [v25 font];
  [v31 ascender];
  CGFloat v33 = floor(v24 - v32);

  [v25 setFrame:v30, v33, v27, v29];
  v170.origin.x = v30;
  v170.origin.y = v33;
  v170.size.width = v27;
  v170.size.height = v29;
  double v34 = CGRectGetMaxY(v170);
  v35 = [v25 font];
  [v35 descender];
  double v37 = v34 + v36 + 24.0;

  if ([(PHRegistrationView *)self showsAuthKitUI])
  {
    v38 = [(PHRegistrationView *)self learnMoreButton];
    [v38 sizeToFit];
    [v38 bounds];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    double v45 = v44;
    if (v39 <= v8) {
      double v46 = v39;
    }
    else {
      double v46 = v8;
    }
    v171.origin.x = rect;
    v171.origin.y = v6;
    v171.size.width = v8;
    v171.size.height = v10;
    double MidX = CGRectGetMidX(v171);
    v172.origin.x = v41;
    v172.origin.y = v43;
    v172.size.width = v46;
    v172.size.height = v45;
    CGFloat v48 = floor(MidX - CGRectGetWidth(v172) * 0.5);
    v49 = [v38 titleLabel];
    v50 = [v49 font];
    [v50 ascender];
    double v52 = v37 - v51;
    v53 = [v38 titleLabel];
    [v53 origin];
    CGFloat v55 = floor(v52 - v54);

    [v38 setFrame:v48, v55, v46, v45];
    v173.origin.x = v48;
    v173.origin.y = v55;
    v173.size.width = v46;
    v173.size.height = v45;
    double v56 = CGRectGetMaxY(v173);
    v57 = [v38 titleLabel];
    [v57 origin];
    double v59 = v56 - v58;
    v60 = [v38 titleLabel];
    v61 = [v60 font];
    [v61 descender];
    double v63 = ceil(v59 + v62 + 40.0);

    [(UIView *)self->_authKitSignInView frame];
    CGFloat v66 = v65;
    CGFloat v68 = v67;
    if (v64 <= v8) {
      double v69 = v64;
    }
    else {
      double v69 = v8;
    }
    [(PHRegistrationView *)self originalAuthKitViewHeight];
    double v71 = v70;
    v174.origin.x = rect;
    v174.origin.y = rect_8;
    v174.size.width = v8;
    v174.size.height = v10;
    double v72 = CGRectGetMidX(v174);
    v175.origin.x = v66;
    v175.origin.y = v68;
    v175.size.width = v69;
    v175.size.height = v71;
    CGFloat v73 = floor(v72 - CGRectGetWidth(v175) * 0.5);
    -[UIView setFrame:](self->_authKitSignInView, "setFrame:", v73, v63, v69, v71);
    [(UIView *)self->_authKitSignInView setTranslatesAutoresizingMaskIntoConstraints:1];
    v74 = [(PHRegistrationView *)self signingInLabel];
    [v74 sizeToFit];

    v75 = [(PHRegistrationView *)self signingInLabel];
    [v75 frame];
    double v77 = v76;
    double v79 = v78;

    [(PHRegistrationView *)self frame];
    CGFloat v161 = v10;
    double v81 = v80 * 0.5 - v77 * 0.5;
    v82 = [(PHRegistrationView *)self signingInLabel];
    [v82 setFrame:v81, v63, v77, v79];

    v83 = [(PHRegistrationView *)self signingInSpinner];
    [v83 sizeToFit];

    v84 = [(PHRegistrationView *)self signingInSpinner];
    [v84 frame];
    double v86 = v85;
    double v88 = v87;

    v89 = [(PHRegistrationView *)self signingInSpinner];
    [v89 setFrame:v81 - v86 + -6.0, v63, v86, v88];

    v176.origin.x = v73;
    v176.origin.y = v63;
    v176.size.width = v69;
    v176.size.height = v71;
    CGFloat v90 = ceil(CGRectGetMaxY(v176));
    v91 = [(PHRegistrationView *)self privacyLinkView];
    CGFloat v92 = v8 * 0.75;
    LODWORD(v93) = 1112014848;
    LODWORD(v94) = 1132068864;
    [v91 systemLayoutSizeFittingSize:v8 * 0.75 withHorizontalFittingPriority:0.0 verticalFittingPriority:v93 v94];
    double v96 = v95;
    [v91 bounds];
    CGFloat v98 = v97;
    [v91 bounds];
    CGFloat v100 = v99;
    v177.origin.x = rect;
    v177.origin.y = rect_8;
    v177.size.width = v8;
    v177.size.height = v161;
    double v101 = CGRectGetMidX(v177);
    v178.origin.x = v98;
    v178.origin.y = v100;
    v178.size.width = v92;
    v178.size.height = v96;
    CGFloat v102 = floor(v101 - CGRectGetWidth(v178) * 0.5);
    [v91 setFrame:v102, v90, v92, v96];
    v179.origin.x = v102;
    v179.origin.y = v90;
    v179.size.width = v92;
    v179.size.height = v96;
    double v103 = ceil(CGRectGetMaxY(v179) + 30.0);
  }
  else
  {
    if (MGGetBoolAnswer())
    {
      v104 = [(PHRegistrationView *)self supplementalVerbiageLabel];
      CGFloat v105 = v6;
      v180.origin.x = rect;
      v180.origin.y = v6;
      v180.size.width = v8;
      v180.size.height = v10;
      [v104 sizeThatFits:CGRectGetWidth(v180) + -20.0, 1.79769313e308];
      double v107 = v106;
      double v108 = v37;
      double v110 = v109;
      v181.origin.x = rect;
      v181.origin.y = rect_8;
      v181.size.width = v8;
      v181.size.height = v10;
      double v111 = v10;
      CGFloat v112 = floor(CGRectGetMidX(v181) + v107 * -0.5);
      v113 = [v25 font];
      [v113 ascender];
      double v115 = floor(v108 - v114);

      CGFloat v116 = v115 + 24.0;
      [v104 setFrame:v112, v116, v107, v110];
      v182.origin.x = v112;
      CGFloat v10 = v111;
      v182.origin.y = v116;
      CGFloat v117 = rect;
      v182.size.width = v107;
      v182.size.height = v110;
      double v118 = CGRectGetMaxY(v182);
      v119 = [v104 font];
      [v119 descender];
      double v121 = v118 + v120 + 24.0;
    }
    else
    {
      CGFloat v117 = rect;
      CGFloat v105 = v6;
      double v121 = v37;
    }
    v122 = [(PHRegistrationView *)self errorLabel];
    v183.origin.x = v117;
    v183.origin.y = v105;
    v183.size.width = v8;
    v183.size.height = v10;
    [v122 sizeThatFits:CGRectGetWidth(v183) + -20.0, 1.79769313e308];
    double v124 = v123;
    double v126 = v125;
    v184.origin.x = v117;
    v184.origin.y = v105;
    v184.size.width = v8;
    v184.size.height = v10;
    CGFloat v127 = v10;
    double v128 = floor(CGRectGetMidX(v184) - v124 * 0.5);
    v129 = [v25 font];
    [v129 ascender];
    CGFloat v131 = v117;
    double v132 = floor(v121 - v130);

    [v122 setFrame:v128, v132 + 24.0, v124, v126];
    v38 = [(PHRegistrationView *)self continueButton];
    [v38 setFrame:0.0, 0.0, 288.0, 50.0];
    [v38 bounds];
    CGFloat v135 = v134;
    CGFloat v137 = v136;
    double v139 = v138;
    if (v133 <= v8) {
      double v140 = v133;
    }
    else {
      double v140 = v8;
    }
    v185.origin.x = v131;
    v185.origin.y = rect_8;
    v185.size.width = v8;
    v185.size.height = v127;
    double v141 = CGRectGetMidX(v185);
    v186.origin.x = v135;
    v186.origin.y = v137;
    v186.size.width = v140;
    v186.size.height = v139;
    CGFloat v142 = floor(v141 - CGRectGetWidth(v186) * 0.5);
    [(PHRegistrationView *)self bounds];
    CGFloat v144 = v143 + -60.0 - v139;
    [v38 setFrame:v142, v144, v140, v139];
    v145 = [(PHRegistrationView *)self waitingForActivationLabel];
    [v145 sizeToFit];

    v146 = [(PHRegistrationView *)self waitingForActivationLabel];
    [v146 frame];
    double v148 = v147;
    double v150 = v149;

    [(PHRegistrationView *)self frame];
    double v152 = v151 * 0.5 - v148 * 0.5;
    v153 = [(PHRegistrationView *)self waitingForActivationLabel];
    [v153 setFrame:v152, v139 * 0.5 + v144 - v150 * 0.5, v148, v150];

    v187.origin.x = v142;
    v187.origin.y = v144;
    v187.size.width = v140;
    v187.size.height = v139;
    double v154 = CGRectGetMaxY(v187);
    v91 = [v38 titleLabel];
    [v91 origin];
    double v156 = v154 - v155;
    v157 = [v38 titleLabel];
    v158 = [v157 font];
    [v158 descender];
    double v103 = ceil(v156 + v159 + 40.0);
  }
  [(PHRegistrationView *)self frame];
  -[PHRegistrationView setContentSize:](self, "setContentSize:", v160, v103);
}

- (void)_learnMorePressed:(id)a3
{
  double v3 = (void (*)(void))CUTWeakLinkSymbol();
  id v5 = +[UIApplication sharedApplication];
  CGFloat v4 = v3();
  [v5 openURL:v4 withCompletionHandler:0];
}

- (void)_setContinueButtonTouched:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PHRegistrationView *)self continueButton];
  id v5 = [v10 backgroundColor];
  CGFloat v6 = v5;
  double v7 = 1.0;
  if (v3) {
    double v7 = 0.5;
  }
  double v8 = [v5 colorWithAlphaComponent:v7];
  double v9 = [(PHRegistrationView *)self continueButton];
  [v9 setBackgroundColor:v8];
}

- (void)_continueTouchUpInside:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F07C;
  v9[3] = &unk_1000A1D50;
  v9[4] = self;
  BOOL v3 = objc_retainBlock(v9);
  id v4 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
  id v5 = TUPreferredFaceTimeBundleIdentifier();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F0E8;
  v7[3] = &unk_1000A2228;
  id v8 = v3;
  CGFloat v6 = v3;
  [v4 performNetworkAccessFlowIfAllowed:v5 ignoreForeground:0 completion:v7];
}

- (void)_continueTouchUpOutside:(id)a3
{
}

- (void)_continueTouchDown:(id)a3
{
}

- (void)_continueDragExit:(id)a3
{
}

- (void)_continueDragEnter:(id)a3
{
}

- (PHRegistrationViewDelegate)registrationDelegate
{
  return self->_registrationDelegate;
}

- (void)setRegistrationDelegate:(id)a3
{
  self->_registrationDelegate = (PHRegistrationViewDelegate *)a3;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setVerbiageLabel:(id)a3
{
}

- (void)setSupplementalVerbiageLabel:(id)a3
{
}

- (void)setErrorLabel:(id)a3
{
}

- (void)setSigningInLabel:(id)a3
{
}

- (void)setWaitingForActivationLabel:(id)a3
{
}

- (void)setSigningInSpinner:(id)a3
{
}

- (void)setLearnMoreButton:(id)a3
{
}

- (void)setContinueButton:(id)a3
{
}

- (UIView)privacyLinkView
{
  return self->_privacyLinkView;
}

- (UIView)authKitSignInView
{
  return self->_authKitSignInView;
}

- (double)originalAuthKitViewHeight
{
  return self->_originalAuthKitViewHeight;
}

- (void)setOriginalAuthKitViewHeight:(double)a3
{
  self->_originalAuthKitViewHeight = a3;
}

- (BOOL)showsAuthKitUI
{
  return self->_showsAuthKitUI;
}

- (void)setShowsAuthKitUI:(BOOL)a3
{
  self->_showsAuthKitUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitSignInView, 0);
  objc_storeStrong((id *)&self->_privacyLinkView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_signingInSpinner, 0);
  objc_storeStrong((id *)&self->_waitingForActivationLabel, 0);
  objc_storeStrong((id *)&self->_signingInLabel, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_supplementalVerbiageLabel, 0);
  objc_storeStrong((id *)&self->_verbiageLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end