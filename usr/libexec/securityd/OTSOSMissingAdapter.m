@interface OTSOSMissingAdapter
- (BOOL)essential;
- (BOOL)joinAfterRestore:(id *)a3;
- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4;
- (BOOL)resetToOffering:(id *)a3;
- (BOOL)safariViewSyncingEnabled:(id *)a3;
- (BOOL)sosEnabled;
- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4;
- (NSString)providerID;
- (OTSOSMissingAdapter)init;
- (id)currentSOSSelf:(id *)a3;
- (id)currentState;
- (id)fetchSelfPeers:(id *)a3;
- (id)fetchTrustedPeers:(id *)a3;
- (int)circleStatus:(id *)a3;
- (void)setEssential:(BOOL)a3;
@end

@implementation OTSOSMissingAdapter

- (void).cxx_destruct
{
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (BOOL)essential
{
  return self->_essential;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)resetToOffering:(id *)a3
{
  if (a3)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  if (a3)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (BOOL)safariViewSyncingEnabled:(id *)a3
{
  return 0;
}

- (id)currentState
{
  v3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  v4 = [CKKSPeerProviderState alloc];
  v5 = [(OTSOSMissingAdapter *)self providerID];
  v6 = [(CKKSPeerProviderState *)v4 initWithPeerProviderID:v5 essential:[(OTSOSMissingAdapter *)self essential] selfPeers:0 selfPeersError:v3 trustedPeers:0 trustedPeersError:v3];

  return v6;
}

- (id)fetchSelfPeers:(id *)a3
{
  if (a3)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (id)fetchTrustedPeers:(id *)a3
{
  if (a3)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (id)currentSOSSelf:(id *)a3
{
  if (a3)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
  }
  return 0;
}

- (int)circleStatus:(id *)a3
{
  return 1;
}

- (BOOL)sosEnabled
{
  return 0;
}

- (OTSOSMissingAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)OTSOSMissingAdapter;
  v2 = [(OTSOSMissingAdapter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    providerID = v2->_providerID;
    v2->_providerID = (NSString *)@"[OTSOSMissingAdapter]";

    v3->_essential = 0;
  }
  return v3;
}

@end