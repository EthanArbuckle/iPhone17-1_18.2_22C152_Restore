@interface THTOCGlossaryMenuPopoverViewController
- (BEHairlineDividerView)dividerView;
- (THTOCGlossaryMenuPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THTOCGlossaryMenuPopoverViewControllerDelegate)delegate;
- (UIButton)TOCButton;
- (UIButton)glossaryButton;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)setDelegate:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setGlossaryButton:(id)a3;
- (void)setTOCButton:(id)a3;
- (void)showGlossary:(id)a3;
- (void)showTOC:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THTOCGlossaryMenuPopoverViewController

- (THTOCGlossaryMenuPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  v4 = [(THTOCGlossaryMenuPopoverViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(THTOCGlossaryMenuPopoverViewController *)v4 setTheme:+[IMTheme themeWithIdentifier:kIMThemeIdentifierBlissClassicTheme]];
  }
  return v4;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  [(THTOCGlossaryMenuPopoverViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  [(THTOCGlossaryMenuPopoverViewController *)&v8 viewDidLoad];
  id v3 = [(THTOCGlossaryMenuPopoverViewController *)self view];
  [v3 setBackgroundColor:[UIColor systemBackgroundColor]];
  v4 = +[UIFont systemFontOfSize:17.0];
  v5 = +[UIButton buttonWithType:1];
  self->mTOCButton = v5;
  [(UILabel *)[(UIButton *)v5 titleLabel] setFont:v4];
  [(UIButton *)self->mTOCButton setTitleColor:+[UIColor bc_booksLabelColor] forState:0];
  -[UIButton setTitle:forState:](self->mTOCButton, "setTitle:forState:", [(id)THBundle() localizedStringForKey:@"Table of Contents" value:&stru_46D7E8 table:0], 0);
  [(UIButton *)self->mTOCButton addTarget:self action:"showTOC:" forControlEvents:64];
  [v3 addSubview:self->mTOCButton];
  objc_super v6 = (BEHairlineDividerView *)[objc_alloc((Class)BEHairlineDividerView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  self->mDividerView = v6;
  [(BEHairlineDividerView *)v6 setHorizontal:1];
  -[self->mDividerView setDividerColor:[-[THTOCGlossaryMenuPopoverViewController theme](self, "theme") dividerColor]];
  [v3 addSubview:self->mDividerView];
  v7 = +[UIButton buttonWithType:1];
  self->mGlossaryButton = v7;
  [(UILabel *)[(UIButton *)v7 titleLabel] setFont:v4];
  [(UIButton *)self->mGlossaryButton setTitleColor:+[UIColor bc_booksLabelColor] forState:0];
  -[UIButton setTitle:forState:](self->mGlossaryButton, "setTitle:forState:", [(id)THBundle() localizedStringForKey:@"Glossary" value:&stru_46D7E8 table:0], 0);
  [(UIButton *)self->mGlossaryButton addTarget:self action:"showGlossary:" forControlEvents:64];
  [v3 addSubview:self->mGlossaryButton];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->mTOCButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->mGlossaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BEHairlineDividerView *)self->mDividerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v9[0] = objc_msgSend(-[UIButton topAnchor](self->mTOCButton, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v3, "safeAreaLayoutGuide"), "topAnchor"));
  v9[1] = [self->mDividerView topAnchor].constraintEqualToAnchor:[self->mTOCButton bottomAnchor];
  v9[2] = [self->mGlossaryButton topAnchor].constraintEqualToAnchor:[self->mDividerView bottomAnchor];
  v9[3] = [self->mGlossaryButton bottomAnchor].constraintEqualToAnchor:[v3 bottomAnchor];
  v9[4] = [self->mTOCButton widthAnchor].constraintEqualToConstant:284.0;
  v9[5] = [self->mTOCButton heightAnchor] constraintEqualToConstant:44.0;
  v9[6] = [[self->mGlossaryButton widthAnchor] constraintEqualToAnchor:[self->mTOCButton widthAnchor]];
  v9[7] = [self->mGlossaryButton heightAnchor].constraintEqualToAnchor:[self->mTOCButton heightAnchor];
  v9[8] = objc_msgSend(-[UIButton leadingAnchor](self->mTOCButton, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v3, "safeAreaLayoutGuide"), "leadingAnchor"));
  v9[9] = objc_msgSend(-[UIButton trailingAnchor](self->mTOCButton, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v3, "safeAreaLayoutGuide"), "trailingAnchor"));
  v9[10] = [self->mDividerView leadingAnchor] constraintEqualToAnchor:[v3 leadingAnchor];
  v9[11] = [self->mDividerView trailingAnchor].constraintEqualToAnchor:[v3 trailingAnchor];
  [v3 addConstraints:[NSArray arrayWithObjects:count:v9, 12]];
  [self view].systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height;
  -[THTOCGlossaryMenuPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  [(THTOCGlossaryMenuPopoverViewController *)&v4 viewWillAppear:a3];
  [(UIButton *)[(THTOCGlossaryMenuPopoverViewController *)self TOCButton] setEnabled:[(THTOCGlossaryMenuPopoverViewControllerDelegate *)[(THTOCGlossaryMenuPopoverViewController *)self delegate] isTOCButtonApplicable]];
}

- (void)showTOC:(id)a3
{
  [(THTOCGlossaryMenuPopoverViewControllerDelegate *)self->mDelegate willJumpToTOC];
  mDelegate = self->mDelegate;

  [(THTOCGlossaryMenuPopoverViewControllerDelegate *)mDelegate showTOC];
}

- (void)showGlossary:(id)a3
{
}

- (void)dealloc
{
  self->mTOCButton = 0;
  self->mGlossaryButton = 0;

  self->mDividerView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  [(THTOCGlossaryMenuPopoverViewController *)&v3 dealloc];
}

- (UIButton)TOCButton
{
  return self->mTOCButton;
}

- (void)setTOCButton:(id)a3
{
}

- (UIButton)glossaryButton
{
  return self->mGlossaryButton;
}

- (void)setGlossaryButton:(id)a3
{
}

- (BEHairlineDividerView)dividerView
{
  return self->mDividerView;
}

- (void)setDividerView:(id)a3
{
}

- (THTOCGlossaryMenuPopoverViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THTOCGlossaryMenuPopoverViewControllerDelegate *)a3;
}

@end