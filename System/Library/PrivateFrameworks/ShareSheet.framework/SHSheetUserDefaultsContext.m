@interface SHSheetUserDefaultsContext
- (BOOL)isPresentedModally;
- (NSArray)applicationActivityTypes;
- (NSArray)excludedActivityTypes;
- (NSArray)favoritesProxies;
- (NSArray)orderedUUIDs;
- (NSArray)suggestionProxies;
- (NSDictionary)activitiesByUUID;
- (SHSheetUserDefaultsContext)initWithApplicationActivityTypes:(id)a3 activitiesByUUID:(id)a4 favoritesProxies:(id)a5 suggestionProxies:(id)a6 orderedUUIDs:(id)a7 excludedActivityTypes:(id)a8 activityCategory:(int64_t)a9 isPresentedModally:(BOOL)a10;
- (id)description;
- (int64_t)category;
@end

@implementation SHSheetUserDefaultsContext

- (SHSheetUserDefaultsContext)initWithApplicationActivityTypes:(id)a3 activitiesByUUID:(id)a4 favoritesProxies:(id)a5 suggestionProxies:(id)a6 orderedUUIDs:(id)a7 excludedActivityTypes:(id)a8 activityCategory:(int64_t)a9 isPresentedModally:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v36.receiver = self;
  v36.super_class = (Class)SHSheetUserDefaultsContext;
  v22 = [(SHSheetUserDefaultsContext *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    applicationActivityTypes = v22->_applicationActivityTypes;
    v22->_applicationActivityTypes = (NSArray *)v23;

    uint64_t v25 = [v17 copy];
    activitiesByUUID = v22->_activitiesByUUID;
    v22->_activitiesByUUID = (NSDictionary *)v25;

    uint64_t v27 = [v18 copy];
    favoritesProxies = v22->_favoritesProxies;
    v22->_favoritesProxies = (NSArray *)v27;

    uint64_t v29 = [v19 copy];
    suggestionProxies = v22->_suggestionProxies;
    v22->_suggestionProxies = (NSArray *)v29;

    uint64_t v31 = [v20 copy];
    orderedUUIDs = v22->_orderedUUIDs;
    v22->_orderedUUIDs = (NSArray *)v31;

    uint64_t v33 = [v21 copy];
    excludedActivityTypes = v22->_excludedActivityTypes;
    v22->_excludedActivityTypes = (NSArray *)v33;

    v22->_category = a9;
    v22->_isPresentedModally = a10;
  }

  return v22;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SHSheetUserDefaultsContext;
  v4 = [(SHSheetUserDefaultsContext *)&v12 description];
  v5 = [(SHSheetUserDefaultsContext *)self applicationActivityTypes];
  v6 = [(SHSheetUserDefaultsContext *)self activitiesByUUID];
  v7 = [(SHSheetUserDefaultsContext *)self favoritesProxies];
  v8 = [(SHSheetUserDefaultsContext *)self suggestionProxies];
  v9 = [(SHSheetUserDefaultsContext *)self orderedUUIDs];
  v10 = [v3 stringWithFormat:@"<%@ applicationActivityTypes:%@ activitiesByUUID:%@ favoritesProxies:%@ suggestionProxies:%@ orderedUUIDs:%@ category:%ld>", v4, v5, v6, v7, v8, v9, -[SHSheetUserDefaultsContext category](self, "category")];

  return v10;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (NSArray)favoritesProxies
{
  return self->_favoritesProxies;
}

- (NSArray)suggestionProxies
{
  return self->_suggestionProxies;
}

- (NSArray)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
  objc_storeStrong((id *)&self->_suggestionProxies, 0);
  objc_storeStrong((id *)&self->_favoritesProxies, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
}

@end