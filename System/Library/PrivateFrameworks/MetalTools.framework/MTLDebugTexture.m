@interface MTLDebugTexture
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isLinearTexture;
- (BOOL)purgeableStateValidForRendering;
- (BOOL)requireUsage:(unint64_t)a3;
- (MTLDebugResource)common;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 offset:(unint64_t)a6 bytesPerRow:(unint64_t)a7;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 offset:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 plane:(unint64_t)a5;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6 textureType:(unint64_t)a7 levels:(_NSRange)a8 slices:(_NSRange)a9;
- (MTLDebugTexture)initWithBaseTexture:(id)a3 heap:(id)a4 device:(id)a5;
- (id).cxx_construct;
- (id)description;
- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8;
- (unint64_t)bytesPerImage;
- (unint64_t)bytesPerRow;
- (unint64_t)offset;
- (unint64_t)plane;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (void)addUsedRenderTarget:(unint64_t)a3 slices:(_NSRange)a4;
- (void)dealloc;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6;
- (void)lockPurgeableState;
- (void)makeAliasable;
- (void)removeUsedRenderTarget:(unint64_t)a3 slices:(_NSRange)a4;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6;
- (void)unlockPurgeableState;
@end

@implementation MTLDebugTexture

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 offset:(unint64_t)a6 bytesPerRow:(unint64_t)a7
{
  v18.receiver = self;
  v18.super_class = (Class)MTLDebugTexture;
  v11 = [(MTLToolsTexture *)&v18 initWithBaseObject:a3 parent:a4 buffer:a5];
  if (v11)
  {
    *((void *)v11 + 33) = [[MTLDebugResource alloc] initWithBaseObject:a3];
    uint64_t v12 = [a3 cpuCacheMode];
    *((void *)v11 + 5) = v12 | (16 * [a3 storageMode]);
    *((void *)v11 + 17) = 0;
    *((void *)v11 + 34) = a6;
    *((void *)v11 + 35) = a7;
    *((void *)v11 + 36) = 0;
    atomic_store(0, (unsigned int *)v11 + 36);
    v11[148] = 0;
    [a4 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v11 + 15) = v17;
    *(_OWORD *)(v11 + 88) = v15;
    *(_OWORD *)(v11 + 104) = v16;
    *(_OWORD *)(v11 + 72) = v14;
    v11[256] = 0;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((void *)v11 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v11;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 offset:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  v20.receiver = self;
  v20.super_class = (Class)MTLDebugTexture;
  v13 = [(MTLToolsTexture *)&v20 initWithBaseObject:a3 parent:a4 buffer:a5];
  if (v13)
  {
    *((void *)v13 + 33) = [[MTLDebugResource alloc] initWithBaseObject:a3];
    uint64_t v14 = [a3 cpuCacheMode];
    *((void *)v13 + 5) = v14 | (16 * [a3 storageMode]);
    *((void *)v13 + 17) = 0;
    *((void *)v13 + 34) = a6;
    *((void *)v13 + 35) = a7;
    *((void *)v13 + 36) = a8;
    atomic_store(0, (unsigned int *)v13 + 36);
    v13[148] = 0;
    [a4 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v13 + 15) = v19;
    *(_OWORD *)(v13 + 88) = v17;
    *(_OWORD *)(v13 + 104) = v18;
    *(_OWORD *)(v13 + 72) = v16;
    v13[256] = 1;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((void *)v13 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v13;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4
{
  return [(MTLDebugTexture *)self initWithBaseTexture:a3 device:a4 plane:0];
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 plane:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)MTLDebugTexture;
  v8 = -[MTLToolsResource initWithBaseObject:parent:](&v15, sel_initWithBaseObject_parent_);
  if (v8)
  {
    *((void *)v8 + 33) = [[MTLDebugResource alloc] initWithBaseObject:a3];
    uint64_t v9 = [a3 cpuCacheMode];
    *((void *)v8 + 5) = v9 | (16 * [a3 storageMode]);
    *((void *)v8 + 17) = 0;
    *((void *)v8 + 37) = a5;
    atomic_store(0, (unsigned int *)v8 + 36);
    v8[148] = 0;
    [a4 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v8 + 15) = v14;
    *(_OWORD *)(v8 + 88) = v12;
    *(_OWORD *)(v8 + 104) = v13;
    *(_OWORD *)(v8 + 72) = v11;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((void *)v8 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v8;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 heap:(id)a4 device:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)MTLDebugTexture;
  v7 = [(MTLToolsResource *)&v14 initWithBaseObject:a3 parent:a4 heap:a4];
  if (v7)
  {
    *((void *)v7 + 33) = [[MTLDebugResource alloc] initWithBaseObject:a3];
    uint64_t v8 = [a3 cpuCacheMode];
    *((void *)v7 + 5) = v8 | (16 * [a3 storageMode]);
    *((void *)v7 + 17) = 0;
    *((void *)v7 + 37) = 0;
    atomic_store(0, (unsigned int *)v7 + 36);
    v7[148] = 0;
    [a5 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v7 + 15) = v13;
    *(_OWORD *)(v7 + 88) = v11;
    *(_OWORD *)(v7 + 104) = v12;
    *(_OWORD *)(v7 + 72) = v10;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((void *)v7 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v7;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)MTLDebugTexture;
  v7 = [(MTLToolsTexture *)&v14 initWithBaseObject:a3 parent:a4 parentTexture:a5];
  if (v7)
  {
    *((void *)v7 + 33) = [[MTLDebugResource alloc] initWithBaseObject:a3];
    atomic_store(0, (unsigned int *)v7 + 36);
    v7[148] = 0;
    uint64_t v8 = [a3 cpuCacheMode];
    *((void *)v7 + 5) = v8 | (16 * [a3 storageMode]);
    *((void *)v7 + 17) = 0;
    [a4 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v7 + 15) = v13;
    *(_OWORD *)(v7 + 88) = v11;
    *(_OWORD *)(v7 + 104) = v12;
    *(_OWORD *)(v7 + 72) = v10;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((void *)v7 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v7;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6
{
  uint64_t v8 = -[MTLDebugTexture initWithBaseTexture:device:texture:](self, "initWithBaseTexture:device:texture:", a3, a4, a5, a6);
  if (v8)
  {
    [a4 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v8 + 15) = v13;
    *(_OWORD *)((char *)v8 + 88) = v11;
    *(_OWORD *)((char *)v8 + 104) = v12;
    *(_OWORD *)((char *)v8 + 72) = v10;
  }
  return v8;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6 textureType:(unint64_t)a7 levels:(_NSRange)a8 slices:(_NSRange)a9
{
  long long v11 = -[MTLDebugTexture initWithBaseTexture:device:texture:](self, "initWithBaseTexture:device:texture:", a3, a4, a5, a6, a7);
  if (v11)
  {
    [a4 originalObject];
    [a3 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *((void *)v11 + 15) = v16;
    *(_OWORD *)((char *)v11 + 88) = v14;
    *(_OWORD *)((char *)v11 + 104) = v15;
    *(_OWORD *)((char *)v11 + 72) = v13;
  }
  return v11;
}

- (void)dealloc
{
  if (*((void *)self + 17)
    && [(MTLToolsTexture *)self usage] != *((void *)self + 17)
    && +[MTLDebugDevice complainAboutSloppyTextureUsage])
  {
    [(MTLToolsTexture *)self usage];
    MTLReportFailure();
  }
  std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear((void *)self + 27);

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugTexture;
  [(MTLToolsTexture *)&v3 dealloc];
}

- (BOOL)doesAliasResource:(id)a3
{
  return [*((id *)self + 33) doesAliasResource:a3];
}

- (void)makeAliasable
{
  if ([(MTLToolsTexture *)self isSparse]) {
    MTLReportFailure();
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode") == 3) {
    MTLReportFailure();
  }
  if (!objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    MTLReportFailure();
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentTexture")) {
    MTLReportFailure();
  }
  if (!objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "buffer"))
  {
    id v3 = [(MTLToolsObject *)self baseObject];
    [v3 makeAliasable];
  }
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  return [*((id *)self + 33) doesAliasAllResources:a3 count:a4];
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  return [*((id *)self + 33) doesAliasAnyResources:a3 count:a4];
}

- (BOOL)requireUsage:(unint64_t)a3
{
  *((void *)self + 17) |= a3;
  return (a3 & ~[(MTLToolsTexture *)self usage]) == 0;
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  MTLOrigin var0 = (MTLOrigin)a3->var0;
  MTLSize var1 = (MTLSize)a3->var1;
  _validateReplaceRegion(self, &var0, &var1, a5, a4, a6, a7, 1, a8, v17);
  [(MTLToolsResource *)self validateCPUWriteable];
  id v15 = [(MTLToolsObject *)self baseObject];
  long long v16 = *(_OWORD *)&a3->var0.var2;
  v18[0] = *(_OWORD *)&a3->var0.var0;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a3->var1.var1;
  [v15 replaceRegion:v18 mipmapLevel:a4 slice:a5 withBytes:a6 bytesPerRow:a7 bytesPerImage:a8];
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  MTLOrigin var0 = (MTLOrigin)a3->var0;
  MTLSize var1 = (MTLSize)a3->var1;
  _validateReplaceRegion(self, &var0, &var1, 0, a4, a5, a6, 0, 0, v13);
  [(MTLToolsResource *)self validateCPUWriteable];
  id v11 = [(MTLToolsObject *)self baseObject];
  long long v12 = *(_OWORD *)&a3->var0.var2;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  [v11 replaceRegion:v14 mipmapLevel:a4 withBytes:a5 bytesPerRow:a6];
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  MTLOrigin var0 = (MTLOrigin)a6->var0;
  MTLSize var1 = (MTLSize)a6->var1;
  _validateGetBytes(self, &var0, &var1, a8, a7, a3, a4, 1, a5, v17);
  [(MTLToolsResource *)self validateCPUReadable];
  id v15 = [(MTLToolsObject *)self baseObject];
  long long v16 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  [v15 getBytes:a3 bytesPerRow:a4 bytesPerImage:a5 fromRegion:v18 mipmapLevel:a7 slice:a8];
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  MTLOrigin var0 = (MTLOrigin)a5->var0;
  MTLSize var1 = (MTLSize)a5->var1;
  _validateGetBytes(self, &var0, &var1, 0, a6, a3, a4, 0, 0, v13);
  [(MTLToolsResource *)self validateCPUReadable];
  id v11 = [(MTLToolsObject *)self baseObject];
  long long v12 = *(_OWORD *)&a5->var0.var2;
  v14[0] = *(_OWORD *)&a5->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a5->var1.var1;
  [v11 getBytes:a3 bytesPerRow:a4 fromRegion:v14 mipmapLevel:a6];
}

- (id)description
{
  return [(MTLToolsTexture *)self formattedDescription:0];
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)[(MTLToolsTexture *)self textureType]);
  id v7 = [(MTLToolsObject *)self baseObject];
  if (a4) {
    uint64_t v8 = [v7 newTextureViewWithPixelFormat:a3 resourceIndex:a4];
  }
  else {
    uint64_t v8 = [v7 newTextureViewWithPixelFormat:a3];
  }
  uint64_t v9 = (void *)v8;
  if (!v8) {
    return 0;
  }
  long long v10 = [[MTLDebugTexture alloc] initWithBaseTexture:v8 device:[(MTLToolsObject *)self device] texture:self pixelFormat:a3];

  return v10;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v9 = a5.length;
  NSUInteger v10 = a5.location;
  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)a4);
  id v14 = [(MTLToolsObject *)self baseObject];
  if (a7) {
    uint64_t v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, v10, v9, location, length, a7);
  }
  else {
    uint64_t v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, v10, v9, location, length);
  }
  long long v16 = (void *)v15;
  if (!v15) {
    return 0;
  }
  unint64_t v17 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:", v15, [(MTLToolsObject *)self device], self, a3, a4, v10, v9, location, length);

  return v17;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  return [(MTLDebugTexture *)self newTextureViewWithPixelFormat:a3 resourceIndex:0];
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  return -[MTLDebugTexture newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, 0);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v10 = a5.length;
  NSUInteger v11 = a5.location;
  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)a4);
  id v15 = [(MTLToolsObject *)self baseObject];
  if (a8) {
    uint64_t v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7, a8);
  }
  else {
    uint64_t v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7);
  }
  unint64_t v17 = (void *)v16;
  if (!v16) {
    return 0;
  }
  long long v18 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:", v16, [(MTLToolsObject *)self device], self, a3, a4, v11, v10, location, length);

  return v18;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  return -[MTLDebugTexture newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, 0);
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)a4);
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCompressedTextureViewWithPixelFormat:textureType:level:slice:", a3, a4, a5, a6);
  if (result)
  {
    id v12 = result;
    unint64_t v13 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:", result, [(MTLToolsObject *)self device], self, a3, a4, a5, 1, a6, 1);

    return v13;
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    _MTLMessageContextPush_();
  }
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)self + 36)) {
        _MTLMessageContextPush_();
      }
    }
    *((unsigned char *)self + 148) = 1;
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (void)lockPurgeableState
{
}

