@interface _UIAlertControllerTextFieldViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)isHidden;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldsCanBecomeFirstResponder;
- (NSArray)textFields;
- (UIAlertControllerVisualStyle)visualStyle;
- (_UIAlertControllerTextFieldViewController)init;
- (_UIAlertControllerTextFieldViewControllerContaining)container;
- (double)_bottomMarginForTextFields;
- (id)addTextFieldWithPlaceholder:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)textFieldAtIndex:(int64_t)a3;
- (id)textFieldContainerViews;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfTextFields;
- (void)_returnKeyPressedInTextField:(id)a3;
- (void)_updatePreferredContentSize;
- (void)removeAllTextFields;
- (void)setContainer:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setTextFieldsCanBecomeFirstResponder:(BOOL)a3;
- (void)setVisualStyle:(id)a3;
- (void)updateTextFieldStyle;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _UIAlertControllerTextFieldViewController

- (_UIAlertControllerTextFieldViewController)init
{
  v3 = objc_alloc_init(UICollectionViewFlowLayout);
  v18.receiver = self;
  v18.super_class = (Class)_UIAlertControllerTextFieldViewController;
  v4 = [(UICollectionViewController *)&v18 initWithCollectionViewLayout:v3];
  v5 = v4;
  if (v4)
  {
    p_collectionViewLayout = (id *)&v4->_collectionViewLayout;
    objc_storeStrong((id *)&v4->_collectionViewLayout, v3);
    [*p_collectionViewLayout setMinimumLineSpacing:0.0];
    v7 = [(UICollectionViewController *)v5 collectionView];
    [v7 setCollectionViewLayout:*p_collectionViewLayout];

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textFieldViews = v5->textFieldViews;
    v5->textFieldViews = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textFields = v5->textFields;
    v5->textFields = v10;

    v12 = [(UICollectionViewController *)v5 collectionView];
    [v12 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIAlertTextFieldTableIdentifier"];

    v13 = [(UICollectionViewController *)v5 collectionView];
    [v13 setAllowsSelection:0];

    v14 = [(UICollectionViewController *)v5 collectionView];
    [v14 setBackgroundColor:0];

    v15 = [(UICollectionViewController *)v5 collectionView];
    [v15 setScrollEnabled:0];

    v16 = [(UICollectionViewController *)v5 collectionView];
    [v16 _setFirstResponderKeyboardAvoidanceEnabled:0];

    v5->_textFieldsCanBecomeFirstResponder = 1;
  }

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerTextFieldViewController;
  [(UIViewController *)&v4 viewDidLoad];
  v3 = [(UIViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIAlertControllerTextFieldViewController;
  [(UICollectionViewController *)&v10 viewWillAppear:a3];
  objc_super v4 = [(UICollectionViewController *)self collectionView];
  [(UIAlertControllerVisualStyle *)self->_visualStyle textFieldContentInset];
  objc_msgSend(v4, "setContentInset:");

  v5 = [(NSMutableArray *)self->textFields firstObject];
  if ([(_UIAlertControllerTextFieldViewController *)self textFieldsCanBecomeFirstResponder]&& !+[UISystemInputViewController canUseSystemInputViewControllerForResponder:v5])
  {
    v6 = [(UIViewController *)self transitionCoordinator];

    if (v6)
    {
      v7 = [(UIViewController *)self transitionCoordinator];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60___UIAlertControllerTextFieldViewController_viewWillAppear___block_invoke;
      v8[3] = &unk_1E52DA598;
      id v9 = v5;
      [v7 animateAlongsideTransition:v8 completion:0];
    }
    else
    {
      [v5 becomeFirstResponder];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  collectionViewLayout = self->_collectionViewLayout;
  objc_super v4 = [(UIViewController *)self view];
  [v4 bounds];
  -[UICollectionViewFlowLayout setEstimatedItemSize:](collectionViewLayout, "setEstimatedItemSize:", CGRectGetWidth(v6), 24.0);

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerTextFieldViewController;
  [(UIViewController *)&v5 viewWillLayoutSubviews];
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
  [(_UIAlertControllerTextFieldViewController *)self updateTextFieldStyle];
}

- (UIAlertControllerVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (double)_bottomMarginForTextFields
{
  v3 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleHeadline" addingSymbolicTraits:0 options:2];
  objc_super v4 = [off_1E52D39B8 fontWithDescriptor:v3 size:0.0];
  [v4 _scaledValueForValue:24.0];
  objc_super v5 = [(UIViewController *)self view];
  UIRoundToViewScale(v5);
  double v7 = v6;

  return v7;
}

- (id)addTextFieldWithPlaceholder:(id)a3
{
  textFieldViews = self->textFieldViews;
  id v5 = a3;
  if ([(NSMutableArray *)textFieldViews count])
  {
    double v6 = [(NSMutableArray *)self->textFieldViews lastObject];
    [v6 setContainerView:0];
  }
  double v7 = [_UIAlertControllerTextFieldView alloc];
  v8 = -[_UIAlertControllerTextFieldView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = [(_UIAlertControllerTextFieldView *)v8 textField];
  [v9 setAutocorrectionType:1];
  [v9 setAutocapitalizationType:0];
  [v9 setSmartQuotesType:1];
  [v9 setSmartDashesType:1];
  [v9 setPlaceholder:v5];

  [v9 setAdjustsFontForContentSizeCategory:1];
  [v9 addTarget:self action:sel__returnKeyPressedInTextField_ forControlEvents:0x80000];
  [(NSMutableArray *)self->textFieldViews addObject:v8];
  [(NSMutableArray *)self->textFields addObject:v9];
  [(_UIAlertControllerTextFieldViewController *)self updateTextFieldStyle];
  objc_super v10 = [(UICollectionViewController *)self collectionView];
  [v10 reloadData];

  return v9;
}

- (void)_returnKeyPressedInTextField:(id)a3
{
  id v12 = a3;
  objc_super v4 = [(_UIAlertControllerTextFieldViewController *)self container];
  int v5 = [v4 _shouldSupportReturnKeyPresses];

  double v6 = v12;
  if (v5)
  {
    double v7 = [v12 textFieldView];
    uint64_t v8 = [(NSMutableArray *)self->textFieldViews indexOfObject:v7];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8 + 1;
      if (v8 + 1 <= (unint64_t)([(NSMutableArray *)self->textFieldViews count] - 1))
      {
        objc_super v10 = [(NSMutableArray *)self->textFieldViews objectAtIndex:v9];
        v11 = [v10 textField];
        [v11 becomeFirstResponder];
      }
      else
      {
        objc_super v10 = [(_UIAlertControllerTextFieldViewController *)self container];
        [v10 _returnKeyPressedInLastTextField];
      }
    }
    double v6 = v12;
  }
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
  if ([(_UIAlertControllerTextFieldViewController *)self isHidden])
  {
    -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    objc_super v4 = [(UIViewController *)self view];
    id v6 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    [(_UIAlertControllerTextFieldViewController *)self _updatePreferredContentSize];
    objc_super v4 = [(UIViewController *)self view];
    id v6 = v4;
    uint64_t v5 = 0;
  }
  [v4 setHidden:v5];
}

- (void)_updatePreferredContentSize
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(NSMutableArray *)self->textFieldViews count])
  {
    [(UIAlertControllerVisualStyle *)self->_visualStyle textFieldContentInset];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = [(NSMutableArray *)self->textFieldViews objectAtIndex:0];
    objc_msgSend(v9, "systemLayoutSizeFittingSize:", v4, v3);
    double v11 = v10 * (double)[(_UIAlertControllerTextFieldViewController *)self numberOfTextFields];
    [(_UIAlertControllerTextFieldViewController *)self _bottomMarginForTextFields];
    double v3 = v11 + v8 + v6 + v12;

    double v4 = 0.0;
  }
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v3);
}

- (id)textFieldAtIndex:(int64_t)a3
{
  double v3 = [(NSMutableArray *)self->textFieldViews objectAtIndex:a3];
  double v4 = [v3 textField];

  return v4;
}

- (id)textFieldContainerViews
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v4 = self->textFieldViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "containerView", (void)v13);

        if (v10)
        {
          double v11 = [v9 containerView];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)numberOfTextFields
{
  return [(NSMutableArray *)self->textFieldViews count];
}

- (void)removeAllTextFields
{
  [(NSMutableArray *)self->textFieldViews removeAllObjects];
  [(NSMutableArray *)self->textFields removeAllObjects];
  id v3 = [(UICollectionViewController *)self collectionView];
  [v3 reloadData];
}

- (void)setTextFieldsCanBecomeFirstResponder:(BOOL)a3
{
  if (self->_textFieldsCanBecomeFirstResponder != a3)
  {
    BOOL v3 = a3;
    self->_textFieldsCanBecomeFirstResponder = a3;
    double v4 = [(NSMutableArray *)self->textFields firstObject];
    id v5 = v4;
    if (v3) {
      [v4 becomeFirstResponder];
    }
    else {
      [v4 resignFirstResponder];
    }
  }
}

- (BOOL)textFieldsCanBecomeFirstResponder
{
  return self->_textFieldsCanBecomeFirstResponder;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  textFieldViews = self->textFieldViews;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = -[NSMutableArray objectAtIndex:](textFieldViews, "objectAtIndex:", [v7 row]);
  double v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIAlertTextFieldTableIdentifier" forIndexPath:v7];

  [v10 setBackgroundColor:0];
  [(UIAlertControllerVisualStyle *)self->_visualStyle textFieldHorizontalMargin];
  objc_msgSend(v10, "setTextField:horizontalMargin:", v9);

  return v10;
}

- (void)updateTextFieldStyle
{
  uint64_t v3 = [(NSMutableArray *)self->textFieldViews count];
  textFieldViews = self->textFieldViews;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65___UIAlertControllerTextFieldViewController_updateTextFieldStyle__block_invoke;
  v5[3] = &unk_1E52DA958;
  v5[4] = self;
  v5[5] = v3;
  [(NSMutableArray *)textFieldViews enumerateObjectsUsingBlock:v5];
  [(_UIAlertControllerTextFieldViewController *)self _updatePreferredContentSize];
}

- (BOOL)resignFirstResponder
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->textFields;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      if ([v8 isFirstResponder]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (!v9) {
      goto LABEL_12;
    }
    char v10 = [v9 resignFirstResponder];
  }
  else
  {
LABEL_9:

    id v9 = 0;
LABEL_12:
    char v10 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIAlertControllerTextFieldViewController;
  unsigned __int8 v11 = [(UIResponder *)&v13 resignFirstResponder];

  return v11 & v10;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)textFields
{
  return (NSArray *)objc_getProperty(self, a2, 1024, 1);
}

- (_UIAlertControllerTextFieldViewControllerContaining)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (_UIAlertControllerTextFieldViewControllerContaining *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->textFields, 0);
  objc_storeStrong((id *)&self->textFieldViews, 0);
}

@end