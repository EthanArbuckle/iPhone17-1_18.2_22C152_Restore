@interface NSXPCConnection
- (BOOL)rcs_isValid;
- (NSString)rcs_applicationIdentifier;
- (id)rc_userInfoForKey:(id)a3;
- (void)rc_setUserInfo:(id)a3 forKey:(id)a4;
- (void)rcs_setValid:(BOOL)a3;
@end

@implementation NSXPCConnection

- (void)rcs_setValid:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "RCSNSXPCConnectionIsValidKey", v4, (void *)1);
}

- (NSString)rcs_applicationIdentifier
{
  return (NSString *)[(NSXPCConnection *)self valueForEntitlement:@"application-identifier"];
}

- (BOOL)rcs_isValid
{
  v2 = objc_getAssociatedObject(self, "RCSNSXPCConnectionIsValidKey");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)rc_setUserInfo:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = objc_getAssociatedObject(self, "RCSNSXPCConnectionUserInfoDictionaryKey");
  id v8 = v10;
  v9 = v7;
  if (v10 && !v7)
  {
    v9 = +[NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, "RCSNSXPCConnectionUserInfoDictionaryKey", v9, (void *)0x301);
    id v8 = v10;
LABEL_5:
    [v9 setObject:v8 forKey:v6];
    goto LABEL_7;
  }
  if (v10) {
    goto LABEL_5;
  }
  [v7 removeObjectForKey:v6];
LABEL_7:
}

- (id)rc_userInfoForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(self, "RCSNSXPCConnectionUserInfoDictionaryKey");
  id v6 = [v5 objectForKey:v4];

  return v6;
}

@end