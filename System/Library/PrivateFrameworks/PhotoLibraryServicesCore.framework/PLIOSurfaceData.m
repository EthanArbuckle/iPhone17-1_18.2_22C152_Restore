@interface PLIOSurfaceData
+ (id)dataWithIOSurface:(void *)a3;
- (PLIOSurfaceData)initWithIOSurface:(void *)a3;
- (PLIOSurfaceData)initWithIOSurface:(void *)a3 length:(unint64_t)a4;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation PLIOSurfaceData

- (void)dealloc
{
  surface = self->_surface;
  if (surface)
  {
    if (self->_bytes)
    {
      IOSurfaceUnlock(surface, 1u, 0);
      self->_bytes = 0;
      surface = self->_surface;
    }
    CFRelease(surface);
    self->_surface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLIOSurfaceData;
  [(PLIOSurfaceData *)&v4 dealloc];
}

- (const)bytes
{
  result = self->_bytes;
  if (!result)
  {
    IOSurfaceLock(self->_surface, 1u, 0);
    result = IOSurfaceGetBaseAddress(self->_surface);
    self->_bytes = result;
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (PLIOSurfaceData)initWithIOSurface:(void *)a3 length:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PLIOSurfaceData;
  v6 = [(PLIOSurfaceData *)&v14 init];
  if (v6)
  {
    if (!a3 || (CFTypeID v7 = CFGetTypeID(a3), v7 != IOSurfaceGetTypeID()))
    {
      v12 = 0;
      goto LABEL_13;
    }
    v8 = (__IOSurface *)CFRetain(a3);
    v6->_surface = v8;
    size_t AllocSize = IOSurfaceGetAllocSize(v8);
    if (AllocSize <= a4 || a4 == 0) {
      unint64_t v11 = AllocSize;
    }
    else {
      unint64_t v11 = a4;
    }
    v6->_length = v11;
  }
  v12 = v6;
LABEL_13:

  return v12;
}

- (PLIOSurfaceData)initWithIOSurface:(void *)a3
{
  return [(PLIOSurfaceData *)self initWithIOSurface:a3 length:0];
}

+ (id)dataWithIOSurface:(void *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithIOSurface:a3];
  return v3;
}

@end