@interface FxPlugAPIHandler
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (FxPlugAPIDelegate)delegate;
- (FxPlugAPIHandler)initWithDelegate:(id)a3;
- (id)errorWithString:(id)a3 andCode:(int64_t)a4;
- (unint64_t)numberOfCores;
- (void)allocateMemory:(unint64_t)a3 clear:(BOOL)a4 clearWith:(unsigned __int8)a5 error:(id *)a6;
- (void)createPBuffer:(unsigned int *)a3 withTarget:(unsigned int)a4 error:(id *)a5;
- (void)createTexture:(id *)a3 withDOD:(FxRect)a4 GLTarget:(unsigned int)a5 level:(int)a6 internalFormat:(unsigned int)a7 width:(int)width height:(int)a9 border:(int)a10 format:(unsigned int)a11 type:(unsigned int)a12 pixels:(const void *)pixels origin:(unint64_t)a14 pixelAspectRatio:(double)a15 andError:(id *)a16;
- (void)deletePBuffer:(unsigned int)a3 error:(id *)a4;
- (void)deleteTexture:(id)a3 error:(id *)a4;
- (void)freeMemory:(void *)a3 error:(id *)a4;
- (void)performSelector:(SEL)a3 onTarget:(id)a4 withObject:(id)a5 onThreads:(int64_t)a6 waitUntilDone:(BOOL)a7 error:(id *)a8;
- (void)runFxPlugThread:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FxPlugAPIHandler

- (FxPlugAPIHandler)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FxPlugAPIHandler;
  result = [(FxPlugAPIHandler *)&v5 init];
  if (result) {
    result->_delegate = (FxPlugAPIDelegate *)a3;
  }
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  if (a4 > 1) {
    return 0;
  }
  return &unk_1F1225D98 == a3
      || &unk_1F122C358 == a3
      || &unk_1F1225928 == a3
      || &unk_1F122C1D8 == a3
      || &unk_1F1216B60 == a3;
}

- (FxPlugAPIDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FxPlugAPIDelegate *)a3;
}

- (id)errorWithString:(id)a3 andCode:(int64_t)a4
{
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:*MEMORY[0x1E4F28568]];
  v6 = (void *)MEMORY[0x1E4F28C58];
  v7 = FxPlugErrorDomain;

  return (id)[v6 errorWithDomain:v7 code:a4 userInfo:v5];
}

- (void)allocateMemory:(unint64_t)a3 clear:(BOOL)a4 clearWith:(unsigned __int8)a5 error:(id *)a6
{
  int v7 = a5;
  BOOL v8 = a4;
  v11 = malloc_type_malloc(a3, 0x687DF607uLL);
  v12 = v11;
  if (v11)
  {
    if (v8) {
      memset(v11, v7, a3);
    }
  }
  else if (a6)
  {
    *a6 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Unable to allocate memory in %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) allocateMemory:clear:clearWith:error:]"), 6);
  }
  return v12;
}

- (void)freeMemory:(void *)a3 error:(id *)a4
{
  if (malloc_size(a3))
  {
    free(a3);
  }
  else if (a4)
  {
    *a4 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Attempt to free a memory block (%p) not allocated in  %s", a3, "-[FxPlugAPIHandler(HostResourcesAPIHandler) freeMemory:error:]"), 7);
  }
}

