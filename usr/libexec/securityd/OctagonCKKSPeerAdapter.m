@interface OctagonCKKSPeerAdapter
- (BOOL)essential;
- (CKKSListenerCollection)peerChangeListeners;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSString)description;
- (NSString)peerID;
- (NSString)providerID;
- (OTPersonaAdapter)personaAdapter;
- (OctagonCKKSPeerAdapter)initWithPeerID:(id)a3 specificUser:(id)a4 personaAdapter:(id)a5 cuttlefishXPC:(id)a6;
- (TPSpecificUser)specificUser;
- (id)currentState;
- (id)fetchIdentity:(id)a3 error:(id *)a4;
- (id)fetchSelfPeers:(id *)a3;
- (id)fetchTrustedPeers:(id *)a3;
- (void)registerForPeerChangeUpdates:(id)a3;
- (void)sendSelfPeerChangedUpdate;
- (void)sendTrustedPeerSetChangedUpdate;
- (void)setEssential:(BOOL)a3;
- (void)setPeerChangeListeners:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPersonaAdapter:(id)a3;
@end

@implementation OctagonCKKSPeerAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerChangeListeners, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_cuttlefishXPCWrapper, 0);
  objc_storeStrong((id *)&self->_specificUser, 0);
  objc_storeStrong((id *)&self->_peerID, 0);

  objc_storeStrong((id *)&self->_providerID, 0);
}

- (void)setPeerChangeListeners:(id)a3
{
}

- (CKKSListenerCollection)peerChangeListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 48, 1);
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 40, 1);
}

- (TPSpecificUser)specificUser
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (BOOL)essential
{
  return self->_essential;
}

- (id)currentState
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10004FE30;
  v13 = sub_10004FE40;
  id v14 = 0;
  v3 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  v4 = [(OctagonCKKSPeerAdapter *)self specificUser];
  v5 = [v4 personaUniqueString];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004FE48;
  v8[3] = &unk_100307348;
  v8[4] = self;
  v8[5] = &v9;
  [v3 performBlockWithPersonaIdentifier:v5 block:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)sendTrustedPeerSetChangedUpdate
{
  v3 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  v4 = [(OctagonCKKSPeerAdapter *)self specificUser];
  v5 = [v4 personaUniqueString];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004FF58;
  v6[3] = &unk_100308558;
  v6[4] = self;
  [v3 performBlockWithPersonaIdentifier:v5 block:v6];
}

- (void)sendSelfPeerChangedUpdate
{
  v3 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  v4 = [(OctagonCKKSPeerAdapter *)self specificUser];
  v5 = [v4 personaUniqueString];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000500B0;
  v6[3] = &unk_100308558;
  v6[4] = self;
  [v3 performBlockWithPersonaIdentifier:v5 block:v6];
}

- (void)registerForPeerChangeUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  id v6 = [(OctagonCKKSPeerAdapter *)self specificUser];
  v7 = [v6 personaUniqueString];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100050230;
  v9[3] = &unk_100305930;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 performBlockWithPersonaIdentifier:v7 block:v9];
}

- (id)fetchTrustedPeers:(id *)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10004FE30;
  v15 = sub_10004FE40;
  id v16 = 0;
  v5 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  id v6 = [(OctagonCKKSPeerAdapter *)self specificUser];
  v7 = [v6 personaUniqueString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000503E0;
  v10[3] = &unk_1003097F0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  [v5 performBlockWithPersonaIdentifier:v7 block:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)fetchSelfPeers:(id *)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10004FE30;
  v15 = sub_10004FE40;
  id v16 = 0;
  v5 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  id v6 = [(OctagonCKKSPeerAdapter *)self specificUser];
  v7 = [v6 personaUniqueString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100050994;
  v10[3] = &unk_1003097F0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  [v5 performBlockWithPersonaIdentifier:v7 block:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)fetchIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10004FE30;
  v21 = sub_10004FE40;
  id v22 = 0;
  v7 = [(OctagonCKKSPeerAdapter *)self personaAdapter];
  id v8 = [(OctagonCKKSPeerAdapter *)self specificUser];
  uint64_t v9 = [v8 personaUniqueString];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100050DA4;
  v13[3] = &unk_1003097F0;
  id v10 = v6;
  id v14 = v10;
  v15 = &v17;
  id v16 = a4;
  [v7 performBlockWithPersonaIdentifier:v9 block:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (NSString)description
{
  v3 = [(OctagonCKKSPeerAdapter *)self peerID];
  id v4 = +[NSString stringWithFormat:@"<OctagonCKKSPeerAdapter: %@ e:%d>", v3, [(OctagonCKKSPeerAdapter *)self essential]];

  return (NSString *)v4;
}

- (OctagonCKKSPeerAdapter)initWithPeerID:(id)a3 specificUser:(id)a4 personaAdapter:(id)a5 cuttlefishXPC:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OctagonCKKSPeerAdapter;
  v15 = [(OctagonCKKSPeerAdapter *)&v21 init];
  if (v15)
  {
    uint64_t v16 = +[NSString stringWithFormat:@"[OctagonCKKSPeerAdapter:%@]", v11];
    providerID = v15->_providerID;
    v15->_providerID = (NSString *)v16;

    objc_storeStrong((id *)&v15->_peerID, a3);
    objc_storeStrong((id *)&v15->_specificUser, a4);
    objc_storeStrong((id *)&v15->_personaAdapter, a5);
    objc_storeStrong((id *)&v15->_cuttlefishXPCWrapper, a6);
    v18 = [[CKKSListenerCollection alloc] initWithName:@"ckks-sos"];
    peerChangeListeners = v15->_peerChangeListeners;
    v15->_peerChangeListeners = v18;

    v15->_essential = 1;
  }

  return v15;
}

@end