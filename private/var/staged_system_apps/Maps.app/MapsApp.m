@interface MapsApp
- (id)_keyWindowForScreen:(id)a3;
- (void)_maps_callPhoneNumber:(id)a3 completion:(id)a4;
- (void)userDefaultsDidChange:(id)a3;
@end

@implementation MapsApp

- (void)userDefaultsDidChange:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:off_1015ED360 object:self];
}

- (id)_keyWindowForScreen:(id)a3
{
  id v4 = a3;
  if ([v4 _userInterfaceIdiom] == (id)3)
  {
    if (objc_msgSend((id)objc_opt_class(), "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionRoleCarPlay))
    {
      v5 = +[CarDisplayController sharedInstance];
      id v6 = [v5 window];
    }
    else
    {
      v7 = +[IPCServer sharedServer];
      v5 = [v7 activeCarPlayBannerViewController];

      v8 = [v5 view];
      v9 = [v8 window];

      if (v9)
      {
        id v6 = v9;
      }
      else
      {
        v10 = +[CarDisplayController sharedInstance];
        id v6 = [v10 window];
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MapsApp;
    id v6 = [(MapsApp *)&v12 _keyWindowForScreen:v4];
  }

  return v6;
}

- (void)_maps_callPhoneNumber:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = objc_alloc_init((Class)TUCallProviderManager);
    id v8 = objc_alloc((Class)TUDialRequest);
    v9 = [v7 defaultProvider];
    id v10 = [v8 initWithProvider:v9];

    id v11 = [objc_alloc((Class)TUHandle) initWithType:2 value:v5];
    [v10 setHandle:v11];
    [v10 setShowUIPrompt:0];
    id v12 = [objc_alloc((Class)TUCallCenter) initWithQueue:0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008A655C;
    v13[3] = &unk_1012E76C0;
    id v14 = v6;
    [v12 launchAppForDialRequest:v10 completion:v13];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

@end