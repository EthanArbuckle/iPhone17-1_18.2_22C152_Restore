@interface SidecarService_Scanner
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)makeRequest;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Scanner

+ (int64_t)minimumRapportVersion
{
  return 1600000;
}

+ (id)returnTypes
{
  if (returnTypes_once != -1) {
    dispatch_once(&returnTypes_once, &__block_literal_global);
  }
  v2 = (void *)returnTypes_types;

  return v2;
}

+ (id)name
{
  v2 = @"SidecarServiceNameScanDocument";
  return @"SidecarServiceNameScanDocument";
}

- (id)makeRequest
{
  v3 = [(SidecarService *)self devices];
  v4 = [v3 firstObject];

  if (v4) {
    v5 = [[SidecarRequest_ScanDocument alloc] initWithService:self device:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)localizedItemName
{
  return SidecarLocalizedString(@"Scanned Document", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedDescription
{
  return SidecarLocalizedString(@"Scan Documents", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.camera";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.camera";
}

@end