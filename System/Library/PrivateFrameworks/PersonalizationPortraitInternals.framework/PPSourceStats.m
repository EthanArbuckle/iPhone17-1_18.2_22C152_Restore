@interface PPSourceStats
- (NSDate)earliestDate;
- (NSDate)latestDate;
- (NSSet)featureNames;
- (PPSourceStats)initWithMinRefCount:(int64_t)a3 maxRefCount:(int64_t)a4 avgRefCount:(double)a5 medianRefCount:(double)a6 earliestDate:(id)a7 latestDate:(id)a8 uniqueBundleIdCount:(int64_t)a9 uniqueDocIdCount:(int64_t)a10 recordCount:(unint64_t)a11;
- (double)avgRefCount;
- (double)medianRefCount;
- (id)featureValueForName:(id)a3;
- (id)toDictionary;
- (int64_t)maxRefCount;
- (int64_t)minRefCount;
- (int64_t)uniqueBundleIdCount;
- (int64_t)uniqueDocIdCount;
- (unint64_t)recordCount;
@end

@implementation PPSourceStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
}

- (unint64_t)recordCount
{
  return self->_recordCount;
}

- (int64_t)uniqueDocIdCount
{
  return self->_uniqueDocIdCount;
}

- (int64_t)uniqueBundleIdCount
{
  return self->_uniqueBundleIdCount;
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (double)medianRefCount
{
  return self->_medianRefCount;
}

- (double)avgRefCount
{
  return self->_avgRefCount;
}

- (int64_t)maxRefCount
{
  return self->_maxRefCount;
}

- (int64_t)minRefCount
{
  return self->_minRefCount;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"minRefCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t minRefCount = self->_minRefCount;
LABEL_5:
    uint64_t v7 = [v5 featureValueWithInt64:minRefCount];
LABEL_16:
    v12 = (void *)v7;
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"maxRefCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t minRefCount = self->_maxRefCount;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"meanRefCount"])
  {
    v8 = (void *)MEMORY[0x1E4F1E950];
    double avgRefCount = self->_avgRefCount;
LABEL_15:
    uint64_t v7 = [v8 featureValueWithDouble:avgRefCount];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"medianRefCount"])
  {
    v8 = (void *)MEMORY[0x1E4F1E950];
    double avgRefCount = self->_medianRefCount;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"earliestDate"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    earliestDate = self->_earliestDate;
LABEL_14:
    [(NSDate *)earliestDate timeIntervalSince1970];
    v8 = v10;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"latestDate"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    earliestDate = self->_latestDate;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"bundleIdCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t minRefCount = self->_uniqueBundleIdCount;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"docIdCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t minRefCount = self->_uniqueDocIdCount;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"recordCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    unint64_t minRefCount = self->_recordCount;
    goto LABEL_5;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken43 != -1) {
    dispatch_once(&featureNames__pasOnceToken43, &__block_literal_global_947);
  }
  v2 = (void *)featureNames__pasExprOnceResult;
  return (NSSet *)v2;
}

void __29__PPSourceStats_featureNames__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  v1 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"minRefCount", @"maxRefCount", @"meanRefCount", @"medianRefCount", @"earliestDate", @"latestDate", @"bundleIdCount", @"docIdCount", @"recordCount", 0);
  v3 = (void *)featureNames__pasExprOnceResult;
  featureNames__pasExprOnceResult = v2;
}

- (id)toDictionary
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 setFormatOptions:275];
  v26[0] = @"ref_count";
  v24[0] = @"min";
  v18 = [NSNumber numberWithLongLong:self->_minRefCount];
  v25[0] = v18;
  v24[1] = @"max";
  v17 = [NSNumber numberWithLongLong:self->_maxRefCount];
  v25[1] = v17;
  v24[2] = @"median";
  double medianRefCount = self->_medianRefCount;
  if (medianRefCount < 0.0)
  {
    v5 = @"<no-info>";
  }
  else
  {
    v5 = [NSNumber numberWithDouble:self->_medianRefCount];
  }
  v25[2] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 3, v5);
  v27[0] = v6;
  v26[1] = @"date";
  v22[0] = @"earliest";
  if (self->_earliestDate) {
    objc_msgSend(v3, "stringFromDate:");
  }
  else {
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = @"latest";
  v23[0] = v7;
  v19 = v3;
  if (self->_latestDate) {
    objc_msgSend(v3, "stringFromDate:");
  }
  else {
  v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v9;
  v26[2] = @"unique_field_count";
  v20[0] = @"bundleId";
  v10 = [NSNumber numberWithLongLong:self->_uniqueBundleIdCount];
  v20[1] = @"docId";
  v21[0] = v10;
  v11 = [NSNumber numberWithLongLong:self->_uniqueDocIdCount];
  v21[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v12;
  v26[3] = @"recordCount";
  v13 = [NSNumber numberWithUnsignedLongLong:self->_recordCount];
  v27[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  if (medianRefCount >= 0.0) {
  return v14;
  }
}

- (PPSourceStats)initWithMinRefCount:(int64_t)a3 maxRefCount:(int64_t)a4 avgRefCount:(double)a5 medianRefCount:(double)a6 earliestDate:(id)a7 latestDate:(id)a8 uniqueBundleIdCount:(int64_t)a9 uniqueDocIdCount:(int64_t)a10 recordCount:(unint64_t)a11
{
  id v20 = a7;
  id v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PPSourceStats;
  v22 = [(PPSourceStats *)&v25 init];
  v23 = v22;
  if (v22)
  {
    v22->_unint64_t minRefCount = a3;
    v22->_maxRefCount = a4;
    v22->_double avgRefCount = a5;
    v22->_double medianRefCount = a6;
    objc_storeStrong((id *)&v22->_earliestDate, a7);
    objc_storeStrong((id *)&v23->_latestDate, a8);
    v23->_uniqueBundleIdCount = a9;
    v23->_uniqueDocIdCount = a10;
    v23->_recordCount = a11;
  }

  return v23;
}

@end