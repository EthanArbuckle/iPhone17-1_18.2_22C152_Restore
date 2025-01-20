@interface APCacheableSynchronizedObject
+ (BOOL)supportsSecureCoding;
- (APCacheableSynchronizedObject)initWithCoder:(id)a3;
- (APCacheableSynchronizedObject)initWithIdentifier:(id)a3;
- (APUnfairRecursiveLock)lock;
- (void)lockObject;
- (void)unlockObject;
@end

@implementation APCacheableSynchronizedObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APCacheableSynchronizedObject)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)APCacheableSynchronizedObject;
  v3 = [(APCacheableBaseObject *)&v7 initWithCoder:a3];
  if (v3)
  {
    v4 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    lock = v3->_lock;
    v3->_lock = v4;
  }
  return v3;
}

- (APCacheableSynchronizedObject)initWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)APCacheableSynchronizedObject;
  v3 = [(APCacheableBaseObject *)&v7 initWithIdentifier:a3];
  if (v3)
  {
    v4 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    lock = v3->_lock;
    v3->_lock = v4;
  }
  return v3;
}

- (void)lockObject
{
  id v2 = [(APCacheableSynchronizedObject *)self lock];
  [v2 lock];
}

- (void)unlockObject
{
  id v2 = [(APCacheableSynchronizedObject *)self lock];
  [v2 unlock];
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end