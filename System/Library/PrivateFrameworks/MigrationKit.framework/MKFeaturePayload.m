@interface MKFeaturePayload
- (BOOL)enabled;
- (MKFeaturePayload)init;
- (NSDecimalNumber)importElapsedTime;
- (NSString)state;
- (unint64_t)count;
- (unint64_t)size;
- (unint64_t)totalElapsedTime;
- (void)setCount:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImportElapsedTime:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)setTotalElapsedTime:(unint64_t)a3;
@end

@implementation MKFeaturePayload

- (MKFeaturePayload)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKFeaturePayload;
  v2 = [(MKFeaturePayload *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MKFeaturePayload *)v2 setState:@"?"];
    v4 = [MEMORY[0x263F087B0] zero];
    [(MKFeaturePayload *)v3 setImportElapsedTime:v4];
  }
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)totalElapsedTime
{
  return self->_totalElapsedTime;
}

- (void)setTotalElapsedTime:(unint64_t)a3
{
  self->_totalElapsedTime = a3;
}

- (NSDecimalNumber)importElapsedTime
{
  return self->_importElapsedTime;
}

- (void)setImportElapsedTime:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_importElapsedTime, 0);
}

@end