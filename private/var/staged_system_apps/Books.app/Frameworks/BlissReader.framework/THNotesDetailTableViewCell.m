@interface THNotesDetailTableViewCell
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isSectionHeaderCell;
- (CGRect)editControlCenteringRect;
- (CGRect)p_getFrameForViewWithTag:(int64_t)a3 parentView:(id)a4;
- (NSIndexPath)indexPath;
- (NSString)highlightedText;
- (NSString)noteText;
- (THNotesDetailSizingDelegate)sizingDelegate;
- (THNotesDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 tableView:(id)a5 sizingDelegate:(id)a6;
- (THNotesDetailTableViewCellController)tableViewCellController;
- (THNotesDetailTableViewController)myTableViewController;
- (UILongPressGestureRecognizer)longPressGR;
- (UIView)myView;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)p_handleGR:(id)a3;
- (void)p_hideView:(BOOL)a3 withTag:(int64_t)a4 subViewOf:(id)a5;
- (void)p_setTransform:(CGAffineTransform *)a3 onViewWithTag:(int64_t)a4 parentView:(id)a5;
- (void)populateWithCellController:(id)a3 annotation:(id)a4 cellWidth:(double)a5 highlightLayer:(id)a6 highlightTextFrame:(CGRect)a7 editingHighlightLayer:(id)a8 pageNumberString:(id)a9 topAdjustment:(double)a10 showDivider:(BOOL)a11;
- (void)returnToBook:(id)a3;
- (void)searchText:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightedText:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setIsSectionHeaderCell:(BOOL)a3;
- (void)setLongPressGR:(id)a3;
- (void)setMyTableViewController:(id)a3;
- (void)setMyView:(id)a3;
- (void)setNoteText:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSizingDelegate:(id)a3;
- (void)setTableViewCellController:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation THNotesDetailTableViewCell

