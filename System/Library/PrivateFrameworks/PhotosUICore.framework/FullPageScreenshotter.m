@interface FullPageScreenshotter
- (_TtC12PhotosUICore21FullPageScreenshotter)init;
- (void)screenshotService:(UIScreenshotService *)a3 generatePDFRepresentationWithCompletion:(id)a4;
@end

@implementation FullPageScreenshotter

- (void)screenshotService:(UIScreenshotService *)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  sub_1A9B96BBC(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - v9;
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E982D8B0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E982D8C0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1A9FD8BA0((uint64_t)v10, (uint64_t)&unk_1E982D8D0, (uint64_t)v15);
  swift_release();
}

- (_TtC12PhotosUICore21FullPageScreenshotter)init
{
  result = (_TtC12PhotosUICore21FullPageScreenshotter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end