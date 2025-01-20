@interface MRMediaControlsConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsNowPlayingApplicationLaunch;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPreventAutorotation;
- (BOOL)sortByIsVideoRoute;
- (BOOL)useGenericDevicesIconInHeader;
- (CGRect)sourceRect;
- (MRMediaControlsConfiguration)initWithCoder:(id)a3;
- (NSArray)visibleMediaApps;
- (NSMutableArray)customRows;
- (NSString)nowPlayingAppBundleID;
- (NSString)presentingAppBundleID;
- (NSString)routeUID;
- (NSString)routingContextUID;
- (double)preferredWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)presentingAppProcessIdentifier;
- (int64_t)initiatorStyle;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsNowPlayingApplicationLaunch:(BOOL)a3;
- (void)setCustomRows:(id)a3;
- (void)setInitiatorStyle:(int64_t)a3;
- (void)setNowPlayingAppBundleID:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setPresentingAppBundleID:(id)a3;
- (void)setPresentingAppProcessIdentifier:(int)a3;
- (void)setRouteUID:(id)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setShouldPreventAutorotation:(BOOL)a3;
- (void)setSortByIsVideoRoute:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUseGenericDevicesIconInHeader:(BOOL)a3;
- (void)setVisibleMediaApps:(id)a3;
@end

@implementation MRMediaControlsConfiguration

