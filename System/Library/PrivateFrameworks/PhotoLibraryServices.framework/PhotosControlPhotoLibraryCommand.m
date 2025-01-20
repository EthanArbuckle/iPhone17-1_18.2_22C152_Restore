@interface PhotosControlPhotoLibraryCommand
+ (const)libraryOptstring;
+ (const)optstring;
+ (id)libraryUsage;
+ (id)libraryUsagesummary;
+ (id)usage;
+ (id)usagesummary;
+ (option)libraryLongopts;
+ (option)longopts;
- (BOOL)argument:(id)a3 isValidDouble:(double *)a4;
- (BOOL)libraryProcessOption:(int)a3 arg:(id)a4;
- (BOOL)processOption:(int)a3 arg:(id)a4;
- (NSString)libraryArg;
- (NSURL)libraryURL;
- (PhotosControlPhotoLibraryCommand)initWithArgc:(int)a3 argv:(char *)a4 ctl:(id)a5;
- (_PhotosControlPhotoLibraryPhotoKit)photoKitProxy;
- (id)_jsonDictionaryFromManagedObject:(id)a3 allPreviousObjects:(id)a4 currentDepth:(unint64_t)a5 maxDepth:(unint64_t)a6;
- (id)jsonDictionaryFromError:(id)a3;
- (id)jsonDictionaryFromManagedObject:(id)a3 maxDepth:(unint64_t)a4;
- (id)managedObjectContext;
- (id)photoLibrary;
- (id)photosCtl;
- (id)plPhotoLibrary;
- (id)processBooleanOptionArg:(id)a3;
- (id)unopenedPhotoLibrary;
- (int)runOnAssetArgumentsAllowAll:(BOOL)a3 additionalPredicate:(id)a4 block:(id)a5;
- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 allowAll:(BOOL)a5 additionalPredicate:(id)a6 sortDescriptors:(id)a7 block:(id)a8;
- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 allowAll:(BOOL)a5 additionalPredicate:(id)a6 sortDescriptors:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 block:(id)a9;
- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 block:(id)a5;
- (int)runOnPhotoKitAssetArgumentsAllowAll:(BOOL)a3 propertySets:(id)a4 additionalPredicate:(id)a5 block:(id)a6;
- (int)save;
- (int)setValueString:(id)a3 forKey:(id)a4 onManagedObject:(id)a5;
- (int)traverseRelationshipsForRootManagedObject:(id)a3 keys:(id)a4 targetObject:(id *)a5;
- (void)configureWithAlternateURLToLibraryDatabase:(id)a3;
- (void)enterGroup;
- (void)leaveGroup;
- (void)setArgumentRangeForRunOnManagedObjects:(_NSRange)a3;
- (void)setPhotoKitProxy:(id)a3;
- (void)waitForGroup;
@end

@implementation PhotosControlPhotoLibraryCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoKitProxy, 0);
  objc_storeStrong((id *)&self->_libraryArg, 0);
  objc_storeStrong((id *)&self->_ctl, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_moc, 0);
}

- (void)setPhotoKitProxy:(id)a3
{
}

- (_PhotosControlPhotoLibraryPhotoKit)photoKitProxy
{
  return (_PhotosControlPhotoLibraryPhotoKit *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)libraryArg
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (int)runOnPhotoKitAssetArgumentsAllowAll:(BOOL)a3 propertySets:(id)a4 additionalPredicate:(id)a5 block:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing required _PhotosControlPhotoLibraryPhotoKit" userInfo:0];
    objc_exception_throw(v16);
  }
  int v14 = [(_PhotosControlPhotoLibraryPhotoKit *)photoKitProxy runOnPhotoKitAssetArgumentsAllowAll:v8 propertySets:v10 additionalPredicate:v11 block:v12];

  return v14;
}

- (id)managedObjectContext
{
  moc = self->_moc;
  if (moc)
  {
    v3 = moc;
  }
  else
  {
    photoKitProxy = self->_photoKitProxy;
    if (!photoKitProxy)
    {
      id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing required _PhotosControlPhotoLibraryPhotoKit" userInfo:0];
      objc_exception_throw(v6);
    }
    v3 = [(_PhotosControlPhotoLibraryPhotoKit *)photoKitProxy managedObjectContext];
  }
  return v3;
}

