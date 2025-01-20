@interface UIMenu
+ (id)bk_menuWithChildren:(id)a3;
@end

@implementation UIMenu

+ (id)bk_menuWithChildren:(id)a3
{
  return +[UIMenu menuWithChildren:a3];
}

@end