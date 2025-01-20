@interface SASVSystemDialogActOutput
+ (id)systemDialogActOutput;
- (NSArray)dialogActs;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDialogActs:(id)a3;
@end

@implementation SASVSystemDialogActOutput

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"SystemDialogActOutput";
}

+ (id)systemDialogActOutput
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)dialogActs
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"dialogActs", v3);
}

- (void)setDialogActs:(id)a3
{
}

@end