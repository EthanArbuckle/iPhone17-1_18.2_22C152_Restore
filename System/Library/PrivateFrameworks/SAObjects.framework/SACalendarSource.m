@interface SACalendarSource
+ (id)source;
- (BOOL)strict;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStrict:(BOOL)a3;
@end

@implementation SACalendarSource

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"Source";
}

+ (id)source
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)strict
{
  return AceObjectBoolForProperty(self, @"strict");
}

- (void)setStrict:(BOOL)a3
{
}

@end