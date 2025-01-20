@interface DOCUIImageMenuItem
- (_TtC5Files18DOCUIImageMenuItem)initWithCoder:(id)a3;
@end

@implementation DOCUIImageMenuItem

- (_TtC5Files18DOCUIImageMenuItem)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files18DOCUIImageMenuItem_longTitle);
  v6 = (objc_class *)type metadata accessor for DOCUIImageMenuItem();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(DOCUIImageMenuItem *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end