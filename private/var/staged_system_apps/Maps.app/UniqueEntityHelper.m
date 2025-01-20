@interface UniqueEntityHelper
+ (void)postPreferenceEntityDidUpdateNotification;
- (_TtC4Maps18UniqueEntityHelper)init;
@end

@implementation UniqueEntityHelper

+ (void)postPreferenceEntityDidUpdateNotification
{
  GEOConfigGetBOOL();

  GEOConfigSetBOOL();
}

- (_TtC4Maps18UniqueEntityHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UniqueEntityHelper();
  return [(UniqueEntityHelper *)&v3 init];
}

@end