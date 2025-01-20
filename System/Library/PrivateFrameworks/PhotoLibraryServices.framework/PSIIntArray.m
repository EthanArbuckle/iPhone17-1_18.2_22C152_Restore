@interface PSIIntArray
- (PSIIntArray)initWithLabel:(id)a3 database:(sqlite3 *)a4;
- (int64_t)elementBuffer;
- (void)_prepareForNumberOfElements:(unint64_t)a3;
- (void)_unprepare;
- (void)bindElements:(__CFArray *)a3 range:(_NSRange)a4;
- (void)bindElements:(__CFSet *)a3;
- (void)bindElements:(const int64_t *)a3 numberOfElements:(unint64_t)a4;
- (void)dealloc;
- (void)prepareForNumberOfElements:(unint64_t)a3;
- (void)unbind;
@end

@implementation PSIIntArray

- (void)unbind
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = sqlite3_intarray_bind();
  if (v3)
  {
    int v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unbind int array: %d", (uint8_t *)v5, 8u);
    }
  }
  if (!self->_freeOnUnprepare) {
    [(PSIIntArray *)self _unprepare];
  }
}

- (void)_unprepare
{
  p_elementBuffer = &self->_elementBuffer;
  elementBuffer = self->_elementBuffer;
  staticElementBuffer = self->_staticElementBuffer;
  if (elementBuffer) {
    BOOL v6 = elementBuffer == staticElementBuffer;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    free(elementBuffer);
  }
  *p_elementBuffer = 0;
  p_elementBuffer[1] = 0;
  *((unsigned char *)p_elementBuffer + 16) = 0;
}

- (void)bindElements:(__CFSet *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(PSIIntArray *)self _prepareForNumberOfElements:CFSetGetCount(a3)];
  CFSetGetValues(a3, (const void **)self->_elementBuffer);
  int v5 = sqlite3_intarray_bind();
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to bind int array: %d", (uint8_t *)v7, 8u);
    }
  }
}

- (void)_prepareForNumberOfElements:(unint64_t)a3
{
  unint64_t v4 = 8 * a3;
  elementBuffer = self->_elementBuffer;
  if (!elementBuffer)
  {
    if (v4 < 0x801)
    {
      self->_elementBuffer = self->_staticElementBuffer;
      self->_elementBufferSize = 2048;
      return;
    }
    size_t v7 = 8 * a3;
    malloc_type_id_t v8 = 2871931235;
    goto LABEL_9;
  }
  if (v4 <= self->_elementBufferSize) {
    return;
  }
  if (elementBuffer == self->_staticElementBuffer)
  {
    size_t v7 = 8 * a3;
    malloc_type_id_t v8 = 360620597;
LABEL_9:
    int v6 = (int64_t *)malloc_type_malloc(v7, v8);
    goto LABEL_10;
  }
  int v6 = (int64_t *)malloc_type_realloc(elementBuffer, 8 * a3, 0x378CE1E3uLL);
LABEL_10:
  self->_elementBuffer = v6;
  self->_elementBufferSize = v4;
}

- (void)bindElements:(__CFArray *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(PSIIntArray *)self _prepareForNumberOfElements:a4.length];
  v12.NSUInteger location = location;
  v12.NSUInteger length = length;
  CFArrayGetValues(a3, v12, (const void **)self->_elementBuffer);
  int v8 = sqlite3_intarray_bind();
  if (v8)
  {
    int v9 = v8;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v9;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to bind int array: %d", (uint8_t *)v10, 8u);
    }
  }
}

- (PSIIntArray)initWithLabel:(id)a3 database:(sqlite3 *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSIIntArray;
  int v6 = [(PSIIntArray *)&v10 init];
  if (v6)
  {
    [v5 UTF8String];
    int v7 = sqlite3_intarray_create();
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v12 = v8;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create int array: %d", buf, 8u);
      }

      int v6 = 0;
    }
  }

  return v6;
}

- (void)bindElements:(const int64_t *)a3 numberOfElements:(unint64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = sqlite3_intarray_bind();
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to bind int array: %d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)prepareForNumberOfElements:(unint64_t)a3
{
  self->_freeOnUnprepare = 1;
  [(PSIIntArray *)self _prepareForNumberOfElements:a3];
}

- (int64_t)elementBuffer
{
  return self->_elementBuffer;
}

- (void)dealloc
{
  if (self->_elementBuffer)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Missing call to unbind or unprepare before deallocating int array", buf, 2u);
    }
    [(PSIIntArray *)self unbind];
    [(PSIIntArray *)self unprepare];
  }
  v3.receiver = self;
  v3.super_class = (Class)PSIIntArray;
  [(PSIIntArray *)&v3 dealloc];
}

@end