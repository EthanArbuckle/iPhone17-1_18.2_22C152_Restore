@interface PNTripFetcher
+ (BOOL)supportsCollection:(id)a3;
- (PNTripFetcher)init;
@end

@implementation PNTripFetcher

+ (BOOL)supportsCollection:(id)a3
{
  swift_unknownObjectRetain();
  sub_259844EF0();
  swift_unknownObjectRelease();
  unsigned __int8 v3 = static PNTripFetcher.supports(collection:)((uint64_t)v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3 & 1;
}

- (PNTripFetcher)init
{
  return (PNTripFetcher *)PNTripFetcher.init()();
}

@end