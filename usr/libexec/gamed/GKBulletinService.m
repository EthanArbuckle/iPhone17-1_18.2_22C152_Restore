@interface GKBulletinService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthentication;
- (void)sendRefreshContentsForDataTypeToAllClientProxy:(unsigned int)a3;
@end

@implementation GKBulletinService

- (BOOL)requiresAuthentication
{
  return 0;
}

+ (unint64_t)requiredEntitlements
{
  return 1;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)sendRefreshContentsForDataTypeToAllClientProxy:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022C8C;
  v3[3] = &unk_1002D3C58;
  unsigned int v4 = a3;
  +[GKClientProxy enumerateClientsUsingBlock:v3];
}

@end