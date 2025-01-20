@interface MTLToolsTexture
- ($14D77461FF5D83CAEC4252578BA76F85)swizzle;
- (BOOL)allowGPUOptimizedContents;
- (BOOL)canGenerateMipmapLevels;
- (BOOL)isCompressed;
- (BOOL)isDrawable;
- (BOOL)isFramebufferOnly;
- (BOOL)isShareable;
- (BOOL)isSparse;
- (MTLBuffer)buffer;
- (MTLResource)rootResource;
- (MTLResourceID)gpuResourceID;
- (MTLTexture)parentTexture;
- (MTLToolsTexture)initWithBaseObject:(id)a3 parent:(id)a4 buffer:(id)a5;
- (MTLToolsTexture)initWithBaseObject:(id)a3 parent:(id)a4 parentTexture:(id)a5;
- (__IOSurface)iosurface;
- (id)formattedDescription:(unint64_t)a3;
- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newSharedTextureHandle;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8;
- (id)realRootResource;
- (int64_t)compressionFeedback;
- (int64_t)compressionType;
- (unint64_t)arrayLength;
- (unint64_t)bufferBytesPerRow;
- (unint64_t)bufferOffset;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)compressionFootprint;
- (unint64_t)depth;
- (unint64_t)firstMipmapInTail;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)height;
- (unint64_t)iosurfacePlane;
- (unint64_t)mipmapLevelCount;
- (unint64_t)numFaces;
- (unint64_t)parentRelativeLevel;
- (unint64_t)parentRelativeSlice;
- (unint64_t)pixelFormat;
- (unint64_t)resourceIndex;
- (unint64_t)rotation;
- (unint64_t)sampleCount;
- (unint64_t)sparseSurfaceDefaultValue;
- (unint64_t)tailSize;
- (unint64_t)tailSizeInBytes;
- (unint64_t)textureType;
- (unint64_t)uniqueIdentifier;
- (unint64_t)usage;
- (unint64_t)width;
- (unsigned)swizzleKey;
- (void)copyFromPixels:(const void *)a3 rowBytes:(unint64_t)a4 imageBytes:(unint64_t)a5 toSlice:(unint64_t)a6 mipmapLevel:(unint64_t)a7 origin:(id *)a8 size:(id *)a9;
- (void)copyFromSlice:(unint64_t)a3 mipmapLevel:(unint64_t)a4 origin:(id *)a5 size:(id *)a6 toPixels:(void *)a7 rowBytes:(unint64_t)a8 imageBytes:(unint64_t)a9;
- (void)dealloc;
- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6;
@end

@implementation MTLToolsTexture

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsTexture;
  [(MTLToolsResource *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
  v10[0] = v5;
  v10[1] = @"label =";
  if ([(MTLToolsResource *)self label]) {
    v8 = [(MTLToolsResource *)self label];
  }
  else {
    v8 = @"<none>";
  }
  v10[2] = v8;
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", @" "];
}

- (MTLToolsTexture)initWithBaseObject:(id)a3 parent:(id)a4 parentTexture:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLToolsTexture;
  v6 = [(MTLToolsResource *)&v8 initWithBaseObject:a3 parent:a5];
  if (v6)
  {
    v6->_parentTexture = (MTLTexture *)a5;
    v6->_buffer = (MTLBuffer *)(id)[a5 buffer];
  }
  return v6;
}

- (MTLToolsTexture)initWithBaseObject:(id)a3 parent:(id)a4 buffer:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLToolsTexture;
  v6 = [(MTLToolsResource *)&v8 initWithBaseObject:a3 parent:a5];
  if (v6)
  {
    v6->_buffer = (MTLBuffer *)a5;
    v6->_parentTexture = 0;
  }
  return v6;
}

- (id)realRootResource
{
  if ([(MTLToolsTexture *)self buffer])
  {
    return [(MTLToolsTexture *)self buffer];
  }
  else if ([(MTLToolsTexture *)self parentTexture])
  {
    v4 = [(MTLToolsTexture *)self parentTexture];
    return (id)[(MTLTexture *)v4 realRootResource];
  }
  else
  {
    return self;
  }
}

- (MTLResource)rootResource
{
  parentTexture = self->_parentTexture;
  if (!parentTexture) {
    return self->_buffer;
  }
  return parentTexture;
}

- (unint64_t)gpuHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuHandle];
}

- (MTLResourceID)gpuResourceID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLResourceID)[v2 gpuResourceID];
}

- (unint64_t)parentRelativeLevel
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 parentRelativeLevel];
}

- (unint64_t)parentRelativeSlice
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 parentRelativeSlice];
}

- (unint64_t)bufferOffset
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 bufferOffset];
}

- (unint64_t)bufferBytesPerRow
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 bufferBytesPerRow];
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return ($14D77461FF5D83CAEC4252578BA76F85)[v2 swizzle];
}

- (unsigned)swizzleKey
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 swizzleKey];
}

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (BOOL)isCompressed
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isCompressed];
}

- (int64_t)compressionFeedback
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 compressionFeedback];
}

- (int64_t)compressionType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 compressionType];
}

- (unint64_t)compressionFootprint
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 compressionFootprint];
}

- (void)copyFromSlice:(unint64_t)a3 mipmapLevel:(unint64_t)a4 origin:(id *)a5 size:(id *)a6 toPixels:(void *)a7 rowBytes:(unint64_t)a8 imageBytes:(unint64_t)a9
{
  *(void *)v11 = a5->var2;
  long long v9 = *(_OWORD *)&a5->var0;
  *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v11[8] = *a6;
  v10[0] = v9;
  v10[1] = *(_OWORD *)v11;
  v10[2] = *(_OWORD *)&v11[16];
  v10[3] = v9;
  [(MTLToolsTexture *)self getBytes:a7 bytesPerRow:a8 bytesPerImage:a9 fromRegion:v10 mipmapLevel:a4 slice:a3];
}

