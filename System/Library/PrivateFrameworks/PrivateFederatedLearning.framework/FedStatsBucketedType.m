@interface FedStatsBucketedType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
- (FedStatsBucketedType)initWithBucketBoundaries:(id)a3;
- (FedStatsBucketedType)initWithMinValue:(id)a3 maxValue:(id)a4 bucketCount:(id)a5;
- (NSArray)bucketBoundaries;
- (NSNumber)bucketCount;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (NSNumber)stepSize;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)indexToInterval:(id)a3;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (int64_t)version;
- (unint64_t)classCount;
- (void)setBucketBoundaries:(id)a3;
- (void)setBucketCount:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setStepSize:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation FedStatsBucketedType

- (FedStatsBucketedType)initWithBucketBoundaries:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FedStatsBucketedType;
  v5 = -[FedStatsBoundedULongType initWithBound:](&v13, sel_initWithBound_, [v4 count]);
  v6 = v5;
  if (v5)
  {
    minValue = v5->_minValue;
    v5->_minValue = 0;

    maxValue = v6->_maxValue;
    v6->_maxValue = 0;

    bucketCount = v6->_bucketCount;
    v6->_bucketCount = 0;

    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
    bucketBoundaries = v6->_bucketBoundaries;
    v6->_bucketBoundaries = (NSArray *)v10;

    v6->_version = 1;
  }

  return v6;
}

- (FedStatsBucketedType)initWithMinValue:(id)a3 maxValue:(id)a4 bucketCount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)FedStatsBucketedType;
  v12 = -[FedStatsBoundedULongType initWithBound:](&v25, sel_initWithBound_, [v11 unsignedLongValue] + 1);
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_minValue, a3);
    objc_storeStrong((id *)&v13->_maxValue, a4);
    objc_storeStrong((id *)&v13->_bucketCount, a5);
    v14 = NSNumber;
    [v10 floatValue];
    float v16 = v15;
    [v9 floatValue];
    float v18 = v16 - v17;
    [v11 floatValue];
    *(float *)&double v20 = v18 / v19;
    uint64_t v21 = [v14 numberWithFloat:v20];
    stepSize = v13->_stepSize;
    v13->_stepSize = (NSNumber *)v21;

    bucketBoundaries = v13->_bucketBoundaries;
    v13->_bucketBoundaries = 0;

    v13->_version = 2;
  }

  return v13;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 objectForKey:@"bucketBoundaries"];
  v8 = [v6 objectForKey:@"minValue"];
  id v9 = [v6 objectForKey:@"maxValue"];
  id v10 = [v6 objectForKey:@"bucketCount"];
  id v11 = v10;
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v14 = !v12 && v10 != 0;
  if ((((v7 != 0) ^ v14) & 1) == 0)
  {
    if (!a4) {
      goto LABEL_37;
    }
    uint64_t v21 = [NSString stringWithFormat:@"You can either have \"%@\" or the triple (\"%@\",\"%@\",\"%@\", not all"), @"bucketBoundaries", @"minValue", @"maxValue", @"bucketCount"];
    uint64_t v22 = 301;
    goto LABEL_35;
  }
  if (!v7)
  {
    [v10 floatValue];
    if (v24 == (float)(int)[v11 intValue])
    {
      v42 = (objc_class *)a1;
      int v25 = [v11 unsignedIntValue];
      if (v25 == [v11 intValue])
      {
        if ([v11 unsignedIntValue])
        {
          [v8 floatValue];
          float v27 = v26;
          [v9 floatValue];
          if (v27 >= v28)
          {
            [NSString stringWithFormat:@"The value of \"%@\" must be less than the value of \"%@\", @"minValue", @"maxValue""];
            goto LABEL_49;
          }
          v29 = (id *)[[v42 alloc] initWithMinValue:v8 maxValue:v9 bucketCount:v11];
          goto LABEL_45;
        }
      }
    }
    if (!a4) {
      goto LABEL_37;
    }
    uint64_t v21 = [NSString stringWithFormat:@"The value of \"%@\" must be a positive integer", @"bucketCount"];
    uint64_t v22 = 302;
LABEL_35:
    *a4 = +[FedStatsError errorWithCode:v22 description:v21];

LABEL_36:
    a4 = 0;
    goto LABEL_37;
  }
  v41 = (objc_class *)a1;
  v43 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v43)
          {
            v23 = [NSString stringWithFormat:@"The item \"%@\" in the list for \"%@\" is not a number", v20, @"bucketBoundaries"];
            id *v43 = +[FedStatsError errorWithCode:302 description:v23];
          }
          a4 = 0;
          goto LABEL_37;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  if ((unint64_t)[v15 count] < 2)
  {
    a4 = v43;
    if (!v43) {
      goto LABEL_37;
    }
    [NSString stringWithFormat:@"You must have at least 2 elements for \"%@\", @"bucketBoundaries"", v40];
    goto LABEL_49;
  }
  a4 = v43;
  if ((unint64_t)[v15 count] < 2)
  {
LABEL_44:
    v29 = (id *)[[v41 alloc] initWithBucketBoundaries:v15];
LABEL_45:
    a4 = v29;
    goto LABEL_37;
  }
  unint64_t v31 = 1;
  while (1)
  {
    v32 = [v15 objectAtIndexedSubscript:v31];
    [v32 floatValue];
    float v34 = v33;
    unint64_t v35 = v31 - 1;
    v36 = [v15 objectAtIndexedSubscript:v35];
    [v36 floatValue];
    float v38 = v37;

    if (v34 <= v38) {
      break;
    }
    unint64_t v31 = v35 + 2;
    if ([v15 count] <= v31) {
      goto LABEL_44;
    }
  }
  if (v43)
  {
    [NSString stringWithFormat:@"The entries for \"%@\" must be monotonically increasing", @"bucketBoundaries", v40];
    v39 = LABEL_49:;
    *a4 = +[FedStatsError errorWithCode:302 description:v39];

    goto LABEL_36;
  }
