@interface PLAssetCluster
+ (id)mergedCluster:(id)a3;
+ (id)sortByTimeSortDescriptors;
- (CLLocation)location;
- (NSArray)assets;
- (NSDate)endDate;
- (NSDate)startDate;
- (PLAssetCluster)initWithAssetsSortedByDate:(id)a3 region:(id)a4;
- (id)description;
@end

@implementation PLAssetCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSArray)assets
{
  return self->_assets;
}

- (id)description
{
  [(CLLocation *)self->_location coordinate];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  v7 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetCluster;
  v8 = [(PLAssetCluster *)&v11 description];
  v9 = [v7 stringWithFormat:@"%@ start: %@, end %@, location {%.8f, %.8f}, assets %lu", v8, self->_startDate, self->_endDate, v4, v6, -[NSArray count](self->_assets, "count")];

  return v9;
}

- (PLAssetCluster)initWithAssetsSortedByDate:(id)a3 region:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLAssetCluster;
  v9 = [(PLAssetCluster *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_super v11 = [v7 firstObject];
    uint64_t v12 = [v11 dateCreated];
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v12;

    v14 = [v7 lastObject];
    uint64_t v15 = [v14 dateCreated];
    endDate = v10->_endDate;
    v10->_endDate = (NSDate *)v15;

    if (v8)
    {
      [v8 center];
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v17 longitude:v18];
      location = v10->_location;
      v10->_location = (CLLocation *)v19;
    }
  }

  return v10;
}

+ (id)sortByTimeSortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)mergedCluster:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 firstObject];
  if ((unint64_t)[v3 count] > 1)
  {
    uint64_t v6 = [v4 assets];
    id v7 = (void *)[v6 mutableCopy];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (v13 != v4)
          {
            v14 = objc_msgSend(v13, "assets", (void)v26);
            [v7 addObjectsFromArray:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    uint64_t v15 = [v8 firstObject];
    v16 = [v15 location];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1E5A8]);
      [v16 coordinate];
      double v19 = v18;
      double v21 = v20;
      objc_super v22 = [MEMORY[0x1E4F29128] UUID];
      v23 = [v22 UUIDString];
      v24 = objc_msgSend(v17, "initWithCenter:radius:identifier:", v23, v19, v21, 0.0);
    }
    else
    {
      v24 = 0;
    }
    uint64_t v5 = [[PLAssetCluster alloc] initWithAssetsSortedByDate:v7 region:v24];
  }
  else
  {
    uint64_t v5 = v4;
  }

  return v5;
}

@end