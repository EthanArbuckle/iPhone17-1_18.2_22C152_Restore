@interface _SBHardwareButtonPortalObservationToken
- (_SBHardwareButtonPortalObservationToken)initWithObserverBlock:(id)a3 invalidationBlock:(id)a4;
- (void)didUpdateWithView:(id)a3;
- (void)invalidate;
@end

@implementation _SBHardwareButtonPortalObservationToken

- (_SBHardwareButtonPortalObservationToken)initWithObserverBlock:(id)a3 invalidationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBHardwareButtonPortalObservationToken;
  v8 = [(_SBHardwareButtonPortalObservationToken *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id observerBlock = v8->_observerBlock;
    v8->_id observerBlock = (id)v9;

    uint64_t v11 = [v7 copy];
    id invalidationBlock = v8->_invalidationBlock;
    v8->_id invalidationBlock = (id)v11;
  }
  return v8;
}

- (void)didUpdateWithView:(id)a3
{
  id observerBlock = (void (**)(id, id))self->_observerBlock;
  if (observerBlock) {
    observerBlock[2](observerBlock, a3);
  }
}

- (void)invalidate
{
  id invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    id v6 = (void (**)(id, _SBHardwareButtonPortalObservationToken *))[invalidationBlock copy];
    id v4 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;

    id observerBlock = self->_observerBlock;
    self->_id observerBlock = 0;

    v6[2](v6, self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerBlock, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end