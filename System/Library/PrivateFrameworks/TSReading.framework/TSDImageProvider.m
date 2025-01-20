@interface TSDImageProvider
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)hasFlushableContent;
- (BOOL)isError;
- (BOOL)isValid;
- (CGSize)naturalSize;
- (TSDImageProvider)initWithImageData:(id)a3;
- (TSDImageProvider)retain;
- (id)imageData;
- (int)interest;
- (unint64_t)imageGamut;
- (unint64_t)retainCount;
- (void)addInterest;
- (void)addOwner;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)flushIfInterestLessThan:(int)a3;
- (void)i_commonInit;
- (void)ownerAccess;
- (void)release;
- (void)removeInterest;
- (void)removeOwner;
- (void)setFlushingManager:(id)a3;
@end

@implementation TSDImageProvider

+ (id)allocWithZone:(_NSZone *)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSDImageProvider;
  id result = objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  if (result) {
    atomic_store(1u, (unsigned int *)result + 10);
  }
  return result;
}

- (TSDImageProvider)initWithImageData:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImageProvider initWithImageData:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 47, @"invalid nil value for '%s'", "imageData");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDImageProvider;
  v7 = [(TSDImageProvider *)&v9 init];
  if (v7)
  {
    v7->mImageData = (TSPData *)a3;
    [(TSDImageProvider *)v7 i_commonInit];
  }
  return v7;
}

- (void)i_commonInit
{
  self->mInterestLock._os_unfair_lock_opaque = 0;
  self->mOwnerCount.__a_.__a_value = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageProvider;
  [(TSDImageProvider *)&v3 dealloc];
}

- (id)imageData
{
  return self->mImageData;
}

- (CGSize)naturalSize
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDImageProvider naturalSize]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 79, @"subclasses of TSDImageProvider must implement -naturalSize");
  double v4 = 100.0;
  double v5 = 100.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (unint64_t)imageGamut
{
  return 0;
}

- (BOOL)isValid
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDImageProvider isValid]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 96, @"subclasses of TSDImageProvider must implement -isValid");
  return 1;
}

- (BOOL)isError
{
  return 0;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImageProvider drawImageInContext:rect:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:108 description:@"subclasses of TSDImageProvider must implement -drawImageInContext:rect:"];
}

- (int)interest
{
  return self->mInterest;
}

- (void)addInterest
{
  p_mInterestLock = &self->mInterestLock;
  os_unfair_lock_lock(&self->mInterestLock);
  ++self->mInterest;

  os_unfair_lock_unlock(p_mInterestLock);
}

- (void)removeInterest
{
  p_mInterestLock = &self->mInterestLock;
  os_unfair_lock_lock(&self->mInterestLock);
  --self->mInterest;

  os_unfair_lock_unlock(p_mInterestLock);
}

- (void)flushIfInterestLessThan:(int)a3
{
  p_mInterestLock = &self->mInterestLock;
  os_unfair_lock_lock(&self->mInterestLock);
  if (self->mInterest < a3) {
    [(TSDImageProvider *)self flush];
  }

  os_unfair_lock_unlock(p_mInterestLock);
}

- (void)setFlushingManager:(id)a3
{
  self->mFlushingManager = (TSUFlushingManager *)a3;
}

- (BOOL)hasFlushableContent
{
  return 0;
}

- (void)addOwner
{
}

- (void)removeOwner
{
  p_mOwnerCount = &self->mOwnerCount;
  int v4 = atomic_load((unsigned int *)&self->mOwnerCount);
  if (v4 <= 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImageProvider removeOwner]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 184, @"-removeOwner called too many times");
  }
  if (atomic_fetch_add(&p_mOwnerCount->__a_.__a_value, 0xFFFFFFFF) == 1)
  {
    mFlushingManager = self->mFlushingManager;
    if (mFlushingManager)
    {
      [(TSUFlushingManager *)mFlushingManager removeObject:self];
    }
  }
}

- (void)ownerAccess
{
  signed int v3 = atomic_load((unsigned int *)&self->mRetainCount);
  signed int v4 = atomic_load((unsigned int *)&self->mOwnerCount);
  if (v3 < v4)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImageProvider ownerAccess]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 198, @"Bad retain count");
  }
  v7 = self;
  mFlushingManager = self->mFlushingManager;
  if (mFlushingManager)
  {
    [(TSUFlushingManager *)mFlushingManager removeObject:self];
  }
}

- (TSDImageProvider)retain
{
  return self;
}

- (void)release
{
  unsigned int add = atomic_fetch_add(&self->mRetainCount.__a_.__a_value, 0xFFFFFFFF);
  unsigned int v4 = add - 1;
  if (add == 1)
  {
    [(TSDImageProvider *)self dealloc];
  }
  else
  {
    unsigned int v5 = atomic_load((unsigned int *)&self->mOwnerCount);
    if (v4 == v5 && [(TSDImageProvider *)self hasFlushableContent])
    {
      objc_sync_enter(self);
      unsigned int v6 = atomic_load((unsigned int *)&self->mOwnerCount);
      if (v4 == v6 && [(TSDImageProvider *)self hasFlushableContent]) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C840], "sharedManager"), "addObject:", self);
      }
      objc_sync_exit(self);
    }
  }
}

- (unint64_t)retainCount
{
  return (int)atomic_load((unsigned int *)&self->mRetainCount);
}

@end