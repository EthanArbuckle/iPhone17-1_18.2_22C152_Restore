@interface VUWGalleryPersonalizationOptions
+ (BOOL)supportsSecureCoding;
- (NSArray)boundingBox;
- (NSNumber)keyObservation;
- (NSNumber)seed;
- (NSString)adapterIdentifier;
- (VUWGalleryPersonalizationOptions)init;
- (VUWGalleryPersonalizationOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdapterIdentifier:(id)a3;
- (void)setBoundingBox:(id)a3;
- (void)setKeyObservation:(id)a3;
- (void)setSeed:(id)a3;
@end

@implementation VUWGalleryPersonalizationOptions

- (NSNumber)seed
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___VUWGalleryPersonalizationOptions_seed));
}

- (void)setSeed:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_seed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_seed) = (Class)a3;
  id v3 = a3;
}

- (NSArray)boundingBox
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_boundingBox))
  {
    sub_261071924(0, (unint64_t *)&qword_26B40AC30);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_26111ED78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)setBoundingBox:(id)a3
{
  if (a3)
  {
    sub_261071924(0, (unint64_t *)&qword_26B40AC30);
    id v4 = (objc_class *)sub_26111ED88();
  }
  else
  {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_boundingBox) = v4;

  swift_bridgeObjectRelease();
}

- (NSString)adapterIdentifier
{
  if (*(void *)&self->seed[OBJC_IVAR___VUWGalleryPersonalizationOptions_adapterIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_26111EBC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAdapterIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_26111EBF8();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___VUWGalleryPersonalizationOptions_adapterIdentifier);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSNumber)keyObservation
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___VUWGalleryPersonalizationOptions_keyObservation));
}

- (void)setKeyObservation:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_keyObservation);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_keyObservation) = (Class)a3;
  id v3 = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VUWGalleryPersonalizationOptions)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_seed) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_boundingBox) = 0;
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_adapterIdentifier);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_keyObservation) = 0;
  v4.receiver = self;
  v4.super_class = (Class)VUWGalleryPersonalizationOptions;
  return [(VUWGalleryPersonalizationOptions *)&v4 init];
}

- (VUWGalleryPersonalizationOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  objc_super v4 = (VUWGalleryPersonalizationOptions *)sub_26110F04C();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  VUWGalleryPersonalizationOptions.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUWGalleryPersonalizationOptions_keyObservation);
}

@end