@interface MRDIRRouteRecommendation
+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4;
- (BOOL)isCallToAction;
- (BOOL)isConservativelyFiltered;
- (BOOL)isLockScreenControl;
- (MRRouteRepresentable)route;
- (NSNumber)sortingHint;
- (NSString)contextIdentifier;
- (NSString)description;
- (int64_t)classification;
- (void)setCallToAction:(BOOL)a3;
- (void)setClassification:(int64_t)a3;
- (void)setConservativelyFiltered:(BOOL)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setLockScreenControl:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setSortingHint:(id)a3;
@end

@implementation MRDIRRouteRecommendation

+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MRDIRRouteRecommendation);
  -[MRDIRRouteRecommendation setClassification:](v7, "setClassification:", [v6 classification]);
  v8 = [v6 sortingHint];
  [(MRDIRRouteRecommendation *)v7 setSortingHint:v8];

  -[MRDIRRouteRecommendation setCallToAction:](v7, "setCallToAction:", [v6 isCallToAction]);
  -[MRDIRRouteRecommendation setLockScreenControl:](v7, "setLockScreenControl:", [v6 isLockScreenControl]);
  -[MRDIRRouteRecommendation setConservativelyFiltered:](v7, "setConservativelyFiltered:", [v6 isConservativeFiltered]);
  v9 = [v6 candidate];

  v10 = +[MRIRRoute routeWithCandidate:v9];
  [(MRDIRRouteRecommendation *)v7 setRoute:v10];

  [(MRDIRRouteRecommendation *)v7 setContextIdentifier:v5];

  return v7;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ (%p): ", v5, self];

  v7 = [(MRDIRRouteRecommendation *)self route];
  v8 = [v7 routeIdentifier];
  [v6 appendFormat:@"routeIdentifier: %@", v8];

  int64_t v9 = [(MRDIRRouteRecommendation *)self classification];
  if ((unint64_t)(v9 - 1) > 3) {
    CFStringRef v10 = @"Unknown";
  }
  else {
    CFStringRef v10 = *(&off_10041B4C0 + v9 - 1);
  }
  [v6 appendFormat:@", classification: %@", v10];
  if ([(MRDIRRouteRecommendation *)self isCallToAction]) {
    [v6 appendString:@", CallToAction"];
  }
  if ([(MRDIRRouteRecommendation *)self isLockScreenControl]) {
    [v6 appendString:@", LockScreen"];
  }
  if ([(MRDIRRouteRecommendation *)self isConservativelyFiltered]) {
    [v6 appendString:@", ConservativelyFiltered"];
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
}

- (BOOL)isCallToAction
{
  return self->_callToAction;
}

- (void)setCallToAction:(BOOL)a3
{
  self->_callToAction = a3;
}

- (BOOL)isLockScreenControl
{
  return self->_lockScreenControl;
}

- (void)setLockScreenControl:(BOOL)a3
{
  self->_lockScreenControl = a3;
}

- (BOOL)isConservativelyFiltered
{
  return self->_conservativelyFiltered;
}

- (void)setConservativelyFiltered:(BOOL)a3
{
  self->_conservativelyFiltered = a3;
}

- (MRRouteRepresentable)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_sortingHint, 0);
}

@end