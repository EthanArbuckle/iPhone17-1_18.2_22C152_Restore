@interface UITableViewPlaceholder
- (NSIndexPath)insertionIndexPath;
- (NSString)reuseIdentifier;
- (UITableViewPlaceholder)initWithInsertionIndexPath:(NSIndexPath *)insertionIndexPath reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight;
- (double)rowHeight;
- (void)cellUpdateHandler;
- (void)setCellUpdateHandler:(void *)cellUpdateHandler;
- (void)setInsertionIndexPath:(id)a3;
- (void)setReuseIdentifier:(id)a3;
- (void)setRowHeight:(double)a3;
@end

@implementation UITableViewPlaceholder

- (UITableViewPlaceholder)initWithInsertionIndexPath:(NSIndexPath *)insertionIndexPath reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight
{
  v10 = insertionIndexPath;
  v11 = reuseIdentifier;
  v17.receiver = self;
  v17.super_class = (Class)UITableViewPlaceholder;
  v12 = [(UITableViewPlaceholder *)&v17 init];
  if (!v12) {
    goto LABEL_8;
  }
  if (v10)
  {
    if (v11) {
      goto LABEL_4;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, v12, @"_UITableViewDropCoordinator.m", 441, @"Invalid parameter not satisfying: %@", @"insertionIndexPath != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, v12, @"_UITableViewDropCoordinator.m", 442, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

LABEL_4:
  if (rowHeight <= 0.0 && rowHeight != -1.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:v12 file:@"_UITableViewDropCoordinator.m" lineNumber:443 description:@"Invalid row height provided for the placeholder. Value must be greater than zero or UITableViewAutomaticDimension."];
  }
  objc_storeStrong((id *)&v12->_insertionIndexPath, insertionIndexPath);
  objc_storeStrong((id *)&v12->_reuseIdentifier, reuseIdentifier);
  v12->_rowHeight = rowHeight;
LABEL_8:

  return v12;
}

- (void)cellUpdateHandler
{
  return self->_cellUpdateHandler;
}

- (void)setCellUpdateHandler:(void *)cellUpdateHandler
{
}

- (NSIndexPath)insertionIndexPath
{
  return self->_insertionIndexPath;
}

- (void)setInsertionIndexPath:(id)a3
{
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_insertionIndexPath, 0);
  objc_storeStrong(&self->_cellUpdateHandler, 0);
}

@end