@interface UMDPersonaManifestUser
- (UMDPersonaManifestUser)init;
@end

@implementation UMDPersonaManifestUser

- (UMDPersonaManifestUser)init
{
  v7.receiver = self;
  v7.super_class = (Class)UMDPersonaManifestUser;
  v2 = [(UMDPersonaManifestUser *)&v7 init];
  if (!v2) {
    sub_1000B08C8();
  }
  v3 = v2;
  uint64_t v4 = +[NSSet set];
  personas = v3->_personas;
  v3->_personas = (NSSet *)v4;

  v3->_asid = -1;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_personas, 0);
}

@end