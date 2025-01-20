@interface PHPhotosHighlight(PXDisplayAssetAdoption)
- (BOOL)px_isDayGroupHighlight;
- (BOOL)px_isDayHighlight;
- (BOOL)px_isEvent;
- (BOOL)px_isMonthHighlight;
- (uint64_t)px_isTrip;
@end

@implementation PHPhotosHighlight(PXDisplayAssetAdoption)

- (uint64_t)px_isTrip
{
  uint64_t result = [a1 type];
  if (result != 1) {
    return [a1 type] == 2;
  }
  return result;
}

- (BOOL)px_isEvent
{
  return ![a1 type] || objc_msgSend(a1, "type") == 5;
}

- (BOOL)px_isMonthHighlight
{
  return [a1 kind] == 1;
}

- (BOOL)px_isDayHighlight
{
  return [a1 kind] == 0;
}

- (BOOL)px_isDayGroupHighlight
{
  return [a1 kind] == 3;
}

@end