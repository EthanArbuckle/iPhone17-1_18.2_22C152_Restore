@interface SASTHeroImageItem
+ (id)heroImageItem;
- (NSString)position;
- (SADecoratedString)caption;
- (SAUINanoImageResource)watchImageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCaption:(id)a3;
- (void)setPosition:(id)a3;
- (void)setWatchImageResource:(id)a3;
@end

@implementation SASTHeroImageItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"HeroImageItem";
}

+ (id)heroImageItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADecoratedString)caption
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, @"caption");
}

- (void)setCaption:(id)a3
{
}

- (NSString)position
{
  return (NSString *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

- (SAUINanoImageResource)watchImageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"watchImageResource");
}

- (void)setWatchImageResource:(id)a3
{
}

@end