LABEL_37:

  return a4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if (v8) {
    goto LABEL_2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      uint64_t v18 = @"The encoder can only work with a number type";
      uint64_t v19 = 401;
LABEL_18:
      +[FedStatsError errorWithCode:v19 description:v18];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_19:
    id v9 = 0;
    goto LABEL_32;
  }
  [v6 floatValue];
  float v11 = v10;
  if ([(FedStatsBucketedType *)self version] == 1)
  {
    BOOL v12 = [(FedStatsBucketedType *)self bucketBoundaries];
    objc_super v13 = [v12 firstObject];
    [v13 floatValue];
    if (v11 < v14)
    {
LABEL_8:

LABEL_2:
      id v9 = &unk_26D0B51C8;
      goto LABEL_32;
    }
    id v15 = [(FedStatsBucketedType *)self bucketBoundaries];
    uint64_t v16 = [v15 lastObject];
    [v16 floatValue];
    if (v11 > v17)
    {

      goto LABEL_8;
    }

    float v27 = [(FedStatsBucketedType *)self bucketBoundaries];
    float v28 = [v27 lastObject];
    [v28 floatValue];
    float v30 = v29;

    if (v11 == v30)
    {
      unint64_t v31 = NSNumber;
      v32 = [(FedStatsBucketedType *)self bucketBoundaries];
      id v9 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "count") - 1);

      goto LABEL_32;
    }
    float v38 = [(FedStatsBucketedType *)self bucketBoundaries];
    unint64_t v39 = [v38 count] - 1;

    if (v39 >= 2)
    {
      unint64_t v40 = 0;
      do
      {
        v41 = [(FedStatsBucketedType *)self bucketBoundaries];
        v42 = [v41 objectAtIndex:(v39 + v40) >> 1];
        [v42 floatValue];
        float v44 = v43;

        if (v11 < v44) {
          unint64_t v39 = (v39 + v40) >> 1;
        }
        else {
          unint64_t v40 = (v39 + v40) >> 1;
        }
      }
      while (v39 - v40 > 1);
    }
    v36 = NSNumber;
    unint64_t v37 = v39;
    goto LABEL_30;
  }
  if ([(FedStatsBucketedType *)self version] != 2)
  {
    if (a4)
    {
      uint64_t v18 = @"The encoder is malformed";
      uint64_t v19 = 900;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v20 = [(FedStatsBucketedType *)self minValue];
  [v20 floatValue];
  float v22 = v21;

  v23 = [(FedStatsBucketedType *)self maxValue];
  [v23 floatValue];
  float v25 = v24;

  id v9 = &unk_26D0B51C8;
  if (v11 >= v22 && v11 <= v25)
  {
    if (v11 == v25)
    {
      uint64_t v26 = [(FedStatsBucketedType *)self bucketCount];
LABEL_31:
      id v9 = (void *)v26;
      goto LABEL_32;
    }
    float v33 = [(FedStatsBucketedType *)self stepSize];
    [v33 floatValue];
    unint64_t v35 = (unint64_t)(float)((float)(v11 - v22) / v34);

    v36 = NSNumber;
    unint64_t v37 = v35 + 1;
LABEL_30:
    uint64_t v26 = [v36 numberWithUnsignedLong:v37];
    goto LABEL_31;
  }
LABEL_32:

  return v9;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      float v11 = @"The decoder can only work with a number type";
LABEL_9:
      +[FedStatsError errorWithCode:500 description:v11];
      float v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_10:
    float v10 = 0;
    goto LABEL_12;
  }
  unint64_t v8 = [v6 unsignedLongValue];
  if (v8 >= [(FedStatsBucketedType *)self classCount])
  {
    if (a4)
    {
      float v11 = @"The decoder requires a number less than the class count";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v9 = [v7 unsignedLongValue];
  if (v9)
  {
    float v10 = [(FedStatsBucketedType *)self sampleForIndex:v9];
  }
  else
  {
    float v10 = &unk_26D0B51E0;
  }
LABEL_12:

  return v10;
}

- (int64_t)dataType
{
  return 2;
}

- (id)indexToInterval:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if ([(FedStatsBucketedType *)self version] == 1)
    {
      v5 = [(FedStatsBucketedType *)self bucketBoundaries];
      id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "unsignedLongValue") - 1);
      v23[0] = v6;
      v7 = [(FedStatsBucketedType *)self bucketBoundaries];
      unint64_t v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "unsignedLongValue"));
      v23[1] = v8;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];