- (id)photoLibrary
{
  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing required _PhotosControlPhotoLibraryPhotoKit" userInfo:0];
    objc_exception_throw(v4);
  }
  return (id)[(_PhotosControlPhotoLibraryPhotoKit *)photoKitProxy photoLibrary];
}

- (id)unopenedPhotoLibrary
{
  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing required _PhotosControlPhotoLibraryPhotoKit" userInfo:0];
    objc_exception_throw(v4);
  }
  return (id)[(_PhotosControlPhotoLibraryPhotoKit *)photoKitProxy unopenedPhotoLibrary];
}

- (id)plPhotoLibrary
{
  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing required _PhotosControlPhotoLibraryPhotoKit" userInfo:0];
    objc_exception_throw(v4);
  }
  return (id)[(_PhotosControlPhotoLibraryPhotoKit *)photoKitProxy plPhotoLibrary];
}

- (BOOL)libraryProcessOption:(int)a3 arg:(id)a4
{
  return 0;
}

- (BOOL)processOption:(int)a3 arg:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  if (v5 == 108)
  {
    objc_storeStrong((id *)&self->_libraryArg, a4);
    BOOL v8 = [(PhotosControlCommand *)self libraryURLFromArgument:v7];
    libraryURL = self->_libraryURL;
    self->_libraryURL = v8;
  }
  BOOL v10 = [(PhotosControlPhotoLibraryCommand *)self libraryProcessOption:v5 arg:v7];
  BOOL v11 = v5 == 108 || v10;

  return v11;
}

- (id)processBooleanOptionArg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:@"y"]) {
    goto LABEL_4;
  }
  id v6 = [v4 lowercaseString];
  if (![v6 isEqualToString:@"yes"])
  {
    v9 = [v4 lowercaseString];
    char v10 = [v9 isEqualToString:@"1"];

    if (v10) {
      goto LABEL_5;
    }
    BOOL v11 = [v4 lowercaseString];
    if (([v11 isEqualToString:@"n"] & 1) == 0)
    {
      id v12 = [v4 lowercaseString];
      if (![v12 isEqualToString:@"no"])
      {
        v13 = [v4 lowercaseString];
        char v14 = [v13 isEqualToString:@"0"];

        if ((v14 & 1) == 0)
        {
          [(PhotosControlCommand *)self outputError:@"Argument for BOOLean option must be one of '1|0', 'y|n', 'yes|no'\n"];
          id v7 = 0;
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
LABEL_12:
    id v7 = (void *)MEMORY[0x1E4F1CC28];
    goto LABEL_6;
  }

LABEL_4:
LABEL_5:
  id v7 = (void *)MEMORY[0x1E4F1CC38];
LABEL_6:

  return v7;
}

- (int)save
{
  v3 = [(PhotosControlPhotoLibraryCommand *)self plPhotoLibrary];
  id v4 = [v3 managedObjectContext];

  id v10 = 0;
  char v5 = [v4 save:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    int v8 = 0;
  }
  else
  {
    [(PhotosControlCommand *)self outputError:@"Save error: %@\n", v6];
    int v8 = 70;
  }

  return v8;
}

- (id)jsonDictionaryFromError:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 domain];
  [v5 setObject:v6 forKeyedSubscript:@"domain"];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
  [v5 setObject:v7 forKeyedSubscript:@"code"];

  int v8 = [v4 localizedDescription];

  [v5 setObject:v8 forKeyedSubscript:@"localizedDescription"];
  return v5;
}

- (id)jsonDictionaryFromManagedObject:(id)a3 maxDepth:(unint64_t)a4
{
  return [(PhotosControlPhotoLibraryCommand *)self _jsonDictionaryFromManagedObject:a3 allPreviousObjects:0 currentDepth:1 maxDepth:a4];
}

- (id)_jsonDictionaryFromManagedObject:(id)a3 allPreviousObjects:(id)a4 currentDepth:(unint64_t)a5 maxDepth:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v11)
  {
    id v12 = (void *)MEMORY[0x1E4F1CA80];
    v13 = [v10 objectID];
    id v11 = [v12 setWithObject:v13];
  }
  char v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = [v10 entity];
  id v16 = [v15 propertiesByName];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__PhotosControlPhotoLibraryCommand__jsonDictionaryFromManagedObject_allPreviousObjects_currentDepth_maxDepth___block_invoke;
  v22[3] = &unk_1E586D098;
  id v23 = v10;
  id v17 = v14;
  id v24 = v17;
  id v25 = v11;
  BOOL v29 = a6 - 1 >= a5;
  v26 = self;
  unint64_t v27 = a5;
  unint64_t v28 = a6;
  id v18 = v11;
  id v19 = v10;
  [v16 enumerateKeysAndObjectsUsingBlock:v22];
  id v20 = v17;

  return v20;
}

