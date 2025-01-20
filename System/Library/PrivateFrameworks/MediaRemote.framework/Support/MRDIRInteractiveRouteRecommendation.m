@interface MRDIRInteractiveRouteRecommendation
+ (id)interactiveRecommendationWithRouteRecommendation:(id)a3;
- (NSString)description;
- (int64_t)recommendationType;
- (void)setRecommendationType:(int64_t)a3;
@end

@implementation MRDIRInteractiveRouteRecommendation

+ (id)interactiveRecommendationWithRouteRecommendation:(id)a3
{
  id v3 = a3;
  if ((uint64_t)[v3 classification] <= 2 && !objc_msgSend(v3, "isCallToAction"))
  {
    id v8 = 0;
    goto LABEL_12;
  }
  v4 = objc_opt_new();
  v5 = [v3 route];
  [v4 setRoute:v5];

  objc_msgSend(v4, "setClassification:", objc_msgSend(v3, "classification"));
  v6 = [v3 contextIdentifier];
  [v4 setContextIdentifier:v6];

  objc_msgSend(v4, "setCallToAction:", objc_msgSend(v3, "isCallToAction"));
  objc_msgSend(v4, "setLockScreenControl:", objc_msgSend(v3, "isLockScreenControl"));
  objc_msgSend(v4, "setConservativelyFiltered:", objc_msgSend(v3, "isConservativelyFiltered"));
  if ([v3 classification] == (id)3)
  {
    uint64_t v7 = 0;
  }
  else if ([v3 classification] == (id)4)
  {
    uint64_t v7 = 1;
  }
  else
  {
    if (([v3 isCallToAction] & 1) == 0)
    {
      v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Invalid interactive recommendation: %@ - ignoring;",
          (uint8_t *)&v11,
          0xCu);
      }

      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v7 = 2;
  }
  [v4 setRecommendationType:v7];
  id v8 = v4;
LABEL_11:

LABEL_12:

  return v8;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ (%p): ", v5, self];

  uint64_t v7 = [(MRDIRRouteRecommendation *)self route];
  id v8 = [v7 routeIdentifier];
  [v6 appendFormat:@"routeIdentifier: %@", v8];

  int64_t v9 = [(MRDIRRouteRecommendation *)self classification];
  if ((unint64_t)(v9 - 1) > 3) {
    CFStringRef v10 = @"Unknown";
  }
  else {
    CFStringRef v10 = *(&off_10041B4C0 + v9 - 1);
  }
  [v6 appendFormat:@", classification: %@", v10];
  int64_t v11 = [(MRDIRInteractiveRouteRecommendation *)self recommendationType];
  if ((unint64_t)(v11 - 1) > 2) {
    CFStringRef v12 = @"OneTapRoute";
  }
  else {
    CFStringRef v12 = *(&off_10041B4E0 + v11 - 1);
  }
  [v6 appendFormat:@", recommendationType: %@", v12];
  if ([(MRDIRRouteRecommendation *)self isLockScreenControl]) {
    [v6 appendString:@", LockScreen"];
  }
  if ([(MRDIRRouteRecommendation *)self isConservativelyFiltered]) {
    [v6 appendString:@", ConservativelyFiltered"];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (int64_t)recommendationType
{
  return self->_recommendationType;
}

- (void)setRecommendationType:(int64_t)a3
{
  self->_recommendationType = a3;
}

@end