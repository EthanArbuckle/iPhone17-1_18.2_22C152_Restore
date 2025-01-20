@interface NETestAgent
- (BOOL)isLocal;
- (BOOL)isPerUser;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation NETestAgent

- (void).cxx_destruct
{
}

- (BOOL)isLocal
{
  return 1;
}

- (BOOL)isPerUser
{
  return 1;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    id Property = 0;
  }
  v7 = Property;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006824C;
  v9[3] = &unk_1000C6DB0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

@end