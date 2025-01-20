@interface NROSTransaction
+ (NROSTransaction)transactionWithName:(id)a3;
- (NROSTransaction)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (void)dealloc;
@end

@implementation NROSTransaction

- (id)description
{
  if (self->_name) {
    CFStringRef name = (const __CFString *)self->_name;
  }
  else {
    CFStringRef name = @"none";
  }
  return [@"NROSTransaction: " stringByAppendingString:name];
}

+ (NROSTransaction)transactionWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4];

  return (NROSTransaction *)v5;
}

- (NROSTransaction)initWithName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NROSTransaction;
  id v5 = [(NROSTransaction *)&v14 init];
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = [v6 UUIDString];
    v8 = [v7 substringToIndex:4];
    uint64_t v9 = +[NSString stringWithFormat:@"%@.%@", v4, v8];
    CFStringRef name = v5->_name;
    v5->_CFStringRef name = (NSString *)v9;

    v11 = +[NROSTransactionLogger sharedInstance];
    id v12 = [v11 addTransaction:v5];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NROSTransactionLogger sharedInstance];
  [v3 removeTransaction:self];

  v4.receiver = self;
  v4.super_class = (Class)NROSTransaction;
  [(NROSTransaction *)&v4 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end