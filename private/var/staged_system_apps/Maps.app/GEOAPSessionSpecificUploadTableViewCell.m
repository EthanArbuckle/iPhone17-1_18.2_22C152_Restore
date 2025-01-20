@interface GEOAPSessionSpecificUploadTableViewCell
- (_TtC4Maps39GEOAPSessionSpecificUploadTableViewCell)initWithCoder:(id)a3;
- (_TtC4Maps39GEOAPSessionSpecificUploadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation GEOAPSessionSpecificUploadTableViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps39GEOAPSessionSpecificUploadTableViewCell_cellConfig);
  if (v8)
  {
    *((void *)&v12 + 1) = type metadata accessor for GEOAPSessionSpecificUploadTableViewCellConfiguration();
    uint64_t v13 = sub_1003350F8(&qword_1015DC170, v9, (void (*)(uint64_t))type metadata accessor for GEOAPSessionSpecificUploadTableViewCellConfiguration);
    *(void *)&long long v11 = v8;
  }
  else
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_retain_n();
  v10 = self;
  UITableViewCell.contentConfiguration.setter();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC4Maps39GEOAPSessionSpecificUploadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC4Maps39GEOAPSessionSpecificUploadTableViewCell_cellConfig) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC4Maps39GEOAPSessionSpecificUploadTableViewCell_cellConfig) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GEOAPSessionSpecificUploadTableViewCell();
  v7 = [(GEOAPSessionSpecificUploadTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC4Maps39GEOAPSessionSpecificUploadTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39GEOAPSessionSpecificUploadTableViewCell_cellConfig) = 0;
  id v4 = a3;

  result = (_TtC4Maps39GEOAPSessionSpecificUploadTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end