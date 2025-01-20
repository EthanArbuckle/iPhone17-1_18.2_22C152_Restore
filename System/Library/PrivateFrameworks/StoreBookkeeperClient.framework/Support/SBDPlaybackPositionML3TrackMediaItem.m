@interface SBDPlaybackPositionML3TrackMediaItem
- (ML3Track)track;
- (NSString)description;
- (SBDPlaybackPositionML3TrackMediaItem)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4;
- (int64_t)persistentID;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
@end

@implementation SBDPlaybackPositionML3TrackMediaItem

- (void).cxx_destruct
{
}

- (ML3Track)track
{
  return self->_track;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  v8 = sub_10000C738();
  if (qword_1000278C8 != -1) {
    dispatch_once(&qword_1000278C8, &stru_100020E80);
  }
  id v9 = (id)qword_1000278C0;
  if ([v6 count])
  {
    int64_t v10 = (int64_t)[v6 count];
    v11 = malloc_type_calloc(8uLL, v10, 0x2814C93CuLL);
    v12 = (uint64_t *)malloc_type_calloc(8uLL, v10, 0x1B3ED8BBuLL);
    [v6 allObjects];
    v28 = id v27 = v6;
    int64_t v13 = v10 - 1;
    v25 = v11;
    v26 = v8;
    if (v10 < 1)
    {
      [(ML3Track *)self->_track getValues:v11 forProperties:v12 count:v10];
    }
    else
    {
      v24 = self;
      for (uint64_t i = 0; i != v10; ++i)
      {
        v15 = objc_msgSend(v28, "objectAtIndex:", i, v24, v25);
        v12[i] = [v8 objectForKey:v15];
      }
      [(ML3Track *)v24->_track getValues:v11 forProperties:v12 count:v10];
      v16 = (uint64_t *)v11;
      v17 = v12;
      do
      {
        uint64_t v18 = *v16++;
        v19 = +[SBKUniversalPlaybackPositionMetadata SBKPropertyValueForML3PropertyValue:v18 ML3Property:*v17];
        uint64_t v20 = *v17++;
        v21 = [v9 objectForKey:v20];
        unsigned __int8 v29 = 0;
        v7[2](v7, v21, v19, &v29);
        int v22 = v29;

        if (v22) {
          BOOL v23 = 1;
        }
        else {
          BOOL v23 = v13 == 0;
        }
        --v13;
      }
      while (!v23);
    }
    free(v25);
    free(v12);

    v8 = v26;
    id v6 = v27;
  }
}

- (NSString)description
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = sub_10000C738();
  v5 = [v4 allKeys];
  id v6 = +[NSSet setWithArray:v5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000CB20;
  v12[3] = &unk_100020C88;
  id v13 = v3;
  id v7 = v3;
  [(SBDPlaybackPositionML3TrackMediaItem *)self enumerateValuesForProperties:v6 usingBlock:v12];

  v11.receiver = self;
  v11.super_class = (Class)SBDPlaybackPositionML3TrackMediaItem;
  v8 = [(SBDPlaybackPositionML3TrackMediaItem *)&v11 description];
  id v9 = +[NSString stringWithFormat:@"%@ properties = %@", v8, v7];

  return (NSString *)v9;
}

- (SBDPlaybackPositionML3TrackMediaItem)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDPlaybackPositionML3TrackMediaItem;
  id v7 = [(SBDPlaybackPositionML3TrackMediaItem *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_persistentID = a3;
    id v9 = (ML3Track *)[objc_alloc((Class)ML3Track) initWithPersistentID:a3 inLibrary:v6];
    track = v8->_track;
    v8->_track = v9;
  }
  return v8;
}

@end