@interface NSExtension(UserNotificationsCore)
- (id)uns_extensionContainerBundleIdentifier;
- (id)uns_extensionContainerBundleProxy;
- (uint64_t)uns_isExtensionSessionBeingDebugged:()UserNotificationsCore;
@end

@implementation NSExtension(UserNotificationsCore)

- (id)uns_extensionContainerBundleProxy
{
  v1 = (void *)MEMORY[0x263F018C0];
  v2 = [a1 identifier];
  v3 = [v1 pluginKitProxyForIdentifier:v2];
  v4 = [v3 containingBundle];

  return v4;
}

- (id)uns_extensionContainerBundleIdentifier
{
  v1 = objc_msgSend(a1, "uns_extensionContainerBundleProxy");
  v2 = [v1 bundleIdentifier];

  return v2;
}

- (uint64_t)uns_isExtensionSessionBeingDebugged:()UserNotificationsCore
{
  uint64_t v1 = objc_msgSend(a1, "pidForRequestIdentifier:");

  return MEMORY[0x270F10890](v1);
}

@end