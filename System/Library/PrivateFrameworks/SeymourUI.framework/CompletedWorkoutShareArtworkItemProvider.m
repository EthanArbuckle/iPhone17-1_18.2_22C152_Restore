@interface CompletedWorkoutShareArtworkItemProvider
- (_TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider)init;
- (_TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider)initWithItem:(id)a3 typeIdentifier:(id)a4;
- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation CompletedWorkoutShareArtworkItemProvider

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = self;
  id v8 = sub_23A3BC5F4((uint64_t)sub_23A1729D8, v6);

  swift_release();

  return v8;
}

- (_TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider)init
{
  result = (_TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider)initWithItem:(id)a3 typeIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider_assetClient);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI40CompletedWorkoutShareArtworkItemProvider_artwork;
  uint64_t v4 = sub_23A7FB1B8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end