- (THNotesDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 tableView:(id)a5 sizingDelegate:(id)a6
{
  v18.receiver = self;
  v18.super_class = (Class)THNotesDetailTableViewCell;
  v8 = [(THNotesDetailTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  v9 = v8;
  if (v8)
  {
    v8->mSizingDelegate = (THNotesDetailSizingDelegate *)a6;
    [(THNotesDetailTableViewCell *)v8 setAutoresizesSubviews:1];
    [(THNotesDetailTableViewCell *)v9 setAutoresizingMask:18];
    [v9 contentView].setAutoresizesSubviews:1;
    [v9 contentView].autoresizingMask = 18;
    [v9 contentView].backgroundColor = [UIColor bc_booksBackground];
    id v10 = objc_alloc((Class)UIView);
    [(THNotesDetailTableViewCell *)v9 bounds];
    v11 = [v10 initWithFrame:];
    v9->mMyView = v11;
    [(UIView *)v11 setTag:12];
    [(UIView *)v9->mMyView setAutoresizingMask:18];
    [(UIView *)v9->mMyView setAutoresizesSubviews:1];
    [(UIView *)v9->mMyView setBackgroundColor:+[UIColor bc_booksBackground]];
    [v9->mMyView addSubview:[v9 contentView]];
    [(THNotesDetailTableViewCell *)v9 frame];
    double v13 = v12;
    double v15 = v14;
    [a5 frame];
    -[THNotesDetailTableViewCell setFrame:](v9, "setFrame:", v13, v15);
    v16 = objc_alloc_init(THNotesDetailTableViewCellLayoutManager);
    [(THNotesDetailTableViewCellLayoutManager *)v16 setDelegate:v9];
    [(THNotesDetailTableViewCell *)v9 setLayoutManager:v16];
  }
  return v9;
}

- (void)dealloc
{
  self->mIndexPath = 0;
  self->mMyView = 0;

  self->mTableViewCellController = 0;
  self->mLongPressGR = 0;

  self->mHighlightedText = 0;
  self->mNoteText = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewCell;
  [(THNotesDetailTableViewCell *)&v3 dealloc];
}

- (void)populateWithCellController:(id)a3 annotation:(id)a4 cellWidth:(double)a5 highlightLayer:(id)a6 highlightTextFrame:(CGRect)a7 editingHighlightLayer:(id)a8 pageNumberString:(id)a9 topAdjustment:(double)a10 showDivider:(BOOL)a11
{
  BOOL v11 = a11;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  [(THNotesDetailTableViewCell *)self setTableViewCellController:a3];
  [(UIView *)[(THNotesDetailTableViewCell *)self myView] bounds];
  [self->mTableViewCellController->view setFrame:v21, v22, v23, v24];
  [(UIView *)[(THNotesDetailTableViewCell *)self myView] addSubview:[(THNotesDetailTableViewCellController *)self->mTableViewCellController view]];
  -[THNotesDetailTableViewCellController populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:](self->mTableViewCellController, "populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:", a4, a6, a8, a9, v11, a5, x, y, width, height, a10);
  [self->mTableViewCellController->view layoutIfNeeded];
  [(THNotesDetailTableViewCell *)self frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  [self->mTableViewCellController->view frame];
  -[THNotesDetailTableViewCell setFrame:](self, "setFrame:", v26, v28, v30);
  [(TSWButton *)[(THNotesDetailTableViewCellController *)self->mTableViewCellController returnToBook] frame];
  CGFloat v31 = v42.origin.x;
  CGFloat v32 = v42.origin.y;
  CGFloat v33 = v42.size.width;
  CGFloat v34 = v42.size.height;
  double v35 = CGRectGetHeight(v42);
  v43.origin.double x = v31;
  v43.origin.double y = v32;
  v43.size.double width = v33;
  v43.size.double height = v34;
  double v36 = CGRectGetWidth(v43);
  double v37 = v35 * 0.5 + -60.0;
  if (v35 >= 60.0) {
    double v37 = v35;
  }
  if (v36 < 60.0) {
    double v36 = v36 * 0.5 + -60.0;
  }
  -[TSWButton setHitRegionEdgeInsets:]([(THNotesDetailTableViewCellController *)self->mTableViewCellController returnToBook], "setHitRegionEdgeInsets:", floor(v37), floor(v36), ceil(v37), ceil(v36));
  [(TSWButton *)[(THNotesDetailTableViewCellController *)self->mTableViewCellController returnToBook] addTarget:self action:"returnToBook:" forControlEvents:64];
  if (isPhone())
  {
    -[THNotesDetailTableViewCell setLongPressGR:](self, "setLongPressGR:", [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"p_handleGR:"]);
    [(UILongPressGestureRecognizer *)[(THNotesDetailTableViewCell *)self longPressGR] setDelegate:self];
    v38 = [(THNotesDetailTableViewCell *)self longPressGR];
    [(THNotesDetailTableViewCell *)self addGestureRecognizer:v38];
  }
}

- (void)copy:(id)a3
{
  if ([(THNotesDetailTableViewCell *)self highlightedText])
  {
    id v4 = [(THBookViewController *)[(THNotesDetailTableViewController *)self->mMyTableViewController bookViewController] activityItemProviderWithCachedAnnotation:[(THNotesDetailTableViewCellController *)self->mTableViewCellController annotation]];
    if (!v4) {
      return;
    }
    v5 = (NSString *)[v4 pasteboardString];
  }
  else
  {
    if (![(THNotesDetailTableViewCell *)self noteText]) {
      return;
    }
    v5 = [(THNotesDetailTableViewCell *)self noteText];
  }
  v6 = v5;
  if (v5)
  {
    v7 = +[UIPasteboard generalPasteboard];
    [(UIPasteboard *)v7 setString:v6];
  }
}

- (void)returnToBook:(id)a3
{
  if ([(THNotesDetailTableViewCellController *)self->mTableViewCellController annotation]
    && ([(THAnnotation *)[(THNotesDetailTableViewCellController *)self->mTableViewCellController annotation] annotationIsOrphan] & 1) == 0)
  {
    id v4 = [(THNotesDetailTableViewController *)[(THNotesDetailTableViewCell *)self myTableViewController] delegate];
    v5 = [(THNotesDetailTableViewCell *)self myTableViewController];
    v6 = [(THNotesDetailTableViewCellController *)self->mTableViewCellController annotation];
    [(THNotesDetailTableViewControllerDelegate *)v4 tableViewController:v5 navigateToNote:v6];
  }
}

- (void)searchText:(id)a3
{
  if ([(THNotesDetailTableViewCell *)self highlightedText]) {
    id v4 = [(THNotesDetailTableViewCell *)self highlightedText];
  }
  else {
    id v4 = [(THNotesDetailTableViewCell *)self noteText];
  }
  v5 = v4;
  v6 = [(THNotesDetailTableViewController *)[(THNotesDetailTableViewCell *)self myTableViewController] delegate];
  v7 = [(THNotesDetailTableViewCell *)self myTableViewController];

  [(THNotesDetailTableViewControllerDelegate *)v6 tableViewController:v7 searchBookForText:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if ([(THNotesDetailTableViewCell *)self longPressGR] != a3) {
    return 1;
  }
  [(TSWButton *)[(THNotesDetailTableViewCellController *)self->mTableViewCellController returnToBook] bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [a4 locationInView:[self->mTableViewCellController returnToBook]];
  v18.double x = v16;
  v18.double y = v17;
  v19.origin.double x = v9;
  v19.origin.double y = v11;
  v19.size.double width = v13;
  v19.size.double height = v15;
  return !CGRectContainsPoint(v19, v18)
      && ([(THNotesDetailTableViewCell *)self isEditing] & 1) == 0
      && [(THNotesDetailTableViewCell *)self longPressGR] == a3;
}

- (void)p_handleGR:(id)a3
{
  self->mHighlightedText = 0;
  self->mNoteText = 0;
  [a3 locationInView:self];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  if ([(THNotesDetailTableViewCell *)self longPressGR] == a3)
  {
    [(THNotesDetailTableViewCellHighlightView *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] highlightView] frame];
    v35.double x = v6;
    v35.double y = v8;
    if (CGRectContainsPoint(v37, v35)
      && objc_msgSend(-[THAnnotation annotationRepresentativeText](-[THNotesDetailTableViewCellController annotation](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "annotation"), "annotationRepresentativeText"), "length"))
    {
      [(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] highlightTextFrame];
      -[THNotesDetailTableViewCell convertRect:fromView:](self, "convertRect:fromView:", [(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] highlightView], v9, v10, v11, v12);
      double x = v13;
      double y = v15;
      double width = v17;
      double height = v19;
      [(THNotesDetailTableViewCell *)self setHighlightedText:[(THAnnotation *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] annotation] annotationRepresentativeText]];
    }
    else
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      [(UILabel *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] noteLabel] frame];
      v36.double x = v6;
      v36.double y = v8;
      if (CGRectContainsPoint(v38, v36)
        && objc_msgSend(-[THAnnotation annotationNote](-[THNotesDetailTableViewCellController annotation](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "annotation"), "annotationNote"), "length"))
      {
        [(UILabel *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] noteLabel] frame];
        double x = v21;
        double y = v22;
        double width = v23;
        double height = v24;
        id v25 = [+[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [v25 setLineBreakMode:[-[UILabel lineBreakMode](-[THNotesDetailTableViewCellController noteLabel](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "noteLabel"), "lineBreakMode")]];
        double v26 = [(UILabel *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] noteLabel] text];
        v33[0] = NSFontAttributeName;
        v33[1] = NSParagraphStyleAttributeName;
        v34[0] = [(UILabel *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] noteLabel] font];
        v34[1] = v25;
        -[NSString boundingRectWithSize:options:attributes:context:](v26, "boundingRectWithSize:options:attributes:context:", 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2), 0, width, height);
        double v28 = v27;
        double v30 = v29;

        if (v28 < width)
        {
          double height = v30;
          double width = v28;
        }
        [(THNotesDetailTableViewCell *)self setNoteText:[(THAnnotation *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] annotation] annotationNote]];
      }
    }
    if ([(THNotesDetailTableViewCell *)self highlightedText]
      || [(THNotesDetailTableViewCell *)self noteText])
    {
      [(THNotesDetailTableViewCell *)self becomeFirstResponder];
      CGFloat v31 = +[UIMenuController sharedMenuController];
      id v32 = [objc_alloc((Class)UIMenuItem) initWithTitle:[THBundle localizedStringForKey:@"Search" value:&stru_46D7E8 table:0] action:@"searchText:"];
      [(UIMenuController *)v31 setMenuItems:+[NSArray arrayWithObject:v32]];

      -[UIMenuController setTargetRect:inView:](v31, "setTargetRect:inView:", self, x, y, width, height);
      [(UIMenuController *)v31 setMenuVisible:1 animated:1];
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("copy:" != a3) {
    return "searchText:" == a3;
  }
  if (![(THNotesDetailTableViewCellController *)self->mTableViewCellController annotation]) {
    return 1;
  }
  CGFloat v6 = [(THNotesDetailTableViewController *)self->mMyTableViewController bookViewController];

  return [(THBookViewController *)v6 allowCopy];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewCell;
  -[THNotesDetailTableViewCell setEditing:animated:](&v8, "setEditing:animated:");
  objc_opt_class();
  [(THNotesDetailTableViewCell *)self viewWithTag:4];
  double v7 = (void *)TSUDynamicCast();
  if (v7) {
    [v7 setEditing:v5 animated:v4];
  }
  [(THNotesDetailTableViewCell *)self setNeedsLayout];
}

- (void)p_hideView:(BOOL)a3 withTag:(int64_t)a4 subViewOf:(id)a5
{
  BOOL v5 = a3;
  id v6 = [a5 viewWithTag:a4];
  if (v6)
  {
    double v7 = 1.0;
    if (v5) {
      double v7 = 0.0;
    }
    [v6 setAlpha:v7];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [self.selectedBackgroundView setAlpha:0.0];

  +[CATransaction commit];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(UIView *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] highlightColorBar] backgroundColor];
  id v7 = [(UIImageView *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] divider] backgroundColor];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewCell;
  [(THNotesDetailTableViewCell *)&v8 setSelected:v4 animated:0];
  [self selectedBackgroundView].alpha = 0.0;
  +[CATransaction commit];
  [(UIView *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] highlightColorBar] setBackgroundColor:v6];
  [(UIImageView *)[(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] divider] setBackgroundColor:v7];
}

