@interface _PSCluster
+ (BOOL)supportsSecureCoding;
- (BOOL)containsPoint:(id)a3;
- (NSMutableArray)convexHull;
- (NSMutableArray)points;
- (_PSCluster)init;
- (_PSCluster)initWithCoder:(id)a3;
- (_PSCluster)initWithPoints:(id)a3 andHull:(id)a4;
- (id)description;
- (id)pointAtIndex:(unint64_t)a3;
- (int)orientationOfPoints:(id)a3 and:(id)a4 and:(id)a5;
- (int64_t)compareByAnglePoint:(id)a3 andPoint:(id)a4 withRef:(id)a5;
- (unint64_t)count;
- (void)addPointToCluster:(id)a3;
- (void)clearCluster;
- (void)computeConvexHull;
- (void)encodeWithCoder:(id)a3;
- (void)setConvexHull:(id)a3;
- (void)setPoints:(id)a3;
- (void)sortArray:(id)a3;
@end

@implementation _PSCluster

- (_PSCluster)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PSCluster;
  v2 = [(_PSCluster *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    points = v2->_points;
    v2->_points = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    convexHull = v2->_convexHull;
    v2->_convexHull = (NSMutableArray *)v5;
  }
  return v2;
}

- (_PSCluster)initWithPoints:(id)a3 andHull:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSCluster;
  v9 = [(_PSCluster *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_points, a3);
    objc_storeStrong((id *)&v10->_convexHull, a4);
  }

  return v10;
}

- (unint64_t)count
{
  v2 = [(_PSCluster *)self points];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)pointAtIndex:(unint64_t)a3
{
  v4 = [(_PSCluster *)self points];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)addPointToCluster:(id)a3
{
  id v7 = a3;
  v4 = [(_PSCluster *)self points];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    v6 = [(_PSCluster *)self points];
    [v6 addObject:v7];
  }
}

- (void)clearCluster
{
  id v2 = [(_PSCluster *)self points];
  [v2 removeAllObjects];
}

- (BOOL)containsPoint:(id)a3
{
  id v4 = a3;
  char v5 = [(_PSCluster *)self points];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (int)orientationOfPoints:(id)a3 and:(id)a4 and:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v7 x];
  double v11 = v10;
  [v8 x];
  double v13 = v11 - v12;
  [v8 y];
  double v15 = v14;
  [v9 y];
  double v17 = v15 - v16;
  [v8 x];
  double v19 = v18;
  [v9 x];
  double v21 = v20;

  double v22 = v19 - v21;
  [v7 y];
  double v24 = v23;

  [v8 y];
  double v26 = v25;

  double v27 = v13 * v17 - v22 * (v24 - v26);
  if (v27 > 0.0) {
    return 1;
  }
  else {
    return 2 * (v27 < 0.0);
  }
}

- (int64_t)compareByAnglePoint:(id)a3 andPoint:(id)a4 withRef:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(_PSCluster *)self orientationOfPoints:v10 and:v8 and:v9];
  if (v11)
  {
    BOOL v12 = v11 == 2;
  }
  else
  {
    [v10 euclideanDistanceToPoint:v9];
    double v14 = v13;
    [v10 euclideanDistanceToPoint:v8];
    BOOL v12 = v14 - v15 > -2.22044605e-16;
  }
  if (v12) {
    int64_t v16 = -1;
  }
  else {
    int64_t v16 = 1;
  }

  return v16;
}

- (void)sortArray:(id)a3
{
  id v4 = a3;
  char v5 = [v4 objectAtIndexedSubscript:0];
  char v6 = (void *)[v4 mutableCopy];
  [v6 removeObjectAtIndex:0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __24___PSCluster_sortArray___block_invoke;
  double v13 = &unk_1E5AE03B8;
  double v14 = self;
  id v7 = v5;
  id v15 = v7;
  [v6 sortUsingComparator:&v10];
  if (objc_msgSend(v6, "count", v10, v11, v12, v13, v14))
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v6 objectAtIndexedSubscript:v8];
      [v4 setObject:v9 atIndexedSubscript:++v8];
    }
    while (v8 < [v6 count]);
  }
}

