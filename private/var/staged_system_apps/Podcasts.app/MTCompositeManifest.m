@interface MTCompositeManifest
- (BOOL)isIndexFromUpNext:(unint64_t)a3;
- (BOOL)isPlayingFromManifest:(id)a3;
- (BOOL)isPlayingFromUpNext;
- (BOOL)networkUPPEnabled;
- (MTCompositeManifest)initWithUpNextManifest:(id)a3 userManifest:(id)a4 loadQueue:(id)a5;
- (MTPlayerManifest)currentManifest;
- (MTPlayerManifest)upNextManifest;
- (MTPlayerManifest)userManifest;
- (OS_dispatch_queue)loadQueue;
- (id)activity;
- (id)currentItem;
- (id)identifier;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)currentIndex;
- (unint64_t)determineCompositeIndexWithIndex:(unint64_t)a3 fromManifest:(id)a4;
- (void)_currentItemDidChange:(id)a3;
- (void)_determineManifest:(id *)a3 scalledIndex:(unint64_t *)a4 forIndex:(unint64_t)a5;
- (void)_load:(id)a3;
- (void)_setupManifestDefaults;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)notifyCurrentItemDidChange;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentManifest:(id)a3;
- (void)setLoadQueue:(id)a3;
- (void)setUpNextManifest:(id)a3;
- (void)setUserManifest:(id)a3;
@end

@implementation MTCompositeManifest

- (MTCompositeManifest)initWithUpNextManifest:(id)a3 userManifest:(id)a4 loadQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MTCompositeManifest;
  v12 = [(MTPlayerManifest *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upNextManifest, a3);
    objc_storeStrong((id *)&v13->_userManifest, a4);
    objc_storeStrong((id *)&v13->_loadQueue, a5);
    v14 = +[NSNotificationCenter defaultCenter];
    uint64_t v15 = IMPlayerManifestCurrentItemDidChange;
    [v14 addObserver:v13 selector:"_currentItemDidChange:" name:IMPlayerManifestCurrentItemDidChange object:v13->_upNextManifest];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v13 selector:"_currentItemDidChange:" name:v15 object:v13->_userManifest];
  }
  return v13;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTCompositeManifest;
  [(MTCompositeManifest *)&v4 dealloc];
}

- (id)identifier
{
  p_upNextManifest = &self->_upNextManifest;
  upNextManifest = self->_upNextManifest;
  if (!upNextManifest || ![(MTPlayerManifest *)upNextManifest count]) {
    p_upNextManifest = &self->_userManifest;
  }
  v5 = [(MTPlayerManifest *)*p_upNextManifest identifier];

  return v5;
}

- (BOOL)isPlayingFromManifest:(id)a3
{
  id v4 = a3;
  id v5 = [(MTCompositeManifest *)self currentManifest];

  return v5 == v4;
}

- (BOOL)isIndexFromUpNext:(unint64_t)a3
{
  id v7 = 0;
  uint64_t v8 = 0;
  [(MTCompositeManifest *)self _determineManifest:&v7 scalledIndex:&v8 forIndex:a3];
  id v4 = v7;
  id v5 = [(MTCompositeManifest *)self upNextManifest];

  return v4 == v5;
}

- (BOOL)networkUPPEnabled
{
  v2 = [(MTCompositeManifest *)self userManifest];
  unsigned __int8 v3 = [v2 networkUPPEnabled];

  return v3;
}

