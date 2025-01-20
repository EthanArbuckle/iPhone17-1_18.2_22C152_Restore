@interface IMSyncResumer
- (IMSyncResumer)initWithDelegate:(id)a3;
- (MCSSyncResumer)resumer;
- (void)attemptToResumeSyncIfAppropriate;
- (void)attemptToResumeSyncOnAccountUpdateIfAppropriate;
- (void)attemptToResumeSyncOnIdentityUpdateIfAppropriate;
- (void)setResumer:(id)a3;
@end

@implementation IMSyncResumer

- (IMSyncResumer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMSyncResumer;
  v5 = [(IMSyncResumer *)&v15 init];
  if (v5)
  {
    v6 = [MCSSyncResumer alloc];
    v10 = objc_msgSend_initWithDelegate_(v6, v7, (uint64_t)v4, v8, v9);
    objc_msgSend_setResumer_(v5, v11, (uint64_t)v10, v12, v13);
  }
  return v5;
}

- (void)attemptToResumeSyncOnAccountUpdateIfAppropriate
{
  objc_msgSend_resumer(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attemptToResumeSyncOnAccountUpdateIfAppropriate(v9, v5, v6, v7, v8);
}

- (void)attemptToResumeSyncOnIdentityUpdateIfAppropriate
{
  objc_msgSend_resumer(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attemptToResumeSyncOnIdentityUpdateIfAppropriate(v9, v5, v6, v7, v8);
}

- (void)attemptToResumeSyncIfAppropriate
{
  objc_msgSend_resumer(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attemptToResumeSyncIfAppropriate(v9, v5, v6, v7, v8);
}

- (MCSSyncResumer)resumer
{
  return self->_resumer;
}

- (void)setResumer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end