@interface MTLGPUDebugDynamicLibrary
- (MTLGPUDebugDynamicLibrary)initWithDynamicLibrary:(id)a3 device:(id)a4;
- (MTLGPUDebugImageData)imageData;
- (void)dealloc;
- (void)prepareForUsage;
@end

@implementation MTLGPUDebugDynamicLibrary

- (MTLGPUDebugDynamicLibrary)initWithDynamicLibrary:(id)a3 device:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugDynamicLibrary;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (void)prepareForUsage
{
  if (!self->_imageData && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x40) != 0)
  {
    v3 = [[MTLGPUDebugImageData alloc] initWithDynamicLibrary:self];
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_imageData, (unint64_t *)&v4, (unint64_t)v3);
    if (v4) {

    }
    imageData = self->_imageData;
    uint64_t v6 = [(MTLDebugInstrumentationData *)[(MTLToolsDynamicLibrary *)self debugInstrumentationData] globalConstantsData];
    [(MTLGPUDebugImageData *)imageData setConstantData:v6];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugDynamicLibrary;
  [(MTLToolsDynamicLibrary *)&v3 dealloc];
}

- (MTLGPUDebugImageData)imageData
{
  return self->_imageData;
}

@end