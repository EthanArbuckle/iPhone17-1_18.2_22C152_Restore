@interface MTAppCoreSpotlightEntityAnnotator
- (MTAppCoreSpotlightEntityAnnotator)init;
- (id)annotateItem:(id)a3 withManagedObject:(id)a4;
- (id)annotateItem:(id)a3 withPlayerItem:(id)a4;
@end

@implementation MTAppCoreSpotlightEntityAnnotator

- (MTAppCoreSpotlightEntityAnnotator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return [(MTAppCoreSpotlightEntityAnnotator *)&v3 init];
}

- (id)annotateItem:(id)a3 withManagedObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (id)sub_1003A69DC((uint64_t)v6, v7);

  return v9;
}

- (id)annotateItem:(id)a3 withPlayerItem:(id)a4
{
  uint64_t v7 = type metadata accessor for EpisodeEntity();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = [v12 episode];
  if (v14)
  {
    id v15 = v14;
    EpisodeEntity.init(model:)();
    sub_1003A6CCC(&qword_100606AC8, (void (*)(uint64_t))&type metadata accessor for EpisodeEntity);
    CSSearchableItem.associateAppEntity<A>(_:priority:)();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  return v11;
}

@end