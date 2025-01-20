@interface SBSSystemInterface
- (SBSSystemInterface)init;
- (SBSSystemInterface)initWithTarget:(id)a3;
- (void)dealloc;
- (void)identifyWithOptions:(id)a3;
- (void)intercomWithOptions:(id)a3;
- (void)obliterate:(id)a3;
- (void)reboot:(id)a3;
- (void)requestDeferredReboot;
- (void)setTurnOffBrightnessFactor:(BOOL)a3;
@end

@implementation SBSSystemInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSSystemInterface;
  [(SBSSystemInterface *)&v3 dealloc];
}

- (void)setTurnOffBrightnessFactor:(BOOL)a3
{
}

- (void)intercomWithOptions:(id)a3
{
}

- (void)identifyWithOptions:(id)a3
{
}

- (void)obliterate:(id)a3
{
}

- (void)requestDeferredReboot
{
}

- (void)reboot:(id)a3
{
}

- (SBSSystemInterface)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSSystemInterface;
  v5 = [(SBSSystemInterface *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:0 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSSystemImplementer *)v6;
  }
  return v5;
}

- (SBSSystemInterface)init
{
  return [(SBSSystemInterface *)self initWithTarget:@"localhost"];
}

@end