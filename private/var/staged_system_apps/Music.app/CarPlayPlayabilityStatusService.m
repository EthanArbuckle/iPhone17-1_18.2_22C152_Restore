@interface CarPlayPlayabilityStatusService
+ (BOOL)isModelObjectPlayable:(id)a3;
- (_TtC5Music31CarPlayPlayabilityStatusService)init;
@end

@implementation CarPlayPlayabilityStatusService

+ (BOOL)isModelObjectPlayable:(id)a3
{
  id v3 = a3;
  id v4 = a3;
  LOBYTE(v3) = sub_1004A9FE0(v3);

  return v3 & 1;
}

- (_TtC5Music31CarPlayPlayabilityStatusService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CarPlayPlayabilityStatusService();
  return [(CarPlayPlayabilityStatusService *)&v3 init];
}

@end