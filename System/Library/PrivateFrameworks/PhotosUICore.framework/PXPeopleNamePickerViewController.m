@interface PXPeopleNamePickerViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSArray)savedRightBarItems;
- (NSLayoutConstraint)resultsViewBottomConstraint;
- (PXPeopleNamePickerResultsTableViewController)resultsController;
- (PXPeopleNamePickerTitleView)titleView;
- (PXPeopleNamePickerViewController)init;
- (PXPeopleNamePickerViewController)initWithCoder:(id)a3;
- (PXPeopleNamePickerViewController)initWithFace:(id)a3;
- (PXPeopleNamePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPeopleNamePickerViewController)initWithPerson:(id)a3;
- (PXPeopleNamePickerViewController)initWithPerson:(id)a3 orFace:(id)a4;
- (PXPeopleNamePickerViewControllerDelegate)delegate;
- (double)_titleViewMaxWidthForEditing:(BOOL)a3;
- (double)yOffset;
- (void)_changePlaceholderTextOfTextField:(id)a3 toColor:(id)a4;
- (void)_hideResultsView;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_showResultsView;
- (void)setDelegate:(id)a3;
- (void)setResultsController:(id)a3;
- (void)setResultsViewBottomConstraint:(id)a3;
- (void)setSavedRightBarItems:(id)a3;
- (void)setYOffset:(double)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PXPeopleNamePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_resultsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_savedRightBarItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleView, 0);
}

- (void)setResultsController:(id)a3
{
}

- (PXPeopleNamePickerResultsTableViewController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)resultsViewBottomConstraint
{
  return self->_resultsViewBottomConstraint;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setSavedRightBarItems:(id)a3
{
}

- (NSArray)savedRightBarItems
{
  return self->_savedRightBarItems;
}

- (void)setDelegate:(id)a3
{
}

- (PXPeopleNamePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPeopleNamePickerViewControllerDelegate *)WeakRetained;
}

- (PXPeopleNamePickerTitleView)titleView
{
  return self->_titleView;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a4;
  v5 = [(PXPeopleNamePickerViewController *)self resultsController];
  v6 = [v5 personAtIndexPath:v9];
  if (v6)
  {
    v7 = [(PXPeopleNamePickerViewController *)self delegate];
    [v7 namePickerController:self didPickPerson:v6];
  }
  else
  {
    v7 = [v5 contactAtIndexPath:v9];
    if (v7)
    {
      v8 = [(PXPeopleNamePickerViewController *)self delegate];
      [v8 namePickerController:self didPickContact:v7];
    }
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v6 = [(PXPeopleNamePickerViewController *)self titleView];
  v5 = [v6 tintColor];
  [(PXPeopleNamePickerViewController *)self _changePlaceholderTextOfTextField:v4 toColor:v5];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  id v6 = [v4 placeholderTextColor];
  [(PXPeopleNamePickerViewController *)self _changePlaceholderTextOfTextField:v5 toColor:v6];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v10 = [a3 text];
  v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  v12 = [(PXPeopleNamePickerViewController *)self resultsController];
  [v12 updateItemsForSearchString:v11];
  if ([v12 hasResults]) {
    [(PXPeopleNamePickerViewController *)self _showResultsView];
  }
  else {
    [(PXPeopleNamePickerViewController *)self _hideResultsView];
  }
  v13 = [(PXPeopleNamePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 namePickerControllerWillChangeText:self];
  }

  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  [a3 resignFirstResponder];
  id v4 = [(PXPeopleNamePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 namePickerControllerDidEndEditing:self];
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [a3 text];
  id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  v7 = [(PXPeopleNamePickerViewController *)self delegate];
  [v7 namePickerController:self didPickString:v6];

  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = [(PXPeopleNamePickerViewController *)self resultsController];
  [v4 updateItemsForSearchString:&stru_1F00B0030];
  if ([v4 hasResults]) {
    [(PXPeopleNamePickerViewController *)self _showResultsView];
  }
  else {
    [(PXPeopleNamePickerViewController *)self _hideResultsView];
  }
  id v5 = [(PXPeopleNamePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 namePickerControllerDidStartEditing:self];
  }

  return 1;
}

- (void)_changePlaceholderTextOfTextField:(id)a3 toColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 attributedPlaceholder];
  id v8 = (id)[v7 mutableCopy];

  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v5, 0, objc_msgSend(v8, "length"));
  [v6 setAttributedPlaceholder:v8];
}

