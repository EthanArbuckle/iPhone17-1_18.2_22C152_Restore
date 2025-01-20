@interface BCCountedCFISet
+ (id)countedCFISet;
- (BCCFILengthProviding)lengthProvider;
- (BCCountedCFISet)init;
- (BOOL)addCFIString:(id)a3 count:(double)a4 error:(id *)a5;
- (BOOL)subtractCFIString:(id)a3 count:(double)a4 error:(id *)a5;
- (NSMutableArray)entries;
- (double)optimizationTargetProportion;
- (id)allCFICounts;
- (id)allCFIStringCounts;
- (id)cfisWithMinimumCount:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_updateCountForEntry:(id)a3 index:(unint64_t)a4 value:(double)a5 operation:(int)a6 allowMergeForward:(BOOL)a7 allowMergeBack:(BOOL)a8;
- (int64_t)cfiCount;
- (unint64_t)maximumCFICount;
- (void)_optimize;
- (void)_updateCountForCFI:(id)a3 value:(double)a4 operation:(int)a5;
- (void)addCFI:(id)a3 count:(double)a4;
- (void)setEntries:(id)a3;
- (void)setLengthProvider:(id)a3;
- (void)setMaximumCFICount:(unint64_t)a3;
- (void)setOptimizationTargetProportion:(double)a3;
- (void)subtractCFI:(id)a3 count:(double)a4;
- (void)updateWithCFI:(id)a3 minimumCount:(double)a4;
- (void)updateWithCFISet:(id)a3 minimumCount:(double)a4;
@end

@implementation BCCountedCFISet

+ (id)countedCFISet
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)setMaximumCFICount:(unint64_t)a3
{
  if (self->_maximumCFICount != a3)
  {
    self->_maximumCFICount = a3;
    [(BCCountedCFISet *)self _optimize];
  }
}

- (BCCountedCFISet)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCCountedCFISet;
  id v2 = [(BCCountedCFISet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

    v2->_maximumCFICount = -1;
    v2->_optimizationTargetProportion = 0.8;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(BCCountedCFISet);
  v5 = [(BCCountedCFISet *)self entries];
  id v6 = [v5 mutableCopy];
  [(BCCountedCFISet *)v4 setEntries:v6];

  return v4;
}

- (id)description
{
  uint64_t v3 = +[NSMutableString stringWithString:@"{\n"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(BCCountedCFISet *)self entries];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
        [v3 appendFormat:@"    %@;\n", v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"}"];

  return v3;
}

- (int64_t)cfiCount
{
  return (int64_t)[(NSMutableArray *)self->_entries count];
}

- (void)addCFI:(id)a3 count:(double)a4
{
}

- (BOOL)addCFIString:(id)a3 count:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  v9 = +[BCCFI cfiWithString:v8 error:&v14];
  id v10 = v14;
  if (v9)
  {
    [(BCCountedCFISet *)self _updateCountForCFI:v9 value:0 operation:a4];
    if (a5) {
LABEL_3:
    }
      *a5 = v10;
  }
  else
  {
    long long v12 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a5;
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_DEFAULT, "Cannot initialize BCCFI with string %@.  addCFIString:count: will return nil. error=%@", buf, 0x16u);
    }

    if (a5) {
      goto LABEL_3;
    }
  }

  return v10 == 0;
}

- (void)subtractCFI:(id)a3 count:(double)a4
{
}

- (BOOL)subtractCFIString:(id)a3 count:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  v9 = +[BCCFI cfiWithString:v8 error:&v14];
  id v10 = v14;
  if (v9)
  {
    [(BCCountedCFISet *)self _updateCountForCFI:v9 value:0 operation:-a4];
    if (a5) {
LABEL_3:
    }
      *a5 = v10;
  }
  else
  {
    long long v12 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a5;
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_DEFAULT, "Cannot initialize BCCFI with string %@.  subtractCFIString:count: will return nil. error=%@", buf, 0x16u);
    }

    if (a5) {
      goto LABEL_3;
    }
  }

  return v10 == 0;
}

