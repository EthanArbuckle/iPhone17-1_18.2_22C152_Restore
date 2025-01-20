@interface NMSKeepLocalRequest
- (MPModelObject)modelObject;
- (NMSKeepLocalRequest)initWithModelObject:(id)a3 enableState:(int64_t)a4;
- (int64_t)enableState;
- (void)performWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NMSKeepLocalRequest

- (NMSKeepLocalRequest)initWithModelObject:(id)a3 enableState:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSKeepLocalRequest;
  v8 = [(NMSKeepLocalRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelObject, a3);
    v9->_enableState = a4;
  }

  return v9;
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Sub-classes should implement this method." userInfo:0];
  objc_exception_throw(v7);
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (void).cxx_destruct
{
}

@end