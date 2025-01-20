@interface UISDShareSheetSessionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)reloadData;
- (BOOL)shouldBlockPresentation;
- (BOOL)wantsAnimation;
- (NSArray)actionProxies;
- (NSArray)peopleProxies;
- (NSArray)peopleSuggestions;
- (NSArray)restrictedActivityTypes;
- (NSArray)shareProxies;
- (NSNumber)nearbyCountBadge;
- (NSNumber)nearbyCountSlotID;
- (UISDShareSheetSessionConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionProxies:(id)a3;
- (void)setNearbyCountBadge:(id)a3;
- (void)setNearbyCountSlotID:(id)a3;
- (void)setPeopleProxies:(id)a3;
- (void)setPeopleSuggestions:(id)a3;
- (void)setReloadData:(BOOL)a3;
- (void)setRestrictedActivityTypes:(id)a3;
- (void)setShareProxies:(id)a3;
- (void)setShouldBlockPresentation:(BOOL)a3;
- (void)setWantsAnimation:(BOOL)a3;
@end

@implementation UISDShareSheetSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISDShareSheetSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UISDShareSheetSessionConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    v8 = NSStringFromSelector("peopleProxies");
    uint64_t v9 = [v4 decodeObjectOfClasses:v7 forKey:v8];
    peopleProxies = v5->_peopleProxies;
    v5->_peopleProxies = (NSArray *)v9;

    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = NSStringFromSelector("shareProxies");
    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    shareProxies = v5->_shareProxies;
    v5->_shareProxies = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = NSStringFromSelector("actionProxies");
    uint64_t v19 = [v4 decodeObjectOfClasses:v17 forKey:v18];
    actionProxies = v5->_actionProxies;
    v5->_actionProxies = (NSArray *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("nearbyCountSlotID");
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    nearbyCountSlotID = v5->_nearbyCountSlotID;
    v5->_nearbyCountSlotID = (NSNumber *)v23;

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector("nearbyCountBadge");
    uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    nearbyCountBadge = v5->_nearbyCountBadge;
    v5->_nearbyCountBadge = (NSNumber *)v27;

    v29 = NSStringFromSelector("wantsAnimation");
    v5->_wantsAnimation = [v4 decodeBoolForKey:v29];

    v30 = NSStringFromSelector("reloadData");
    v5->_reloadData = [v4 decodeBoolForKey:v30];

    uint64_t v31 = objc_opt_class();
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, objc_opt_class(), 0);
    v33 = NSStringFromSelector("peopleSuggestions");
    uint64_t v34 = [v4 decodeObjectOfClasses:v32 forKey:v33];
    peopleSuggestions = v5->_peopleSuggestions;
    v5->_peopleSuggestions = (NSArray *)v34;

    uint64_t v36 = objc_opt_class();
    v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, objc_opt_class(), 0);
    v38 = NSStringFromSelector("restrictedActivityTypes");
    uint64_t v39 = [v4 decodeObjectOfClasses:v37 forKey:v38];
    restrictedActivityTypes = v5->_restrictedActivityTypes;
    v5->_restrictedActivityTypes = (NSArray *)v39;

    v41 = NSStringFromSelector("shouldBlockPresentation");
    v5->_shouldBlockPresentation = [v4 decodeBoolForKey:v41];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  peopleProxies = self->_peopleProxies;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector("peopleProxies");
  [v5 encodeObject:peopleProxies forKey:v6];

  shareProxies = self->_shareProxies;
  v8 = NSStringFromSelector("shareProxies");
  [v5 encodeObject:shareProxies forKey:v8];

  actionProxies = self->_actionProxies;
  v10 = NSStringFromSelector("actionProxies");
  [v5 encodeObject:actionProxies forKey:v10];

  nearbyCountSlotID = self->_nearbyCountSlotID;
  v12 = NSStringFromSelector("nearbyCountSlotID");
  [v5 encodeObject:nearbyCountSlotID forKey:v12];

  nearbyCountBadge = self->_nearbyCountBadge;
  uint64_t v14 = NSStringFromSelector("nearbyCountBadge");
  [v5 encodeObject:nearbyCountBadge forKey:v14];

  BOOL wantsAnimation = self->_wantsAnimation;
  uint64_t v16 = NSStringFromSelector("wantsAnimation");
  [v5 encodeBool:wantsAnimation forKey:v16];

  BOOL reloadData = self->_reloadData;
  v18 = NSStringFromSelector("reloadData");
  [v5 encodeBool:reloadData forKey:v18];

  peopleSuggestions = self->_peopleSuggestions;
  v20 = NSStringFromSelector("peopleSuggestions");
  [v5 encodeObject:peopleSuggestions forKey:v20];

  restrictedActivityTypes = self->_restrictedActivityTypes;
  v22 = NSStringFromSelector("restrictedActivityTypes");
  [v5 encodeObject:restrictedActivityTypes forKey:v22];

  BOOL shouldBlockPresentation = self->_shouldBlockPresentation;
  NSStringFromSelector("shouldBlockPresentation");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:shouldBlockPresentation forKey:v24];
}

- (NSNumber)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(id)a3
{
}

- (NSNumber)nearbyCountBadge
{
  return self->_nearbyCountBadge;
}

- (void)setNearbyCountBadge:(id)a3
{
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

- (BOOL)wantsAnimation
{
  return self->_wantsAnimation;
}

- (void)setWantsAnimation:(BOOL)a3
{
  self->_BOOL wantsAnimation = a3;
}

- (BOOL)reloadData
{
  return self->_reloadData;
}

- (void)setReloadData:(BOOL)a3
{
  self->_BOOL reloadData = a3;
}

- (NSArray)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
}

- (NSArray)restrictedActivityTypes
{
  return self->_restrictedActivityTypes;
}

- (void)setRestrictedActivityTypes:(id)a3
{
}

- (BOOL)shouldBlockPresentation
{
  return self->_shouldBlockPresentation;
}

- (void)setShouldBlockPresentation:(BOOL)a3
{
  self->_BOOL shouldBlockPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedActivityTypes, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
  objc_storeStrong((id *)&self->_nearbyCountBadge, 0);

  objc_storeStrong((id *)&self->_nearbyCountSlotID, 0);
}

@end