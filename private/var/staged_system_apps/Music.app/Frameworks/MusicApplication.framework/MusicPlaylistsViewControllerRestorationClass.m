@interface MusicPlaylistsViewControllerRestorationClass
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (MusicPlaylistsViewControllerRestorationClass)init;
@end

@implementation MusicPlaylistsViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_4EAF54();

  return v7;
}

- (MusicPlaylistsViewControllerRestorationClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_3();
  return [(MusicPlaylistsViewControllerRestorationClass *)&v3 init];
}

@end