void __110__PhotosControlPhotoLibraryCommand__jsonDictionaryFromManagedObject_allPreviousObjects_currentDepth_maxDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v6 isToMany];
    int v8 = [*(id *)(a1 + 32) valueForKey:v5];
    v9 = v8;
    if (v7)
    {
      if ([v8 count])
      {
        id v10 = [MEMORY[0x1E4F1CA48] array];
        id v31 = v5;
        [*(id *)(a1 + 40) setObject:v10 forKey:v5];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v30 = v9;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              id v17 = *(void **)(a1 + 48);
              id v18 = objc_msgSend(v16, "objectID", v30);
              LOBYTE(v17) = [v17 containsObject:v18];

              if ((v17 & 1) == 0)
              {
                id v19 = *(void **)(a1 + 48);
                id v20 = [v16 objectID];
                [v19 addObject:v20];

                if (*(unsigned char *)(a1 + 80)) {
                  [*(id *)(a1 + 56) _jsonDictionaryFromManagedObject:v16 allPreviousObjects:*(void *)(a1 + 48) currentDepth:*(void *)(a1 + 64) + 1 maxDepth:*(void *)(a1 + 72)];
                }
                else {
                v21 = [v16 description];
                }
                [v10 addObject:v21];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v13);
        }

        v9 = v30;
        id v5 = v31;
      }
      goto LABEL_37;
    }
    if (v8)
    {
      id v23 = *(void **)(a1 + 48);
      id v24 = [v8 objectID];
      LOBYTE(v23) = [v23 containsObject:v24];

      if ((v23 & 1) == 0)
      {
        id v25 = *(void **)(a1 + 48);
        v26 = [v9 objectID];
        [v25 addObject:v26];

        if (*(unsigned char *)(a1 + 80))
        {
          unint64_t v27 = [*(id *)(a1 + 56) _jsonDictionaryFromManagedObject:v9 allPreviousObjects:*(void *)(a1 + 48) currentDepth:*(void *)(a1 + 64) + 1 maxDepth:*(void *)(a1 + 72)];
          unint64_t v28 = *(void **)(a1 + 40);
LABEL_36:
          [v28 setObject:v27 forKey:v5];

          goto LABEL_37;
        }
LABEL_35:
        BOOL v29 = *(void **)(a1 + 40);
        unint64_t v27 = [v9 description];
        unint64_t v28 = v29;
        goto LABEL_36;
      }
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [*(id *)(a1 + 32) valueForKey:v5];
    if (v9)
    {
      uint64_t v22 = [v6 attributeType];
      if (v22 <= 499)
      {
        if (v22 != 100 && v22 != 200 && v22 != 300) {
          goto LABEL_35;
        }
      }
      else if (v22 > 699)
      {
        if (v22 != 800 && v22 != 700) {
          goto LABEL_35;
        }
      }
      else if (v22 != 500 && v22 != 600)
      {
        goto LABEL_35;
      }
      [*(id *)(a1 + 40) setObject:v9 forKey:v5];
    }
LABEL_37:
  }
}

- (int)setValueString:(id)a3 forKey:(id)a4 onManagedObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 entity];
  uint64_t v12 = [v11 propertiesByName];

  uint64_t v13 = [v12 objectForKey:v9];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      v15 = v14;
      if (!v8)
      {
        if (([v14 isOptional] & 1) == 0)
        {
          [(PhotosControlCommand *)self outputError:@"Resetting property %@ is forbidden because it is not optional\n", v9];
LABEL_33:
          int v17 = 64;
          goto LABEL_34;
        }
        id v18 = 0;
        goto LABEL_29;
      }
      uint64_t v16 = [v14 attributeType];
      if (v16 <= 599)
      {
        if (v16 <= 299)
        {
          if (v16 != 100 && v16 != 200) {
            goto LABEL_31;
          }
          goto LABEL_22;
        }
        if (v16 == 300)
        {
LABEL_22:
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
          goto LABEL_28;
        }
        if (v16 == 500)
        {
          id v19 = NSNumber;
          [v8 doubleValue];
          uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
          goto LABEL_28;
        }
LABEL_31:
        id v24 = @"Set command is not supported for date, binary, and transformable attributes\n";
        goto LABEL_32;
      }
      if (v16 > 799)
      {
        if (v16 == 800)
        {
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
        }
        else
        {
          if (v16 != 900) {
            goto LABEL_31;
          }
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v8, "integerValue"));
        }
      }
      else
      {
        if (v16 != 600)
        {
          if (v16 == 700)
          {
            id v18 = v8;
            goto LABEL_29;
          }
          goto LABEL_31;
        }
        v21 = NSNumber;
        [v8 floatValue];
        uint64_t v20 = objc_msgSend(v21, "numberWithFloat:");
      }
