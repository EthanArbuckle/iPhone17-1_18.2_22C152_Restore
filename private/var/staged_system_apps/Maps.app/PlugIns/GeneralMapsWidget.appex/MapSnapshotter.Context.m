@interface MapSnapshotter.Context
- (BOOL)isEqual:(id)a3;
- (_TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context)init;
- (int64_t)hash;
@end

@implementation MapSnapshotter.Context

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_100083A20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_100032DBC((uint64_t)v8);

  sub_100019138((uint64_t)v8, &qword_1000A7F40);
  return v6;
}

- (int64_t)hash
{
  sub_100083C60();
  sub_100082E70();
  sub_1000370BC(&qword_1000A8CF8, (void (*)(uint64_t))&type metadata accessor for UUID);
  v3 = self;
  sub_100083820();
  sub_100083730();
  sub_1000370BC(&qword_1000A8D00, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100083820();
  Swift::Int v4 = sub_100083C40();

  return v4;
}

- (_TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context)init
{
  result = (_TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context_identifier;
  uint64_t v4 = sub_100082E70();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context_family;
  uint64_t v6 = sub_100083730();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end