@interface SBSStereoLeaderInterface
- (SBSStereoLeaderInterface)init;
- (SBSStereoLeaderInterface)initWithTarget:(id)a3;
- (void)dealloc;
- (void)isFollower:(id)a3;
- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4;
@end

@implementation SBSStereoLeaderInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (SBSStereoLeaderInterface)init
{
  return [(SBSStereoLeaderInterface *)self initWithTarget:@"localhost"];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSStereoLeaderInterface;
  [(SBSStereoLeaderInterface *)&v3 dealloc];
}

- (void)isFollower:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sbProxy = self->_sbProxy;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SBSStereoLeaderInterface_isFollower___block_invoke;
    v7[3] = &unk_264BA4668;
    id v8 = v4;
    [(SBSImplementer *)sbProxy isDeviceStereoFollower:v7];
  }
}

void __39__SBSStereoLeaderInterface_isFollower___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
}

- (SBSStereoLeaderInterface)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSStereoLeaderInterface;
  v5 = [(SBSStereoLeaderInterface *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSImplementer *)v6;
  }
  return v5;
}

@end