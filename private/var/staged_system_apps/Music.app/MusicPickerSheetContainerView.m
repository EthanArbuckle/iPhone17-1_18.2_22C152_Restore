@interface MusicPickerSheetContainerView
- (_TtC5Music29MusicPickerSheetContainerView)initWithCoder:(id)a3;
- (_TtC5Music29MusicPickerSheetContainerView)initWithFrame:(CGRect)a3;
@end

@implementation MusicPickerSheetContainerView

- (_TtC5Music29MusicPickerSheetContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music29MusicPickerSheetContainerView *)sub_1005BF9C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music29MusicPickerSheetContainerView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_completionHandler);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dismissedHandler);
  void *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_sourceTracks) = (Class)_swiftEmptyArrayStorage;
  uint64_t v7 = OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dataSource;
  type metadata accessor for PickerDataSource();
  swift_allocObject();
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_1005C01F4();

  result = (_TtC5Music29MusicPickerSheetContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_completionHandler));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music29MusicPickerSheetContainerView_dismissedHandler));
  swift_bridgeObjectRelease();

  swift_release();
}

@end