@interface DMDPayloadMetadata
+ (BOOL)automaticallyNotifiesObserversOfLastStatusReportTimestamp;
+ (BOOL)automaticallyNotifiesObserversOfStateDictionary;
+ (id)fetchRequestForActivePayloadMetadatasFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4;
+ (id)fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4;
+ (id)fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:(id)a3;
+ (id)keyPathsForValuesAffectingStatus;
+ (id)metadataWithPayloadDictionary:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)validateProperties:(id *)a3;
- (DMDPayloadMetadata)init;
- (DMDPayloadMetadata)initWithContext:(id)a3;
- (DMDPayloadMetadata)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSString)status;
- (id)description;
- (id)descriptiveProperties;
- (void)setLastStatusReportTimestamp:(id)a3;
- (void)setNeedsRefreshStatus;
- (void)setStateDictionary:(id)a3;
- (void)willSave;
@end

@implementation DMDPayloadMetadata

+ (id)fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  if (v6)
  {
    v9 = +[NSPredicate predicateWithFormat:@"%K = %@", @"organization.identifier", v6];
    [v8 addObject:v9];
  }
  if (v7) {
    [v8 addObject:v7];
  }
  v10 = [a1 fetchRequest];
  v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [v10 setPredicate:v11];

  return v10;
}

+ (id)fetchRequestForActivePayloadMetadatasFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = +[NSPredicate predicateWithFormat:@"%K = %@", @"identifier", a4];
  v8 = [a1 fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v6 matchingPredicate:v7];

  return v8;
}

+ (id)fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"pendingStatusUpdate", &__kCFBooleanTrue];
  id v6 = [a1 fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v4 matchingPredicate:v5];

  return v6;
}

+ (id)metadataWithPayloadDictionary:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = DMFDeclarationPayloadTypeKey;
  v14 = [v10 objectForKeyedSubscript:DMFDeclarationPayloadTypeKey];
  if (![v14 hasPrefix:@"com.apple.command"]
    && ![v14 hasPrefix:@"com.apple.activation"]
    && ![v14 hasPrefix:@"com.apple.asset"]
    && ![v14 hasPrefix:@"com.apple.configuration"])
  {
    v15 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100086ACC((uint64_t)v14, v15);
    }
  }
  v16 = objc_opt_class();
  if (([v16 isSubclassOfClass:a1] & 1) == 0)
  {
    if (!a6) {
      goto LABEL_30;
    }
    v40[0] = DMFConfigurationPayloadIdentifierErrorKey;
    uint64_t v29 = [v10 objectForKeyedSubscript:DMFDeclarationPayloadIdentifierKey];
    id v19 = (id)v29;
    CFStringRef v30 = &stru_1000CC390;
    if (v29) {
      CFStringRef v30 = (const __CFString *)v29;
    }
    v40[1] = DMFInvalidParameterErrorKey;
    v41[0] = v30;
    v41[1] = v13;
    id v26 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    DMFErrorWithCodeAndUserInfo();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v17 = objc_alloc((Class)v16);
  v18 = [v16 entity];
  id v19 = [v17 initWithEntity:v18 insertIntoManagedObjectContext:v12];

  if (a1)
  {
    [v19 setType:v14];
    v20 = [v10 objectForKeyedSubscript:DMFDeclarationPayloadIdentifierKey];
    [v19 setIdentifier:v20];

    v21 = [v10 objectForKeyedSubscript:DMFDeclarationPayloadRequiresNetworkTetherKey];
    [v19 setRequiresNetworkTether:[v21 BOOLValue]];

    v22 = [[DMDPayload alloc] initWithContext:v12];
    [v19 setPayload:v22];

    v23 = [v19 payload];
    [v23 setPayloadDictionary:v10];

    [v19 setAvailable:1];
    v24 = +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:v11];
    id v35 = 0;
    v25 = [v12 executeFetchRequest:v24 error:&v35];
    id v26 = v35;

    if (v25)
    {
      v27 = [v25 firstObject];
      if (v27)
      {
        [v19 setOrganization:v27];
        [v19 setRequiresUnlockedKeychain:[v14 hasPrefix:@"com.apple.configuration.policy"] ^ 1];
        uint64_t v36 = DMFDeclarationStateStatusKey;
        uint64_t v37 = DMFDeclarationStatusQueued;
        v28 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        [v19 setStateDictionary:v28];

        [v19 applyPayloadDictionary:v10];
        if ([v19 validateProperties:a6])
        {

          goto LABEL_14;
        }
        [v12 deleteObject:v19];
      }
      else if (a6)
      {
        uint64_t v38 = DMFConfigurationOrganizationIdentifierErrorKey;
        id v39 = v11;
        v33 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        DMFErrorWithCodeAndUserInfo();
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_28:

      a6 = 0;
      goto LABEL_29;
    }
    v32 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100086A18((uint64_t)v11, v26, v32);
    }

    if (!a6) {
      goto LABEL_28;
    }
    id v31 = v26;
LABEL_19:
    *a6 = v31;
    goto LABEL_28;
  }
LABEL_14:
  id v19 = v19;
  a6 = (id *)v19;
LABEL_29:

LABEL_30:

  return a6;
}

- (id)description
{
  v2 = [(DMDPayloadMetadata *)self descriptiveProperties];
  v3 = DMFObjectDescriptionWithProperties();

  return v3;
}

- (id)descriptiveProperties
{
  v4[0] = @"type";
  v4[1] = @"identifier";
  v4[2] = @"available";
  v4[3] = @"installed";
  v4[4] = @"organization.identifier";
  v4[5] = @"requiresNetworkTether";
  v4[6] = @"requiresUnlockedKeychain";
  v4[7] = @"lastStatusReportTimestamp";
  v4[8] = @"stateChangeTimestamp";
  v2 = +[NSArray arrayWithObjects:v4 count:9];

  return v2;
}

