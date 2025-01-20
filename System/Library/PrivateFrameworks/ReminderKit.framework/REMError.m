@interface REMError
+ (BOOL)_isCoreDataError:(id)a3;
+ (BOOL)catchObjCException:(id)a3 error:(id *)a4;
+ (BOOL)isNoSuchObjectError:(id)a3 forObjectID:(id)a4;
+ (id)_errorSanitizedForXPCFromError:(id)a3;
+ (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4 error:(id)a5 path:(id)a6 URL:(id)a7 description:(id)a8;
+ (id)accountStoreMissingError:(id)a3;
+ (id)babySatErrorWithOperationName:(id)a3;
+ (id)cancelledError;
+ (id)constraintConflictWithIdentifier:(id)a3 constraint:(id)a4;
+ (id)errorFromErrors:(id)a3;
+ (id)errorSanitizedForXPCFromError:(id)a3;
+ (id)internalErrorWithDebugDescription:(id)a3;
+ (id)internetNotReachableError;
+ (id)invalidParameterErrorWithDescription:(id)a3;
+ (id)mismatchedObjectIDWithObjectID:(id)a3 expected:(Class)a4;
+ (id)noPrimaryActiveCloudKitAccountError;
+ (id)noSuchObjectErrorWithDACalendarItemUniqueIdentifier:(id)a3;
+ (id)noSuchObjectErrorWithExternalIdentifier:(id)a3;
+ (id)noSuchObjectErrorWithObjectID:(id)a3;
+ (id)noSuchSmartListErrorWithSmartListType:(id)a3;
+ (id)notSupportedError;
+ (id)notSupportedErrorWithDebugDescription:(id)a3;
+ (id)nullifiedRelationshipErrorWithRelationshipName:(id)a3;
+ (id)retryLaterErrorWithInterval:(double)a3;
+ (id)saveErrorWithCoreDataError:(id)a3;
+ (id)sqliteErrorWithCode:(int64_t)a3 format:(id)a4;
+ (id)sqliteErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5;
+ (id)throttledErrorWithRemainingTimeInterval:(double)a3;
+ (id)tooManyLoadedStoresError;
+ (id)unauthorizedErrorWithMissingEntitlement:(id)a3;
+ (id)unauthorizedErrorWithMissingEntitlement:(id)a3 requestedAccessLevel:(id)a4 currentAccesslevel:(id)a5;
+ (id)unexpectedError;
+ (id)unexpectedNilPropertyWithClass:(Class)a3 property:(id)a4;
+ (id)unexpectedNilPropertyWithObjectID:(id)a3 property:(id)a4;
+ (id)validationErrorDifferentZoneObjectID:(id)a3 zoneOwnerName:(id)a4 parentObjectID:(id)a5 parentZoneOwnerName:(id)a6;
+ (id)validationErrorListHasNoAccount:(id)a3;
+ (id)validationErrorMoveAcrossAccount:(id)a3;
+ (id)validationErrorMoveFromAccount:(id)a3 toAccount:(id)a4 objectID:(id)a5;
+ (id)validationErrorMoveReminderFromList:(id)a3 toList:(id)a4 inAccount:(id)a5;
+ (id)validationErrorNestedSubtask:(id)a3 parentReminderID:(id)a4;
+ (id)validationErrorNotCloudKitAccount:(id)a3;
+ (id)validationErrorRemoveAccountBeingActivated:(id)a3;
+ (id)validationErrorRemoveAccountBeingInserted:(id)a3;
+ (id)validationErrorSubtaskAndParentNotOnSameList:(id)a3 parentReminderID:(id)a4;
+ (id)validationErrorUndeleteHashtagFromAnotherReminder:(id)a3 expectedReminderID:(id)a4;
+ (id)xpcPerformerUnavailableErrorWithDescription:(id)a3;
@end

@implementation REMError

+ (id)noSuchObjectErrorWithObjectID:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = a3;
  v5 = [v3 stringWithFormat:@"No such object error {objectID: %@}", v4];
  v6 = [v4 entityName];
  v7 = [v4 uuid];

  v8 = [v7 UUIDString];

  v12[0] = *MEMORY[0x1E4F28228];
  v12[1] = @"REMErrorObjectIDEntityNameKey";
  v13[0] = v5;
  v13[1] = v6;
  v12[2] = @"REMErrorObjectIDUUIDKey";
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:-3000 userInfo:v9];

  return v10;
}

