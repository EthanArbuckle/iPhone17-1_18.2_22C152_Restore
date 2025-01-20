@interface VSSetupView
- (BOOL)shouldOverrideSkipButtonStyle;
- (BOOL)shouldShowAboutButton;
- (BOOL)shouldShowAppsButton;
- (NSString)appAgeRatingBadge;
- (NSString)appName;
- (NSString)appsButtonTitle;
- (NSString)beginButtonTitle;
- (NSString)footer;
- (NSString)footnote;
- (NSString)message;
- (NSString)skipButtonTitle;
- (NSString)title;
- (UIButton)appsButton;
- (UIButton)beginButton;
- (UIButton)skipButton;
- (UIFont)defaultSkipButtonFont;
- (UIFont)skipButtonFont;
- (UIImage)image;
- (UIStackView)stackView;
- (UIView)tvAppPrivacyButtonContainer;
- (UIView)tvProviderPrivacyButtonContainer;
- (VSFontCenter)fontCenter;
- (VSSetupView)initWithCoder:(id)a3;
- (VSSetupView)initWithFrame:(CGRect)a3;
- (VSSetupViewDelegate)delegate;
- (double)defaultSkipButtonSpacing;
- (void)_appsButtonPressed:(id)a3;
- (void)_beginButtonPressed:(id)a3;
- (void)_skipButtonPressed:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAppAgeRatingBadge:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppsButton:(id)a3;
- (void)setAppsButtonTitle:(id)a3;
- (void)setBeginButton:(id)a3;
- (void)setBeginButtonTitle:(id)a3;
- (void)setDefaultSkipButtonFont:(id)a3;
- (void)setDefaultSkipButtonSpacing:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFontCenter:(id)a3;
- (void)setFooter:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setShouldOverrideSkipButtonStyle:(BOOL)a3;
- (void)setShouldShowAboutButton:(BOOL)a3;
- (void)setShouldShowAppsButton:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setSkipButtonFont:(id)a3;
- (void)setSkipButtonTitle:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSSetupView

- (VSSetupView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSSetupView;
  v3 = [(VSSetupView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit_6(v3);
  }
  return v4;
}

- (VSSetupView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSSetupView;
  v3 = -[VSSetupView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    commonInit_6(v3);
  }
  return v4;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSSetupView;
  [(VSSetupView *)&v3 dealloc];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSSetupView;
  [(VSSetupView *)&v13 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [(VSSetupView *)self skipButton];
  v8 = [v7 titleLabel];

  v9 = [v6 previouslyFocusedItem];
  v10 = [(VSSetupView *)self skipButton];

  if (v9 == v10)
  {
    [v8 setMarqueeRunning:0];
    [v8 setMarqueeEnabled:0];
    [v8 setLineBreakMode:5];
  }
  else
  {
    v11 = [v6 nextFocusedItem];
    v12 = [(VSSetupView *)self skipButton];

    if (v11 == v12)
    {
      [v8 setMarqueeEnabled:1];
      [v8 setMarqueeRunning:1];
    }
  }
}

- (void)setShouldOverrideSkipButtonStyle:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldOverrideSkipButtonStyle = a3;
  [(VSSetupView *)self defaultSkipButtonSpacing];
  double v6 = v5;
  v7 = [(VSSetupView *)self defaultSkipButtonFont];
  v8 = v7;
  if (v3)
  {
    v9 = [v7 fontWithSize:29.0];
    [(VSSetupView *)self setSkipButtonFont:v9];
    double v6 = v6 * 2.75;
    v10 = [(VSSetupView *)self stackView];
    v11 = [(VSSetupView *)self skipButton];
    [v10 setCustomSpacing:v11 afterView:0.0];

    v12 = [(VSSetupView *)self appsButton];
    LODWORD(v11) = [v12 isHidden];

    if (!v11) {
      goto LABEL_6;
    }
    objc_super v13 = [(VSSetupView *)self stackView];
    v14 = [(VSSetupView *)self appsButton];
    [v13 setCustomSpacing:v14 afterView:0.0];
  }
  else
  {
    [(VSSetupView *)self setSkipButtonFont:v7];

    v8 = [(VSSetupView *)self skipButton];
    v9 = [v8 widthAnchor];
    objc_super v13 = [(VSSetupView *)self beginButton];
    v14 = [v13 widthAnchor];
    v15 = [v9 constraintEqualToAnchor:v14];
    [v15 setActive:1];
  }
LABEL_6:

  id v17 = [(VSSetupView *)self stackView];
  v16 = [(VSSetupView *)self beginButton];
  [v17 setCustomSpacing:v16 afterView:v6];
}

- (void)setSkipButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_skipButtonTitle, a3);
  v4 = [(VSSetupView *)self skipButton];
  [v4 sizeToFit];

  id v5 = [(VSSetupView *)self skipButton];
  [v5 setNeedsUpdateConstraints];
}

