@interface MRTexture
- ($85CD2974BE96D4886BB301820D1C36C2)size;
- (BOOL)hasMipmap;
- (BOOL)isFBO;
- (BOOL)isFloat;
- (BOOL)isMonochromatic;
- (BOOL)isOpaque;
- (BOOL)isPowerOfTwo;
- (BOOL)isPremultiplied;
- (BOOL)isShared;
- (EAGLContext)glContext;
- (MRContextState)innerState;
- (MRTexture)initWithData:(void *)a3 width:(unsigned int)a4 height:(unsigned int)a5 rowBytes:(unsigned int)a6 inGLContext:(id)a7 options:(id *)a8;
- (MRTexture)initWithDatas:(void *)a3 dataCount:(unint64_t)a4 width:(unsigned int)a5 height:(unsigned int)a6 rowBytes:(unsigned int)a7 inGLContext:(id)a8 options:(id *)a9;
- (MRTexture)initWithSize:(id)a3 inGLContext:(id)a4 options:(id *)a5;
- (MRTexture)initWithTextureName:(unsigned int)a3 textureTarget:(unsigned int)a4 size:(id)a5 inGLContext:(id)a6 options:(id *)a7;
- (const)borderColor;
- (double)timestamp;
- (id)_initWithSize:(id)a3 inGLContext:(id)a4 isFBO:(BOOL)a5 options:(id *)a6;
- (id)initFBOWithSize:(id)a3 inGLContext:(id)a4 options:(id *)a5;
- (int)magFilter;
- (int)minFilter;
- (int)wrapS;
- (int)wrapT;
- (unint64_t)orientation;
- (unsigned)framebufferName;
- (unsigned)pixelFormat;
- (unsigned)textureName;
- (unsigned)textureTarget;
- (void)cleanup;
- (void)dealloc;
- (void)setBorderColor:(const float *)a3;
- (void)setBorderColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setIsOpaque:(BOOL)a3;
- (void)setIsPremultiplied:(BOOL)a3;
- (void)setIsShared:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMagFilter:(int)a3;
- (void)setMinFilter:(int)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setWrapS:(int)a3;
- (void)setWrapT:(int)a3;
- (void)uploadData:(void *)a3 rowBytes:(unint64_t)a4 toRect:(CGRect)a5;
@end

@implementation MRTexture

- (MRTexture)initWithSize:(id)a3 inGLContext:(id)a4 options:(id *)a5
{
  return (MRTexture *)[(MRTexture *)self _initWithSize:a3 inGLContext:a4 isFBO:0 options:a5];
}

- (id)initFBOWithSize:(id)a3 inGLContext:(id)a4 options:(id *)a5
{
  return [(MRTexture *)self _initWithSize:a3 inGLContext:a4 isFBO:1 options:a5];
}

