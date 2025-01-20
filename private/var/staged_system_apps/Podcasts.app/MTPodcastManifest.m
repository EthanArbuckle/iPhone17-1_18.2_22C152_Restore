@interface MTPodcastManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (MTPodcastManifest)initWithInitialEpisodeUuid:(id)a3 sectionType:(unint64_t)a4;
- (NSString)podcastUuid;
- (id)activity;
- (unint64_t)sectionType;
- (void)_propertyDidChange;
- (void)setPodcastUuid:(id)a3;
- (void)setSectionType:(unint64_t)a3;
@end

@implementation MTPodcastManifest

+ (id)activityTypeSuffix
{
  return @"podcast";
}

- (MTPodcastManifest)initWithInitialEpisodeUuid:(id)a3 sectionType:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_10005710C;
    v49 = sub_100057350;
    id v50 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = sub_10005710C;
    v43 = sub_100057350;
    id v44 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_10005710C;
    v37 = sub_100057350;
    id v38 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_10005710C;
    v31 = sub_100057350;
    id v32 = 0;
    v7 = +[MTDB sharedInstance];
    v8 = [v7 mainOrPrivateContext];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100134E9C;
    v19[3] = &unk_100552A40;
    id v9 = v8;
    id v20 = v9;
    id v10 = v6;
    id v21 = v10;
    v22 = &v45;
    v23 = &v39;
    v24 = &v33;
    v25 = &v27;
    unint64_t v26 = a4;
    [v9 performBlockAndWait:v19];
    if ([(id)v46[5] length])
    {
      id v11 = objc_alloc((Class)NSFetchRequest);
      id v12 = [v11 initWithEntityName:kMTEpisodeEntityName];
      [v12 setPredicate:v28[5]];
      [v12 setSortDescriptors:v34[5]];
      v18.receiver = self;
      v18.super_class = (Class)MTPodcastManifest;
      v13 = [(MTPredicateManifest *)&v18 initWithInitialEpisodeUuid:v10 fetchRequest:v12];
      v14 = v13;
      if (v13)
      {
        [(MTPodcastManifest *)v13 setPodcastUuid:v46[5]];
        [(MTPodcastManifest *)v14 setSectionType:a4];
        [(MTPodcastManifest *)v14 setTitle:v40[5]];
        v15 = +[MTPodcast predicateForPodcastUUID:v46[5]];
        [(MTPredicateManifest *)v14 _observeAllPropertyChangesForEntityName:kMTPodcastEntityName predicate:v15];
      }
      self = v14;

      v16 = self;
    }
    else
    {
      v16 = 0;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)activity
{
  v6.receiver = self;
  v6.super_class = (Class)MTPodcastManifest;
  v3 = [(MTPlayerManifest *)&v6 activity];
  v4 = +[NSNumber numberWithUnsignedInteger:[(MTPodcastManifest *)self sectionType]];
  [v3 setValue:v4 forKey:@"MTPodcastManifestActivitySectionType"];

  return v3;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 userInfo];
  id v9 = [v8 valueForKey:@"MTPodcastManifestActivitySectionType"];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013511C;
  v12[3] = &unk_10054F630;
  id v13 = v9;
  id v14 = v6;
  id v10 = v9;
  id v11 = v6;
  [a1 episodeUuidForActivity:v7 completion:v12];
}

- (void)_propertyDidChange
{
  v3 = +[MTDB sharedInstance];
  v4 = [v3 mainOrPrivateContext];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10005710C;
  v16 = sub_100057350;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100135334;
  v8[3] = &unk_10054DA00;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  id v11 = &v12;
  [v5 performBlockAndWait:v8];
  id v6 = (void *)v13[5];
  id v7 = [(MTPredicateManifest *)self sortDescriptors];
  LOBYTE(v6) = [v6 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    [(MTPredicateManifest *)self setSortDescriptors:v13[5]];
    [(MTPredicateManifest *)self _refetch:0];
  }

  _Block_object_dispose(&v12, 8);
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void)setPodcastUuid:(id)a3
{
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (void).cxx_destruct
{
}

@end