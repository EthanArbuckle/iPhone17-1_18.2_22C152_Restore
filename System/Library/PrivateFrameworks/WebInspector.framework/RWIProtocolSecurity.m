@interface RWIProtocolSecurity
- (RWIProtocolSecurityCertificate)certificate;
- (RWIProtocolSecurityConnection)connection;
- (void)setCertificate:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation RWIProtocolSecurity

- (void)setConnection:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurity;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"connection"];
}

- (RWIProtocolSecurityConnection)connection
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolSecurity;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"connection"];
  if (v3)
  {
    v4 = [RWIProtocolSecurityConnection alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolSecurity;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"connection"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setCertificate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurity;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"certificate"];
}

- (RWIProtocolSecurityCertificate)certificate
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolSecurity;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"certificate"];
  if (v3)
  {
    v4 = [RWIProtocolSecurityCertificate alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolSecurity;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"certificate"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end