@interface SBIconContinuityItem
+ (SBIconContinuityItem)itemWithBadgeType:(int64_t)a3 deviceTypeIdentifier:(id)a4;
+ (id)_resolvedItemForExplicitBadgeType:(int64_t)a3 deviceTypeIdentifier:(id)a4;
+ (id)itemForBadgeTypeString:(id)a3 deviceTypeIdentifier:(id)a4;
+ (id)itemForContinuityInfo:(id)a3;
+ (int64_t)_continuityBadgeTypeForNSString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)systemImageName;
- (SBIconContinuityItem)init;
- (SBIconContinuityItem)initWithBadgeType:(int64_t)a3 systemImageName:(id)a4;
- (id)description;
- (int64_t)badgeType;
- (unint64_t)hash;
@end

@implementation SBIconContinuityItem

+ (id)itemForContinuityInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isLocationBasedSuggestion])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isBluetoothAudioPrediction])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isBluetoothPrediction])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isHeadphonesPrediction])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isFirstWakePrediction])
    {
      uint64_t v6 = 6;
    }
    else
    {
      uint64_t v6 = 0;
    }
    v8 = [v5 originatingDeviceType];
    v7 = [a1 _resolvedItemForExplicitBadgeType:v6 deviceTypeIdentifier:v8];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (SBIconContinuityItem)itemWithBadgeType:(int64_t)a3 deviceTypeIdentifier:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 == 1 && !v6) {
    NSLog(&cfstr_Sbiconcontinui.isa);
  }
  v8 = [a1 _resolvedItemForExplicitBadgeType:a3 deviceTypeIdentifier:v7];

  return (SBIconContinuityItem *)v8;
}

- (SBIconContinuityItem)initWithBadgeType:(int64_t)a3 systemImageName:(id)a4
{
  id v8 = a4;
  if (!a3)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"badgeType != SBIconContinuityBadgeTypeNone"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBIconContinuityItem initWithBadgeType:systemImageName:](a2, (uint64_t)self, (uint64_t)v13);
    }
LABEL_11:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D7FB7A38);
  }
  v9 = v8;
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemImageName != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBIconContinuityItem initWithBadgeType:systemImageName:](a2, (uint64_t)self, (uint64_t)v13);
    }
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)SBIconContinuityItem;
  v10 = [(SBIconContinuityItem *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_badgeType = a3;
    objc_storeStrong((id *)&v10->_systemImageName, a4);
  }

  return v11;
}

- (SBIconContinuityItem)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed for SBIconContinuityItem"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    objc_super v14 = self;
    __int16 v15 = 2114;
    v16 = @"SBIconContinuityItem.m";
    __int16 v17 = 1024;
    int v18 = 74;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (SBIconContinuityItem *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)itemForBadgeTypeString:(id)a3 deviceTypeIdentifier:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "itemWithBadgeType:deviceTypeIdentifier:", objc_msgSend(a1, "_continuityBadgeTypeForNSString:", a3), v6);

  return v7;
}

+ (id)_resolvedItemForExplicitBadgeType:(int64_t)a3 deviceTypeIdentifier:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v13 = 0;
    v7 = [MEMORY[0x1E4F6F260] symbolForTypeIdentifier:v6 withResolutionStrategy:1 variantOptions:1 error:&v13];
    id v8 = v13;
    if (v7)
    {
      int v9 = [v7 name];
      goto LABEL_6;
    }
    if ([v6 isEqualToString:@"com.apple.mac"])
    {
      int v9 = @"display";
LABEL_6:

      a3 = 1;
LABEL_7:
      uint64_t v10 = [objc_alloc((Class)a1) initWithBadgeType:a3 systemImageName:v9];

      int v9 = (__CFString *)v10;
      goto LABEL_8;
    }
    v12 = SBLogContinuity();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SBIconContinuityItem _resolvedItemForExplicitBadgeType:deviceTypeIdentifier:]((uint64_t)v6, v12);
    }
  }
  int v9 = 0;
  switch(a3)
  {
    case 0:
    case 1:
      break;
    case 2:
      int v9 = @"headphones";
      goto LABEL_7;
    case 3:
      int v9 = @"bluetooth";
      goto LABEL_7;
    case 4:
      int v9 = @"airpods";
      goto LABEL_7;
    case 5:
      int v9 = @"location.fill";
      goto LABEL_7;
    case 6:
      int v9 = @"alarm";
      goto LABEL_7;
    default:
      goto LABEL_7;
  }
LABEL_8:

  return v9;
}

+ (int64_t)_continuityBadgeTypeForNSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeNone"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeDevice"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeAUX"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeBluetooth"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeHeadphones"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeLocation"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"SBIconContinuityBadgeTypeWake"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (SBIconContinuityItem *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      int64_t v8 = [(SBIconContinuityItem *)self badgeType];
      if (v8 == [(SBIconContinuityItem *)v7 badgeType])
      {
        int v9 = [(SBIconContinuityItem *)self systemImageName];
        uint64_t v10 = [(SBIconContinuityItem *)v7 systemImageName];
        char v11 = BSEqualObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v3 = [(SBIconContinuityItem *)self badgeType];
  int64_t v4 = [(SBIconContinuityItem *)self systemImageName];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(SBIconContinuityItem *)self badgeType] - 1;
  if (v5 > 5) {
    id v6 = @"none";
  }
  else {
    id v6 = off_1E6AAE248[v5];
  }
  v7 = [(SBIconContinuityItem *)self systemImageName];
  int64_t v8 = [v3 stringWithFormat:@"<%@: %p; badgeType: %@, systemImageName: %@>", v4, self, v6, v7];

  return v8;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
}

- (void)initWithBadgeType:(uint64_t)a3 systemImageName:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_1();
  int v9 = @"SBIconContinuityItem.m";
  __int16 v10 = 1024;
  int v11 = 63;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithBadgeType:(uint64_t)a3 systemImageName:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_1();
  int v9 = @"SBIconContinuityItem.m";
  __int16 v10 = 1024;
  int v11 = 64;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)_resolvedItemForExplicitBadgeType:(uint64_t)a1 deviceTypeIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Failed to find symbol for device type identifier: '%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end