+ (id)errorSanitizedForXPCFromError:(id)a3
{
  id v4 = a3;
  v5 = [a1 _errorSanitizedForXPCFromError:v4];
  v6 = [v5 domain];
  int v7 = [v6 isEqualToString:@"com.apple.reminderkit"];

  if (v7)
  {
    id v8 = v5;
  }
  else
  {
    if ([a1 _isCoreDataError:v4])
    {
      id v9 = a1;
      uint64_t v10 = -3004;
    }
    else
    {
      id v9 = a1;
      uint64_t v10 = -1;
    }
    id v8 = [v9 _errorWithCode:v10 underlyingError:v5];
  }
  v11 = v8;

  return v11;
}

+ (id)internalErrorWithDebugDescription:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v7 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-1 userInfo:v6];

  return v7;
}

+ (id)mismatchedObjectIDWithObjectID:(id)a3 expected:(Class)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[REMLogStore utility];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    +[REMError mismatchedObjectIDWithObjectID:expected:]((uint64_t)v5, (uint64_t)a4, v6);
  }

  int v7 = [NSString stringWithFormat:@"Mismatched objectID type {objectID: %@, expected: %@}", v5, a4];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28228];
  v13[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = [v8 errorWithDomain:@"com.apple.reminderkit" code:-1 userInfo:v9];

  return v10;
}

+ (id)unexpectedError
{
  return (id)[a1 internalErrorWithDebugDescription:@"Unexpected Error"];
}

+ (id)errorFromErrors:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      id v4 = [v3 firstObject];
      goto LABEL_9;
    }
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    id v13 = v3;
    int v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = &v13;
    uint64_t v9 = &v12;
  }
  else
  {
    id v5 = +[REMLogStore utility];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[REMError errorFromErrors:](v5);
    }

    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = MEMORY[0x1E4F1CBF0];
    int v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = (id *)v15;
    uint64_t v9 = &v14;
  }
  uint64_t v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
  id v4 = [v6 errorWithDomain:@"com.apple.reminderkit" code:-2 userInfo:v10];

LABEL_9:

  return v4;
}

+ (id)sqliteErrorWithCode:(int64_t)a3 format:(id)a4
{
  v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v12];

  uint64_t v9 = [a1 _errorWithCode:a3 userInfo:0 error:0 path:0 URL:0 description:v8];

  return v9;
}

+ (id)sqliteErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  id v8 = (objc_class *)NSString;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)[[v8 alloc] initWithFormat:v9 arguments:&v15];

  uint64_t v12 = [a1 _errorWithCode:a3 userInfo:0 error:0 path:v10 URL:0 description:v11];

  return v12;
}

+ (id)unauthorizedErrorWithMissingEntitlement:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Missing entitlement: %@", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-1000 userInfo:v5];

  return v6;
}

+ (id)unauthorizedErrorWithMissingEntitlement:(id)a3 requestedAccessLevel:(id)a4 currentAccesslevel:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [NSString stringWithFormat:@"Missing entitlement: %@ {requestedAccessLevel: %@, currentAccesslevel: %@}", a3, a4, a5];
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28228];
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [v6 errorWithDomain:@"com.apple.reminderkit" code:-1000 userInfo:v7];

  return v8;
}

+ (id)throttledErrorWithRemainingTimeInterval:(double)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Operation is throttled {remainingTime: %.4f}", *(void *)&a3);
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-1002 userInfo:v5];

  return v6;
}

+ (id)babySatErrorWithOperationName:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Operation is babysat {operationName: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-1003 userInfo:v5];

  return v6;
}

+ (id)cancelledError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:-1001 userInfo:0];
}

+ (id)retryLaterErrorWithInterval:(double)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = @"REMErrorRetryAfterKey";
  id v4 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(a3, 0.0));
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-1004 userInfo:v5];

  return v6;
}

+ (id)tooManyLoadedStoresError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:-1005 userInfo:0];
}

+ (id)notSupportedError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:-1006 userInfo:0];
}

+ (id)notSupportedErrorWithDebugDescription:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-1006 userInfo:v6];

  return v7;
}

+ (id)internetNotReachableError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:-1007 userInfo:0];
}

