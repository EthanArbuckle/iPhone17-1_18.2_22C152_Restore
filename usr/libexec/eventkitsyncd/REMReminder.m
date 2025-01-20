@interface REMReminder
- (id)eks_debugDesc;
@end

@implementation REMReminder

- (id)eks_debugDesc
{
  id v4 = [objc_alloc((Class)NSMutableString) initWithCapacity:150];
  v5 = [(REMReminder *)self dueDateComponents];
  v6 = [v5 date];

  v7 = [(REMReminder *)self title];
  v8 = [v7 string];

  [v4 appendString:@"\""];
  v9 = sub_10002D514(v8);
  [v4 appendString:v9];

  [v4 appendString:@"\"."];
  v10 = sub_10001750C(v6);
  [v4 appendString:v10];

  return v4;
}

@end