- (void)_hideResultsView
{
  id v6 = [(PXPeopleNamePickerViewController *)self resultsController];
  id v3 = [(PXPeopleNamePickerViewController *)self presentedViewController];

  if (v3 == v6)
  {
    [v6 dismissViewControllerAnimated:0 completion:0];
  }
  else
  {
    id v4 = [(PXPeopleNamePickerViewController *)self resultsController];
    id v5 = [v4 view];

    [v5 setHidden:1];
  }
}

- (void)_showResultsView
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21 = [(PXPeopleNamePickerViewController *)self resultsController];
  id v3 = [v21 view];
  [v3 setHidden:0];
  id v4 = [(PXPeopleNamePickerViewController *)self view];
  id v5 = [v3 superview];

  if (v5 != v4) {
    [v4 addSubview:v3];
  }
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [v3 topAnchor];
  v20 = [v4 safeAreaLayoutGuide];
  v18 = [v20 topAnchor];
  [(PXPeopleNamePickerViewController *)self yOffset];
  v17 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18);
  v22[0] = v17;
  v14 = [v3 leadingAnchor];
  v15 = [v4 safeAreaLayoutGuide];
  id v6 = [v15 leadingAnchor];
  v7 = [v14 constraintEqualToAnchor:v6];
  v22[1] = v7;
  id v8 = [v3 trailingAnchor];
  id v9 = [v4 safeAreaLayoutGuide];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v22[2] = v11;
  v12 = [(PXPeopleNamePickerViewController *)self resultsViewBottomConstraint];
  v22[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  [v16 activateConstraints:v13];
}

- (double)_titleViewMaxWidthForEditing:(BOOL)a3
{
  id v4 = [(PXPeopleNamePickerViewController *)self navigationController];
  id v5 = [v4 navigationBar];

  [v5 frame];
  double v7 = v6;
  if (!a3)
  {
    id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v9 = [v8 userInterfaceLayoutDirection];

    if (v9 == 1)
    {
      v10 = [v5 currentRightView];
      [v5 currentLeftView];
    }
    else
    {
      v10 = [v5 currentLeftView];
      [v5 currentRightView];
    v11 = };
    double v12 = 0.0;
    double MaxX = 0.0;
    if (v10)
    {
      [v10 frame];
      double MaxX = CGRectGetMaxX(v16);
    }
    if (v11)
    {
      [v11 frame];
      double v12 = v7 - CGRectGetMinX(v17);
    }
    if (MaxX >= v12) {
      double v14 = MaxX;
    }
    else {
      double v14 = v12;
    }
    double v7 = v7 + v14 * -2.0;
  }
  return v7;
}

