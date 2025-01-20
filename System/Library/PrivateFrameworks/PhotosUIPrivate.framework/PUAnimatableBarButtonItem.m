@interface PUAnimatableBarButtonItem
+ (id)barButtonItemWithSystemImageName:(id)a3;
- (NSString)currentImageName;
- (PUAnimatableBarButtonItem)init;
- (PUAnimatableBarButtonItem)initWithCoder:(id)a3;
- (void)addTarget:(id)a3 action:(SEL)a4 for:(unint64_t)a5;
- (void)setCurrentImageName:(id)a3;
- (void)setImageNamed:(id)a3 animation:(int64_t)a4;
@end

@implementation PUAnimatableBarButtonItem

- (NSString)currentImageName
{
  sub_1AEB3CDAC();
  if (v2)
  {
    v3 = (void *)sub_1AEF96DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setCurrentImageName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AEF96DE0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1AEB3CE68(v4, v6);
}

+ (id)barButtonItemWithSystemImageName:(id)a3
{
  uint64_t v3 = sub_1AEF96DE0();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  uint64_t v6 = sub_1AEB3CE98(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (void)setImageNamed:(id)a3 animation:(int64_t)a4
{
  uint64_t v6 = sub_1AEF96DE0();
  uint64_t v8 = v7;
  v9 = self;
  sub_1AEB3D600(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)addTarget:(id)a3 action:(SEL)a4 for:(unint64_t)a5
{
  if (a3)
  {
    uint64_t v8 = self;
    swift_unknownObjectRetain();
    sub_1AEF97980();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  sub_1AEB3E3B4((uint64_t)v10, (uint64_t)a4, a5);

  sub_1AEA1B314((uint64_t)v10);
}

- (PUAnimatableBarButtonItem)init
{
  return (PUAnimatableBarButtonItem *)sub_1AEB3E5A4();
}

- (PUAnimatableBarButtonItem)initWithCoder:(id)a3
{
  return (PUAnimatableBarButtonItem *)sub_1AEB3E654(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PUAnimatableBarButtonItem_propertyAnimator);
}

@end