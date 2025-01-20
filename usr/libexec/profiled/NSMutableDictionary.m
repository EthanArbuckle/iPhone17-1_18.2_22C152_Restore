@interface NSMutableDictionary
- (void)MCDeepCopyEntriesFromDictionary:(id)a3;
- (void)MCDeepCopyMissingEntriesFromDictionary:(id)a3;
- (void)MCDeleteBoolRestriction:(id)a3;
- (void)MCFilterRestrictionPayloadKeys:(id)a3;
- (void)MCFixUpRestrictionsDictionaryForMDMReporting;
- (void)MCSanitizeRestrictions;
- (void)MCSetBoolRestriction:(id)a3 value:(BOOL)a4;
- (void)MCSetIntersectionRestriction:(id)a3 values:(id)a4;
- (void)MCSetIntersectionSetting:(id)a3 values:(id)a4;
- (void)MCSetObjectIfNotNil:(id)a3 forKey:(id)a4;
- (void)MCSetUnionRestriction:(id)a3 values:(id)a4;
- (void)MCSetUnionSetting:(id)a3 values:(id)a4;
- (void)MCSetValueRestriction:(id)a3 value:(id)a4;
@end

@implementation NSMutableDictionary

- (void)MCDeepCopyEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v4 objectForKey:v9];
        uint64_t v11 = [(NSMutableDictionary *)self objectForKey:v9];
        v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v12 MCDeepCopyEntriesFromDictionary:v10];
              goto LABEL_18;
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [v10 MCMutableDeepCopy];
        }
        else
        {
          if (!v10) {
            goto LABEL_18;
          }
          id v14 = [v10 copy];
        }
        v15 = v14;
        [(NSMutableDictionary *)self setObject:v14 forKey:v9];

LABEL_18:
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)MCDeepCopyMissingEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self objectForKey:v9];
        uint64_t v11 = [v4 objectForKey:v9];
        if (v11) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
          if (v10) {
            goto LABEL_20;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [v11 MCMutableDeepCopy];
          }
          else
          {
            if (!v11) {
              goto LABEL_20;
            }
            id v13 = [v11 copy];
          }
          v15 = v13;
          [(NSMutableDictionary *)self setObject:v13 forKey:v9];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v10 MCDeepCopyMissingEntriesFromDictionary:v11];
            }
          }
        }
LABEL_20:
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)MCSetObjectIfNotNil:(id)a3 forKey:(id)a4
{
  if (a3) {
    [(NSMutableDictionary *)self setObject:a3 forKey:a4];
  }
}

- (void)MCSetBoolRestriction:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[MCRestrictionManager sharedManager];
  v8 = [v7 defaultRestrictions];

  uint64_t v9 = MCRestrictedBoolKey;
  v10 = [v8 objectForKeyedSubscript:MCRestrictedBoolKey];
  uint64_t v11 = [v10 objectForKeyedSubscript:v6];
  uint64_t v12 = MCRestrictedBoolPreferenceKey;
  id v13 = [v11 objectForKeyedSubscript:MCRestrictedBoolPreferenceKey];

  if (!v13)
  {
    long long v18 = +[NSString stringWithFormat:@"%@ is not a BOOL restriction.", v6];
    id v19 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v18 userInfo:0];

    objc_exception_throw(v19);
  }
  id v14 = [(NSMutableDictionary *)self objectForKeyedSubscript:v9];
  id v15 = [v14 mutableCopy];

  if (!v15)
  {
    id v15 = +[NSMutableDictionary dictionary];
  }
  v20[0] = v12;
  v20[1] = MCRestrictedBoolValueKey;
  v21[0] = v13;
  long long v16 = +[NSNumber numberWithBool:v4];
  v21[1] = v16;
  long long v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v15 setObject:v17 forKeyedSubscript:v6];

  [(NSMutableDictionary *)self setObject:v15 forKeyedSubscript:v9];
}

