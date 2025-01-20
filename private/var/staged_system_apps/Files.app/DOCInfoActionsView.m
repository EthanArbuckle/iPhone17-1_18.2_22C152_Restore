@interface DOCInfoActionsView
- (CGRect)bounds;
- (CGRect)frame;
- (NSArray)nodes;
- (_TtC5Files18DOCInfoActionsView)initWithFrame:(CGRect)a3;
- (double)spacing;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNodes:(id)a3;
- (void)setSpacing:(double)a3;
@end

@implementation DOCInfoActionsView

- (double)spacing
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInfoActionsView();
  [(DOCInfoActionsView *)&v3 spacing];
  return result;
}

- (void)setSpacing:(double)a3
{
  v5 = (objc_class *)type metadata accessor for DOCInfoActionsView();
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  [(DOCInfoActionsView *)&v11 spacing];
  double v8 = v7;
  v10.receiver = v6;
  v10.super_class = v5;
  [(DOCInfoActionsView *)&v10 setSpacing:a3];
  [(DOCInfoActionsView *)v6 spacing];
  if (v9 != v8) {
    sub_100301F9C();
  }
}

- (NSArray)nodes
{
  swift_bridgeObjectRetain();
  sub_1000CBE70((uint64_t *)&unk_100706730);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setNodes:(id)a3
{
  sub_1000CBE70((uint64_t *)&unk_100706730);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1003021D0(v4);
}

- (void)layoutSubviews
{
  NSArray v2 = self;
  sub_10030225C();
}

- (CGRect)bounds
{
  sub_10030239C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGRect)frame
{
  sub_10030239C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (_TtC5Files18DOCInfoActionsView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC5Files18DOCInfoActionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files18DOCInfoActionsView_configuration));
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files18DOCInfoActionsView_actionDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end