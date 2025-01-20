@interface PDCardCloudManagerSaveRequest
- (BOOL)hasLocalPortion;
- (BOOL)hasRemotePortion;
- (BOOL)isEmpty;
- (BOOL)shouldDelayExecutionOfRemotePortion;
- (NSArray)changeEventsToErase;
- (NSArray)conflictingRemotePasses;
- (NSArray)passesToAddRemotely;
- (NSArray)passesToRemoveLocally;
- (NSArray)passesToRemoveRemotely;
- (NSArray)passesToUpdateLocally;
- (NSArray)passesToUpdateRemotely;
- (NSArray)uniqueIDsOfConflictingRemotePasses;
- (NSArray)uniqueIDsOfPassesToAddRemotely;
- (NSArray)uniqueIDsOfPassesToRemoveLocally;
- (NSArray)uniqueIDsOfPassesToRemoveRemotely;
- (NSArray)uniqueIDsOfPassesToUpdateLocally;
- (NSArray)uniqueIDsOfPassesToUpdateRemotely;
- (NSString)originator;
- (PDCardCloudManagerSaveRequest)init;
- (PKCatalog)catalogToUpdateLocally;
- (PKCatalog)catalogToUpdateRemotely;
- (id)description;
- (void)addRemotePass:(id)a3;
- (void)delayExecutionOfRemotePortion;
- (void)eraseChangeEvent:(id)a3;
- (void)removeLocalPass:(id)a3;
- (void)removeRemotePass:(id)a3;
- (void)resolveRemoteConflictingPass:(id)a3;
- (void)setOriginator:(id)a3;
- (void)updateLocalCatalogWithCatalog:(id)a3;
- (void)updateLocalPassWithPass:(id)a3;
- (void)updateRemoteCatalogWithCatalog:(id)a3;
- (void)updateRemotePassWithPass:(id)a3;
@end

@implementation PDCardCloudManagerSaveRequest

- (PDCardCloudManagerSaveRequest)init
{
  v18.receiver = self;
  v18.super_class = (Class)PDCardCloudManagerSaveRequest;
  v2 = [(PDCardCloudManagerSaveRequest *)&v18 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    passesToAddRemotelyByUniqueID = v2->_passesToAddRemotelyByUniqueID;
    v2->_passesToAddRemotelyByUniqueID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    passesToUpdateRemotelyByUniqueID = v2->_passesToUpdateRemotelyByUniqueID;
    v2->_passesToUpdateRemotelyByUniqueID = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    passesToUpdateLocallyByUniqueID = v2->_passesToUpdateLocallyByUniqueID;
    v2->_passesToUpdateLocallyByUniqueID = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    passesToRemoveRemotelyByUniqueID = v2->_passesToRemoveRemotelyByUniqueID;
    v2->_passesToRemoveRemotelyByUniqueID = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    passesToRemoveLocallyByUniqueID = v2->_passesToRemoveLocallyByUniqueID;
    v2->_passesToRemoveLocallyByUniqueID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    conflctingRemotePassesByUniqueID = v2->_conflctingRemotePassesByUniqueID;
    v2->_conflctingRemotePassesByUniqueID = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    changeEventsToErase = v2->_changeEventsToErase;
    v2->_changeEventsToErase = v15;

    v2->_shouldDelayExecutionOfRemotePortion = 0;
  }
  return v2;
}

- (NSArray)passesToAddRemotely
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToAddRemotelyByUniqueID allValues];
}

- (NSArray)passesToUpdateRemotely
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToUpdateRemotelyByUniqueID allValues];
}

- (NSArray)passesToUpdateLocally
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToUpdateLocallyByUniqueID allValues];
}

- (NSArray)passesToRemoveRemotely
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToRemoveRemotelyByUniqueID allValues];
}

- (NSArray)passesToRemoveLocally
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToRemoveLocallyByUniqueID allValues];
}

- (NSArray)conflictingRemotePasses
{
  return (NSArray *)[(NSMutableDictionary *)self->_conflctingRemotePassesByUniqueID allValues];
}

- (NSArray)changeEventsToErase
{
  id v2 = [(NSMutableArray *)self->_changeEventsToErase copy];
  return (NSArray *)v2;
}

- (BOOL)isEmpty
{
  if ([(PDCardCloudManagerSaveRequest *)self hasLocalPortion]) {
    return 0;
  }
  else {
    return ![(PDCardCloudManagerSaveRequest *)self hasRemotePortion];
  }
}

- (BOOL)hasLocalPortion
{
  return [(NSMutableDictionary *)self->_passesToUpdateLocallyByUniqueID count]
      || [(NSMutableDictionary *)self->_passesToRemoveLocallyByUniqueID count]
      || [(NSMutableDictionary *)self->_conflctingRemotePassesByUniqueID count]
      || [(NSMutableArray *)self->_changeEventsToErase count]
      || self->_catalogToUpdateLocally != 0;
}

- (BOOL)hasRemotePortion
{
  return [(NSMutableDictionary *)self->_passesToAddRemotelyByUniqueID count]
      || [(NSMutableDictionary *)self->_passesToUpdateRemotelyByUniqueID count]
      || [(NSMutableDictionary *)self->_passesToRemoveRemotelyByUniqueID count]
      || self->_catalogToUpdateRemotely != 0;
}

