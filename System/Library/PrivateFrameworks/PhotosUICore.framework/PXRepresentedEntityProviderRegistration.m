@interface PXRepresentedEntityProviderRegistration
+ (void)registerViewAnnotationView:(id)a3;
- (_TtC12PhotosUICore39PXRepresentedEntityProviderRegistration)init;
@end

@implementation PXRepresentedEntityProviderRegistration

+ (void)registerViewAnnotationView:(id)a3
{
  uint64_t v3 = qword_1E9878FF0;
  v4 = (UIView *)a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_1AB22F8DC();
  PXRepresentedEntityProvider.registerAnnotationView(_:)(v4);

  swift_release();
}

- (_TtC12PhotosUICore39PXRepresentedEntityProviderRegistration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXRepresentedEntityProviderRegistration();
  return [(PXRepresentedEntityProviderRegistration *)&v3 init];
}

@end