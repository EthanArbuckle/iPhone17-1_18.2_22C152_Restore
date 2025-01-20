@interface SoundSubscriber
- (id)callback;
- (id)client;
- (unsigned)soundType;
- (void)setCallback:(id)a3;
- (void)setClient:(id)a3;
- (void)setSoundType:(unsigned int)a3;
@end

@implementation SoundSubscriber

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (unsigned)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(unsigned int)a3
{
  self->_soundType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong(&self->_client, 0);
}

@end