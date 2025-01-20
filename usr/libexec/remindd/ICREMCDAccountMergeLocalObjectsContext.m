@interface ICREMCDAccountMergeLocalObjectsContext
- (BOOL)didChooseToMigrate;
- (BOOL)didNotFinishMigration;
- (BOOL)isInactive;
- (BOOL)needsToFetchUserRecord;
- (BOOL)needsToMergeLocalObjects;
- (BOOL)shouldRetryMergeLocalObjects;
- (BOOL)wasMigrated;
- (ICREMCDAccountMergeLocalObjectsContext)initWithAccountIdentifier:(id)a3;
- (NSSet)objectIDsOfClassesEligibleForLocalObjectMerge;
- (NSString)accountIdentifier;
- (id)loggableDescription;
- (void)setAccountIdentifier:(id)a3;
- (void)setDidChooseToMigrate:(BOOL)a3;
- (void)setDidNotFinishMigration:(BOOL)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setNeedsToFetchUserRecord:(BOOL)a3;
- (void)setObjectIDsOfClassesEligibleForLocalObjectMerge:(id)a3;
- (void)setWasMigrated:(BOOL)a3;
- (void)validateWithAccount:(id)a3;
@end

@implementation ICREMCDAccountMergeLocalObjectsContext

- (ICREMCDAccountMergeLocalObjectsContext)initWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICREMCDAccountMergeLocalObjectsContext;
    v5 = [(ICREMCDAccountMergeLocalObjectsContext *)&v11 init];
    v6 = v5;
    if (v5)
    {
      [(ICREMCDAccountMergeLocalObjectsContext *)v5 setAccountIdentifier:v4];
      v7 = +[NSSet set];
      [(ICREMCDAccountMergeLocalObjectsContext *)v6 setObjectIDsOfClassesEligibleForLocalObjectMerge:v7];

      [(ICREMCDAccountMergeLocalObjectsContext *)v6 setWasMigrated:0];
      [(ICREMCDAccountMergeLocalObjectsContext *)v6 setDidNotFinishMigration:0];
      [(ICREMCDAccountMergeLocalObjectsContext *)v6 setNeedsToFetchUserRecord:0];
      [(ICREMCDAccountMergeLocalObjectsContext *)v6 setIsInactive:0];
      [(ICREMCDAccountMergeLocalObjectsContext *)v6 setDidChooseToMigrate:0];
    }
    self = v6;
    v8 = self;
  }
  else
  {
    v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10074DBB8();
    }

    NSLog(@"'%s' is unexpectedly nil", "accountIdentifier");
    v8 = 0;
  }

  return v8;
}

- (void)validateWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 remObjectID];

  if (v5)
  {
    v6 = [v4 remObjectID];
    v7 = [v6 uuid];
    v8 = [v7 UUIDString];
    v9 = [(ICREMCDAccountMergeLocalObjectsContext *)self accountIdentifier];
    unsigned __int8 v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      objc_super v11 = [v4 storeControllerManagedObjectContext];
      v12 = v11;
      if (!v11)
      {
        v35 = +[REMLog cloudkit];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
          sub_10074DD60();
        }

        NSLog(@"'%s' is unexpectedly nil", "managedObjectContext");
        goto LABEL_36;
      }
      v13 = [v11 storeController];
      if (!v13)
      {
        v36 = +[REMLog cloudkit];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          sub_10074DE34();
        }

        NSLog(@"'%s' is unexpectedly nil", "storeController");
        goto LABEL_35;
      }
      -[ICREMCDAccountMergeLocalObjectsContext setDidChooseToMigrate:](self, "setDidChooseToMigrate:", [v4 didChooseToMigrate]);
      -[ICREMCDAccountMergeLocalObjectsContext setWasMigrated:](self, "setWasMigrated:", [v4 daWasMigrated]);
      -[ICREMCDAccountMergeLocalObjectsContext setIsInactive:](self, "setIsInactive:", [v4 inactive]);
      if ([(ICREMCDAccountMergeLocalObjectsContext *)self needsToMergeLocalObjects])
      {
        if ([v4 didChooseToMigrate]
          && ([v4 didFinishMigration] & 1) == 0)
        {
          [(ICREMCDAccountMergeLocalObjectsContext *)self setDidNotFinishMigration:1];
          goto LABEL_35;
        }
        if ([v4 didChooseToMigrate])
        {
          v14 = [v4 ckUserRecordName];

          if (!v14)
          {
            [(ICREMCDAccountMergeLocalObjectsContext *)self setNeedsToFetchUserRecord:1];
            goto LABEL_35;
          }
          v15 = +[REMLog cloudkit];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = [(ICREMCDAccountMergeLocalObjectsContext *)self accountIdentifier];
            *(_DWORD *)buf = 138543362;
            v42 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "MergeLocalObjectsContext.validate:(MERGE.LOCAL) Gathering all cloud objectIDs that should run attempt merging local objects {accountIdentifier: %{public}@}", buf, 0xCu);
          }
          v17 = [v12 __unsafe_doesNotWorkUniversally_affectedStores];
          id v18 = [v17 count];

          if (v18 != (id)1)
          {
            v38 = +[REMLog cloudkit];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
              sub_10074DF3C();
            }
          }
          v40 = [v12 __unsafe_doesNotWorkUniversally_affectedStores];
          v19 = [v40 firstObject];
          v20 = [v19 identifier];
          v21 = [v4 objectID];
          v22 = [v21 persistentStore];
          v23 = [v22 identifier];
          unsigned __int8 v24 = [v20 isEqual:v23];

          if ((v24 & 1) == 0)
          {
            v39 = +[REMLog cloudkit];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
              sub_10074DF08();
            }
          }
          v25 = +[ICCloudContext allCloudObjectIDsOfClassesPassingTest:&stru_1008AF770 inContext:v12];
          [(ICREMCDAccountMergeLocalObjectsContext *)self setObjectIDsOfClassesEligibleForLocalObjectMerge:v25];
        }
        else
        {
          v25 = +[REMLog cloudkit];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10074DF70(self, v25);
          }
        }
      }
      else
      {
        v25 = +[REMLog cloudkit];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v37 = [(ICREMCDAccountMergeLocalObjectsContext *)self accountIdentifier];
          *(_DWORD *)buf = 138543362;
          v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "MergeLocalObjectsContext.validate:(MERGE.LOCAL) Account does not need to merge local objects {accountIdentifier: %{public}@}", buf, 0xCu);
        }
      }

