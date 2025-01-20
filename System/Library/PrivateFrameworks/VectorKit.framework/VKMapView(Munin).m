@interface VKMapView(Munin)
- (__n128)muninMarkerAtCoordinate:()Munin completeMarkerHandler:;
- (uint64_t)muninMarkerAtCoordinate:()Munin completeMarkerHandler:;
- (void)muninMarkerAtCoordinate:()Munin completeMarkerHandler:;
@end

@implementation VKMapView(Munin)

- (void)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{
  JUMPOUT(0x1A6239270);
}

- (__n128)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{
  a2->n128_u64[0] = (unint64_t)&unk_1EF56C948;
  a2->n128_u64[1] = MEMORY[0x1A6239EB0](a1->n128_u64[1]);
  __n128 result = a1[1];
  a2[1] = result;
  a2[2].n128_u64[0] = a1[2].n128_u64[0];
  return result;
}

- (uint64_t)muninMarkerAtCoordinate:()Munin completeMarkerHandler:
{
  return a1;
}

@end