@interface _UINewCGImageDecompressor
+ (CMPhotoDecompressionSession)_sharedDecompressionSession;
- (CGImage)waitForImageRef;
- (_UINewCGImageDecompressor)init;
- (id)initWithSourceImage:(void *)a3 completionQueue:;
- (void)_finishDecompressingWithImage:(CGImage *)a3 error:(id)a4;
- (void)dealloc;
- (void)decompressAsync:(uint64_t)a1;
@end

@implementation _UINewCGImageDecompressor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_imageOrError, 0);
}

- (id)initWithSourceImage:(void *)a3 completionQueue:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (a1)
  {
    if (!a2)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel_initWithSourceImage_completionQueue_, a1, @"_UINewCGImageDecompressor.m", 41, @"Invalid parameter not satisfying: %@", @"imageRef != NULL" object file lineNumber description];
    }
    v17.receiver = a1;
    v17.super_class = (Class)_UINewCGImageDecompressor;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v6 = CGImageCopySourceData();
      if (v6)
      {
        v7 = (const void *)v6;
        if (+[_UINewCGImageDecompressor _sharedDecompressionSession])
        {
          int Container = CMPhotoDecompressionSessionCreateContainer();
          CFRelease(v7);
          if (Container <= -16994)
          {
            if (Container != -17103 && Container != -17101)
            {
LABEL_19:
              v14 = UIDecompressorLog();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134349056;
                uint64_t v19 = Container;
                _os_log_error_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Error %{public}ld decompressing image -- possibly corrupt", buf, 0xCu);
              }
LABEL_16:

              goto LABEL_17;
            }
          }
          else if ((Container + 16993) >= 4)
          {
            if (!Container)
            {
              v9 = dispatch_queue_attr_make_initially_inactive(0);
              dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.UIKit.decompressor-reply", v9, v5);
              v11 = (void *)*((void *)a1 + 3);
              *((void *)a1 + 3) = v10;

              dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
              v13 = (void *)*((void *)a1 + 4);
              *((void *)a1 + 4) = v12;

              *((_DWORD *)a1 + 10) = 0;
              goto LABEL_18;
            }
            goto LABEL_19;
          }
          v14 = UIDecompressorLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134349056;
            uint64_t v19 = Container;
            _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Internal error %{public}ld creating decompression container", buf, 0xCu);
          }
          goto LABEL_16;
        }
        CFRelease(v7);
      }
LABEL_17:

      a1 = 0;
    }
  }
LABEL_18:

  return a1;
}

+ (CMPhotoDecompressionSession)_sharedDecompressionSession
{
  if (_MergedGlobals_1_14 != -1) {
    dispatch_once(&_MergedGlobals_1_14, &__block_literal_global_300);
  }
  return (CMPhotoDecompressionSession *)qword_1EB25BDB8;
}

- (void)dealloc
{
  container = self->_container;
  if (container) {
    CFRelease(container);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UINewCGImageDecompressor;
  [(_UINewCGImageDecompressor *)&v4 dealloc];
}

- (CGImage)waitForImageRef
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      replyQueue = self->_replyQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44___UINewCGImageDecompressor_waitForImageRef__block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(replyQueue, block);
      dispatch_queue_t v10 = UIDecompressorLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "Async decode in progress; blocking sync decode on semaphore",
          buf,
          2u);
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    objc_super v4 = UIDecompressorLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEBUG, "Sync decode beginning", buf, 2u);
    }

    *(unsigned char *)&self->_flags |= 1u;
    int ImageForIndex = CMPhotoDecompressionContainerCreateImageForIndex();
    uint64_t v6 = UIDecompressorLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (ImageForIndex)
    {
      if (v7)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v14) = ImageForIndex;
        _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Sync decode failed with error=(OSStatus) %d", buf, 8u);
      }

      v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:ImageForIndex userInfo:0];
      [(_UINewCGImageDecompressor *)self _finishDecompressingWithImage:0 error:v8];
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = 0;
        _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Sync decode finished with image=%p", buf, 0xCu);
      }

      [(_UINewCGImageDecompressor *)self _finishDecompressingWithImage:0 error:0];
      CGImageRelease(0);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return 0;
  }
  else {
    return (CGImage *)self->_imageOrError;
  }
}

- (void)_finishDecompressingWithImage:(CGImage *)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (a3)
  {
    v9 = UIDecompressorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 134217984;
      v16 = a3;
      _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "Decode finished with image=%p", (uint8_t *)&v15, 0xCu);
    }

    CGImageRef v10 = CGImageRetain(a3);
    id imageOrError = self->_imageOrError;
    self->_id imageOrError = v10;
  }
  else if (v7)
  {
    dispatch_semaphore_t v12 = UIDecompressorLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v8 domain];
      int v15 = 138412546;
      v16 = v14;
      __int16 v17 = 1024;
      int v18 = [v8 code];
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "Decode failed with error.domain=%@ error.code=%d", (uint8_t *)&v15, 0x12u);
    }
    objc_storeStrong(&self->_imageOrError, a4);
    *(unsigned char *)&self->_flags |= 4u;
  }
  container = self->_container;
  if (container)
  {
    CFRelease(container);
    self->_container = 0;
  }
  *(unsigned char *)&self->_flags |= 2u;
  dispatch_activate((dispatch_object_t)self->_replyQueue);
}

- (void)decompressAsync:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 40));
    if (!v4 || (*(unsigned char *)(a1 + 44) & 1) != 0)
    {
      v13 = UIDecompressorLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEBUG, "Async decode lost race, enqueueing deferred reply", buf, 2u);
      }

      uint64_t v14 = *(NSObject **)(a1 + 24);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __45___UINewCGImageDecompressor_decompressAsync___block_invoke;
      v25[3] = &unk_1E52DA160;
      v25[4] = a1;
      uint64_t v6 = &v26;
      id v26 = v3;
      dispatch_async(v14, v25);
      if (v4) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      }
    }
    else
    {
      v5 = UIDecompressorLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "Async decode beginning", buf, 2u);
      }

      *(unsigned char *)(a1 + 44) |= 1u;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __45___UINewCGImageDecompressor_decompressAsync___block_invoke_18;
      v22 = &unk_1E52F2EE8;
      uint64_t v23 = a1;
      uint64_t v6 = &v24;
      id v7 = v3;
      id v24 = v7;
      int v8 = CMPhotoDecompressionContainerDecodeImageForIndexAsync();
      if (v8)
      {
        int v9 = v8;
        CGImageRef v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
        [(id)a1 _finishDecompressingWithImage:0 error:v10];
        v11 = *(NSObject **)(a1 + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45___UINewCGImageDecompressor_decompressAsync___block_invoke_21;
        block[3] = &unk_1E52F2F10;
        int v18 = v9;
        id v16 = v10;
        id v17 = v7;
        id v12 = v10;
        dispatch_async(v11, block);
      }
    }
  }
}

- (_UINewCGImageDecompressor)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Must call designated intializer" userInfo:0];
  objc_exception_throw(v2);
}

@end