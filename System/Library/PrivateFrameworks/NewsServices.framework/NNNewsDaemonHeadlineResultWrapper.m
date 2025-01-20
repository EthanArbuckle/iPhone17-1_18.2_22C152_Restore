@interface NNNewsDaemonHeadlineResultWrapper
- (NNNewsDaemonHeadlineResultWrapper)initWithResult:(id)a3 assetFileURLsByRemoteURL:(id)a4;
- (NSArray)sections;
- (NSDate)expirationDate;
- (unint64_t)headlineCount;
- (unint64_t)sync_headlineCount;
@end

@implementation NNNewsDaemonHeadlineResultWrapper

- (NNNewsDaemonHeadlineResultWrapper)initWithResult:(id)a3 assetFileURLsByRemoteURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)NNNewsDaemonHeadlineResultWrapper;
  v8 = [(NNNewsDaemonHeadlineResultWrapper *)&v34 init];
  v9 = v8;
  if (v8)
  {
    v27 = v8;
    v28 = v6;
    v10 = [v6 sections];
    v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      unint64_t v14 = 0;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v18 = [v17 items];
          id v19 = [v18 count];

          v20 = [[NNNewsDaemonHeadlineSectionWrapper alloc] initWithSection:v17 assetFileURLsByRemoteURL:v7];
          if (v20) {
            [v11 addObject:v20];
          }
          v14 += (unint64_t)v19;
        }
        id v13 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }
    else
    {
      unint64_t v14 = 0;
    }

    v9 = v27;
    v27->_headlineCount = v14;
    v21 = (NSArray *)[v11 copy];
    sections = v27->_sections;
    v27->_sections = v21;

    id v6 = v28;
    v23 = [v28 expirationDate];
    v24 = (NSDate *)[v23 copy];
    expirationDate = v27->_expirationDate;
    v27->_expirationDate = v24;
  }
  return v9;
}

- (unint64_t)sync_headlineCount
{
  return [(NNNewsDaemonHeadlineResultWrapper *)self headlineCount];
}

- (NSArray)sections
{
  return self->_sections;
}

- (unint64_t)headlineCount
{
  return self->_headlineCount;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end