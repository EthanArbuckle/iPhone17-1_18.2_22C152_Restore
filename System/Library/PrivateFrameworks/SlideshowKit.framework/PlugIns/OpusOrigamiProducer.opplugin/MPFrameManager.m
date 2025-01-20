@interface MPFrameManager
+ (id)sharedManager;
+ (void)loadFrameManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPFrameManager)initWithPaths:(id)a3;
- (id)allCategoryIDs;
- (id)allFrameIDs;
- (id)attributesForFrameID:(id)a3 andPresetID:(id)a4;
- (id)categoryIDsForFrameID:(id)a3;
- (id)constraintsForFramesMatchingList:(id)a3 andCriteria:(id)a4;
- (id)descriptionForFrameID:(id)a3;
- (id)framesForCategoryID:(id)a3;
- (id)localizedCategoryNameFromCategoryID:(id)a3;
- (id)localizedFrameNameForFrameID:(id)a3;
- (id)randomFrameFromList:(id)a3 abidingWithConstraints:(id)a4;
- (id)versionOfFrameID:(id)a3;
- (void)dealloc;
@end

@implementation MPFrameManager

+ (id)sharedManager
{
  id result = (id)qword_1F1348;
  if (!qword_1F1348)
  {
    objc_sync_enter(a1);
    if (!qword_1F1348) {
      qword_1F1348 = [[MPFrameManager alloc] initWithPaths:0];
    }
    objc_sync_exit(a1);
    return (id)qword_1F1348;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F1348)
  {
    objc_sync_enter(a1);

    qword_1F1348 = 0;
    objc_sync_exit(a1);
  }
}

- (void)dealloc
{
  self->mFrames = 0;
  self->mCategories = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPFrameManager;
  [(MPFrameManager *)&v3 dealloc];
}

- (id)allFrameIDs
{
  return [(NSMutableDictionary *)self->mFrames allKeys];
}

- (id)allCategoryIDs
{
  id v3 = +[NSMutableArray array];
  objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mCategories, "allKeys"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->mFrames;
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
        id v8 = [(MPFrameManager *)self categoryIDsForFrameID:*(void *)(*((void *)&v20 + 1) + 8 * i)];
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

- (id)versionOfFrameID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mFrames objectForKey:a3];
  return [v3 objectForKey:@"version"];
}

- (id)localizedFrameNameForFrameID:(id)a3
{
  id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:"), "objectForKey:", @"localizedFrameName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedCategoryNameFromCategoryID:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->mCategories, "objectForKey:");
  if (!result)
  {
    id v6 = [(MPFrameManager *)self framesForCategoryID:a3];
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
        id result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10)), "objectForKey:", @"localizedCategoryName");
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

- (id)categoryIDsForFrameID:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", a3), "objectForKey:", @"categories"), "copy");
  return v3;
}

- (id)framesForCategoryID:(id)a3
{
  id v5 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mFrames = self->mFrames;
  id v7 = [(NSMutableDictionary *)mFrames countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mFrames);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(-[MPFrameManager categoryIDsForFrameID:](self, "categoryIDsForFrameID:", v11), "containsObject:", a3) & 1) != 0|| objc_msgSend(a3, "isEqualToString:", @"all"))
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableDictionary *)mFrames countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)descriptionForFrameID:(id)a3
{
  return [(NSMutableDictionary *)self->mFrames objectForKey:a3];
}

- (id)attributesForFrameID:(id)a3 andPresetID:(id)a4
{
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", a3), "objectForKey:", @"presets");
  objc_sync_enter(v5);
  id v6 = (NSMutableDictionary *)[v5 objectForKey:a4];
  if (!v6)
  {
    id v6 = (NSMutableDictionary *)[v5 objectForKey:@"Default"];
    if (!v6)
    {
      id v6 = +[NSMutableDictionary dictionaryWithDictionary:0];
      [v5 setObject:v6 forKey:@"Default"];
    }
  }
  objc_sync_exit(v5);
  return v6;
}

+ (void)loadFrameManagerWithPaths:(id)a3
{
  if (qword_1F1348)
  {

    qword_1F1348 = 0;
  }
  qword_1F1348 = [[MPFrameManager alloc] initWithPaths:a3];
}

- (id)randomFrameFromList:(id)a3 abidingWithConstraints:(id)a4
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
      long long v20 = v6;
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

- (id)constraintsForFramesMatchingList:(id)a3 andCriteria:(id)a4
{
  id v22 = +[NSMutableDictionary dictionary];
  if (!a4) {
    return 0;
  }
  if (!a3) {
    a3 = [(MPFrameManager *)self allFrameIDs];
  }
  if (!objc_msgSend(a3, "count", v22)) {
    return 0;
  }
  id obj = objc_alloc_init((Class)NSMutableSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(a3);
        }
        [obj addObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      id v7 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        id v14 = [(NSMutableDictionary *)self->mFrames objectForKey:v13];
        id v15 = [v14 objectForKey:@"tags"];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = [a4 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
LABEL_19:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(a4);
            }
            uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * v19);
            if (![v15 containsObject:v20]) {
              break;
            }
            if (v17 == (id)++v19)
            {
              id v17 = [a4 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v17) {
                goto LABEL_19;
              }
              goto LABEL_27;
            }
          }
          if (v20) {
            continue;
          }
        }
LABEL_27:
        objc_msgSend(v23, "setObject:forKey:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", objc_msgSend(v14, "objectForKey:", @"constraints")), v13);
      }
      id v11 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v11);
  }

  return v23;
}