- (void)_keyboardDidShow:(id)a3
{
  id v30 = [a3 userInfo];
  id v4 = [v30 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(PXPeopleNamePickerViewController *)self view];
  objc_msgSend(v13, "convertRect:fromView:", 0, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [v13 frame];
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.double height = v21;
  CGRect v33 = CGRectIntersection(v32, v34);
  double height = v33.size.height;
  v23 = [(PXPeopleNamePickerViewController *)self tabBarController];
  v24 = [v23 tabBar];
  [v24 frame];
  double v26 = v25;

  [v13 safeAreaInsets];
  double v28 = v26 - height + v27;
  v29 = [(PXPeopleNamePickerViewController *)self resultsViewBottomConstraint];
  [v29 setConstant:v28];
}

- (void)_keyboardWillHide:(id)a3
{
  id v3 = [(PXPeopleNamePickerViewController *)self resultsViewBottomConstraint];
  [v3 setConstant:0.0];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleNamePickerViewController;
  [(PXPeopleNamePickerViewController *)&v5 viewDidLayoutSubviews];
  id v3 = [(PXPeopleNamePickerViewController *)self titleView];
  id v4 = [v3 nameField];
  [v4 invalidateIntrinsicContentSize];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleNamePickerViewController;
  [(PXPeopleNamePickerViewController *)&v10 viewDidLoad];
  id v3 = [(PXPeopleNamePickerViewController *)self resultsController];
  id v4 = [v3 view];
  objc_super v5 = [v4 bottomAnchor];
  double v6 = [(PXPeopleNamePickerViewController *)self view];
  double v7 = [v6 safeAreaLayoutGuide];
  double v8 = [v7 bottomAnchor];
  double v9 = [v5 constraintEqualToAnchor:v8 constant:0.0];
  [(PXPeopleNamePickerViewController *)self setResultsViewBottomConstraint:v9];
}

- (PXPeopleNamePickerViewController)initWithPerson:(id)a3 orFace:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (!(v7 | v8))
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerViewController.m" lineNumber:62 description:@"Both person and face are nil"];
  }
  v32.receiver = self;
  v32.super_class = (Class)PXPeopleNamePickerViewController;
  double v9 = [(PXPeopleNamePickerViewController *)&v32 initWithNibName:0 bundle:0];
  if (v9)
  {
    objc_super v10 = [PXPeopleNamePickerTitleView alloc];
    if (v7) {
      uint64_t v11 = -[PXPeopleNamePickerTitleView initWithFrame:person:](v10, "initWithFrame:person:", v7, 0.0, 0.0, 0.0, 35.0);
    }
    else {
      uint64_t v11 = -[PXPeopleNamePickerTitleView initWithFrame:face:](v10, "initWithFrame:face:", v8, 0.0, 0.0, 0.0, 35.0);
    }
    titleView = v9->_titleView;
    v9->_titleView = (PXPeopleNamePickerTitleView *)v11;

    [(PXPeopleNamePickerTitleView *)v9->_titleView setAutoresizingMask:2];
    v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    double v14 = (void *)MEMORY[0x1E4FB08E8];
    uint64_t v35 = *MEMORY[0x1E4FB0948];
    v36[0] = *MEMORY[0x1E4FB28C8];
    CGFloat v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    double v16 = [v14 fontDescriptorWithFontAttributes:v15];

    CGFloat v17 = (void *)MEMORY[0x1E4FB08E0];
    [v13 pointSize];
    double v18 = objc_msgSend(v17, "fontWithDescriptor:size:", v16);
    [(PXPeopleNamePickerTitleView *)v9->_titleView setNameFont:v13];
    uint64_t v19 = *MEMORY[0x1E4FB0700];
    v33[0] = *MEMORY[0x1E4FB06F8];
    v33[1] = v19;
    v34[0] = v18;
    double v20 = [(PXPeopleNamePickerTitleView *)v9->_titleView tintColor];
    v34[1] = v20;
    CGFloat v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    v23 = PXLocalizedStringFromTable(@"PXPeopleAddNameNoPlus", @"PhotosUICore");
    v24 = (void *)[v22 initWithString:v23 attributes:v21];

    double v25 = [(PXPeopleNamePickerTitleView *)v9->_titleView nameField];
    [v25 setAttributedPlaceholder:v24];
    [v25 setDelegate:v9];
    double v26 = [[PXPeopleNamePickerResultsTableViewController alloc] initWithStyle:0 person:v7 face:v8];
    resultsController = v9->_resultsController;
    v9->_resultsController = v26;

    double v28 = [(PXPeopleNamePickerResultsTableViewController *)v9->_resultsController tableView];
    [v28 setDelegate:v9];

    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v9 selector:sel__applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];
    [v29 addObserver:v9 selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];
    [v29 addObserver:v9 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v9;
}

- (PXPeopleNamePickerViewController)initWithFace:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXPeopleNamePickerViewController.m", 57, @"Invalid parameter not satisfying: %@", @"face" object file lineNumber description];
  }
  double v6 = [(PXPeopleNamePickerViewController *)self initWithPerson:0 orFace:v5];

  return v6;
}

- (PXPeopleNamePickerViewController)initWithPerson:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXPeopleNamePickerViewController.m", 52, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  double v6 = [(PXPeopleNamePickerViewController *)self initWithPerson:v5 orFace:0];

  return v6;
}

- (PXPeopleNamePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerViewController.m" lineNumber:46 description:@"invalid initializer"];

  return 0;
}

- (PXPeopleNamePickerViewController)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerViewController.m" lineNumber:40 description:@"invalid initializer"];

  return 0;
}

- (PXPeopleNamePickerViewController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerViewController.m" lineNumber:34 description:@"invalid initializer"];

  return 0;
}

@end