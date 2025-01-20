@interface HitPassthroughWindow
- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithFrame:(CGRect)a3;
- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation HitPassthroughWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for HitPassthroughWindow();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[HitPassthroughWindow hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  type metadata accessor for HitPassthroughView();
  unsigned __int8 v11 = [v10 isKindOfClass:swift_getObjCClassFromMetadata()];

  id v7 = v10;
  if (v11)
  {
LABEL_5:

    v10 = 0;
  }

  return v10;
}

- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HitPassthroughWindow();
  return [(HitPassthroughWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator20HitPassthroughWindow *)sub_1000FDEA8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for HitPassthroughWindow);
}

- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator20HitPassthroughWindow *)sub_1000FDF34(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for HitPassthroughWindow);
}

@end