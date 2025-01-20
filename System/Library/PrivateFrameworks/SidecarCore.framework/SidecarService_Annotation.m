@interface SidecarService_Annotation
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Annotation

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
  v2 = @"SidecarServiceNameAnnotation";
  return @"SidecarServiceNameAnnotation";
}

- (id)localizedItemName
{
  return SidecarLocalizedString(@"Annotation", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedDescription
{
  return SidecarLocalizedString(@"Annotate", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.markup";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.annotation";
}

@end