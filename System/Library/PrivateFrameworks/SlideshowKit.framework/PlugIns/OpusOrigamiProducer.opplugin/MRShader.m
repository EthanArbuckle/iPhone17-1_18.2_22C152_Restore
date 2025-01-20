@interface MRShader
- (BOOL)caresAboutForeColor;
- (BOOL)caresAboutNormal;
- (BOOL)textureUnitsAreBound;
- (MRContext)useContext;
- (MRShader)initWithShaderID:(id)a3 shaderKey:(id)a4 description:(id)a5 vertexShader:(unsigned int)a6 andFragmentShader:(unsigned int)a7 inContext:(id)a8;
- (NSString)shaderID;
- (NSString)shaderKey;
- (int)_locationForUniform:(id)a3;
- (int)locationForAttribute:(id)a3;
- (unsigned)program;
- (void)dealloc;
- (void)setForeColor:(const float *)a3;
- (void)setModelViewProjectionMatrix:(float)a3[16];
- (void)setNormal:(float)a3 :(float)a4 :(float)a5;
- (void)setTextureMatrix:(float)a3[16] onTextureUnit:(unint64_t)a4;
- (void)setTextureUnitsAreBound:(BOOL)a3;
- (void)setUniform:(id)a3 forKey:(id)a4;
- (void)setUniformFloat:(float)a3 forKey:(id)a4;
- (void)setUniformInt:(int)a3 forKey:(id)a4;
- (void)setUniformMat3:(float)a3[16] forKey:(id)a4;
- (void)setUniformMat4:(float)a3[16] forKey:(id)a4;
- (void)setUniformVec2:(float)a3 :(float)a4 forKey:(id)a5;
- (void)setUniformVec3:(float)a3 :(float)a4 :(float)a5 forKey:(id)a6;
- (void)setUniformVec4:(float)a3 :(float)a4 :(float)a5 :(float)a6 forKey:(id)a7;
- (void)setUseContext:(id)a3;
@end

@implementation MRShader

- (MRShader)initWithShaderID:(id)a3 shaderKey:(id)a4 description:(id)a5 vertexShader:(unsigned int)a6 andFragmentShader:(unsigned int)a7 inContext:(id)a8
{
  v20.receiver = self;
  v20.super_class = (Class)MRShader;
  v14 = [(MRShader *)&v20 init];
  if (v14)
  {
    *((void *)v14 + 1) = a3;
    *((void *)v14 + 2) = a4;
    *((void *)v14 + 3) = a5;
    *((void *)v14 + 4) = a8;
    *((_DWORD *)v14 + 11) = a6;
    *((_DWORD *)v14 + 12) = a7;
    GLuint Program = glCreateProgram();
    *((_DWORD *)v14 + 10) = Program;
    GLuint v16 = *((_DWORD *)v14 + 11);
    if (v16)
    {
      glAttachShader(Program, v16);
      GLuint Program = *((_DWORD *)v14 + 10);
    }
    GLuint v17 = *((_DWORD *)v14 + 12);
    if (v17)
    {
      glAttachShader(Program, v17);
      GLuint Program = *((_DWORD *)v14 + 10);
    }
    glBindAttribLocation(Program, 0, "aVertex");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 1u, "aColor");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 2u, "aNormal");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 3u, "aTextureCoordinates0");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 4u, "aTextureCoordinates1");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 5u, "aTextureCoordinates2");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 6u, "aTextureCoordinates3");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 7u, "aInSpriteCoordinates");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 8u, "aAttributes");
    objc_msgSend(*((id *)v14 + 57), "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8), @"aAttributes");
    glBindAttribLocation(*((_DWORD *)v14 + 10), 9u, "aParameter");
    objc_msgSend(*((id *)v14 + 57), "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9), @"aParameter");
    glLinkProgram(*((_DWORD *)v14 + 10));
    *((_DWORD *)v14 + 107) = -2;
    *((void *)v14 + 54) = 0x100000001;
    *(void *)&long long v18 = 0x100000001;
    *((void *)&v18 + 1) = 0x100000001;
    *(_OWORD *)(v14 + 412) = v18;
    *((void *)v14 + 55) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v14 + 57) = objc_alloc_init((Class)NSMutableDictionary);
    *((void *)v14 + 56) = objc_alloc_init((Class)NSMutableDictionary);
  }
  return (MRShader *)v14;
}

