@interface PLRegionsAgglomerativeClusteringDataCluster
+ (id)dataClusterWithDataVector:(id)a3;
+ (id)mergedClusterFrom:(id)a3;
- (NSArray)vectors;
- (PLRegionsAgglomerativeClusteringDataCluster)initWithDataVector:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (double)score;
- (id)description;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setRadius:(double)a3;
- (void)setScore:(double)a3;
@end

@implementation PLRegionsAgglomerativeClusteringDataCluster

- (void).cxx_destruct
{
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (NSArray)vectors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%d points, latitude = %f, longitude = %f, radius = %f, score = %f", -[NSArray count](self->_vectors, "count"), *(void *)&self->_latitude, *(void *)&self->_longitude, *(void *)&self->_radius, *(void *)&self->_score];
}

- (double)score
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double result = self->_score;
  if (result < 0.0)
  {
    self->_score = 0.0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = self->_vectors;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v10 = *(double *)objc_msgSend(v9, "data", (void)v13) - self->_latitude;
          double v11 = *(double *)[v9 data] - self->_latitude;
          double v12 = *(double *)([v9 data] + 8) - self->_longitude;
          self->_score = self->_score + v12 * (*(double *)([v9 data] + 8) - self->_longitude) + v10 * v11;
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    return self->_score;
  }
  return result;
}

- (PLRegionsAgglomerativeClusteringDataCluster)initWithDataVector:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRegionsAgglomerativeClusteringDataCluster;
  uint64_t v5 = [(PLRegionsAgglomerativeClusteringDataCluster *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
    vectors = v5->_vectors;
    v5->_vectors = (NSArray *)v6;

    v5->_latitude = *(double *)[v4 data];
    v5->_longitude = *(double *)([v4 data] + 8);
    *(_OWORD *)&v5->_radius = xmmword_19BA99FA0;
  }

  return v5;
}

+ (id)mergedClusterFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(PLRegionsAgglomerativeClusteringDataCluster);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    double v10 = 1.0e100;
    double v11 = -1.0e100;
    double v12 = -1.0e100;
    double v13 = 1.0e100;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", *(void *)(v15 + 8), (void)v24);
        double v17 = *(double *)(v15 + 24);
        double v16 = *(double *)(v15 + 32);
        double v18 = *(double *)(v15 + 16);
        if (v18 - v16 < v13) {
          double v13 = v18 - v16;
        }
        double v19 = v18 + v16;
        if (v19 > v12) {
          double v12 = v19;
        }
        if (v17 - v16 < v10) {
          double v10 = v17 - v16;
        }
        double v20 = v16 + v17;
        if (v20 > v11) {
          double v11 = v20;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 1.0e100;
    double v11 = -1.0e100;
    double v12 = -1.0e100;
    double v13 = 1.0e100;
  }

  vectors = v4->_vectors;
  v4->_vectors = v5;

  double v22 = v12 - v13;
  if (v12 - v13 < v11 - v10) {
    double v22 = v11 - v10;
  }
  v4->_latitude = (v12 + v13) * 0.5;
  v4->_longitude = (v11 + v10) * 0.5;
  v4->_radius = v22 * 0.5;
  v4->_score = -1.0;

  return v4;
}

+ (id)dataClusterWithDataVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDataVector:v4];

  return v5;
}

@end