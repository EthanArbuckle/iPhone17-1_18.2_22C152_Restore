@interface MPTransitionManager
+ (id)sharedManager;
+ (void)loadTransitionManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPTransitionManager)initWithPaths:(id)a3;
- (double)beatStrengthForTransitionID:(id)a3;
- (double)bestBeatTimeForTransitionID:(id)a3;
- (double)defaultDurationForTransitionID:(id)a3;
- (id)allCategoryIDs;
- (id)allTransitionIDs;
- (id)attributesForTransitionID:(id)a3 andPresetID:(id)a4;
- (id)categoryIDsForTransitionID:(id)a3;
- (id)constraintsForTransitionPresetsMatchingList:(id)a3 andCriteria:(id)a4;
- (id)controlForAttribute:(id)a3 forTransitionID:(id)a4;
- (id)descriptionForTransitionID:(id)a3;
- (id)localizedCategoryNameFromCategoryID:(id)a3;
- (id)localizedNameForTransitionID:(id)a3 withLanguage:(id)a4;
- (id)localizedSettingsUITitleForTitleKey:(id)a3 inTransition:(id)a4;
- (id)localizedTransitionNameForTransitionID:(id)a3;
- (id)localizedTransitionNameForTransitionID:(id)a3 andPresetID:(id)a4;
- (id)presetsForTransitionID:(id)a3;
- (id)randomTransitionPresetFromList:(id)a3 abidingWithConstraints:(id)a4;
- (id)settingsUIControlDescriptionsForTransition:(id)a3;
- (id)transitionPresetsMatchingCriteria:(id)a3;
- (id)transitionsForCategoryID:(id)a3;
- (id)versionOfTransitionID:(id)a3;
- (int64_t)transitionNeedsRandomSeedInformation:(id)a3;
- (void)dealloc;
@end

@implementation MPTransitionManager

+ (id)sharedManager
{
  id result = (id)qword_1F1340;
  if (!qword_1F1340)
  {
    objc_sync_enter(a1);
    if (!qword_1F1340) {
      qword_1F1340 = [[MPTransitionManager alloc] initWithPaths:0];
    }
    objc_sync_exit(a1);
    return (id)qword_1F1340;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F1340)
  {
    objc_sync_enter(a1);

    qword_1F1340 = 0;
    objc_sync_exit(a1);
  }
}

- (void)dealloc
{
  self->mTransitionPresets = 0;
  self->mTransitions = 0;

  self->mTransitionCategories = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPTransitionManager;
  [(MPTransitionManager *)&v3 dealloc];
}

- (id)allTransitionIDs
{
  return [(NSMutableDictionary *)self->mTransitions allKeys];
}

- (id)allCategoryIDs
{
  id v3 = +[NSMutableArray array];
  objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mTransitionCategories, "allKeys"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->mTransitions;
  id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(MPTransitionManager *)self categoryIDsForTransitionID:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)j);
              if (([v3 containsObject:v13] & 1) == 0) {
                [v3 addObject:v13];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }
      }
      id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)versionOfTransitionID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mTransitions objectForKey:a3];
  return [v3 objectForKey:@"version"];
}

- (id)categoryIDsForTransitionID:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"categories"), "copy");
  return v3;
}

- (id)descriptionForTransitionID:(id)a3
{
  return [(NSMutableDictionary *)self->mTransitions objectForKey:a3];
}

- (id)transitionsForCategoryID:(id)a3
{
  id v5 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mTransitions = self->mTransitions;
  id v7 = [(NSMutableDictionary *)mTransitions countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mTransitions);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(-[MPTransitionManager categoryIDsForTransitionID:](self, "categoryIDsForTransitionID:", v11), "containsObject:", a3) & 1) != 0|| objc_msgSend(a3, "isEqualToString:", @"all"))
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableDictionary *)mTransitions countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)localizedTransitionNameForTransitionID:(id)a3
{
  id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:"), "objectForKey:", @"localizedTransitionName");
  if (!result)
  {
    if ([a3 hasPrefix:@"MRCIFilterTransition"])
    {
      return [a3 substringFromIndex:20];
    }
    else
    {
      return a3;
    }
  }
  return result;
}

