@interface MNServerSessionStateInfo
+ (BOOL)supportsSecureCoding;
- (MNServerSessionStateInfo)initWithCoder:(id)a3;
- (NSData)directionsResponseID;
- (NSData)etauResponseID;
- (NSData)sessionState;
- (NSDictionary)displayedTrafficBanners;
- (NSUUID)uniqueRouteID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addDisplayedBannerID:(id)a3 withEventInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithETAUResponse:(id)a3;
- (void)updateWithRoute:(id)a3;
- (void)updateWithSessionState:(id)a3;
@end

@implementation MNServerSessionStateInfo

- (NSDictionary)displayedTrafficBanners
{
  return (NSDictionary *)self->_displayedTrafficBanners;
}

- (void)updateWithRoute:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 directionsResponseID];

    if (v6)
    {
      v7 = [v5 routeInitializerData];
      v8 = [v7 directionsResponse];
      v9 = [v8 sessionState];
      sessionState = self->_sessionState;
      self->_sessionState = v9;

      v11 = [v5 directionsResponseID];
      directionsResponseID = self->_directionsResponseID;
      self->_directionsResponseID = v11;
      uint64_t v13 = 32;
    }
    else
    {
      v14 = [v5 etauResponseID];

      if (!v14) {
        goto LABEL_7;
      }
      v15 = [v5 routeInitializerData];
      v16 = [v15 etaTrafficUpdateResponse];
      v17 = [v16 sessionState];
      v18 = self->_sessionState;
      self->_sessionState = v17;

      v19 = [v5 etauResponseID];
      directionsResponseID = self->_etauResponseID;
      self->_etauResponseID = v19;
      uint64_t v13 = 24;
    }

    v20 = *(Class *)((char *)&self->super.isa + v13);
    *(Class *)((char *)&self->super.isa + v13) = 0;

LABEL_7:
    v21 = [v5 uniqueRouteID];
    uniqueRouteID = self->_uniqueRouteID;
    self->_uniqueRouteID = v21;

    p_super = MNGetMNServerSessionStateInfoLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      v29 = self;
      _os_log_impl(&dword_1B542B000, p_super, OS_LOG_TYPE_DEFAULT, "Updating session state with route: %@", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v28) = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: route != nil", (uint8_t *)&v28, 2u);
  }
  v24 = MNGetMNServerSessionStateInfoLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v28) = 0;
    _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_ERROR, "Server session state can't be updated with a nil route. The next directions or ETAU request will likely fail.", (uint8_t *)&v28, 2u);
  }

  v25 = self->_sessionState;
  self->_sessionState = 0;

  v26 = self->_uniqueRouteID;
  self->_uniqueRouteID = 0;

  v27 = self->_directionsResponseID;
  self->_directionsResponseID = 0;

  p_super = &self->_etauResponseID->super;
  self->_etauResponseID = 0;
LABEL_9:
}

- (void)updateWithETAUResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_uniqueRouteID)
  {
    if (!v4)
    {
      p_super = MNGetMNServerSessionStateInfoLog();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      LOWORD(v20) = 0;
      v12 = "Trying to update server session state with a nil ETAU response. Ignoring, but the next directions or ETAU request may fail.";
      uint64_t v13 = p_super;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 2;
      goto LABEL_6;
    }
    if ([v4 hasSessionState])
    {
      v6 = [v5 sessionState];
      sessionState = self->_sessionState;
      self->_sessionState = v6;

      v8 = [v5 responseId];
      etauResponseID = self->_etauResponseID;
      self->_etauResponseID = v8;

      directionsResponseID = self->_directionsResponseID;
      self->_directionsResponseID = 0;

      p_super = MNGetMNServerSessionStateInfoLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        v21 = self;
        v12 = "Updating session state from ETAU response: %@";
        uint64_t v13 = p_super;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 12;
LABEL_6:
        _os_log_impl(&dword_1B542B000, v13, v14, v12, (uint8_t *)&v20, v15);
      }
    }
    else
    {
      p_super = MNGetMNServerSessionStateInfoLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v19 = [v5 formattedText];
        int v20 = 138412290;
        v21 = v19;
        _os_log_impl(&dword_1B542B000, p_super, OS_LOG_TYPE_ERROR, "ETAU response has no session state. This is probably a server error. Full ETAU response: %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v20) = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _uniqueRouteID != nil", (uint8_t *)&v20, 2u);
    }
    v16 = MNGetMNServerSessionStateInfoLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "Server session state can only be updated from an ETAU response if there is already an existing route. The next directions or ETAU request will likely fail.", (uint8_t *)&v20, 2u);
    }

    v17 = self->_sessionState;
    self->_sessionState = 0;

    v18 = self->_directionsResponseID;
    self->_directionsResponseID = 0;

    p_super = &self->_etauResponseID->super;
    self->_etauResponseID = 0;
  }
LABEL_7:
}

