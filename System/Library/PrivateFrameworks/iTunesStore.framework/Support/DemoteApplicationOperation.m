@interface DemoteApplicationOperation
- (DemoteApplicationOperation)initWithBundleIdentifier:(id)a3;
- (void)run;
@end

@implementation DemoteApplicationOperation

- (DemoteApplicationOperation)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DemoteApplicationOperation;
  v5 = [(DemoteApplicationOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;
  }
  return v5;
}

- (void)run
{
  id v3 = +[NSError errorWithDomain:SSErrorDomain code:106 userInfo:&off_1003C9FF0];
  [(DemoteApplicationOperation *)self setError:v3];
  [(DemoteApplicationOperation *)self setSuccess:0];
}

- (void).cxx_destruct
{
}

@end