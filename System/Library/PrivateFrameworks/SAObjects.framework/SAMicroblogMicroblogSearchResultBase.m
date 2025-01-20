@interface SAMicroblogMicroblogSearchResultBase
+ (id)microblogSearchResultBase;
- (SAMicroblogTwitterPostAuthor)author;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAuthor:(id)a3;
@end

@implementation SAMicroblogMicroblogSearchResultBase

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"MicroblogSearchResultBase";
}

+ (id)microblogSearchResultBase
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMicroblogTwitterPostAuthor)author
{
  return (SAMicroblogTwitterPostAuthor *)AceObjectAceObjectForProperty(self, @"author");
}

- (void)setAuthor:(id)a3
{
}

@end