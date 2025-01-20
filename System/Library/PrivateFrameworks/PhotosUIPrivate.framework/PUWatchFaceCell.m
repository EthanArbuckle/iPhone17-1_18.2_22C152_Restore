@interface PUWatchFaceCell
- (PUWatchFaceCell)initWithCoder:(id)a3;
- (PUWatchFaceCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PUWatchFaceCell

- (PUWatchFaceCell)initWithFrame:(CGRect)a3
{
  return (PUWatchFaceCell *)sub_1AEAFCF5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEAFD114();
}

- (PUWatchFaceCell)initWithCoder:(id)a3
{
}

@end