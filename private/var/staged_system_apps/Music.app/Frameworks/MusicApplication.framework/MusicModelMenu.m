@interface MusicModelMenu
+ (MusicModelMenu)menuWithJSMenu:(id)a3;
+ (id)__jsMenu_KEY;
@end

@implementation MusicModelMenu

+ (id)__jsMenu_KEY
{
  return @"MusicModelMenuJSMenu";
}

+ (MusicModelMenu)menuWithJSMenu:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __33__MusicModelMenu_menuWithJSMenu___block_invoke;
  v9[3] = &unk_CCBC88;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithIdentifiers:0 block:v9];

  return (MusicModelMenu *)v7;
}

id __33__MusicModelMenu_menuWithJSMenu___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setJsMenu:*(void *)(a1 + 32)];
}

@end