LABEL_28:
      id v18 = (id)v20;
      if (!v20)
      {
        id v24 = @"Unable to provide non-null value for set command\n";
LABEL_32:
        -[PhotosControlCommand outputError:](self, "outputError:", v24, v26);
        goto LABEL_33;
      }
LABEL_29:
      uint64_t v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      [(PhotosControlCommand *)self output:@"Setting value %@ for key %@ on object of class %@\n", v18, v9, v23];

      [v10 setValue:v18 forKey:v9];
      int v17 = 0;
LABEL_34:

      goto LABEL_35;
    }
    [(PhotosControlCommand *)self outputError:@"Set command is only supported for attribute properties, %@ is not an attribute\n", v9];
  }
  else
  {
    [(PhotosControlCommand *)self outputError:@"Cannot find property %@\n", v9];
  }
  int v17 = 64;
LABEL_35:

  return v17;
}

- (int)traverseRelationshipsForRootManagedObject:(id)a3 keys:(id)a4 targetObject:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)[a4 mutableCopy];
  id v25 = v8;
  uint64_t v26 = a5;
  if ([v9 count])
  {
    id v10 = @"Cannot find relationship %@ on object of class %@\n";
    unint64_t v11 = 0x1E4F1C000uLL;
    unint64_t v27 = self;
    while (1)
    {
      uint64_t v12 = [v9 firstObject];
      [v9 removeObjectAtIndex:0];
      uint64_t v13 = [v8 entity];
      id v14 = [v13 propertiesByName];

      v15 = [v14 objectForKey:v12];
      if (!v15) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        [(PhotosControlCommand *)self outputError:@"%@ is not a relationship\n", v12];
        goto LABEL_9;
      }
      if ([v15 isToMany])
      {

        [(PhotosControlCommand *)self outputError:@"Set command is not supported for to-many relationships, %@ is to-many\n", v12];
LABEL_9:
        id v8 = 0;
        int v18 = 0;
        int v19 = 64;
        goto LABEL_10;
      }
      [v8 valueForKey:v12];
      unint64_t v21 = v11;
      uint64_t v23 = v22 = v10;

      int v19 = 0;
      int v18 = 1;
      id v8 = (id)v23;
      id v10 = v22;
      unint64_t v11 = v21;
      self = v27;
LABEL_10:

      uint64_t v20 = [v9 count];
      if (!v18 || !v20) {
        goto LABEL_15;
      }
    }
    uint64_t v16 = (objc_class *)objc_opt_class();
    int v17 = NSStringFromClass(v16);
    -[PhotosControlCommand outputError:](self, "outputError:", v10, v12, v17);

    goto LABEL_9;
  }
  int v19 = 0;
LABEL_15:
  if (v26) {
    id *v26 = v8;
  }

  return v19;
}

- (int)runOnAssetArgumentsAllowAll:(BOOL)a3 additionalPredicate:(id)a4 block:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[PLManagedAsset entityName];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PhotosControlPhotoLibraryCommand_runOnAssetArgumentsAllowAll_additionalPredicate_block___block_invoke;
  v13[3] = &unk_1E586D070;
  id v14 = v8;
  id v11 = v8;
  LODWORD(v6) = [(PhotosControlPhotoLibraryCommand *)self runOnManagedObjectArgumentsWithEntityName:v10 identifierPropertyKey:@"uuid" allowAll:v6 additionalPredicate:v9 sortDescriptors:0 block:v13];

  return v6;
}

