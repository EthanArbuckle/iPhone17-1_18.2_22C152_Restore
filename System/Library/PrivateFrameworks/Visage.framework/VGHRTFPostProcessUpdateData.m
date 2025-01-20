@interface VGHRTFPostProcessUpdateData
- (NSData)result;
- (id)initEmpty;
- (unint64_t)state;
- (void)setResult:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation VGHRTFPostProcessUpdateData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFPostProcessUpdateData;
  v2 = [(VGHRTFPostProcessUpdateData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSData)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end