- (id)description
{
  unint64_t v3 = [(MRMediaControlsConfiguration *)self style];
  if (v3 > 8) {
    v4 = 0;
  }
  else {
    v4 = off_1E57D44B8[v3];
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(MRMediaControlsConfiguration *)self routingContextUID];
  presentingAppBundleID = self->_presentingAppBundleID;
  v9 = MR_NSStringFromCGRect(self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  v10 = [v5 stringWithFormat:@"<%@:%p routingContextUID=%@, style=%@, presentingAppBundleID=%@, sourcRect=%@, preferredWidth=%f>", v6, self, v7, v4, presentingAppBundleID, v9, *(void *)&self->_preferredWidth];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRMediaControlsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MRMediaControlsConfiguration;
  v5 = [(MRMediaControlsConfiguration *)&v26 init];
  if (v5)
  {
    v5->_style = [v4 decodeIntegerForKey:@"style"];
    v5->_initiatorStyle = [v4 decodeIntegerForKey:@"initiatorStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingContextUID"];
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingAppBundleID"];
    presentingAppBundleID = v5->_presentingAppBundleID;
    v5->_presentingAppBundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nowPlayingAppBundleID"];
    nowPlayingAppBundleID = v5->_nowPlayingAppBundleID;
    v5->_nowPlayingAppBundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"visibleMediaApps"];
    visibleMediaApps = v5->_visibleMediaApps;
    v5->_visibleMediaApps = (NSArray *)v12;

    v5->_allowsNowPlayingApplicationLaunch = [v4 decodeBoolForKey:@"allowsNowPlayingApplicationLaunch"];
    v5->_sortByIsVideoRoute = [v4 decodeBoolForKey:@"sortByIsVideoRoute"];
    objc_msgSend(v4, "mr_decodeCGRectForKey:", @"sourceRect");
    v5->_sourceRect.origin.x = v14;
    v5->_sourceRect.origin.y = v15;
    v5->_sourceRect.size.width = v16;
    v5->_sourceRect.size.height = v17;
    [v4 decodeFloatForKey:@"preferredWidth"];
    v5->_preferredWidth = v18;
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routeUID"];
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v19;

    v21 = (void *)MEMORY[0x1E4F1CA48];
    v22 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"customRows"];
    uint64_t v23 = [v21 arrayWithArray:v22];
    customRows = v5->_customRows;
    v5->_customRows = (NSMutableArray *)v23;

    v5->_presentingAppProcessIdentifier = [v4 decodeInt32ForKey:@"presentingAppProcessIdentifier"];
    v5->_useGenericDevicesIconInHeader = [v4 decodeBoolForKey:@"useGenericDevicesIconInHeader"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v6 = a3;
  [v6 encodeInteger:style forKey:@"style"];
  [v6 encodeInteger:self->_initiatorStyle forKey:@"initiatorStyle"];
  [v6 encodeObject:self->_routingContextUID forKey:@"routingContextUID"];
  [v6 encodeObject:self->_presentingAppBundleID forKey:@"presentingAppBundleID"];
  [v6 encodeObject:self->_nowPlayingAppBundleID forKey:@"nowPlayingAppBundleID"];
  [v6 encodeObject:self->_visibleMediaApps forKey:@"visibleMediaApps"];
  [v6 encodeBool:self->_allowsNowPlayingApplicationLaunch forKey:@"allowsNowPlayingApplicationLaunch"];
  [v6 encodeBool:self->_sortByIsVideoRoute forKey:@"sortByIsVideoRoute"];
  objc_msgSend(v6, "mr_encodeCGRect:forKey:", @"sourceRect", self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  double preferredWidth = self->_preferredWidth;
  *(float *)&double preferredWidth = preferredWidth;
  [v6 encodeFloat:@"preferredWidth" forKey:preferredWidth];
  [v6 encodeObject:self->_routeUID forKey:@"routeUID"];
  [v6 encodeObject:self->_customRows forKey:@"customRows"];
  [v6 encodeInt32:self->_presentingAppProcessIdentifier forKey:@"presentingAppProcessIdentifier"];
  [v6 encodeBool:self->_useGenericDevicesIconInHeader forKey:@"useGenericDevicesIconInHeader"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MRMediaControlsConfiguration);
  v4->_int64_t style = self->_style;
  v4->_initiatorStyle = self->_initiatorStyle;
  objc_storeStrong((id *)&v4->_routingContextUID, self->_routingContextUID);
  objc_storeStrong((id *)&v4->_presentingAppBundleID, self->_presentingAppBundleID);
  objc_storeStrong((id *)&v4->_nowPlayingAppBundleID, self->_nowPlayingAppBundleID);
  objc_storeStrong((id *)&v4->_visibleMediaApps, self->_visibleMediaApps);
  v4->_allowsNowPlayingApplicationLaunch = self->_allowsNowPlayingApplicationLaunch;
  v4->_sortByIsVideoRoute = self->_sortByIsVideoRoute;
  CGPoint origin = self->_sourceRect.origin;
  v4->_sourceRect.size = self->_sourceRect.size;
  v4->_sourceRect.CGPoint origin = origin;
  v4->_double preferredWidth = self->_preferredWidth;
  objc_storeStrong((id *)&v4->_routeUID, self->_routeUID);
  objc_storeStrong((id *)&v4->_customRows, self->_customRows);
  v4->_presentingAppProcessIdentifier = self->_presentingAppProcessIdentifier;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRMediaControlsConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v47) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MRMediaControlsConfiguration *)v5 style];
      int64_t v7 = [(MRMediaControlsConfiguration *)self style];
      uint64_t v8 = [(MRMediaControlsConfiguration *)v5 initiatorStyle];
      int64_t v9 = [(MRMediaControlsConfiguration *)self initiatorStyle];
      uint64_t v10 = [(MRMediaControlsConfiguration *)v5 routingContextUID];
      v11 = [(MRMediaControlsConfiguration *)self routingContextUID];
      int v12 = [v10 isEqualToString:v11];
      if (v6 == v7 && v8 == v9) {
        int v14 = v12;
      }
      else {
        int v14 = 0;
      }

      CGFloat v15 = [(MRMediaControlsConfiguration *)v5 presentingAppBundleID];
      CGFloat v16 = [(MRMediaControlsConfiguration *)self presentingAppBundleID];
      int v17 = [v15 isEqualToString:v16];

      float v18 = [(MRMediaControlsConfiguration *)v5 nowPlayingAppBundleID];
      uint64_t v19 = [(MRMediaControlsConfiguration *)self nowPlayingAppBundleID];
      int v20 = v17 & [v18 isEqualToString:v19];

      uint64_t v21 = [(MRMediaControlsConfiguration *)v5 visibleMediaApps];
      uint64_t v22 = [(MRMediaControlsConfiguration *)self visibleMediaApps];
      int v23 = v14 & v20 & [(id)v21 isEqualToArray:v22];

      LODWORD(v21) = [(MRMediaControlsConfiguration *)v5 allowsNowPlayingApplicationLaunch];
      LODWORD(v22) = v21 ^ [(MRMediaControlsConfiguration *)self allowsNowPlayingApplicationLaunch];
      LODWORD(v21) = [(MRMediaControlsConfiguration *)v5 sortByIsVideoRoute];
      LODWORD(v21) = v23 & ~(v22 | v21 ^ [(MRMediaControlsConfiguration *)self sortByIsVideoRoute]);
      [(MRMediaControlsConfiguration *)v5 sourceRect];
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      [(MRMediaControlsConfiguration *)self sourceRect];
      v50.origin.x = v32;
      v50.origin.y = v33;
      v50.size.width = v34;
      v50.size.height = v35;
      v49.origin.x = v25;
      v49.origin.y = v27;
      v49.size.width = v29;
      v49.size.height = v31;
      int v36 = v21 & CGRectEqualToRect(v49, v50);
      [(MRMediaControlsConfiguration *)v5 preferredWidth];
      double v38 = v37;
      [(MRMediaControlsConfiguration *)self preferredWidth];
      if (v38 == v39) {
        int v40 = v36;
      }
      else {
        int v40 = 0;
      }
      v41 = [(MRMediaControlsConfiguration *)v5 routeUID];
      v42 = [(MRMediaControlsConfiguration *)self routeUID];
      int v43 = [v41 isEqualToString:v42];

      uint64_t v44 = [(MRMediaControlsConfiguration *)v5 customRows];
      v45 = [(MRMediaControlsConfiguration *)self customRows];
      int v46 = v43 & [(id)v44 isEqualToArray:v45];

      LODWORD(v44) = [(MRMediaControlsConfiguration *)v5 useGenericDevicesIconInHeader];
      int v47 = v40 & v46 & (v44 ^ [(MRMediaControlsConfiguration *)self useGenericDevicesIconInHeader] ^ 1);
    }
    else
    {
      LOBYTE(v47) = 0;
    }
  }

  return v47;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
  self->_initiatorStyle = a3;
}

