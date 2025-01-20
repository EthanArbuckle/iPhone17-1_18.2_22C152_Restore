@interface _PXOverriddenAppleMusicStatusProvider
- (NSError)error;
- (PXObservable)observable;
- (_PXOverriddenAppleMusicStatusProvider)init;
- (_PXOverriddenAppleMusicStatusProvider)initWithAppleMusicStatusProvider:(id)a3 overrides:(id)a4;
- (int64_t)statusForCapability:(int64_t)a3;
- (void)requestStatusForCapability:(int64_t)a3 handler:(id)a4;
- (void)startGatheringCapabilityStatuses;
@end

@implementation _PXOverriddenAppleMusicStatusProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subProvider, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (int64_t)statusForCapability:(int64_t)a3
{
  overrides = self->_overrides;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSDictionary *)overrides objectForKeyedSubscript:v6];

  if (v7) {
    uint64_t v8 = [v7 integerValue];
  }
  else {
    uint64_t v8 = [(PXAppleMusicStatusProvider *)self->_subProvider statusForCapability:a3];
  }
  int64_t v9 = v8;

  return v9;
}

- (void)requestStatusForCapability:(int64_t)a3 handler:(id)a4
{
  int64_t v9 = (void (**)(id, uint64_t, void))a4;
  overrides = self->_overrides;
  v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [(NSDictionary *)overrides objectForKeyedSubscript:v7];

  if (v8) {
    v9[2](v9, [v8 integerValue], 0);
  }
  else {
    [(PXAppleMusicStatusProvider *)self->_subProvider requestStatusForCapability:a3 handler:v9];
  }
}

- (void)startGatheringCapabilityStatuses
{
}

- (PXObservable)observable
{
  return (PXObservable *)[(PXAppleMusicStatusProvider *)self->_subProvider observable];
}

- (NSError)error
{
  return (NSError *)[(PXAppleMusicStatusProvider *)self->_subProvider error];
}

- (_PXOverriddenAppleMusicStatusProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicStatusProvider.m", 46, @"%s is not available as initializer", "-[_PXOverriddenAppleMusicStatusProvider init]");

  abort();
}

- (_PXOverriddenAppleMusicStatusProvider)initWithAppleMusicStatusProvider:(id)a3 overrides:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXOverriddenAppleMusicStatusProvider;
  int64_t v9 = [(_PXOverriddenAppleMusicStatusProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subProvider, a3);
    uint64_t v11 = [v8 copy];
    overrides = v10->_overrides;
    v10->_overrides = (NSDictionary *)v11;
  }
  return v10;
}

@end