@interface SidecarService_Display
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Display

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
  v2 = @"SidecarServiceNameDisplay";
  return @"SidecarServiceNameDisplay";
}

- (id)localizedItemName
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Display" value:&stru_26E18A930 table:0];

  return v3;
}

- (id)localizedDescription
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Display" value:&stru_26E18A930 table:0];

  return v3;
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.display";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.display";
}

@end