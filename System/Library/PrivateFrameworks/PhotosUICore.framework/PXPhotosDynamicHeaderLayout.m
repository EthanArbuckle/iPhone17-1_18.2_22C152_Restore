@interface PXPhotosDynamicHeaderLayout
+ (double)headerMinimumHeightForReferenceSize:(CGSize)a3;
- (BOOL)canHandleVisibleRectRejection;
- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSIndexSet)axSpriteIndexes;
- (PXPhotosDynamicHeaderLayout)init;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)contentSizeDidChange;
- (void)didUpdate;
- (void)entityManagerDidChange;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXPhotosDynamicHeaderLayout

+ (double)headerMinimumHeightForReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  sub_1AA32EAA4();
  PhotosDynamicHeaderSpec.headerHeight(for:)(width, height);
  return result;
}

- (BOOL)canHandleVisibleRectRejection
{
  return 1;
}

- (void)willUpdate
{
}

- (void)update
{
}

- (void)didUpdate
{
}

- (void)visibleRectDidChange
{
}

- (void)safeAreaInsetsDidChange
{
}

- (void)referenceSizeDidChange
{
}

- (void)entityManagerDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for PhotosDynamicHeaderLayout();
  v2.receiver;
  [(PXGLayout *)&v2 entityManagerDidChange];
  swift_beginAccess();
  sub_1AA193C58();
  PXGLayout.invalidate<A>(updateFlags:with:)();
}

- (void)contentSizeDidChange
{
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  Class result = (Class)sub_1AA19542C(a3);
  if (result)
  {
    return (Class)swift_getObjCClassFromMetadata();
  }
  return result;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_1AA195510(a3);

  return v8;
}

- (NSIndexSet)axSpriteIndexes
{
  uint64_t v2 = sub_1AB230A8C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  id v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = MEMORY[0x1E4FBC860];
  sub_1AA1960B8(&qword_1E981B960, MEMORY[0x1E4F27D00]);
  uint64_t v7 = MEMORY[0x1E4FBB550];
  sub_1AA196974(0, (unint64_t *)&unk_1E981C560, MEMORY[0x1E4FBB550], MEMORY[0x1E4FBB320]);
  sub_1AA1957C4((unint64_t *)&qword_1E981C570, (unint64_t *)&unk_1E981C560, v7);
  sub_1AB23BD8C();
  v8 = (void *)sub_1AB2309CC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (NSIndexSet *)v8;
}

- (PXPhotosDynamicHeaderLayout)init
{
  Class result = (PXPhotosDynamicHeaderLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  CGFloat width = a4.width;
  [(PXGLayout *)self contentSize];
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

@end