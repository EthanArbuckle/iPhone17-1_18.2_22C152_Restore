@interface BKFrontmostAssetTracker
- (BKFrontmostAssetTracker)init;
- (BKFrontmostAssetTracker)initWithAssetID:(id)a3 window:(id)a4 onFrontmostChanged:(id)a5;
- (BOOL)isFrontmost;
- (UIWindow)window;
- (id)onFrontmostChanged;
- (void)dealloc;
- (void)setOnFrontmostChanged:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation BKFrontmostAssetTracker

- (BOOL)isFrontmost
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_state) & *((unsigned char *)&self->super.isa
                                                                                    + OBJC_IVAR___BKFrontmostAssetTracker_state
                                                                                    + 1) & 1;
}

- (id)onFrontmostChanged
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000510C0;
    aBlock[3] = &unk_100A4F550;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setOnFrontmostChanged:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100242E80;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (BKFrontmostAssetTracker)initWithAssetID:(id)a3 window:(id)a4 onFrontmostChanged:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1007FDC70();
  unint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v6;
    v6 = sub_100242DB4;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a4;
  return (BKFrontmostAssetTracker *)FrontmostAssetTracker.init(assetID:window:onFrontmostChanged:)(v7, v9, a4, (uint64_t)v6, v10);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_frontmostTracker);
  uint64_t v5 = self;
  if (v4)
  {
    id v6 = v4;
    sub_1007FA350();
  }
  v7.receiver = self;
  v7.super_class = ObjectType;
  [(BKFrontmostAssetTracker *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged);

  sub_10003E138(v3);
}

- (UIWindow)window
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_frontmostTracker);
  if (v2)
  {
    uint64_t v3 = self;
    id v4 = v2;
    v2 = (void *)sub_1007FA370();
  }

  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5 = a3;
  id v6 = self;
  FrontmostAssetTracker.window.setter(a3);
}

- (BKFrontmostAssetTracker)init
{
  result = (BKFrontmostAssetTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end