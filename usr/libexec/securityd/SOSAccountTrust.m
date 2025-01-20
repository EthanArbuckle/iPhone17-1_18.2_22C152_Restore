@interface SOSAccountTrust
+ (id)trust;
- (NSMutableDictionary)expansion;
- (NSMutableSet)retirees;
- (NSString)peerID;
- (SOSAccountTrust)init;
- (SOSAccountTrust)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7;
- (__OpaqueSOSCircle)trustedCircle;
- (__OpaqueSOSFullPeerInfo)fullPeerInfo;
- (__OpaqueSOSPeerInfo)peerInfo;
- (__SecKey)cachedOctagonEncryptionKey;
- (__SecKey)cachedOctagonSigningKey;
- (int)departureCode;
- (void)dealloc;
- (void)setCachedOctagonEncryptionKey:(__SecKey *)a3;
- (void)setCachedOctagonSigningKey:(__SecKey *)a3;
- (void)setDepartureCode:(int)a3;
- (void)setExpansion:(id)a3;
- (void)setFullPeerInfo:(__OpaqueSOSFullPeerInfo *)a3;
- (void)setRetirees:(id)a3;
- (void)setTrustedCircle:(__OpaqueSOSCircle *)a3;
@end

@implementation SOSAccountTrust

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->retirees, 0);
  objc_storeStrong((id *)&self->peerID, 0);

  objc_storeStrong((id *)&self->expansion, 0);
}

- (int)departureCode
{
  return self->departureCode;
}

- (NSMutableDictionary)expansion
{
  return self->expansion;
}

- (__OpaqueSOSFullPeerInfo)fullPeerInfo
{
  return self->fullPeerInfo;
}

- (NSMutableSet)retirees
{
  return self->retirees;
}

- (__OpaqueSOSCircle)trustedCircle
{
  return self->trustedCircle;
}

- (void)setCachedOctagonSigningKey:(__SecKey *)a3
{
  self->_cachedOctagonSigningKey = a3;
}

- (__SecKey)cachedOctagonSigningKey
{
  return self->_cachedOctagonSigningKey;
}

- (void)setCachedOctagonEncryptionKey:(__SecKey *)a3
{
  self->_cachedOctagonEncryptionKey = a3;
}

- (__SecKey)cachedOctagonEncryptionKey
{
  return self->_cachedOctagonEncryptionKey;
}

- (void)setDepartureCode:(int)a3
{
  self->departureCode = a3;
}

- (void)setExpansion:(id)a3
{
  self->expansion = (NSMutableDictionary *)[a3 mutableCopy];

  _objc_release_x1();
}

- (void)setFullPeerInfo:(__OpaqueSOSFullPeerInfo *)a3
{
  fullPeerInfo = self->fullPeerInfo;
  if (fullPeerInfo != a3)
  {
    if (!a3 || (CFRetain(a3), (fullPeerInfo = self->fullPeerInfo) != 0)) {
      CFRelease(fullPeerInfo);
    }
    self->fullPeerInfo = a3;
  }
}

- (void)setRetirees:(id)a3
{
  self->retirees = (NSMutableSet *)[a3 mutableCopy];

  _objc_release_x1();
}

- (void)setTrustedCircle:(__OpaqueSOSCircle *)a3
{
  trustedCircle = self->trustedCircle;
  if (trustedCircle != a3)
  {
    if (!a3 || (CFRetain(a3), (trustedCircle = self->trustedCircle) != 0)) {
      CFRelease(trustedCircle);
    }
    self->trustedCircle = a3;
  }
}

- (NSString)peerID
{
  [(SOSAccountTrust *)self peerInfo];
  PeerID = (void *)SOSPeerInfoGetPeerID();
  v3 = PeerID;
  if (PeerID) {
    CFRetain(PeerID);
  }

  return (NSString *)v3;
}

- (__OpaqueSOSPeerInfo)peerInfo
{
  [(SOSAccountTrust *)self fullPeerInfo];

  return (__OpaqueSOSPeerInfo *)SOSFullPeerInfoGetPeerInfo();
}

- (void)dealloc
{
  if (self)
  {
    fullPeerInfo = self->fullPeerInfo;
    if (fullPeerInfo)
    {
      self->fullPeerInfo = 0;
      CFRelease(fullPeerInfo);
    }
    peerInfo = self->peerInfo;
    if (peerInfo)
    {
      self->peerInfo = 0;
      CFRelease(peerInfo);
    }
    trustedCircle = self->trustedCircle;
    if (trustedCircle)
    {
      self->trustedCircle = 0;
      CFRelease(trustedCircle);
    }
    cachedOctagonSigningKey = self->_cachedOctagonSigningKey;
    if (cachedOctagonSigningKey)
    {
      self->_cachedOctagonSigningKey = 0;
      CFRelease(cachedOctagonSigningKey);
    }
    cachedOctagonEncryptionKey = self->_cachedOctagonEncryptionKey;
    if (cachedOctagonEncryptionKey)
    {
      self->_cachedOctagonEncryptionKey = 0;
      CFRelease(cachedOctagonEncryptionKey);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SOSAccountTrust;
  [(SOSAccountTrust *)&v8 dealloc];
}

- (SOSAccountTrust)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SOSAccountTrust;
  v14 = [(SOSAccountTrust *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(SOSAccountTrust *)v14 setRetirees:v12];
    [(SOSAccountTrust *)v15 setFullPeerInfo:a4];
    [(SOSAccountTrust *)v15 setTrustedCircle:a5];
    [(SOSAccountTrust *)v15 setDepartureCode:v8];
    [(SOSAccountTrust *)v15 setExpansion:v13];
  }

  return v15;
}

- (SOSAccountTrust)init
{
  v6.receiver = self;
  v6.super_class = (Class)SOSAccountTrust;
  v2 = [(SOSAccountTrust *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableSet set];
    [(SOSAccountTrust *)v2 setRetirees:v3];

    [(SOSAccountTrust *)v2 setFullPeerInfo:0];
    [(SOSAccountTrust *)v2 setTrustedCircle:0];
    [(SOSAccountTrust *)v2 setDepartureCode:0];
    v4 = +[NSMutableDictionary dictionary];
    [(SOSAccountTrust *)v2 setExpansion:v4];
  }
  return v2;
}

+ (id)trust
{
  v2 = objc_alloc_init(SOSAccountTrust);

  return v2;
}

@end