@interface SHSheetContentDataSourceState
- (NSArray)actionProxies;
- (NSArray)extensionActionIdentifiers;
- (NSArray)favoriteActionIdentifiers;
- (NSArray)heroActionIdentifiers;
- (NSArray)informationalActionIdentifiers;
- (NSArray)peopleIdentifiers;
- (NSArray)peopleProxies;
- (NSArray)shareIdentifiers;
- (NSArray)shareProxies;
- (NSArray)systemActionIdentifiers;
- (NSDictionary)actionProxyByUUID;
- (NSDictionary)activitiesByUUID;
- (NSDictionary)customActionIdentifiersByCustomSectionIdentifier;
- (NSDictionary)peopleProxyByUUID;
- (NSDictionary)shareProxyByUUID;
- (NSOrderedSet)customSectionIdentifiers;
- (UIAirDropNode)airDropProxy;
- (unsigned)nearbyCountSlotID;
- (void)logDiagnosticProperties;
- (void)setActionProxies:(id)a3;
- (void)setActionProxyByUUID:(id)a3;
- (void)setActivitiesByUUID:(id)a3;
- (void)setAirDropProxy:(id)a3;
- (void)setCustomActionIdentifiersByCustomSectionIdentifier:(id)a3;
- (void)setCustomSectionIdentifiers:(id)a3;
- (void)setExtensionActionIdentifiers:(id)a3;
- (void)setFavoriteActionIdentifiers:(id)a3;
- (void)setHeroActionIdentifiers:(id)a3;
- (void)setInformationalActionIdentifiers:(id)a3;
- (void)setNearbyCountSlotID:(unsigned int)a3;
- (void)setPeopleIdentifiers:(id)a3;
- (void)setPeopleProxies:(id)a3;
- (void)setPeopleProxyByUUID:(id)a3;
- (void)setShareIdentifiers:(id)a3;
- (void)setShareProxies:(id)a3;
- (void)setShareProxyByUUID:(id)a3;
- (void)setSystemActionIdentifiers:(id)a3;
@end

@implementation SHSheetContentDataSourceState