- (void)willTransitionToState:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewCell;
  -[THNotesDetailTableViewCell willTransitionToState:](&v7, "willTransitionToState:");
  self->mCellState = a3;
  if (a3 - 1 < 2)
  {
    uint64_t v5 = 0;
    p_mTableViewCellController = &self->mTableViewCellController;
LABEL_6:
    [(TSWButton *)[(THNotesDetailTableViewCellController *)*p_mTableViewCellController returnToBook] setEnabled:v5];
    return;
  }
  if (!a3)
  {
    p_mTableViewCellController = &self->mTableViewCellController;
    if (([(THAnnotation *)[(THNotesDetailTableViewCellController *)*p_mTableViewCellController annotation] annotationIsOrphan] & 1) == 0)
    {
      uint64_t v5 = 1;
      goto LABEL_6;
    }
  }
}

- (void)setIndexPath:(id)a3
{
  self->mIndexPath = (NSIndexPath *)[a3 copy];
}

- (CGRect)p_getFrameForViewWithTag:(int64_t)a3 parentView:(id)a4
{
  id v4 = [a4 viewWithTag:a3];

  [v4 frame];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)p_setTransform:(CGAffineTransform *)a3 onViewWithTag:(int64_t)a4 parentView:(id)a5
{
  id v6 = [a5 viewWithTag:a4];
  long long v7 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a3->tx;
  [v6 setTransform:v8];
}

