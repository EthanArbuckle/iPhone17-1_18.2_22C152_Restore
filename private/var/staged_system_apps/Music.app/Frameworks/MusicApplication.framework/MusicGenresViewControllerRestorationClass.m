@interface MusicGenresViewControllerRestorationClass
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (MusicGenresViewControllerRestorationClass)init;
@end

@implementation MusicGenresViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v4 = [objc_allocWithZone((Class)type metadata accessor for GenresViewController()) init];

  return v4;
}

- (MusicGenresViewControllerRestorationClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_2();
  return [(MusicGenresViewControllerRestorationClass *)&v3 init];
}

@end