- (NSMutableArray)customRows
{
  return self->_customRows;
}

- (void)setCustomRows:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)initiatorStyle
{
  return self->_initiatorStyle;
}

- (void)setInitiatorStyle:(int64_t)a3
{
  self->_initiatorStyle = a3;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setRoutingContextUID:(id)a3
{
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
}

- (int)presentingAppProcessIdentifier
{
  return self->_presentingAppProcessIdentifier;
}

- (void)setPresentingAppProcessIdentifier:(int)a3
{
  self->_presentingAppProcessIdentifier = a3;
}

- (BOOL)shouldPreventAutorotation
{
  return self->_shouldPreventAutorotation;
}

- (void)setShouldPreventAutorotation:(BOOL)a3
{
  self->_shouldPreventAutorotation = a3;
}

- (BOOL)allowsNowPlayingApplicationLaunch
{
  return self->_allowsNowPlayingApplicationLaunch;
}

- (void)setAllowsNowPlayingApplicationLaunch:(BOOL)a3
{
  self->_allowsNowPlayingApplicationLaunch = a3;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (BOOL)useGenericDevicesIconInHeader
{
  return self->_useGenericDevicesIconInHeader;
}

- (void)setUseGenericDevicesIconInHeader:(BOOL)a3
{
  self->_useGenericDevicesIconInHeader = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_double preferredWidth = a3;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);

  objc_storeStrong((id *)&self->_customRows, 0);
}

@end