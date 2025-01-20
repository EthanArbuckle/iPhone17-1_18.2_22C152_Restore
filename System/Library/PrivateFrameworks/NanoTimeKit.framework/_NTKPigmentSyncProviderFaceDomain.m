@interface _NTKPigmentSyncProviderFaceDomain
- (NSString)domain;
- (NTKFace)face;
- (_NTKPigmentSyncProviderFaceDomain)initWithFace:(id)a3 domain:(id)a4;
- (void)setDomain:(id)a3;
- (void)setFace:(id)a3;
@end

@implementation _NTKPigmentSyncProviderFaceDomain

- (_NTKPigmentSyncProviderFaceDomain)initWithFace:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NTKPigmentSyncProviderFaceDomain;
  v9 = [(_NTKPigmentSyncProviderFaceDomain *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_face, a3);
    uint64_t v11 = [v8 copy];
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;
  }
  return v10;
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end