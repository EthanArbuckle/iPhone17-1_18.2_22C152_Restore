@interface MRDestinationResolverHelper
- (id)callback;
- (int64_t)level;
- (void)destinationResolver:(id)a3 didFailWithError:(id)a4;
- (void)destinationResolver:(id)a3 endpointDidChange:(id)a4;
- (void)destinationResolver:(id)a3 originDidChange:(id)a4;
- (void)destinationResolver:(id)a3 playerPathDidChange:(id)a4;
- (void)destinationResolverDestinationDidInvalidate:(id)a3;
- (void)setCallback:(id)a3;
- (void)setLevel:(int64_t)a3;
@end

@implementation MRDestinationResolverHelper

- (void)destinationResolver:(id)a3 originDidChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  callback = (void (**)(id, void *, void))self->_callback;
  if (callback && !self->_level)
  {
    v8 = [v9 destination];
    callback[2](callback, v8, 0);
  }
}

- (void)destinationResolver:(id)a3 endpointDidChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  callback = (void (**)(id, void *, void))self->_callback;
  if (callback && self->_level == 1)
  {
    v8 = [v9 destination];
    callback[2](callback, v8, 0);
  }
}

- (void)destinationResolverDestinationDidInvalidate:(id)a3
{
  callback = (void (**)(id, id, void))self->_callback;
  if (callback)
  {
    id v4 = [a3 destination];
    callback[2](callback, v4, 0);
  }
}

- (void)destinationResolver:(id)a3 playerPathDidChange:(id)a4
{
  id v5 = a3;
  callback = (void (**)(id, void *, void))self->_callback;
  if (callback && (self->_level | 2) == 2)
  {
    id v8 = v5;
    v7 = [v5 destination];
    callback[2](callback, v7, 0);

    id v5 = v8;
  }
}

- (void)destinationResolver:(id)a3 didFailWithError:(id)a4
{
  callback = (void (**)(id, id, id))self->_callback;
  if (callback)
  {
    id v6 = a4;
    id v7 = [a3 destination];
    callback[2](callback, v7, v6);
  }
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end