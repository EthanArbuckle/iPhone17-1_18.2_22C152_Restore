@interface WFParameter(CHSWidgetFamily)
- (uint64_t)arrayMaxCountForWidgetFamily:()CHSWidgetFamily;
- (uint64_t)arraySizeRangeForCHSWidgetFamily:()CHSWidgetFamily;
@end

@implementation WFParameter(CHSWidgetFamily)

- (uint64_t)arrayMaxCountForWidgetFamily:()CHSWidgetFamily
{
  uint64_t v1 = objc_msgSend(a1, "arraySizeRangeForCHSWidgetFamily:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v3 = v2 + v1 - 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (uint64_t)arraySizeRangeForCHSWidgetFamily:()CHSWidgetFamily
{
  uint64_t v5 = LNActionConfigurationContextWidgetFamilyFromCHSWidgetFamily(a3);
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x263F51818];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [a1 arraySizeRangeForWidgetFamily:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = INCodableAttributeArraySizeClassFromCHSWidgetFamily(a3);
    v11 = (void *)v10;
    v12 = (void *)*MEMORY[0x263F0F730];
    if (v10) {
      v12 = (void *)v10;
    }
    id v13 = v12;

    uint64_t v9 = [a1 arraySizeForWidgetSizeClass:v13];
  }
  return v9;
}

@end