uint64_t __90__PhotosControlPhotoLibraryCommand_runOnAssetArgumentsAllowAll_additionalPredicate_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 allowAll:(BOOL)a5 additionalPredicate:(id)a6 sortDescriptors:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 block:(id)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v27 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v20 = [(PhotosControlPhotoLibraryCommand *)self managedObjectContext];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  if (self->_argumentRangeForRunOnManagedObjects.length)
  {
    unint64_t v21 = [(PhotosControlCommand *)self args];
    uint64_t v22 = objc_msgSend(v21, "subarrayWithRange:", self->_argumentRangeForRunOnManagedObjects.location, self->_argumentRangeForRunOnManagedObjects.length);
  }
  else
  {
    uint64_t v22 = [(PhotosControlCommand *)self args];
  }
  unint64_t v23 = [v22 count];
  if (v23 > 1)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke;
    v28[3] = &unk_1E586D048;
    unint64_t v39 = v23;
    id v29 = v22;
    BOOL v40 = v12;
    id v30 = v27;
    id v31 = v15;
    id v32 = v18;
    id v33 = v20;
    id v34 = v16;
    id v35 = v17;
    v36 = self;
    id v37 = v19;
    v38 = &v41;
    [v33 performBlockAndWait:v28];
    int v25 = *((_DWORD *)v42 + 6);

    id v24 = v29;
  }
  else
  {
    id v24 = [v22 firstObject];
    [(PhotosControlCommand *)self outputError:@"%@ requires at least 1 %@ identifier", v24, v15, v27];
    if (v12)
    {
      [(PhotosControlCommand *)self outputError:@" or 'all'"];
      [(PhotosControlCommand *)self outputError:@" or 'guest'"];
    }
    [(PhotosControlCommand *)self outputError:@" or 'latest'\n"];
    int v25 = 64;
  }

  _Block_object_dispose(&v41, 8);
  return v25;
}

void __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 112) < 2uLL)
  {
    v3 = 0;
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  v2 = [*(id *)(a1 + 32) objectAtIndex:1];
  v3 = v2;
  if (!*(unsigned char *)(a1 + 120)) {
    goto LABEL_6;
  }
  id v4 = [v2 lowercaseString];
  int v5 = [v4 isEqualToString:@"guest"];

  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
LABEL_7:
  if (*(unsigned char *)(a1 + 120)
    && ([v3 lowercaseString],
        int v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:@"all"],
        v7,
        (v8 & 1) != 0))
  {
    int v44 = 0;
    LOBYTE(v9) = 1;
  }
  else
  {
    id v10 = [v3 lowercaseString];
    int v9 = [v10 isEqualToString:@"latest"];

    int v44 = v9;
  }
  LODWORD(v11) = [*(id *)(a1 + 40) isEqualToString:@"self"];
  BOOL v12 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 48)];
  [v12 setRelationshipKeyPathsForPrefetching:*(void *)(a1 + 56)];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = [MEMORY[0x1E4F1CA80] set];
  if ((v9 & 1) == 0 && !v6)
  {
    id v15 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, *(void *)(a1 + 112) - 1);
    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", *(void *)(a1 + 40), v15];
    id v17 = (void *)v16;
    char v41 = (char)v11;
    if (v11)
    {
      id v37 = (void *)v16;
      v38 = v14;
      unint64_t v39 = v13;
      BOOL v40 = v12;
      v42 = v3;
      id v11 = [MEMORY[0x1E4F1CA48] array];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v52 != v21) {
              objc_enumerationMutation(v18);
            }
            unint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v51 + 1) + 8 * i)];
            id v24 = [*(id *)(a1 + 64) persistentStoreCoordinator];
            int v25 = [v24 managedObjectIDForURIRepresentation:v23];

            [v11 addObject:v25];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v20);
      }

      id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v11];

      v3 = v42;
      BOOL v12 = v40;
      uint64_t v6 = 0;
      id v14 = v38;
      uint64_t v13 = v39;
    }
    else
    {
      id v11 = v15;
    }
    [v13 addObject:v17];
    [v14 addObjectsFromArray:v11];

    LOBYTE(v11) = v41;
  }
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v13, "addObject:");
  }
  if (v6) {
    [v13 addObject:v6];
  }
  uint64_t v26 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
  [v12 setPredicate:v26];
  [v12 setSortDescriptors:*(void *)(a1 + 80)];
  if (v44)
  {
    char v27 = (char)v11;
    uint64_t v43 = v3;
    unint64_t v28 = v14;
    id v29 = (void *)[v12 copy];
    [v29 setResultType:1];
    id v11 = [*(id *)(a1 + 64) executeFetchRequest:v29 error:0];
    id v30 = [v11 lastObject];
    if (v30)
    {
      [*(id *)(a1 + 88) output:@"'latest' resolved to object with ID: %@\n", v30];
      id v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self == %@", v30];
      [v12 setPredicate:v31];

      [v28 addObject:v30];
      char v27 = 1;
    }

    id v14 = v28;
    v3 = v43;
    LOBYTE(v11) = v27;
  }
  id v32 = *(void **)(a1 + 64);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke_2;
  v45[3] = &unk_1E586D020;
  char v50 = (char)v11;
  id v33 = v14;
  id v46 = v33;
  id v47 = *(id *)(a1 + 40);
  id v34 = *(id *)(a1 + 96);
  uint64_t v35 = *(void *)(a1 + 104);
  id v48 = v34;
  uint64_t v49 = v35;
  id v36 = (id)[v32 enumerateObjectsFromFetchRequest:v12 count:0 usingDefaultBatchSizeWithBlock:v45];
  if ([v33 count] && !*(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
    [*(id *)(a1 + 88) outputError:@"Unable to find objects with identifiers: %@\n", v33];
  }
}

