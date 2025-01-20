@interface PKPGSVTransitionInterstitialSnapshotContainerView
- (PKPGSVTransitionInterstitialSnapshotContainerView)init;
- (PKPGSVTransitionInterstitialSnapshotContainerView)initWithFrame:(CGRect)a3;
- (double)initWithSnapshotSize:(double)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PKPGSVTransitionInterstitialSnapshotContainerView

- (PKPGSVTransitionInterstitialSnapshotContainerView)init
{
  return 0;
}

- (PKPGSVTransitionInterstitialSnapshotContainerView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (double)initWithSnapshotSize:(double)a3
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)PKPGSVTransitionInterstitialSnapshotContainerView;
    result = (double *)objc_msgSendSuper2(&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (result)
    {
      result[51] = a2;
      result[52] = a3;
    }
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end