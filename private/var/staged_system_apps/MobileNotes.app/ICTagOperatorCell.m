@interface ICTagOperatorCell
- (ICTagOperatorCell)initWithCoder:(id)a3;
- (ICTagOperatorCell)initWithFrame:(CGRect)a3;
- (ICTagSelection)tagSelection;
- (id)selectionChangeHandler;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setSelectionChangeHandler:(id)a3;
- (void)setTagSelection:(id)a3;
@end

@implementation ICTagOperatorCell

- (id)selectionChangeHandler
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler))
  {
    uint64_t v2 = *(void *)&self->selectionChangeHandler[OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1002B6294;
    v5[3] = &unk_100637BB0;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setSelectionChangeHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1002900E8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;

  sub_10002E70C(v8);
}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                   + OBJC_IVAR___ICTagOperatorCell_tagSelection));
}

- (void)setTagSelection:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagOperatorCell_tagSelection);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagOperatorCell_tagSelection) = (Class)a3;
  id v6 = a3;
  uint64_t v5 = self;

  sub_1003703D8();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100370560((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (ICTagOperatorCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  *uint64_t v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagOperatorCell_tagSelection) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagOperatorCell____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagOperatorCell____lazy_storage___anyAction) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagOperatorCell____lazy_storage___allAction) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[ICTagOperatorCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (ICTagOperatorCell)initWithCoder:(id)a3
{
  return (ICTagOperatorCell *)sub_100371410(a3);
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell_tagSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell____lazy_storage___anyAction));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagOperatorCell____lazy_storage___allAction);
}

@end