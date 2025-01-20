@interface BKAdjustGoalModalViewController
+ (void)createAsync:(int64_t)a3 :(int64_t)a4 :(id)a5 :(id)a6;
- (BKAdjustGoalModalViewController)initWithCoder:(id)a3;
- (BKAdjustGoalModalViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation BKAdjustGoalModalViewController

+ (void)createAsync:(int64_t)a3 :(int64_t)a4 :(id)a5 :(id)a6
{
  swift_unknownObjectRetain();
  id v10 = a6;
  sub_1006B67D8(a3, a4, (uint64_t)a5, v10);
  swift_unknownObjectRelease();
}

- (BKAdjustGoalModalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1007FDC70();
    id v8 = a4;
    a3 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v10 = [(BKAdjustGoalModalViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (BKAdjustGoalModalViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(BKAdjustGoalModalViewController *)&v5 initWithCoder:a3];
}

@end