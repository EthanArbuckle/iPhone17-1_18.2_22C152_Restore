@interface PXPhotoStyleElement
- (BOOL)hasNonDefaultValues;
- (BOOL)updateWithTone:(double)a3 color:(double)a4 intensity:(double)a5;
- (NSString)cast;
- (NSString)defaultName;
- (NSString)id;
- (PXPhotoStyleElement)init;
- (double)color;
- (double)defaultColor;
- (double)defaultIntensity;
- (double)defaultTone;
- (double)intensity;
- (double)tone;
- (id)copyWithZone:(void *)a3;
- (void)resetToDefaultValues;
@end

@implementation PXPhotoStyleElement

- (NSString)id
{
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  PhotoStyleElement.copy(with:)();
}

- (BOOL)hasNonDefaultValues
{
  v2 = self;
  char v3 = PhotoStyleElement.hasNonDefaultValues.getter();

  return v3 & 1;
}

- (void)resetToDefaultValues
{
  v2 = self;
  PhotoStyleElement.resetToDefaultValues()();
}

- (PXPhotoStyleElement)init
{
  result = (PXPhotoStyleElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AA05B8A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PXPhotoStyleElement_semanticStyle), *(void *)&self->id[OBJC_IVAR___PXPhotoStyleElement_semanticStyle], *(void **)&self->id[OBJC_IVAR___PXPhotoStyleElement_semanticStyle + 8]);
  swift_bridgeObjectRelease();
  char v3 = (char *)self + OBJC_IVAR___PXPhotoStyleElement__contentVersion;
  uint64_t v4 = sub_1AA05EC1C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotoStyleElement_observable);
}

- (NSString)defaultName
{
  v2 = (char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle;
  swift_beginAccess();
  if (*((void *)v2 + 1)) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  char v3 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (double)tone
{
  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle);
  swift_beginAccess();
  if (*((void *)v2 + 1)) {
    return v2[3];
  }
  else {
    return 0.0;
  }
}

- (double)color
{
  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle);
  swift_beginAccess();
  if (*((void *)v2 + 1)) {
    return v2[4];
  }
  else {
    return 0.0;
  }
}

- (double)intensity
{
  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle);
  swift_beginAccess();
  if (*((void *)v2 + 1)) {
    return v2[5];
  }
  else {
    return 1.0;
  }
}

- (NSString)cast
{
  v2 = (char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle;
  swift_beginAccess();
  if (*((void *)v2 + 1)) {
    char v3 = (id *)(v2 + 16);
  }
  else {
    char v3 = (id *)MEMORY[0x1E4F8A558];
  }
  return (NSString *)*v3;
}

- (double)defaultTone
{
  v2 = self;
  double v3 = sub_1AA05E364();

  return v3;
}

- (double)defaultColor
{
  v2 = self;
  double v3 = sub_1AA05E4FC();

  return v3;
}

- (double)defaultIntensity
{
  v2 = self;
  double v3 = sub_1AA05E698();

  return v3;
}

- (BOOL)updateWithTone:(double)a3 color:(double)a4 intensity:(double)a5
{
  v8 = self;
  char v9 = sub_1AA05E7F8(a3, a4, a5);

  return v9 & 1;
}

@end