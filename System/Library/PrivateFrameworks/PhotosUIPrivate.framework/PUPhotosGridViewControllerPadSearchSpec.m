@interface PUPhotosGridViewControllerPadSearchSpec
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation PUPhotosGridViewControllerPadSearchSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotosGridViewControllerPadSearchSpec;
  id v10 = a3;
  -[PUPhotosGridViewControllerPadSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v11, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v10, a4, top, left, bottom, right);
  objc_msgSend(v10, "setSectionTopPadding:", 0.0, v11.receiver, v11.super_class);
  [v10 setGlobalTopPadding:0.0];
}

@end