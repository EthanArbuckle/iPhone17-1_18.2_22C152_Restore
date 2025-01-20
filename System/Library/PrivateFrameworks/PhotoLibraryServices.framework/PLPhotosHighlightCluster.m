@interface PLPhotosHighlightCluster
- (NSCopying)objectID;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)assets;
- (NSSet)moments;
- (PLPhotosHighlightCluster)initWithMoments:(id)a3;
- (int)endTimeZoneOffset;
- (int)startTimeZoneOffset;
- (unsigned)category;
- (unsigned)kind;
- (unsigned)type;
- (void)_calculatePropertyValues;
- (void)setAssets:(id)a3;
- (void)setCategory:(unsigned __int16)a3;
- (void)setEndDate:(id)a3;
- (void)setEndTimeZoneOffset:(int)a3;
- (void)setKind:(unsigned __int16)a3;
- (void)setMoments:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartTimeZoneOffset:(int)a3;
- (void)setType:(unsigned __int16)a3;
@end

@implementation PLPhotosHighlightCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

- (NSCopying)objectID
{
  return self->_objectID;
}

- (void)setEndTimeZoneOffset:(int)a3
{
  self->_endTimeZoneOffset = a3;
}

- (int)endTimeZoneOffset
{
  return self->_endTimeZoneOffset;
}

- (void)setStartTimeZoneOffset:(int)a3
{
  self->_startTimeZoneOffset = a3;
}

- (int)startTimeZoneOffset
{
  return self->_startTimeZoneOffset;
}

- (void)setKind:(unsigned __int16)a3
{
  self->_kind = a3;
}

- (unsigned)kind
{
  return self->_kind;
}

- (void)setCategory:(unsigned __int16)a3
{
  self->_category = a3;
}

- (unsigned)category
{
  return self->_category;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setEndDate:(id)a3
{
}

- (void)setStartDate:(id)a3
{
}

- (void)setAssets:(id)a3
{
}

- (NSSet)moments
{
  return self->_moments;
}

- (void)_calculatePropertyValues
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(PLPhotosHighlightCluster *)self moments];
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = 0;
    int v20 = 0;
    v5 = 0;
    v6 = 0;
    uint64_t v7 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = [v9 startDate];
        v11 = [v9 endDate];
        if (!v6 || [v10 compare:v6] == -1)
        {
          v12 = v10;

          int v20 = [v9 timeZoneOffset];
          v6 = v12;
          if (v5)
          {
LABEL_11:
            if ([v11 compare:v5] != 1) {
              goto LABEL_13;
            }
          }
        }
        else if (v5)
        {
          goto LABEL_11;
        }
        v13 = v11;

        int v4 = [v9 timeZoneOffset];
        v5 = v13;
LABEL_13:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v3) {
        goto LABEL_17;
      }
    }
  }
  int v4 = 0;
  int v20 = 0;
  v5 = 0;
  v6 = 0;
LABEL_17:

  startDate = self->_startDate;
  self->_startDate = v6;
  v15 = v6;

  endDate = self->_endDate;
  self->_endDate = v5;
  v17 = v5;

  self->_startTimeZoneOffset = v20;
  self->_endTimeZoneOffset = v4;
}

- (NSSet)assets
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  assets = self->_assets;
  if (!assets)
  {
    int v4 = [MEMORY[0x1E4F1CA80] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(PLPhotosHighlightCluster *)self moments];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) assets];
          [v4 unionSet:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = (NSSet *)[v4 copy];
    v12 = self->_assets;
    self->_assets = v11;

    assets = self->_assets;
  }
  return assets;
}

- (NSDate)endDate
{
  endDate = self->_endDate;
  if (!endDate)
  {
    [(PLPhotosHighlightCluster *)self _calculatePropertyValues];
    endDate = self->_endDate;
  }
  return endDate;
}

- (NSDate)startDate
{
  startDate = self->_startDate;
  if (!startDate)
  {
    [(PLPhotosHighlightCluster *)self _calculatePropertyValues];
    startDate = self->_startDate;
  }
  return startDate;
}

- (void)setMoments:(id)a3
{
  v5 = (NSSet *)a3;
  if (self->_moments != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_moments, a3);
    assets = self->_assets;
    self->_assets = 0;

    startDate = self->_startDate;
    self->_startDate = 0;

    endDate = self->_endDate;
    self->_endDate = 0;

    v5 = v9;
  }
}

- (PLPhotosHighlightCluster)initWithMoments:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotosHighlightCluster;
  uint64_t v6 = [(PLPhotosHighlightCluster *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_moments, a3);
    *(_DWORD *)&v7->_category = 0;
  }

  return v7;
}

@end