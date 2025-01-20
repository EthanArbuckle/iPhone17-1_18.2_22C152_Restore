@interface SAMPLoadQPCompleted
+ (id)loadQPCompleted;
- (BOOL)requiresResponse;
- (SAMPCollection)loadedItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLoadedItems:(id)a3;
@end

@implementation SAMPLoadQPCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"LoadQPCompleted";
}

+ (id)loadQPCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMPCollection)loadedItems
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, @"loadedItems");
}

- (void)setLoadedItems:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end