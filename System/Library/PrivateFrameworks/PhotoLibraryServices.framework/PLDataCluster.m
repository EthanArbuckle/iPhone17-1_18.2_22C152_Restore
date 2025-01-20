@interface PLDataCluster
+ (id)clusterWithObjects:(id)a3;
+ (id)clusterWithObjects:(id)a3 clustroid:(id)a4 diameter:(double)a5;
- (NSArray)objects;
- (PLDataCluster)init;
- (double)diameter;
- (double)score;
- (id)approximateRegionWithMaximumRadius:(double)a3;
- (id)clustroid;
- (id)description;
- (id)locations;
- (id)meanRegion:(double)a3;
- (id)meanUniversalDate;
- (id)universalDates;
- (void)setClustroid:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setObjects:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation PLDataCluster

- (id)meanUniversalDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(PLDataCluster *)self universalDates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) timeIntervalSince1970];
        double v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  v10 = [(PLDataCluster *)self objects];
  double v11 = v7 / (double)(unint64_t)[v10 count];

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v11];
  return v12;
}

- (id)meanRegion:(double)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PLDataCluster *)self locations];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v5) {
    goto LABEL_46;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v55;
  double v9 = 0.0;
  double v10 = 0.0;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v55 != v8) {
        objc_enumerationMutation(v4);
      }
      v12 = *(void **)(*((void *)&v54 + 1) + 8 * v11);
      [v12 coordinate];
      double v14 = v13;
      double v16 = v15;
      uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      if (v12 == (void *)v17)
      {
      }
      else
      {
        v18 = (void *)v17;
        v62.latitude = v14;
        v62.longitude = v16;
        if (!CLLocationCoordinate2DIsValid(v62)) {
          goto LABEL_12;
        }
        BOOL v19 = v14 != 0.0;
        if (v16 != 0.0) {
          BOOL v19 = 1;
        }
        if (v19)
        {

          if (v14 != 40.0 || v16 != -100.0)
          {
            double v10 = v10 + v14;
            double v9 = v9 + v16;
            ++v7;
          }
        }
        else
        {
LABEL_12:
        }
      }
      ++v11;
    }
    while (v6 != v11);
    uint64_t v21 = [v4 countByEnumeratingWithState:&v54 objects:v59 count:16];
    uint64_t v6 = v21;
  }
  while (v21);
  if (v7)
  {
    double v22 = (double)v7;
    double v23 = v10 / (double)v7;
    double v24 = v9 / (double)v7;
    v49 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v23 longitude:v24];
    double v25 = 10.0;
    if (v7 != 1)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v26 = v4;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v51;
        double v30 = 0.0;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v26);
            }
            v32 = *(void **)(*((void *)&v50 + 1) + 8 * v31);
            [v32 coordinate];
            double v34 = v33;
            double v36 = v35;
            uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
            if (v32 == (void *)v37)
            {
            }
            else
            {
              v38 = (void *)v37;
              v63.latitude = v34;
              v63.longitude = v36;
              if (!CLLocationCoordinate2DIsValid(v63)) {
                goto LABEL_35;
              }
              BOOL v39 = v34 != 0.0;
              if (v36 != 0.0) {
                BOOL v39 = 1;
              }
              if (v39)
              {

                if (v34 != 40.0 || v36 != -100.0)
                {
                  [v49 distanceFromLocation:v32];
                  double v30 = v30 + v41;
                }
              }
              else
              {
LABEL_35:
              }
            }
            ++v31;
          }
          while (v28 != v31);
          uint64_t v42 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
          uint64_t v28 = v42;
        }
        while (v42);
      }
      else
      {
        double v30 = 0.0;
      }

      if (v30 / v22 >= a3) {
        double v25 = v30 / v22;
      }
      else {
        double v25 = a3;
      }
    }
    id v44 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    CLLocationCoordinate2D v45 = CLLocationCoordinate2DMake(v23, v24);
    v46 = [MEMORY[0x1E4F29128] UUID];
    v47 = [v46 UUIDString];
    v43 = objc_msgSend(v44, "initWithCenter:radius:identifier:", v47, v45.latitude, v45.longitude, v25);
  }
  else
  {
LABEL_46:
    v43 = 0;
  }

  return v43;
}

