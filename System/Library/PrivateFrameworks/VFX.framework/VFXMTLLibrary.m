@interface VFXMTLLibrary
- (MTLLibrary)library;
- (VFXMTLLibrary)initWithPath:(id)a3 manager:(id)a4;
- (void)_load;
- (void)dealloc;
@end

@implementation VFXMTLLibrary

- (VFXMTLLibrary)initWithPath:(id)a3 manager:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VFXMTLLibrary;
  v8 = [(VFXMTLLibrary *)&v14 init];
  if (v8)
  {
    if (a3) {
      v9 = (NSURL *)(id)objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v6, (uint64_t)a3, v7);
    }
    else {
      v9 = 0;
    }
    v8->_libraryURL = v9;
    v8->_manager = (VFXMTLLibraryManager *)a4;
    objc_msgSend__load(v8, v10, v11, v12);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLLibrary;
  [(VFXMTLLibrary *)&v3 dealloc];
}

- (void)_load
{
  self->_library = 0;
  if (self->_libraryURL)
  {
    uint64_t v14 = 0;
    v5 = objc_msgSend_device(self->_manager, a2, v2, v3);
    uint64_t v7 = (MTLLibrary *)objc_msgSend_newLibraryWithURL_error_(v5, v6, (uint64_t)self->_libraryURL, (uint64_t)&v14);
    self->_library = v7;
    if (!v7) {
      sub_1B63F2F54(16, @"Error: FATAL ERROR : failed to load Metal shaders library %@, %@", v8, v9, v10, v11, v12, v13, (uint64_t)self->_libraryURL);
    }
  }
}

- (MTLLibrary)library
{
  return self->_library;
}

@end