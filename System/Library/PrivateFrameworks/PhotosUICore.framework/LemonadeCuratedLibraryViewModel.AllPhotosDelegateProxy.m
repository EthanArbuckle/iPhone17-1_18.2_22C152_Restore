@interface LemonadeCuratedLibraryViewModel.AllPhotosDelegateProxy
- (BOOL)curatedLibraryViewControllerExpand:(id)a3 animated:(BOOL)a4;
- (BOOL)photosViewControllerDismiss:(void *)a1;
- (_TtCC12PhotosUICore31LemonadeCuratedLibraryViewModelP33_11848A52FD5D3BAEA42050E5375D858922AllPhotosDelegateProxy)init;
@end

@implementation LemonadeCuratedLibraryViewModel.AllPhotosDelegateProxy

- (BOOL)photosViewControllerDismiss:(void *)a1
{
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v3 = Strong;
  if (Strong)
  {
    v4 = *(void (**)(void, void))(*(void *)Strong + 1952);
    swift_unknownObjectRetain();
    id v5 = a1;
    v4(0, 0);
    swift_unknownObjectRelease();

    swift_release();
  }
  return v3 != 0;
}

- (BOOL)curatedLibraryViewControllerExpand:(id)a3 animated:(BOOL)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  BOOL v7 = sub_1AA688868(a4);
  swift_unknownObjectRelease();

  return v7;
}

- (_TtCC12PhotosUICore31LemonadeCuratedLibraryViewModelP33_11848A52FD5D3BAEA42050E5375D858922AllPhotosDelegateProxy)init
{
  result = (_TtCC12PhotosUICore31LemonadeCuratedLibraryViewModelP33_11848A52FD5D3BAEA42050E5375D858922AllPhotosDelegateProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end