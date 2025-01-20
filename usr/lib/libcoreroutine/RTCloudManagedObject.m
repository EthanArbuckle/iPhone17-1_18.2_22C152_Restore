@interface RTCloudManagedObject
+ (id)entityNamesEligibleForDeletionByOtherDevices;
+ (id)notTombstonedPredicate;
+ (id)tombstonedPredicate;
- (NSUUID)identifier;
- (void)awakeFromInsert;
- (void)setIdentifier:(id)a3;
- (void)willChangeValueForKey:(id)a3;
@end

@implementation RTCloudManagedObject

- (NSUUID)identifier
{
  [(RTCloudManagedObject *)self willAccessValueForKey:@"identifier"];
  v3 = [(RTCloudManagedObject *)self primitiveValueForKey:@"identifier"];
  [(RTCloudManagedObject *)self didAccessValueForKey:@"identifier"];

  return (NSUUID *)v3;
}

+ (id)entityNamesEligibleForDeletionByOtherDevices
{
  return &unk_1F3453438;
}

+ (id)notTombstonedPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NULL", @"flags"];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K & %lu) != %lu", @"flags", 1, 1];
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v8[0] = v2;
  v8[1] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v4 orPredicateWithSubpredicates:v5];

  return v6;
}

- (void)setIdentifier:(id)a3
{
  id v7 = a3;
  v4 = [(RTCloudManagedObject *)self identifier];
  char v5 = [v7 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(RTCloudManagedObject *)self willChangeValueForKey:@"identifier"];
    [(RTCloudManagedObject *)self setPrimitiveValue:v7 forKey:@"identifier"];
    [(RTCloudManagedObject *)self didChangeValueForKey:@"identifier"];
    v6 = [v7 UUIDString];
    [(RTCloudManagedObject *)self setCkRecordID:v6];
  }
}

+ (id)tombstonedPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL", @"flags"];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K & %lu) == %lu", @"flags", 1, 1];
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v8[0] = v2;
  v8[1] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v4 andPredicateWithSubpredicates:v5];

  return v6;
}

- (void)awakeFromInsert
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)RTCloudManagedObject;
  [(RTCloudManagedObject *)&v11 awakeFromInsert];
  v3 = [(RTCloudManagedObject *)self managedObjectContext];
  v4 = [v3 undoManager];

  if (v4)
  {
    char v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTCloudManagedObject awakeFromInsert]";
      __int16 v14 = 1024;
      int v15 = 94;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Managed object contexts inserting subclasses of RTCloudManagedObject cannot have an undo manager. (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [(RTCloudManagedObject *)self managedObjectContext];
    id v7 = [v6 transactionAuthor];
    char v8 = [v7 hasPrefix:@"NSCloudKitMirroringDelegate"];

    if ((v8 & 1) == 0)
    {
      v9 = [(RTCloudManagedObject *)self managedObjectContext];
      v10 = [v9 currentDevice];
      [(RTCloudManagedObject *)self setDevice:v10];
    }
  }
}

- (void)willChangeValueForKey:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)RTCloudManagedObject;
  [(RTCloudManagedObject *)&v42 willChangeValueForKey:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = [(RTCloudManagedObject *)self managedObjectContext];
      v6 = [v5 transactionAuthor];
      if ([v6 hasPrefix:@"NSCloudKitMirroringDelegate"])
      {

LABEL_5:
        goto LABEL_27;
      }
      id v7 = [(RTCloudManagedObject *)self managedObjectContext];
      char v8 = [v7 transactionAuthor];
      char v9 = [v8 hasPrefix:@"RTPersistenceStoreImporter"];

      if ((v9 & 1) == 0
        && ([v4 isEqualToString:@"flags"] & 1) == 0
        && ([v4 isEqualToString:@"expirationDate"] & 1) == 0)
      {
        v10 = [(RTCloudManagedObject *)self device];
        uint64_t v11 = [v10 identifier];
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [(RTCloudManagedObject *)self device];
          __int16 v14 = [v13 identifier];
          int v15 = [(RTCloudManagedObject *)self managedObjectContext];
          uint64_t v16 = [v15 currentDevice];
          v17 = [v16 identifier];
          char v18 = [v14 isEqual:v17];

          if ((v18 & 1) == 0)
          {
            v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v44 = v4;
              __int16 v45 = 2112;
              v46 = self;
              _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Attempting to modify property, %@, on a cloud managed object, %@", buf, 0x16u);
            }

            v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = [(RTCloudManagedObject *)self device];
              v22 = [v21 identifier];
              v23 = [v22 UUIDString];
              v24 = [(RTCloudManagedObject *)self managedObjectContext];
              v25 = [v24 currentDevice];
              v26 = [v25 identifier];
              v27 = [v26 UUIDString];
              *(_DWORD *)buf = 138412546;
              id v44 = v23;
              __int16 v45 = 2112;
              v46 = v27;
              _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "object device, %@, current device, %@.", buf, 0x16u);
            }
            v41 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v28 = *MEMORY[0x1E4F1C3B8];
            v29 = NSString;
            v30 = [(RTCloudManagedObject *)self device];
            v31 = [v30 identifier];
            if (v31) {
              v32 = @"YES";
            }
            else {
              v32 = @"NO";
            }
            v33 = [(RTCloudManagedObject *)self managedObjectContext];
            v34 = [v33 currentDevice];
            v35 = [v34 identifier];
            if (v35) {
              v36 = @"YES";
            }
            else {
              v36 = @"NO";
            }
            v37 = [v29 stringWithFormat:@"Attempting to modify property on a cloud managed object, device id nonnull, %@, managed object id nonnull, %@", v32, v36];
            id v38 = [v41 exceptionWithName:v28 reason:v37 userInfo:0];

            objc_exception_throw(v38);
          }
        }
        else
        {
        }
        v39 = [(RTCloudManagedObject *)self managedObjectContext];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          char v5 = [(RTCloudManagedObject *)self managedObjectContext];
          if ([v5 allowTombstones] & 1) == 0 && (-[RTCloudManagedObject flags](self, "flags")) {
            +[RTException dontOpenDeadInside];
          }
          goto LABEL_5;
        }
      }
    }
  }
LABEL_27:
}

@end