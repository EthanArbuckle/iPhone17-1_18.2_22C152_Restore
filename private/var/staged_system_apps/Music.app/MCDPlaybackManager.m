@interface MCDPlaybackManager
- (BOOL)favoriteContentOnly;
- (BOOL)localContentOnly;
- (MCDPlayableDelegate)delegate;
- (MCDPlaybackManager)initWithDelegate:(id)a3;
- (void)performPlaybackRequestWithCommand:(id)a3;
- (void)setFavoriteContentOnly:(BOOL)a3;
- (void)setLocalContentOnly:(BOOL)a3;
- (void)setupPlaybackRequestWithCompletion:(id)a3;
@end

@implementation MCDPlaybackManager

- (MCDPlaybackManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCDPlaybackManager;
  v5 = [(MCDPlaybackManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setupPlaybackRequestWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MPCPlayerRequest);
  v5 = +[MPAVRoutingController systemRoute];
  v6 = +[MPCPlayerPath systemMusicPathWithRoute:v5 playerID:@"Music"];
  [v4 setPlayerPath:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BACAC;
  v9[3] = &unk_100FC43A8;
  id v10 = v3;
  id v7 = v3;
  id v8 = [v4 performWithCompletion:v9];
}

- (void)performPlaybackRequestWithCommand:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BADA4;
  v5[3] = &unk_100FC43D0;
  objc_copyWeak(&v6, &location);
  +[MPCPlayerChangeRequest performRequest:v4 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (MCDPlayableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MCDPlayableDelegate *)WeakRetained;
}

- (BOOL)localContentOnly
{
  return self->_localContentOnly;
}

- (void)setLocalContentOnly:(BOOL)a3
{
  self->_localContentOnly = a3;
}

- (BOOL)favoriteContentOnly
{
  return self->_favoriteContentOnly;
}

- (void)setFavoriteContentOnly:(BOOL)a3
{
  self->_favoriteContentOnly = a3;
}

- (void).cxx_destruct
{
}

@end