- (void)MCDeleteBoolRestriction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = MCRestrictedBoolKey;
  id v5 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCRestrictedBoolKey];
  id v6 = [v5 mutableCopy];

  if (v6)
  {
    [v6 removeObjectForKey:v7];
    [(NSMutableDictionary *)self setObject:v6 forKeyedSubscript:v4];
  }
}

- (void)MCSetValueRestriction:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultRestrictions];

    uint64_t v10 = MCRestrictedValueKey;
    uint64_t v11 = [v9 objectForKeyedSubscript:MCRestrictedValueKey];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];
    uint64_t v13 = MCRestrictedValuePreferSmallerValuesKey;
    id v14 = [v12 objectForKeyedSubscript:MCRestrictedValuePreferSmallerValuesKey];

    if (!v14)
    {
      v21 = +[NSString stringWithFormat:@"%@ is not a value restriction.", v6];
      id v22 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v21 userInfo:0];

      objc_exception_throw(v22);
    }
    id v15 = [(NSMutableDictionary *)self objectForKeyedSubscript:v10];
    id v16 = [v15 mutableCopy];

    if (!v16)
    {
      id v16 = +[NSMutableDictionary dictionary];
    }
    v23[0] = v13;
    v23[1] = MCRestrictedValueValueKey;
    v24[0] = v14;
    v24[1] = v7;
    long long v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v16 setObject:v17 forKeyedSubscript:v6];

    [(NSMutableDictionary *)self setObject:v16 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v18 = MCRestrictedValueKey;
    id v19 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCRestrictedValueKey];
    id v20 = [v19 mutableCopy];

    if (v20)
    {
      [v20 removeObjectForKey:v6];
      [(NSMutableDictionary *)self setObject:v20 forKeyedSubscript:v18];
    }
  }
}

- (void)MCSetIntersectionRestriction:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultRestrictions];

    uint64_t v10 = MCIntersectionKey;
    uint64_t v11 = [v9 objectForKeyedSubscript:MCIntersectionKey];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (!v12)
    {
      id v19 = +[NSString stringWithFormat:@"%@ is not an intersection restriction.", v6];
      id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    uint64_t v13 = [(NSMutableDictionary *)self objectForKeyedSubscript:v10];
    id v14 = [v13 mutableCopy];

    if (!v14)
    {
      id v14 = +[NSMutableDictionary dictionary];
    }
    uint64_t v21 = MCIntersectionValuesKey;
    id v22 = v7;
    id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v14 setObject:v15 forKeyedSubscript:v6];

    [(NSMutableDictionary *)self setObject:v14 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v16 = MCIntersectionKey;
    long long v17 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCIntersectionKey];
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      [(NSMutableDictionary *)self setObject:v18 forKeyedSubscript:v16];
    }
  }
}

- (void)MCSetUnionRestriction:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultRestrictions];

    uint64_t v10 = MCUnionKey;
    uint64_t v11 = [v9 objectForKeyedSubscript:MCUnionKey];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (!v12)
    {
      id v19 = +[NSString stringWithFormat:@"%@ is not an union restriction.", v6];
      id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    uint64_t v13 = [(NSMutableDictionary *)self objectForKeyedSubscript:v10];
    id v14 = [v13 mutableCopy];

    if (!v14)
    {
      id v14 = +[NSMutableDictionary dictionary];
    }
    uint64_t v21 = MCUnionValuesKey;
    id v22 = v7;
    id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v14 setObject:v15 forKeyedSubscript:v6];

    [(NSMutableDictionary *)self setObject:v14 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v16 = MCUnionKey;
    long long v17 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCUnionKey];
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      [(NSMutableDictionary *)self setObject:v18 forKeyedSubscript:v16];
    }
  }
}

