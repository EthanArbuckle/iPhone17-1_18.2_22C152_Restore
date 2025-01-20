@interface PLShareParticipant
+ (BOOL)isCurrentUserInScopeChange:(id)a3;
+ (PLShareParticipant)participantWithCPLShareParticipant:(id)a3 inShare:(id)a4;
+ (PLShareParticipant)participantWithPLShareParticipant:(id)a3;
+ (id)_shareParticipantsWithPredicate:(id)a3 fetchLimit:(unint64_t)a4 inManagedObjectContext:(id)a5;
+ (id)entityName;
+ (id)insertInPhotoLibrary:(id)a3;
+ (id)participantsWithScope:(id)a3 inPhotoLibrary:(id)a4;
+ (id)participantsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4;
+ (id)participantsWithUserIdentifiers:(id)a3 inScope:(id)a4 inPhotoLibrary:(id)a5;
- (BOOL)_relationshipInInvalidState;
- (BOOL)_validateRelationshipConstraintForInsert:(BOOL)a3 error:(id *)a4;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)description;
- (id)shortName;
- (int64_t)acceptanceStatus;
- (int64_t)permission;
- (int64_t)role;
- (void)setAcceptanceStatus:(int64_t)a3;
- (void)setPermission:(int64_t)a3;
- (void)setRole:(int64_t)a3;
- (void)updateWithCPLShareParticipant:(id)a3 inShare:(id)a4;
- (void)willSave;
@end

@implementation PLShareParticipant

- (id)description
{
  v3 = NSString;
  v4 = [(PLShareParticipant *)self emailAddress];
  v5 = [(PLShareParticipant *)self phoneNumber];
  v6 = [(PLShareParticipant *)self nameComponents];
  v7 = [(PLShareParticipant *)self userIdentifier];
  v8 = [(PLShareParticipant *)self participantID];
  v9 = objc_msgSend(MEMORY[0x1E4F59978], "descriptionForRole:", -[PLShareParticipant role](self, "role"));
  v10 = objc_msgSend(MEMORY[0x1E4F59978], "descriptionForAcceptanceStatus:", -[PLShareParticipant acceptanceStatus](self, "acceptanceStatus"));
  v11 = objc_msgSend(MEMORY[0x1E4F59978], "descriptionForPermission:", -[PLShareParticipant permission](self, "permission"));
  v12 = [v3 stringWithFormat:@"%@|%@|%@|%@|%@ [%@|%@|%@]", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)shortName
{
  v3 = [(PLShareParticipant *)self nameComponents];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28F38];
    v5 = [(PLShareParticipant *)self nameComponents];
    v3 = [v4 localizedStringFromPersonNameComponents:v5 style:1 options:0];
  }
  if (![v3 length])
  {
    v6 = [(PLShareParticipant *)self emailAddress];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = [(PLShareParticipant *)self emailAddress];
    }
    else
    {
      v9 = [(PLShareParticipant *)self phoneNumber];
      uint64_t v10 = [v9 length];

      if (!v10) {
        goto LABEL_9;
      }
      uint64_t v8 = [(PLShareParticipant *)self phoneNumber];
    }
    v11 = (void *)v8;

    v3 = v11;
  }
