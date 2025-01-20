@interface ImageResourceLoader
- (void)imageResourceDidChangeImage:(id)a3;
@end

@implementation ImageResourceLoader

- (void)imageResourceDidChangeImage:(id)a3
{
  uint64_t v5 = sub_4A98(&qword_2EA2E0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  swift_retain();
  id v8 = [a3 image];
  uint64_t v9 = sub_26D6F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  sub_26D6D0();
  swift_unknownObjectRetain();
  swift_retain();
  id v10 = v8;
  uint64_t v11 = sub_26D6C0();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = a3;
  v12[5] = self;
  v12[6] = v8;
  sub_19E514((uint64_t)v7, (uint64_t)&unk_2ED660, (uint64_t)v12);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

@end