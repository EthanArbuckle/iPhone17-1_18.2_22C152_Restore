@interface DOCPickerFilenameView
- (NSArray)tags;
- (UIButton)tagButton;
- (_TtC5Files16DOCPickerContext)pickerContext;
- (_TtC5Files21DOCPickerFilenameView)initWithCoder:(id)a3;
- (_TtC5Files21DOCPickerFilenameView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setPickerContext:(id)a3;
- (void)setTagButton:(id)a3;
- (void)setTags:(id)a3;
- (void)tagEditor:(id)a3 userDidDeselectTag:(id)a4;
- (void)tagEditor:(id)a3 userDidSelectTag:(id)a4;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation DOCPickerFilenameView

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return (_TtC5Files16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                 + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_pickerContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_pickerContext) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100100540();
}

- (NSArray)tags
{
  swift_beginAccess();
  sub_10009E6C4(0, &qword_10070E2D0);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setTags:(id)a3
{
  sub_10009E6C4(0, &qword_10070E2D0);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess();
  uint64_t *v5 = v4;
  id v6 = self;
  swift_bridgeObjectRelease();
  id v7 = sub_1000FEFF4();
  [v7 setNeedsUpdateConfiguration];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000FEA18(v4);
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000FEB70(v4);
}

- (UIButton)tagButton
{
  NSArray v2 = self;
  id v3 = sub_1000FEFF4();

  return (UIButton *)v3;
}

- (void)setTagButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___tagButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___tagButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Files21DOCPickerFilenameView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100101FE0();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCPickerFilenameView(0);
  id v2 = v4.receiver;
  [(DOCPickerFilenameView *)&v4 layoutSubviews];
  sub_1000FECCC();
  id v3 = sub_1000FEFF4();
  [v3 setNeedsUpdateConfiguration];
}

- (_TtC5Files21DOCPickerFilenameView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Files21DOCPickerFilenameView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_delegate);

  swift_bridgeObjectRelease();
  sub_100102740((uint64_t)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_metrics);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___stackedThumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___filenameButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___filenameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___filenameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___tagButton));
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

- (void)tagEditor:(id)a3 userDidSelectTag:(id)a4
{
  id v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  id v9 = sub_1000FEFF4();
  [v9 setNeedsUpdateConfiguration];
  swift_unknownObjectRelease();
}

- (void)tagEditor:(id)a3 userDidDeselectTag:(id)a4
{
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  uint64_t v9 = sub_100102214(v6);
  uint64_t v10 = v9;
  if ((unint64_t)*v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v11 >= v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v9)
    {
LABEL_3:
      sub_100516320(v10, v11);
      swift_endAccess();
      id v12 = sub_1000FEFF4();
      [v12 setNeedsUpdateConfiguration];
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

@end