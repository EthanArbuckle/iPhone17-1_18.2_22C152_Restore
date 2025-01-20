@interface NSError(MTAdditions)
- (uint64_t)_NSCoreDataError:()MTAdditions andThrow:;
- (uint64_t)_NSEntityMigrationPolicyError:()MTAdditions andThrow:;
- (uint64_t)_NSExternalRecordImportError:()MTAdditions andThrow:;
- (uint64_t)_NSInferredMappingModelError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectConstraintMergeError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectConstraintValidationError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectContextLockingError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectExternalRelationshipError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectMergeError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectReferentialIntegrityError:()MTAdditions andThrow:;
- (uint64_t)_NSManagedObjectValidationError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationCancelledError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationConstraintViolationError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationManagerDestinationStoreError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationManagerSourceStoreError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationMissingMappingModelError:()MTAdditions andThrow:;
- (uint64_t)_NSMigrationMissingSourceModelError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentHistoryTokenExpiredError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreCoordinatorLockingError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreIncompatibleSchemaError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreIncompatibleVersionHashError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreIncompleteSaveError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreInvalidTypeError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreOpenError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreOperationError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreSaveConflictsError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreSaveError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreTimeoutError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreTypeMismatchError:()MTAdditions andThrow:;
- (uint64_t)_NSPersistentStoreUnsupportedRequestTypeError:()MTAdditions andThrow:;
- (uint64_t)_NSSQLiteError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationDateTooLateError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationDateTooSoonError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationInvalidDateError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationInvalidURIError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationMissingMandatoryPropertyError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationMultipleErrorsError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationNumberTooLargeError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationNumberTooSmallError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationRelationshipDeniedDeleteError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationRelationshipExceedsMaximumCountError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationRelationshipLacksMinimumCountError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationStringPatternMatchingError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationStringTooLongError:()MTAdditions andThrow:;
- (uint64_t)_NSValidationStringTooShortError:()MTAdditions andThrow:;
- (uint64_t)logAndThrow:()MTAdditions;
- (void)collectErrorsAndThrow:()MTAdditions;
- (void)createErrorStackTraceForErrorCodes:()MTAdditions andThrow:;
- (void)logAndThrow:()MTAdditions printStackTrace:;
@end

@implementation NSError(MTAdditions)

