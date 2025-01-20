@interface PLExistingMomentData
- (BOOL)isEqual:(id)a3;
- (NSCopying)objectID;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)dateInterval;
- (PLExistingMomentData)initWithMoment:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfAssets;
- (void)registerAsset:(id)a3;
@end

@implementation PLExistingMomentData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (NSCopying)objectID
{
  return self->_objectID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLExistingMomentData *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objectID = self->_objectID;
      v6 = [(PLExistingMomentData *)v4 objectID];
      char v7 = [(NSCopying *)objectID isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSCopying *)self->_objectID hash];
}

- (void)registerAsset:(id)a3
{
}

- (PLExistingMomentData)initWithMoment:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueObjectID];
  v6 = [v4 startDate];
  char v7 = [v4 endDate];

  v8 = 0;
  if (v5 && v6 && v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)PLExistingMomentData;
    v9 = [(PLExistingMomentData *)&v14 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_objectID, v5);
      objc_storeStrong((id *)&v10->_startDate, v6);
      objc_storeStrong((id *)&v10->_endDate, v7);
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10->_startDate endDate:v10->_endDate];
      dateInterval = v10->_dateInterval;
      v10->_dateInterval = (NSDateInterval *)v11;
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

@end