- (MPFrameManager)initWithPaths:(id)a3
{
  CGAffineTransform *(__cdecl **v5)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSData *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  NSArray *v21;
  id v22;
  CGAffineTransform *(__cdecl **v23)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v24;
  uint64_t v25;
  void *j;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSData *v34;
  id v35;
  void *v36;
  NSDictionary *v37;
  id obj;
  uint64_t v40;
  id v41;
  uint64_t v42;
  NSArray *v43;
  MPFrameManager *v44;
  NSFileManager *v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  objc_super v58;
  unsigned char v59[128];
  unsigned char v60[128];
  unsigned char v61[128];

  v58.receiver = self;
  v58.super_class = (Class)MPFrameManager;
  id v4 = [(MPFrameManager *)&v58 init];
  if (v4)
  {
    id v5 = &CATransform3DGetAffineTransform_ptr;
    v4->mFrames = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mCategories = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v45 = +[NSFileManager defaultManager];
    id v6 = +[NSMutableArray array];
    id v7 = v6;
    if (a3) {
      [v6 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v6, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    id obj = v7;
    v41 = [v7 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v41)
    {
      v40 = *(void *)v55;
      v44 = v4;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(obj);
          }
          v42 = v8;
          id v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
          id v10 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [v9 stringByAppendingPathComponent:@"FrameDescriptions.plist"]);
          if (v10)
          {
            id v11 = +[NSPropertyListSerialization propertyListWithData:v10 options:2 format:0 error:0];
            if (v11)
            {
              uint64_t v12 = v11;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              uint64_t v13 = [v11 countByEnumeratingWithState:&v50 objects:v60 count:16];
              if (v13)
              {
                id v14 = v13;
                id v15 = *(void *)v51;
                do
                {
                  for (i = 0; i != v14; i = (char *)i + 1)
                  {
                    if (*(void *)v51 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    id v17 = *(void *)(*((void *)&v50 + 1) + 8 * i);
                    uint64_t v18 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "stringByAppendingPathComponent:", @"Frames"), "stringByAppendingPathComponent:", v17), "stringByAppendingPathExtension:", @"qtz");
                    if (v18)
                    {
                      uint64_t v19 = v18;
                      if ([(NSFileManager *)v45 fileExistsAtPath:v18])
                      {
                        uint64_t v20 = objc_msgSend(objc_alloc((Class)v5[470]), "initWithDictionary:", objc_msgSend(v12, "objectForKey:", v17));
                        [v20 setObject:v19 forKey:@"patchPath"];
                        [(NSMutableDictionary *)v4->mFrames setObject:v20 forKey:v17];
                      }
                    }
                  }
                  id v14 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
                }
                while (v14);
              }
            }
          }
          uint64_t v21 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", [v9 stringByAppendingPathComponent:@"Frames/"], 0);
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v46 objects:v59 count:16];
          long long v23 = &CATransform3DGetAffineTransform_ptr;
          if (v22)
          {
            uint64_t v24 = v22;
            long long v25 = *(void *)v47;
            v43 = v21;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v47 != v25) {
                  objc_enumerationMutation(v21);
                }
                long long v27 = [v9 stringByAppendingFormat:@"/Frames/%@", *(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
                if (objc_msgSend(objc_msgSend(v27, "pathExtension"), "isEqualToString:", @"mrbFrame"))
                {
                  long long v28 = [objc_alloc((Class)v23[450]) initWithPath:v27];
                  if (v28)
                  {
                    long long v29 = v28;
                    long long v30 = objc_msgSend(objc_msgSend(v27, "lastPathComponent"), "stringByDeletingPathExtension");
                    long long v31 = [v29 pathForResource:@"FrameDescription" ofType:@"plist"];
                    long long v32 = [v29 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v31)
                    {
                      long long v33 = v32;
                      long long v34 = +[NSData dataWithContentsOfFile:v31];
                      if (v34)
                      {
                        long long v35 = +[NSPropertyListSerialization propertyListWithData:v34 options:2 format:0 error:0];
                        if (v35)
                        {
                          long long v36 = v35;
                          if (v33)
                          {
                            long long v37 = +[NSDictionary dictionaryWithContentsOfFile:v33];
                            if (v37) {
                              objc_msgSend(v36, "addEntriesFromDictionary:", -[NSDictionary objectForKey:](v37, "objectForKey:", @"_LOCALIZABLE_"));
                            }
                          }
                          objc_msgSend(v36, "setObject:forKey:", objc_msgSend(objc_msgSend(v29, "infoDictionary"), "objectForKey:", @"CFBundleVersion"), @"version");
                          [v36 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources", v27), @"resourceFolderPath" forKey];
                          [v36 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v27, @"Icon.tiff", @"thumbnail" forKey];
                          [v36 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v27, objc_msgSend(v36, "objectForKey:", @"patchName", @"patchPath" forKey];
                          [(NSMutableDictionary *)v44->mFrames setObject:v36 forKey:v30];
                          uint64_t v21 = v43;
                        }
                      }
                    }

                    long long v23 = &CATransform3DGetAffineTransform_ptr;
                  }
                }
              }
              uint64_t v24 = [(NSArray *)v21 countByEnumeratingWithState:&v46 objects:v59 count:16];
            }
            while (v24);
          }
          id v4 = v44;
          -[NSMutableDictionary addEntriesFromDictionary:](v44->mCategories, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [v9 stringByAppendingPathComponent:@"LocalizedFrameCategories.plist"]));
          uint64_t v8 = v42 + 1;
          id v5 = &CATransform3DGetAffineTransform_ptr;
        }
        while ((id)(v42 + 1) != v41);
        v41 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v41);
    }
  }
  return v4;
}

@end