- (void)dealloc
{
  v3 = +[EAGLContext currentContext];
  v4 = v3;
  if (v3 != [(MRContext *)self->mContext glContext]) {
    +[EAGLContext setCurrentContext:[(MRContext *)self->mContext glContext]];
  }
  GLuint mVertexShader = self->mVertexShader;
  if (mVertexShader)
  {
    glDetachShader(self->mProgram, mVertexShader);
    self->GLuint mVertexShader = 0;
  }
  GLuint mFragmentShader = self->mFragmentShader;
  if (mFragmentShader)
  {
    glDetachShader(self->mProgram, mFragmentShader);
    self->GLuint mFragmentShader = 0;
  }
  glDeleteProgram(self->mProgram);
  self->mGLuint Program = 0;
  if (+[EAGLContext currentContext] != v3) {
    +[EAGLContext setCurrentContext:v3];
  }

  self->mShaderID = 0;
  self->mShaderKey = 0;

  self->mDescription = 0;
  self->mContext = 0;

  self->mUniformLocations = 0;
  self->mAttributeLocations = 0;

  self->mUniforms = 0;
  v7.receiver = self;
  v7.super_class = (Class)MRShader;
  [(MRShader *)&v7 dealloc];
}

- (MRContext)useContext
{
  return self->mUseContext;
}

- (void)setUseContext:(id)a3
{
  if (self->mUseContext != a3)
  {
    self->mUseContext = (MRContext *)a3;
    self->mModelViewProjectionMatrix[0] = -1.0e37;
    self->mNormal[0] = -1.0e37;
    self->mTextureMatrix[3][0] = -1.0e37;
    self->mTextureMatrix[2][0] = -1.0e37;
    self->mTextureMatrix[1][0] = -1.0e37;
    self->mTextureMatrix[0][0] = -1.0e37;
    self->mForeColor[0] = -1.0e37;
  }
}

- (void)setModelViewProjectionMatrix:(float)a3[16]
{
  uint64_t v4 = 0;
  mModelViewProjectionMatrix = self->mModelViewProjectionMatrix;
  while (mModelViewProjectionMatrix[v4] == a3[v4])
  {
    if (++v4 == 16) {
      return;
    }
  }
  long long v6 = *(_OWORD *)a3;
  long long v7 = *((_OWORD *)a3 + 1);
  long long v8 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->mModelViewProjectionMatrix[8] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->mModelViewProjectionMatrix[12] = v8;
  *(_OWORD *)mModelViewProjectionMatrix = v6;
  *(_OWORD *)&self->mModelViewProjectionMatrix[4] = v7;
  int mModelViewProjectionMatrixLocation = self->mModelViewProjectionMatrixLocation;
  if (mModelViewProjectionMatrixLocation == -2)
  {
    int mModelViewProjectionMatrixLocation = glGetUniformLocation(self->mProgram, "uModelViewProjectionMatrix");
    self->int mModelViewProjectionMatrixLocation = mModelViewProjectionMatrixLocation;
  }
  glUniformMatrix4fv(mModelViewProjectionMatrixLocation, 1, 0, mModelViewProjectionMatrix);
}

- (BOOL)caresAboutNormal
{
  int mNormalLocation = self->mNormalLocation;
  if (mNormalLocation == -2)
  {
    int mNormalLocation = glGetUniformLocation(self->mProgram, "uNormal");
    self->int mNormalLocation = mNormalLocation;
  }
  return mNormalLocation >= 0;
}

- (void)setNormal:(float)a3 :(float)a4 :(float)a5
{
  mNormal = self->mNormal;
  if (self->mNormal[0] != a3 || self->mNormal[1] != a4 || self->mNormal[2] != a5)
  {
    self->mNormal[0] = a3;
    self->mNormal[1] = a4;
    self->mNormal[2] = a5;
    int mNormalLocation = self->mNormalLocation;
    if (mNormalLocation == -2)
    {
      int mNormalLocation = glGetUniformLocation(self->mProgram, "uNormal");
      self->int mNormalLocation = mNormalLocation;
    }
    if ((mNormalLocation & 0x80000000) == 0)
    {
      glUniform3fv(mNormalLocation, 1, mNormal);
    }
  }
}

- (void)setTextureMatrix:(float)a3[16] onTextureUnit:(unint64_t)a4
{
  uint64_t v5 = 0;
  long long v6 = self->mTextureMatrix[a4];
  while (v6[v5] == a3[v5])
  {
    if (++v5 == 16) {
      return;
    }
  }
  long long v7 = *(_OWORD *)a3;
  long long v8 = *((_OWORD *)a3 + 1);
  long long v9 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->mTextureMatrix[a4][8] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->mTextureMatrix[a4][12] = v9;
  *(_OWORD *)long long v6 = v7;
  *(_OWORD *)&self->mTextureMatrix[a4][4] = v8;
  mTextureMatrixLocation = self->mTextureMatrixLocation;
  GLint UniformLocation = self->mTextureMatrixLocation[a4];
  if (UniformLocation == -2)
  {
    GLint UniformLocation = glGetUniformLocation(self->mProgram, off_1AB3F8[a4]);
    mTextureMatrixLocation[a4] = UniformLocation;
  }
  if ((UniformLocation & 0x80000000) == 0)
  {
    glUniformMatrix4fv(UniformLocation, 1, 0, v6);
  }
}