- (CGRect)editControlCenteringRect
{
  v2 = [(THNotesDetailTableViewCellController *)[(THNotesDetailTableViewCell *)self tableViewCellController] highlightColorBar];

  [(UIView *)v2 frame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSIndexPath)indexPath
{
  return self->mIndexPath;
}

- (UIView)myView
{
  return self->mMyView;
}

- (void)setMyView:(id)a3
{
}

- (THNotesDetailTableViewController)myTableViewController
{
  return self->mMyTableViewController;
}

- (void)setMyTableViewController:(id)a3
{
  self->mMyTableViewController = (THNotesDetailTableViewController *)a3;
}

- (BOOL)isSectionHeaderCell
{
  return self->mIsSectionHeaderCell;
}

- (void)setIsSectionHeaderCell:(BOOL)a3
{
  self->mIsSectionHeaderCell = a3;
}

- (THNotesDetailTableViewCellController)tableViewCellController
{
  return self->mTableViewCellController;
}

- (void)setTableViewCellController:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGR
{
  return self->mLongPressGR;
}

- (void)setLongPressGR:(id)a3
{
}

- (NSString)highlightedText
{
  return self->mHighlightedText;
}

- (void)setHighlightedText:(id)a3
{
}

- (NSString)noteText
{
  return self->mNoteText;
}

- (void)setNoteText:(id)a3
{
}

- (THNotesDetailSizingDelegate)sizingDelegate
{
  return self->mSizingDelegate;
}

- (void)setSizingDelegate:(id)a3
{
  self->mSizingDelegate = (THNotesDetailSizingDelegate *)a3;
}

@end