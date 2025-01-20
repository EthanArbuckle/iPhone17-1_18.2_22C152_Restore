@interface PKBarcodePassBoopProvider
- (PKBarcodePassBoopProvider)init;
- (UIActivityItemsConfiguration)cachedConfiguration;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (void)setCachedConfiguration:(id)a3;
- (void)setPass:(id)a3 passView:(id)a4;
@end

@implementation PKBarcodePassBoopProvider

- (UIActivityItemsConfiguration)cachedConfiguration
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
  swift_beginAccess();
  return (UIActivityItemsConfiguration *)*v2;
}

- (void)setCachedConfiguration:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)setPass:(id)a3 passView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19FCDA678(v6, a4);
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
  swift_beginAccess();
  return (UIActivityItemsConfigurationReading *)*v2;
}

- (PKBarcodePassBoopProvider)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_pass) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BarcodePassBoopProvider();
  return [(PKBarcodePassBoopProvider *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
}

@end