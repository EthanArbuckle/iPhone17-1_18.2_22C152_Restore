@interface EKAllDayRow
- (EKAllDayRow)init;
- (id)description;
- (id)occurrenceBlocks;
- (unint64_t)spaceGapFor:(id)a3;
- (void)addOccurrenceBlock:(id)a3;
@end

@implementation EKAllDayRow

- (EKAllDayRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKAllDayRow;
  v2 = [(EKAllDayRow *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    blocks = v2->_blocks;
    v2->_blocks = v3;
  }
  return v2;
}

- (void)addOccurrenceBlock:(id)a3
{
}

- (unint64_t)spaceGapFor:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_blocks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) gapBetweenBlock:v4, v13];
        if (v11 == (id)-1)
        {
          unint64_t v8 = -1;
          goto LABEL_14;
        }
        if ((unint64_t)v11 > v8) {
          unint64_t v8 = (unint64_t)v11;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)occurrenceBlocks
{
  return self->_blocks;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@: %p>(\n" objc_opt_class() self];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(EKAllDayRow *)self occurrenceBlocks];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
        [v3 appendString:v9];

        [v3 appendString:@"\n"];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@""]);

  return v3;
}

- (void).cxx_destruct
{
}

@end