- (id)localizedNameForTransitionID:(id)a3 withLanguage:(id)a4
{
  id v5 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:"), "objectForKey:", @"resources"), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.lproj/LocalizedDescription.plist", a4)));
  if (v5) {
    id v5 = [(NSDictionary *)v5 objectForKey:@"_LOCALIZABLE_"];
  }
  id result = [(NSDictionary *)v5 objectForKey:@"localizedTransitionName"];
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedTransitionNameForTransitionID:(id)a3 andPresetID:(id)a4
{
  id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:"), "objectForKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"localizedPresetID%@", a4));
  if (!result)
  {
    if ([a3 hasPrefix:@"MRCIFilterTransition"])
    {
      return [a3 substringFromIndex:20];
    }
    else
    {
      return a3;
    }
  }
  return result;
}

- (id)localizedCategoryNameFromCategoryID:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->mTransitionCategories, "objectForKey:");
  if (!result)
  {
    id v6 = [(MPTransitionManager *)self transitionsForCategoryID:a3];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10)), "objectForKey:", @"localizedCategoryName");
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_5;
          }
          return a3;
        }
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

- (id)attributesForTransitionID:(id)a3 andPresetID:(id)a4
{
  if ([a3 isEqualToString:@"Random"])
  {
    return +[NSDictionary dictionary];
  }
  else
  {
    id v8 = (NSMutableDictionary *)objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"presets"), "objectForKey:", a4);
    if (!v8)
    {
      id v8 = (NSMutableDictionary *)objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"presets"), "objectForKey:", @"Default");
      if (!v8)
      {
        id v8 = +[NSMutableDictionary dictionaryWithDictionary:0];
        id v9 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"presets"), "mutableCopy");
        [v9 setObject:v8 forKey:@"Default"];
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "setObject:forKey:", v9, @"presets");
      }
    }
    return v8;
  }
}

- (id)localizedSettingsUITitleForTitleKey:(id)a3 inTransition:(id)a4
{
  id result = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a4), "objectForKey:", @"localizedSettingsUI"), "objectForKey:", a3);
  if (!result) {
    return a3;
  }
  return result;
}

- (id)settingsUIControlDescriptionsForTransition:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"settingsUI"), "copy");
  return v3;
}

- (id)controlForAttribute:(id)a3 forTransitionID:(id)a4
{
  id v5 = [(MPTransitionManager *)self settingsUIControlDescriptionsForTransition:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(objc_msgSend(v10, "objectForKey:", kMPTransitionUIControlAttributeKey[0]), "isEqualToString:", a3))return v10; {
    if (v7 == (id)++v9)
    }
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (double)defaultDurationForTransitionID:(id)a3
{
  if ([a3 isEqualToString:@"Random"]) {
    return 1.0;
  }
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"duration");
  if (!v5) {
    return 1.0;
  }
  [v5 doubleValue];
  return result;
}

- (id)presetsForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"presets");
  return [v3 allKeys];
}

+ (void)loadTransitionManagerWithPaths:(id)a3
{
  if (qword_1F1340)
  {

    qword_1F1340 = 0;
  }
  qword_1F1340 = [[MPTransitionManager alloc] initWithPaths:a3];
}

- (id)constraintsForTransitionPresetsMatchingList:(id)a3 andCriteria:(id)a4
{
  id v5 = a3;
  if (!a3) {
    id v5 = [(NSMutableDictionary *)self->mTransitions allKeys];
  }
  if (![v5 count]) {
    return 0;
  }
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v52;
    id obj = v5;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v11 rangeOfString:@"/"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", v11), "objectForKey:", @"presets"), "allKeys");
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v13 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v48;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v48 != v15) {
                  objc_enumerationMutation(v12);
                }
                objc_msgSend(v6, "addObject:", objc_msgSend(v11, "stringByAppendingPathComponent:", *(void *)(*((void *)&v47 + 1) + 8 * (void)j)));
              }
              id v14 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }
            while (v14);
          }
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v8);
  }
  id v32 = +[NSMutableDictionary dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v34 = [v6 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v44;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v6);
        }
        long long v18 = *(void **)(*((void *)&v43 + 1) + 8 * (void)k);
        id v19 = [v18 stringByDeletingLastPathComponent];
        id v20 = [v18 lastPathComponent];
        id v21 = [(NSMutableDictionary *)self->mTransitions objectForKey:v19];
        id v22 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", v19), "objectForKey:", @"presets"), "objectForKey:", v20);
        id obja = v21;
        id v23 = [v21 objectForKey:@"tags"];
        v36 = v22;
        id v24 = [v22 objectForKey:@"tags"];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v25 = [a4 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v40;
LABEL_28:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(a4);
            }
            uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * v28);
            if (([v24 containsObject:v29] & 1) == 0
              && ![v23 containsObject:v29])
            {
              break;
            }
            if (v26 == (id)++v28)
            {
              id v26 = [a4 countByEnumeratingWithState:&v39 objects:v55 count:16];
              if (v26) {
                goto LABEL_28;
              }
              goto LABEL_37;
            }
          }
          if (v29) {
            continue;
          }
        }
