@interface NRConcurrentPipeManager
+ (Class)resourceClass;
- (NSData)oobKey;
- (NSUUID)uuid;
- (id)newIDSPairingToUUID:(id)a3 pairingUUID:(id)a4 oobKey:(id)a5 withExtensiblePairingDelegate:(id)a6 withDelegate:(id)a7;
- (void)createResource;
@end

@implementation NRConcurrentPipeManager

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (id)newIDSPairingToUUID:(id)a3 pairingUUID:(id)a4 oobKey:(id)a5 withExtensiblePairingDelegate:(id)a6 withDelegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uuid = self->_uuid;
  if (uuid && ![(NSUUID *)uuid isEqual:v13])
  {
    id v19 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_uuid, a3);
    objc_storeStrong((id *)&self->_oobKey, a5);
    objc_storeWeak((id *)&self->_epDelegate, v16);
    objc_storeStrong((id *)&self->_pairingID, a4);
    id v19 = [(EPResourceManager *)self newResourceWithDelegate:v17];
  }

  return v19;
}

- (void)createResource
{
  v9.receiver = self;
  v9.super_class = (Class)NRConcurrentPipeManager;
  [(EPResourceManager *)&v9 createResource];
  if (self->_idsIsPaired)
  {
    v3 = self;
    uint64_t v4 = 1;
    idsPairingFailureError = 0;
  }
  else
  {
    idsPairingFailureError = self->_idsPairingFailureError;
    if (!idsPairingFailureError)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_epDelegate);
      pairingID = self->_pairingID;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000B2BE0;
      v8[3] = &unk_100168218;
      v8[4] = self;
      [WeakRetained createLocalPairingStore:pairingID andNotifyPairingBeginning:1 withBlock:v8];

      return;
    }
    v3 = self;
    uint64_t v4 = 2;
  }
  [(EPResourceManager *)v3 setAvailability:v4 withError:idsPairingFailureError];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)oobKey
{
  return self->_oobKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobKey, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_destroyWeak((id *)&self->_epDelegate);

  objc_storeStrong((id *)&self->_idsPairingFailureError, 0);
}

@end