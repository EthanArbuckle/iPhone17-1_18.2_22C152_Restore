@interface SidecarService_Capture
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Capture

+ (int64_t)minimumRapportVersion
{
  return 4000000;
}

+ (id)returnTypes
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)name
{
  v2 = @"SidecarServiceNameCapture";
  return @"SidecarServiceNameCapture";
}

- (id)localizedItemName
{
  return SidecarLocalizedString(@"Capture", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedDescription
{
  return SidecarLocalizedString(@"Capture", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.capture";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.capture";
}

@end