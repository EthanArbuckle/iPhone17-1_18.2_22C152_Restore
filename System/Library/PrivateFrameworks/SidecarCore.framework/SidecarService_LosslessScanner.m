@interface SidecarService_LosslessScanner
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)makeRequest;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_LosslessScanner

+ (int64_t)minimumRapportVersion
{
  return 5000000;
}

+ (id)returnTypes
{
  if (returnTypes_once_318 != -1) {
    dispatch_once(&returnTypes_once_318, &__block_literal_global_319);
  }
  v2 = (void *)returnTypes_types_320;

  return v2;
}

+ (id)name
{
  v2 = @"SidecarServiceNameScanLosslessDocument";
  return @"SidecarServiceNameScanLosslessDocument";
}

- (id)makeRequest
{
  v3 = [(SidecarService *)self devices];
  v4 = [v3 firstObject];

  if (v4) {
    v5 = [[SidecarRequest_ScanLosslessDocument alloc] initWithService:self device:v4];
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