void __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v12 = v7;
  if (*(unsigned char *)(a1 + 64))
  {
    char v8 = *(void **)(a1 + 32);
    int v9 = [v7 objectID];
    id v10 = v8;
LABEL_5:
    [v10 removeObject:v9];
    goto LABEL_6;
  }
  int v9 = [v7 valueForKeyPath:*(void *)(a1 + 40)];
  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
LABEL_6:

  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v11 + 16))(v11, v12, a3, *(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 allowAll:(BOOL)a5 additionalPredicate:(id)a6 sortDescriptors:(id)a7 block:(id)a8
{
  return [(PhotosControlPhotoLibraryCommand *)self runOnManagedObjectArgumentsWithEntityName:a3 identifierPropertyKey:a4 allowAll:a5 additionalPredicate:a6 sortDescriptors:a7 relationshipKeyPathsForPrefetching:0 block:a8];
}

- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 block:(id)a5
{
  return [(PhotosControlPhotoLibraryCommand *)self runOnManagedObjectArgumentsWithEntityName:a3 identifierPropertyKey:a4 allowAll:0 additionalPredicate:0 sortDescriptors:0 block:a5];
}

- (void)setArgumentRangeForRunOnManagedObjects:(_NSRange)a3
{
  self->_argumentRangeForRunOnManagedObjects = a3;
}

- (BOOL)argument:(id)a3 isValidDouble:(double *)a4
{
  int v5 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  uint64_t v8 = 0;
  if ([v5 scanDouble:&v8] && objc_msgSend(v5, "isAtEnd"))
  {
    if (a4) {
      *(void *)a4 = v8;
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)photosCtl
{
  return self->_ctl;
}

- (void)configureWithAlternateURLToLibraryDatabase:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PhotosControlPhotoLibraryCommand.m", 94, @"Invalid parameter not satisfying: %@", @"urlToDb" object file lineNumber description];
  }
  BOOL v6 = (void *)MEMORY[0x1E4F1C180];
  id v20 = 0;
  id v7 = v5;
  uint64_t v8 = [v6 cachedModelForPersistentStoreWithURL:v7 options:0 error:&v20];
  id v9 = v20;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PhotosControlPhotoLibraryCommand.m" lineNumber:101 description:@"can't load model."];
  }
  id v10 = [v7 lastPathComponent];
  uint64_t v11 = [v10 stringByDeletingPathExtension];

  id v12 = [v7 URLByDeletingLastPathComponent];
  +[PhotosControlArbitraryPersistentContainer setDefaultDirectoryURL:v12];
  uint64_t v13 = [(NSPersistentContainer *)[PhotosControlArbitraryPersistentContainer alloc] initWithName:v11 managedObjectModel:v8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C190]) initWithURL:v7];

  [v14 setShouldMigrateStoreAutomatically:0];
  v21[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(NSPersistentContainer *)v13 setPersistentStoreDescriptions:v15];

  [(NSPersistentContainer *)v13 loadPersistentStoresWithCompletionHandler:&__block_literal_global_64936];
  uint64_t v16 = [(NSPersistentContainer *)v13 newBackgroundContext];
  moc = self->_moc;
  self->_moc = v16;
}