- (void)addDisplayedBannerID:(id)a3 withEventInfo:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    displayedTrafficBanners = self->_displayedTrafficBanners;
    id v8 = v12;
    if (displayedTrafficBanners)
    {
      if (v6)
      {
LABEL_4:
        [(NSMutableDictionary *)displayedTrafficBanners setValue:v6 forKey:v8];
        goto LABEL_7;
      }
    }
    else
    {
      v9 = (NSMutableDictionary *)objc_opt_new();
      v10 = self->_displayedTrafficBanners;
      self->_displayedTrafficBanners = v9;

      id v8 = v12;
      displayedTrafficBanners = self->_displayedTrafficBanners;
      if (v6) {
        goto LABEL_4;
      }
    }
    v11 = [MEMORY[0x1E4F1C9B8] data];
    [(NSMutableDictionary *)displayedTrafficBanners setValue:v11 forKey:v12];
  }
LABEL_7:
}

- (void)updateWithSessionState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_uniqueRouteID)
  {
    objc_storeStrong((id *)&self->_sessionState, a3);
    etauResponseID = self->_etauResponseID;
    self->_etauResponseID = 0;

    directionsResponseID = self->_directionsResponseID;
    self->_directionsResponseID = 0;

    p_super = MNGetMNServerSessionStateInfoLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = self;
      _os_log_impl(&dword_1B542B000, p_super, OS_LOG_TYPE_DEFAULT, "Updating session state from unknown source: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _uniqueRouteID != nil", (uint8_t *)&v12, 2u);
    }
    v9 = MNGetMNServerSessionStateInfoLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Updating server session state requires an existing route. The next directions or ETAU request will likely fail.", (uint8_t *)&v12, 2u);
    }

    sessionState = self->_sessionState;
    self->_sessionState = 0;

    v11 = self->_directionsResponseID;
    self->_directionsResponseID = 0;

    p_super = &self->_etauResponseID->super;
    self->_etauResponseID = 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSData *)self->_sessionState copy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSUUID *)self->_uniqueRouteID copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSData *)self->_directionsResponseID copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSData *)self->_etauResponseID copy];
  int v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSMutableDictionary *)self->_displayedTrafficBanners copy];
  uint64_t v14 = (void *)v4[5];
  v4[5] = v13;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNServerSessionStateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MNServerSessionStateInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sessionState"];
    sessionState = v5->_sessionState;
    v5->_sessionState = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueRouteID"];
    uniqueRouteID = v5->_uniqueRouteID;
    v5->_uniqueRouteID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsResponseID"];
    directionsResponseID = v5->_directionsResponseID;
    v5->_directionsResponseID = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etauResponseID"];
    etauResponseID = v5->_etauResponseID;
    v5->_etauResponseID = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayedTrafficBanners"];
    displayedTrafficBanners = v5->_displayedTrafficBanners;
    v5->_displayedTrafficBanners = (NSMutableDictionary *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionState = self->_sessionState;
  id v5 = a3;
  [v5 encodeObject:sessionState forKey:@"_sessionState"];
  [v5 encodeObject:self->_uniqueRouteID forKey:@"_uniqueRouteID"];
  [v5 encodeObject:self->_directionsResponseID forKey:@"_directionsResponseID"];
  [v5 encodeObject:self->_etauResponseID forKey:@"_etauResponseID"];
  [v5 encodeObject:self->_displayedTrafficBanners forKey:@"_displayedTrafficBanners"];
}

- (id)description
{
  v3 = objc_opt_new();
  sessionState = self->_sessionState;
  if (sessionState)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Session state: %d bytes", -[NSData length](sessionState, "length"));
    [v3 addObject:v5];
  }
  else
  {
    [v3 addObject:@"Session state: (null)"];
  }
  uint64_t v6 = [NSString stringWithFormat:@"Route: %@", self->_uniqueRouteID];
  [v3 addObject:v6];

  if (self->_directionsResponseID)
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithData:self->_directionsResponseID encoding:4];
    uint64_t v8 = NSString;
    uint64_t v9 = [v7 uppercaseString];
    uint64_t v10 = [v8 stringWithFormat:@"DirectionsResponse: %@", v9];
    [v3 addObject:v10];
  }
  if (self->_etauResponseID)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithData:self->_etauResponseID encoding:4];
    uint64_t v12 = NSString;
    uint64_t v13 = [v11 uppercaseString];
    uint64_t v14 = [v12 stringWithFormat:@"ETAUResponse: %@", v13];
    [v3 addObject:v14];
  }
  uint32_t v15 = [v3 componentsJoinedByString:@", "];

  return v15;
}

- (NSData)sessionState
{
  return self->_sessionState;
}

- (NSUUID)uniqueRouteID
{
  return self->_uniqueRouteID;
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (NSData)etauResponseID
{
  return self->_etauResponseID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedTrafficBanners, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_uniqueRouteID, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
}

@end