- (void)computeConvexHull
{
  id v2 = self;
  unint64_t v3 = [(_PSCluster *)self convexHull];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    char v5 = [(_PSCluster *)v2 convexHull];
    [v5 removeAllObjects];
  }
  char v6 = [(_PSCluster *)v2 points];
  unint64_t v7 = [v6 count];

  if (v7 >= 3)
  {
    unint64_t v8 = [(_PSCluster *)v2 points];
    uint64_t v9 = [v8 count];

    v70 = v2;
    if (v9)
    {
      unint64_t v68 = 0;
      unint64_t v10 = 0;
      double v11 = 1.79769313e308;
      while (1)
      {
        BOOL v12 = [(_PSCluster *)v2 points];
        double v13 = [v12 objectAtIndexedSubscript:v10];
        [v13 y];
        if (v11 - v14 > 2.22044605e-16)
        {
        }
        else
        {
          id v15 = [(_PSCluster *)v2 points];
          int64_t v16 = [v15 objectAtIndexedSubscript:v10];
          [v16 y];
          if (vabdd_f64(v17, v11) >= 2.22044605e-16)
          {

            goto LABEL_13;
          }
          double v18 = [(_PSCluster *)v2 points];
          double v19 = [v18 objectAtIndexedSubscript:v68];
          [v19 x];
          double v21 = v20;
          double v22 = [(_PSCluster *)v70 points];
          double v23 = [v22 objectAtIndexedSubscript:v10];
          [v23 x];
          double v25 = v21 - v24;

          id v2 = v70;
          if (v25 <= 2.22044605e-16) {
            goto LABEL_14;
          }
        }
        BOOL v12 = [(_PSCluster *)v2 points];
        double v13 = [v12 objectAtIndexedSubscript:v10];
        [v13 y];
        double v11 = v26;
        unint64_t v68 = v10;
LABEL_13:

LABEL_14:
        ++v10;
        double v27 = [(_PSCluster *)v2 points];
        unint64_t v28 = [v27 count];

        if (v10 >= v28) {
          goto LABEL_17;
        }
      }
    }
    unint64_t v68 = 0;
LABEL_17:
    v29 = [(_PSCluster *)v2 points];
    [v29 exchangeObjectAtIndex:0 withObjectAtIndex:v68];

    v30 = [(_PSCluster *)v2 points];
    [(_PSCluster *)v2 sortArray:v30];

    id v66 = [MEMORY[0x1E4F1CA48] array];
    v31 = [NSNumber numberWithInteger:0];
    [v66 addObject:v31];

    v32 = [(_PSCluster *)v2 points];
    unint64_t v33 = [v32 count];

    if (v33 >= 2)
    {
      unint64_t v34 = 1;
      unint64_t v35 = 1;
      do
      {
        unint64_t v67 = v35;
        v36 = [(_PSCluster *)v2 points];
        if (v34 >= [v36 count] - 1)
        {
LABEL_22:

          unint64_t v41 = v34 + 1;
        }
        else
        {
          while (1)
          {
            v69 = [(_PSCluster *)v2 points];
            v37 = [v69 objectAtIndexedSubscript:0];
            v38 = [(_PSCluster *)v2 points];
            v39 = [v38 objectAtIndexedSubscript:v34];
            v40 = [(_PSCluster *)v2 points];
            unint64_t v41 = v34 + 1;
            v42 = [v40 objectAtIndexedSubscript:v34 + 1];
            int v43 = [(_PSCluster *)v2 orientationOfPoints:v37 and:v39 and:v42];

            if (v43) {
              break;
            }
            v36 = [(_PSCluster *)v2 points];
            ++v34;
            if (v41 >= [v36 count] - 1) {
              goto LABEL_22;
            }
          }
        }
        v44 = [(_PSCluster *)v2 points];
        [v44 exchangeObjectAtIndex:v67 withObjectAtIndex:v34];

        unint64_t v35 = v67 + 1;
        v45 = [(_PSCluster *)v2 points];
        unint64_t v46 = [v45 count];

        unint64_t v34 = v41;
      }
      while (v41 < v46);
      if (v35 >= 3)
      {
        for (uint64_t i = 0; i != 3; ++i)
        {
          v48 = [(_PSCluster *)v2 convexHull];
          v49 = [(_PSCluster *)v2 points];
          v50 = [v49 objectAtIndexedSubscript:i];
          [v48 addObject:v50];
        }
        if (v35 >= 4)
        {
          uint64_t v51 = 3;
          do
          {
            while (1)
            {
              v52 = [(_PSCluster *)v2 convexHull];
              v53 = [(_PSCluster *)v2 convexHull];
              v54 = objc_msgSend(v52, "objectAtIndexedSubscript:", objc_msgSend(v53, "count") - 2);
              v55 = [(_PSCluster *)v2 convexHull];
              v56 = [(_PSCluster *)v2 convexHull];
              v57 = objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v56, "count") - 1);
              v58 = [(_PSCluster *)v2 points];
              v59 = [v58 objectAtIndexedSubscript:v51];
              int v60 = [(_PSCluster *)v70 orientationOfPoints:v54 and:v57 and:v59];

              id v2 = v70;
              v61 = [(_PSCluster *)v70 convexHull];
              v62 = v61;
              if (v60 == 2) {
                break;
              }
              [v61 removeLastObject];
            }
            v63 = [(_PSCluster *)v70 points];
            v64 = [v63 objectAtIndexedSubscript:v51];
            [v62 addObject:v64];
          }
          while (v51++ != v67);
        }
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(_PSCluster *)self points];
  char v6 = NSStringFromSelector(sel_points);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(_PSCluster *)self convexHull];
  unint64_t v7 = NSStringFromSelector(sel_convexHull);
  [v4 encodeObject:v8 forKey:v7];
}