- (id)_initWithSize:(id)a3 inGLContext:(id)a4 isFBO:(BOOL)a5 options:(id *)a6
{
  BOOL v7 = a5;
  objc_sync_enter(a4);
  v11 = [(MRTexture *)self init];
  if (v11)
  {
    v12 = (EAGLContext *)a4;
    int v13 = 1111970369;
    v11->_parenGLContext = v12;
    v11->_size = ($DFC8CE4431498B03249AF47446AA0C66)a3;
    if (a6)
    {
      v11->_hasMipmap = a6->var1;
      v11->_isPowerOfTwo = a6->var2;
      BOOL var3 = a6->var3;
      if (a6->var3) {
        int v13 = 40;
      }
      else {
        int v13 = 1111970369;
      }
    }
    else
    {
      BOOL var3 = 0;
    }
    v11->_textureTarget = 3553;
    v11->_pixelFormat = v13;
    if (v7)
    {
      v12 = (EAGLContext *)objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:sharegroup:", 2, -[EAGLContext sharegroup](v11->_parenGLContext, "sharegroup"));
      v11->_glContext = v12;
    }
    if (v12)
    {
      v15 = +[EAGLContext currentContext];
      v16 = v15;
      if (v15 != v12) {
        +[EAGLContext setCurrentContext:v12];
      }
      glGenTextures(1, &v11->_textureName);
      if (v7)
      {
        glGenFramebuffers(1, &v11->_framebufferName);
        glBindFramebuffer(0x8D40u, v11->_framebufferName);
      }
      glBindTexture(v11->_textureTarget, v11->_textureName);
      v11->_minFilter = 9729;
      glTexParameteri(v11->_textureTarget, 0x2801u, 9729);
      v11->_magFilter = 9729;
      glTexParameteri(v11->_textureTarget, 0x2800u, 9729);
      v11->_wrapS = 33071;
      glTexParameteri(v11->_textureTarget, 0x2802u, 33071);
      v11->_wrapT = 33071;
      glTexParameteri(v11->_textureTarget, 0x2803u, 33071);
      if (a6) {
        BOOL var4 = a6->var4;
      }
      else {
        BOOL var4 = 0;
      }
      v11->_isFloat = var4;
      if (var3) {
        GLint v18 = 6409;
      }
      else {
        GLint v18 = 6408;
      }
      if (var3) {
        GLenum v19 = 6409;
      }
      else {
        GLenum v19 = 32993;
      }
      if (var4) {
        GLenum v20 = 5126;
      }
      else {
        GLenum v20 = 5121;
      }
      glTexImage2D(v11->_textureTarget, 0, v18, v11->_size.width, v11->_size.height, 0, v19, v20, 0);
      if (v7)
      {
        glFramebufferTexture2D(0x8D40u, 0x8CE0u, v11->_textureTarget, v11->_textureName, 0);
        uint64_t v21 = glCheckFramebufferStatus(0x8D40u);
        BOOL v7 = v21;
        if (v21 == 36053) {
          BOOL v7 = 0;
        }
        else {
          NSLog(@"Error %X building FBO\n", v21);
        }
        v11->_innerState = objc_alloc_init(MRContextState);
      }
      if (+[EAGLContext currentContext] != v15) {
        +[EAGLContext setCurrentContext:v15];
      }

      if (v7)
      {

        v11 = 0;
      }
    }
    else
    {
      NSLog(@"Error %d creating context for FBO\n", 0);
    }
  }
  objc_sync_exit(a4);
  return v11;
}

- (MRTexture)initWithTextureName:(unsigned int)a3 textureTarget:(unsigned int)a4 size:(id)a5 inGLContext:(id)a6 options:(id *)a7
{
  objc_sync_enter(a6);
  int v13 = [(MRTexture *)self init];
  if (v13)
  {
    v14 = (EAGLContext *)a6;
    int v15 = 1111970369;
    v13->_parenGLContext = v14;
    v13->_size = ($DFC8CE4431498B03249AF47446AA0C66)a5;
    if (a7)
    {
      v13->_hasMipmap = a7->var1;
      v13->_isPowerOfTwo = a7->var2;
      if (a7->var3) {
        int v15 = 40;
      }
      else {
        int v15 = 1111970369;
      }
    }
    v13->_textureTarget = a4;
    v13->_pixelFormat = v15;
    v13->_textureName = a3;
    v13->_textureNameIsNotOurs = 1;
    v16 = +[EAGLContext currentContext];
    v17 = v16;
    if (v16 != v13->_parenGLContext) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:");
    }
    glActiveTexture(0x84C0u);
    glBindTexture(v13->_textureTarget, v13->_textureName);
    v13->_minFilter = 9729;
    glTexParameteri(v13->_textureTarget, 0x2801u, 9729);
    v13->_magFilter = 9729;
    glTexParameteri(v13->_textureTarget, 0x2800u, 9729);
    v13->_wrapS = 33071;
    glTexParameteri(v13->_textureTarget, 0x2802u, 33071);
    v13->_wrapT = 33071;
    glTexParameteri(v13->_textureTarget, 0x2803u, 33071);
    if (+[EAGLContext currentContext] != v16) {
      +[EAGLContext setCurrentContext:v16];
    }
  }
  objc_sync_exit(a6);
  return v13;
}

