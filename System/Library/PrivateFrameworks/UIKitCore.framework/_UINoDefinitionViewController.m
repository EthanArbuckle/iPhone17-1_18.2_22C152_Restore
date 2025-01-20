@interface _UINoDefinitionViewController
- (void)viewDidLoad;
@end

@implementation _UINoDefinitionViewController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)_UINoDefinitionViewController;
  [(UIViewController *)&v16 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [_UIContentUnavailableView alloc];
  v6 = _UINSLocalizedStringWithDefaultValue(@"No definition found.", @"No definition found.");
  v7 = -[_UIContentUnavailableView initWithFrame:title:style:](v5, "initWithFrame:title:style:", v6, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(UIView *)v7 setAutoresizingMask:18];
  v8 = [(UIViewController *)self view];
  [v8 bounds];
  -[UIView setFrame:](v7, "setFrame:");

  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __44___UINoDefinitionViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E52DC308;
  objc_copyWeak(&v14, &location);
  [(_UIContentUnavailableView *)v7 setButtonAction:&v10];
  v9 = [(UIViewController *)self view];
  [v9 addSubview:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

@end