+ (BOOL)isNoSuchObjectError:(id)a3 forObjectID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 domain];
  if ([v7 isEqualToString:@"com.apple.reminderkit"])
  {
    uint64_t v8 = [v5 code];

    if (v8 == -3000)
    {
      uint64_t v9 = [v5 userInfo];
      uint64_t v10 = objc_opt_class();
      v11 = [v9 objectForKeyedSubscript:@"REMErrorObjectIDEntityNameKey"];
      uint64_t v12 = REMDynamicCast(v10, (uint64_t)v11);

      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [v9 objectForKeyedSubscript:@"REMErrorObjectIDUUIDKey"];
      uint64_t v15 = REMDynamicCast(v13, (uint64_t)v14);

      if (v12 && v15)
      {
        v16 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v15];
        if (v16)
        {
          v17 = [v6 entityName];
          if ([v17 isEqualToString:v12])
          {
            v18 = [v6 uuid];
            char v19 = [v18 isEqual:v16];
          }
          else
          {
            char v19 = 0;
          }

          goto LABEL_18;
        }
        v20 = +[REMLog utility];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          +[REMError isNoSuchObjectError:forObjectID:]((uint64_t)v15, v20);
        }
      }
      else
      {
        v16 = +[REMLog utility];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          +[REMError isNoSuchObjectError:forObjectID:]((uint64_t)v9, v16);
        }
      }
      char v19 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
  }
  char v19 = 0;
LABEL_19:

  return v19;
}

+ (id)noSuchObjectErrorWithExternalIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"No such object error {externalIdentifier: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3000 userInfo:v5];

  return v6;
}

+ (id)noSuchObjectErrorWithDACalendarItemUniqueIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"No such object error {daCalendarItemUniqueIdentifier: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3000 userInfo:v5];

  return v6;
}

+ (id)noSuchSmartListErrorWithSmartListType:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"No such smart list error {smartListType: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3006 userInfo:v5];

  return v6;
}

+ (id)noPrimaryActiveCloudKitAccountError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"No active CloudKit account is currently logged in or enabled"];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28228];
  v8[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-3007 userInfo:v4];

  return v5;
}

+ (id)accountStoreMissingError:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Persistent store not found for some of the changed objects {accountIdentifiers: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3008 userInfo:v5];

  return v6;
}

+ (id)saveErrorWithCoreDataError:(id)a3
{
  id v4 = [a1 _errorSanitizedForXPCFromError:a3];
  id v5 = [a1 _errorWithCode:-3001 underlyingError:v4];

  return v5;
}

+ (id)validationErrorMoveAcrossAccount:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Moving object across is unsupported {objectID: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v5];

  return v6;
}

+ (id)validationErrorMoveFromAccount:(id)a3 toAccount:(id)a4 objectID:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [NSString stringWithFormat:@"Moving between accounts is unsupported {fromAccountID: %@, toAccountID: %@: objectID: %@}", a3, a4, a5];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28228];
  v11[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [v6 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v7];

  return v8;
}

+ (id)validationErrorListHasNoAccount:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"List should not have nil account {listID: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v5];

  return v6;
}

+ (id)validationErrorMoveReminderFromList:(id)a3 toList:(id)a4 inAccount:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [NSString stringWithFormat:@"Moving between lists is unsupported in this account {fromListID: %@, toListID: %@, accountID: %@}", a3, a4, a5];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28228];
  v11[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [v6 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v7];

  return v8;
}

+ (id)validationErrorNestedSubtask:(id)a3 parentReminderID:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"Nested subtasks is unsupported {parentReminderID: %@, reminderID: %@}", a4, a3];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v6];

  return v7;
}

+ (id)validationErrorSubtaskAndParentNotOnSameList:(id)a3 parentReminderID:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"Subtask has different list from its parent reminder {parentReminderID: %@, reminderID: %@}", a4, a3];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v6];

  return v7;
}

+ (id)validationErrorUndeleteHashtagFromAnotherReminder:(id)a3 expectedReminderID:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"Unable to undelete hashtag from another reminder {hashtagID: %@, reminderID: %@}", a3, a4];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v6];

  return v7;
}

+ (id)validationErrorNotCloudKitAccount:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Action is unavailable to non-CloudKit account {accountID: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v5];

  return v6;
}

+ (id)validationErrorRemoveAccountBeingInserted:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Removing an account at the same time inserting it is unsupported {accountID: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v5];

  return v6;
}

+ (id)validationErrorRemoveAccountBeingActivated:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"Removing an account at the same time setting it as active is unsupported {accountID: %@}", a3];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v4 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v5];

  return v6;
}

+ (id)validationErrorDifferentZoneObjectID:(id)a3 zoneOwnerName:(id)a4 parentObjectID:(id)a5 parentZoneOwnerName:(id)a6
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = [NSString stringWithFormat:@"Object { id: %@, zoneOwner: %@} and its parent { id: %@, zoneOwner: %@} with different zones are unsupported", a3, a4, a5, a6];
  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  v12[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v7 errorWithDomain:@"com.apple.reminderkit" code:-3002 userInfo:v8];

  return v9;
}

