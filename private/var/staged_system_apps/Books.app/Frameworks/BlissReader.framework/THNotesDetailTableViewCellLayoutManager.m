@interface THNotesDetailTableViewCellLayoutManager
- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)editControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (THNotesDetailTableViewCellLayoutManagerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation THNotesDetailTableViewCellLayoutManager

- (CGRect)editControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  v16.receiver = self;
  v16.super_class = (Class)THNotesDetailTableViewCellLayoutManager;
  [(THNotesDetailTableViewCellLayoutManager *)&v16 editControlStartingRectForCell:a3 forNewEditingState:a4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(THNotesDetailTableViewCellLayoutManagerDelegate *)self->_delegate editControlCenteringRect];
  float v11 = CGRectGetMidY(v17) + v10 * -0.5;
  double v12 = floorf(v11);
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)THNotesDetailTableViewCellLayoutManager;
  -[THNotesDetailTableViewCellLayoutManager editControlEndingRectForCell:forNewEditingState:](&v18, "editControlEndingRectForCell:forNewEditingState:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v4
    && +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [a3 semanticContentAttribute]) == UIUserInterfaceLayoutDirectionLeftToRight)
  {
    double v8 = v8 + 29.0;
  }
  [(THNotesDetailTableViewCellLayoutManagerDelegate *)self->_delegate editControlCenteringRect];
  float v13 = CGRectGetMidY(v19) + v12 * -0.5;
  double v14 = floorf(v13);
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (THNotesDetailTableViewCellLayoutManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNotesDetailTableViewCellLayoutManagerDelegate *)a3;
}

@end