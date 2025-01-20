@interface AllRefinementsOpenAtCell
+ (NSString)reuseIdentifier;
- (_TtC4Maps24AllRefinementsOpenAtCell)initWithCoder:(id)a3;
- (_TtC4Maps24AllRefinementsOpenAtCell)initWithFrame:(CGRect)a3;
- (id)dateSelectionHandler;
- (void)datePickedValueChanged:(id)a3;
- (void)datePickerTapped:(id)a3;
- (void)setDateSelectionHandler:(id)a3;
- (void)shouldEnableControl:(BOOL)a3;
- (void)updatedContentsWithTime:(double)a3 displayName:(id)a4 openAtSelected:(BOOL)a5;
@end

@implementation AllRefinementsOpenAtCell

+ (NSString)reuseIdentifier
{
  swift_getObjCClassMetadata();
  sub_1000FF33C(&qword_1015DC368);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)dateSelectionHandler
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler))
  {
    uint64_t v2 = *(void *)&self->$__lazy_storage_$_openAtLabel[OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10033FDEC;
    v5[3] = &unk_1012E5410;
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

- (void)setDateSelectionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1003411A0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(char, double))((char *)self
                                          + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  *v7 = v6;
  v7[1] = (void (*)(char, double))v4;

  sub_10006C5D8(v8);
}

- (_TtC4Maps24AllRefinementsOpenAtCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___openAtLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___datePicker) = 0;
  uint64_t v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v9 = (objc_class *)type metadata accessor for AllRefinementsOpenAtCell();
  *uint64_t v8 = 0;
  v8[1] = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[AllRefinementsOpenAtCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_10033FF00();

  return v10;
}

- (_TtC4Maps24AllRefinementsOpenAtCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___openAtLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___datePicker) = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v6 = (objc_class *)type metadata accessor for AllRefinementsOpenAtCell();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(AllRefinementsOpenAtCell *)&v8 initWithCoder:a3];
}

- (void)updatedContentsWithTime:(double)a3 displayName:(id)a4 openAtSelected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v11 = self;
  sub_100340728(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
}

- (void)datePickedValueChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_100340A90(v4);
}

- (void)datePickerTapped:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_100340B00(v4);
}

- (void)shouldEnableControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  id v5 = sub_10033FB48();
  [v5 setEnabled:v3];

  id v6 = sub_10033FBD0();
  [v6 setUserInteractionEnabled:v3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___openAtLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___datePicker));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);

  sub_10006C5D8(v3);
}

@end