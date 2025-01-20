@interface GEOAPCurrentUploadTableViewCell
- (_TtC4Maps31GEOAPCurrentUploadTableViewCell)initWithCoder:(id)a3;
- (_TtC4Maps31GEOAPCurrentUploadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation GEOAPCurrentUploadTableViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps31GEOAPCurrentUploadTableViewCell_cellConfig);
  if (v8)
  {
    *((void *)&v11 + 1) = type metadata accessor for GEOAPCurrentUploadTableViewCellConfiguration();
    uint64_t v12 = sub_1001C0AF8(&qword_1015D3958, (void (*)(void))type metadata accessor for GEOAPCurrentUploadTableViewCellConfiguration);
    *(void *)&long long v10 = v8;
  }
  else
  {
    uint64_t v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
  }
  swift_retain_n();
  v9 = self;
  UITableViewCell.contentConfiguration.setter();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC4Maps31GEOAPCurrentUploadTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC4Maps31GEOAPCurrentUploadTableViewCell_cellConfig) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC4Maps31GEOAPCurrentUploadTableViewCell_cellConfig) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GEOAPCurrentUploadTableViewCell();
  v7 = [(GEOAPCurrentUploadTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC4Maps31GEOAPCurrentUploadTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps31GEOAPCurrentUploadTableViewCell_cellConfig) = 0;
  id v4 = a3;

  result = (_TtC4Maps31GEOAPCurrentUploadTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end