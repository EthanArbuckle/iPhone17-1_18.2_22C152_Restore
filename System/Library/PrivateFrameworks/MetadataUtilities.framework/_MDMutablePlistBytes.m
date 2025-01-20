@interface _MDMutablePlistBytes
+ (__MDPlistBytes)createArrayPlistBytesUsingBlock:(id)a3;
+ (__MDPlistBytes)createDictionaryPlistBytesUsingBlock:(id)a3;
- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3;
- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3 useMalloc:(BOOL)a4;
- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3 useMalloc:(BOOL)a4 zone:(_malloc_zone_t *)a5;
@end

@implementation _MDMutablePlistBytes

- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3 useMalloc:(BOOL)a4 zone:(_malloc_zone_t *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_MDMutablePlistBytes;
  v8 = [(_MDMutablePlistBytes *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->super._zone = a5;
    unint64_t v10 = (a3 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
    if (!a3) {
      unint64_t v10 = 2 * *MEMORY[0x1E4F14B00];
    }
    if (v10 >= 0x70000000) {
      size_t v11 = 1879048192;
    }
    else {
      size_t v11 = v10;
    }
    v8->super._byteVectorCapacity = v11;
    if (a4)
    {
      v8->super._byteVector = (unint64_t)malloc_type_zone_malloc(a5, v11, 0x34F65F98uLL);
      char v12 = 8;
LABEL_14:
      *((unsigned char *)&v9->super + 34) = *((unsigned char *)&v9->super + 34) & 0xF7 | v12;
      v9->super._deallocator = &__block_literal_global_108;
      v9->super._uidCapacity = 256;
      v9->super._uidVector = (unint64_t *)malloc_type_valloc(0x800uLL, 0x100004000313F17uLL);
      v9->_currentUID = -1;
      byteVector = (unint64_t *)v9->super._byteVector;
      v9->_fillPtr = byteVector;
      v9->_limitPtr = (unint64_t *)((char *)byteVector + v9->super._byteVectorCapacity);
      v9->_rleTagPtr = 0;
      *((unsigned char *)&v9->super + 34) |= 1u;
      return v9;
    }
    int v13 = _fast_vm_allocate(&v8->super._byteVector, v11, -251658239);
    if (!v13)
    {
      char v12 = 0;
      goto LABEL_14;
    }
    int v14 = v13;
    v15 = _MDLogForCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_MDMutablePlistBytes initWithCapacity:useMalloc:zone:](v14, v15);
    }

    return 0;
  }
  return v9;
}

- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3 useMalloc:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = malloc_default_zone();

  return [(_MDMutablePlistBytes *)self initWithCapacity:a3 useMalloc:v4 zone:v7];
}

+ (__MDPlistBytes)createArrayPlistBytesUsingBlock:(id)a3
{
  BOOL v4 = [[_MDMutablePlistBytes alloc] initWithCapacity:0 useMalloc:0];
  if (!v4) {
    +[_MDPlistBytes createPlistBytes:]();
  }
  uint64_t v5 = (uint64_t)v4;
  CFRetain(v4);

  _MDPlistBytesBeginPlist(v5);
  _MDPlistBytesBeginContainer(v5, 10);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
  _MDPlistBytesEndContainer(v5);
  _MDPlistBytesEndPlist(v5);
  if (*(_WORD *)(v5 + 32))
  {
    CFRelease((CFTypeRef)v5);
    return 0;
  }
  return (__MDPlistBytes *)v5;
}

+ (__MDPlistBytes)createDictionaryPlistBytesUsingBlock:(id)a3
{
  BOOL v4 = [[_MDMutablePlistBytes alloc] initWithCapacity:0 useMalloc:0];
  if (!v4) {
    +[_MDPlistBytes createPlistBytes:]();
  }
  uint64_t v5 = (uint64_t)v4;
  CFRetain(v4);

  _MDPlistBytesBeginPlist(v5);
  _MDPlistBytesBeginContainer(v5, 13);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
  _MDPlistBytesEndContainer(v5);
  _MDPlistBytesEndPlist(v5);
  if (*(_WORD *)(v5 + 32))
  {
    CFRelease((CFTypeRef)v5);
    return 0;
  }
  return (__MDPlistBytes *)v5;
}

- (_MDMutablePlistBytes)initWithCapacity:(unint64_t)a3
{
  uint64_t v5 = malloc_default_zone();

  return [(_MDMutablePlistBytes *)self initWithCapacity:a3 useMalloc:0 zone:v5];
}

- (void)initWithCapacity:(int)a1 useMalloc:(NSObject *)a2 zone:.cold.1(int a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = v4;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_error_impl(&dword_1A334F000, a2, OS_LOG_TYPE_ERROR, "PlistBytes initWithCapacity mmap err:%d kr:%d", (uint8_t *)v5, 0xEu);
}

@end