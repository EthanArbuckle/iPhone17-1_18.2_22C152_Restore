@interface TCMPSInstanceNormalizationDescriptor
- (NSString)label;
- (TCMPSInstanceNormalizationDescriptor)init;
- (unint64_t)channels;
- (unint64_t)styles;
- (void)setChannels:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStyles:(unint64_t)a3;
@end

@implementation TCMPSInstanceNormalizationDescriptor

- (TCMPSInstanceNormalizationDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCMPSInstanceNormalizationDescriptor;
  v2 = [(TCMPSInstanceNormalizationDescriptor *)&v6 init];
  if (v2)
  {
    v3 = (NSString *)objc_alloc_init(NSString);
    label = v2->_label;
    v2->_label = v3;
  }
  return v2;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (void)setChannels:(unint64_t)a3
{
  self->_channels = a3;
}

- (unint64_t)styles
{
  return self->_styles;
}

- (void)setStyles:(unint64_t)a3
{
  self->_styles = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end