+ (id)constraintConflictWithIdentifier:(id)a3 constraint:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"Unhandled constraint conflict {identifier: %@, constraint: %@}", a3, a4];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.reminderkit" code:-3003 userInfo:v6];

  return v7;
}

+ (id)nullifiedRelationshipErrorWithRelationshipName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-3005 userInfo:v6];

  return v7;
}

+ (id)invalidParameterErrorWithDescription:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-4000 userInfo:v6];

  return v7;
}

+ (id)unexpectedNilPropertyWithClass:(Class)a3 property:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"Unexpected nil property {class: %@, property: %@}", a3, a4];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.reminderkit" code:-4001 userInfo:v6];

  return v7;
}

+ (id)unexpectedNilPropertyWithObjectID:(id)a3 property:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"Unexpected nil property {remObjectID: %@, property: %@}", a3, a4];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.reminderkit" code:-4001 userInfo:v6];

  return v7;
}

+ (id)xpcPerformerUnavailableErrorWithDescription:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"com.apple.reminderkit" code:-5000 userInfo:v6];

  return v7;
}

+ (BOOL)catchObjCException:(id)a3 error:(id *)a4
{
  id v4 = (void (**)(void))a3;
  v4[2]();

  return 1;
}

+ (BOOL)_isCoreDataError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 domain];
    char v5 = [v6 isEqualToString:*MEMORY[0x1E4F1BF50]];
  }
  return v5;
}

+ (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:a3 userInfo:v7];

  return v8;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4 error:(id)a5 path:(id)a6 URL:(id)a7 description:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [v13 mutableCopy];
  char v19 = (void *)v18;
  if (!v14 && !v15 && !v16 && !v17) {
    goto LABEL_14;
  }
  if (!v18)
  {
    char v19 = objc_opt_new();
    if (!v14) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v14) {
LABEL_7:
  }
    [v19 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
LABEL_8:
  if (v15) {
    [v19 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  }
  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
  }
  if (v17)
  {
    [v19 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v19 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
LABEL_14:
  v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.reminderkit" code:a3 userInfo:v13];

  return v20;
}

+ (id)_errorSanitizedForXPCFromError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 userInfo];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v7)
  {
    uint64_t v8 = [v3 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:v6];
    [v4 setObject:v9 forKeyedSubscript:v6];
  }
  uint64_t v10 = [v3 userInfo];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];

  if (v12)
  {
    id v13 = [v3 userInfo];
    id v14 = [v13 objectForKeyedSubscript:v11];
    [v4 setObject:v14 forKeyedSubscript:v11];
  }
  id v15 = [v3 userInfo];
  id v16 = [v15 objectForKeyedSubscript:@"REMErrorObjectIDEntityNameKey"];

  if (v16)
  {
    id v17 = [v3 userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"REMErrorObjectIDEntityNameKey"];
    [v4 setObject:v18 forKeyedSubscript:@"REMErrorObjectIDEntityNameKey"];
  }
  char v19 = [v3 userInfo];
  v20 = [v19 objectForKeyedSubscript:@"REMErrorObjectIDUUIDKey"];

  if (v20)
  {
    v21 = [v3 userInfo];
    v22 = [v21 objectForKeyedSubscript:@"REMErrorObjectIDUUIDKey"];
    [v4 setObject:v22 forKeyedSubscript:@"REMErrorObjectIDUUIDKey"];
  }
  v23 = [v3 userInfo];
  v24 = [v23 objectForKeyedSubscript:@"NSUnderlyingException"];

  if (v24)
  {
    v25 = NSString;
    v26 = [v24 name];
    v27 = [v24 reason];
    v28 = [v25 stringWithFormat:@"exception.name: %@, reason: %@", v26, v27];
    [v4 setObject:v28 forKeyedSubscript:v11];
  }
  v29 = (void *)MEMORY[0x1E4F28C58];
  v30 = [v3 domain];
  v31 = objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v3, "code"), v4);

  return v31;
}

+ (void)mismatchedObjectIDWithObjectID:(os_log_t)log expected:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Mismatched objectID type {objectID: %@, expected: %@}", (uint8_t *)&v3, 0x16u);
}

+ (void)errorFromErrors:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "No error object to produce REMErrorCodeMultipleErrors.", v1, 2u);
}

+ (void)isNoSuchObjectError:(uint64_t)a1 forObjectID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "noSuchObject REMError has an invalid UUID string {errorUUIDString: %{public}@}", (uint8_t *)&v2, 0xCu);
}

+ (void)isNoSuchObjectError:(uint64_t)a1 forObjectID:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "noSuchObject REMError has unexpected keys {error.userInfo: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end