LABEL_9:
  if ([v3 length]) {
    v12 = v3;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (int64_t)acceptanceStatus
{
  [(PLShareParticipant *)self willAccessValueForKey:@"acceptanceStatus"];
  v3 = [(PLShareParticipant *)self primitiveValueForKey:@"acceptanceStatus"];
  int64_t v4 = [v3 integerValue];

  [(PLShareParticipant *)self didAccessValueForKey:@"acceptanceStatus"];
  return v4;
}

- (void)setAcceptanceStatus:(int64_t)a3
{
  [(PLShareParticipant *)self willChangeValueForKey:@"acceptanceStatus"];
  v5 = [NSNumber numberWithInteger:a3];
  [(PLShareParticipant *)self setPrimitiveValue:v5 forKey:@"acceptanceStatus"];

  [(PLShareParticipant *)self didChangeValueForKey:@"acceptanceStatus"];
}

- (int64_t)role
{
  [(PLShareParticipant *)self willAccessValueForKey:@"role"];
  v3 = [(PLShareParticipant *)self primitiveValueForKey:@"role"];
  int64_t v4 = [v3 integerValue];

  [(PLShareParticipant *)self didAccessValueForKey:@"role"];
  return v4;
}

- (void)setRole:(int64_t)a3
{
  [(PLShareParticipant *)self willChangeValueForKey:@"role"];
  v5 = [NSNumber numberWithInteger:a3];
  [(PLShareParticipant *)self setPrimitiveValue:v5 forKey:@"role"];

  [(PLShareParticipant *)self didChangeValueForKey:@"role"];
}

- (int64_t)permission
{
  [(PLShareParticipant *)self willAccessValueForKey:@"permission"];
  v3 = [(PLShareParticipant *)self primitiveValueForKey:@"permission"];
  int64_t v4 = [v3 integerValue];

  [(PLShareParticipant *)self didAccessValueForKey:@"permission"];
  return v4;
}

- (void)setPermission:(int64_t)a3
{
  [(PLShareParticipant *)self willChangeValueForKey:@"permission"];
  v5 = [NSNumber numberWithInteger:a3];
  [(PLShareParticipant *)self setPrimitiveValue:v5 forKey:@"permission"];

  [(PLShareParticipant *)self didChangeValueForKey:@"permission"];
}

- (BOOL)validateForUpdate:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLShareParticipant;
  BOOL v5 = -[PLShareParticipant validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5) {
    LOBYTE(v5) = [(PLShareParticipant *)self _validateRelationshipConstraintForInsert:0 error:a3];
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLShareParticipant;
  BOOL v5 = -[PLShareParticipant validateForInsert:](&v7, sel_validateForInsert_);
  if (v5) {
    LOBYTE(v5) = [(PLShareParticipant *)self _validateRelationshipConstraintForInsert:1 error:a3];
  }
  return v5;
}

- (BOOL)_validateRelationshipConstraintForInsert:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(PLShareParticipant *)self _relationshipInInvalidState];
  if (v7)
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      if (v5) {
        v9 = @"insert";
      }
      else {
        v9 = @"update";
      }
      uint64_t v10 = [(PLShareParticipant *)self description];
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "Attemping to %@ an orphaned ShareParticipant. An ShareParticipant object should always have a Share relationship set: %@", buf, 0x16u);
    }
    if (a4)
    {
      v11 = NSString;
      if (v5) {
        v12 = @"insert";
      }
      else {
        v12 = @"update";
      }
      id v13 = [(PLShareParticipant *)self description];
      v14 = [v11 stringWithFormat:@"Attemping to %@ an orphaned ShareParticipant. A ShareParticipant object should always have a Share relationship set: %@", v12, v13];

      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F8C500];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20 = v14;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a4 = [v15 errorWithDomain:v16 code:71001 userInfo:v17];

      +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: Orphaned ShareParticipant" radarDescription:v14];
    }
  }
  return !v7;
}

- (BOOL)_relationshipInInvalidState
{
  v2 = [(PLShareParticipant *)self share];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)updateWithCPLShareParticipant:(id)a3 inShare:(id)a4
{
  id v20 = a3;
  BOOL v5 = [v20 email];
  v6 = [v20 phoneNumber];
  BOOL v7 = [v20 nameComponents];
  uint64_t v8 = [v20 userIdentifier];
  v9 = [v20 participantID];
  uint64_t v10 = [(PLShareParticipant *)self emailAddress];
  char v11 = [v10 isEqualToString:v5];

  if ((v11 & 1) == 0) {
    [(PLShareParticipant *)self setEmailAddress:v5];
  }
  v12 = [(PLShareParticipant *)self nameComponents];
  char v13 = [v12 isEqual:v7];

  if ((v13 & 1) == 0) {
    [(PLShareParticipant *)self setNameComponents:v7];
  }
  v14 = [(PLShareParticipant *)self phoneNumber];
  char v15 = [v14 isEqualToString:v6];

  if ((v15 & 1) == 0) {
    [(PLShareParticipant *)self setPhoneNumber:v6];
  }
  uint64_t v16 = [(PLShareParticipant *)self userIdentifier];
  char v17 = [v16 isEqualToString:v8];

  if ((v17 & 1) == 0) {
    [(PLShareParticipant *)self setUserIdentifier:v8];
  }
  v18 = [(PLShareParticipant *)self participantID];
  char IsEqual = PLObjectIsEqual();

  if ((IsEqual & 1) == 0) {
    [(PLShareParticipant *)self setParticipantID:v9];
  }
  -[PLShareParticipant setRole:](self, "setRole:", [v20 role]);
  -[PLShareParticipant setAcceptanceStatus:](self, "setAcceptanceStatus:", [v20 acceptanceStatus]);
  -[PLShareParticipant setPermission:](self, "setPermission:", [v20 permission]);
  -[PLShareParticipant setIsCurrentUser:](self, "setIsCurrentUser:", [v20 isCurrentUser]);
}

