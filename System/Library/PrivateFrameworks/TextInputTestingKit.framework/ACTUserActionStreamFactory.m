@interface ACTUserActionStreamFactory
+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4;
@end

@implementation ACTUserActionStreamFactory

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKey:@"UserActionStream"];
  v8 = v7;
  if (v7) {
    Class v9 = NSClassFromString(v7);
  }
  else {
    Class v9 = (Class)_ACTUserActionStream;
  }
  v10 = [(objc_class *)v9 userActionStreamWithParameters:v5 delegate:v6];

  return v10;
}

@end