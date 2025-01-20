@interface APVideoURLUtilities
+ (BOOL)shouldProxyRequestToHost:(id)a3;
+ (id)proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5;
@end

@implementation APVideoURLUtilities

+ (BOOL)shouldProxyRequestToHost:(id)a3
{
  return objc_msgSend_shouldProxyRequestToHost_(APProxyURLUtilities, a2, (uint64_t)a3, v3, v4);
}

+ (id)proxyURLForVideoURL:(id)a3 adIdentifier:(id)a4 changeScheme:(BOOL)a5
{
  return (id)objc_msgSend_proxyURLForVideoURL_adIdentifier_changeScheme_(APProxyURLUtilities, a2, (uint64_t)a3, (uint64_t)a4, a5);
}

@end