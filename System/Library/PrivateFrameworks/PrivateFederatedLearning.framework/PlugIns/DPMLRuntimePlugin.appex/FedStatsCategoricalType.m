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
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, "initWithBound:", [v5 count]);
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
  objc_super v9 = -[FedStatsBoundedULongType initWithBound:](&v12, "initWithBound:", [v8 count]);
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
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, "initWithBound:", [v5 dimensionality]);
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
    Class v54 = (Class)a1;
    if (v7)
    {
      id v11 = [v6 objectForKey:@"categories"];
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v11 = v11;
        id v13 = [v11 countByEnumeratingWithState:&v68 objects:v75 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v69;
LABEL_11:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v69 != v15) {
              objc_enumerationMutation(v11);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [v11 countByEnumeratingWithState:&v68 objects:v75 count:16];
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

        v17 = +[NSSet setWithArray:v11];
        id v18 = [v17 count];
        id v19 = [v11 count];

        if (v18 == v19)
        {
          id v20 = [objc_alloc((Class)a1) initWithCategories:v11];
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
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v11 = v11;
        v22 = (char *)[v11 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v22)
        {
          v23 = v22;
          uint64_t v24 = *(void *)v65;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(void *)v65 != v24) {
                objc_enumerationMutation(v11);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_49;
              }
            }
            v23 = (char *)[v11 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v23);
        }

        v26 = [v11 allKeys];
        v27 = [v26 sortedArrayUsingSelector:"compare:"];

        v28 = +[NSMutableDictionary dictionary];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v29 = v27;
        id v30 = [v29 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (!v30) {
          goto LABEL_48;
        }
        uint64_t v53 = 0;
        uint64_t v31 = *(void *)v61;
        v49 = v29;
        uint64_t v45 = *(void *)v61;
        while (1)
        {
          uint64_t v32 = 0;
          id v46 = v30;
          do
          {
            if (*(void *)v61 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v47 = v32;
            uint64_t v51 = *(void *)(*((void *)&v60 + 1) + 8 * v32);
            v33 = objc_msgSend(v11, "objectForKey:");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                *a4 = +[FedStatsError errorWithCode:302 description:v12];
              }
LABEL_73:

LABEL_74:
              id v20 = 0;
              goto LABEL_75;
            }
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v48 = v33;
            id obj = v33;
            id v34 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
            if (!v34) {
              goto LABEL_46;
            }
            id v35 = v34;
            uint64_t v52 = *(void *)v57;
            while (2)
            {
              for (j = 0; j != v35; j = (char *)j + 1)
              {
                if (*(void *)v57 != v52) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v37 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v33 = v48;
                  id v29 = v49;
                  if (a4)
                  {
                    CFStringRef v44 = v12;
                    goto LABEL_71;
                  }
LABEL_72:

                  goto LABEL_73;
                }
                [v28 allKeys];
                v39 = v38 = v28;
                unsigned int v40 = [v39 containsObject:v37];

                if (v40)
                {
                  v28 = v38;
                  v33 = v48;
                  id v29 = v49;
                  if (a4)
                  {
                    CFStringRef v44 = @"Subcategories must be distinct";
LABEL_71:
                    *a4 = +[FedStatsError errorWithCode:302 description:v44];
                  }
                  goto LABEL_72;
                }
                v41 = +[FedStatsCategoricalTypeSubcategory categoryWithSuperCategory:v51 index:v53];
                [v38 setObject:v41 forKey:v37];

                v28 = v38;
              }
              id v35 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
              a1 = v54;
              if (v35) {
                continue;
              }
              break;
            }
LABEL_46:

            ++v53;
            uint64_t v32 = v47 + 1;
            id v29 = v49;
            uint64_t v31 = v45;
          }
          while ((id)(v47 + 1) != v46);
          id v30 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
          if (!v30)
          {
LABEL_48:

            id v42 = [objc_alloc((Class)a1) initWithCategoryMap:v28 categories:v29];
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
        id v55 = 0;
        v28 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:v11 error:&v55];
        id v29 = v55;
        if (v28)
        {
          id v42 = [objc_alloc((Class)a1) initWithCategoryFile:v28];
LABEL_56:
          id v20 = v42;
        }
        else
        {
          if (!a4) {
            goto LABEL_74;
          }
          +[FedStatsError errorWithCode:302 underlyingError:v29 description:@"Cannot create database from the provided URL"];
          id v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_75:

        goto LABEL_60;
      }
LABEL_57:
      if (a4)
      {
        +[FedStatsError errorWithCode:302 description:v12];
        id v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
LABEL_59:
      id v20 = 0;
      goto LABEL_60;
    }
  }
  else if (a4)
  {
    v76[0] = @"categories";
    v76[1] = @"categoryMap";
    v76[2] = @"categoryFile";
    id v11 = +[NSArray arrayWithObjects:v76 count:3];
    objc_super v12 = [v11 componentsJoinedByString:@", "];
    v21 = +[NSString stringWithFormat:@"You're allowed to have exactly one of {%@} as key in parameters", v12];
    *a4 = +[FedStatsError errorWithCode:301 description:v21];

    goto LABEL_59;
  }
  id v20 = 0;
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
      id v14 = [(FedStatsCategoricalType *)self categoryMap];
      uint64_t v15 = [v14 objectForKey:v6];

      if (v15)
      {
        +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v15 index] + 1);
        int v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v10 = &off_1000346A0;
      }

      break;
    case 1uLL:
      id v8 = [(FedStatsCategoricalType *)self categories];
      objc_super v9 = (char *)[v8 indexOfObject:v6];

      if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        int v10 = &off_1000346A0;
      }
      else
      {
        int v10 = +[NSNumber numberWithUnsignedInteger:v9 + 1];
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
      CFStringRef v10 = @"The decoder can only work with a non-null number type";
      uint64_t v11 = 500;
LABEL_8:
      +[FedStatsError errorWithCode:v11 description:v10];
      objc_super v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    objc_super v9 = 0;
    goto LABEL_16;
  }
  unint64_t v7 = [(FedStatsCategoricalType *)self version];
  if (v7 - 1 < 2)
  {
    if ([v6 unsignedLongValue])
    {
      id v8 = [(FedStatsCategoricalType *)self categories];
      objc_super v9 = objc_msgSend(v8, "objectAtIndex:", (char *)objc_msgSend(v6, "unsignedLongValue") - 1);
    }
    else
    {
      objc_super v9 = [(FedStatsCategoricalType *)self kOutOfCategories];
    }
    goto LABEL_16;
  }
  if (v7 != 3)
  {
    if (a4)
    {
      CFStringRef v10 = @"The categorical type version is not supported";
      uint64_t v11 = 900;
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  id v12 = [(FedStatsCategoricalType *)self categoryFile];
  uint64_t v15 = 0;
  objc_super v9 = objc_msgSend(v12, "decode:error:", objc_msgSend(v6, "unsignedLongValue"), &v15);

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
    id v6 = +[NSNumber numberWithUnsignedLong:a3];
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
  id v14 = sub_100009558;
  uint64_t v15 = sub_100009568;
  id v16 = +[NSMutableArray array];
  id v8 = [(FedStatsCategoricalType *)self categoryMap];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009570;
  v10[3] = &unk_100030698;
  v10[4] = &v11;
  v10[5] = a3;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  unint64_t v7 = objc_msgSend((id)v12[5], "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend((id)v12[5], "count")));
  _Block_object_dispose(&v11, 8);

LABEL_8:
  return v7;
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