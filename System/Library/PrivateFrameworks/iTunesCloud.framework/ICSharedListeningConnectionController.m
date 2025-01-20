@interface ICSharedListeningConnectionController
+ (id)externalSharedListeningConnectionWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5;
+ (id)sharedListeningConnectionWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5;
- (ICLiveLinkIdentity)identity;
- (ICSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5;
- (ICSharedListeningConnectionControllerDelegate)delegate;
- (NSString)bundleID;
- (NSString)sessionIdentifier;
- (NSString)sessionToken;
- (NSURL)inviteURL;
- (void)setDelegate:(id)a3;
- (void)setInviteURL:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSessionToken:(id)a3;
@end

@implementation ICSharedListeningConnectionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inviteURL, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

- (ICLiveLinkIdentity)identity
{
  return self->_identity;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setDelegate:(id)a3
{
}

- (ICSharedListeningConnectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSharedListeningConnectionControllerDelegate *)WeakRetained;
}

- (void)setInviteURL:(id)a3
{
}

- (NSURL)inviteURL
{
  return self->_inviteURL;
}

- (void)setSessionToken:(id)a3
{
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (ICSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICSharedListeningConnectionController;
  v12 = [(ICSharedListeningConnectionController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v13->_identity, a4);
    objc_storeStrong((id *)&v13->_bundleID, a5);
  }

  return v13;
}

+ (id)sharedListeningConnectionWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[ICDirectSharedListeningConnectionController alloc] initWithSessionIdentifier:v9 identity:v8 bundleID:v7];

  return v10;
}

+ (id)externalSharedListeningConnectionWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[ICExternalSharedListeningConnectionController alloc] initWithSessionIdentifier:v9 identity:v8 bundleID:v7];

  return v10;
}

@end