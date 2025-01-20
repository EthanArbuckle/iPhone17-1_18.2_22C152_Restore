@interface SUTableCellLayoutManager
- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
@end

@implementation SUTableCellLayoutManager

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  v23.receiver = self;
  v23.super_class = (Class)SUTableCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v23 accessoryEndingRectForCell:a3 forNewEditingState:a4 showingDeleteConfirmation:a5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = (void *)[a3 configuration];
  if (v14)
  {
    objc_msgSend(v14, "frameForAccessoryViewWithFrame:", v7, v9, v11, v13);
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end