- (void)unlockPurgeableState
{
}

- (BOOL)purgeableStateValidForRendering
{
  return !*((unsigned char *)self + 148) || [(MTLDebugTexture *)self setPurgeableState:1] == 2;
}

- (void)addUsedRenderTarget:(unint64_t)a3 slices:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = self;
  uint64_t v8 = [(MTLToolsTexture *)self parentTexture];
  if (v8)
  {
    do
    {
      NSUInteger v9 = (char *)v8;
      a3 += [(MTLToolsTexture *)v7 parentRelativeLevel];
      location += [(MTLToolsTexture *)v7 parentRelativeSlice];
      uint64_t v8 = (MTLTexture *)[v9 parentTexture];
      id v7 = (MTLDebugTexture *)v9;
    }
    while (v8);
  }
  else
  {
    NSUInteger v9 = (char *)v7;
  }
  v12[0] = a3;
  v12[1] = location;
  v12[2] = length;
  std::mutex::lock((std::mutex *)(v9 + 152));
  NSUInteger v10 = std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::find<SubView>((void *)v9 + 27, v12);
  if (v10)
  {
    ++v10[5];
  }
  else
  {
    int v11 = 1;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__emplace_unique_key_args<SubView,SubView const&,int>((uint64_t)(v9 + 216), v12, (uint64_t)v12, &v11);
  }
  std::mutex::unlock((std::mutex *)(v9 + 152));
}

