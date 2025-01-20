@interface SFCapsuleTabGroupView
- (SFCapsuleTabGroupView)init;
- (SFCapsuleTabGroupView)initWithCoder:(id)a3;
- (SFCapsuleTabGroupView)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation SFCapsuleTabGroupView

- (void)updateConstraints
{
  v2 = self;
  sub_18C37B020();
}

- (SFCapsuleTabGroupView)init
{
  return -[SFCapsuleTabGroupView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 100.0, 44.0);
}

- (SFCapsuleTabGroupView)initWithFrame:(CGRect)a3
{
  return (SFCapsuleTabGroupView *)sub_18C3CEED4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFCapsuleTabGroupView)initWithCoder:(id)a3
{
  return (SFCapsuleTabGroupView *)sub_18C68BB54(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFCapsuleTabGroupView_titleLabel);
}

@end