@interface TCMPSImageAllocator
+ (BOOL)supportsSecureCoding;
- (TCMPSImageAllocator)initWithCoder:(id)a3;
- (TCMPSImageAllocator)initWithFormat:(unint64_t)a3;
- (id)imageForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TCMPSImageAllocator

- (id)imageForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_format) {
    objc_msgSend(v9, "setChannelFormat:");
  }
  id v11 = objc_alloc(MEMORY[0x263F13220]);
  v12 = [v8 device];
  v13 = (void *)[v11 initWithDevice:v12 imageDescriptor:v9];

  return v13;
}

- (TCMPSImageAllocator)initWithFormat:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TCMPSImageAllocator;
  v4 = [(TCMPSImageAllocator *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_format = a3;
    v6 = v4;
  }

  return v5;
}

- (TCMPSImageAllocator)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TCMPSImageAllocator;
  v5 = [(TCMPSImageAllocator *)&v8 init];
  if (v5)
  {
    v5->_format = [v4 decodeIntegerForKey:@"pixelFormat"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end