- (void)removeUsedRenderTarget:(unint64_t)a3 slices:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = self;
  uint64_t v8 = [(MTLToolsTexture *)self parentTexture];
  if (v8)
  {
    do
    {
      NSUInteger v9 = (char *)v8;
      a3 += [(MTLToolsTexture *)v7 parentRelativeLevel];
      location += [(MTLToolsTexture *)v7 parentRelativeSlice];
      uint64_t v8 = (MTLTexture *)[v9 parentTexture];
      id v7 = (MTLDebugTexture *)v9;
    }
    while (v8);
  }
  else
  {
    NSUInteger v9 = (char *)v7;
  }
  v12[0] = a3;
  v12[1] = location;
  v12[2] = length;
  std::mutex::lock((std::mutex *)(v9 + 152));
  NSUInteger v10 = std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::find<SubView>((void *)v9 + 27, v12);
  if (v10)
  {
    uint64_t v11 = v10[5] - 1;
    v10[5] = v11;
    if (!v11) {
      std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::erase((void *)v9 + 27, v10);
    }
  }
  std::mutex::unlock((std::mutex *)(v9 + 152));
}

- (MTLDebugResource)common
{
  return (MTLDebugResource *)*((void *)self + 33);
}

- (unint64_t)offset
{
  return *((void *)self + 34);
}

- (unint64_t)bytesPerRow
{
  return *((void *)self + 35);
}

- (unint64_t)bytesPerImage
{
  return *((void *)self + 36);
}

- (unint64_t)plane
{
  return *((void *)self + 37);
}

- (BOOL)isLinearTexture
{
  return *((unsigned char *)self + 256);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)self + 216);

  std::mutex::~mutex((std::mutex *)((char *)self + 152));
}

- (id).cxx_construct
{
  *((void *)self + 19) = 850045863;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((void *)self + 26) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 62) = 1065353216;
  return self;
}

@end