- (void)updateWithCFI:(id)a3 minimumCount:(double)a4
{
}

- (id)allCFICounts
{
  uint64_t v3 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(BCCountedCFISet *)self entries];
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v19[0] = @"cfi";
        v9 = [v8 cfi];
        v19[1] = @"count";
        v20[0] = v9;
        [v8 count];
        id v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v20[1] = v10;
        long long v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
        [v3 addObject:v11];
      }
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  id v12 = [v3 copy];

  return v12;
}

- (id)allCFIStringCounts
{
  uint64_t v3 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(BCCountedCFISet *)self entries];
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v19[0] = @"cfiString";
        v9 = [v8 cfi];
        id v10 = [v9 string];
        v19[1] = @"count";
        v20[0] = v10;
        [v8 count];
        long long v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v20[1] = v11;
        id v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
        [v3 addObject:v12];
      }
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)cfisWithMinimumCount:(double)a3
{
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(BCCountedCFISet *)self entries];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v11 count];
        if (v12 >= a3)
        {
          id v13 = [v11 cfi];
          [v5 addCFI:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (void)updateWithCFISet:(id)a3 minimumCount:(double)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 allCFIs];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BCCountedCFISet *)self updateWithCFI:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) minimumCount:a4];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int64_t)_updateCountForEntry:(id)a3 index:(unint64_t)a4 value:(double)a5 operation:(int)a6 allowMergeForward:(BOOL)a7 allowMergeBack:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  long long v15 = [(BCCountedCFISet *)self entries];
  id v16 = v14;
  long long v17 = v16;
  if (a6 == 1)
  {
    [v16 count];
    if (v19 < a5) {
      double v19 = a5;
    }
  }
  else
  {
    if (a6) {
      goto LABEL_7;
    }
    [v16 count];
    double v19 = v18 + a5;
  }
  [v17 setCount:v19];
LABEL_7:
  [v17 count];
  if (v20 > 0.0)
  {
    v21 = [v17 cfi];
    int64_t v22 = 0;
    if (a4 && v8)
    {
      unint64_t v23 = a4 - 1;
      v24 = [v15 objectAtIndexedSubscript:a4 - 1];
      v25 = [v24 cfi];
      [v17 count];
      double v27 = v26;
      [v24 count];
      if (v27 == v28 && ![v25 compareTailToHead:v21])
      {
        v30 = [v25 unionWithCFI:v21];
        [v24 setCfi:v30];

        [v15 removeObjectAtIndex:a4];
        id v29 = v24;

        uint64_t v31 = [v29 cfi];

        int64_t v22 = -1;
        v21 = (void *)v31;
        a4 = v23;
      }
      else
      {
        int64_t v22 = 0;
        id v29 = v17;
      }

      if (v9)
      {
LABEL_18:
        if ((char *)a4 < (char *)[v15 count] - 1)
        {
          v32 = [v15 objectAtIndexedSubscript:a4 + 1];
          v33 = [v32 cfi];
          [v29 count];
          double v35 = v34;
          [v32 count];
          if (v35 == v36 && ![v21 compareTailToHead:v33])
          {
            v37 = [v33 unionWithCFI:v21];
            [v32 setCfi:v37];

            [v15 removeObjectAtIndex:a4];
            --v22;
          }
        }
      }
    }
    else
    {
      id v29 = v17;
      if (v9) {
        goto LABEL_18;
      }
    }

    goto LABEL_24;
  }
  [v15 removeObjectAtIndex:a4];
  int64_t v22 = -1;
  id v29 = v17;
LABEL_24:

  return v22;
}

