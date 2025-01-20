@interface VUIEntitiesSortedByDateValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (NSDate)earliestDate;
- (VUIEntitiesSortedByDateValueTransformer)init;
- (VUIEntitiesSortedByDateValueTransformer)initWithDateForEntityBlock:(id)a3;
- (id)dateForEntityBlock;
- (id)transformedValue:(id)a3;
- (unint64_t)maxEntities;
- (void)setDateForEntityBlock:(id)a3;
- (void)setEarliestDate:(id)a3;
- (void)setMaxEntities:(unint64_t)a3;
@end

@implementation VUIEntitiesSortedByDateValueTransformer

- (VUIEntitiesSortedByDateValueTransformer)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIEntitiesSortedByDateValueTransformer)initWithDateForEntityBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIEntitiesSortedByDateValueTransformer;
  v5 = [(VUIEntitiesSortedByDateValueTransformer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id dateForEntityBlock = v5->_dateForEntityBlock;
    v5->_id dateForEntityBlock = (id)v6;
  }
  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  v5 = [(VUIEntitiesSortedByDateValueTransformer *)self dateForEntityBlock];
  uint64_t v6 = +[VUISortUtilities descendingDateSortComparatorWithBlock:v5];

  v7 = [v4 sortedArrayUsingComparator:v6];
  unint64_t v8 = [(VUIEntitiesSortedByDateValueTransformer *)self maxEntities];
  uint64_t v9 = [v7 count];
  if (v9)
  {
    unint64_t v10 = v9;
    v11 = [(VUIEntitiesSortedByDateValueTransformer *)self earliestDate];
    if (v11)
    {
      v12 = [(VUIEntitiesSortedByDateValueTransformer *)self dateForEntityBlock];
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      v26[3] = 0;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __60__VUIEntitiesSortedByDateValueTransformer_transformedValue___block_invoke;
      v21 = &unk_1E6DDD820;
      id v13 = v12;
      id v23 = v13;
      v24 = v26;
      unint64_t v25 = v8;
      id v22 = v11;
      v14 = [v7 indexesOfObjectsPassingTest:&v18];
      v15 = objc_msgSend(v7, "objectsAtIndexes:", v14, v18, v19, v20, v21);

      _Block_object_dispose(v26, 8);
    }
    else
    {
      if (v8 && v10 > v8)
      {
        objc_msgSend(v7, "subarrayWithRange:", 0, v8);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = v7;
      }
      v15 = v16;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

uint64_t __60__VUIEntitiesSortedByDateValueTransformer_transformedValue___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (*(void (**)(void))(a1[5] + 16))();
  v7 = v6;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) >= a1[7])
  {
    uint64_t v8 = 0;
    *a4 = 1;
  }
  else if ([v6 compare:a1[4]] == 1)
  {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)maxEntities
{
  return self->_maxEntities;
}

- (void)setMaxEntities:(unint64_t)a3
{
  self->_maxEntities = a3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
}

- (id)dateForEntityBlock
{
  return self->_dateForEntityBlock;
}

- (void)setDateForEntityBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateForEntityBlock, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
}

@end