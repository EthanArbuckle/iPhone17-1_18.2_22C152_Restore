@interface LocalSecuritydXPCServer
- (BOOL)clientHasBooleanEntitlement:(id)a3;
- (LocalSecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3 fakeEntitlements:(id)a4;
- (NSMutableDictionary)fakeEntitlements;
- (void)setFakeEntitlements:(id)a3;
@end

@implementation LocalSecuritydXPCServer

- (void).cxx_destruct
{
}

- (void)setFakeEntitlements:(id)a3
{
}

- (NSMutableDictionary)fakeEntitlements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)clientHasBooleanEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(LocalSecuritydXPCServer *)self fakeEntitlements];

  if (v5)
  {
    v6 = [(LocalSecuritydXPCServer *)self fakeEntitlements];
    v7 = [v6 objectForKeyedSubscript:v4];
    unsigned __int8 v8 = [v7 isEqual:&__kCFBooleanTrue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (LocalSecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3 fakeEntitlements:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LocalSecuritydXPCServer;
  v7 = [(SecuritydXPCServer *)&v11 initWithSecurityClient:a3];
  if (v7)
  {
    unsigned __int8 v8 = (NSMutableDictionary *)[v6 mutableCopy];
    fakeEntitlements = v7->_fakeEntitlements;
    v7->_fakeEntitlements = v8;
  }
  return v7;
}

@end