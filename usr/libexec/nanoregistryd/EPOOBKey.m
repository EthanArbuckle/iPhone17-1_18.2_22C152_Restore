@interface EPOOBKey
- (EPOOBKey)initWithData:(id)a3;
- (NSData)key;
@end

@implementation EPOOBKey

- (EPOOBKey)initWithData:(id)a3
{
  id v5 = a3;
  v6 = [(EPOOBKey *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end