- (_PSCluster)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  double v11 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  BOOL v12 = NSStringFromSelector(sel_points);
  double v13 = [v5 decodeObjectOfClasses:v11 forKey:v12];

  double v14 = NSStringFromSelector(sel_convexHull);
  id v15 = [v5 decodeObjectOfClasses:v11 forKey:v14];

  int64_t v16 = [(_PSCluster *)self initWithPoints:v13 andHull:v15];
  return v16;
}

- (id)description
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = NSString;
  id v4 = NSNumber;
  id v5 = [(_PSCluster *)self points];
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [(_PSCluster *)self convexHull];
  uint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  uint64_t v10 = [v3 stringWithFormat:@"Points, convex hulls:<%@ %@>", v6, v9];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v37 = self;
  id obj = [(_PSCluster *)self points];
  uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    do
    {
      uint64_t v14 = 0;
      id v15 = v10;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        int64_t v16 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        double v17 = NSString;
        double v18 = NSNumber;
        [v16 x];
        double v19 = objc_msgSend(v18, "numberWithDouble:");
        double v20 = NSNumber;
        [v16 y];
        double v21 = objc_msgSend(v20, "numberWithDouble:");
        double v22 = [v17 stringWithFormat:@"<%@ %@>", v19, v21];
        uint64_t v10 = [v15 stringByAppendingString:v22];

        ++v14;
        id v15 = v10;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v12);
  }

  double v23 = [v10 stringByAppendingString:@","];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obja = [(_PSCluster *)v37 convexHull];
  uint64_t v24 = [obja countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      uint64_t v27 = 0;
      unint64_t v28 = v23;
      do
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(obja);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * v27);
        v30 = NSString;
        v31 = NSNumber;
        [v29 x];
        v32 = objc_msgSend(v31, "numberWithDouble:");
        unint64_t v33 = NSNumber;
        [v29 y];
        unint64_t v34 = objc_msgSend(v33, "numberWithDouble:");
        unint64_t v35 = [v30 stringWithFormat:@"<%@ %@>", v32, v34];
        double v23 = [v28 stringByAppendingString:v35];

        ++v27;
        unint64_t v28 = v23;
      }
      while (v25 != v27);
      uint64_t v25 = [obja countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v25);
  }

  return v23;
}

- (NSMutableArray)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
}

- (NSMutableArray)convexHull
{
  return self->_convexHull;
}

- (void)setConvexHull:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convexHull, 0);

  objc_storeStrong((id *)&self->_points, 0);
}

@end