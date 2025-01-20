@interface SBDDomainServiceHandler
- (SBCPlaybackPositionDomain)domain;
- (SBDDomainServiceHandler)init;
- (SBDDomainServiceHandler)initWithDomain:(id)a3;
@end

@implementation SBDDomainServiceHandler

- (void).cxx_destruct
{
}

- (SBCPlaybackPositionDomain)domain
{
  return self->_domain;
}

- (SBDDomainServiceHandler)init
{
  return [(SBDDomainServiceHandler *)self initWithDomain:0];
}

- (SBDDomainServiceHandler)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDDomainServiceHandler;
  v6 = [(SBDDomainServiceHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

@end