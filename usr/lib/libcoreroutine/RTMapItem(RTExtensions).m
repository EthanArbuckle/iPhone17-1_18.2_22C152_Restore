@interface RTMapItem(RTExtensions)
+ (id)heaviestMapItemFrom:()RTExtensions closestToLocation:distanceCalculator:error:;
- (id)appendSource:()RTExtensions;
- (id)mergeWithMapItem:()RTExtensions preservingProperties:;
- (id)removeSource:()RTExtensions;
@end

@implementation RTMapItem(RTExtensions)

- (id)appendSource:()RTExtensions
{
  uint64_t v5 = [a1 source];
  if (a3 && (v5 & a3) != a3) {
    [a1 setSource:(([a1 source] | a3) & 0xFFFFFFFFFFFFFFFELL)];
  }

  return a1;
}

- (id)removeSource:()RTExtensions
{
  if (([a1 source] & a3) != 0) {
    [a1 setSource:[a1 source] & ~a3];
  }

  return a1;
}

- (id)mergeWithMapItem:()RTExtensions preservingProperties:
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = (void *)[a1 copy];
    unsigned int outCount = 0;
    v9 = (objc_class *)objc_opt_class();
    v10 = class_copyPropertyList(v9, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        Name = property_getName(v10[i]);
        if (Name)
        {
          v13 = [NSString stringWithUTF8String:Name];
          if (([&unk_1F3453078 containsObject:v13] & 1) == 0
            && ([v7 containsObject:v13] & 1) == 0)
          {
            v14 = [v6 valueForKey:v13];
            [v8 setValue:v14 forKey:v13];
          }
        }
      }
    }
    free(v10);
  }
  else
  {
    v8 = (void *)[v6 copy];
  }

  return v8;
}

+ (id)heaviestMapItemFrom:()RTExtensions closestToLocation:distanceCalculator:error:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((unint64_t)[v9 count] > 1)
  {
    v13 = [v9 valueForKeyPath:@"@max.self"];
    [v13 weight];
    uint64_t v15 = v14;

    v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"weight = %lf", v15];
    v17 = [v9 filteredArrayUsingPredicate:v16];

    unint64_t v18 = [v17 count];
    if (v10 && v18 > 1)
    {
      v42 = a6;
      v43 = v17;
      v44 = v11;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v52 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v25 = [v24 geoMapItemHandle];
            if (v25)
            {
              v26 = (void *)v25;
              v27 = [v24 extendedAttributes];
              uint64_t v28 = [v27 wifiFingerprintLabelType];

              if (v28 == 2)
              {
                id v12 = v24;

                v17 = v43;
                id v11 = v44;
                goto LABEL_33;
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v56 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      obuint64_t j = v19;
      uint64_t v29 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        id v31 = 0;
        uint64_t v32 = *(void *)v48;
        double v33 = INFINITY;
        id v11 = v44;
        while (2)
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v48 != v32) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            v36 = [v35 location];
            id v46 = 0;
            [v44 distanceFromLocation:v10 toLocation:v36 error:&v46];
            double v38 = v37;
            id v39 = v46;

            if (v39)
            {
              if (v42) {
                void *v42 = v39;
              }

              id v12 = 0;
              goto LABEL_32;
            }
            if (v38 < v33)
            {
              id v40 = v35;

              double v33 = v38;
              id v31 = v40;
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v31 = 0;
        id v11 = v44;
      }

      id v31 = v31;
      id v12 = v31;
LABEL_32:
      v17 = v43;
    }
    else
    {
      id v12 = [v17 firstObject];
    }
LABEL_33:
  }
  else
  {
    id v12 = [v9 firstObject];
  }

  return v12;
}

@end