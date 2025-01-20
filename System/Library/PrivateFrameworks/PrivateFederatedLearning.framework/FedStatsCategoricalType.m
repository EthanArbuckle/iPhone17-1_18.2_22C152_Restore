@interface FedStatsCategoricalType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
- (FedStatsCategoricalType)initWithCategories:(id)a3;
- (FedStatsCategoricalType)initWithCategoryFile:(id)a3;
- (FedStatsCategoricalType)initWithCategoryMap:(id)a3 categories:(id)a4;
- (FedStatsSQLiteCategoryDatabase)categoryFile;
- (NSArray)categories;
- (NSDictionary)categoryMap;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)kOutOfCategories;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (unint64_t)version;
- (void)setVersion:(unint64_t)a3;
@end

@implementation FedStatsCategoricalType

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
  categories = self->_categories;
  self->_categories = 0;

  categoryMap = self->_categoryMap;
  self->_categoryMap = 0;

  categoryFile = self->_categoryFile;
  self->_categoryFile = 0;
}

- (FedStatsCategoricalType)initWithCategories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, [v5 count]);
  v7 = v6;
  if (v6)
  {
    [(FedStatsCategoricalType *)v6 setVersion:1];
    objc_storeStrong((id *)&v7->_categories, a3);
  }

  return v7;
}

- (FedStatsCategoricalType)initWithCategoryMap:(id)a3 categories:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsCategoricalType;
  objc_super v9 = -[FedStatsBoundedULongType initWithBound:](&v12, sel_initWithBound_, [v8 count]);
  v10 = v9;
  if (v9)
  {
    [(FedStatsCategoricalType *)v9 setVersion:2];
    objc_storeStrong((id *)&v10->_categoryMap, a3);
    objc_storeStrong((id *)&v10->_categories, a4);
  }

  return v10;
}

- (FedStatsCategoricalType)initWithCategoryFile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, [v5 dimensionality]);
  id v7 = v6;
  if (v6)
  {
    [(FedStatsCategoricalType *)v6 setVersion:3];
    objc_storeStrong((id *)&v7->_categoryFile, a3);
  }

  return v7;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  v77[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 objectForKey:@"categories"];

  id v8 = [v6 objectForKey:@"categoryMap"];

  objc_super v9 = [v6 objectForKey:@"categoryFile"];

  if (v8) {
    int v10 = (v7 != 0) + 1;
  }
  else {
    int v10 = v7 != 0;
  }
  if (v9) {
    ++v10;
  }
  if (v10 == 1)
  {
    Class v55 = (Class)a1;
    if (v7)
    {
      id v11 = [v6 objectForKey:@"categories"];
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v11 = v11;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v69 objects:v76 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v70;
LABEL_11:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v70 != v15) {
              objc_enumerationMutation(v11);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [v11 countByEnumeratingWithState:&v69 objects:v76 count:16];
              if (v14) {
                goto LABEL_11;
              }
              goto LABEL_17;
            }
          }
LABEL_49:
          if (a4)
          {
            *a4 = +[FedStatsError errorWithCode:302 description:v12];
          }

          goto LABEL_59;
        }
