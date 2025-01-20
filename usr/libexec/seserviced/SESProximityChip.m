@interface SESProximityChip
+ (id)sharedObject;
+ (void)cacheProximityChipData:(id)a3 completion:(id)a4;
- (BOOL)done;
- (BOOL)isProduction;
- (BOOL)isSupported;
- (SESProximityChip)init;
- (int64_t)getType;
- (void)cacheProximityChipData:(id)a3 completion:(id)a4;
@end

@implementation SESProximityChip

+ (id)sharedObject
{
  if (qword_10045CC90 != -1) {
    dispatch_once(&qword_10045CC90, &stru_10040C3E0);
  }
  v2 = (void *)qword_10045CC88;

  return v2;
}

- (SESProximityChip)init
{
  v6.receiver = self;
  v6.super_class = (Class)SESProximityChip;
  v2 = [(SESProximityChip *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    chipInformation = v2->_chipInformation;
    v2->_chipInformation = 0;

    v3->_chipType = 0;
    v3->_isSupported = 1;
  }
  return v3;
}

+ (void)cacheProximityChipData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SESProximityChip sharedObject];
  [v7 cacheProximityChipData:v6 completion:v5];
}

- (void)cacheProximityChipData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_cacheLock);
  if (![(SESProximityChip *)self done])
  {
    CFDictionaryRef v8 = IOServiceNameMatching("rose");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v8);
    self->_isSupported = MatchingService != 0;
    IOObjectRelease(MatchingService);
    if (self->_isSupported) {
      self->_chipType = PRGetChipType();
    }
  }
  if (SESInternalVariant() && self->_isSupported)
  {
    v10 = SESDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Retrieving proximity chip information", buf, 2u);
    }

    v12 = v6;
    id v13 = v7;
    PRGetChipInfoAsync();

    v11 = v12;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A960;
    block[3] = &unk_10040C0B8;
    block[4] = self;
    v16 = v7;
    dispatch_async(v6, block);
    v11 = v16;
  }

  os_unfair_lock_unlock(&self->_cacheLock);
}

- (BOOL)isSupported
{
  v2 = self;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  LOBYTE(v2) = v2->_isSupported;
  os_unfair_lock_unlock(p_cacheLock);
  return (char)v2;
}

- (BOOL)isProduction
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  chipInformation = self->_chipInformation;
  if (chipInformation) {
    BOOL v5 = [(PRChipInfo *)chipInformation prodMode] != 0;
  }
  else {
    BOOL v5 = 1;
  }
  os_unfair_lock_unlock(p_cacheLock);
  return v5;
}

- (int64_t)getType
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  int64_t chipType = self->_chipType;
  os_unfair_lock_unlock(p_cacheLock);
  return chipType;
}

- (BOOL)done
{
  if (SESInternalVariant())
  {
    if (self->_isSupported)
    {
      if (!self->_chipInformation) {
        return 0;
      }
      return self->_chipType != 0;
    }
  }
  else if (self->_isSupported)
  {
    return self->_chipType != 0;
  }
  return 1;
}

- (void).cxx_destruct
{
}

@end