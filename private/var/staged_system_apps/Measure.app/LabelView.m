@interface LabelView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (NSDictionary)labels;
- (_TtC7Measure9LabelView)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onLabelViewTapped;
- (void)setLabels:(id)a3;
@end

@implementation LabelView

- (NSDictionary)labels
{
  swift_beginAccess();
  type metadata accessor for LabelRender();
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setLabels:(id)a3
{
  type metadata accessor for LabelRender();
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Measure9LabelView_labels);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v14 = a5;
    v15 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1000E0C1C((unint64_t *)&qword_1004CA040, type metadata accessor for NSKeyValueChangeKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  sub_1000E08E8(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001C9D8((uint64_t)v16);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  v5 = self;
  id v6 = [v4 standardUserDefaults];
  NSString v7 = [self measureUnits];
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [v6 removeObserver:v5 forKeyPath:v7];

  v8.receiver = v5;
  v8.super_class = ObjectType;
  [(LabelView *)&v8 dealloc];
}

- (void).cxx_destruct
{
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure9LabelView_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = sub_1000E0B54(v6, v7);

  return v9 & 1;
}

- (void)onLabelViewTapped
{
  NSDictionary v2 = self;
  sub_1000DF6D0();
}

- (_TtC7Measure9LabelView)init
{
  result = (_TtC7Measure9LabelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end