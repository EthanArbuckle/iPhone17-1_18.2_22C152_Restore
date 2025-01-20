@interface PUImportOneUpTransitionItem
- (CGRect)initialFrame;
- (CGRect)targetFrame;
- (PUImportOneUpTransitionItem)initWithInitialFrame:(CGRect)a3 snapshotImage:(id)a4 importItem:(id)a5 indexPath:(PXSimpleIndexPath *)a6;
- (PXImportItemViewModel)importItem;
- (PXSimpleIndexPath)indexPath;
- (UIImage)snapshotImage;
- (UIView)transitionView;
- (double)initialContentAlpha;
- (double)targetContentAlpha;
- (void)setInitialContentAlpha:(double)a3;
- (void)setInitialFrame:(CGRect)a3;
- (void)setSnapshotImage:(id)a3;
- (void)setTargetContentAlpha:(double)a3;
- (void)setTargetFrame:(CGRect)a3;
- (void)setTransitionView:(id)a3;
@end

@implementation PUImportOneUpTransitionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_importItem, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

- (void)setTargetContentAlpha:(double)a3
{
  self->_targetContentAlpha = a3;
}

- (double)targetContentAlpha
{
  return self->_targetContentAlpha;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTransitionView:(id)a3
{
}

- (UIView)transitionView
{
  return self->_transitionView;
}

- (void)setInitialContentAlpha:(double)a3
{
  self->_initialContentAlpha = a3;
}

- (double)initialContentAlpha
{
  return self->_initialContentAlpha;
}

- (PXSimpleIndexPath)indexPath
{
  long long v3 = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[2].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXImportItemViewModel)importItem
{
  return self->_importItem;
}

- (void)setSnapshotImage:(id)a3
{
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGRect)initialFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PUImportOneUpTransitionItem)initWithInitialFrame:(CGRect)a3 snapshotImage:(id)a4 importItem:(id)a5 indexPath:(PXSimpleIndexPath *)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PUImportOneUpTransitionItem;
  v16 = [(PUImportOneUpTransitionItem *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_initialFrame.origin.CGFloat x = x;
    v16->_initialFrame.origin.CGFloat y = y;
    v16->_initialFrame.size.CGFloat width = width;
    v16->_initialFrame.size.CGFloat height = height;
    objc_storeStrong((id *)&v16->_snapshotImage, a4);
    objc_storeStrong((id *)&v17->_importItem, a5);
    long long v18 = *(_OWORD *)&a6->item;
    *(_OWORD *)&v17->_indexPath.dataSourceIdentifier = *(_OWORD *)&a6->dataSourceIdentifier;
    *(_OWORD *)&v17->_indexPath.item = v18;
    v17->_initialContentAlpha = 1.0;
    v17->_targetContentAlpha = 1.0;
  }

  return v17;
}

@end