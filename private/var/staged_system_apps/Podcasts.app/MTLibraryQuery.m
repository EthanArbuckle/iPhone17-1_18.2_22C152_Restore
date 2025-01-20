@interface MTLibraryQuery
- (BOOL)isActive;
- (MTLibraryQuery)init;
- (NSArray)channelResults;
- (NSArray)channelSortDescriptors;
- (NSArray)episodeResults;
- (NSArray)episodeSortDescriptors;
- (NSArray)podcastResults;
- (NSArray)podcastSortDescriptors;
- (NSPredicate)channelPredicate;
- (NSPredicate)episodePredicate;
- (NSPredicate)podcastPredicate;
- (id)action;
- (int64_t)fetchLimit;
- (void)runQuery;
- (void)runQueryInContext:(id)a3;
- (void)runQueryWithPodcastPredicate:(id)a3 episodePredicate:(id)a4 channelPredicate:(id)a5;
- (void)setAction:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setChannelPredicate:(id)a3;
- (void)setChannelResults:(id)a3;
- (void)setChannelSortDescriptors:(id)a3;
- (void)setEpisodePredicate:(id)a3;
- (void)setEpisodeResults:(id)a3;
- (void)setEpisodeSortDescriptors:(id)a3;
- (void)setFetchLimit:(int64_t)a3;
- (void)setPodcastPredicate:(id)a3;
- (void)setPodcastResults:(id)a3;
- (void)setPodcastSortDescriptors:(id)a3;
@end

@implementation MTLibraryQuery

- (MTLibraryQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLibraryQuery;
  v2 = [(MTLibraryQuery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_active = 1;
    v2->_fetchLimit = 0;
    v4 = v2;
  }

  return v3;
}

- (void)runQueryWithPodcastPredicate:(id)a3 episodePredicate:(id)a4 channelPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(MTLibraryQuery *)self setPodcastPredicate:a3];
  [(MTLibraryQuery *)self setEpisodePredicate:v9];

  [(MTLibraryQuery *)self setChannelPredicate:v8];

  [(MTLibraryQuery *)self runQuery];
}

- (void)runQuery
{
  v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  [(MTLibraryQuery *)self runQueryInContext:v4];
}

- (void)runQueryInContext:(id)a3
{
  id v4 = a3;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_100056ED0;
  v47 = sub_100057240;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100056ED0;
  v41 = sub_100057240;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100056ED0;
  v35 = sub_100057240;
  id v36 = +[NSMutableArray array];
  v5 = self->_episodeSortDescriptors;
  objc_super v6 = self->_podcastSortDescriptors;
  v7 = self->_channelSortDescriptors;
  id v8 = self->_podcastPredicate;
  id v9 = self->_episodePredicate;
  v10 = self->_channelPredicate;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100087C74;
  v19[3] = &unk_10054ED20;
  v11 = v8;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v22 = self;
  v28 = &v37;
  id v13 = v4;
  id v23 = v13;
  v29 = &v31;
  v14 = v9;
  v24 = v14;
  v30 = &v43;
  v15 = v5;
  v25 = v15;
  v16 = v10;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  [v13 performBlockAndWait:v19];
  action = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_action;
  if (action) {
    action[2](action, v38[5], v44[5], v32[5]);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

- (NSArray)podcastResults
{
  return self->_podcastResults;
}

- (void)setPodcastResults:(id)a3
{
}

- (NSArray)episodeResults
{
  return self->_episodeResults;
}

- (void)setEpisodeResults:(id)a3
{
}

- (NSArray)channelResults
{
  return self->_channelResults;
}

- (void)setChannelResults:(id)a3
{
}

- (NSPredicate)podcastPredicate
{
  return self->_podcastPredicate;
}

- (void)setPodcastPredicate:(id)a3
{
}

- (NSPredicate)episodePredicate
{
  return self->_episodePredicate;
}

- (void)setEpisodePredicate:(id)a3
{
}

- (NSPredicate)channelPredicate
{
  return self->_channelPredicate;
}

- (void)setChannelPredicate:(id)a3
{
}

- (NSArray)podcastSortDescriptors
{
  return self->_podcastSortDescriptors;
}

- (void)setPodcastSortDescriptors:(id)a3
{
}

- (NSArray)episodeSortDescriptors
{
  return self->_episodeSortDescriptors;
}

- (void)setEpisodeSortDescriptors:(id)a3
{
}

- (NSArray)channelSortDescriptors
{
  return self->_channelSortDescriptors;
}

- (void)setChannelSortDescriptors:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(int64_t)a3
{
  self->_fetchLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_channelSortDescriptors, 0);
  objc_storeStrong((id *)&self->_episodeSortDescriptors, 0);
  objc_storeStrong((id *)&self->_podcastSortDescriptors, 0);
  objc_storeStrong((id *)&self->_channelPredicate, 0);
  objc_storeStrong((id *)&self->_episodePredicate, 0);
  objc_storeStrong((id *)&self->_podcastPredicate, 0);
  objc_storeStrong((id *)&self->_channelResults, 0);
  objc_storeStrong((id *)&self->_episodeResults, 0);

  objc_storeStrong((id *)&self->_podcastResults, 0);
}

@end