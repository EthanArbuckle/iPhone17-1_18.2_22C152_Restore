@interface PGChapterTitle
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)chapterDateInterval;
- (NSString)localizedTitleString;
- (PGChapterTitle)initWithLocalizedTitleString:(id)a3 chapterDateInterval:(id)a4;
- (id)dictionaryRepresentation;
@end

@implementation PGChapterTitle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterDateInterval, 0);
  objc_storeStrong((id *)&self->_localizedTitleString, 0);
}

- (NSDateInterval)chapterDateInterval
{
  return self->_chapterDateInterval;
}

- (NSString)localizedTitleString
{
  return self->_localizedTitleString;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PGChapterTitle *)self localizedTitleString];
  [v3 setObject:v4 forKeyedSubscript:@"title"];

  v5 = [(PGChapterTitle *)self chapterDateInterval];
  v6 = [v5 startDate];
  [v3 setObject:v6 forKeyedSubscript:@"startDate"];

  v7 = [(PGChapterTitle *)self chapterDateInterval];
  v8 = [v7 endDate];
  [v3 setObject:v8 forKeyedSubscript:@"endDate"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGChapterTitle *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      chapterDateInterval = self->_chapterDateInterval;
      v9 = [(PGChapterTitle *)v7 chapterDateInterval];
      if ([(NSDateInterval *)chapterDateInterval isEqualToDateInterval:v9])
      {
        localizedTitleString = self->_localizedTitleString;
        v11 = [(PGChapterTitle *)v7 localizedTitleString];
        char v6 = [(NSString *)localizedTitleString isEqualToString:v11];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (PGChapterTitle)initWithLocalizedTitleString:(id)a3 chapterDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGChapterTitle;
  v8 = [(PGChapterTitle *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localizedTitleString = v8->_localizedTitleString;
    v8->_localizedTitleString = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    chapterDateInterval = v8->_chapterDateInterval;
    v8->_chapterDateInterval = (NSDateInterval *)v11;
  }
  return v8;
}

@end