- (MRTexture)initWithData:(void *)a3 width:(unsigned int)a4 height:(unsigned int)a5 rowBytes:(unsigned int)a6 inGLContext:(id)a7 options:(id *)a8
{
  uint64_t v10 = *(void *)&a5;
  objc_sync_enter(a7);
  v14 = [(MRTexture *)self init];
  if (v14)
  {
    v14->_parenGLContext = (EAGLContext *)a7;
    v14->_size = ($DFC8CE4431498B03249AF47446AA0C66)(a4 | (unint64_t)(v10 << 32));
    v14->_GLenum textureTarget = 3553;
    int v15 = +[EAGLContext currentContext];
    v16 = v15;
    if (v15 != v14->_parenGLContext) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:");
    }
    glGenTextures(1, &v14->_textureName);
    glActiveTexture(0x84C0u);
    glBindTexture(v14->_textureTarget, v14->_textureName);
    if (a8)
    {
      BOOL var1 = a8->var1;
      v14->_hasMipmap = var1;
      v14->_isPowerOfTwo = a8->var2;
      BOOL var3 = a8->var3;
      LODWORD(a8) = a8->var5;
    }
    else
    {
      BOOL var3 = 0;
      BOOL var1 = v14->_hasMipmap;
    }
    GLenum textureTarget = v14->_textureTarget;
    if (var1)
    {
      if (textureTarget == 3553)
      {
        GLint v20 = 9987;
      }
      else
      {
        v14->_hasMipmap = 0;
        NSLog(@"Consistency error: trying to build mipmaps on non-2D textures");
        GLenum textureTarget = v14->_textureTarget;
        if (v14->_hasMipmap) {
          GLint v20 = 9987;
        }
        else {
          GLint v20 = 9729;
        }
      }
    }
    else
    {
      GLint v20 = 9729;
    }
    if (var3) {
      int v21 = 40;
    }
    else {
      int v21 = 1111970369;
    }
    v14->_pixelFormat = v21;
    v14->_minFilter = v20;
    glTexParameteri(textureTarget, 0x2801u, v20);
    v14->_magFilter = 9729;
    glTexParameteri(v14->_textureTarget, 0x2800u, 9729);
    v14->_wrapS = 33071;
    glTexParameteri(v14->_textureTarget, 0x2802u, 33071);
    v14->_wrapT = 33071;
    glTexParameteri(v14->_textureTarget, 0x2803u, 33071);
    glPixelStorei(0xCF5u, 1);
    if (a8) {
      int v22 = 35359;
    }
    else {
      int v22 = 32993;
    }
    if (a8) {
      int v23 = 34234;
    }
    else {
      int v23 = 5121;
    }
    if (var3) {
      GLint v24 = 6409;
    }
    else {
      GLint v24 = 6408;
    }
    if (var3) {
      GLenum v25 = 6409;
    }
    else {
      GLenum v25 = v22;
    }
    if (var3) {
      GLenum v26 = 5121;
    }
    else {
      GLenum v26 = v23;
    }
    glTexImage2D(v14->_textureTarget, 0, v24, v14->_size.width, v14->_size.height, 0, v25, v26, a3);
    if (v14->_hasMipmap) {
      glGenerateMipmap(v14->_textureTarget);
    }
    glFinish();
    if (+[EAGLContext currentContext] != v15) {
      +[EAGLContext setCurrentContext:v15];
    }

    v14->_timestamp = MRGetCurrentTime();
  }
  objc_sync_exit(a7);
  return v14;
}

