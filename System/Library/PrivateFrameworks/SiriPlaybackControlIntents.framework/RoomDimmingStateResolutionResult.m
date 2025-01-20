@interface RoomDimmingStateResolutionResult
+ (id)confirmationRequiredWithRoomDimmingStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedRoomDimmingState:(int64_t)a3;
- (RoomDimmingStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation RoomDimmingStateResolutionResult

+ (id)successWithResolvedRoomDimmingState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithRoomDimmingStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (RoomDimmingStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (RoomDimmingStateResolutionResult *)RoomDimmingStateResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end