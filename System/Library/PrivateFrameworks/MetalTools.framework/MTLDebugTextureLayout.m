@interface MTLDebugTextureLayout
- (MTLDebugDevice)debugDevice;
- (MTLDebugTextureLayout)initWithBaseTextureLayout:(id)a3 device:(id)a4 descriptor:(id)a5;
- (MTLTextureDescriptor)descriptor;
- (void)dealloc;
@end

@implementation MTLDebugTextureLayout

- (MTLDebugTextureLayout)initWithBaseTextureLayout:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugTextureLayout;
  v7 = -[MTLToolsObject initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_debugDevice = (MTLDebugDevice *)a4;
    v7->_descriptor = (MTLTextureDescriptor *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugTextureLayout;
  [(MTLToolsObject *)&v3 dealloc];
}

- (MTLDebugDevice)debugDevice
{
  return self->_debugDevice;
}

- (MTLTextureDescriptor)descriptor
{
  return self->_descriptor;
}

@end