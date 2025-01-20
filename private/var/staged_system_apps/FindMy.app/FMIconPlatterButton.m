@interface FMIconPlatterButton
- (NSString)accessibilityLabel;
- (_TtC6FindMy19FMIconPlatterButton)init;
- (_TtC6FindMy19FMIconPlatterButton)initWithCoder:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMIconPlatterButton

- (_TtC6FindMy19FMIconPlatterButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000C8434();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1000C4230();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100006060(0, (unint64_t *)&qword_1006B0290);
  sub_1000C8370();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  v7 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for FMIconPlatterButton();
  [(FMPlatterButton *)&v14 touchesBegan:isa withEvent:v6];

  v9 = self;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  v13[4] = sub_1000C842C;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10003C410;
  v13[3] = &unk_100622A60;
  v11 = _Block_copy(v13);
  v12 = v7;
  swift_release();
  [v9 animateWithDuration:v11 animations:0.25];
  _Block_release(v11);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMIconPlatterButton();
  id v4 = a3;
  id v5 = v11.receiver;
  [(FMPlatterButton *)&v11 traitCollectionDidChange:v4];
  sub_1000C5A18();
  id v6 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(unsigned char *)(v7 + 24) = 0;
  v10[4] = sub_1000C81FC;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10003C410;
  v10[3] = &unk_100622970;
  v8 = _Block_copy(v10);
  id v9 = v5;
  swift_release();
  [v6 animateWithDuration:v8 animations:0.35];
  _Block_release(v8);
}

- (_TtC6FindMy19FMIconPlatterButton)init
{
  result = (_TtC6FindMy19FMIconPlatterButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_activityIndicator));
  sub_1000C8200((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_platterIcon);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_activeColor));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext);
  uint64_t v4 = *(void *)&self->super.alignment[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext];
  uint64_t v5 = *(void *)&self->super.background[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext + 7];
  uint64_t v6 = *(void *)&self->super.bottomSeparator[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext + 7];
  uint64_t v7 = *(void *)&self->super.topSeparator[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext + 7];
  unsigned __int8 v8 = self->iconView[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext];

  sub_1000C78E8(v3, v4, v5, v6, v7, v8);
}

@end