- (MRTexture)initWithDatas:(void *)a3 dataCount:(unint64_t)a4 width:(unsigned int)a5 height:(unsigned int)a6 rowBytes:(unsigned int)a7 inGLContext:(id)a8 options:(id *)a9
{
  uint64_t v10 = *(void *)&a6;
  objc_sync_enter(a8);
  int v15 = [(MRTexture *)self init];
  if (v15)
  {
    v15->_parenGLContext = (EAGLContext *)a8;
    v15->_size = ($DFC8CE4431498B03249AF47446AA0C66)(a5 | (unint64_t)(v10 << 32));
    v15->_GLenum textureTarget = 3553;
    v16 = +[EAGLContext currentContext];
    v17 = v16;
    if (v16 != v15->_parenGLContext) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:");
    }
    glGenTextures(1, &v15->_textureName);
    glActiveTexture(0x84C0u);
    glBindTexture(v15->_textureTarget, v15->_textureName);
    v15->_hasMipmap = a4 > 1;
    if (a9)
    {
      v15->_isPowerOfTwo = a9->var2;
      BOOL var3 = a9->var3;
    }
    else
    {
      BOOL var3 = 0;
    }
    if (a4 < 2)
    {
      GLint v19 = 9729;
    }
    else if (v15->_textureTarget == 3553)
    {
      GLint v19 = 9987;
    }
    else
    {
      v15->_hasMipmap = 0;
      NSLog(@"Consistency error: trying to build mipmaps on non-2D textures");
      GLint v19 = 9729;
      a4 = 1;
    }
    if (var3) {
      int v20 = 40;
    }
    else {
      int v20 = 1111970369;
    }
    v15->_pixelFormat = v20;
    v15->_minFilter = v19;
    glTexParameteri(v15->_textureTarget, 0x2801u, v19);
    v15->_magFilter = 9729;
    glTexParameteri(v15->_textureTarget, 0x2800u, 9729);
    v15->_wrapS = 33071;
    glTexParameteri(v15->_textureTarget, 0x2802u, 33071);
    v15->_wrapT = 33071;
    glTexParameteri(v15->_textureTarget, 0x2803u, 33071);
    glPixelStorei(0xCF5u, 1);
    if (var3)
    {
      if (a4)
      {
        uint64_t v21 = 0;
        do
        {
          if (a3[v21]) {
            glTexImage2D(v15->_textureTarget, v21, 6409, v15->_size.width >> v21, v15->_size.height >> v21, 0, 0x1909u, 0x1401u, a3[v21]);
          }
          ++v21;
        }
        while (a4 != v21);
      }
    }
    else if (a4)
    {
      uint64_t v22 = 0;
      do
      {
        if (a3[v22]) {
          glTexImage2D(v15->_textureTarget, v22, 6408, v15->_size.width >> v22, v15->_size.height >> v22, 0, 0x80E1u, 0x1401u, a3[v22]);
        }
        ++v22;
      }
      while (a4 != v22);
    }
    glTexParameteri(v15->_textureTarget, 0x813Du, a4 - 1);
    glFinish();
    if (+[EAGLContext currentContext] != v16) {
      +[EAGLContext setCurrentContext:v16];
    }

    v15->_timestamp = MRGetCurrentTime();
  }
  objc_sync_exit(a8);
  return v15;
}