- (NSString)status
{
  v2 = [(DMDPayloadMetadata *)self stateDictionary];
  v3 = [v2 objectForKeyedSubscript:DMFDeclarationStateStatusKey];

  return (NSString *)v3;
}

+ (id)keyPathsForValuesAffectingStatus
{
  CFStringRef v5 = @"stateDictionary";
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (void)setNeedsRefreshStatus
{
}

+ (BOOL)automaticallyNotifiesObserversOfStateDictionary
{
  return 0;
}

- (void)setStateDictionary:(id)a3
{
  id v9 = a3;
  id v4 = [(DMDPayloadMetadata *)self primitiveValueForKey:@"stateDictionary"];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    [v5 setObject:0 forKeyedSubscript:DMFDeclarationStateTimestampKey];
  }
  else if (!v9)
  {
    goto LABEL_6;
  }
  if (([v5 isEqual:v9] & 1) == 0)
  {
    [(DMDPayloadMetadata *)self willChangeValueForKey:@"stateDictionary"];
    id v6 = objc_opt_new();
    [(DMDPayloadMetadata *)self setStateChangeTimestamp:v6];

    [(DMDPayloadMetadata *)self setPendingStatusUpdate:1];
    id v7 = [v9 mutableCopy];
    v8 = [(DMDPayloadMetadata *)self stateChangeTimestamp];
    [v7 setObject:v8 forKeyedSubscript:DMFDeclarationStateTimestampKey];

    [(DMDPayloadMetadata *)self setPrimitiveValue:v7 forKey:@"stateDictionary"];
    [(DMDPayloadMetadata *)self didChangeValueForKey:@"stateDictionary"];
  }
LABEL_6:
}

+ (BOOL)automaticallyNotifiesObserversOfLastStatusReportTimestamp
{
  return 0;
}

- (void)setLastStatusReportTimestamp:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(DMDPayloadMetadata *)self primitiveValueForKey:@"lastStatusReportTimestamp"];
  if (v8 | v4 && ([(id)v4 isEqual:v8] & 1) == 0)
  {
    [(DMDPayloadMetadata *)self willChangeValueForKey:@"lastStatusReportTimestamp"];
    [(DMDPayloadMetadata *)self setPrimitiveValue:v8 forKey:@"lastStatusReportTimestamp"];
    id v5 = [(DMDPayloadMetadata *)self stateChangeTimestamp];
    id v6 = [(DMDPayloadMetadata *)self lastStatusReportTimestamp];
    id v7 = [v5 compare:v6];

    if (v7 != (id)1) {
      [(DMDPayloadMetadata *)self setPendingStatusUpdate:0];
    }
    [(DMDPayloadMetadata *)self didChangeValueForKey:@"lastStatusReportTimestamp"];
  }
}

- (void)willSave
{
  v3 = [(DMDPayloadMetadata *)self changedValues];
  id v7 = [v3 allKeys];

  if ([v7 containsObject:@"stateDictionary"])
  {
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    id v5 = [(DMDPayloadMetadata *)self organization];
    id v6 = [v5 identifier];
    [v4 postNotificationName:@"DMDConfigurationSourceStatusDidChange" object:v6];
  }
}

- (BOOL)validateProperties:(id *)a3
{
  id v5 = [(DMDPayloadMetadata *)self identifier];

  if (v5)
  {
    id v6 = [(DMDPayloadMetadata *)self type];

    if (v6) {
      return 1;
    }
    if (a3)
    {
      v10[0] = DMFConfigurationPayloadIdentifierErrorKey;
      unint64_t v8 = [(DMDPayloadMetadata *)self identifier];
      v10[1] = DMFInvalidParameterErrorKey;
      v11[0] = v8;
      v11[1] = DMFDeclarationPayloadTypeKey;
      id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      DMFErrorWithCodeAndUserInfo();
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  else if (a3)
  {
    uint64_t v12 = DMFInvalidParameterErrorKey;
    uint64_t v13 = DMFDeclarationPayloadIdentifierKey;
    unint64_t v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  }
  return 0;
}

- (BOOL)validateForInsert:(id *)a3
{
  BOOL v5 = -[DMDPayloadMetadata validateProperties:](self, "validateProperties:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDPayloadMetadata;
    LOBYTE(v5) = [(DMDPayloadMetadata *)&v7 validateForInsert:a3];
  }
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  BOOL v5 = -[DMDPayloadMetadata validateProperties:](self, "validateProperties:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDPayloadMetadata;
    LOBYTE(v5) = [(DMDPayloadMetadata *)&v7 validateForUpdate:a3];
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMDPayloadMetadata;
  return [(DMDPayloadMetadata *)&v4 validateForDelete:a3];
}

- (DMDPayloadMetadata)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DMDPayloadMetadata;
  return [(DMDPayloadMetadata *)&v5 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (DMDPayloadMetadata)initWithContext:(id)a3
{
  id v5 = a3;
  id v6 = +[NSAssertionHandler currentHandler];
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"DMDPayloadMetadata.m", 317, @"%@ cannot call %@", v7, v8 object file lineNumber description];

  id v9 = [(id)objc_opt_class() entity];
  id v10 = [(DMDPayloadMetadata *)self initWithEntity:v9 insertIntoManagedObjectContext:v5];

  return v10;
}

- (DMDPayloadMetadata)init
{
  objc_super v4 = +[NSAssertionHandler currentHandler];
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"DMDPayloadMetadata.m", 322, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  uint64_t v7 = [(id)objc_opt_class() entity];
  unint64_t v8 = [(DMDPayloadMetadata *)self initWithEntity:v7 insertIntoManagedObjectContext:0];

  return v8;
}

@end