- (void)createTexture:(id *)a3 withDOD:(FxRect)a4 GLTarget:(unsigned int)a5 level:(int)a6 internalFormat:(unsigned int)a7 width:(int)width height:(int)a9 border:(int)a10 format:(unsigned int)a11 type:(unsigned int)a12 pixels:(const void *)pixels origin:(unint64_t)a14 pixelAspectRatio:(double)a15 andError:(id *)a16
{
  uint64_t v19 = *(void *)&a4.var2;
  uint64_t v20 = *(void *)&a4.var0;
  int var1 = a4.var1;
  int var3 = a4.var3;
  if (a3) {
    id v25 = 0;
  }
  else {
    id v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Invalid FxTexture pointer sent to %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]"), 5);
  }
  if ((int)v19 <= (int)v20 || var3 <= var1) {
    id v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Invalid dod sent to %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]"), 5);
  }
  textures[0] = 0;
  if (!v25)
  {
    glGenTextures(1, textures);
    uint64_t Error = glGetError();
    if (!Error
      || (char v40 = 0,
          (id v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"OpenGL returned an error (%d) to %s while generating a texture: %s", Error, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]", &v40), 8)) == 0))
    {
      glTexImage2D(a5, a6, a7, width, a9, a10, a11, a12, pixels);
      uint64_t v27 = glGetError();
      if (!v27
        || (char v40 = 0,
            (id v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"OpenGL returned an error (%d) to %s while uploading a texture: %s", v27, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]", &v40), 8)) == 0))
      {
        glBindTexture(a5, textures[0]);
        uint64_t v28 = glGetError();
        if (v28)
        {
          char v40 = 0;
          id v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"OpenGL returned an error (%d) to %s while binding a texture: %s", v28, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]", &v40), 8);
          if (!a3) {
            goto LABEL_8;
          }
        }
        else
        {
          id v25 = 0;
          if (!a3) {
            goto LABEL_8;
          }
        }
        if (!v25)
        {
          v29 = [FxTexture alloc];
          v32[0] = width;
          v32[1] = a9;
          long long v33 = xmmword_1B837AC00;
          uint64_t v34 = 2;
          unint64_t v35 = a14;
          uint64_t v36 = 0;
          char v37 = 1;
          memset(v38, 0, sizeof(v38));
          double v39 = a15;
          v30 = [(FxTexture *)v29 initWithInfo:v32 textureId:textures[0] andTarget:a5];
          *a3 = v30;
          if (v30)
          {
            -[FxImage setDod:](v30, "setDod:", v20, v19);
            objc_msgSend(*a3, "setBounds:", (double)(int)v20 * a15, (double)var1, (double)((int)v19 - (int)v20) * a15, (double)(var3 - var1));
            id v25 = 0;
          }
          else
          {
            id v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Unable to allocate an FxTexture in %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]"), 6);
            glBindTexture(a5, 0);
            glDeleteTextures(1, textures);
          }
        }
      }
    }
  }
LABEL_8:
  if (a16) {
    *a16 = v25;
  }
}

- (void)deleteTexture:(id)a3 error:(id *)a4
{
  if (a3 && [a3 textureId]
    || (id v7 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Invalid FxTexture pointer (%p) in %s", a3, "-[FxPlugAPIHandler(HostResourcesAPIHandler) deleteTexture:error:]"), 5)) == 0)
  {
    GLuint textures = [a3 textureId];
    glDeleteTextures(1, &textures);

    id v7 = 0;
  }
  if (a4) {
    *a4 = v7;
  }
}

- (void)createPBuffer:(unsigned int *)a3 withTarget:(unsigned int)a4 error:(id *)a5
{
  if (!a3)
  {
    id v10 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Invalid pBuffer pointer (%p) in %s", 0, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createPBuffer:withTarget:error:]"), 5);
    if (v10)
    {
LABEL_11:
      if (!a5) {
        return;
      }
      goto LABEL_12;
    }
  }
  glGenBuffers(1, a3);
  uint64_t Error = glGetError();
  if (Error)
  {
    char v13 = 0;
    id v10 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"OpenGL Error (%d): %s in %s", Error, &v13, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createPBuffer:withTarget:error:]"), 8);
    if (!a3) {
      goto LABEL_11;
    }
  }
  else
  {
    id v10 = 0;
    if (!a3) {
      goto LABEL_11;
    }
  }
  if (v10) {
    goto LABEL_11;
  }
  glBindBuffer(a4, *a3);
  uint64_t v11 = glGetError();
  if (v11)
  {
    char v12 = 0;
    id v10 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"OpenGL Error (%d): %s in %s", v11, &v12, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createPBuffer:withTarget:error:]"), 8);
    goto LABEL_11;
  }
  id v10 = 0;
  if (!a5) {
    return;
  }
LABEL_12:
  *a5 = v10;
}

