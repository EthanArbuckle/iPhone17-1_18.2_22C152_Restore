@interface RCRecordingsCollectionView
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFirstResponder;
- (RCRecordingsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)_styleView;
@end

@implementation RCRecordingsCollectionView

- (RCRecordingsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RCRecordingsCollectionView;
  v4 = -[RCRecordingsCollectionView initWithFrame:collectionViewLayout:](&v7, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    [(RCRecordingsCollectionView *)v4 _styleView];
  }
  return v5;
}

- (void)_styleView
{
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v5 recordingsCollectionViewBackgroundColor];
  if (v3)
  {
    [(RCRecordingsCollectionView *)self setBackgroundColor:v3];
    v4 = [(RCRecordingsCollectionView *)self backgroundView];
    [v4 setBackgroundColor:v3];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  return 0;
}

@end