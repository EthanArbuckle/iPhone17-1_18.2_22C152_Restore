@interface TSWPStorageBroadcasterAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)broadcastStorage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6;
@end

@implementation TSWPStorageBroadcasterAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPStorageBroadcaster";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)broadcastStorage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  char v16 = 0;
  v12 = objc_opt_class();
  Class v13 = __TSAccessibilityCastAsSafeCategory(v12, (uint64_t)a3, 1, &v16);
  if (v16) {
    abort();
  }
  Class v14 = v13;
  [(objc_class *)v13 tsaxEnumerateAttachmentsUsingBlock:&stru_46BF90];
  [(objc_class *)v14 tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:&stru_46BFD0];
  v15.receiver = self;
  v15.super_class = (Class)TSWPStorageBroadcasterAccessibility;
  -[TSWPStorageBroadcasterAccessibility broadcastStorage:didChangeRange:delta:broadcastKind:](&v15, "broadcastStorage:didChangeRange:delta:broadcastKind:", a3, location, length, a5, v6);
}

@end