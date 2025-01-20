@interface SidecarService_Camera
+ (id)name;
+ (id)returnTypes;
+ (int64_t)minimumRapportVersion;
- (id)localizedDescription;
- (id)localizedItemName;
- (id)mutableRequestMessage;
- (id)serviceExtension;
- (id)serviceIdentifier;
@end

@implementation SidecarService_Camera

- (id)localizedItemName
{
  return SidecarLocalizedString(@"Image", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedDescription
{
  return SidecarLocalizedString(@"Take Photo", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)serviceExtension
{
  return @"com.apple.sidecar.extension.camera";
}

- (id)serviceIdentifier
{
  return @"com.apple.sidecar.camera";
}

- (id)mutableRequestMessage
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)SidecarService_Camera;
  uint64_t v2 = [(SidecarService *)&v19 mutableRequestMessage];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v5 = [v4 valueForKey:@"ContinuityCameraImageQuality"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 setObject:v5 forKey:@"ContinuityCameraImageQuality"];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 doubleValue];
      if (v6 > 0.0 && v6 <= 1.0)
      {
        v8 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v3 setObject:v8 forKey:@"ContinuityCameraImageQuality"];
      }
    }
  }
  uint64_t v9 = [v4 stringForKey:@"ContinuityCameraImageSize"];
  v10 = [v9 lowercaseString];

  if (v10)
  {
    if ([&unk_26E18EB50 containsObject:v10])
    {
      [v3 setObject:v10 forKey:@"ContinuityCameraImageSize"];
    }
    else
    {
      NSSize v24 = NSSizeFromString(v10);
      CGFloat width = v24.width;
      CGFloat height = v24.height;
      if (!NSEqualSizes(v24, *MEMORY[0x263F08678]))
      {
        v25.CGFloat width = width;
        v25.CGFloat height = height;
        v13 = NSStringFromSize(v25);
        [v3 setObject:v13 forKey:@"ContinuityCameraImageSize"];
      }
    }
  }
  v14 = [v4 stringForKey:@"ContinuityCameraImageType"];
  if (v14)
  {
    v15 = [MEMORY[0x263F1D920] _typeWithIdentifier:v14 allowUndeclared:1];
    if ([v15 conformsToType:*MEMORY[0x263F1DB18]]) {
      [v3 setObject:v14 forKey:@"ContinuityCameraImageType"];
    }
  }
  if ([v3 count])
  {
    v16 = SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
    v17 = v16;
    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v3;
      _os_log_impl(&dword_22D954000, v17, OS_LOG_TYPE_INFO, "defaults: %{public}@", buf, 0xCu);
    }

    SidecarMessageSetDefaults(v2, (const char *)v3);
  }

  return v2;
}

+ (int64_t)minimumRapportVersion
{
  return 1600000;
}

+ (id)returnTypes
{
  if (returnTypes_once_586 != -1) {
    dispatch_once(&returnTypes_once_586, &__block_literal_global_587);
  }
  uint64_t v2 = (void *)returnTypes_types_588;

  return v2;
}

+ (id)name
{
  uint64_t v2 = @"SidecarServiceNameTakePhoto";
  return @"SidecarServiceNameTakePhoto";
}

@end