- (void)_beginButtonPressed:(id)a3
{
  id v4 = [(VSSetupView *)self delegate];
  [v4 beginSetup:self];
}

- (void)_skipButtonPressed:(id)a3
{
  id v4 = [(VSSetupView *)self delegate];
  [v4 skipSetup:self];
}

- (void)_appsButtonPressed:(id)a3
{
  id v4 = [(VSSetupView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 showApps:self];
  }
}

- (VSSetupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSetupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appAgeRatingBadge
{
  return self->_appAgeRatingBadge;
}

- (void)setAppAgeRatingBadge:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)shouldShowAppsButton
{
  return self->_shouldShowAppsButton;
}

- (void)setShouldShowAppsButton:(BOOL)a3
{
  self->_shouldShowAppsButton = a3;
}

- (BOOL)shouldShowAboutButton
{
  return self->_shouldShowAboutButton;
}

- (void)setShouldShowAboutButton:(BOOL)a3
{
  self->_shouldShowAboutButton = a3;
}

- (BOOL)shouldOverrideSkipButtonStyle
{
  return self->_shouldOverrideSkipButtonStyle;
}

- (NSString)beginButtonTitle
{
  return self->_beginButtonTitle;
}

- (void)setBeginButtonTitle:(id)a3
{
}

- (NSString)skipButtonTitle
{
  return self->_skipButtonTitle;
}

- (NSString)appsButtonTitle
{
  return self->_appsButtonTitle;
}

- (void)setAppsButtonTitle:(id)a3
{
}

- (UIView)tvProviderPrivacyButtonContainer
{
  return self->_tvProviderPrivacyButtonContainer;
}

- (UIView)tvAppPrivacyButtonContainer
{
  return self->_tvAppPrivacyButtonContainer;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
}

- (UIFont)defaultSkipButtonFont
{
  return self->_defaultSkipButtonFont;
}

- (void)setDefaultSkipButtonFont:(id)a3
{
}

- (UIFont)skipButtonFont
{
  return self->_skipButtonFont;
}

- (void)setSkipButtonFont:(id)a3
{
}

- (double)defaultSkipButtonSpacing
{
  return self->_defaultSkipButtonSpacing;
}

- (void)setDefaultSkipButtonSpacing:(double)a3
{
  self->_defaultSkipButtonSpacing = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIButton)beginButton
{
  return self->_beginButton;
}

- (void)setBeginButton:(id)a3
{
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (UIButton)appsButton
{
  return self->_appsButton;
}

- (void)setAppsButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_beginButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_skipButtonFont, 0);
  objc_storeStrong((id *)&self->_defaultSkipButtonFont, 0);
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_tvAppPrivacyButtonContainer, 0);
  objc_storeStrong((id *)&self->_tvProviderPrivacyButtonContainer, 0);
  objc_storeStrong((id *)&self->_appsButtonTitle, 0);
  objc_storeStrong((id *)&self->_skipButtonTitle, 0);
  objc_storeStrong((id *)&self->_beginButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_appAgeRatingBadge, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end