LABEL_17:

        v17 = [MEMORY[0x263EFFA08] setWithArray:v11];
        uint64_t v18 = [v17 count];
        uint64_t v19 = [v11 count];

        if (v18 == v19)
        {
          v20 = (void *)[objc_alloc((Class)a1) initWithCategories:v11];
LABEL_60:

          goto LABEL_62;
        }
      }
      goto LABEL_57;
    }
    if (v8)
    {
      id v11 = [v6 objectForKey:@"categoryMap"];
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v11 = v11;
        uint64_t v23 = [v11 countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v66 != v25) {
                objc_enumerationMutation(v11);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_49;
              }
            }
            uint64_t v24 = [v11 countByEnumeratingWithState:&v65 objects:v75 count:16];
          }
          while (v24);
        }

        v27 = [v11 allKeys];
        v28 = [v27 sortedArrayUsingSelector:sel_compare_];

        v29 = [MEMORY[0x263EFF9A0] dictionary];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v30 = v28;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (!v31) {
          goto LABEL_48;
        }
        uint64_t v54 = 0;
        uint64_t v32 = *(void *)v62;
        v50 = v30;
        uint64_t v46 = *(void *)v62;
        while (1)
        {
          uint64_t v33 = 0;
          uint64_t v47 = v31;
          do
          {
            if (*(void *)v62 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v48 = v33;
            uint64_t v52 = *(void *)(*((void *)&v61 + 1) + 8 * v33);
            v34 = objc_msgSend(v11, "objectForKey:");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                *a4 = +[FedStatsError errorWithCode:302 description:v12];
              }
LABEL_73:

LABEL_74:
              v20 = 0;
              goto LABEL_75;
            }
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            v49 = v34;
            obuint64_t j = v34;
            uint64_t v35 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
            if (!v35) {
              goto LABEL_46;
            }
            uint64_t v36 = v35;
            uint64_t v53 = *(void *)v58;
            while (2)
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v58 != v53) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v38 = *(void *)(*((void *)&v57 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v34 = v49;
                  id v30 = v50;
                  if (a4)
                  {
                    v45 = v12;
                    goto LABEL_71;
                  }
LABEL_72:

                  goto LABEL_73;
                }
                [v29 allKeys];
                v40 = v39 = v29;
                int v41 = [v40 containsObject:v38];

                if (v41)
                {
                  v29 = v39;
                  v34 = v49;
                  id v30 = v50;
                  if (a4)
                  {
                    v45 = @"Subcategories must be distinct";
LABEL_71:
                    *a4 = +[FedStatsError errorWithCode:302 description:v45];
                  }
                  goto LABEL_72;
                }
                v42 = +[FedStatsCategoricalTypeSubcategory categoryWithSuperCategory:v52 index:v54];
                [v39 setObject:v42 forKey:v38];

                v29 = v39;
              }
              uint64_t v36 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
              a1 = v55;
              if (v36) {
                continue;
              }
              break;
            }
LABEL_46:

            ++v54;
            uint64_t v33 = v48 + 1;
            id v30 = v50;
            uint64_t v32 = v46;
          }
          while (v48 + 1 != v47);
          uint64_t v31 = [v50 countByEnumeratingWithState:&v61 objects:v74 count:16];
          if (!v31)
          {
LABEL_48:

            uint64_t v43 = [objc_alloc((Class)a1) initWithCategoryMap:v29 categories:v30];
            goto LABEL_56;
          }
        }
      }
      goto LABEL_57;
    }
    if (v9)
    {
      id v11 = [v6 objectForKey:@"categoryFile"];
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v56 = 0;
        v29 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:v11 error:&v56];
        id v30 = v56;
        if (v29)
        {
          uint64_t v43 = [objc_alloc((Class)a1) initWithCategoryFile:v29];
LABEL_56:
          v20 = (void *)v43;
        }
        else
        {
          if (!a4) {
            goto LABEL_74;
          }
          +[FedStatsError errorWithCode:302 underlyingError:v30 description:@"Cannot create database from the provided URL"];
          v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_75:

        goto LABEL_60;
      }
LABEL_57:
      if (a4)
      {
        +[FedStatsError errorWithCode:302 description:v12];
        v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
LABEL_59:
      v20 = 0;
      goto LABEL_60;
    }
  }
  else if (a4)
  {
    v77[0] = @"categories";
    v77[1] = @"categoryMap";
    v77[2] = @"categoryFile";
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
    v21 = NSString;
    objc_super v12 = [v11 componentsJoinedByString:@", "];
    v22 = [v21 stringWithFormat:@"You're allowed to have exactly one of {%@} as key in parameters", v12];
    *a4 = +[FedStatsError errorWithCode:301 description:v22];

    goto LABEL_59;
  }
  v20 = 0;
