@interface SRSTCallStateProxy
- (SRSTCallStateProxy)initWithState:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SRSTCallStateProxy

- (SRSTCallStateProxy)initWithState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTCallStateProxy;
  id v3 = a3;
  v4 = [(SRSTCallStateProxy *)&v6 init];
  -[SRSTCallStateProxy setState:](v4, "setState:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end