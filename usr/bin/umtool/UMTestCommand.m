@interface UMTestCommand
+ (BOOL)executeWithOutError:(id *)a3;
+ (NSArray)examples;
+ (NSArray)subcommands;
+ (NSString)description;
+ (NSString)name;
+ (id)_spaceForDepth:(unint64_t)a3;
+ (id)helpDetailsForDepth:(unint64_t)a3;
@end

@implementation UMTestCommand

+ (NSString)name
{
  return 0;
}

+ (NSString)description
{
  return 0;
}

+ (NSArray)examples
{
  return 0;
}

+ (id)_spaceForDepth:(unint64_t)a3
{
  for (i = objc_opt_new(); a3; --a3)
    [i appendString:@"\t"];

  return i;
}

+ (id)helpDetailsForDepth:(unint64_t)a3
{
  v5 = objc_opt_new();
  v6 = [a1 name];
  if (v6)
  {
    v7 = [a1 _spaceForDepth:a3];
    v8 = [a1 _spaceForDepth:a3 + 1];
    unint64_t v9 = a3 + 2;
    v10 = [a1 _spaceForDepth:a3 + 2];
    v11 = [a1 name];
    [v5 appendFormat:@"%@%@%@", v7, v11, @"\n"];

    uint64_t v12 = [a1 description];
    v13 = (void *)v12;
    if (v12) {
      [v5 appendFormat:@"%@Description: %@%@", v8, v12, @"\n"];
    }
    v14 = [a1 examples];
    v40 = v14;
    if (v14)
    {
      v15 = v14;
      if ([v14 count])
      {
        v32 = v13;
        v34 = v8;
        v36 = v7;
        v38 = v6;
        [v5 appendFormat:@"%@Examples:%@", v8, @"\n"];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v46;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v46 != v19) {
                objc_enumerationMutation(v16);
              }
              [v5 appendFormat:@"%@%@%@", v10, *(void *)(*((void *)&v45 + 1) + 8 * i), @"\n"];
            }
            id v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v18);
        }

        v7 = v36;
        v6 = v38;
        v13 = v32;
        v8 = v34;
      }
    }
    v21 = [a1 subcommands];
    v22 = v21;
    if (v21 && [v21 count])
    {
      v33 = v13;
      v35 = v8;
      v37 = v7;
      v39 = v6;
      [v5 appendFormat:@"%@%@Subcommands:%@", @"\n", v8, @"\n"];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v31 = v22;
      id v23 = v22;
      id v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) helpDetailsForDepth:v9];
            [v5 appendFormat:@"%@%@", @"\n", v28];
          }
          id v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v25);
      }

      v7 = v37;
      v6 = v39;
      v13 = v33;
      v8 = v35;
      v22 = v31;
    }
    id v29 = [v5 copy];
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

+ (NSArray)subcommands
{
  return 0;
}

+ (BOOL)executeWithOutError:(id *)a3
{
  v5 = +[UMTestArguments getNextArgument];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [a1 subcommands];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = [v11 name];
      unsigned __int8 v13 = [v12 isEqualToString:v5];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    unsigned __int8 v14 = [v11 executeWithOutError:a3];

    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
    BOOL v15 = 1;
  }
  else
  {
LABEL_9:

LABEL_12:
    +[UMTestArguments goToPreviousArgument];
    BOOL v15 = 0;
  }

  return v15;
}

@end