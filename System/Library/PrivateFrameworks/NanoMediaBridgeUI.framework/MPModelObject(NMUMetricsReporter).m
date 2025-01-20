@interface MPModelObject(NMUMetricsReporter)
- (uint64_t)nmu_metricsMoreActionContentType;
@end

@implementation MPModelObject(NMUMetricsReporter)

- (uint64_t)nmu_metricsMoreActionContentType
{
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 5;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

@end