- (void)deletePBuffer:(unsigned int)a3 error:(id *)a4
{
  GLuint buffers = a3;
  glDeleteBuffers(1, &buffers);
  uint64_t Error = glGetError();
  if (Error)
  {
    char v8 = 0;
    id v7 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"OpenGL Error (%d): %s in %s", Error, &v8, "-[FxPlugAPIHandler(HostResourcesAPIHandler) deletePBuffer:error:]"), 8);
    if (!a4) {
      return;
    }
  }
  else
  {
    id v7 = 0;
    if (!a4) {
      return;
    }
  }
  *a4 = v7;
}

- (unint64_t)numberOfCores
{
  v2 = (void *)[MEMORY[0x1E4F28F80] processInfo];

  return [v2 activeProcessorCount];
}

- (void)performSelector:(SEL)a3 onTarget:(id)a4 withObject:(id)a5 onThreads:(int64_t)a6 waitUntilDone:(BOOL)a7 error:(id *)a8
{
  BOOL v8 = a7;
  v22 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  if (v22)
  {
    id v12 = 0;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    v14 = 0;
    goto LABEL_8;
  }
  id v12 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Unable to allocate thread array in %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) performSelector:onTarget:withObject:onThreads:waitUntilDone:error:]"), 7);
  if (!v8) {
    goto LABEL_6;
  }
LABEL_3:
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  v14 = v13;
  if (v13) {
    [v13 lock];
  }
  else {
    id v12 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Unable to allocate lock in %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) performSelector:onTarget:withObject:onThreads:waitUntilDone:error:]"), 7);
  }
LABEL_8:
  BOOL v20 = v8;
  if (a6 >= 1 && !v12)
  {
    int64_t v15 = 1;
    do
    {
      uint64_t v16 = [NSString stringWithUTF8String:sel_getName(a3)];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, @"FxThreadTarget", a5, @"FxThreadObject", v16, @"FxThreadSelector", objc_msgSend(NSNumber, "numberWithInteger:", v15 - 1), @"FxThreadNumber", v14, @"FxThreadLock", 0);
      id v18 = (id)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel_runFxPlugThread_ object:v17];
      if (v16 && v17 && (uint64_t v19 = v18) != 0)
      {
        [v22 addObject:v18];
        [v19 start];
        id v12 = 0;
      }
      else
      {
        id v12 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(NSString, "stringWithFormat:", @"Unable to allocate thread in %s", "-[FxPlugAPIHandler(HostResourcesAPIHandler) performSelector:onTarget:withObject:onThreads:waitUntilDone:error:]"), 7);
      }
      if (v15 >= a6) {
        break;
      }
      ++v15;
    }
    while (!v12);
  }
  if (v20)
  {
    [v14 unlockWithCondition:a6];
    [v14 lockWhenCondition:0];
    [v14 unlock];
  }
  if (a8) {
    *a8 = v12;
  }
}

- (void)runFxPlugThread:(id)a3
{
  PCAutoreleasePool::PCAutoreleasePool((PCAutoreleasePool *)&v11);
  SEL v5 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"FxThreadSelector"), "UTF8String"));
  v6 = (void *)[a3 objectForKey:@"FxThreadTarget"];
  uint64_t v7 = [a3 objectForKey:@"FxThreadObject"];
  BOOL v8 = (void *)[a3 objectForKey:@"FxThreadNumber"];
  v9 = (void *)[NSString stringWithFormat:@"%@ worker thread #%d", -[FxPlugAPIDelegate displayName](self->_delegate, "displayName"), objc_msgSend(v8, "intValue")];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "setName:", v9);
  pthread_setname_np((const char *)[v9 UTF8String]);
  objc_msgSend(v6, "performSelector:withObject:", v5, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v7, @"FxThreadObject", v8, @"FxThreadNumber", 0));
  id v10 = (void *)[a3 objectForKey:@"FxThreadLock"];
  [v10 lock];
  objc_msgSend(v10, "unlockWithCondition:", objc_msgSend(v10, "condition") - 1);
  PCAutoreleasePool::~PCAutoreleasePool(&v11);
}

@end