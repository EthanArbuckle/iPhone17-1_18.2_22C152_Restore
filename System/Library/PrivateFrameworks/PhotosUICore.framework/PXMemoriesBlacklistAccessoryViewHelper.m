@interface PXMemoriesBlacklistAccessoryViewHelper
+ (id)avatarViewWithFrame:(CGRect)a3 person:(id)a4;
@end

@implementation PXMemoriesBlacklistAccessoryViewHelper

+ (id)avatarViewWithFrame:(CGRect)a3 person:(id)a4
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v8 = a4;
    v9 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", x, y, width, height);
    [(PXPeopleScalableAvatarView *)v9 setPerson:v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end