- (void)logAndThrow:()MTAdditions printStackTrace:
{
  v6 = a1;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v7 = [a1 userInfo];
  v8 = [v7 objectForKey:*MEMORY[0x1E4F28230]];

  if ([v8 count])
  {
    int v39 = a4;
    int v40 = a3;
    v41 = v6;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v14 = +[IMLogger sharedLogger];
          uint64_t v15 = [v13 code];
          v16 = [v13 domain];
          v17 = [v13 userInfo];
          v18 = [v17 description];
          [v14 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Extensions/Foundation/NSError+MTAdditions.m", 24, @"[%ld %@] %@", v15, v16, v18 lineNumber format];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v10);
    }

    v6 = v41;
    a3 = v40;
    if (v39) {
      goto LABEL_10;
    }
  }
  else
  {
    v22 = +[IMLogger sharedLogger];
    uint64_t v23 = [v6 code];
    v24 = [v6 domain];
    v25 = [v6 userInfo];
    v26 = [v25 description];
    [v22 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Extensions/Foundation/NSError+MTAdditions.m", 29, @"[%ld %@] %@", v23, v24, v26 lineNumber format];

    if (a4)
    {
LABEL_10:
      v19 = +[IMLogger sharedLogger];
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 description];
      [v19 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Extensions/Foundation/NSError+MTAdditions.m", 34, @"%@", v21 lineNumber format];
    }
  }
  if (+[PFClientUtil isPodcastsApp]) {
    [v6 recordMetrics];
  }
  if (a3)
  {
    v27 = NSString;
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = [v6 domain];
    uint64_t v31 = [v27 stringWithFormat:@"%@: %@ (%ld)", v29, v30, objc_msgSend(v6, "code")];

    v32 = NSString;
    v33 = [v6 localizedDescription];
    v34 = [v6 localizedFailureReason];
    uint64_t v35 = [v32 stringWithFormat:@"%@ | %@", v33, v34];

    v36 = (void *)MEMORY[0x1E4F1CA00];
    v37 = [v6 userInfo];
    v38 = [v36 exceptionWithName:v31 reason:v35 userInfo:v37];

    [v6 collectErrorsAndThrow:v38];
    objc_exception_throw(v38);
  }
}

- (uint64_t)logAndThrow:()MTAdditions
{
  return [a1 logAndThrow:a3 printStackTrace:1];
}

- (uint64_t)_NSManagedObjectValidationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectConstraintValidationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationMultipleErrorsError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationMissingMandatoryPropertyError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationRelationshipLacksMinimumCountError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationRelationshipExceedsMaximumCountError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationRelationshipDeniedDeleteError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationNumberTooLargeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationNumberTooSmallError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationDateTooLateError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationDateTooSoonError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationInvalidDateError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationStringTooLongError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationStringTooShortError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationStringPatternMatchingError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationInvalidURIError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectContextLockingError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreCoordinatorLockingError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectReferentialIntegrityError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectExternalRelationshipError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectMergeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectConstraintMergeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreInvalidTypeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreTypeMismatchError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreIncompatibleSchemaError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreSaveError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreIncompleteSaveError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreSaveConflictsError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSCoreDataError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreOperationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreOpenError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreTimeoutError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreUnsupportedRequestTypeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreIncompatibleVersionHashError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationConstraintViolationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationCancelledError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationMissingSourceModelError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationMissingMappingModelError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationManagerSourceStoreError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationManagerDestinationStoreError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSEntityMigrationPolicyError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSSQLiteError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSInferredMappingModelError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSExternalRecordImportError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentHistoryTokenExpiredError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (void)collectErrorsAndThrow:()MTAdditions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = [a1 domain];
  uint64_t v6 = *MEMORY[0x1E4F281F8];
  int v7 = [v5 isEqual:*MEMORY[0x1E4F281F8]];

  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1, "code"));
    [v4 addObject:v8];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = objc_msgSend(a1, "userInfo", a1);
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F28230]];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 domain];
        int v17 = [v16 isEqual:v6];

        if (v17)
        {
          v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v15, "code"));
          [v4 addObject:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v19 createErrorStackTraceForErrorCodes:v4 andThrow:v20];
}

