@interface SFTokenBucket
- (BOOL)acquireToken;
- (SFTokenBucket)init;
- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokenDurationSec:(double)a4;
- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokenDurationTicks:(unint64_t)a4;
- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokensPerSec:(double)a4;
- (void)acquireToken;
@end

@implementation SFTokenBucket

- (SFTokenBucket)init
{
  v2 = (SFTokenBucket *)NSUnimplemented_();
  return [(SFTokenBucket *)v2 initWithBucketSize:v4 tokenDurationTicks:v5];
}

- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokenDurationTicks:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SFTokenBucket;
  v6 = [(SFTokenBucket *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_bucketSize = a3;
    v6->_tokensAvailable = a3;
    v6->_tokenDurationTicks = a4;
    v6->_lastRefreshTicks = mach_absolute_time();
  }
  return v7;
}

- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokenDurationSec:(double)a4
{
  uint64_t v6 = SecondsToUpTicksF();

  return [(SFTokenBucket *)self initWithBucketSize:a3 tokenDurationTicks:v6];
}

- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokensPerSec:(double)a4
{
  return [(SFTokenBucket *)self initWithBucketSize:a3 tokenDurationSec:1.0 / a4];
}

- (BOOL)acquireToken
{
  SEL v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(SFTokenBucket *)(uint64_t)self acquireToken];
  }

  unint64_t tokensAvailable = self->_tokensAvailable;
  if (tokensAvailable) {
    goto LABEL_10;
  }
  uint64_t v5 = mach_absolute_time();
  unint64_t v6 = self->_tokensAvailable;
  if ((v5 - self->_lastRefreshTicks) / self->_tokenDurationTicks >= self->_bucketSize - v6) {
    unint64_t v7 = self->_bucketSize - v6;
  }
  else {
    unint64_t v7 = (v5 - self->_lastRefreshTicks) / self->_tokenDurationTicks;
  }
  v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(SFTokenBucket *)v7 acquireToken];
  }

  self->_tokensAvailable += v7;
  self->_lastRefreshTicks = mach_absolute_time();
  unint64_t tokensAvailable = self->_tokensAvailable;
  if (tokensAvailable)
  {
LABEL_10:
    self->_unint64_t tokensAvailable = tokensAvailable - 1;
    objc_super v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SFTokenBucket acquireToken](v9);
    }
    BOOL v10 = 1;
  }
  else
  {
    objc_super v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "No tokens available.", v12, 2u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)acquireToken
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A5389000, a2, OS_LOG_TYPE_DEBUG, "Number of available tokens: %ld", (uint8_t *)&v3, 0xCu);
}

@end