LABEL_6:
      goto LABEL_8;
    }
    if ([(FedStatsBucketedType *)self version] == 2)
    {
      float v10 = [(FedStatsBucketedType *)self minValue];
      [v10 floatValue];
      float v12 = v11;
      float v13 = (float)(unint64_t)([v4 unsignedLongValue] - 1);
      float v14 = [(FedStatsBucketedType *)self stepSize];
      [v14 floatValue];
      float v16 = v12 + (float)(v13 * v15);

      *(float *)&double v17 = v16;
      v5 = [NSNumber numberWithFloat:v17];
      v22[0] = v5;
      uint64_t v18 = NSNumber;
      id v6 = [(FedStatsBucketedType *)self stepSize];
      [v6 floatValue];
      *(float *)&double v20 = v16 + v19;
      v7 = [v18 numberWithFloat:v20];
      v22[1] = v7;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
      goto LABEL_6;
    }
  }
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (unint64_t)classCount
{
  int64_t v3 = [(FedStatsBucketedType *)self version];
  if (v3 == 2)
  {
    id v4 = [(FedStatsBucketedType *)self bucketCount];
    unint64_t v5 = [v4 unsignedIntValue] + 1;
  }
  else
  {
    if (v3 != 1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    id v4 = [(FedStatsBucketedType *)self bucketBoundaries];
    unint64_t v5 = [v4 count];
  }

  return v5;
}

- (id)sampleForIndex:(unint64_t)a3
{
  int64_t v5 = [(FedStatsBucketedType *)self version];
  if (v5 == 1)
  {
    id v6 = NSNumber;
    float v13 = [(FedStatsBucketedType *)self bucketBoundaries];
    v7 = v13;
    if (!a3)
    {
      float v10 = [v13 lastObject];
      [v10 floatValue];
      *(float *)&double v12 = *(float *)&v12 + 1.0;
      goto LABEL_10;
    }
    float v14 = [v13 objectAtIndex:a3 - 1];
    [v14 floatValue];
    float v16 = v15;
    double v17 = [(FedStatsBucketedType *)self bucketBoundaries];
    uint64_t v18 = [v17 objectAtIndex:a3];
    [v18 floatValue];
    *(float *)&double v20 = (float)(v16 + v19) * 0.5;
    float v21 = [v6 numberWithFloat:v20];
  }
  else
  {
    if (v5 != 2)
    {
      float v21 = 0;
      goto LABEL_12;
    }
    id v6 = NSNumber;
    if (a3)
    {
      v7 = [(FedStatsBucketedType *)self minValue];
      [v7 floatValue];
      double v9 = v8;
      float v10 = [(FedStatsBucketedType *)self stepSize];
      [v10 floatValue];
      double v12 = v9 + ((double)a3 + -0.5) * v11;
      *(float *)&double v12 = v12;
LABEL_10:
      float v21 = [v6 numberWithFloat:v12];

      goto LABEL_11;
    }
    v7 = [(FedStatsBucketedType *)self maxValue];
    [v7 floatValue];
    *(float *)&double v23 = v22 + 1.0;
    float v21 = [v6 numberWithFloat:v23];
  }
LABEL_11:

LABEL_12:
  return v21;
}

- (NSArray)bucketBoundaries
{
  return self->_bucketBoundaries;
}

- (void)setBucketBoundaries:(id)a3
{
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
{
}

- (NSNumber)bucketCount
{
  return self->_bucketCount;
}

- (void)setBucketCount:(id)a3
{
}

- (NSNumber)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepSize, 0);
  objc_storeStrong((id *)&self->_bucketCount, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_bucketBoundaries, 0);
}

@end