- (BOOL)caresAboutForeColor
{
  int mForeColorLocation = self->mForeColorLocation;
  if (mForeColorLocation == -2)
  {
    int mForeColorLocation = glGetUniformLocation(self->mProgram, "uColor");
    self->int mForeColorLocation = mForeColorLocation;
  }
  return mForeColorLocation >= 0;
}

- (void)setForeColor:(const float *)a3
{
  uint64_t v4 = 0;
  mForeColor = self->mForeColor;
  while (mForeColor[v4] == a3[v4])
  {
    if (++v4 == 4) {
      return;
    }
  }
  *(_OWORD *)mForeColor = *(_OWORD *)a3;
  int mForeColorLocation = self->mForeColorLocation;
  if (mForeColorLocation == -2)
  {
    int mForeColorLocation = glGetUniformLocation(self->mProgram, "uColor");
    self->int mForeColorLocation = mForeColorLocation;
  }
  if ((mForeColorLocation & 0x80000000) == 0)
  {
    glUniform4fv(mForeColorLocation, 1, mForeColor);
  }
}

- (int)_locationForUniform:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mUniformLocations, "objectForKey:");
  if (v5)
  {
    return [v5 intValue];
  }
  else
  {
    uint64_t UniformLocation = glGetUniformLocation(self->mProgram, (const GLchar *)[a3 UTF8String]);
    int v8 = UniformLocation;
    [(NSMutableDictionary *)self->mUniformLocations setObject:+[NSNumber numberWithInt:UniformLocation] forKey:a3];
    return v8;
  }
}

- (void)setUniformInt:(int)a3 forKey:(id)a4
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (long long v7 = [(NSMutableDictionary *)self->mUniforms objectForKey:a4]) == 0
    || v7[10] != a3)
  {
    int v8 = [[MRUniform alloc] initWithI:a3];
    [(NSMutableDictionary *)self->mUniforms setObject:v8 forKey:a4];

    GLint v9 = [(MRShader *)self _locationForUniform:a4];
    if ((v9 & 0x80000000) == 0)
    {
      glUniform1i(v9, a3);
    }
  }
}

- (void)setUniformFloat:(float)a3 forKey:(id)a4
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (long long v7 = (float *)[(NSMutableDictionary *)self->mUniforms objectForKey:a4]) == 0
    || v7[4] != a3)
  {
    int v8 = [[MRUniform alloc] initWithFloat:a3];
    [(NSMutableDictionary *)self->mUniforms setObject:v8 forKey:a4];

    GLint v9 = [(MRShader *)self _locationForUniform:a4];
    if ((v9 & 0x80000000) == 0)
    {
      glUniform1f(v9, a3);
    }
  }
}

- (void)setUniformVec2:(float)a3 :(float)a4 forKey:(id)a5
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (GLint v9 = (float *)[(NSMutableDictionary *)self->mUniforms objectForKey:a5]) == 0
    || v9[4] != a3
    || v9[5] != a4)
  {
    v10 = [[MRUniform alloc] initWithVec2:a3 :a4];
    [(NSMutableDictionary *)self->mUniforms setObject:v10 forKey:a5];

    GLint v11 = [(MRShader *)self _locationForUniform:a5];
    if ((v11 & 0x80000000) == 0)
    {
      glUniform2f(v11, a3, a4);
    }
  }
}

- (void)setUniformVec3:(float)a3 :(float)a4 :(float)a5 forKey:(id)a6
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (GLint v11 = (float *)[(NSMutableDictionary *)self->mUniforms objectForKey:a6]) == 0
    || v11[4] != a3
    || v11[5] != a4
    || v11[6] != a5)
  {
    v12 = [[MRUniform alloc] initWithVec3:a3 :a4 :a5];
    [(NSMutableDictionary *)self->mUniforms setObject:v12 forKey:a6];

    GLint v13 = [(MRShader *)self _locationForUniform:a6];
    if ((v13 & 0x80000000) == 0)
    {
      glUniform3f(v13, a3, a4, a5);
    }
  }
}

