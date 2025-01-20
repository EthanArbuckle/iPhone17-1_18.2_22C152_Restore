@interface BKDataBinder
+ (id)bindings;
+ (id)findBindingFrom:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6;
+ (void)bind:(id)a3 key:(id)a4 between:(id)a5 key:(id)a6;
+ (void)bind:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6;
+ (void)unbind:(id)a3;
+ (void)unbind:(id)a3 key:(id)a4 from:(id)a5 key:(id)a6;
@end

@implementation BKDataBinder

+ (id)bindings
{
  if (qword_100B4A508 != -1) {
    dispatch_once(&qword_100B4A508, &stru_100A489C8);
  }
  v2 = (void *)qword_100B4A500;

  return v2;
}

+ (void)unbind:(id)a3
{
  id v3 = a3;
  v4 = +[BKDataBinder bindings];
  while (1)
  {
    uint64_t v5 = +[BKDataBinder findBindingFrom:v3 key:0 to:0 key:0];
    uint64_t v6 = +[BKDataBinder findBindingFrom:0 key:0 to:v3 key:0];
    if (!(v5 | v6)) {
      break;
    }
    v7 = (void *)v6;
    if (v5)
    {
      [(id)v5 unbind];
      [v4 removeObject:v5];
    }
    if (v7)
    {
      [v7 unbind];
      [v4 removeObject:v7];
    }
  }
  v8 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v15 = [v14 srcObj];
        if (v15)
        {
          v16 = (void *)v15;
          v17 = [v14 dstObj];

          if (v17) {
            continue;
          }
        }
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v8;
  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [v9 removeObject:*(void *)(*((void *)&v23 + 1) + 8 * (void)j) v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

+ (void)bind:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = +[BKDataBinder findBindingFrom:v15 key:v9 to:v10 key:v11];

  if (!v12)
  {
    v13 = [[BKDataBinding alloc] initWithBinding:v15 key:v9 to:v10 key:v11 transmitInitialValue:1];
    v14 = +[BKDataBinder bindings];
    [v14 addObject:v13];
  }
}

+ (void)unbind:(id)a3 key:(id)a4 from:(id)a5 key:(id)a6
{
  uint64_t v6 = +[BKDataBinder findBindingFrom:a3 key:a4 to:a5 key:a6];
  if (v6)
  {
    id v8 = v6;
    [v6 unbind];
    v7 = +[BKDataBinder bindings];
    [v7 removeObject:v8];

    uint64_t v6 = v8;
  }
}

+ (void)bind:(id)a3 key:(id)a4 between:(id)a5 key:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [a1 bind:v13 key:v12 to:v11 key:v10];
  [a1 bind:v11 key:v10 to:v13 key:v12];
}

+ (id)findBindingFrom:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v26 = a6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = +[BKDataBinder bindings];
  id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v12) {
    goto LABEL_34;
  }
  id v25 = v10;
  uint64_t v13 = *(void *)v29;
  id v14 = v10;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (v9)
      {
        id v17 = [*(id *)(*((void *)&v28 + 1) + 8 * i) srcObj];
        a6 = v9;
        if (v17 != v9)
        {
          a6 = v17;
          id v18 = a5;
          goto LABEL_12;
        }
      }
      if (v11)
      {
        id v19 = [v16 dstObj];
        a5 = v11;
        if (v19 != v11)
        {
          id v18 = v19;

          if (!v9)
          {
LABEL_13:
            a5 = v18;
            continue;
          }
LABEL_12:

          goto LABEL_13;
        }
      }
      if (v14)
      {
        id v20 = [v16 srcKey];
        if (v20 != v14)
        {
          long long v24 = v20;

          BOOL v21 = 0;
          goto LABEL_24;
        }
        long long v24 = v14;
        if (!v26)
        {
          BOOL v21 = 1;
          long long v24 = v14;
LABEL_23:

          goto LABEL_24;
        }
      }
      else if (!v26)
      {
        BOOL v21 = 1;
        goto LABEL_24;
      }
      [v16 dstKey:v24];
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v21 = v22 == v26;

      if (v14) {
        goto LABEL_23;
      }
LABEL_24:
      if (v11) {

      }
      if (v9) {
      if (v21)
      }
      {
        id v12 = v16;
        goto LABEL_33;
      }
    }
    id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_33:
  id v10 = v25;
LABEL_34:

  return v12;
}

@end