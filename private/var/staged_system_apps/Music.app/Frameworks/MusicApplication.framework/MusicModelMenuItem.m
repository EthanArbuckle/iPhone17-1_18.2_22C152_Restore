@interface MusicModelMenuItem
+ (id)__submenu_KEY;
+ (id)__title_KEY;
@end

@implementation MusicModelMenuItem

+ (id)__title_KEY
{
  return @"MusicModelPropertyMenuItemTitle";
}

+ (id)__submenu_KEY
{
  return @"MusicModelRelationshipMenuItemSubmenu";
}

@end