@interface SidecarService_Signature
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Signature

+ (int64_t)minimumRapportVersion
{
  return 1820000;
}

+ (id)returnTypes
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)name
{
  v2 = @"SidecarServiceNameSignature";
  return @"SidecarServiceNameSignature";
}

- (id)localizedItemName
{
  return SidecarLocalizedString(@"Signature", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedDescription
{
  return SidecarLocalizedString(@"Signature", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.signature";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.signature";
}

@end