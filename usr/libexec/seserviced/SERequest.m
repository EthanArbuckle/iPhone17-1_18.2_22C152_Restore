@interface SERequest
+ (id)newSERequestWithReason:(id)a3 callback:(id)a4;
- (NSString)reason;
- (id)callback;
@end

@implementation SERequest

+ (id)newSERequestWithReason:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  id v9 = v5;

  id v10 = [v6 copy];
  v11 = (void *)v7[1];
  v7[1] = v10;

  return v7;
}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong(&self->_callback, 0);
}

@end