- (void)copyFromPixels:(const void *)a3 rowBytes:(unint64_t)a4 imageBytes:(unint64_t)a5 toSlice:(unint64_t)a6 mipmapLevel:(unint64_t)a7 origin:(id *)a8 size:(id *)a9
{
  *(void *)v11 = a8->var2;
  long long v9 = *(_OWORD *)&a8->var0;
  *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v11[8] = *a9;
  v10[0] = v9;
  v10[1] = *(_OWORD *)v11;
  v10[2] = *(_OWORD *)&v11[16];
  v10[3] = v9;
  [(MTLToolsTexture *)self replaceRegion:v10 mipmapLevel:a7 slice:a6 withBytes:a3 bytesPerRow:a4 bytesPerImage:a5];
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  long long v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLToolsTexture *)self replaceRegion:v7 mipmapLevel:a4 slice:0 withBytes:a5 bytesPerRow:a6 bytesPerImage:0];
}

- (unint64_t)textureType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 textureType];
}

- (unint64_t)pixelFormat
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 pixelFormat];
}

- (unint64_t)usage
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 usage];
}

- (unint64_t)width
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 width];
}

- (unint64_t)height
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 height];
}

- (unint64_t)depth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 depth];
}

- (unint64_t)mipmapLevelCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 mipmapLevelCount];
}

- (unint64_t)sampleCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 sampleCount];
}

- (unint64_t)arrayLength
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 arrayLength];
}

- (BOOL)isShareable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isShareable];
}

- (BOOL)isSparse
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isSparse];
}

- (BOOL)isFramebufferOnly
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isFramebufferOnly];
}

- (unint64_t)sparseSurfaceDefaultValue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 sparseSurfaceDefaultValue];
}

- (unint64_t)firstMipmapInTail
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 firstMipmapInTail];
}

- (unint64_t)tailSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 tailSizeInBytes];
}

- (unint64_t)tailSizeInBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 tailSizeInBytes];
}

- (BOOL)allowGPUOptimizedContents
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 allowGPUOptimizedContents];
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  id v14 = [(MTLToolsObject *)self baseObject];
  long long v15 = *(_OWORD *)&a6->var0.var2;
  v16[0] = *(_OWORD *)&a6->var0.var0;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a6->var1.var1;
  [v14 getBytes:a3 bytesPerRow:a4 bytesPerImage:a5 fromRegion:v16 mipmapLevel:a7 slice:a8];
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14 = [(MTLToolsObject *)self baseObject];
  long long v15 = *(_OWORD *)&a3->var0.var2;
  v16[0] = *(_OWORD *)&a3->var0.var0;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a3->var1.var1;
  [v14 replaceRegion:v16 mipmapLevel:a4 slice:a5 withBytes:a6 bytesPerRow:a7 bytesPerImage:a8];
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id v7 = [(MTLToolsObject *)self baseObject];
  if (a4) {
    uint64_t v8 = [v7 newTextureViewWithPixelFormat:a3 resourceIndex:a4];
  }
  else {
    uint64_t v8 = [v7 newTextureViewWithPixelFormat:a3];
  }
  long long v9 = (void *)v8;
  if (!v8) {
    return 0;
  }
  v10 = [[MTLToolsTexture alloc] initWithBaseObject:v8 parent:self->super.super._device parentTexture:self];

  return v10;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v9 = a5.length;
  NSUInteger v10 = a5.location;
  id v14 = [(MTLToolsObject *)self baseObject];
  if (a7) {
    uint64_t v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, v10, v9, location, length, a7);
  }
  else {
    uint64_t v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, v10, v9, location, length);
  }
  v16 = (void *)v15;
  if (!v15) {
    return 0;
  }
  v17 = [[MTLToolsTexture alloc] initWithBaseObject:v15 parent:self->super.super._device parentTexture:self];

  return v17;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  return [(MTLToolsTexture *)self newTextureViewWithPixelFormat:a3 resourceIndex:0];
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  return -[MTLToolsTexture newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, 0);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v10 = a5.length;
  NSUInteger v11 = a5.location;
  id v15 = [(MTLToolsObject *)self baseObject];
  if (a8) {
    uint64_t v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7, a8);
  }
  else {
    uint64_t v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7);
  }
  v17 = (void *)v16;
  if (!v16) {
    return 0;
  }
  v18 = [[MTLToolsTexture alloc] initWithBaseObject:v16 parent:[(MTLToolsObject *)self device] parentTexture:self];

  return v18;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  return -[MTLToolsTexture newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, 0);
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCompressedTextureViewWithPixelFormat:textureType:level:slice:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    NSUInteger v9 = [[MTLToolsTexture alloc] initWithBaseObject:result parent:[(MTLToolsObject *)self device] parentTexture:self];

    return v9;
  }
  return result;
}

- (BOOL)canGenerateMipmapLevels
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 canGenerateMipmapLevels];
}

- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 generateMipmapLevel:a3 slice:a4];
}

- (unint64_t)rotation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 rotation];
}

- (id)newSharedTextureHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 newSharedTextureHandle];
}

- (__IOSurface)iosurface
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (__IOSurface *)[v2 iosurface];
}

- (unint64_t)iosurfacePlane
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 iosurfacePlane];
}

- (unint64_t)numFaces
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 numFaces];
}

- (BOOL)isDrawable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isDrawable];
}

- (unint64_t)uniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 uniqueIdentifier];
}

- (unint64_t)colorSpaceConversionMatrix
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 colorSpaceConversionMatrix];
}

- (MTLTexture)parentTexture
{
  return self->_parentTexture;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

@end