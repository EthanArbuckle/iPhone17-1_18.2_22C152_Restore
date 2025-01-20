@interface SAMacFilesystemContext
+ (id)filesystemContext;
- (NSArray)targetEntities;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTargetEntities:(id)a3;
@end

@implementation SAMacFilesystemContext

- (id)groupIdentifier
{
  return @"com.apple.ace.mac";
}

- (id)encodedClassName
{
  return @"FilesystemContext";
}

+ (id)filesystemContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)targetEntities
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"targetEntities"];
}

- (void)setTargetEntities:(id)a3
{
}

@end