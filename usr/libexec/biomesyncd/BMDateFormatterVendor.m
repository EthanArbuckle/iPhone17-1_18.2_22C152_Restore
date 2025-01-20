@interface BMDateFormatterVendor
+ (id)sharedInstance;
- (BMDateFormatterVendor)init;
- (id)dateFormatter;
@end

@implementation BMDateFormatterVendor

- (BMDateFormatterVendor)init
{
  v6.receiver = self;
  v6.super_class = (Class)BMDateFormatterVendor;
  v2 = [(BMDateFormatterVendor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = (NSISO8601DateFormatter *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100080350 != -1) {
    dispatch_once(&qword_100080350, &stru_10006D988);
  }
  v2 = (void *)qword_100080348;

  return v2;
}

- (id)dateFormatter
{
  return self->_dateFormatter;
}

- (void).cxx_destruct
{
}

@end