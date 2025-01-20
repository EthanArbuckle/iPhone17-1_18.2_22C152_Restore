@interface PSCapacityBarData
- (BOOL)hideTinyCategories;
- (NSArray)adjustedCategories;
- (NSArray)categories;
- (NSArray)orderedCategories;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sortStyle;
- (int64_t)bytesUsed;
- (int64_t)capacity;
- (int64_t)categoryLimit;
- (void)setBytesUsed:(int64_t)a3;
- (void)setCapacity:(int64_t)a3;
- (void)setCategories:(id)a3;
- (void)setCategoryLimit:(int64_t)a3;
- (void)setHideTinyCategories:(BOOL)a3;
- (void)setSortStyle:(int)a3;
@end

@implementation PSCapacityBarData

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(PSCapacityBarData);
  v4->_categoryLimit = self->_categoryLimit;
  v4->_hideTinyCategories = self->_hideTinyCategories;
  v4->_sortStyle = self->_sortStyle;
  v4->_capacity = self->_capacity;
  v4->_bytesUsed = self->_bytesUsed;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_categories, "count"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_categories;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "copy", (void)v14);
        [(NSArray *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  categories = v4->_categories;
  v4->_categories = v5;

  return v4;
}

- (NSArray)orderedCategories
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  orderedCategories = self->_orderedCategories;
  if (!orderedCategories)
  {
    v4 = [(PSCapacityBarData *)self categories];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if ([v4 count])
    {
      if (self->_hideTinyCategories) {
        unint64_t v6 = llround((double)self->_capacity * 0.01);
      }
      else {
        unint64_t v6 = 1;
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v12, "bytes", (void)v17) >= v6)
            {
              v13 = (void *)[v12 copy];
              [(NSArray *)v5 addObject:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }

      if (self->_sortStyle == 1) {
        [(NSArray *)v5 sortUsingComparator:&__block_literal_global_39];
      }
      unint64_t categoryLimit = self->_categoryLimit;
      if (categoryLimit && categoryLimit < [(NSArray *)v5 count]) {
        -[NSArray removeObjectsInRange:](v5, "removeObjectsInRange:", self->_categoryLimit, [(NSArray *)v5 count] - self->_categoryLimit);
      }
    }
    long long v15 = self->_orderedCategories;
    self->_orderedCategories = v5;

    orderedCategories = self->_orderedCategories;
  }
  return orderedCategories;
}

uint64_t __38__PSCapacityBarData_orderedCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 bytes];
  unint64_t v6 = [v4 bytes];

  if (v5 < v6) {
    return 1;
  }
  else {
    return -1;
  }
}

- (NSArray)adjustedCategories
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  adjustedCategories = self->_adjustedCategories;
  if (!adjustedCategories)
  {
    v43 = [(PSCapacityBarData *)self orderedCategories];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v43, "count"));
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    unint64_t v5 = self->_orderedCategories;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v57 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * i) copy];
          [(NSArray *)v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v7);
    }

    v11 = self;
    if ([(PSCapacityBarData *)self hideTinyCategories]) {
      goto LABEL_43;
    }
    v42 = self;
    int64_t capacity = self->_capacity;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v13 = v4;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      int64_t v20 = llround((double)capacity * 0.01);
      uint64_t v21 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v53 != v21) {
            objc_enumerationMutation(v13);
          }
          uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * j), "bytes", v42);
          v17 += v23 - v20;
          v16 += v23;
          if (v23 <= v20) {
            int64_t v24 = v20;
          }
          else {
            int64_t v24 = 0;
          }
          v18 += v24;
          if (v23 <= v20) {
            uint64_t v25 = 0;
          }
          else {
            uint64_t v25 = v23;
          }
          v19 += v25;
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v15);

      v11 = v42;
      if (!v18) {
        goto LABEL_43;
      }
      if (v17 < 1)
      {
        long long v46 = 0uLL;
        long long v47 = 0uLL;
        long long v44 = 0uLL;
        long long v45 = 0uLL;
        v35 = v13;
        uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v45 != v38) {
                objc_enumerationMutation(v35);
              }
              [*(id *)(*((void *)&v44 + 1) + 8 * k) setBytes:v20];
            }
            uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
          }
          while (v37);
        }
      }
      else
      {
        long long v50 = 0uLL;
        long long v51 = 0uLL;
        long long v48 = 0uLL;
        long long v49 = 0uLL;
        v26 = v13;
        uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v48 objects:v61 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v49;
          double v30 = (double)v19;
          do
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v49 != v29) {
                objc_enumerationMutation(v26);
              }
              v32 = *(void **)(*((void *)&v48 + 1) + 8 * m);
              uint64_t v33 = [v32 bytes];
              unint64_t v34 = v20;
              if (v33 > v20) {
                unint64_t v34 = llround((double)v33 / v30 * (double)(v16 - v18));
              }
              [v32 setBytes:v34];
            }
            uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v48 objects:v61 count:16];
          }
          while (v28);
        }
      }
    }

    v11 = v42;
LABEL_43:
    v40 = v11->_adjustedCategories;
    v11->_adjustedCategories = v4;

    adjustedCategories = v11->_adjustedCategories;
  }
  return adjustedCategories;
}

- (void)setCategories:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  unint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "copy", (void)v16);
        [(NSArray *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  categories = self->_categories;
  self->_categories = v5;
  v13 = v5;

  orderedCategories = self->_orderedCategories;
  self->_orderedCategories = 0;

  adjustedCategories = self->_adjustedCategories;
  self->_adjustedCategories = 0;
}

- (int64_t)categoryLimit
{
  return self->_categoryLimit;
}

- (void)setCategoryLimit:(int64_t)a3
{
  self->_unint64_t categoryLimit = a3;
}

- (BOOL)hideTinyCategories
{
  return self->_hideTinyCategories;
}

- (void)setHideTinyCategories:(BOOL)a3
{
  self->_hideTinyCategories = a3;
}

- (int)sortStyle
{
  return self->_sortStyle;
}

- (void)setSortStyle:(int)a3
{
  self->_sortStyle = a3;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int64_t)a3
{
  self->_int64_t capacity = a3;
}

- (int64_t)bytesUsed
{
  return self->_bytesUsed;
}

- (void)setBytesUsed:(int64_t)a3
{
  self->_bytesUsed = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_adjustedCategories, 0);
  objc_storeStrong((id *)&self->_orderedCategories, 0);
}

@end