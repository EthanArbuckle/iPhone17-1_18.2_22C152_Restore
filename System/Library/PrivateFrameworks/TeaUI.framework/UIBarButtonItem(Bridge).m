@interface UIBarButtonItem(Bridge)
- (id)ts_barButtonItemView;
- (id)ts_compressibleBarButtonItemView;
@end

@implementation UIBarButtonItem(Bridge)

- (id)ts_compressibleBarButtonItemView
{
  v1 = [a1 valueForKey:@"view"];
  v2 = v1;
  if (v1 && [v1 conformsToProtocol:&unk_1F0F43790]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)ts_barButtonItemView
{
  v1 = [a1 valueForKey:@"view"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end