void __79__PhotosControlPhotoLibraryCommand_configureWithAlternateURLToLibraryDatabase___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 userInfo];
    NSLog(&cfstr_UnresolvedErro.isa, v3, v4);
  }
}

- (void)waitForGroup
{
}

- (void)leaveGroup
{
}

- (void)enterGroup
{
}

- (NSURL)libraryURL
{
  id v3 = self->_libraryURL;
  objc_sync_enter(v3);
  libraryURL = self->_libraryURL;
  if (!libraryURL)
  {
    id v5 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    BOOL v6 = self->_libraryURL;
    self->_libraryURL = v5;

    libraryURL = self->_libraryURL;
  }
  id v7 = libraryURL;
  objc_sync_exit(v3);

  return v7;
}

- (PhotosControlPhotoLibraryCommand)initWithArgc:(int)a3 argv:(char *)a4 ctl:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PhotosControlPhotoLibraryCommand;
  id v10 = [(PhotosControlCommand *)&v19 initWithArgc:v7 argv:a4];
  if (v10)
  {
    dispatch_group_t v11 = dispatch_group_create();
    group = v10->_group;
    v10->_group = (OS_dispatch_group *)v11;

    objc_storeStrong((id *)&v10->_ctl, a5);
    v10->_argumentRangeForRunOnManagedObjects.location = 0;
    v10->_argumentRangeForRunOnManagedObjects.length = 0;
    uint64_t v13 = getenv("PHOTOSCTL_LIBRARY");
    if (v13)
    {
      if (!v10->_libraryURL)
      {
        uint64_t v14 = [NSString stringWithUTF8String:v13];
        libraryArg = v10->_libraryArg;
        v10->_libraryArg = (NSString *)v14;

        uint64_t v16 = [(PhotosControlCommand *)v10 libraryURLFromArgument:v10->_libraryArg];
        libraryURL = v10->_libraryURL;
        v10->_libraryURL = (NSURL *)v16;
      }
    }
  }

  return v10;
}

+ (const)libraryOptstring
{
  return 0;
}

+ (option)libraryLongopts
{
  return 0;
}

+ (id)libraryUsagesummary
{
  return 0;
}

+ (id)libraryUsage
{
  return 0;
}

+ (option)longopts
{
  uint64_t v2 = [a1 libraryLongopts];
  if (v2)
  {
    uint64_t v3 = 0;
    do
    {
      id v4 = (_OWORD *)(v2 + v3 * 8);
      if (!*(void *)(v2 + v3 * 8)) {
        break;
      }
      v3 += 4;
      id v5 = &(&longopts_longopts)[v3];
      long long v6 = v4[1];
      *(_OWORD *)id v5 = *v4;
      *((_OWORD *)v5 + 1) = v6;
    }
    while (v3 != 392);
  }
  return (option *)&longopts_longopts;
}

+ (const)optstring
{
  if (![a1 libraryOptstring]) {
    return "l:";
  }
  uint64_t v2 = (const char *)&optstring_buffer;
  __strlcpy_chk();
  __strlcat_chk();
  return v2;
}

+ (id)usage
{
  uint64_t v3 = [a1 usagesummary];
  id v4 = [a1 libraryUsage];
  if (v4) {
    id v5 = (id)[[NSString alloc] initWithFormat:@"%@ %@", v3, v4];
  }
  else {
    id v5 = v3;
  }
  long long v6 = v5;

  return v6;
}

+ (id)usagesummary
{
  uint64_t v3 = [a1 libraryUsagesummary];
  id v4 = [NSString alloc];
  uint64_t v5 = [a1 name];
  long long v6 = (void *)v5;
  if (v3) {
    uint64_t v7 = [v4 initWithFormat:@"%@ %@ %@", v5, @"[-l|--library <path.photoslibrary>|<uuid>|<WellKnownPhotoLibraryIdentifier (1=System,3=Syndication)>]", v3];
  }
  else {
    uint64_t v7 = [v4 initWithFormat:@"%@ %@", v5, @"[-l|--library <path.photoslibrary>|<uuid>|<WellKnownPhotoLibraryIdentifier (1=System,3=Syndication)>]", v10];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

@end