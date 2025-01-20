@interface SUUILibraryItemState
- (BOOL)isHighDefinition;
- (BOOL)isPreview;
- (BOOL)isRental;
- (NSNumber)storeAccountIdentifier;
- (NSNumber)storeVersionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)itemStateVariantIdentifier;
- (NSString)storeFlavorIdentifier;
- (NSString)storePlatformKind;
- (SUUILibraryItemState)initWithApplication:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newJavaScriptRepresentation;
- (int64_t)availability;
- (unint64_t)AVTypes;
- (void)setAVTypes:(unint64_t)a3;
- (void)setAvailability:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setHighDefinition:(BOOL)a3;
- (void)setPreview:(BOOL)a3;
- (void)setRental:(BOOL)a3;
- (void)setStoreAccountIdentifier:(id)a3;
- (void)setStoreFlavorIdentifier:(id)a3;
- (void)setStorePlatformKind:(id)a3;
- (void)setStoreVersionIdentifier:(id)a3;
@end

@implementation SUUILibraryItemState

- (SUUILibraryItemState)initWithApplication:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUILibraryItemState;
  v5 = [(SUUILibraryItemState *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_availability = 2;
    uint64_t v7 = [v4 valueForProperty:*MEMORY[0x263F7BC80]];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 valueForProperty:*MEMORY[0x263F7BC88]];
    bundleVersion = v6->_bundleVersion;
    v6->_bundleVersion = (NSString *)v9;

    uint64_t v11 = [v4 valueForProperty:*MEMORY[0x263F7BC98]];
    storeAccountIdentifier = v6->_storeAccountIdentifier;
    v6->_storeAccountIdentifier = (NSNumber *)v11;

    storePlatformKind = v6->_storePlatformKind;
    v6->_storePlatformKind = (NSString *)@"iosSoftware";

    uint64_t v14 = [v4 valueForProperty:*MEMORY[0x263F7BCA8]];
    storeVersionIdentifier = v6->_storeVersionIdentifier;
    v6->_storeVersionIdentifier = (NSNumber *)v14;
  }
  return v6;
}

- (NSString)itemStateVariantIdentifier
{
  if ((self->_avTypes & 5) != 0)
  {
    v2 = @"rent_HD";
    v3 = @"rent";
    if (!self->_rental)
    {
      v2 = @"buy_HD";
      v3 = @"buy";
    }
    if (self->_highDefinition) {
      id v4 = v2;
    }
    else {
      id v4 = v3;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)newJavaScriptRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v3;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKey:@"bundleId"];
  }
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    [v4 setObject:bundleVersion forKey:@"version"];
  }
  if (self->_highDefinition) {
    [v4 setObject:MEMORY[0x263EFFA88] forKey:@"isHD"];
  }
  if (self->_preview) {
    [v4 setObject:MEMORY[0x263EFFA88] forKey:@"preview"];
  }
  if (self->_rental) {
    [v4 setObject:MEMORY[0x263EFFA88] forKey:@"rental"];
  }
  storeAccountIdentifier = self->_storeAccountIdentifier;
  if (storeAccountIdentifier)
  {
    v8 = [(NSNumber *)storeAccountIdentifier stringValue];
    [v4 setObject:v8 forKey:@"ownerDSID"];
  }
  storeFlavorIdentifier = self->_storeFlavorIdentifier;
  if (storeFlavorIdentifier) {
    [v4 setObject:storeFlavorIdentifier forKey:@"flavor"];
  }
  storeVersionIdentifier = self->_storeVersionIdentifier;
  if (storeVersionIdentifier)
  {
    uint64_t v11 = [(NSNumber *)storeVersionIdentifier stringValue];
    [v4 setObject:v11 forKey:@"versionExternalId"];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_availability;
  *(void *)(v5 + 16) = self->_avTypes;
  uint64_t v6 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(unsigned char *)(v5 + 40) = self->_highDefinition;
  *(unsigned char *)(v5 + 41) = self->_preview;
  *(unsigned char *)(v5 + 42) = self->_rental;
  uint64_t v10 = [(NSNumber *)self->_storeAccountIdentifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_storeFlavorIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_storePlatformKind copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSNumber *)self->_storeVersionIdentifier copyWithZone:a3];
  objc_super v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  return (id)v5;
}

- (int64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (unint64_t)AVTypes
{
  return self->_avTypes;
}

- (void)setAVTypes:(unint64_t)a3
{
  self->_avTypes = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (BOOL)isHighDefinition
{
  return self->_highDefinition;
}

- (void)setHighDefinition:(BOOL)a3
{
  self->_highDefinition = a3;
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (void)setPreview:(BOOL)a3
{
  self->_preview = a3;
}

- (BOOL)isRental
{
  return self->_rental;
}

- (void)setRental:(BOOL)a3
{
  self->_rental = a3;
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void)setStoreAccountIdentifier:(id)a3
{
}

- (NSString)storeFlavorIdentifier
{
  return self->_storeFlavorIdentifier;
}

- (void)setStoreFlavorIdentifier:(id)a3
{
}

- (NSString)storePlatformKind
{
  return self->_storePlatformKind;
}

- (void)setStorePlatformKind:(id)a3
{
}

- (NSNumber)storeVersionIdentifier
{
  return self->_storeVersionIdentifier;
}

- (void)setStoreVersionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_storePlatformKind, 0);
  objc_storeStrong((id *)&self->_storeFlavorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end