@interface MusicAlbumsViewControllerRestorationClass
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (MusicAlbumsViewControllerRestorationClass)init;
@end

@implementation MusicAlbumsViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)sub_1644A4(v6);

  return v7;
}

- (MusicAlbumsViewControllerRestorationClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_0();
  return [(MusicAlbumsViewControllerRestorationClass *)&v3 init];
}

@end