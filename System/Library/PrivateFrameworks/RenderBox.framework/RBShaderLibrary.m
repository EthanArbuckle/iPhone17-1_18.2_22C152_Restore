@interface RBShaderLibrary
+ (RBShaderLibrary)defaultLibrary;
+ (RBShaderLibrary)libraryWithContentsOfURL:(id)a3;
+ (RBShaderLibrary)libraryWithData:(id)a3;
+ (RBShaderLibrary)libraryWithMetalLibrary:(id)a3;
+ (RBShaderLibrary)libraryWithSource:(id)a3;
+ (id)defaultLibraryWithBundle:(id)a3;
+ (uint64_t)nullLibrary;
- (MTLLibrary)metalLibrary;
- (NSBundle)bundle;
- (NSData)data;
- (NSString)source;
- (NSURL)URL;
- (id).cxx_construct;
- (unsigned)addErrorHandler:(id)a3;
- (void)initWithLibrary:(void *)result;
- (void)removeErrorHandler:(unsigned int)a3;
@end

@implementation RBShaderLibrary

+ (uint64_t)nullLibrary
{
  {
    +[RBShaderLibrary nullLibrary]::null_library = +[RBShaderLibrary libraryWithData:](RBShaderLibrary, "libraryWithData:", [MEMORY[0x263EFF8F8] data]);
  }
  return +[RBShaderLibrary nullLibrary]::null_library;
}

+ (RBShaderLibrary)defaultLibrary
{
  {
    +[RBShaderLibrary defaultLibrary]::default_library = +[RBShaderLibrary defaultLibraryWithBundle:](RBShaderLibrary, "defaultLibraryWithBundle:", [MEMORY[0x263F086E0] mainBundle]);
  }
  return (RBShaderLibrary *)+[RBShaderLibrary defaultLibrary]::default_library;
}

+ (id)defaultLibraryWithBundle:(id)a3
{
  if (a3)
  {
    id result = objc_getAssociatedObject(a3, "RBShaderLibrary");
    if (!result)
    {
      objc_opt_new();
      operator new();
    }
  }
  else
  {
    return (id)+[RBShaderLibrary nullLibrary]();
  }
  return result;
}

+ (RBShaderLibrary)libraryWithData:(id)a3
{
}

+ (RBShaderLibrary)libraryWithContentsOfURL:(id)a3
{
}

+ (RBShaderLibrary)libraryWithMetalLibrary:(id)a3
{
}

+ (RBShaderLibrary)libraryWithSource:(id)a3
{
}

- (NSBundle)bundle
{
  p = self->_library._p;
  if (*((_DWORD *)p + 6)) {
    return 0;
  }
  else {
    return (NSBundle *)*((void *)p + 2);
  }
}

- (NSData)data
{
  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 2) {
    return (NSData *)*((void *)p + 2);
  }
  else {
    return 0;
  }
}

- (NSURL)URL
{
  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 1) {
    return (NSURL *)*((void *)p + 2);
  }
  else {
    return 0;
  }
}

- (MTLLibrary)metalLibrary
{
  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 3) {
    return (MTLLibrary *)*((void *)p + 2);
  }
  else {
    return 0;
  }
}

- (NSString)source
{
  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 4) {
    return (NSString *)*((void *)p + 2);
  }
  else {
    return 0;
  }
}

- (void)initWithLibrary:(void *)result
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)RBShaderLibrary;
    id result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      if (a2)
      {
        v3 = (atomic_uint *)result[1];
        if (v3 != a2)
        {
          if (v3)
          {
            if (atomic_fetch_add_explicit(v3 + 2, 0xFFFFFFFF, memory_order_release) == 1)
            {
              __dmb(9u);
              v4 = result;
              (*(void (**)(atomic_uint *))(*(void *)v3 + 8))(v3);
              id result = v4;
            }
          }
          atomic_fetch_add_explicit(a2 + 2, 1u, memory_order_relaxed);
          result[1] = a2;
        }
      }
      else
      {

        return 0;
      }
    }
  }
  return result;
}

- (unsigned)addErrorHandler:(id)a3
{
  return RB::CustomShader::Library::add_error_handler((uint64_t)self->_library._p, a3);
}

- (void)removeErrorHandler:(unsigned int)a3
{
}

- (void).cxx_destruct
{
  p = self->_library._p;
  if (p)
  {
    if (atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(void))(*(void *)p + 8))();
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end