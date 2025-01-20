@interface SidecarService_Sketch
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Sketch

+ (int64_t)minimumRapportVersion
{
  return 1820000;
}

+ (id)returnTypes
{
  if (returnTypes_once_1013 != -1) {
    dispatch_once(&returnTypes_once_1013, &__block_literal_global_1014);
  }
  v2 = (void *)returnTypes_types_1015;

  return v2;
}

+ (id)name
{
  v2 = @"SidecarServiceNameSketch";
  return @"SidecarServiceNameSketch";
}

- (id)localizedItemName
{
  return SidecarLocalizedString(@"Sketch", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedDescription
{
  return SidecarLocalizedString(@"Add Sketch", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.sketch";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.sketch";
}

@end