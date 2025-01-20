@interface SFHUDBannerModel
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForType:(int64_t)a3;
+ (id)onenessUnlockedModel;
+ (id)pairedUnlockModelWithWatchName:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5;
+ (id)pencilModel;
- (BOOL)needsLockButton;
- (BOOL)needsUpdate;
- (NSString)watchName;
- (SFHUDBannerModel)initWithCoder:(id)a3;
- (SFHUDBannerModel)initWithType:(int64_t)a3 priority:(int)a4 watchName:(id)a5 needsLockButton:(BOOL)a6 needsUpdate:(BOOL)a7;
- (int)priority;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFHUDBannerModel

+ (id)pairedUnlockModelWithWatchName:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[SFHUDBannerModel alloc] initWithType:0 priority:2 watchName:v7 needsLockButton:v6 needsUpdate:v5];

  return v8;
}

+ (id)onenessUnlockedModel
{
  v2 = [[SFHUDBannerModel alloc] initWithType:1 priority:1 watchName:0 needsLockButton:0 needsUpdate:0];

  return v2;
}

+ (id)pencilModel
{
  v2 = [[SFHUDBannerModel alloc] initWithType:2 priority:3 watchName:0 needsLockButton:0 needsUpdate:0];

  return v2;
}

- (SFHUDBannerModel)initWithType:(int64_t)a3 priority:(int)a4 watchName:(id)a5 needsLockButton:(BOOL)a6 needsUpdate:(BOOL)a7
{
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFHUDBannerModel;
  v14 = [(SFHUDBannerModel *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_priority = a4;
    objc_storeStrong((id *)&v14->_watchName, a5);
    v15->_needsLockButton = a6;
    v15->_needsUpdate = a7;
  }

  return v15;
}

+ (id)descriptionForType:(int64_t)a3
{
  v3 = @".pairedUnlock";
  if (a3 == 1) {
    v3 = @".onenessUnlocked";
  }
  if (a3 == 2) {
    return @".pencil";
  }
  else {
    return v3;
  }
}

- (SFHUDBannerModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHUDBannerModel;
  BOOL v5 = [(SFHUDBannerModel *)&v10 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_priority = [v4 decodeIntForKey:@"priority"];
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchName"];
    uint64_t v7 = [v6 copy];
    watchName = v5->_watchName;
    v5->_watchName = (NSString *)v7;

    v5->_needsLockButton = [v4 decodeBoolForKey:@"needsLockButton"];
    v5->_needsUpdate = [v4 decodeBoolForKey:@"needsUpdate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInt:self->_priority forKey:@"priority"];
  [v5 encodeObject:self->_watchName forKey:@"watchName"];
  [v5 encodeBool:self->_needsLockButton forKey:@"needsLockButton"];
  [v5 encodeBool:self->_needsUpdate forKey:@"needsUpdate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)watchName
{
  return self->_watchName;
}

- (BOOL)needsLockButton
{
  return self->_needsLockButton;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void).cxx_destruct
{
}

@end