- (void)MCSetIntersectionSetting:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultSettings];

    uint64_t v10 = MCIntersectionKey;
    uint64_t v11 = [v9 objectForKeyedSubscript:MCIntersectionKey];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (!v12)
    {
      id v19 = +[NSString stringWithFormat:@"%@ is not an intersection setting.", v6];
      id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    uint64_t v13 = [(NSMutableDictionary *)self objectForKeyedSubscript:v10];
    id v14 = [v13 mutableCopy];

    if (!v14)
    {
      id v14 = +[NSMutableDictionary dictionary];
    }
    uint64_t v21 = MCIntersectionValuesKey;
    id v22 = v7;
    id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v14 setObject:v15 forKeyedSubscript:v6];

    [(NSMutableDictionary *)self setObject:v14 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v16 = MCIntersectionKey;
    long long v17 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCIntersectionKey];
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      [(NSMutableDictionary *)self setObject:v18 forKeyedSubscript:v16];
    }
  }
}

- (void)MCSetUnionSetting:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = +[MCRestrictionManager sharedManager];
    uint64_t v9 = [v8 defaultSettings];

    uint64_t v10 = MCUnionKey;
    uint64_t v11 = [v9 objectForKeyedSubscript:MCUnionKey];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (!v12)
    {
      id v19 = +[NSString stringWithFormat:@"%@ is not an union setting.", v6];
      id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v19 userInfo:0];

      objc_exception_throw(v20);
    }
    uint64_t v13 = [(NSMutableDictionary *)self objectForKeyedSubscript:v10];
    id v14 = [v13 mutableCopy];

    if (!v14)
    {
      id v14 = +[NSMutableDictionary dictionary];
    }
    uint64_t v21 = MCUnionValuesKey;
    id v22 = v7;
    id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v14 setObject:v15 forKeyedSubscript:v6];

    [(NSMutableDictionary *)self setObject:v14 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v16 = MCUnionKey;
    long long v17 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCUnionKey];
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      [(NSMutableDictionary *)self setObject:v18 forKeyedSubscript:v16];
    }
  }
}

- (void)MCFilterRestrictionPayloadKeys:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100018194;
    v7[3] = &unk_1000EB508;
    v7[4] = self;
    id v8 = v4;
    id v6 = objc_retainBlock(v7);
    ((void (*)(void *, void))v6[2])(v6, MCRestrictedBoolKey);
    ((void (*)(void *, void))v6[2])(v6, MCRestrictedValueKey);
    ((void (*)(void *, void))v6[2])(v6, MCIntersectionKey);
    ((void (*)(void *, void))v6[2])(v6, MCUnionKey);
  }
}

- (void)MCFixUpRestrictionsDictionaryForMDMReporting
{
  v2 = self;
  uint64_t v3 = MCRestrictedValueKey;
  id v4 = [(NSMutableDictionary *)self objectForKey:MCRestrictedValueKey];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 mutableCopy];
    uint64_t v7 = MCFeaturePasscodeLockGraceTime;
    id v8 = [v6 objectForKey:MCFeaturePasscodeLockGraceTime];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 mutableCopy];
      uint64_t v11 = MCRestrictedValueValueKey;
      uint64_t v12 = [v10 valueForKey:MCRestrictedValueValueKey];
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v2;
        id v15 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)[v12 longValue] / 60);
        [v10 setObject:v15 forKey:v11];

        v2 = v14;
      }
      [v6 setObject:v10 forKey:v7];
    }
    uint64_t v16 = MCFeatureAutoLockTime;
    long long v17 = [v6 objectForKey:MCFeatureAutoLockTime];
    id v18 = v17;
    if (v17)
    {
      id v19 = [v17 mutableCopy];
      uint64_t v20 = MCRestrictedValueValueKey;
      uint64_t v21 = [v19 valueForKey:MCRestrictedValueValueKey];
      id v22 = v21;
      if (v21)
      {
        v23 = v2;
        v24 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)[v21 longValue] / 60);
        [v19 setObject:v24 forKey:v20];

        v2 = v23;
      }
      [v6 setObject:v19 forKey:v16];
    }
    [(NSMutableDictionary *)v2 setObject:v6 forKey:v3];
  }
  uint64_t v25 = MCIntersectionKey;
  v26 = [(NSMutableDictionary *)v2 objectForKey:MCIntersectionKey];
  if (v26)
  {
    uint64_t v41 = v25;
    id v42 = v26;
    v43 = v2;
    v44 = v5;
    id v27 = [v26 mutableCopy];
    +[MCRestrictionUtilities intersectionFeaturesWithPayloadRestictionKeyAlias];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v28 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v53;
      uint64_t v45 = *(void *)v53;
      do
      {
        v31 = 0;
        id v46 = v29;
        do
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v52 + 1) + 8 * (void)v31);
          v33 = +[MCRestrictionUtilities intersectionPayloadRestrictionKeysForFeature:v32];
          v34 = [v27 objectForKey:v32];
          if (v34) {
            BOOL v35 = v33 == 0;
          }
          else {
            BOOL v35 = 1;
          }
          if (!v35)
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v36 = v33;
            id v37 = [v36 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v49;
              do
              {
                for (i = 0; i != v38; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  [v27 setObject:v34 forKey:*(void *)(*((void *)&v48 + 1) + 8 * i)];
                }
                id v38 = [v36 countByEnumeratingWithState:&v48 objects:v56 count:16];
              }
              while (v38);
            }

            [v27 removeObjectForKey:v32];
            uint64_t v30 = v45;
            id v29 = v46;
          }

          v31 = (char *)v31 + 1;
        }
        while (v31 != v29);
        id v29 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v29);
    }

    [(NSMutableDictionary *)v43 setObject:v27 forKey:v41];
    id v5 = v44;
    v26 = v42;
  }
}

