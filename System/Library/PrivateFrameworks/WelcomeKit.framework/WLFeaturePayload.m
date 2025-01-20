@interface WLFeaturePayload
- (BOOL)enabled;
- (NSString)state;
- (WLFeaturePayload)init;
- (unint64_t)count;
- (unint64_t)elapsedTime;
- (unint64_t)size;
- (void)setCount:(unint64_t)a3;
- (void)setElapsedTime:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSize:(unint64_t)a3;
- (void)setState:(id)a3;
@end

@implementation WLFeaturePayload

- (WLFeaturePayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLFeaturePayload;
  v2 = [(WLFeaturePayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(WLFeaturePayload *)v2 setState:@"?"];
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

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
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
}

@end