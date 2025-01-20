@interface MTManifestResultsController
- (MTManifestResultsController)initWithPlayerController:(id)a3;
- (MTPlayerManifest)manifest;
- (unint64_t)startingIndexForDisplay;
- (void)_manifestDidChange;
- (void)dealloc;
- (void)reloadData;
- (void)setManifest:(id)a3;
@end

@implementation MTManifestResultsController

- (MTManifestResultsController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTManifestResultsController;
  v5 = [(MTListResultsController *)&v10 init];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = IMAVPlayerNotification_MediaItemDidChange;
    v8 = [v4 player];
    [v6 addObserver:v5 selector:"_manifestDidChange" name:v7 object:v8];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTManifestResultsController;
  [(MTManifestResultsController *)&v4 dealloc];
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
  id v5 = a3;
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_manifestDidChange" name:IMPlayerManifestDidChange object:v5];

  [(MTManifestResultsController *)self reloadData];
}

- (unint64_t)startingIndexForDisplay
{
  v2 = [(MTManifestResultsController *)self manifest];
  id v3 = [v2 currentIndex];

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return (unint64_t)v3;
  }
}

- (void)reloadData
{
  id v3 = objc_alloc((Class)NSMutableArray);
  objc_super v4 = [(MTManifestResultsController *)self manifest];
  id v10 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  for (unint64_t i = [(MTManifestResultsController *)self startingIndexForDisplay]; ; ++i)
  {
    v6 = [(MTManifestResultsController *)self manifest];
    id v7 = [v6 count];

    if (i >= (unint64_t)v7) {
      break;
    }
    v8 = [(MTManifestResultsController *)self manifest];
    v9 = [v8 objectAtIndex:i];

    if (v9) {
      [v10 addObject:v9];
    }
  }
  [(MTListResultsController *)self setObjects:v10];
}

- (void)_manifestDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA13C;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (MTPlayerManifest)manifest
{
  return self->_manifest;
}

- (void).cxx_destruct
{
}

@end