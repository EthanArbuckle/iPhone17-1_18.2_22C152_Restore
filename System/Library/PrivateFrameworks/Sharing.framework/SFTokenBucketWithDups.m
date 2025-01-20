@interface SFTokenBucketWithDups
- (BOOL)acquireTokenForIdentifier:(unint64_t)a3;
- (SFTokenBucketWithDups)init;
- (SFTokenBucketWithDups)initWithBucket:(id)a3 dupHistoryLength:(unint64_t)a4;
- (void)dealloc;
@end

@implementation SFTokenBucketWithDups

- (SFTokenBucketWithDups)initWithBucket:(id)a3 dupHistoryLength:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFTokenBucketWithDups;
  v8 = [(SFTokenBucketWithDups *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bucket, a3);
    v9->_maxDups = a4;
    v9->_dups = CFArrayCreateMutable(0, 0, 0);
  }

  return v9;
}

- (BOOL)acquireTokenForIdentifier:(unint64_t)a3
{
  dups = self->_dups;
  v8.length = CFArrayGetCount(dups);
  v8.location = 0;
  if (CFArrayContainsValue(dups, v8, (const void *)a3))
  {
LABEL_6:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v6 = [(SFTokenBucket *)self->_bucket acquireToken];
  if (v6)
  {
    if (CFArrayGetCount(self->_dups) == self->_maxDups) {
      CFArrayRemoveValueAtIndex(self->_dups, 0);
    }
    CFArrayAppendValue(self->_dups, (const void *)a3);
    goto LABEL_6;
  }
  return v6;
}

- (SFTokenBucketWithDups)init
{
  v2 = (SFTokenBucketWithDups *)NSUnimplemented_();
  [(SFTokenBucketWithDups *)v2 dealloc];
  return result;
}

- (void)dealloc
{
  dups = self->_dups;
  if (dups)
  {
    CFRelease(dups);
    self->_dups = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFTokenBucketWithDups;
  [(SFTokenBucketWithDups *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end