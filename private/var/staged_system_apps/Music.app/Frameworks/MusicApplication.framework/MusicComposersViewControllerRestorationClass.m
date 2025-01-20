@interface MusicComposersViewControllerRestorationClass
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (MusicComposersViewControllerRestorationClass)init;
@end

@implementation MusicComposersViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v4 = [objc_allocWithZone((Class)type metadata accessor for ComposersViewController()) init];

  return v4;
}

- (MusicComposersViewControllerRestorationClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RestorationClass();
  return [(MusicComposersViewControllerRestorationClass *)&v3 init];
}

@end