- (void)dealloc
{
  [(MRTexture *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRTexture;
  [(MRTexture *)&v3 dealloc];
}

- (void)cleanup
{
  parenGLContext = self->_parenGLContext;
  objc_sync_enter(parenGLContext);
  if (self->_parenGLContext)
  {
    if (self->_glContext) {
      glContext = self->_glContext;
    }
    else {
      glContext = self->_parenGLContext;
    }
    v5 = +[EAGLContext currentContext];
    v6 = v5;
    if (v5 != glContext) {
      +[EAGLContext setCurrentContext:glContext];
    }
    if (self->_textureName && !self->_textureNameIsNotOurs) {
      glDeleteTextures(1, &self->_textureName);
    }
    unsigned int framebufferName = self->_framebufferName;
    *(void *)&self->_textureName = 0;
    if (framebufferName)
    {
      glDeleteFramebuffers(1, &self->_framebufferName);
      self->_unsigned int framebufferName = 0;
    }
    if (+[EAGLContext currentContext] != v5) {
      +[EAGLContext setCurrentContext:v5];
    }

    self->_size = 0;
    v8 = self->_glContext;
    if (v8)
    {

      self->_glContext = 0;
    }

    self->_parenGLContext = 0;
    self->_innerState = 0;
  }
  objc_sync_exit(parenGLContext);
}

- (BOOL)isFBO
{
  return self->_glContext != 0;
}

- (BOOL)isMonochromatic
{
  return self->_pixelFormat == 40;
}

- (void)uploadData:(void *)a3 rowBytes:(unint64_t)a4 toRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  parenGLContext = self->_parenGLContext;
  objc_sync_enter(parenGLContext);
  v12 = +[EAGLContext currentContext];
  int v13 = v12;
  if (v12 != self->_parenGLContext) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:");
  }
  glActiveTexture(0x84C0u);
  glBindTexture(self->_textureTarget, self->_textureName);
  unsigned int pixelFormat = self->_pixelFormat;
  glPixelStorei(0xCF5u, 1);
  if (pixelFormat == 40) {
    GLenum v15 = 6409;
  }
  else {
    GLenum v15 = 32993;
  }
  glTexSubImage2D(self->_textureTarget, 0, (int)x, (int)y, (int)width, (int)height, v15, 0x1401u, a3);
  glFinish();
  if (+[EAGLContext currentContext] != v12) {
    +[EAGLContext setCurrentContext:v12];
  }

  self->_timestamp = MRGetCurrentTime();
  objc_sync_exit(parenGLContext);
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    GLuint textureName = self->_textureName;
    v4 = (const GLchar *)[a3 UTF8String];
    glLabelObjectEXT(0x1702u, textureName, 0, v4);
  }
}

- (const)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(const float *)a3
{
  *(_OWORD *)self->_borderColor = *(_OWORD *)a3;
}

- (void)setBorderColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  self->_borderColor[0] = a3;
  self->_borderColor[1] = a4;
  self->_borderColor[2] = a5;
  self->_borderColor[3] = a6;
}

- (MRContextState)innerState
{
  return self->_innerState;
}

- ($85CD2974BE96D4886BB301820D1C36C2)size
{
  objc_copyStruct(&dest, &self->_size, 8, 1, 0);
  return dest;
}

- (unsigned)textureName
{
  return self->_textureName;
}

- (unsigned)textureTarget
{
  return self->_textureTarget;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (EAGLContext)glContext
{
  return self->_glContext;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (unsigned)framebufferName
{
  return self->_framebufferName;
}

- (BOOL)hasMipmap
{
  return self->_hasMipmap;
}

- (BOOL)isPowerOfTwo
{
  return self->_isPowerOfTwo;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (BOOL)isFloat
{
  return self->_isFloat;
}

- (BOOL)isPremultiplied
{
  return self->_isPremultiplied;
}

- (void)setIsPremultiplied:(BOOL)a3
{
  self->_isPremultiplied = a3;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (int)minFilter
{
  return self->_minFilter;
}

- (void)setMinFilter:(int)a3
{
  self->_minFilter = a3;
}

- (int)magFilter
{
  return self->_magFilter;
}

- (void)setMagFilter:(int)a3
{
  self->_magFilter = a3;
}

- (int)wrapS
{
  return self->_wrapS;
}

- (void)setWrapS:(int)a3
{
  self->_wrapS = a3;
}

- (int)wrapT
{
  return self->_wrapT;
}

- (void)setWrapT:(int)a3
{
  self->_wrapT = a3;
}

@end