- (void)MCSanitizeRestrictions
{
  uint64_t v3 = +[MCRestrictionManager sharedManager];
  id v4 = [v3 defaultRestrictions];

  uint64_t v5 = MCRestrictedBoolKey;
  id v6 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCRestrictedBoolKey];
  id v7 = [v6 mutableCopy];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v62;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        if ((-[NSMutableDictionary MCValidateBoolRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:", v13, v8, v4) & 1) == 0)[v7 setObject:0 forKeyedSubscript:v13]; {
      }
        }
      id v10 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v10);
  }
  v47 = v8;

  id v14 = [v7 copy];
  [(NSMutableDictionary *)self setObject:v14 forKeyedSubscript:v5];

  uint64_t v15 = MCRestrictedValueKey;
  uint64_t v16 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCRestrictedValueKey];
  id v17 = [v16 mutableCopy];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v58;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
        if ((-[NSMutableDictionary MCValidateValueRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateValueRestriction:inRestrictions:defaultRestrictions:", v23, v18, v4) & 1) == 0)[v17 setObject:0 forKeyedSubscript:v23]; {
      }
        }
      id v20 = [v18 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v20);
  }
  long long v48 = v7;

  id v46 = v17;
  id v24 = [v17 copy];
  [(NSMutableDictionary *)self setObject:v24 forKeyedSubscript:v15];

  uint64_t v25 = MCIntersectionKey;
  v26 = [(NSMutableDictionary *)self objectForKeyedSubscript:MCIntersectionKey];
  id v27 = [v26 mutableCopy];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v28 = v26;
  id v29 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * (void)k);
        if ((-[NSMutableDictionary MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:", v33, v28, v4) & 1) == 0)[v27 setObject:0 forKeyedSubscript:v33]; {
      }
        }
      id v30 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v30);
  }

  uint64_t v45 = v27;
  id v34 = [v27 copy];
  [(NSMutableDictionary *)self setObject:v34 forKeyedSubscript:v25];

  uint64_t v44 = MCUnionKey;
  BOOL v35 = -[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:");
  id v36 = [v35 mutableCopy];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v37 = v35;
  id v38 = [v37 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v50;
    do
    {
      for (m = 0; m != v39; m = (char *)m + 1)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v49 + 1) + 8 * (void)m);
        if ((-[NSMutableDictionary MCValidateUnionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", v42, v37, v4) & 1) == 0)[v36 setObject:0 forKeyedSubscript:v42]; {
      }
        }
      id v39 = [v37 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }
    while (v39);
  }

  id v43 = [v36 copy];
  [(NSMutableDictionary *)self setObject:v43 forKeyedSubscript:v44];
}

@end