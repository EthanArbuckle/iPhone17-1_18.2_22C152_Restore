@interface MTUpNextManifest
- (BOOL)defaultToInitialIndexZero;
- (MTPlayerController)playerController;
- (MTUpNextManifest)initWithPlayerController:(id)a3;
- (void)_mediaItemDidChange:(id)a3;
- (void)_upNextItemsDidChange;
- (void)_updateUpNext;
- (void)dealloc;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setPlayerController:(id)a3;
@end

@implementation MTUpNextManifest

- (MTUpNextManifest)initWithPlayerController:(id)a3
{
  id v4 = a3;
  [(MTUpNextManifest *)self setPlayerController:v4];
  v5 = [v4 upNextController];
  v6 = [v5 items];

  v14.receiver = self;
  v14.super_class = (Class)MTUpNextManifest;
  v7 = [(MTItemListManifest *)&v14 initWithItems:v6];
  if (v7)
  {
    v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = IMAVPlayerNotification_MediaItemDidChange;
    v10 = [v4 player];
    [v8 addObserver:v7 selector:"_mediaItemDidChange:" name:v9 object:v10];

    v11 = +[NSNotificationCenter defaultCenter];
    v12 = [v4 upNextController];
    [v11 addObserver:v7 selector:"_upNextItemsDidChange" name:@"MTUpNextControllerItemsDidChange" object:v12];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTUpNextManifest;
  [(MTUpNextManifest *)&v4 dealloc];
}

- (void)setCurrentIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [(MTUpNextManifest *)self playerController];
    v6 = [v5 upNextController];
    [v6 beginUpdates];

    do
    {
      v7 = [(MTUpNextManifest *)self playerController];
      v8 = [v7 upNextController];
      [v8 removeEpisodeAtIndex:0];

      --v3;
    }
    while (v3);
    uint64_t v9 = [(MTUpNextManifest *)self playerController];
    v10 = [v9 upNextController];
    [v10 endUpdates];

    v11 = [(MTUpNextManifest *)self playerController];
    v12 = [v11 upNextController];
    if ([v12 count]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

    -[MTUpNextManifest setCurrentIndex:](&v15, "setCurrentIndex:", v13, v14.receiver, v14.super_class, self, MTUpNextManifest);
  }
  else
  {
    -[MTUpNextManifest setCurrentIndex:](&v14, "setCurrentIndex:", a3, self, MTUpNextManifest, v15.receiver, v15.super_class);
  }
}

- (BOOL)defaultToInitialIndexZero
{
  return 0;
}

- (void)_upNextItemsDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000CB708;
  v2[3] = &unk_10054D570;
  v2[4] = self;
  +[IMAVPlayer performOnMainQueue:v2];
}

- (void)_mediaItemDidChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v11 = [v4 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldMediaItem];

  v5 = v11;
  if (v11)
  {
    id v6 = [(MTUpNextManifest *)self currentItem];
    if (v11 == v6)
    {
      v7 = [(MTUpNextManifest *)self playerController];
      v8 = [v7 upNextController];
      id v9 = [v8 count];

      v5 = v11;
      if (!v9) {
        goto LABEL_6;
      }
      id v6 = [(MTUpNextManifest *)self playerController];
      v10 = [v6 upNextController];
      [v10 removeEpisodeAtIndex:0];
    }
    v5 = v11;
  }
LABEL_6:
}

- (void)_updateUpNext
{
  unint64_t v3 = [(MTUpNextManifest *)self playerController];
  objc_super v4 = [v3 upNextController];
  id v5 = [v4 items];

  [(MTItemListManifest *)self setItems:v5];
}

- (MTPlayerController)playerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  return (MTPlayerController *)WeakRetained;
}

- (void)setPlayerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end