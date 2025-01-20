@interface WBSSafariExtension
- (NSArray)injectedScripts;
- (NSArray)injectedStyleSheets;
- (NSDictionary)untrustedCodeSigningDictionary;
- (NSString)displayName;
- (NSURL)safariExtensionBaseURI;
- (NSUUID)baseURIHost;
- (NSUUID)privacyPreservingProfileIdentifier;
- (WBSExtensionsController)extensionsController;
- (WBSSafariExtension)initWithExtension:(id)a3 extensionsController:(id)a4;
- (__SecCode)bundleCodeRef;
- (void)dealloc;
- (void)setBundleCodeRef:(__SecCode *)a3;
- (void)setExtensionsController:(id)a3;
- (void)setInjectedScripts:(id)a3;
- (void)setInjectedStyleSheets:(id)a3;
- (void)setPrivacyPreservingProfileIdentifier:(id)a3;
- (void)setSafariExtensionBaseURI:(id)a3;
- (void)setUntrustedCodeSigningDictionary:(id)a3;
@end

@implementation WBSSafariExtension

- (WBSSafariExtension)initWithExtension:(id)a3 extensionsController:(id)a4
{
  id v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WBSSafariExtension;
  v6 = [(WBSSafariExtension *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_extensionsController, v5);
    v8 = v7;
  }

  return v7;
}

- (void)setBundleCodeRef:(__SecCode *)a3
{
  bundleCodeRef = self->_bundleCodeRef;
  if (bundleCodeRef != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      bundleCodeRef = self->_bundleCodeRef;
    }
    if (bundleCodeRef) {
      CFRelease(bundleCodeRef);
    }
    self->_bundleCodeRef = a3;
  }
}

- (void)dealloc
{
  bundleCodeRef = self->_bundleCodeRef;
  if (bundleCodeRef) {
    CFRelease(bundleCodeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)WBSSafariExtension;
  [(WBSSafariExtension *)&v4 dealloc];
}

- (WBSExtensionsController)extensionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);

  return (WBSExtensionsController *)WeakRetained;
}

- (void)setExtensionsController:(id)a3
{
}

- (NSURL)safariExtensionBaseURI
{
  return self->_safariExtensionBaseURI;
}

- (void)setSafariExtensionBaseURI:(id)a3
{
}

- (NSUUID)baseURIHost
{
  return self->_baseURIHost;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (__SecCode)bundleCodeRef
{
  return self->_bundleCodeRef;
}

- (NSDictionary)untrustedCodeSigningDictionary
{
  return self->_untrustedCodeSigningDictionary;
}

- (void)setUntrustedCodeSigningDictionary:(id)a3
{
}

- (NSArray)injectedScripts
{
  return self->_injectedScripts;
}

- (void)setInjectedScripts:(id)a3
{
}

- (NSArray)injectedStyleSheets
{
  return self->_injectedStyleSheets;
}

- (void)setInjectedStyleSheets:(id)a3
{
}

- (NSUUID)privacyPreservingProfileIdentifier
{
  return self->_privacyPreservingProfileIdentifier;
}

- (void)setPrivacyPreservingProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPreservingProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_injectedStyleSheets, 0);
  objc_storeStrong((id *)&self->_injectedScripts, 0);
  objc_storeStrong((id *)&self->_untrustedCodeSigningDictionary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_baseURIHost, 0);
  objc_storeStrong((id *)&self->_safariExtensionBaseURI, 0);

  objc_destroyWeak((id *)&self->_extensionsController);
}

@end