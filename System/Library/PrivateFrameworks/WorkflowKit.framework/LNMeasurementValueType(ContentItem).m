@interface LNMeasurementValueType(ContentItem)
- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
@end

@implementation LNMeasurementValueType(ContentItem)

- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  return objc_opt_class();
}

@end