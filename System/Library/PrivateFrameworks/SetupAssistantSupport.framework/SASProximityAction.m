@interface SASProximityAction
+ (id)actionFromDictionary:(id)a3;
+ (unint64_t)actionID;
- (BOOL)hasResponse;
- (id)requestPayload;
- (id)responsePayload;
@end

@implementation SASProximityAction

+ (unint64_t)actionID
{
  return 0;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3 = objc_alloc_init((Class)a1);
  return v3;
}

- (id)requestPayload
{
  return 0;
}

- (BOOL)hasResponse
{
  return 0;
}

- (id)responsePayload
{
  return 0;
}

@end