- (void)_load:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001195D4;
  v5[3] = &unk_10054D738;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)MTCompositeManifest;
  id v3 = v7;
  [(MTCompositeManifest *)&v4 _load:v5];
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v6 = 0;
  uint64_t v7 = 0;
  [(MTCompositeManifest *)self _determineManifest:&v6 scalledIndex:&v7 forIndex:a3];
  id v3 = v6;
  objc_super v4 = [v3 objectAtIndex:v7];

  return v4;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || [(MTCompositeManifest *)self count] <= a3)
  {
    [(MTCompositeManifest *)self setCurrentManifest:0];
    [(MTCompositeManifest *)self notifyCurrentItemDidChange];
    id v5 = +[IMLogCategory player];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setCurrentIndex: %lu, not found", buf, 0xCu);
    }
  }
  else
  {
    id v19 = 0;
    id v20 = 0;
    [(MTCompositeManifest *)self _determineManifest:&v19 scalledIndex:&v20 forIndex:a3];
    id v5 = v19;
    id v6 = [v5 currentIndex];
    [(MTCompositeManifest *)self setCurrentManifest:v5];
    [v5 setCurrentIndex:v20];
    if (v20 == v6) {
      [(MTCompositeManifest *)self notifyCurrentItemDidChange];
    }
    if ((os_feature_enabled_red_sun() & 1) == 0)
    {
      uint64_t v7 = [(MTCompositeManifest *)self userManifest];
      unint64_t v8 = (unint64_t)v20;

      if (v5 == v7 && v8 > (unint64_t)v6)
      {
        id v9 = +[MTPlayerController defaultInstance];
        id v10 = [v9 player];
        id v11 = [v10 manifest];
        unsigned int v12 = [v11 isEqual:self];

        if (v12)
        {
          v13 = +[MTPlayerController defaultInstance];
          v14 = [v13 upNextController];
          [v14 clear];
        }
      }
    }
    uint64_t v15 = +[IMLogCategory player];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v20;
      v17 = [v5 currentItem];
      objc_super v18 = [v17 title];
      *(_DWORD *)buf = 134218754;
      unint64_t v22 = a3;
      __int16 v23 = 2112;
      v24 = v5;
      __int16 v25 = 2048;
      id v26 = v16;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "setCurrentIndex: %lu, manifest: %@ scalled: %lu, item: %@", buf, 0x2Au);
    }
  }
}

- (unint64_t)currentIndex
{
  id v3 = [(MTCompositeManifest *)self currentManifest];
  objc_super v4 = [(MTCompositeManifest *)self upNextManifest];

  if (v3 == v4)
  {
    unint64_t v8 = [(MTCompositeManifest *)self userManifest];
    id v9 = [v8 currentIndex];

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(MTCompositeManifest *)self userManifest];
      id v12 = [v11 currentIndex];
      v13 = [(MTCompositeManifest *)self upNextManifest];
      uint64_t v7 = (char *)[v13 currentIndex] + (void)v12 + 1;

      goto LABEL_9;
    }
    id v10 = [(MTCompositeManifest *)self upNextManifest];
LABEL_7:
    id v11 = v10;
    uint64_t v7 = (char *)[v10 currentIndex];
LABEL_9:

    return (unint64_t)v7;
  }
  id v5 = [(MTCompositeManifest *)self currentManifest];
  id v6 = [(MTCompositeManifest *)self userManifest];

  if (v5 == v6)
  {
    id v10 = [(MTCompositeManifest *)self userManifest];
    goto LABEL_7;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)currentItem
{
  id v3 = [(MTCompositeManifest *)self currentManifest];

  if (v3)
  {
    objc_super v4 = [(MTCompositeManifest *)self currentManifest];
    id v5 = [v4 currentItem];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)count
{
  id v3 = [(MTPlayerManifest *)self->_userManifest count];
  return (unint64_t)v3 + (void)[(MTPlayerManifest *)self->_upNextManifest count];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  unint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100119E50;
  id v11 = &unk_100552110;
  id v4 = a3;
  id v12 = v4;
  v13 = &v14;
  id v5 = objc_retainBlock(&v8);
  id v6 = [(MTCompositeManifest *)self userManifest];
  [v6 enumerateObjectsUsingBlock:v5];

  if (!*((unsigned char *)v15 + 24))
  {
    uint64_t v7 = [(MTCompositeManifest *)self upNextManifest];
    [v7 enumerateObjectsUsingBlock:v4];
  }
  _Block_object_dispose(&v14, 8);
}

- (id)activity
{
  id v3 = [(MTCompositeManifest *)self currentManifest];

  if (v3)
  {
    id v4 = [(MTCompositeManifest *)self userManifest];
    id v3 = [v4 activity];

    id v5 = [(MTCompositeManifest *)self upNextManifest];
    BOOL v6 = [(MTCompositeManifest *)self isPlayingFromManifest:v5];

    if (v6)
    {
      [v3 setEligibleForHandoff:0];
      [v3 setEligibleForSearch:0];
      [v3 setEligibleForPublicIndexing:0];
    }
    uint64_t v7 = +[NSNumber numberWithBool:v6];
    [v3 setValue:v7 forKey:@"MTCompositeManifestIsPlayingFromUpNext"];
  }

  return v3;
}

- (unint64_t)determineCompositeIndexWithIndex:(unint64_t)a3 fromManifest:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MTCompositeManifest *)self userManifest];
  unsigned int v8 = [v6 isEqual:v7];

  if (!v8)
  {
    id v10 = [(MTCompositeManifest *)self upNextManifest];
    unsigned int v11 = [v6 isEqual:v10];

    if (!v11)
    {
      a3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_8;
    }
    uint64_t v9 = [(MTCompositeManifest *)self userManifest];
    a3 += (unint64_t)[v9 currentIndex] + 1;
    goto LABEL_6;
  }
  if ((unint64_t)[v6 currentIndex] < a3)
  {
    uint64_t v9 = [(MTCompositeManifest *)self upNextManifest];
    a3 += (unint64_t)[v9 count];
LABEL_6:
  }
