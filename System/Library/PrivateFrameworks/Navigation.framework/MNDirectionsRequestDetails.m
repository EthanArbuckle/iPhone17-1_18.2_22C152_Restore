@interface MNDirectionsRequestDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResumingMultipointRoute;
- (GEOApplicationAuditToken)auditToken;
- (GEOCommonOptions)commonOptions;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEODirectionsRequestFeedback)directionsRequestFeedback;
- (GEOLocation)currentUserLocation;
- (GEOMapRegion)currentMapRegion;
- (GEOMapServiceTraits)traits;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (GEORouteAttributes)routeAttributes;
- (MNDirectionsRequestDetails)initWithCoder:(id)a3;
- (MNDirectionsRequestDetails)initWithTracePath:(id)a3;
- (MNDirectionsRequestDetails)initWithWaypoints:(id)a3 routeAttributes:(id)a4;
- (NSArray)waypoints;
- (NSString)tracePath;
- (id)description;
- (unint64_t)hash;
- (unint64_t)maxRouteCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setCommonOptions:(id)a3;
- (void)setCurrentMapRegion:(id)a3;
- (void)setCurrentUserLocation:(id)a3;
- (void)setDirectionsRequestFeedback:(id)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setMaxRouteCount:(unint64_t)a3;
- (void)setPersistentData:(id)a3;
- (void)setResumeRouteHandle:(id)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setTracePath:(id)a3;
- (void)setTraits:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation MNDirectionsRequestDetails

- (MNDirectionsRequestDetails)initWithWaypoints:(id)a3 routeAttributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MNDirectionsRequestDetails *)self init];
  v10 = v9;
  if (v9)
  {
    v9->_maxRouteCount = 3;
    objc_storeStrong((id *)&v9->_waypoints, a3);
    objc_storeStrong((id *)&v10->_routeAttributes, a4);
    v10->_isResumingMultipointRoute = 0;
  }

  return v10;
}

