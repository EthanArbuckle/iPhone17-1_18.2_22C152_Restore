@interface RPExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)didConnectToVendor:(id)a3;
@end

@implementation RPExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NSObject];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPExtensionVendorProtocol];
}

- (void)didConnectToVendor:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Connected to extension.", v3, 2u);
  }
}

@end