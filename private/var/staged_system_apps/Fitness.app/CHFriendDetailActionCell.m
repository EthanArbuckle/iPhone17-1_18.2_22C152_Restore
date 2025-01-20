@interface CHFriendDetailActionCell
+ (double)preferredCellHeight;
- (CHFriendDetailActionCell)initWithCoder:(id)a3;
- (CHFriendDetailActionCell)initWithFrame:(CGRect)a3;
@end

@implementation CHFriendDetailActionCell

- (CHFriendDetailActionCell)initWithFrame:(CGRect)a3
{
  return (CHFriendDetailActionCell *)sub_1003DCBF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (double)preferredCellHeight
{
  return 42.0;
}

- (CHFriendDetailActionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003DD4A4();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___CHFriendDetailActionCell_accessoryImageView);
}

@end