- (id)approximateRegionWithMaximumRadius:(double)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLDataClustering *)[PLDBSCANClustering alloc] initWithDistanceBlock:&__block_literal_global_91885];
  [(PLDataDensityClustering *)v5 setMaximumDistance:a3];
  [(PLDataDensityClustering *)v5 setMinimumNumberOfObjects:1];
  uint64_t v6 = [(PLDataCluster *)self objects];
  double v25 = v5;
  unint64_t v7 = [(PLDBSCANClustering *)v5 performWithDataset:v6 progressBlock:0];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = 0;
    uint64_t v11 = 0;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v14 = (void *)MEMORY[0x19F38D3B0]();
        double v15 = [v13 meanRegion:a3];
        if (v15)
        {
          if (!v11) {
            goto LABEL_9;
          }
          [v10 objects];
          double v16 = v27 = v10;
          unint64_t v17 = [v16 count];
          v18 = [v13 objects];
          BOOL v19 = v11;
          unint64_t v20 = [v18 count];

          double v10 = v27;
          BOOL v21 = v17 >= v20;
          uint64_t v11 = v19;
          if (!v21)
          {
LABEL_9:
            id v22 = v15;

            id v23 = v13;
            double v10 = v23;
            uint64_t v11 = v22;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    double v10 = 0;
    uint64_t v11 = 0;
  }

  return v11;
}

double __77__PLDataCluster_PLRegionsClusteringItem__approximateRegionWithMaximumRadius___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_msgSend(v5, "pl_coordinate");
  objc_msgSend(v4, "pl_coordinate");
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  CLLocationCoordinate2DGetDistanceFrom();
  double v9 = v8;
  double v10 = objc_msgSend(v5, "pl_date", v15, v16);

  uint64_t v11 = objc_msgSend(v4, "pl_date");

  [v10 timeIntervalSinceDate:v11];
  double v13 = fabs(v12) / 7200.0;

  return v9 + v13;
}

- (id)universalDates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(PLDataCluster *)self objects];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(PLDataCluster *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "pl_date");
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)locations
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(PLDataCluster *)self objects];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(PLDataCluster *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "pl_coordinate");
        double latitude = v24.latitude;
        double longitude = v24.longitude;
        if (CLLocationCoordinate2DIsValid(v24))
        {
          BOOL v13 = latitude != 0.0;
          if (longitude != 0.0) {
            BOOL v13 = 1;
          }
          if (v13 && (latitude != 40.0 || longitude != -100.0))
          {
            long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
            [v5 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clustroid, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setClustroid:(id)a3
{
}

- (id)clustroid
{
  return self->_clustroid;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setObjects:(id)a3
{
}

- (NSArray)objects
{
  return self->_objects;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@<%p> - count:%ld score:%lf", v5, self, -[NSArray count](self->_objects, "count"), *(void *)&self->_score];

  if (self->_diameter != 0.0) {
    objc_msgSend(v6, "appendFormat:", @" diameter:%lf", *(void *)&self->_diameter);
  }
  if (self->_clustroid) {
    [v6 appendFormat:@" clustroid:\"%@\"", self->_clustroid];
  }
  return v6;
}

- (PLDataCluster)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLDataCluster;
  v2 = [(PLDataCluster *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    objects = v2->_objects;
    v2->_objects = (NSArray *)v3;

    id clustroid = v2->_clustroid;
    v2->_diameter = 0.0;
    v2->_id clustroid = 0;

    v2->_score = 1.0;
  }
  return v2;
}

+ (id)clusterWithObjects:(id)a3
{
  return (id)[a1 clusterWithObjects:a3 clustroid:0 diameter:0.0];
}

+ (id)clusterWithObjects:(id)a3 clustroid:(id)a4 diameter:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_opt_class();
  uint64_t v9 = objc_opt_new();
  [v9 setObjects:v8];

  [v9 setDiameter:a5];
  [v9 setScore:1.0];
  [v9 setClustroid:v7];

  return v9;
}

@end