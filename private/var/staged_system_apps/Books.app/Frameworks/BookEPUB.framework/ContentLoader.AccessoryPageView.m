@interface ContentLoader.AccessoryPageView
- (id)hitTest:(double)a3 withEvent:(uint64_t)a4;
- (id)initWithCoder:(uint64_t)a3;
- (id)initWithFrame:(double)a3;
@end

@implementation ContentLoader.AccessoryPageView

- (id)hitTest:(double)a3 withEvent:(uint64_t)a4
{
  v13.receiver = a1;
  v13.super_class = (Class)swift_getObjectType();
  id v8 = v13.receiver;
  id v9 = a5;
  id v10 = [super hitTest:v9 withEvent:a2];
  if (!v10 || (v11 = v10, v9, id v9 = v8, v11 == v8))
  {

    id v11 = 0;
  }

  return v11;
}

- (id)initWithFrame:(double)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)swift_getObjectType();
  return [super initWithFrame:a2, a3, a4, a5];
}

- (id)initWithCoder:(uint64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return [super initWithCoder:a3];
}

@end