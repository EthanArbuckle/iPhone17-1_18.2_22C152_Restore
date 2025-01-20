@interface PGGraphAddressEdgeCollection
+ (Class)edgeClass;
- (NSDate)universalStartDate;
- (NSSet)universalDateIntervals;
- (unint64_t)numberOfAssets;
@end

@implementation PGGraphAddressEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (NSSet)universalDateIntervals
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphAddressEdgeCollection_universalDateIntervals__block_invoke;
  v6[3] = &unk_1E68EFAE0;
  id v4 = v3;
  id v7 = v4;
  [(MAElementCollection *)self enumerateIdentifiersAsCollectionsWithBlock:v6];

  return (NSSet *)v4;
}

void __54__PGGraphAddressEdgeCollection_universalDateIntervals__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 anyEdge];
  id v4 = [v8 universalStartDate];
  uint64_t v5 = [v8 universalEndDate];
  v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v5];
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (unint64_t)numberOfAssets
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PGGraphAddressEdgeCollection_numberOfAssets__block_invoke;
  v4[3] = &unk_1E68EFAB8;
  v4[4] = &v5;
  [(MAEdgeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"noa" withBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__PGGraphAddressEdgeCollection_numberOfAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

- (NSDate)universalStartDate
{
  if ([(MAElementCollection *)self count])
  {
    uint64_t v6 = 0;
    uint64_t v7 = (double *)&v6;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0x7FEFFFFFFFFFFFFFLL;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__PGGraphAddressEdgeCollection_universalStartDate__block_invoke;
    v5[3] = &unk_1E68EFA90;
    v5[4] = &v6;
    [(MAEdgeCollection *)self enumerateDoublePropertyValuesForKey:@"utcs" withBlock:v5];
    id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7[3]];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v3 = 0;
  }
  return (NSDate *)v3;
}

uint64_t __50__PGGraphAddressEdgeCollection_universalStartDate__block_invoke(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(double *)(v2 + 24) < a2) {
    a2 = *(double *)(v2 + 24);
  }
  *(double *)(v2 + 24) = a2;
  return result;
}

@end