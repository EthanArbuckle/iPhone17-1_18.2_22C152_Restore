@interface NSXPCConnection
- (BOOL)ml_isValid;
- (void)ml_setValid:(BOOL)a3;
@end

@implementation NSXPCConnection

- (void)ml_setValid:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "MLNSXPCConnectionIsValidKey", v4, (void *)1);
}

- (BOOL)ml_isValid
{
  v2 = objc_getAssociatedObject(self, "MLNSXPCConnectionIsValidKey");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

@end