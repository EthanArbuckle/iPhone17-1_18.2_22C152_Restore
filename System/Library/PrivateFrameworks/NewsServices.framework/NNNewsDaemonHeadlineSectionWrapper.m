@interface NNNewsDaemonHeadlineSectionWrapper
- (NNNewsDaemonHeadlineSectionWrapper)initWithSection:(id)a3 assetFileURLsByRemoteURL:(id)a4;
- (NSArray)headlines;
- (NSArray)sync_headlines;
- (NSString)sync_colorHexString;
- (NSString)sync_identifier;
- (NSString)sync_name;
- (NTSection)section;
- (unint64_t)sync_type;
@end

@implementation NNNewsDaemonHeadlineSectionWrapper

- (NNNewsDaemonHeadlineSectionWrapper)initWithSection:(id)a3 assetFileURLsByRemoteURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)NNNewsDaemonHeadlineSectionWrapper;
  v8 = [(NNNewsDaemonHeadlineSectionWrapper *)&v28 init];
  if (v8)
  {
    v9 = (NTSection *)[v6 copy];
    section = v8->_section;
    v8->_section = v9;

    v11 = [v6 items];
    v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v17);
          v19 = [NNNewsDaemonHeadlineHeadlineWrapper alloc];
          v20 = -[NNNewsDaemonHeadlineHeadlineWrapper initWithHeadline:assetFileURLsByRemoteURL:](v19, "initWithHeadline:assetFileURLsByRemoteURL:", v18, v7, (void)v24);
          if (v20) {
            [v12 addObject:v20];
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v15);
    }

    v21 = (NSArray *)[v12 copy];
    headlines = v8->_headlines;
    v8->_headlines = v21;
  }
  return v8;
}

- (NSString)sync_identifier
{
  v2 = [(NNNewsDaemonHeadlineSectionWrapper *)self section];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)sync_name
{
  v2 = [(NNNewsDaemonHeadlineSectionWrapper *)self section];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)sync_type
{
  return 0;
}

- (NSString)sync_colorHexString
{
  v2 = [(NNNewsDaemonHeadlineSectionWrapper *)self section];
  v3 = [v2 nameColorLight];

  return (NSString *)v3;
}

- (NSArray)sync_headlines
{
  return [(NNNewsDaemonHeadlineSectionWrapper *)self headlines];
}

- (NTSection)section
{
  return self->_section;
}

- (NSArray)headlines
{
  return self->_headlines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlines, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end