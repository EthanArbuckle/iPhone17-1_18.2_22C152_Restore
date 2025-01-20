@interface LibraryLinkOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (UICollectionViewCellRegistration)cellRegistration;
- (_TtC4Maps17LibraryItemsCount)libraryItemsCount;
- (_TtC4Maps27LibraryLinkOutlineCellModel)init;
- (id)homeDragAndDropObject;
- (int64_t)hash;
- (void)setLibraryItemsCount:(id)a3;
@end

@implementation LibraryLinkOutlineCellModel

- (_TtC4Maps17LibraryItemsCount)libraryItemsCount
{
  return (_TtC4Maps17LibraryItemsCount *)sub_10011D8BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount);
}

- (void)setLibraryItemsCount:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return [a3 isEqual:self] ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = LibraryLinkOutlineCellModel.isEqual(_:)((uint64_t)v8);

  sub_1001189D4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount);
  swift_beginAccess();
  int64_t result = *v2;
  if (*v2) {
    return (int64_t)[(id)result hash];
  }
  return result;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  uint64_t v2 = qword_1015CBB38;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (UICollectionViewCellRegistration *)(id)qword_101611250;

  return v4;
}

- (id)homeDragAndDropObject
{
  return 0;
}

- (_TtC4Maps27LibraryLinkOutlineCellModel)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LibraryLinkOutlineCellModel *)&v5 init];
}

- (void).cxx_destruct
{
}

@end