- (void)_updateCountForCFI:(id)a3 value:(double)a4 operation:(int)a5
{
  id v7 = a3;
  unsigned int v8 = [v7 isRange];
  if (a4 != 0.0 && v8 != 0)
  {
    id v54 = v7;
    id v10 = v7;
    long long v11 = [(BCCountedCFISet *)self entries];
    v53 = [[BCCountedCFISetEntry alloc] initWithCFI:v10];
    long long v12 = [(char *)[v11 indexOfObject:v53 inSortedRange:0 options:1024 usingComparator:&stru_2C5228]];
    unint64_t v13 = (unint64_t)v12;
    v55 = v11;
    if (v12)
    {
      id v14 = v12 - 1;
      long long v15 = [v11 objectAtIndex:v12 - 1];
      id v16 = [v15 cfi];
      long long v17 = [v10 intersectWithCFI:v16];
      if ([v17 isRange])
      {
        double v18 = +[NSMutableArray array];
        double v19 = [v16 headCFI];
        double v20 = [v19 rangeToCFI:v17];

        unint64_t v21 = v13 - 1;
        if ([v20 isRange])
        {
          int64_t v22 = [[BCCountedCFISetEntry alloc] initWithCFI:v20];
          [v15 count];
          -[BCCountedCFISetEntry setCount:](v22, "setCount:");
          [v18 addObject:v22];

          unint64_t v21 = v13;
        }
        v51 = v20;
        unint64_t v23 = [[BCCountedCFISetEntry alloc] initWithCFI:v17];
        v56 = v15;
        [v15 count];
        -[BCCountedCFISetEntry setCount:](v23, "setCount:");
        [v18 addObject:v23];
        v52 = v16;
        v24 = [v16 tailCFI];
        v25 = [v17 rangeToCFI:v24];

        if ([v25 isRange])
        {
          double v26 = [[BCCountedCFISetEntry alloc] initWithCFI:v25];
          [v56 count];
          -[BCCountedCFISetEntry setCount:](v26, "setCount:");
          [v18 addObject:v26];
        }
        double v27 = v18;
        long long v11 = v55;
        [v55 replaceObjectsInRange:v14 withObjectsFromArray:v27];
        id v28 = [v27 count];
        unint64_t v29 = v21;
        uint64_t v30 = a5;
        int64_t v31 = [(BCCountedCFISet *)self _updateCountForEntry:v23 index:v29 value:a5 operation:1 allowMergeForward:1 allowMergeBack:a4];
        v50 = v23;
        v32 = v25;
        unint64_t v13 = (unint64_t)v28 + (void)v14 + v31;
        v33 = [v10 tailCFI];
        uint64_t v34 = [v17 rangeToCFI:v33];

        id v10 = (id)v34;
        long long v15 = v56;
        id v16 = v52;
      }
      else
      {
        uint64_t v30 = a5;
      }
    }
    else
    {
      uint64_t v30 = a5;
    }
    if ([v10 isRange])
    {
      v57 = self;
      do
      {
        if (v13 >= (unint64_t)[v11 count])
        {
          double v35 = [[BCCountedCFISetEntry alloc] initWithCFI:v10];
          [v11 insertObject:v35 atIndex:v13];
          v13 += [(BCCountedCFISet *)self _updateCountForEntry:v35 index:v13 value:v30 operation:1 allowMergeForward:1 allowMergeBack:a4];
          double v36 = v10;
          id v10 = 0;
        }
        else
        {
          double v35 = [v11 objectAtIndex:v13];
          double v36 = [(BCCountedCFISetEntry *)v35 cfi];
          v37 = [v10 intersectWithCFI:v36];
          if ([v37 isRange])
          {
            v38 = [v10 headCFI];
            v39 = [v38 rangeToCFI:v37];

            if ([(BCCountedCFISetEntry *)v39 isRange])
            {
              v40 = [[BCCountedCFISetEntry alloc] initWithCFI:v39];
              v41 = v11;
              v42 = v40;
              [v41 insertObject:v40 atIndex:v13];
              uint64_t v30 = a5;
              v13 += (unint64_t)[(BCCountedCFISet *)self _updateCountForEntry:v42 index:v13 value:a5 operation:0 allowMergeForward:1 allowMergeBack:a4]+ 1;
              v43 = [v10 tailCFI];
              v44 = [(BCCountedCFISetEntry *)v39 rangeToCFI:v43];
            }
            else
            {
              v44 = v10;
              uint64_t v30 = a5;
            }
            v46 = [v36 tailCFI];
            id v10 = [v37 rangeToCFI:v46];

            if ([v10 isRange])
            {
              v47 = [[BCCountedCFISetEntry alloc] initWithCFI:v37];
              [(BCCountedCFISetEntry *)v35 count];
              -[BCCountedCFISetEntry setCount:](v47, "setCount:");
              v48 = [[BCCountedCFISetEntry alloc] initWithCFI:v10];
              [(BCCountedCFISetEntry *)v35 count];
              -[BCCountedCFISetEntry setCount:](v48, "setCount:");
              v59[0] = v47;
              v59[1] = v48;
              v49 = +[NSArray arrayWithObjects:v59 count:2];
              [v55 replaceObjectsInRange:v13 withObjectsFromArray:v49];

              v13 += [(BCCountedCFISet *)v57 _updateCountForEntry:v47 index:v13 value:a5 operation:1 allowMergeForward:1 allowMergeBack:a4];
              uint64_t v45 = 0;
              v44 = v48;
              uint64_t v30 = a5;
            }
            else
            {
              v13 += (unint64_t)[(BCCountedCFISet *)v57 _updateCountForEntry:v35 index:v13 value:v30 operation:1 allowMergeForward:1 allowMergeBack:a4]+ 1;
              v47 = [v44 tailCFI];
              uint64_t v45 = [v36 rangeToCFI:v47];
            }

            long long v11 = v55;
            self = v57;
          }
          else
          {
            v39 = [[BCCountedCFISetEntry alloc] initWithCFI:v10];
            [v11 insertObject:v39 atIndex:v13];
            uint64_t v45 = 0;
            v13 += [(BCCountedCFISet *)self _updateCountForEntry:v39 index:v13 value:v30 operation:1 allowMergeForward:1 allowMergeBack:a4];
          }

          id v10 = (id)v45;
        }
      }
      while (([v10 isRange] & 1) != 0);
    }
    [(BCCountedCFISet *)self _optimize];

    id v7 = v54;
  }
}

