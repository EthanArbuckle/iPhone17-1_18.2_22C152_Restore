@interface RBImageQueueContents
+ (BOOL)supportsSecureCoding;
- (RBImageQueueContents)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)replacementObjectForCoder:(id)a3;
- (void)CA_copyRenderValue;
- (void)CA_copyRenderValueWithColorspace:(CGColorSpace *)a3;
- (void)CA_prepareRenderValue;
- (void)dealloc;
- (void)initWithSlots:(void *)a1;
- (void)setSurface:(uint64_t)a1;
@end

@implementation RBImageQueueContents

- (void)setSurface:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(atomic_uint **)(a1 + 16);
    if (v4 == a2)
    {
LABEL_8:

      *(void *)(a1 + 24) = 0;
      return;
    }
    if (v4 && atomic_fetch_add_explicit(v4 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v4 + 8))(v4);
      if (!a2) {
        goto LABEL_7;
      }
    }
    else if (!a2)
    {
LABEL_7:
      *(void *)(a1 + 16) = a2;
      goto LABEL_8;
    }
    atomic_fetch_add_explicit(a2 + 2, 1u, memory_order_relaxed);
    goto LABEL_7;
  }
}

- (void)CA_prepareRenderValue
{
}

- (void)CA_copyRenderValue
{
  return (void *)[(_CAImageQueue *)self->_queue._p CA_copyRenderValue];
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)initWithSlots:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)RBImageQueueContents;
  v1 = objc_msgSendSuper2(&v5, sel_init);
  if (v1)
  {
    uint64_t v2 = CAImageQueueCreate();
    v3 = (const void *)v1[1];
    if (v3) {
      CFRelease(v3);
    }
    v1[1] = v2;
    CAImageQueueSetFlags();
  }
  return v1;
}

- (void)dealloc
{
  uint64_t v3 = RB::SurfacePool::shared((RB::SurfacePool *)self);
  RB::SurfacePool::erase_queue(v3, (CFTypeRef *)&self->_queue._p);
  v4.receiver = self;
  v4.super_class = (Class)RBImageQueueContents;
  [(RBImageQueueContents *)&v4 dealloc];
}

- (void)CA_copyRenderValueWithColorspace:(CGColorSpace *)a3
{
  return (void *)[(_CAImageQueue *)self->_queue._p CA_copyRenderValueWithColorspace:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBImageQueueContents)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBImageQueueContents;
  uint64_t v3 = [(RBImageQueueContents *)&v5 init];
  if (v3) {

  }
  return 0;
}

- (id)replacementObjectForCoder:(id)a3
{
  p = self->_surface._p;
  if (p) {
    RBUpdateIOSurfaceCodingProxy(&self->_proxy._p, *((void *)p + 6));
  }
  return self->_proxy._p;
}

- (void).cxx_destruct
{
  p = self->_surface._p;
  if (p && atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(Surface *))(*(void *)p + 8))(p);
  }
  objc_super v4 = self->_queue._p;
  if (v4)
  {
    CFRelease(v4);
  }
}

@end