- (MNDirectionsRequestDetails)initWithTracePath:(id)a3
{
  id v5 = a3;
  v6 = [(MNDirectionsRequestDetails *)self init];
  id v7 = v6;
  if (v6)
  {
    v6->_maxRouteCount = 3;
    objc_storeStrong((id *)&v6->_tracePath, a3);
    v7->_isResumingMultipointRoute = 0;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(NSArray *)self->_waypoints valueForKey:@"waypoint"];
  id v5 = [v3 stringWithFormat:@"\twaypoints: %@ |\n\tmaxRouteCount: %d |\n\trouteAttributes: %@", v4, self->_maxRouteCount, self->_routeAttributes];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = (MNDirectionsRequestDetails *)a3;
  if (self == v7)
  {
    char v9 = 1;
    goto LABEL_36;
  }
  uint64_t v8 = objc_opt_class();
  if (v8 != objc_opt_class())
  {
    char v9 = 0;
    goto LABEL_36;
  }
  v10 = v7;
  v11 = [(MNDirectionsRequestDetails *)self waypoints];
  if (!v11)
  {
    v3 = [(MNDirectionsRequestDetails *)v10 waypoints];
    if (!v3)
    {
      int v12 = 0;
      goto LABEL_11;
    }
  }
  v4 = [(MNDirectionsRequestDetails *)self waypoints];
  id v5 = [(MNDirectionsRequestDetails *)v10 waypoints];
  if ([v4 isEqualToArray:v5])
  {
    int v12 = 1;
LABEL_11:
    v77 = [(MNDirectionsRequestDetails *)self routeAttributes];
    if (v77
      || ([(MNDirectionsRequestDetails *)v10 routeAttributes],
          (v73 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(MNDirectionsRequestDetails *)self routeAttributes];
      v14 = [(MNDirectionsRequestDetails *)v10 routeAttributes];
      if (([v13 isEqual:v14] & 1) == 0)
      {

        v15 = v77;
        if (!v77) {
          v15 = v73;
        }

        char v9 = 0;
        if ((v12 & 1) == 0) {
          goto LABEL_33;
        }
LABEL_32:

        goto LABEL_33;
      }
      v71 = v14;
      v72 = v13;
      v76 = v3;
      int v74 = 1;
      int v75 = v12;
    }
    else
    {
      int v74 = 0;
      int v75 = v12;
      v76 = v3;
      v73 = 0;
    }
    v16 = [(MNDirectionsRequestDetails *)self traits];
    v17 = [(MNDirectionsRequestDetails *)v10 traits];
    unint64_t v18 = v16;
    unint64_t v19 = v17;
    if (v18 | v19 && (int v20 = [(id)v18 isEqual:v19], (id)v19, (id)v18, !v20)
      || (unint64_t v21 = [(MNDirectionsRequestDetails *)self maxRouteCount],
          v21 != [(MNDirectionsRequestDetails *)v10 maxRouteCount]))
    {

      char v9 = 0;
      if ((v74 & 1) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    uint64_t v70 = [(MNDirectionsRequestDetails *)self currentUserLocation];
    if (v70
      || ([(MNDirectionsRequestDetails *)v10 currentUserLocation],
          (v63 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = [(MNDirectionsRequestDetails *)self currentUserLocation];
      v68 = [(MNDirectionsRequestDetails *)v10 currentUserLocation];
      v69 = v22;
      if (![v22 isEqual:v68])
      {
        char v9 = 0;
        goto LABEL_94;
      }
      int v66 = 1;
    }
    else
    {
      v63 = 0;
      int v66 = 0;
    }
    uint64_t v67 = [(MNDirectionsRequestDetails *)self currentMapRegion];
    if (v67
      || ([(MNDirectionsRequestDetails *)v10 currentMapRegion],
          (v58 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = [(MNDirectionsRequestDetails *)self currentMapRegion];
      v64 = [(MNDirectionsRequestDetails *)v10 currentMapRegion];
      v65 = v24;
      if (![v24 isEqual:v64])
      {
        char v9 = 0;
        goto LABEL_90;
      }
      int v61 = 1;
    }
    else
    {
      v58 = 0;
      int v61 = 0;
    }
    uint64_t v62 = [(MNDirectionsRequestDetails *)self directionsRequestFeedback];
    if (v62
      || ([(MNDirectionsRequestDetails *)v10 directionsRequestFeedback],
          (v55 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v25 = [(MNDirectionsRequestDetails *)self directionsRequestFeedback];
      v59 = [(MNDirectionsRequestDetails *)v10 directionsRequestFeedback];
      v60 = v25;
      if (![v25 isEqual:v59])
      {
        char v9 = 0;
LABEL_86:

        goto LABEL_87;
      }
      int v56 = 1;
    }
    else
    {
      v55 = 0;
      int v56 = 0;
    }
    uint64_t v57 = [(MNDirectionsRequestDetails *)self commonOptions];
    if (v57
      || ([(MNDirectionsRequestDetails *)v10 commonOptions],
          (v52 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v26 = [(MNDirectionsRequestDetails *)self commonOptions];
      v27 = [(MNDirectionsRequestDetails *)v10 commonOptions];
      if (([v26 isEqual:v27] & 1) == 0)
      {

        v28 = (void *)v57;
        if (!v57) {
          v28 = v52;
        }

        char v9 = 0;
        if (v56) {
          goto LABEL_86;
        }
        goto LABEL_87;
      }
      v53 = v27;
      v51 = v26;
      int v54 = 1;
    }
    else
    {
      v52 = 0;
      int v54 = 0;
    }
    BOOL v29 = [(MNDirectionsRequestDetails *)self isResumingMultipointRoute];
    if (v29 != [(MNDirectionsRequestDetails *)v10 isResumingMultipointRoute])
    {
      char v9 = 0;
      v30 = v53;
      if ((v54 & 1) == 0) {
        goto LABEL_83;
      }
      goto LABEL_82;
    }
    [(MNDirectionsRequestDetails *)self tracePath];
    uint64_t v50 = v30 = v53;
    if (v50
      || ([(MNDirectionsRequestDetails *)v10 tracePath],
          (v45 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31 = [(MNDirectionsRequestDetails *)self tracePath];
      v48 = [(MNDirectionsRequestDetails *)v10 tracePath];
      v49 = v31;
      if (![v31 isEqual:v48])
      {
        char v9 = 0;
        v30 = v53;
        int v32 = v54;
LABEL_78:

LABEL_79:
        v38 = (void *)v50;
        if (!v50)
        {

          v38 = 0;
        }

        if (!v32)
        {
LABEL_83:
          v39 = (void *)v57;
          if (!v57)
          {

            v39 = 0;
          }

          if (v56) {
            goto LABEL_86;
          }
LABEL_87:
          v40 = (void *)v62;
          if (!v62)
          {

            v40 = 0;
          }

          if (!v61)
          {
LABEL_91:
            v41 = (void *)v67;
            if (!v67)
            {

              v41 = 0;
            }

            if (!v66)
            {
LABEL_95:
              v42 = (void *)v70;
              if (!v70)
              {

                v42 = 0;
              }

              if (!v74)
              {
LABEL_29:
                v3 = v76;
                if (!v77) {

                }
                if (!v75) {
                  goto LABEL_33;
                }
                goto LABEL_32;
              }
LABEL_28:

              goto LABEL_29;
            }
LABEL_94:

            goto LABEL_95;
          }
LABEL_90:

          goto LABEL_91;
        }
LABEL_82:

        goto LABEL_83;
      }
      char v47 = 1;
      v30 = v53;
    }
    else
    {
      v45 = 0;
      char v47 = 0;
    }
    uint64_t v33 = [(MNDirectionsRequestDetails *)self auditToken];
    if (v33
      || ([(MNDirectionsRequestDetails *)v10 auditToken], (uint64_t v43 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v34 = [(MNDirectionsRequestDetails *)self auditToken];
      v35 = [(MNDirectionsRequestDetails *)v10 auditToken];
      v46 = (void *)v33;
      v36 = v34;
      char v9 = [v34 isEqual:v35];

      if (v46)
      {

        v30 = v53;
        if ((v47 & 1) == 0)
        {
          int v32 = v54;
          goto LABEL_79;
        }
        int v32 = v54;
        goto LABEL_78;
      }
      v30 = v53;
      v37 = v44;
    }
    else
    {
      v37 = 0;
      char v9 = 1;
    }

    int v32 = v54;
    if ((v47 & 1) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }

  char v9 = 0;
LABEL_33:
  if (!v11) {

  }
LABEL_36:
  return v9;
}

- (unint64_t)hash
{
  v3 = [(MNDirectionsRequestDetails *)self waypoints];
  uint64_t v4 = [v3 hash];

  id v5 = [(MNDirectionsRequestDetails *)self routeAttributes];
  uint64_t v6 = [v5 hash] + 53 * v4 + 2809;

  id v7 = [(MNDirectionsRequestDetails *)self traits];
  uint64_t v8 = [v7 hash] + 53 * v6;

  unint64_t v9 = [(MNDirectionsRequestDetails *)self maxRouteCount] + 53 * v8;
  v10 = [(MNDirectionsRequestDetails *)self currentUserLocation];
  uint64_t v11 = [v10 hash] + 53 * v9;

  int v12 = [(MNDirectionsRequestDetails *)self currentMapRegion];
  uint64_t v13 = [v12 hash] + 53 * v11;

  v14 = [(MNDirectionsRequestDetails *)self directionsRequestFeedback];
  uint64_t v15 = [v14 hash] + 53 * v13;

  v16 = [(MNDirectionsRequestDetails *)self commonOptions];
  uint64_t v17 = [v16 hash] + 53 * v15;

  unint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MNDirectionsRequestDetails isResumingMultipointRoute](self, "isResumingMultipointRoute"));
  uint64_t v19 = [v18 hash] + 53 * v17;

  int v20 = [(MNDirectionsRequestDetails *)self tracePath];
  uint64_t v21 = [v20 hash] + 53 * v19;

  v22 = [(MNDirectionsRequestDetails *)self auditToken];
  unint64_t v23 = [v22 hash] + 53 * v21;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDirectionsRequestDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MNDirectionsRequestDetails;
  id v5 = [(MNDirectionsRequestDetails *)&v30 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeAttributes"];
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traits"];
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v13;

    v5->_maxRouteCount = [v4 decodeIntegerForKey:@"_maxRouteCount"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentUserLocation"];
    currentUserLocation = v5->_currentUserLocation;
    v5->_currentUserLocation = (GEOLocation *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentMapRegion"];
    currentMapRegion = v5->_currentMapRegion;
    v5->_currentMapRegion = (GEOMapRegion *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directionsRequestFeedback"];
    directionsRequestFeedback = v5->_directionsRequestFeedback;
    v5->_directionsRequestFeedback = (GEODirectionsRequestFeedback *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_commonOptions"];
    commonOptions = v5->_commonOptions;
    v5->_commonOptions = (GEOCommonOptions *)v21;

    v5->_isResumingMultipointRoute = [v4 decodeBoolForKey:@"_isResumingMultipointRoute"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resumeRouteHandle"];
    resumeRouteHandle = v5->_resumeRouteHandle;
    v5->_resumeRouteHandle = (GEOResumeRouteHandle *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tracePath"];
    tracePath = v5->_tracePath;
    v5->_tracePath = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auditToken"];
    auditToken = v5->_auditToken;
    v5->_auditToken = (GEOApplicationAuditToken *)v27;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  waypoints = self->_waypoints;
  id v5 = a3;
  [v5 encodeObject:waypoints forKey:@"_waypoints"];
  [v5 encodeObject:self->_routeAttributes forKey:@"_routeAttributes"];
  [v5 encodeObject:self->_traits forKey:@"_traits"];
  [v5 encodeInteger:self->_maxRouteCount forKey:@"_maxRouteCount"];
  [v5 encodeObject:self->_currentUserLocation forKey:@"_currentUserLocation"];
  [v5 encodeObject:self->_currentMapRegion forKey:@"_currentMapRegion"];
  [v5 encodeObject:self->_directionsRequestFeedback forKey:@"_directionsRequestFeedback"];
  [v5 encodeObject:self->_commonOptions forKey:@"_commonOptions"];
  [v5 encodeBool:self->_isResumingMultipointRoute forKey:@"_isResumingMultipointRoute"];
  [v5 encodeObject:self->_resumeRouteHandle forKey:@"_resumeRouteHandle"];
  [v5 encodeObject:self->_tracePath forKey:@"_tracePath"];
  [v5 encodeObject:self->_auditToken forKey:@"_auditToken"];
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (unint64_t)maxRouteCount
{
  return self->_maxRouteCount;
}

- (void)setMaxRouteCount:(unint64_t)a3
{
  self->_maxRouteCount = a3;
}

- (GEOLocation)currentUserLocation
{
  return self->_currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
}

- (GEOMapRegion)currentMapRegion
{
  return self->_currentMapRegion;
}

- (void)setCurrentMapRegion:(id)a3
{
}

- (GEODirectionsRequestFeedback)directionsRequestFeedback
{
  return self->_directionsRequestFeedback;
}

- (void)setDirectionsRequestFeedback:(id)a3
{
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_directionsRequestFeedback, 0);
  objc_storeStrong((id *)&self->_currentMapRegion, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end