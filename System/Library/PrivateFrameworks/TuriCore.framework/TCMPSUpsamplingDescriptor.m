@interface TCMPSUpsamplingDescriptor
- (unint64_t)scale;
- (void)setScale:(unint64_t)a3;
@end

@implementation TCMPSUpsamplingDescriptor

- (unint64_t)scale
{
  return self->_scale;
}

- (void)setScale:(unint64_t)a3
{
  self->_scale = a3;
}

@end