@interface NSXPCConnection
- (NSSet)conversationServiceEntitlements;
@end

@implementation NSXPCConnection

- (NSSet)conversationServiceEntitlements
{
  v3 = +[NSSet set];
  v4 = [(NSXPCConnection *)self valueForEntitlement:@"com.apple.FaceTime.FTConversationService"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = +[NSSet setWithArray:v4];

    v3 = (void *)v5;
  }

  return (NSSet *)v3;
}

@end