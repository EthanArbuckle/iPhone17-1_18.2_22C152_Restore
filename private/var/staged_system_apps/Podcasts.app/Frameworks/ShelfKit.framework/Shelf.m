@interface Shelf
- (_TtC8ShelfKit5Shelf)init;
@end

@implementation Shelf

- (_TtC8ShelfKit5Shelf)init
{
  result = (_TtC8ShelfKit5Shelf *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  if (*(void *)&self->contentType[OBJC_IVAR____TtC8ShelfKit5Shelf_shelvesIntent]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_shelvesIntent);
  }
  sub_250FC((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_impressionMetrics, (uint64_t *)&unk_4B9870);
  sub_250FC((uint64_t)self + OBJC_IVAR____TtC8ShelfKit5Shelf_headerArtwork, (uint64_t *)&unk_4B1F70);
}

@end