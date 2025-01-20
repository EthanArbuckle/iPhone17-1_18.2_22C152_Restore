@interface SBIconListViewEmptyCell
- (BOOL)isRemoved;
- (SBIconListViewEmptyCell)initWithCellView:(id)a3;
- (UIView)cellView;
- (void)setCellView:(id)a3;
- (void)setRemoved:(BOOL)a3;
@end

@implementation SBIconListViewEmptyCell

- (SBIconListViewEmptyCell)initWithCellView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIconListViewEmptyCell;
  v6 = [(SBIconListViewEmptyCell *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cellView, a3);
  }

  return v7;
}

- (UIView)cellView
{
  return self->_cellView;
}

- (void)setCellView:(id)a3
{
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
}

@end