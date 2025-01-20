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
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = NSStringFromSelector(sel_peopleProxies);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    peopleProxies = v5->_peopleProxies;
    v5->_peopleProxies = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = NSStringFromSelector(sel_shareProxies);
    uint64_t v16 = [v4 decodeObjectOfClasses:v14 forKey:v15];
    shareProxies = v5->_shareProxies;
    v5->_shareProxies = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v21 = NSStringFromSelector(sel_actionProxies);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    actionProxies = v5->_actionProxies;
    v5->_actionProxies = (NSArray *)v22;

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector(sel_nearbyCountSlotID);
    uint64_t v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    nearbyCountSlotID = v5->_nearbyCountSlotID;
    v5->_nearbyCountSlotID = (NSNumber *)v26;

    uint64_t v28 = objc_opt_class();
    v29 = NSStringFromSelector(sel_nearbyCountBadge);
    uint64_t v30 = [v4 decodeObjectOfClass:v28 forKey:v29];
    nearbyCountBadge = v5->_nearbyCountBadge;
    v5->_nearbyCountBadge = (NSNumber *)v30;

    v32 = NSStringFromSelector(sel_wantsAnimation);
    v5->_wantsAnimation = [v4 decodeBoolForKey:v32];

    v33 = NSStringFromSelector(sel_reloadData);
    v5->_reloadData = [v4 decodeBoolForKey:v33];

    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v37 = NSStringFromSelector(sel_peopleSuggestions);
    uint64_t v38 = [v4 decodeObjectOfClasses:v36 forKey:v37];
    peopleSuggestions = v5->_peopleSuggestions;
    v5->_peopleSuggestions = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v43 = NSStringFromSelector(sel_restrictedActivityTypes);
    uint64_t v44 = [v4 decodeObjectOfClasses:v42 forKey:v43];
    restrictedActivityTypes = v5->_restrictedActivityTypes;
    v5->_restrictedActivityTypes = (NSArray *)v44;

    v46 = NSStringFromSelector(sel_shouldBlockPresentation);
    v5->_shouldBlockPresentation = [v4 decodeBoolForKey:v46];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  peopleProxies = self->_peopleProxies;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_peopleProxies);
  [v5 encodeObject:peopleProxies forKey:v6];

  shareProxies = self->_shareProxies;
  v8 = NSStringFromSelector(sel_shareProxies);
  [v5 encodeObject:shareProxies forKey:v8];

  actionProxies = self->_actionProxies;
  uint64_t v10 = NSStringFromSelector(sel_actionProxies);
  [v5 encodeObject:actionProxies forKey:v10];

  nearbyCountSlotID = self->_nearbyCountSlotID;
  v12 = NSStringFromSelector(sel_nearbyCountSlotID);
  [v5 encodeObject:nearbyCountSlotID forKey:v12];

  nearbyCountBadge = self->_nearbyCountBadge;
  v14 = NSStringFromSelector(sel_nearbyCountBadge);
  [v5 encodeObject:nearbyCountBadge forKey:v14];

  BOOL wantsAnimation = self->_wantsAnimation;
  uint64_t v16 = NSStringFromSelector(sel_wantsAnimation);
  [v5 encodeBool:wantsAnimation forKey:v16];

  BOOL reloadData = self->_reloadData;
  v18 = NSStringFromSelector(sel_reloadData);
  [v5 encodeBool:reloadData forKey:v18];

  peopleSuggestions = self->_peopleSuggestions;
  v20 = NSStringFromSelector(sel_peopleSuggestions);
  [v5 encodeObject:peopleSuggestions forKey:v20];

  restrictedActivityTypes = self->_restrictedActivityTypes;
  uint64_t v22 = NSStringFromSelector(sel_restrictedActivityTypes);
  [v5 encodeObject:restrictedActivityTypes forKey:v22];

  BOOL shouldBlockPresentation = self->_shouldBlockPresentation;
  NSStringFromSelector(sel_shouldBlockPresentation);
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