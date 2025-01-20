@interface MusicCapabilities
+ (MusicCapabilities)sharedCapabilities;
- (BOOL)hasCellularDataCapability;
- (BOOL)hasWAPICapability;
- (BOOL)hasWatchCompanionCapability;
- (BOOL)isInternalInstall;
- (MusicCapabilities)init;
- (NSDictionary)diskUsage;
- (int64_t)deviceType;
@end

@implementation MusicCapabilities

+ (MusicCapabilities)sharedCapabilities
{
  if (sharedCapabilities_sOnceToken != -1) {
    dispatch_once(&sharedCapabilities_sOnceToken, &__block_literal_global);
  }
  v2 = (void *)sharedCapabilities_sSharedCapabilities;

  return (MusicCapabilities *)v2;
}

void __39__MusicCapabilities_sharedCapabilities__block_invoke(id a1)
{
  sharedCapabilities_sSharedCapabilities = objc_alloc_init(MusicCapabilities);

  _objc_release_x1();
}

- (MusicCapabilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicCapabilities;
  v2 = [(MusicCapabilities *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Music.MusicCapabilities.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)hasCellularDataCapability
{
  if (hasCellularDataCapability_sOnceToken != -1) {
    dispatch_once(&hasCellularDataCapability_sOnceToken, &__block_literal_global_7);
  }
  return hasCellularDataCapability_sHasCellularDataCapability;
}

void __46__MusicCapabilities_hasCellularDataCapability__block_invoke(id a1)
{
  hasCellularDataCapability_sHasCellularDataCapability = MGGetBoolAnswer();
}

- (BOOL)hasWAPICapability
{
  if (hasWAPICapability_sOnceToken != -1) {
    dispatch_once(&hasWAPICapability_sOnceToken, &__block_literal_global_12);
  }
  return hasWAPICapability_sHasWAPICapability;
}

void __38__MusicCapabilities_hasWAPICapability__block_invoke(id a1)
{
  hasWAPICapability_sHasWAPICapability = MGGetBoolAnswer();
}

- (BOOL)isInternalInstall
{
  if (isInternalInstall_sOnceToken != -1) {
    dispatch_once(&isInternalInstall_sOnceToken, &__block_literal_global_17);
  }
  return isInternalInstall_sIsInternalInstall;
}

void __38__MusicCapabilities_isInternalInstall__block_invoke(id a1)
{
  isInternalInstall_sIsInternalInstall = MGGetBoolAnswer();
}

- (BOOL)hasWatchCompanionCapability
{
  if (hasWatchCompanionCapability_sOnceToken != -1) {
    dispatch_once(&hasWatchCompanionCapability_sOnceToken, &__block_literal_global_22);
  }
  return hasWatchCompanionCapability_sHasWatchCompanionCapability;
}

void __48__MusicCapabilities_hasWatchCompanionCapability__block_invoke(id a1)
{
  hasWatchCompanionCapability_sHasWatchCompanionCapability = MGGetBoolAnswer();
}

- (int64_t)deviceType
{
  unsigned int v2 = MGGetSInt32Answer() - 1;
  if (v2 > 6) {
    return 0;
  }
  else {
    return qword_12E358[v2];
  }
}

- (NSDictionary)diskUsage
{
  unsigned int v2 = (void *)MGCopyAnswer();

  return (NSDictionary *)v2;
}

- (void).cxx_destruct
{
}

@end