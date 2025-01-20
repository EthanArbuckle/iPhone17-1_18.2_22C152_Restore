@interface ConcretePhotoLibraryObservation
- (_TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation)init;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
@end

@implementation ConcretePhotoLibraryObservation

- (id)prepareForPhotoLibraryChange:(id)a3
{
  v3 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation_prepareBlock);
  if (v3 && (id v5 = a3, v6 = self, v7 = v3(v5), v5, v6, v7))
  {
    v8 = (void *)sub_1AB23A4CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_1AB23A4DC();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = sub_1AB23AD0C();
  MEMORY[0x1F4188790](v7, v8);
  v11[2] = self;
  v11[3] = a3;
  v11[4] = v6;
  id v9 = a3;
  v10 = self;
  sub_1A9B19E98((uint64_t)sub_1A9F842D8, (uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (_TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation)init
{
  result = (_TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation_observer);
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation_prepareBlock));
  swift_release();
}

@end