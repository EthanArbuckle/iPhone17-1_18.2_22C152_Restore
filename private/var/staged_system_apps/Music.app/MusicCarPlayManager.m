@interface MusicCarPlayManager
+ (MusicCarPlayManager)sharedManager;
- (BOOL)detachFromWindow:(id)a3;
- (BOOL)isAttached;
- (BOOL)libraryHasContent;
- (MCDNowPlayingContentManagerProtocol)nowPlayingContentManager;
- (MCDRootController)carDisplayController;
- (NSArray)tabIdentifiers;
- (id)_init;
- (void)attachToWindow:(id)a3;
- (void)dealloc;
- (void)reloadTabsContent;
- (void)setCarDisplayController:(id)a3;
- (void)setNowPlayingContentManager:(id)a3;
- (void)setTabIdentifiers:(id)a3;
- (void)showNowPlaying:(BOOL)a3;
- (void)showSharePlayTogetherSettings;
@end

@implementation MusicCarPlayManager

- (BOOL)isAttached
{
  v2 = [(MCDRootController *)self->_carDisplayController carDisplayWindow];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (MusicCarPlayManager)sharedManager
{
  if (qword_1010D6C78 != -1) {
    dispatch_once(&qword_1010D6C78, &stru_100FC36E0);
  }
  v2 = (void *)qword_1010D6C70;

  return (MusicCarPlayManager *)v2;
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)MusicCarPlayManager;
  v2 = [(MusicCarPlayManager *)&v13 init];
  BOOL v3 = v2;
  if (v2)
  {
    tabIdentifiers = v2->_tabIdentifiers;
    v2->_tabIdentifiers = (NSArray *)&__NSArray0__struct;

    v5 = [MCDNowPlayingContentManager alloc];
    v6 = objc_opt_new();
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    v7 = (id *)qword_1010D6C80;
    uint64_t v18 = qword_1010D6C80;
    if (!qword_1010D6C80)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100027DB4;
      v14[3] = &unk_100FC34A0;
      v14[4] = &v15;
      sub_100027DB4((uint64_t)v14);
      v7 = (id *)v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v7)
    {
      v12 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v12);
    }
    id v8 = *v7;
    v9 = [(MCDNowPlayingContentManager *)v5 initWithDelegate:0 dataSource:v6 bundleID:v8];
    nowPlayingContentManager = v3->_nowPlayingContentManager;
    v3->_nowPlayingContentManager = (MCDNowPlayingContentManagerProtocol *)v9;
  }
  return v3;
}

- (void)dealloc
{
  [(MCDNowPlayingContentManagerProtocol *)self->_nowPlayingContentManager endRequestObservation];
  v3.receiver = self;
  v3.super_class = (Class)MusicCarPlayManager;
  [(MusicCarPlayManager *)&v3 dealloc];
}

- (BOOL)libraryHasContent
{
  v2 = +[MPMediaLibrary defaultMediaLibrary];
  BOOL v3 = [v2 filterAvailableContentGroups:128 withOptions:0] != 0;

  return v3;
}

- (void)attachToWindow:(id)a3
{
  id v4 = a3;
  v5 = [[MCDRootController alloc] initWithWindow:v4];

  [(MusicCarPlayManager *)self setCarDisplayController:v5];
  v6 = [(MusicCarPlayManager *)self tabIdentifiers];
  v7 = [(MusicCarPlayManager *)self carDisplayController];
  [v7 setTabIdentifiers:v6];

  id v8 = [(MusicCarPlayManager *)self nowPlayingContentManager];
  [v8 beginRequestObservation];
}

- (BOOL)detachFromWindow:(id)a3
{
  id v4 = a3;
  v5 = [(MusicCarPlayManager *)self carDisplayController];
  id v6 = [v5 carDisplayWindow];

  if (v6 == v4)
  {
    v7 = [(MusicCarPlayManager *)self carDisplayController];
    [v7 sceneDidDisconnect];

    id v8 = [(MusicCarPlayManager *)self nowPlayingContentManager];
    [v8 endRequestObservation];

    [(MusicCarPlayManager *)self setCarDisplayController:0];
  }
  return v6 == v4;
}

- (void)showNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MusicCarPlayManager *)self carDisplayController];
  [v4 showNowPlaying:v3];
}

- (void)showSharePlayTogetherSettings
{
  id v2 = [(MusicCarPlayManager *)self carDisplayController];
  [v2 showSharePlayTogetherSettings];
}

- (void)setTabIdentifiers:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_tabIdentifiers, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_tabIdentifiers, a3);
    v5 = [(MusicCarPlayManager *)self carDisplayController];
    [v5 setTabIdentifiers:v6];
  }
}

- (void)reloadTabsContent
{
  id v2 = [(MusicCarPlayManager *)self carDisplayController];
  [v2 reloadTabsContent];
}

- (NSArray)tabIdentifiers
{
  return self->_tabIdentifiers;
}

- (MCDNowPlayingContentManagerProtocol)nowPlayingContentManager
{
  return self->_nowPlayingContentManager;
}

- (void)setNowPlayingContentManager:(id)a3
{
}

- (MCDRootController)carDisplayController
{
  return self->_carDisplayController;
}

- (void)setCarDisplayController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentManager, 0);

  objc_storeStrong((id *)&self->_tabIdentifiers, 0);
}

@end