- (BOOL)shouldDelayExecutionOfRemotePortion
{
  return self->_shouldDelayExecutionOfRemotePortion;
}

- (void)addRemotePass:(id)a3
{
  id v5 = a3;
  v4 = [v5 uniqueID];
  if (v4) {
    [(NSMutableDictionary *)self->_passesToAddRemotelyByUniqueID setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)updateRemotePassWithPass:(id)a3
{
  id v5 = a3;
  v4 = [v5 uniqueID];
  if (v4) {
    [(NSMutableDictionary *)self->_passesToUpdateRemotelyByUniqueID setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)updateLocalPassWithPass:(id)a3
{
  id v5 = a3;
  v4 = [v5 uniqueID];
  if (v4) {
    [(NSMutableDictionary *)self->_passesToUpdateLocallyByUniqueID setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)removeRemotePass:(id)a3
{
  id v5 = a3;
  v4 = [v5 uniqueID];
  if (v4) {
    [(NSMutableDictionary *)self->_passesToRemoveRemotelyByUniqueID setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)removeLocalPass:(id)a3
{
  id v5 = a3;
  v4 = [v5 uniqueID];
  if (v4) {
    [(NSMutableDictionary *)self->_passesToRemoveLocallyByUniqueID setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)resolveRemoteConflictingPass:(id)a3
{
  id v5 = a3;
  v4 = [v5 uniqueID];
  if (v4) {
    [(NSMutableDictionary *)self->_conflctingRemotePassesByUniqueID setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)updateLocalCatalogWithCatalog:(id)a3
{
}

- (void)updateRemoteCatalogWithCatalog:(id)a3
{
}

- (void)eraseChangeEvent:(id)a3
{
}

- (void)delayExecutionOfRemotePortion
{
  self->_shouldDelayExecutionOfRemotePortion = 1;
}

- (NSArray)uniqueIDsOfPassesToAddRemotely
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToAddRemotelyByUniqueID allKeys];
}

- (NSArray)uniqueIDsOfPassesToUpdateRemotely
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToUpdateRemotelyByUniqueID allKeys];
}

- (NSArray)uniqueIDsOfPassesToUpdateLocally
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToUpdateLocallyByUniqueID allKeys];
}

- (NSArray)uniqueIDsOfPassesToRemoveRemotely
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToRemoveRemotelyByUniqueID allKeys];
}

- (NSArray)uniqueIDsOfPassesToRemoveLocally
{
  return (NSArray *)[(NSMutableDictionary *)self->_passesToRemoveLocallyByUniqueID allKeys];
}

- (NSArray)uniqueIDsOfConflictingRemotePasses
{
  return (NSArray *)[(NSMutableDictionary *)self->_conflctingRemotePassesByUniqueID allKeys];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"PDCardCloudManagerSaveRequest: \n"];
  v4 = [(PDCardCloudManagerSaveRequest *)self uniqueIDsOfPassesToAddRemotely];
  [v3 appendFormat:@"remote adds: %@ \n", v4];

  id v5 = [(PDCardCloudManagerSaveRequest *)self uniqueIDsOfPassesToUpdateRemotely];
  [v3 appendFormat:@"remote updates: %@ \n", v5];

  v6 = [(PDCardCloudManagerSaveRequest *)self uniqueIDsOfPassesToUpdateLocally];
  [v3 appendFormat:@"local updates: %@ \n", v6];

  v7 = [(PDCardCloudManagerSaveRequest *)self uniqueIDsOfPassesToRemoveRemotely];
  [v3 appendFormat:@"remote deletes: %@ \n", v7];

  v8 = [(PDCardCloudManagerSaveRequest *)self uniqueIDsOfPassesToRemoveLocally];
  [v3 appendFormat:@"local deletes: %@ \n", v8];

  v9 = [(PDCardCloudManagerSaveRequest *)self uniqueIDsOfConflictingRemotePasses];
  [v3 appendFormat:@"conflicts: %@ \n", v9];

  v10 = [(PDCardCloudManagerSaveRequest *)self catalogToUpdateRemotely];
  if (v10) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  [v3 appendFormat:@"remote catalog: %@ \n", v11];

  v12 = [(PDCardCloudManagerSaveRequest *)self catalogToUpdateLocally];
  if (v12) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  [v3 appendFormat:@"local catalog: %@ \n", v13];

  [v3 appendFormat:@"change events: %@ \n", self->_changeEventsToErase];
  id v14 = [v3 copy];

  return v14;
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (PKCatalog)catalogToUpdateRemotely
{
  return self->_catalogToUpdateRemotely;
}

- (PKCatalog)catalogToUpdateLocally
{
  return self->_catalogToUpdateLocally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogToUpdateLocally, 0);
  objc_storeStrong((id *)&self->_catalogToUpdateRemotely, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_changeEventsToErase, 0);
  objc_storeStrong((id *)&self->_conflctingRemotePassesByUniqueID, 0);
  objc_storeStrong((id *)&self->_passesToRemoveLocallyByUniqueID, 0);
  objc_storeStrong((id *)&self->_passesToRemoveRemotelyByUniqueID, 0);
  objc_storeStrong((id *)&self->_passesToUpdateLocallyByUniqueID, 0);
  objc_storeStrong((id *)&self->_passesToUpdateRemotelyByUniqueID, 0);
  objc_storeStrong((id *)&self->_passesToAddRemotelyByUniqueID, 0);
}

@end