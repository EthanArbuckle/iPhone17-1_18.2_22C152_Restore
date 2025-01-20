@interface SUSpacePurgeOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)enableAppOffload;
- (BOOL)enableCacheDelete;
- (OS_dispatch_queue)completionQueue;
- (SUSpacePurgeOptions)init;
- (SUSpacePurgeOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)cacheDeleteUrgency;
- (int64_t)appOffloadUrgency;
- (unint64_t)neededBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setAppOffloadUrgency:(int64_t)a3;
- (void)setCacheDeleteUrgency:(int)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setEnableAppOffload:(BOOL)a3;
- (void)setEnableCacheDelete:(BOOL)a3;
- (void)setNeededBytes:(unint64_t)a3;
@end

@implementation SUSpacePurgeOptions

- (SUSpacePurgeOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUSpacePurgeOptions;
  v2 = [(SUSpacePurgeOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = 0;

    v3->_neededBytes = 0;
    *(_WORD *)&v3->_enableCacheDelete = 1;
    v3->_cacheDeleteUrgency = -1;
    v3->_appOffloadUrgency = 1;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUSpacePurgeOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUSpacePurgeOptions;
  v5 = [(SUSpacePurgeOptions *)&v7 init];
  if (v5)
  {
    -[SUSpacePurgeOptions setNeededBytes:](v5, "setNeededBytes:", [v4 decodeInt64ForKey:@"neededBytes"]);
    -[SUSpacePurgeOptions setEnableCacheDelete:](v5, "setEnableCacheDelete:", [v4 decodeBoolForKey:@"enableCachDelete"]);
    -[SUSpacePurgeOptions setEnableAppOffload:](v5, "setEnableAppOffload:", [v4 decodeBoolForKey:@"enableAppOffload"]);
    -[SUSpacePurgeOptions setCacheDeleteUrgency:](v5, "setCacheDeleteUrgency:", [v4 decodeIntForKey:@"cacheDeleteUrgency"]);
    -[SUSpacePurgeOptions setAppOffloadUrgency:](v5, "setAppOffloadUrgency:", [v4 decodeIntegerForKey:@"appOffloadUrgency"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t neededBytes = self->_neededBytes;
  id v5 = a3;
  [v5 encodeInt64:neededBytes forKey:@"neededBytes"];
  [v5 encodeBool:self->_enableCacheDelete forKey:@"enableCachDelete"];
  [v5 encodeBool:self->_enableAppOffload forKey:@"enableAppOffload"];
  [v5 encodeInt:self->_cacheDeleteUrgency forKey:@"cacheDeleteUrgency"];
  [v5 encodeInteger:self->_appOffloadUrgency forKey:@"appOffloadUrgency"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setCompletionQueue:self->_completionQueue];
  [v4 setNeededBytes:self->_neededBytes];
  [v4 setEnableCacheDelete:self->_enableCacheDelete];
  [v4 setEnableAppOffload:self->_enableAppOffload];
  [v4 setCacheDeleteUrgency:self->_cacheDeleteUrgency];
  [v4 setAppOffloadUrgency:self->_appOffloadUrgency];
  return v4;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (unint64_t)neededBytes
{
  return self->_neededBytes;
}

- (void)setNeededBytes:(unint64_t)a3
{
  self->_unint64_t neededBytes = a3;
}

- (BOOL)enableCacheDelete
{
  return self->_enableCacheDelete;
}

- (void)setEnableCacheDelete:(BOOL)a3
{
  self->_enableCacheDelete = a3;
}

- (BOOL)enableAppOffload
{
  return self->_enableAppOffload;
}

- (void)setEnableAppOffload:(BOOL)a3
{
  self->_enableAppOffload = a3;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (int64_t)appOffloadUrgency
{
  return self->_appOffloadUrgency;
}

- (void)setAppOffloadUrgency:(int64_t)a3
{
  self->_appOffloadUrgency = a3;
}

- (void).cxx_destruct
{
}

@end