- (void)createErrorStackTraceForErrorCodes:()MTAdditions andThrow:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 containsObject:&unk_1F03D8238])
  {
    [v6 removeObject:&unk_1F03D8238];
    [a1 _NSManagedObjectValidationError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8250])
  {
    [v6 removeObject:&unk_1F03D8250];
    [a1 _NSManagedObjectConstraintValidationError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8268])
  {
    [v6 removeObject:&unk_1F03D8268];
    [a1 _NSValidationMultipleErrorsError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8280])
  {
    [v6 removeObject:&unk_1F03D8280];
    [a1 _NSValidationMissingMandatoryPropertyError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8298])
  {
    [v6 removeObject:&unk_1F03D8298];
    [a1 _NSValidationRelationshipLacksMinimumCountError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D82B0])
  {
    [v6 removeObject:&unk_1F03D82B0];
    [a1 _NSValidationRelationshipExceedsMaximumCountError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D82C8])
  {
    [v6 removeObject:&unk_1F03D82C8];
    [a1 _NSValidationRelationshipDeniedDeleteError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D82E0])
  {
    [v6 removeObject:&unk_1F03D82E0];
    [a1 _NSValidationNumberTooLargeError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D82F8])
  {
    [v6 removeObject:&unk_1F03D82F8];
    [a1 _NSValidationNumberTooSmallError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8310])
  {
    [v6 removeObject:&unk_1F03D8310];
    [a1 _NSValidationDateTooLateError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8328])
  {
    [v6 removeObject:&unk_1F03D8328];
    [a1 _NSValidationDateTooSoonError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8340])
  {
    [v6 removeObject:&unk_1F03D8340];
    [a1 _NSValidationInvalidDateError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8358])
  {
    [v6 removeObject:&unk_1F03D8358];
    [a1 _NSValidationStringTooLongError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8370])
  {
    [v6 removeObject:&unk_1F03D8370];
    [a1 _NSValidationStringTooShortError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8388])
  {
    [v6 removeObject:&unk_1F03D8388];
    [a1 _NSValidationStringPatternMatchingError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D83A0])
  {
    [v6 removeObject:&unk_1F03D83A0];
    [a1 _NSValidationInvalidURIError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D83B8])
  {
    [v6 removeObject:&unk_1F03D83B8];
    [a1 _NSManagedObjectContextLockingError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D83D0])
  {
    [v6 removeObject:&unk_1F03D83D0];
    [a1 _NSPersistentStoreCoordinatorLockingError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D83E8])
  {
    [v6 removeObject:&unk_1F03D83E8];
    [a1 _NSManagedObjectReferentialIntegrityError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8400])
  {
    [v6 removeObject:&unk_1F03D8400];
    [a1 _NSManagedObjectExternalRelationshipError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8418])
  {
    [v6 removeObject:&unk_1F03D8418];
    [a1 _NSManagedObjectMergeError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8430])
  {
    [v6 removeObject:&unk_1F03D8430];
    [a1 _NSManagedObjectConstraintMergeError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8448])
  {
    [v6 removeObject:&unk_1F03D8448];
    [a1 _NSPersistentStoreInvalidTypeError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8460])
  {
    [v6 removeObject:&unk_1F03D8460];
    [a1 _NSPersistentStoreTypeMismatchError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8478])
  {
    [v6 removeObject:&unk_1F03D8478];
    [a1 _NSPersistentStoreIncompatibleSchemaError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8490])
  {
    [v6 removeObject:&unk_1F03D8490];
    [a1 _NSPersistentStoreSaveError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D84A8])
  {
    [v6 removeObject:&unk_1F03D84A8];
    [a1 _NSPersistentStoreIncompleteSaveError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D84C0])
  {
    [v6 removeObject:&unk_1F03D84C0];
    [a1 _NSPersistentStoreSaveConflictsError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D84D8])
  {
    [v6 removeObject:&unk_1F03D84D8];
    [a1 _NSCoreDataError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D84F0])
  {
    [v6 removeObject:&unk_1F03D84F0];
    [a1 _NSPersistentStoreOperationError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8508])
  {
    [v6 removeObject:&unk_1F03D8508];
    [a1 _NSPersistentStoreOpenError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8520])
  {
    [v6 removeObject:&unk_1F03D8520];
    [a1 _NSPersistentStoreTimeoutError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8538])
  {
    [v6 removeObject:&unk_1F03D8538];
    [a1 _NSPersistentStoreUnsupportedRequestTypeError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8550])
  {
    [v6 removeObject:&unk_1F03D8550];
    [a1 _NSPersistentStoreIncompatibleVersionHashError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8568])
  {
    [v6 removeObject:&unk_1F03D8568];
    [a1 _NSMigrationError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8580])
  {
    [v6 removeObject:&unk_1F03D8580];
    [a1 _NSMigrationConstraintViolationError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8598])
  {
    [v6 removeObject:&unk_1F03D8598];
    [a1 _NSMigrationCancelledError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D85B0])
  {
    [v6 removeObject:&unk_1F03D85B0];
    [a1 _NSMigrationMissingSourceModelError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D85C8])
  {
    [v6 removeObject:&unk_1F03D85C8];
    [a1 _NSMigrationMissingMappingModelError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D85E0])
  {
    [v6 removeObject:&unk_1F03D85E0];
    [a1 _NSMigrationManagerSourceStoreError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D85F8])
  {
    [v6 removeObject:&unk_1F03D85F8];
    [a1 _NSMigrationManagerDestinationStoreError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8610])
  {
    [v6 removeObject:&unk_1F03D8610];
    [a1 _NSEntityMigrationPolicyError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8628])
  {
    [v6 removeObject:&unk_1F03D8628];
    [a1 _NSSQLiteError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8640])
  {
    [v6 removeObject:&unk_1F03D8640];
    [a1 _NSInferredMappingModelError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8658])
  {
    [v6 removeObject:&unk_1F03D8658];
    [a1 _NSExternalRecordImportError:v6 andThrow:v7];
  }
  if ([v6 containsObject:&unk_1F03D8670])
  {
    [v6 removeObject:&unk_1F03D8670];
    [a1 _NSPersistentHistoryTokenExpiredError:v6 andThrow:v7];
  }
  objc_exception_throw(v7);
}

@end