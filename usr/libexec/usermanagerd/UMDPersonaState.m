@interface UMDPersonaState
- (NSMutableDictionary)asidMap;
- (NSMutableDictionary)userPersonas;
- (UMDPersonaState)init;
- (void)setAsidMap:(id)a3;
- (void)setUserPersonas:(id)a3;
@end

@implementation UMDPersonaState

- (UMDPersonaState)init
{
  v7.receiver = self;
  v7.super_class = (Class)UMDPersonaState;
  v2 = [(UMDPersonaState *)&v7 init];
  if (!v2) {
    sub_1000B08C8();
  }
  v3 = v2;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  userPersonas = v3->_userPersonas;
  v3->_userPersonas = (NSMutableDictionary *)v4;

  return v3;
}

- (NSMutableDictionary)userPersonas
{
  return self->_userPersonas;
}

- (void)setUserPersonas:(id)a3
{
}

- (NSMutableDictionary)asidMap
{
  return self->_asidMap;
}

- (void)setAsidMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asidMap, 0);

  objc_storeStrong((id *)&self->_userPersonas, 0);
}

@end