- (void)setUniformVec4:(float)a3 :(float)a4 :(float)a5 :(float)a6 forKey:(id)a7
{
  if (NSStringHasPrefix(self->mShaderID, "PhotoprintMiddle")
    || (GLint v13 = (float *)[(NSMutableDictionary *)self->mUniforms objectForKey:a7]) == 0
    || v13[4] != a3
    || v13[5] != a4
    || v13[6] != a5
    || v13[7] != a6)
  {
    v14 = [[MRUniform alloc] initWithVec4:a3 :a4 :a5 :a6];
    [(NSMutableDictionary *)self->mUniforms setObject:v14 forKey:a7];

    GLint v15 = [(MRShader *)self _locationForUniform:a7];
    if ((v15 & 0x80000000) == 0)
    {
      glUniform4f(v15, a3, a4, a5, a6);
    }
  }
}

- (void)setUniformMat3:(float)a3[16] forKey:(id)a4
{
  long long v6 = [[MRUniform alloc] initWithMat4ForMat3:a3];
  [(NSMutableDictionary *)self->mUniforms setObject:v6 forKey:a4];

  GLint v7 = [(MRShader *)self _locationForUniform:a4];
  if ((v7 & 0x80000000) == 0)
  {
    glUniformMatrix3fv(v7, 1, 0, v6->m);
  }
}

- (void)setUniformMat4:(float)a3[16] forKey:(id)a4
{
  long long v6 = [[MRUniform alloc] initWithMat4:a3];
  [(NSMutableDictionary *)self->mUniforms setObject:v6 forKey:a4];

  GLint v7 = [(MRShader *)self _locationForUniform:a4];
  if ((v7 & 0x80000000) == 0)
  {
    glUniformMatrix4fv(v7, 1, 0, v6->m);
  }
}

- (void)setUniform:(id)a3 forKey:(id)a4
{
  GLint v7 = (char *)[(NSMutableDictionary *)self->mUniforms objectForKey:a4];
  if (v7) {
    BOOL v8 = v7 == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v7 == a3) {
      return;
    }
    goto LABEL_13;
  }
  uint64_t v9 = *((void *)v7 + 11);
  if (v9 != *((void *)a3 + 11) || *((void *)v7 + 10) != *((void *)a3 + 10))
  {
LABEL_13:
    [(NSMutableDictionary *)self->mUniforms setObject:a3 forKey:a4];
    GLint v13 = [(MRShader *)self _locationForUniform:a4];
    if ((v13 & 0x80000000) == 0)
    {
      switch(*((void *)a3 + 11))
      {
        case 0:
          GLint v14 = *((_DWORD *)a3 + 20);
          glUniform1i(v13, v14);
          break;
        case 1:
          GLfloat v15 = *((float *)a3 + 4);
          glUniform1f(v13, v15);
          break;
        case 2:
          glUniform2fv(v13, 1, (const GLfloat *)a3 + 4);
          break;
        case 3:
          glUniform3fv(v13, 1, (const GLfloat *)a3 + 4);
          break;
        case 4:
          glUniform4fv(v13, 1, (const GLfloat *)a3 + 4);
          break;
        case 9:
          glUniformMatrix3fv(v13, 1, 0, (const GLfloat *)a3 + 4);
          break;
        case 0x10:
          glUniformMatrix4fv(v13, 1, 0, (const GLfloat *)a3 + 4);
          break;
        default:
          return;
      }
    }
    return;
  }
  v10 = (float *)a3;
  while (v9)
  {
    float v11 = *((float *)v7 + 4);
    float v12 = v10[4];
    --v9;
    ++v10;
    v7 += 4;
    if (v11 != v12) {
      goto LABEL_13;
    }
  }
}

- (int)locationForAttribute:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mAttributeLocations, "objectForKey:");
  if (v5)
  {
    return [v5 intValue];
  }
  else
  {
    uint64_t AttribLocation = glGetAttribLocation(self->mProgram, (const GLchar *)[a3 UTF8String]);
    int v8 = AttribLocation;
    [(NSMutableDictionary *)self->mAttributeLocations setObject:+[NSNumber numberWithInt:AttribLocation] forKey:a3];
    return v8;
  }
}

- (NSString)shaderID
{
  return self->mShaderID;
}

- (NSString)shaderKey
{
  return self->mShaderKey;
}

- (unsigned)program
{
  return self->mProgram;
}

- (BOOL)textureUnitsAreBound
{
  return self->mTextureUnitsAreBound;
}

- (void)setTextureUnitsAreBound:(BOOL)a3
{
  self->mTextureUnitsAreBound = a3;
}

@end