- (void)_optimize
{
  unint64_t v3 = [(BCCountedCFISet *)self maximumCFICount];
  id v54 = [(BCCountedCFISet *)self entries];
  id v4 = [(BCCountedCFISet *)self entries];
  id v5 = [v4 count];

  v50 = [(BCCountedCFISet *)self lengthProvider];
  if (!v50 || !v3 || v3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)v5 <= v3) {
    goto LABEL_36;
  }
  v47 = v6;
  [(BCCountedCFISet *)self optimizationTargetProportion];
  unint64_t v49 = (unint64_t)v5 - llround(v7 * (double)v3);
  unsigned int v8 = +[NSMutableArray array];
  +[NSMutableArray array];
  v53 = v51 = 0;
  unint64_t v9 = 0;
  v48 = v8;
  do
  {
    do
    {
      unint64_t v10 = v9;
      long long v11 = [v54 objectAtIndexedSubscript:v9];
      long long v12 = [v11 cfi];
      if ([v12 spineIndex] != v51)
      {

        break;
      }
      id v13 = [v50 characterCountForCFI:v12];
      if (v9)
      {
        id v14 = [v8 objectAtIndexedSubscript:v9 - 1];
        id v15 = [v14 touchesNext];
      }
      else
      {
        id v15 = 0;
      }
      ++v9;
      if (v10 + 1 >= (unint64_t)v5)
      {
        BOOL v18 = 0;
      }
      else
      {
        id v16 = [v54 objectAtIndexedSubscript:v10 + 1];
        long long v17 = [v16 cfi];
        BOOL v18 = [v12 compareTailToHead:v17] != (id)-1;

        unsigned int v8 = v48;
      }
      double v19 = objc_opt_new();
      [v19 setCharacterCount:v13];
      [v19 setTouchesPrev:v15];
      [v19 setTouchesNext:v18];
      [v8 addObject:v19];
      if (v15 | v18)
      {
        if ((unint64_t)[v53 count] < v49) {
          goto LABEL_17;
        }
        double v20 = [v53 lastObject];
        unint64_t v21 = [v8 objectAtIndexedSubscript:[v20 unsignedIntegerValue]];
        id v22 = [v21 characterCount];

        BOOL v23 = (uint64_t)v13 < (uint64_t)v22;
        unsigned int v8 = v48;
        if (v23)
        {
LABEL_17:
          v24 = +[NSNumber numberWithUnsignedInteger:v10];
          id v25 = [v53 count];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_3DA0C;
          v55[3] = &unk_2C5250;
          id v56 = v8;
          [v53 insertObject:v24 atIndex:[v53 indexOfObject:v24 inSortedRange:0 options:v25 usingComparator:v55]];
          if ((unint64_t)[v53 count] > v49) {
            [v53 removeLastObject];
          }
        }
      }
    }
    while (v9 < (unint64_t)v5);
    ++v51;
  }
  while (v9 < (unint64_t)v5);
  [v53 sortUsingComparator:&stru_2C5290];
  double v26 = (char *)[v53 count];
  if ((uint64_t)v26 >= 1)
  {
    double v27 = v26 + 1;
    while (1)
    {
      id v28 = [v53 objectAtIndexedSubscript:v27 - 2];
      unint64_t v29 = (char *)[v28 unsignedIntegerValue];

      uint64_t v30 = [v48 objectAtIndexedSubscript:v29];
      unsigned int v31 = [v30 touchesNext];
      if (v31) {
        break;
      }
      if ([v30 touchesPrev])
      {
        v52 = v27 - 2;
        v32 = v29 - 1;
        goto LABEL_30;
      }
LABEL_34:

      if ((unint64_t)--v27 <= 1) {
        goto LABEL_35;
      }
    }
    v52 = v27 - 2;
    v32 = v29 + 1;
LABEL_30:
    v33 = [v48 objectAtIndexedSubscript:v32];
    uint64_t v34 = [v54 objectAtIndexedSubscript:v29];
    double v35 = [v54 objectAtIndexedSubscript:v32];
    double v36 = (double)(uint64_t)[v30 characterCount];
    [v34 count];
    double v38 = v37;
    double v39 = (double)(uint64_t)[v33 characterCount];
    [v35 count];
    double v41 = v40 * v39 + v36 * v38;
    id v42 = [v30 characterCount];
    double v43 = v41 / (double)((uint64_t)v42 + (uint64_t)[v33 characterCount]);
    v44 = [v34 cfi];
    uint64_t v45 = [v35 cfi];
    v46 = [v44 unionWithCFI:v45];

    [v35 setCfi:v46];
    [v35 setCount:v43];
    [v33 setCharacterCount:((char *)[v30 characterCount]) + [v33 characterCount]];
    if (v31) {
      objc_msgSend(v33, "setTouchesPrev:", objc_msgSend(v30, "touchesPrev"));
    }
    else {
      [v33 setTouchesNext:[v30 touchesNext]];
    }
    [v54 removeObjectAtIndex:v29];
    [v48 removeObjectAtIndex:v29];
    [v53 removeObjectAtIndex:v52];

    goto LABEL_34;
  }
LABEL_35:

  uint64_t v6 = v47;
LABEL_36:
}

- (BCCFILengthProviding)lengthProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lengthProvider);

  return (BCCFILengthProviding *)WeakRetained;
}

- (void)setLengthProvider:(id)a3
{
}

- (unint64_t)maximumCFICount
{
  return self->_maximumCFICount;
}

- (double)optimizationTargetProportion
{
  return self->_optimizationTargetProportion;
}

- (void)setOptimizationTargetProportion:(double)a3
{
  self->_optimizationTargetProportion = a3;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);

  objc_destroyWeak((id *)&self->_lengthProvider);
}

@end