@interface BAContentSettingsData
- (BAContentSettingsData)init;
- (BAContentSettingsData)initWithBookmarkCount:(id)a3 noteCount:(id)a4 highlightCount:(id)a5;
@end

@implementation BAContentSettingsData

- (BAContentSettingsData)initWithBookmarkCount:(id)a3 noteCount:(id)a4 highlightCount:(id)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_bookmarkCount) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_noteCount) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_highlightCount) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for BridgedContentSettingsData();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  return [(BAContentSettingsData *)&v12 init];
}

- (BAContentSettingsData)init
{
  result = (BAContentSettingsData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_highlightCount);
}

@end