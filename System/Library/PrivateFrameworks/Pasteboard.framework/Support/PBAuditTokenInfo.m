@interface PBAuditTokenInfo
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasAppleSignature;
- (BOOL)isAllowedAccessInBackground;
- (BOOL)isAllowedToCopyOnPaste;
- (BOOL)isAllowedToPasteUnchecked;
- (BOOL)isAllowedToPerformJanitorialTasks;
- (BOOL)isAllowedToQueryBundleID;
- (BOOL)isExtension;
- (BOOL)isTrustedToRequestAuthenticationMessages;
- (NSData)persistentIdentifier;
- (NSString)bundleID;
- (NSString)linkedOnVersion;
- (NSString)localizedName;
- (NSString)teamID;
- (NSURL)bundleURL;
- (int)pid;
- (void)setAllowedAccessInBackground:(BOOL)a3;
- (void)setAllowedToCopyOnPaste:(BOOL)a3;
- (void)setAllowedToPasteUnchecked:(BOOL)a3;
- (void)setAllowedToPerformJanitorialTasks:(BOOL)a3;
- (void)setAllowedToQueryBundleID:(BOOL)a3;
- (void)setAuditToken:(id *)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setHasAppleSignature:(BOOL)a3;
- (void)setIsExtension:(BOOL)a3;
- (void)setLinkedOnVersion:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setTeamID:(id)a3;
- (void)setTrustedToRequestAuthenticationMessages:(BOOL)a3;
@end

@implementation PBAuditTokenInfo

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)linkedOnVersion
{
  return self->_linkedOnVersion;
}

- (void)setLinkedOnVersion:(id)a3
{
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (void)setIsExtension:(BOOL)a3
{
  self->_isExtension = a3;
}

- (BOOL)isAllowedToQueryBundleID
{
  return self->_allowedToQueryBundleID;
}

- (void)setAllowedToQueryBundleID:(BOOL)a3
{
  self->_allowedToQueryBundleID = a3;
}

- (BOOL)isAllowedAccessInBackground
{
  return self->_allowedAccessInBackground;
}

- (void)setAllowedAccessInBackground:(BOOL)a3
{
  self->_allowedAccessInBackground = a3;
}

- (BOOL)isAllowedToPerformJanitorialTasks
{
  return self->_allowedToPerformJanitorialTasks;
}

- (void)setAllowedToPerformJanitorialTasks:(BOOL)a3
{
  self->_allowedToPerformJanitorialTasks = a3;
}

- (BOOL)isAllowedToPasteUnchecked
{
  return self->_allowedToPasteUnchecked;
}

- (void)setAllowedToPasteUnchecked:(BOOL)a3
{
  self->_allowedToPasteUnchecked = a3;
}

- (BOOL)isAllowedToCopyOnPaste
{
  return self->_allowedToCopyOnPaste;
}

- (void)setAllowedToCopyOnPaste:(BOOL)a3
{
  self->_allowedToCopyOnPaste = a3;
}

- (BOOL)isTrustedToRequestAuthenticationMessages
{
  return self->_trustedToRequestAuthenticationMessages;
}

- (void)setTrustedToRequestAuthenticationMessages:(BOOL)a3
{
  self->_trustedToRequestAuthenticationMessages = a3;
}

- (BOOL)hasAppleSignature
{
  return self->_hasAppleSignature;
}

- (void)setHasAppleSignature:(BOOL)a3
{
  self->_hasAppleSignature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedOnVersion, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

@end