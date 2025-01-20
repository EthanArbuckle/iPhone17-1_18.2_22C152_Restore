@interface MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest
- (ICUserIdentity)userIdentity;
- (MPServerObjectDatabaseMediaKitImportRequest)_underlyingImportRequest;
- (MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest)initWithPayload:(id)a3;
- (NSDate)expirationDate;
- (id)payload;
- (void)setExpirationDate:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest

- (MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest)initWithPayload:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest;
  v5 = [(MusicKit_SoftLinking_MPServerObjectDatabaseMediaKitImportRequest *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getMPServerObjectDatabaseMediaKitImportRequestClass_softClass;
    uint64_t v16 = getMPServerObjectDatabaseMediaKitImportRequestClass_softClass;
    if (!getMPServerObjectDatabaseMediaKitImportRequestClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getMPServerObjectDatabaseMediaKitImportRequestClass_block_invoke;
      v12[3] = &unk_1E6D453B0;
      v12[4] = &v13;
      __getMPServerObjectDatabaseMediaKitImportRequestClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [[v7 alloc] initWithPayload:v4];
    underlyingImportRequest = v5->_underlyingImportRequest;
    v5->_underlyingImportRequest = (MPServerObjectDatabaseMediaKitImportRequest *)v8;
  }
  return v5;
}

- (id)payload
{
  return (id)[(MPServerObjectDatabaseMediaKitImportRequest *)self->_underlyingImportRequest payload];
}

- (ICUserIdentity)userIdentity
{
  return (ICUserIdentity *)[(MPServerObjectDatabaseMediaKitImportRequest *)self->_underlyingImportRequest userIdentity];
}

- (void)setUserIdentity:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)[(MPServerObjectDatabaseMediaKitImportRequest *)self->_underlyingImportRequest expirationDate];
}

- (void)setExpirationDate:(id)a3
{
}

- (MPServerObjectDatabaseMediaKitImportRequest)_underlyingImportRequest
{
  return self->_underlyingImportRequest;
}

- (void).cxx_destruct
{
}

@end