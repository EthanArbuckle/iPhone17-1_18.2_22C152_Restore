@interface PHAPhotoStyle
- (BOOL)updateStyleStreamWithProgressReporter:(id)a3 error:(id *)a4;
- (PHAPhotoStyle)init;
- (PHAPhotoStyle)initWithphotoLibrary:(id)a3;
@end

@implementation PHAPhotoStyle

- (PHAPhotoStyle)initWithphotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = (PHAPhotoStyle *)sub_1D222159C(v3);

  return v4;
}

- (BOOL)updateStyleStreamWithProgressReporter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1D221F54C(v5);

  return 1;
}

- (PHAPhotoStyle)init
{
  result = (PHAPhotoStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___PHAPhotoStyle_logger;
  uint64_t v4 = sub_1D2425030();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end