LABEL_37:
        v30 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [obja objectForKey:@"constraints"]);
        -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", [v36 objectForKey:@"constraints"]);
        [v32 setObject:v30 forKey:v18];
      }
      id v34 = [v6 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v34);
  }

  return v32;
}

- (id)randomTransitionPresetFromList:(id)a3 abidingWithConstraints:(id)a4
{
  if (a4)
  {
    id v6 = +[NSMutableArray array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      id v20 = v6;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v9 = [a3 objectForKey:v8];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v10 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v24;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(a4);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
              if ([v9 objectForKey:v14])
              {
                objc_msgSend(objc_msgSend(a4, "objectForKey:", v14), "floatValue");
                NSUInteger v16 = (unint64_t)v15;
                NSRange v17 = NSRangeFromString((NSString *)[v9 objectForKey:v14]);
                if (v16 < v17.location || v16 - v17.location >= v17.length) {
                  break;
                }
              }
              if (v11 == (id)++v13)
              {
                id v11 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_21;
              }
            }
            if (v14) {
              continue;
            }
          }
LABEL_21:
          [v20 addObject:v8];
        }
        id v22 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
      id v6 = v20;
    }
  }
  else
  {
    id v6 = [a3 allKeys];
  }
  id result = [v6 count];
  if (result) {
    return [v6 objectAtIndex:rand() % (unint64_t)result];
  }
  return result;
}

- (id)transitionPresetsMatchingCriteria:(id)a3
{
  id v28 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v23 = self;
  id obj = self->mTransitions;
  id v26 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v42;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        long long v29 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
        if (([v29 isEqualToString:@"Default"] & 1) == 0)
        {
          id v6 = [(NSMutableDictionary *)v23->mTransitions objectForKey:v29];
          id v7 = (NSDictionary *)[v6 objectForKey:@"presets"];
          if (!v7) {
            id v7 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSDictionary dictionary], @"Default");
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v32 = [(NSDictionary *)v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v32)
          {
            uint64_t v30 = *(void *)v38;
            v31 = v7;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                id v10 = [(NSDictionary *)v7 objectForKey:v9];
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v11 = [a3 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v11)
                {
                  id v12 = v11;
                  uint64_t v13 = *(void *)v34;
LABEL_16:
                  uint64_t v14 = 0;
                  while (1)
                  {
                    if (*(void *)v34 != v13) {
                      objc_enumerationMutation(a3);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
                    if ([v10 objectForKey:v15])
                    {
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v16;
                      long long v18 = v10;
                    }
                    else
                    {
                      if (![v6 objectForKey:v15]) {
                        goto LABEL_27;
                      }
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v19;
                      long long v18 = v6;
                    }
                    NSRange v20 = NSRangeFromString((NSString *)[v18 objectForKey:v15]);
                    if (v17 < v20.location || v17 - v20.location >= v20.length)
                    {
                      if (v15) {
                        goto LABEL_32;
                      }
                      break;
                    }
LABEL_27:
                    if (v12 == (id)++v14)
                    {
                      id v12 = [a3 countByEnumeratingWithState:&v33 objects:v45 count:16];
                      if (v12) {
                        goto LABEL_16;
                      }
                      break;
                    }
                  }
                }
                objc_msgSend(v28, "addObject:", objc_msgSend(v29, "stringByAppendingPathComponent:", v9));
LABEL_32:
                id v7 = v31;
              }
              id v32 = [(NSDictionary *)v31 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v32);
          }
        }
        uint64_t v5 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v26);
  }
  return v28;
}

