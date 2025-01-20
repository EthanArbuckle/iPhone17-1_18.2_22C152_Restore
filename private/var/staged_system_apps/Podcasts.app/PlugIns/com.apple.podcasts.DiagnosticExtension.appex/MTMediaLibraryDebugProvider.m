@interface MTMediaLibraryDebugProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation MTMediaLibraryDebugProvider

- (id)debugData
{
  v2 = +[MPMediaQuery mt_allItemsForPodcastsApp];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = objc_alloc_init((Class)NSMutableDictionary);
        v10 = +[MTMLMediaItem propertiesForMediaItem];
        v11 = +[NSSet setWithArray:v10];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000050D0;
        v17[3] = &unk_1000083A8;
        id v18 = v9;
        id v12 = v9;
        [v8 enumerateValuesForProperties:v11 usingBlock:v17];

        [v3 addObject:v12];
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  v13 = +[IMJSONUtil toJSONString:v3];
  v14 = [v13 dataUsingEncoding:4];

  return v14;
}

- (id)debugDataFileName
{
  return @"MediaLibrary.json";
}

@end