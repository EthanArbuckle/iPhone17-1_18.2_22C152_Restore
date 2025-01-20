@interface PKMockPayLaterCardMagnitudesProvider
- (PKPayLaterCardMagnitudes)magnitudes;
- (id)updateHandler;
- (void)setMagnitudes:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation PKMockPayLaterCardMagnitudesProvider

- (void)setMagnitudes:(id)a3
{
  v4 = (PKPayLaterCardMagnitudes *)[a3 copy];
  magnitudes = self->_magnitudes;
  self->_magnitudes = v4;

  id updateHandler = self->_updateHandler;
  if (updateHandler)
  {
    v7 = (void (*)(void))*((void *)updateHandler + 2);
    v7();
  }
}

- (void)setUpdateHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;

  id v6 = self->_updateHandler;
  if (v6)
  {
    v7 = (void (*)(void))*((void *)v6 + 2);
    v7();
  }
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (PKPayLaterCardMagnitudes)magnitudes
{
  return self->_magnitudes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnitudes, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end