LABEL_35:
LABEL_36:

      goto LABEL_37;
    }
    v29 = +[REMLog cloudkit];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_10074DFFC();
    }

    v30 = [v4 remObjectID];
    v31 = [v30 uuid];
    v32 = [v31 UUIDString];
    v33 = [(ICREMCDAccountMergeLocalObjectsContext *)self accountIdentifier];
    unsigned __int8 v34 = [v32 isEqualToString:v33];

    if ((v34 & 1) == 0)
    {
      v28 = "[cdAccount.remObjectID.uuid.UUIDString isEqualToString:self.accountIdentifier]";
      goto LABEL_23;
    }
  }
  else
  {
    v26 = +[REMLog cloudkit];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_10074DC8C();
    }

    v27 = [v4 remObjectID];

    if (!v27)
    {
      v28 = "cdAccount.remObjectID";
LABEL_23:
      NSLog(@"'%s' is unexpectedly nil", v28);
    }
  }
LABEL_37:
}

- (BOOL)needsToMergeLocalObjects
{
  BOOL v3 = [(ICREMCDAccountMergeLocalObjectsContext *)self wasMigrated];
  if (v3) {
    LOBYTE(v3) = ![(ICREMCDAccountMergeLocalObjectsContext *)self isInactive];
  }
  return v3;
}

- (BOOL)shouldRetryMergeLocalObjects
{
  BOOL v3 = [(ICREMCDAccountMergeLocalObjectsContext *)self didChooseToMigrate];
  if (v3)
  {
    if ([(ICREMCDAccountMergeLocalObjectsContext *)self didNotFinishMigration]
      || [(ICREMCDAccountMergeLocalObjectsContext *)self needsToFetchUserRecord])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(ICREMCDAccountMergeLocalObjectsContext *)self isInactive];
    }
  }
  return v3;
}

- (id)loggableDescription
{
  BOOL v3 = [(ICREMCDAccountMergeLocalObjectsContext *)self accountIdentifier];
  id v4 = +[NSString stringWithFormat:@"(accountIdentifier: %@, didChooseToMigrate: %d, wasMigrated: %d, didNotFinishMigration: %d, needsToFetchUserRecord: %d, isInactive: %d)", v3, [(ICREMCDAccountMergeLocalObjectsContext *)self didChooseToMigrate], [(ICREMCDAccountMergeLocalObjectsContext *)self wasMigrated], [(ICREMCDAccountMergeLocalObjectsContext *)self didNotFinishMigration], [(ICREMCDAccountMergeLocalObjectsContext *)self needsToFetchUserRecord], [(ICREMCDAccountMergeLocalObjectsContext *)self isInactive]];

  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSSet)objectIDsOfClassesEligibleForLocalObjectMerge
{
  return self->_objectIDsOfClassesEligibleForLocalObjectMerge;
}

- (void)setObjectIDsOfClassesEligibleForLocalObjectMerge:(id)a3
{
}

- (BOOL)wasMigrated
{
  return self->_wasMigrated;
}

- (void)setWasMigrated:(BOOL)a3
{
  self->_wasMigrated = a3;
}

- (BOOL)didNotFinishMigration
{
  return self->_didNotFinishMigration;
}

- (void)setDidNotFinishMigration:(BOOL)a3
{
  self->_didNotFinishMigration = a3;
}

- (BOOL)needsToFetchUserRecord
{
  return self->_needsToFetchUserRecord;
}

- (void)setNeedsToFetchUserRecord:(BOOL)a3
{
  self->_needsToFetchUserRecord = a3;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (BOOL)didChooseToMigrate
{
  return self->_didChooseToMigrate;
}

- (void)setDidChooseToMigrate:(BOOL)a3
{
  self->_didChooseToMigrate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsOfClassesEligibleForLocalObjectMerge, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end