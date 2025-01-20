@interface SFRSAKeyPair
- (id)initRandomKeyPairWithSpecifier:(id)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4;
@end

@implementation SFRSAKeyPair

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return [(SFRSAKeyPair *)self initRandomKeyPairWithSpecifier:a3 privateKeyDomain:@"SFKeyDomainCPU"];
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [(_SFKeyPair *)self initWithData:v6 specifier:v5 error:0];

  return v7;
}

- (void).cxx_destruct
{
}

@end