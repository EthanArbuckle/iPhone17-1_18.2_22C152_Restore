@interface SBRotatedIconListModel
+ (BOOL)supportsRotatedLayout;
- (SBIconListModel)unrotatedIconListModel;
- (id)activeTransactionCreatingIfNecessary:(BOOL)a3;
- (id)gridSizeClassSizesWithOptions:(unint64_t)a3;
- (void)markIconStateDirty;
- (void)setUnrotatedIconListModel:(id)a3;
@end

@implementation SBRotatedIconListModel

+ (BOOL)supportsRotatedLayout
{
  return 0;
}

- (id)activeTransactionCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(SBRotatedIconListModel *)self unrotatedIconListModel];
  v5 = [v4 activeTransactionCreatingIfNecessary:v3];

  return v5;
}

- (void)markIconStateDirty
{
  v4.receiver = self;
  v4.super_class = (Class)SBRotatedIconListModel;
  [(SBIconListModel *)&v4 markIconStateDirty];
  BOOL v3 = [(SBRotatedIconListModel *)self unrotatedIconListModel];
  [v3 markIconStateDirty];
}

- (id)gridSizeClassSizesWithOptions:(unint64_t)a3
{
  objc_super v4 = [(SBIconListModel *)self rotatedIconGridSizeClassSizes];
  if (!v4)
  {
    objc_super v4 = [(SBIconListModel *)self iconGridSizeClassSizes];
  }
  return v4;
}

- (SBIconListModel)unrotatedIconListModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unrotatedIconListModel);
  return (SBIconListModel *)WeakRetained;
}

- (void)setUnrotatedIconListModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end