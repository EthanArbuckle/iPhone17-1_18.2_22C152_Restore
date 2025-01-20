@interface VFXMTLComputePipeline
- (VFXMTLComputePipeline)init;
- (id)description;
- (void)dealloc;
@end

@implementation VFXMTLComputePipeline

- (VFXMTLComputePipeline)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLComputePipeline;
  return [(VFXMTLComputePipeline *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLComputePipeline;
  [(VFXMTLComputePipeline *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p>", v7, v5, self);
}

@end