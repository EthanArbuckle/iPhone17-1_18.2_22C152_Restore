@interface ListTodayCardCollectionViewCell
- (BOOL)isDragging;
- (NSArray)accessibilityElements;
- (_TtC8AppStore31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)applyContentSizeCategoryUpdates;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)isa;
- (void)setDragging:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ListTodayCardCollectionViewCell

- (void)willMoveToWindow:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(ListTodayCardCollectionViewCell *)&v8 willMoveToWindow:v5];
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v7 = Strong;
    sub_10037F530(Strong);

    swift_unknownObjectWeakAssign();
  }
}

- (_TtC8AppStore31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ListTodayCardCollectionViewCell *)sub_10003946C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000197EC();
}

- (BOOL)isDragging
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ListTodayCardCollectionViewCell *)&v3 isDragging];
}

- (void)setDragging:(BOOL)a3
{
  id v4 = self;
  sub_10037D3D8(a3);
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(ListTodayCardCollectionViewCell *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for CornerStyle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = self;
  [(ListTodayCardCollectionViewCell *)&v14 _setContinuousCornerRadius:a3];
  v13.receiver = v10;
  v13.super_class = ObjectType;
  [(ListTodayCardCollectionViewCell *)&v13 _continuousCornerRadius];
  double v12 = v11;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for CornerStyle.continuous(_:), v6);
  sub_1003803F0((uint64_t)v9, 3, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10037DEC4();
}

- (void)applyContentSizeCategoryUpdates
{
  v2 = self;
  sub_10005E498();
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_10037FD0C();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(ListTodayCardCollectionViewCell *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_labelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_lockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_topLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_trailingLockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_riverBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_riverContainerView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_cardStyle, &qword_100986FE0);

  swift_unknownObjectWeakDestroy();
}

@end