@interface SHSheetContentDataSourceChangeRequest
+ (id)changeRequestForPeopleProxies:(id)a3 shareProxies:(id)a4 actionProxies:(id)a5 nearbyCountSlotID:(unsigned int)a6 activitiesByUUID:(id)a7;
+ (id)changeRequestFromState:(id)a3;
- (BOOL)animated;
- (BOOL)forceReload;
- (NSArray)actionProxies;
- (NSArray)peopleProxies;
- (NSArray)shareProxies;
- (NSDictionary)activitiesByUUID;
- (SHSheetContentDataSourceState)state;
- (int64_t)excludeSectionTypes;
- (unsigned)nearbyCountSlotID;
- (void)setActionProxies:(id)a3;
- (void)setActivitiesByUUID:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setExcludeSectionTypes:(int64_t)a3;
- (void)setForceReload:(BOOL)a3;
- (void)setNearbyCountSlotID:(unsigned int)a3;
- (void)setPeopleProxies:(id)a3;
- (void)setShareProxies:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SHSheetContentDataSourceChangeRequest

+ (id)changeRequestForPeopleProxies:(id)a3 shareProxies:(id)a4 actionProxies:(id)a5 nearbyCountSlotID:(unsigned int)a6 activitiesByUUID:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_alloc_init(SHSheetContentDataSourceChangeRequest);
  [(SHSheetContentDataSourceChangeRequest *)v15 setPeopleProxies:v14];

  [(SHSheetContentDataSourceChangeRequest *)v15 setShareProxies:v13];
  [(SHSheetContentDataSourceChangeRequest *)v15 setActionProxies:v12];

  [(SHSheetContentDataSourceChangeRequest *)v15 setActivitiesByUUID:v11];
  [(SHSheetContentDataSourceChangeRequest *)v15 setNearbyCountSlotID:v7];
  return v15;
}

+ (id)changeRequestFromState:(id)a3
{
  id v3 = a3;
  v4 = [v3 peopleProxies];
  v5 = [v3 shareProxies];
  v6 = [v3 actionProxies];
  uint64_t v7 = [v3 nearbyCountSlotID];
  v8 = [v3 activitiesByUUID];
  v9 = +[SHSheetContentDataSourceChangeRequest changeRequestForPeopleProxies:v4 shareProxies:v5 actionProxies:v6 nearbyCountSlotID:v7 activitiesByUUID:v8];

  [v9 setState:v3];
  return v9;
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (void)setPeopleProxies:(id)a3
{
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
}

- (unsigned)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(unsigned int)a3
{
  self->_nearbyCountSlotID = a3;
}

- (int64_t)excludeSectionTypes
{
  return self->_excludeSectionTypes;
}

- (void)setExcludeSectionTypes:(int64_t)a3
{
  self->_excludeSectionTypes = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (SHSheetContentDataSourceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
}

@end