- (void)logDiagnosticProperties
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = 138412290;
    uint64_t v45 = objc_opt_class();
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "<START %@>", (uint8_t *)&v44, 0xCu);
  }

  v4 = [(SHSheetContentDataSourceState *)self peopleIdentifiers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(SHSheetContentDataSourceState *)self peopleIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v7;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "peopleIdentifiers%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v8 = [(SHSheetContentDataSourceState *)self shareIdentifiers];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(SHSheetContentDataSourceState *)self shareIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v11;
      _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "shareIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v12 = [(SHSheetContentDataSourceState *)self heroActionIdentifiers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = share_sheet_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(SHSheetContentDataSourceState *)self heroActionIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v15;
      _os_log_impl(&dword_1A0AD8000, v14, OS_LOG_TYPE_DEFAULT, "heroActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v16 = [(SHSheetContentDataSourceState *)self informationalActionIdentifiers];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = share_sheet_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(SHSheetContentDataSourceState *)self informationalActionIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v19;
      _os_log_impl(&dword_1A0AD8000, v18, OS_LOG_TYPE_DEFAULT, "informationalActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v20 = [(SHSheetContentDataSourceState *)self favoriteActionIdentifiers];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = share_sheet_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(SHSheetContentDataSourceState *)self favoriteActionIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v23;
      _os_log_impl(&dword_1A0AD8000, v22, OS_LOG_TYPE_DEFAULT, "favoriteActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v24 = [(SHSheetContentDataSourceState *)self systemActionIdentifiers];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(SHSheetContentDataSourceState *)self systemActionIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v27;
      _os_log_impl(&dword_1A0AD8000, v26, OS_LOG_TYPE_DEFAULT, "systemActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v28 = [(SHSheetContentDataSourceState *)self extensionActionIdentifiers];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    v30 = share_sheet_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(SHSheetContentDataSourceState *)self extensionActionIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v31;
      _os_log_impl(&dword_1A0AD8000, v30, OS_LOG_TYPE_DEFAULT, "extensionActionIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v32 = [(SHSheetContentDataSourceState *)self customSectionIdentifiers];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    v34 = share_sheet_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [(SHSheetContentDataSourceState *)self customSectionIdentifiers];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v35;
      _os_log_impl(&dword_1A0AD8000, v34, OS_LOG_TYPE_DEFAULT, "customSectionIdentifiers:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  v36 = [(SHSheetContentDataSourceState *)self activitiesByUUID];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    v38 = share_sheet_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [(SHSheetContentDataSourceState *)self activitiesByUUID];
      int v44 = 138412290;
      uint64_t v45 = (uint64_t)v39;
      _os_log_impl(&dword_1A0AD8000, v38, OS_LOG_TYPE_DEFAULT, "activitiesByUUID:%@", (uint8_t *)&v44, 0xCu);
    }
  }
  if ([(SHSheetContentDataSourceState *)self nearbyCountSlotID])
  {
    v40 = share_sheet_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = [(SHSheetContentDataSourceState *)self nearbyCountSlotID];
      int v44 = 67109120;
      LODWORD(v45) = v41;
      _os_log_impl(&dword_1A0AD8000, v40, OS_LOG_TYPE_DEFAULT, "nearbyCountSlotID:%u", (uint8_t *)&v44, 8u);
    }
  }
  v42 = share_sheet_log();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = objc_opt_class();
    int v44 = 138412290;
    uint64_t v45 = v43;
    _os_log_impl(&dword_1A0AD8000, v42, OS_LOG_TYPE_DEFAULT, "<END %@>", (uint8_t *)&v44, 0xCu);
  }
}

- (UIAirDropNode)airDropProxy
{
  return self->_airDropProxy;
}

- (void)setAirDropProxy:(id)a3
{
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (void)setPeopleProxies:(id)a3
{
}

- (NSDictionary)peopleProxyByUUID
{
  return self->_peopleProxyByUUID;
}

- (void)setPeopleProxyByUUID:(id)a3
{
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (void)setPeopleIdentifiers:(id)a3
{
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
}

- (NSDictionary)shareProxyByUUID
{
  return self->_shareProxyByUUID;
}

- (void)setShareProxyByUUID:(id)a3
{
}

- (NSArray)shareIdentifiers
{
  return self->_shareIdentifiers;
}

- (void)setShareIdentifiers:(id)a3
{
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
}

- (NSDictionary)actionProxyByUUID
{
  return self->_actionProxyByUUID;
}

- (void)setActionProxyByUUID:(id)a3
{
}

- (NSArray)heroActionIdentifiers
{
  return self->_heroActionIdentifiers;
}

- (void)setHeroActionIdentifiers:(id)a3
{
}

- (NSArray)informationalActionIdentifiers
{
  return self->_informationalActionIdentifiers;
}

- (void)setInformationalActionIdentifiers:(id)a3
{
}

- (NSArray)favoriteActionIdentifiers
{
  return self->_favoriteActionIdentifiers;
}

- (void)setFavoriteActionIdentifiers:(id)a3
{
}

- (NSArray)systemActionIdentifiers
{
  return self->_systemActionIdentifiers;
}

- (void)setSystemActionIdentifiers:(id)a3
{
}

- (NSArray)extensionActionIdentifiers
{
  return self->_extensionActionIdentifiers;
}

- (void)setExtensionActionIdentifiers:(id)a3
{
}

- (NSDictionary)customActionIdentifiersByCustomSectionIdentifier
{
  return self->_customActionIdentifiersByCustomSectionIdentifier;
}

- (void)setCustomActionIdentifiersByCustomSectionIdentifier:(id)a3
{
}

- (NSOrderedSet)customSectionIdentifiers
{
  return self->_customSectionIdentifiers;
}

- (void)setCustomSectionIdentifiers:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_customSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_customActionIdentifiersByCustomSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_systemActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_favoriteActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_informationalActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_heroActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionProxyByUUID, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareIdentifiers, 0);
  objc_storeStrong((id *)&self->_shareProxyByUUID, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_peopleProxyByUUID, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
  objc_storeStrong((id *)&self->_airDropProxy, 0);
}

@end