LABEL_8:

  return a3;
}

- (void)_determineManifest:(id *)a3 scalledIndex:(unint64_t *)a4 forIndex:(unint64_t)a5
{
  uint64_t v9 = [(MTCompositeManifest *)self upNextManifest];
  id v10 = [v9 count];

  unsigned int v11 = [(MTCompositeManifest *)self userManifest];
  id v12 = v11;
  if (!v10) {
    goto LABEL_13;
  }
  id v13 = [v11 count];

  if (!v13)
  {
    unsigned int v11 = [(MTCompositeManifest *)self upNextManifest];
LABEL_13:
    *a3 = v11;
    *a4 = a5;
    return;
  }
  uint64_t v14 = [(MTCompositeManifest *)self userManifest];
  int64_t v15 = (int64_t)[v14 currentIndex];

  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v15 = -1;
  }
  if (v15 >= (uint64_t)a5)
  {
    unsigned int v11 = [(MTCompositeManifest *)self userManifest];
    goto LABEL_13;
  }
  uint64_t v16 = [(MTCompositeManifest *)self upNextManifest];
  char v17 = (char *)[v16 count] + v15;

  if ((unint64_t)v17 >= a5)
  {
    *a3 = [(MTCompositeManifest *)self upNextManifest];
    *a4 = ~v15 + a5;
  }
  else
  {
    *a3 = [(MTCompositeManifest *)self userManifest];
    id v18 = [(MTCompositeManifest *)self upNextManifest];
    *a4 = a5 - (void)[v18 count];
  }
}

- (void)_setupManifestDefaults
{
  id v3 = [(MTCompositeManifest *)self userManifest];
  id v4 = [v3 count];

  if (v4) {
    [(MTCompositeManifest *)self userManifest];
  }
  else {
  id v5 = [(MTCompositeManifest *)self upNextManifest];
  }
  -[MTCompositeManifest setCurrentIndex:](self, "setCurrentIndex:", [v5 currentIndex]);
}

- (void)_currentItemDidChange:(id)a3
{
  id v7 = a3;
  id v4 = [(MTCompositeManifest *)self currentManifest];

  if (!v4) {
    [(MTCompositeManifest *)self _setupManifestDefaults];
  }
  id v5 = [v7 object];
  id v6 = [(MTCompositeManifest *)self currentManifest];

  if (v5 == v6) {
    [(MTCompositeManifest *)self notifyCurrentItemDidChange];
  }
}

- (void)notifyCurrentItemDidChange
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:IMPlayerManifestCurrentItemDidChange object:self];
}

- (id)metricsContentIdentifier
{
  v2 = [(MTCompositeManifest *)self currentManifest];
  id v3 = [v2 metricsContentIdentifier];

  return v3;
}

- (id)metricsAdditionalData
{
  v2 = [(MTCompositeManifest *)self currentManifest];
  id v3 = [v2 metricsAdditionalData];

  return v3;
}

- (MTPlayerManifest)currentManifest
{
  return self->_currentManifest;
}

- (void)setCurrentManifest:(id)a3
{
}

- (BOOL)isPlayingFromUpNext
{
  return self->_isPlayingFromUpNext;
}

- (MTPlayerManifest)upNextManifest
{
  return self->_upNextManifest;
}

- (void)setUpNextManifest:(id)a3
{
}

- (MTPlayerManifest)userManifest
{
  return self->_userManifest;
}

- (void)setUserManifest:(id)a3
{
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (void)setLoadQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_upNextManifest, 0);

  objc_storeStrong((id *)&self->_currentManifest, 0);
}

@end