- (double)beatStrengthForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"beatStrength");
  if (!v3) {
    return 0.375;
  }
  [v3 floatValue];
  return v4;
}

- (double)bestBeatTimeForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"bestBeatTime");
  if (!v3) {
    return -1.0;
  }
  [v3 floatValue];
  return v4;
}

- (int64_t)transitionNeedsRandomSeedInformation:(id)a3
{
  return objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3), "objectForKey:", @"needsRandomSeed"), "BOOLValue");
}

- (MPTransitionManager)initWithPaths:(id)a3
{
  CGAffineTransform *(__cdecl **v22)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v23;
  uint64_t v24;
  void *k;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSData *v33;
  id v34;
  void *v35;
  NSDictionary *v36;
  void *m;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *n;
  id obj;
  uint64_t v47;
  char *v48;
  char *v49;
  NSMutableDictionary *mTransitions;
  NSArray *v51;
  NSArray *v52;
  id v53;
  void *v54;
  id v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  objc_super v80;
  unsigned char v81[128];
  unsigned char v82[128];
  unsigned char v83[128];
  unsigned char v84[128];
  unsigned char v85[128];
  unsigned char v86[128];

  v80.receiver = self;
  v80.super_class = (Class)MPTransitionManager;
  float v4 = [(MPTransitionManager *)&v80 init];
  if (v4)
  {
    v4->mTransitions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mTransitionCategories = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v5 = +[NSMutableArray array];
    id v6 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v5, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    id obj = v6;
    long long v48 = (char *)[v6 countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v48)
    {
      long long v47 = *(void *)v77;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v77 != v47) {
            objc_enumerationMutation(obj);
          }
          long long v49 = v7;
          long long v54 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v7);
          -[NSMutableDictionary addEntriesFromDictionary:](v4->mTransitionCategories, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [v54 stringByAppendingPathComponent:@"LocalizedTransitionCategories.plist"]));
          uint64_t v8 = +[NSArray arrayWithObjects:@"TransitionDescriptions.plist", @"TransitionDescriptionsSynergy.plist", 0];
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          long long v51 = v8;
          id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v72 objects:v85 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v73;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v73 != v11) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v13 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [v54 stringByAppendingPathComponent:*(void *)(*((void *)&v72 + 1) + 8 * i)]);
                if (v13)
                {
                  id v14 = +[NSPropertyListSerialization propertyListWithData:v13 options:2 format:0 error:0];
                  if (v14)
                  {
                    uint64_t v15 = v14;
                    v70 = 0u;
                    v71 = 0u;
                    v68 = 0u;
                    v69 = 0u;
                    id v16 = [v14 countByEnumeratingWithState:&v68 objects:v84 count:16];
                    if (v16)
                    {
                      id v17 = v16;
                      uint64_t v18 = *(void *)v69;
                      do
                      {
                        for (j = 0; j != v17; j = (char *)j + 1)
                        {
                          if (*(void *)v69 != v18) {
                            objc_enumerationMutation(v15);
                          }
                          -[NSMutableDictionary setObject:forKey:](v4->mTransitions, "setObject:forKey:", objc_msgSend(objc_msgSend(v15, "objectForKey:", *(void *)(*((void *)&v68 + 1) + 8 * (void)j)), "mutableCopy"), *(void *)(*((void *)&v68 + 1) + 8 * (void)j));
                        }
                        id v17 = [v15 countByEnumeratingWithState:&v68 objects:v84 count:16];
                      }
                      while (v17);
                    }
                  }
                }
              }
              id v10 = [(NSArray *)v51 countByEnumeratingWithState:&v72 objects:v85 count:16];
            }
            while (v10);
          }
          NSRange v20 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", [v54 stringByAppendingPathComponent:@"Transitions/"], 0);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v64 objects:v83 count:16];
          id v22 = &CATransform3DGetAffineTransform_ptr;
          if (v21)
          {
            long long v23 = v21;
            long long v24 = *(void *)v65;
            long long v52 = v20;
            do
            {
              for (k = 0; k != v23; k = (char *)k + 1)
              {
                if (*(void *)v65 != v24) {
                  objc_enumerationMutation(v20);
                }
                id v26 = [v54 stringByAppendingFormat:@"/Transitions/%@", *(void *)(*((void *)&v64 + 1) + 8 * (void)k)];
                if (objc_msgSend(objc_msgSend(v26, "pathExtension"), "isEqualToString:", @"mrbTransition"))
                {
                  uint64_t v27 = [objc_alloc((Class)v22[450]) initWithPath:v26];
                  if (v27)
                  {
                    id v28 = v27;
                    long long v29 = objc_msgSend(objc_msgSend(v26, "lastPathComponent"), "stringByDeletingPathExtension");
                    uint64_t v30 = [v28 pathForResource:@"TransitionDescription" ofType:@"plist"];
                    v31 = [v28 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v30)
                    {
                      id v32 = v31;
                      long long v33 = +[NSData dataWithContentsOfFile:v30];
                      if (v33)
                      {
                        long long v34 = +[NSPropertyListSerialization propertyListWithData:v33 options:2 format:0 error:0];
                        if (v34)
                        {
                          long long v35 = v34;
                          if (v32)
                          {
                            long long v36 = +[NSDictionary dictionaryWithContentsOfFile:v32];
                            if (v36) {
                              objc_msgSend(v35, "addEntriesFromDictionary:", -[NSDictionary objectForKey:](v36, "objectForKey:", @"_LOCALIZABLE_"));
                            }
                          }
                          objc_msgSend(v35, "setObject:forKey:", objc_msgSend(objc_msgSend(v28, "infoDictionary"), "objectForKey:", @"CFBundleVersion"), @"version");
                          objc_msgSend(v35, "setObject:forKey:", objc_msgSend(v26, "stringByAppendingPathComponent:", @"Contents/Resources/"), @"resources");
                          [v35 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v26, @"Icon.tiff", @"thumbnail" forKey];
                          [v35 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v26, objc_msgSend(v35, "objectForKey:", @"patchName", @"patchPath" forKey];
                          [(NSMutableDictionary *)v4->mTransitions setObject:v35 forKey:v29];
                          NSRange v20 = v52;
                        }
                      }
                    }

                    id v22 = &CATransform3DGetAffineTransform_ptr;
                  }
                }
              }
              long long v23 = [(NSArray *)v20 countByEnumeratingWithState:&v64 objects:v83 count:16];
            }
            while (v23);
          }
          id v7 = v49 + 1;
        }
        while (v49 + 1 != v48);
        long long v48 = (char *)[obj countByEnumeratingWithState:&v76 objects:v86 count:16];
      }
      while (v48);
    }
    v4->mTransitionPresets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    mTransitions = v4->mTransitions;
    v55 = [(NSMutableDictionary *)mTransitions countByEnumeratingWithState:&v60 objects:v82 count:16];
    if (v55)
    {
      long long v53 = *(id *)v61;
      do
      {
        for (m = 0; m != v55; m = (char *)m + 1)
        {
          if (*(id *)v61 != v53) {
            objc_enumerationMutation(mTransitions);
          }
          long long v38 = *(void **)(*((void *)&v60 + 1) + 8 * (void)m);
          long long v39 = objc_msgSend(-[NSMutableDictionary objectForKey:](v4->mTransitions, "objectForKey:", v38), "objectForKey:", @"presets");
          if (v39)
          {
            long long v40 = v39;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            long long v41 = [v39 countByEnumeratingWithState:&v56 objects:v81 count:16];
            if (v41)
            {
              long long v42 = v41;
              long long v43 = *(void *)v57;
              do
              {
                for (n = 0; n != v42; n = (char *)n + 1)
                {
                  if (*(void *)v57 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  -[NSMutableDictionary setObject:forKey:](v4->mTransitionPresets, "setObject:forKey:", [v40 objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * (void)n)], objc_msgSend(v38, "stringByAppendingPathComponent:", *(void *)(*((void *)&v56 + 1) + 8 * (void)n)));
                }
                long long v42 = [v40 countByEnumeratingWithState:&v56 objects:v81 count:16];
              }
              while (v42);
            }
          }
          else
          {
            -[NSMutableDictionary setObject:forKey:](v4->mTransitionPresets, "setObject:forKey:", +[NSDictionary dictionary](NSDictionary, "dictionary"), [v38 stringByAppendingPathComponent:@"Default"]);
          }
        }
        v55 = [(NSMutableDictionary *)mTransitions countByEnumeratingWithState:&v60 objects:v82 count:16];
      }
      while (v55);
    }
  }
  return v4;
}

@end