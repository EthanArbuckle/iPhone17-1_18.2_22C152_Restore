@interface MOSuggestionAssetWorkout
+ (BOOL)supportsSecureCoding;
- (HKActivitySummary)activityRings;
- (MOSuggestionAssetWorkout)initWithCoder:(id)a3;
- (MOSuggestionAssetWorkoutRoute)route;
- (NSString)activityRingsAssetIdentifier;
- (NSString)iconAssetIdentifier;
- (NSString)routeAssetIdentifier;
- (NSURL)iconURL;
- (UIImage)icon;
- (UIImage)renderedRouteMap;
- (id)init:(id)a3 route:(id)a4 icon:(id)a5;
- (id)init:(id)a3 route:(id)a4 iconURL:(id)a5;
- (id)init:(id)a3 route:(id)a4 renderedRouteMap:(id)a5 icon:(id)a6;
- (id)init:(id)a3 route:(id)a4 renderedRouteMap:(id)a5 icon:(id)a6 iconURL:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityRingsAssetIdentifier:(id)a3;
- (void)setIconAssetIdentifier:(id)a3;
- (void)setRouteAssetIdentifier:(id)a3;
@end

@implementation MOSuggestionAssetWorkout

- (id)init:(id)a3 route:(id)a4 icon:(id)a5
{
  return [(MOSuggestionAssetWorkout *)self init:a3 route:a4 renderedRouteMap:0 icon:a5 iconURL:0];
}

- (id)init:(id)a3 route:(id)a4 renderedRouteMap:(id)a5 icon:(id)a6
{
  return [(MOSuggestionAssetWorkout *)self init:a3 route:a4 renderedRouteMap:a5 icon:a6 iconURL:0];
}

- (id)init:(id)a3 route:(id)a4 iconURL:(id)a5
{
  return [(MOSuggestionAssetWorkout *)self init:a3 route:a4 renderedRouteMap:0 icon:0 iconURL:a5];
}

- (id)init:(id)a3 route:(id)a4 renderedRouteMap:(id)a5 icon:(id)a6 iconURL:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MOSuggestionAssetWorkout;
  v17 = [(MOSuggestionAssetWorkout *)&v21 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_activityRings, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a6);
    objc_storeStrong(p_isa + 8, a5);
    objc_storeStrong(p_isa + 7, a7);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  activityRings = self->_activityRings;
  id v5 = a3;
  [v5 encodeObject:activityRings forKey:@"coderKeyMOSuggestionAssetWorkoutActivitySummary"];
  [v5 encodeObject:self->_route forKey:@"coderKeyMOSuggestionAssetWorkoutRoute"];
  [v5 encodeObject:self->_icon forKey:@"coderKeyMOSuggestionAssetWorkoutIcon"];
  [v5 encodeObject:self->_iconURL forKey:@"coderKeyMOSuggestionAssetWorkoutIconURL"];
}

- (MOSuggestionAssetWorkout)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MOSuggestionAssetWorkout;
  id v5 = [(MOSuggestionAssetWorkout *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetWorkoutActivitySummary"];
    activityRings = v5->_activityRings;
    v5->_activityRings = (HKActivitySummary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetWorkoutRoute"];
    route = v5->_route;
    v5->_route = (MOSuggestionAssetWorkoutRoute *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetWorkoutIcon"];
    icon = v5->_icon;
    v5->_icon = (UIImage *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coderKeyMOSuggestionAssetWorkoutIconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v12;
  }
  return v5;
}

- (NSString)activityRingsAssetIdentifier
{
  return self->activityRingsAssetIdentifier;
}

- (void)setActivityRingsAssetIdentifier:(id)a3
{
}

- (NSString)routeAssetIdentifier
{
  return self->routeAssetIdentifier;
}

- (void)setRouteAssetIdentifier:(id)a3
{
}

- (NSString)iconAssetIdentifier
{
  return self->iconAssetIdentifier;
}

- (void)setIconAssetIdentifier:(id)a3
{
}

- (HKActivitySummary)activityRings
{
  return self->_activityRings;
}

- (MOSuggestionAssetWorkoutRoute)route
{
  return self->_route;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (UIImage)renderedRouteMap
{
  return self->_renderedRouteMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedRouteMap, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_activityRings, 0);
  objc_storeStrong((id *)&self->iconAssetIdentifier, 0);
  objc_storeStrong((id *)&self->routeAssetIdentifier, 0);
  objc_storeStrong((id *)&self->activityRingsAssetIdentifier, 0);
}

@end