@interface CRLGenerativePlaygroundAvailabilityHelper
+ (BOOL)isAvailableOnCurrentDevice;
- (_TtC8Freeform41CRLGenerativePlaygroundAvailabilityHelper)init;
@end

@implementation CRLGenerativePlaygroundAvailabilityHelper

+ (BOOL)isAvailableOnCurrentDevice
{
  v2 = (void *)type metadata accessor for ImagePlaygroundViewController();

  return [v2 available];
}

- (_TtC8Freeform41CRLGenerativePlaygroundAvailabilityHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLGenerativePlaygroundAvailabilityHelper();
  return [(CRLGenerativePlaygroundAvailabilityHelper *)&v3 init];
}

@end