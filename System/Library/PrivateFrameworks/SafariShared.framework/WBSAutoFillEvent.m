@interface WBSAutoFillEvent
- (BOOL)isExternalCredentialProviderEvent;
- (BOOL)isPrivateTab;
- (NSString)domain;
- (NSString)providerBundleIdentifier;
- (NSString)username;
- (NSURL)url;
- (NSUUID)tabID;
- (WBSAutoFillEvent)initWithUsername:(id)a3 tabID:(id)a4 isPrivateTab:(BOOL)a5 url:(id)a6 providerBundleIdentifier:(id)a7;
- (id)description;
- (unint64_t)machTimestamp;
- (unint64_t)timeIntervalSinceTimestamp;
- (void)setIsPrivateTab:(BOOL)a3;
- (void)setMachTimestamp:(unint64_t)a3;
- (void)setProviderBundleIdentifier:(id)a3;
- (void)setTabID:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation WBSAutoFillEvent

- (WBSAutoFillEvent)initWithUsername:(id)a3 tabID:(id)a4 isPrivateTab:(BOOL)a5 url:(id)a6 providerBundleIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WBSAutoFillEvent;
  v16 = [(WBSAutoFillEvent *)&v25 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    username = v16->_username;
    v16->_username = (NSString *)v17;

    objc_storeStrong((id *)&v16->_tabID, a4);
    v16->_isPrivateTab = a5;
    uint64_t v19 = [v14 copy];
    url = v16->_url;
    v16->_url = (NSURL *)v19;

    v16->_machTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v21 = [v15 copy];
    providerBundleIdentifier = v16->_providerBundleIdentifier;
    v16->_providerBundleIdentifier = (NSString *)v21;

    v23 = v16;
  }

  return v16;
}

- (unint64_t)timeIntervalSinceTimestamp
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_machTimestamp;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WBSAutoFillEvent;
  v4 = [(WBSAutoFillEvent *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@; user = '%@'; tabID = %@; isPrivate = %{BOOL}d timestamp = %lld>",
    v4,
    self->_username,
    self->_tabID,
    self->_isPrivateTab,
  v5 = self->_machTimestamp);

  return v5;
}

- (BOOL)isExternalCredentialProviderEvent
{
  return ![(NSString *)self->_providerBundleIdentifier isEqualToString:*MEMORY[0x1E4F98148]];
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSUUID)tabID
{
  return self->_tabID;
}

- (void)setTabID:(id)a3
{
}

- (BOOL)isPrivateTab
{
  return self->_isPrivateTab;
}

- (void)setIsPrivateTab:(BOOL)a3
{
  self->_isPrivateTab = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (void)setMachTimestamp:(unint64_t)a3
{
  self->_machTimestamp = a3;
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (void)setProviderBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_tabID, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end