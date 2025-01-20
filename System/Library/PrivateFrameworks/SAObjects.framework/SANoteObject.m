@interface SANoteObject
+ (id)object;
- (BOOL)restricted;
- (NSDate)createdDate;
- (NSDate)lastModifiedDate;
- (NSString)contents;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContents:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SANoteObject

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contents
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contents"];
}

- (void)setContents:(id)a3
{
}

- (NSDate)createdDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"createdDate"];
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"lastModifiedDate"];
}

- (void)setLastModifiedDate:(id)a3
{
}

- (BOOL)restricted
{
  return AceObjectBoolForProperty(self, @"restricted");
}

- (void)setRestricted:(BOOL)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end