@interface MTLToolsBuffer
- (BOOL)detachBacking;
- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (__IOSurface)_aneIOSurface;
- (__IOSurface)iosurface;
- (id)formattedDescription:(unint64_t)a3;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5;
- (unint64_t)gpuAddress;
- (unint64_t)length;
- (unint64_t)parentGPUAddress;
- (unint64_t)parentGPUSize;
- (void)addDebugMarker:(id)a3 range:(_NSRange)a4;
- (void)contents;
- (void)dealloc;
- (void)didModifyRange:(_NSRange)a3;
- (void)removeAllDebugMarkers;
- (void)setParentGPUAddress:(unint64_t)a3;
- (void)setParentGPUSize:(unint64_t)a3;
@end

@implementation MTLToolsBuffer

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLToolsBuffer;
  [(MTLToolsResource *)&v2 dealloc];
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

- (unint64_t)length
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 length];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (unint64_t)parentGPUAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 parentGPUAddress];
}

- (void)setParentGPUAddress:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setParentGPUAddress:a3];
}

- (unint64_t)parentGPUSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 parentGPUSize];
}

- (void)setParentGPUSize:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setParentGPUSize:a3];
}

- (void)contents
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (void *)[v2 contents];
}

- (void)didModifyRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v5, "didModifyRange:", location, length);
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    v9 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (__IOSurface)_aneIOSurface
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (__IOSurface *)[v2 _aneIOSurface];
}

- (void)addDebugMarker:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v7, "addDebugMarker:range:", a3, location, length);
}

- (void)removeAllDebugMarkers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 removeAllDebugMarkers];
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    id v8 = [[MTLToolsTexture alloc] initWithBaseObject:result parent:[(MTLToolsObject *)self device] buffer:self];

    return v8;
  }
  return result;
}

- (__IOSurface)iosurface
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (__IOSurface *)[v2 iosurface];
}

- (BOOL)detachBacking
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 detachBacking];
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 replaceBackingWithRanges:a3 readOnly:v4];
}

- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  return [v8 replaceBackingWithBytesNoCopy:a3 length:a4 deallocator:a5];
}

@end