@interface PXPhotoLibraryDefaultsChangeObserverExtended
- (_TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended)init;
- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4;
@end

@implementation PXPhotoLibraryDefaultsChangeObserverExtended

- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4
{
  uint64_t v6 = sub_1AB23A76C();
  uint64_t v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended_block);
  id v10 = a3;
  v11 = self;
  v9(v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended)init
{
  result = (_TtC12PhotosUICoreP33_25E89F8648EB33DB900A566ECE80EAE544PXPhotoLibraryDefaultsChangeObserverExtended *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end