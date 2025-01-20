@interface TVPChapterCollection
- (BOOL)shouldDisplayChapterMarkers;
- (BOOL)shouldShowDescriptionOnChapterSkip;
- (BOOL)shouldStartPlaybackFromStartDate;
- (NSArray)chapters;
- (NSDate)startDate;
- (NSString)name;
- (NSURL)refreshURL;
- (TVPChapterCollection)init;
- (double)refreshInterval;
- (id)backingData;
- (id)chapterForDate:(id)a3;
- (id)chapterForTime:(double)a3;
- (id)nearestChapterForDate:(id)a3;
- (id)nearestChapterForTime:(double)a3;
- (int64_t)type;
- (void)setBackingData:(id)a3;
- (void)setChapters:(id)a3;
- (void)setName:(id)a3;
- (void)setRefreshInterval:(double)a3;
- (void)setRefreshURL:(id)a3;
- (void)setShouldDisplayChapterMarkers:(BOOL)a3;
- (void)setShouldShowDescriptionOnChapterSkip:(BOOL)a3;
- (void)setShouldStartPlaybackFromStartDate:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation TVPChapterCollection

- (TVPChapterCollection)init
{
  v3.receiver = self;
  v3.super_class = (Class)TVPChapterCollection;
  result = [(TVPChapterCollection *)&v3 init];
  if (result) {
    result->_shouldDisplayChapterMarkers = 1;
  }
  return result;
}

- (id)chapterForTime:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(TVPChapterCollection *)self chapters];
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 timeRange];
        int v10 = [v9 containsTime:a3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)nearestChapterForTime:(double)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v4 = [(TVPChapterCollection *)self chapters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v25;
    double v9 = *(double *)"";
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v12 = [v11 timeRange];
        if ([v12 containsTime:a3])
        {
          id v22 = v11;

          v7 = v22;
          goto LABEL_24;
        }
        [v12 startTime];
        double v14 = v13 - a3;
        if (v14 >= 0.0) {
          double v15 = v14;
        }
        else {
          double v15 = -v14;
        }
        if (v15 >= v9)
        {
          double v15 = v9;
        }
        else
        {
          id v16 = v11;

          v7 = v16;
        }
        [v12 startTime];
        double v18 = v17;
        [v12 duration];
        double v20 = v18 + v19 - a3;
        if (v20 >= 0.0) {
          double v9 = v20;
        }
        else {
          double v9 = -v20;
        }
        if (v9 >= v15)
        {
          double v9 = v15;
        }
        else
        {
          id v21 = v11;

          v7 = v21;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_24:

  return v7;
}

- (id)chapterForDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(TVPChapterCollection *)self chapters];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = [v9 dateRange];
        int v11 = [v10 containsDate:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)nearestChapterForDate:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [(TVPChapterCollection *)self chapters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v26;
    double v10 = *(double *)"";
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v13 = [v12 dateRange];
        if ([v13 containsDate:v4])
        {
          id v23 = v12;

          uint64_t v8 = v23;
          goto LABEL_25;
        }
        if (v13)
        {
          long long v14 = [v13 startDate];
          [v14 timeIntervalSinceDate:v4];
          double v16 = v15;

          if (v16 >= 0.0) {
            double v17 = v16;
          }
          else {
            double v17 = -v16;
          }
          if (v17 >= v10)
          {
            double v17 = v10;
          }
          else
          {
            id v18 = v12;

            uint64_t v8 = v18;
          }
          double v19 = [v13 endDate];
          [v19 timeIntervalSinceDate:v4];
          double v21 = v20;

          if (v21 >= 0.0) {
            double v10 = v21;
          }
          else {
            double v10 = -v21;
          }
          if (v10 >= v17)
          {
            double v10 = v17;
          }
          else
          {
            id v22 = v12;

            uint64_t v8 = v22;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_25:

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (void)setChapters:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)backingData
{
  return self->_backingData;
}

- (void)setBackingData:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)shouldStartPlaybackFromStartDate
{
  return self->_shouldStartPlaybackFromStartDate;
}

- (void)setShouldStartPlaybackFromStartDate:(BOOL)a3
{
  self->_shouldStartPlaybackFromStartDate = a3;
}

- (BOOL)shouldDisplayChapterMarkers
{
  return self->_shouldDisplayChapterMarkers;
}

- (void)setShouldDisplayChapterMarkers:(BOOL)a3
{
  self->_shouldDisplayChapterMarkers = a3;
}

- (BOOL)shouldShowDescriptionOnChapterSkip
{
  return self->_shouldShowDescriptionOnChapterSkip;
}

- (void)setShouldShowDescriptionOnChapterSkip:(BOOL)a3
{
  self->_shouldShowDescriptionOnChapterSkip = a3;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (NSURL)refreshURL
{
  return self->_refreshURL;
}

- (void)setRefreshURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshURL, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_backingData, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end