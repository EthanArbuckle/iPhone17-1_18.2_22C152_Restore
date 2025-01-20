@interface MFFakeMailAccount
- (BOOL)_shouldConfigureMailboxCache;
- (BOOL)isActive;
- (BOOL)isManaged;
- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4;
- (BOOL)supportsFastRemoteBodySearch;
- (BOOL)supportsRemoteAppend;
- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5;
- (DeliveryAccount)deliveryAccount;
- (MFFakeMailAccount)init;
- (MFFakeMailAccount)initWithURL:(id)a3;
- (MFFakeMailAccount)initWithURL:(id)a3 rootMailboxUid:(id)a4;
- (id)URLString;
- (id)_URLScheme;
- (id)_mailboxPathPrefix;
- (id)_nameForMailboxUid:(id)a3;
- (id)connectionForStore:(id)a3 delegate:(id)a4 options:(int)a5;
- (id)debugDescription;
- (id)description;
- (id)displayName;
- (id)flagChangesForMailboxPath:(id)a3 UID:(unsigned int)a4 connectTime:(double)a5;
- (id)flagChangesLock;
- (id)hostname;
- (id)powerAssertionIdentifierWithPrefix:(id)a3;
- (id)uniqueId;
- (id)username;
- (int)cachePolicy;
- (unsigned)minID;
- (void)setCachedConnection:(id)a3;
- (void)setDeliveryAccount:(id)a3;
- (void)setManaged:(BOOL)a3;
@end

@implementation MFFakeMailAccount

- (MFFakeMailAccount)init
{
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"account://test"];
  v4 = [(MFFakeMailAccount *)self initWithURL:v3];

  return v4;
}

- (MFFakeMailAccount)initWithURL:(id)a3
{
  return [(MFFakeMailAccount *)self initWithURL:a3 rootMailboxUid:0];
}

- (MFFakeMailAccount)initWithURL:(id)a3 rootMailboxUid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFFakeMailAccount;
  v9 = [(MFAccount *)&v13 init];
  if (v9)
  {
    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    flagChangesLock = v9->_flagChangesLock;
    v9->_flagChangesLock = v10;

    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v9->super._rootMailboxUid, a4);
  }

  return v9;
}

- (BOOL)isActive
{
  return 1;
}

- (BOOL)supportsRemoteAppend
{
  return 1;
}

- (BOOL)supportsFastRemoteBodySearch
{
  return 1;
}

- (id)URLString
{
  return [(NSURL *)self->_URL absoluteString];
}

- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5
{
  return 0;
}

- (id)_URLScheme
{
  return [(NSURL *)self->_URL scheme];
}

- (id)hostname
{
  return [(NSURL *)self->_URL host];
}

- (id)username
{
  return [(NSURL *)self->_URL user];
}

- (id)displayName
{
  return @"fakedisplayname";
}

- (id)_mailboxPathPrefix
{
  return @"test";
}

- (id)debugDescription
{
  return @"MFFakeMailAccount";
}

- (id)description
{
  return @"MFFakeMailAccount";
}

- (id)_nameForMailboxUid:(id)a3
{
  return @"INBOX";
}

- (id)uniqueId
{
  return @"test-unique-id";
}

- (id)powerAssertionIdentifierWithPrefix:(id)a3
{
  id v4 = a3;
  v5 = [(MFFakeMailAccount *)self displayName];
  if ([v5 length])
  {
    v6 = [(MFFakeMailAccount *)self displayName];
  }
  else
  {
    v6 = &stru_1F265CF90;
  }

  id v7 = [(MFFakeMailAccount *)self uniqueId];
  id v8 = [v4 stringByAppendingFormat:@"-%@-(%@)", v7, v6];

  return v8;
}

- (unsigned)minID
{
  return 1;
}

- (int)cachePolicy
{
  return 0;
}

- (void)setCachedConnection:(id)a3
{
  if (self->_cachedConnection != a3) {
    objc_storeStrong((id *)&self->_cachedConnection, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (id)connectionForStore:(id)a3 delegate:(id)a4 options:(int)a5
{
  return self->_cachedConnection;
}

- (id)flagChangesForMailboxPath:(id)a3 UID:(unsigned int)a4 connectTime:(double)a5
{
  return 0;
}

- (id)flagChangesLock
{
  return self->_flagChangesLock;
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  LOBYTE(v4) = a4;
  id v5 = a3;
  v6 = [v5 domain];
  id v7 = v6;
  if (!v5) {
    goto LABEL_11;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F288C8]])
  {
    LOBYTE(v4) = 0;
    goto LABEL_12;
  }
  if (![v7 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    if ([v7 isEqualToString:@"MFMessageErrorDomain"])
    {
      uint64_t v8 = [v5 code];
      if ((unint64_t)(v8 - 1032) <= 0x1B) {
        unsigned int v4 = (0x7FFFF7Eu >> (v8 - 8)) & 1;
      }
      else {
        LOBYTE(v4) = 1;
      }
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v4) = 1;
    goto LABEL_12;
  }
  if ([v5 code] != 60) {
    LOBYTE(v4) = 1;
  }
LABEL_12:

  return v4;
}

- (BOOL)_shouldConfigureMailboxCache
{
  return 1;
}

- (DeliveryAccount)deliveryAccount
{
  return self->_deliveryAccount;
}

- (void)setDeliveryAccount:(id)a3
{
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_flagChangesLock, 0);
  objc_storeStrong((id *)&self->_cachedConnection, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end