LABEL_62:

  return v20;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(FedStatsCategoricalType *)self version];
  switch(v7)
  {
    case 3uLL:
      id v11 = [(FedStatsCategoricalType *)self categoryFile];
      id v17 = 0;
      int v10 = [v11 encode:v6 error:&v17];
      id v12 = v17;

      if (v10)
      {
        id v13 = v10;
      }
      else if (a4)
      {
        *a4 = +[FedStatsError errorWithCode:401 underlyingError:v12 description:@"Error when encoding categorical type over database"];
      }

      break;
    case 2uLL:
      uint64_t v14 = [(FedStatsCategoricalType *)self categoryMap];
      uint64_t v15 = [v14 objectForKey:v6];

      if (v15)
      {
        int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "index") + 1);
      }
      else
      {
        int v10 = &unk_26D0B51C8;
      }

      break;
    case 1uLL:
      id v8 = [(FedStatsCategoricalType *)self categories];
      uint64_t v9 = [v8 indexOfObject:v6];

      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v10 = &unk_26D0B51C8;
      }
      else
      {
        int v10 = [NSNumber numberWithUnsignedInteger:v9 + 1];
      }
      break;
    default:
      if (a4)
      {
        +[FedStatsError errorWithCode:900 description:@"The categorical type version is not supported"];
        int v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v10 = 0;
      }
      break;
  }

  return v10;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      int v10 = @"The decoder can only work with a non-null number type";
      uint64_t v11 = 500;
LABEL_8:
      +[FedStatsError errorWithCode:v11 description:v10];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  unint64_t v7 = [(FedStatsCategoricalType *)self version];
  if (v7 - 1 < 2)
  {
    if ([v6 unsignedLongValue])
    {
      id v8 = [(FedStatsCategoricalType *)self categories];
      uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "unsignedLongValue") - 1);
    }
    else
    {
      uint64_t v9 = [(FedStatsCategoricalType *)self kOutOfCategories];
    }
    goto LABEL_16;
  }
  if (v7 != 3)
  {
    if (a4)
    {
      int v10 = @"The categorical type version is not supported";
      uint64_t v11 = 900;
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  id v12 = [(FedStatsCategoricalType *)self categoryFile];
  uint64_t v15 = 0;
  uint64_t v9 = objc_msgSend(v12, "decode:error:", objc_msgSend(v6, "unsignedLongValue"), &v15);

  if (v9) {
    id v13 = v9;
  }

LABEL_16:
  return v9;
}

- (int64_t)dataType
{
  return 3;
}

- (id)kOutOfCategories
{
  return @"FedStatsCategoricalDataOutOfBounds";
}

- (id)sampleForIndex:(unint64_t)a3
{
  if (!a3)
  {
LABEL_6:
    unint64_t v7 = [(FedStatsCategoricalType *)self kOutOfCategories];
    goto LABEL_8;
  }
  unint64_t v5 = [(FedStatsCategoricalType *)self version];
  if (v5 == 3)
  {
LABEL_5:
    id v6 = [NSNumber numberWithUnsignedLong:a3];
    unint64_t v7 = [(FedStatsCategoricalType *)self decodeFromIndex:v6 possibleError:0];

    goto LABEL_8;
  }
  if (v5 != 2)
  {
    if (v5 == 1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = [MEMORY[0x263EFF980] array];
  id v8 = [(FedStatsCategoricalType *)self categoryMap];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__FedStatsCategoricalType_sampleForIndex___block_invoke;
  v10[3] = &unk_264502F50;
  v10[4] = &v11;
  v10[5] = a3;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  unint64_t v7 = objc_msgSend((id)v12[5], "objectAtIndex:", arc4random_uniform(objc_msgSend((id)v12[5], "count")));
  _Block_object_dispose(&v11, 8);

LABEL_8:
  return v7;
}

void __42__FedStatsCategoricalType_sampleForIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = *(void *)(a1 + 40) - 1;
  if (v5 == [a3 index]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSDictionary)categoryMap
{
  return self->_categoryMap;
}

- (FedStatsSQLiteCategoryDatabase)categoryFile
{
  return self->_categoryFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryFile, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end