- (void)willSave
{
  v8.receiver = self;
  v8.super_class = (Class)PLShareParticipant;
  [(PLManagedObject *)&v8 willSave];
  BOOL v3 = [(PLShareParticipant *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = [(PLShareParticipant *)self changedValues];
    BOOL v5 = [(PLShareParticipant *)self share];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = [v4 objectForKey:@"acceptanceStatus"];

        if (v6)
        {
          BOOL v7 = [v3 delayedSaveActions];
          [v7 recordLibraryScopeParticipantsUpdateForLibraryScope:v5];
        }
      }
    }
  }
}

+ (BOOL)isCurrentUserInScopeChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a3 share];
  int64_t v4 = [v3 participants];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isCurrentUser", (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)entityName
{
  return @"ShareParticipant";
}

+ (id)_shareParticipantsWithPredicate:(id)a3 fetchLimit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F1C0D0];
  long long v10 = +[PLShareParticipant entityName];
  long long v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setPredicate:v7];
  if (a4) {
    [v11 setFetchLimit:a4];
  }
  id v16 = 0;
  long long v12 = [v8 executeFetchRequest:v11 error:&v16];
  id v13 = v16;
  if (!v12)
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch moment share participant with predicate %@: %@", buf, 0x16u);
    }
  }
  return v12;
}

+ (id)participantsWithScope:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"share", a3];
  v9 = [v7 managedObjectContext];

  long long v10 = [a1 _shareParticipantsWithPredicate:v8 fetchLimit:0 inManagedObjectContext:v9];

  return v10;
}

+ (id)participantsWithUserIdentifiers:(id)a3 inScope:(id)a4 inPhotoLibrary:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"userIdentifier", a3];
  if (v8)
  {
    long long v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"share", v8];
    long long v12 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v10;
    v18[1] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v14 = [v12 andPredicateWithSubpredicates:v13];

    long long v10 = (void *)v14;
  }
  uint64_t v15 = [v9 managedObjectContext];
  id v16 = [a1 _shareParticipantsWithPredicate:v10 fetchLimit:0 inManagedObjectContext:v15];

  return v16;
}

+ (id)participantsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"%K in %@", @"uuid", a3];
  id v9 = [v7 managedObjectContext];

  long long v10 = [a1 _shareParticipantsWithPredicate:v8 fetchLimit:0 inManagedObjectContext:v9];

  return v10;
}

+ (PLShareParticipant)participantWithPLShareParticipant:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F59978];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 userIdentifier];
  id v7 = [v4 participantID];
  id v8 = [v4 phoneNumber];
  id v9 = [v4 emailAddress];

  long long v10 = (void *)[v5 initWithUserIdentifier:v6 participantID:v7 phoneNumber:v8 email:v9];
  return (PLShareParticipant *)v10;
}

+ (PLShareParticipant)participantWithCPLShareParticipant:(id)a3 inShare:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 email];
  id v9 = [v7 phoneNumber];
  long long v10 = [v7 userIdentifier];
  long long v11 = [v7 participantID];

  long long v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddress != nil AND emailAddress = %@) OR (phoneNumber != nil AND phoneNumber = %@) OR (userIdentifier != nil AND userIdentifier = %@) OR (participantID != nil AND participantID = %@)", v8, v9, v10, v11];
  id v13 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v14 = [v6 objectID];
  uint64_t v15 = [v13 predicateWithFormat:@"share = %@", v14];

  id v16 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v12;
  v23[1] = v15;
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v18 = [v16 andPredicateWithSubpredicates:v17];

  __int16 v19 = [v6 managedObjectContext];

  id v20 = [a1 _shareParticipantsWithPredicate:v18 fetchLimit:1 inManagedObjectContext:v19];
  uint64_t v21 = [v20 firstObject];

  return (PLShareParticipant *)v21;
}

+ (id)insertInPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PLShareParticipant.m", 59, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  id v6 = [v5 managedObjectContext];
  id v7 = [a1 entityName];
  id v8 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v6, 0);

  id v9 = [MEMORY[0x1E4F8BA08] UUIDString];
  [v8 setUuid:v9];

  return v8;
}

@end