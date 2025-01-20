@interface PVRenderedTexture
- (CGRect)bitmapRect;
- (CGRect)textureRect;
- (CGSize)textureSize;
- (PVRenderedTexture)initWithHGGLTexture:(HGRef<HGGLTexture>)a3;
- (id).cxx_construct;
- (unsigned)textureName;
- (unsigned)textureTarget;
@end

@implementation PVRenderedTexture

- (PVRenderedTexture)initWithHGGLTexture:(HGRef<HGGLTexture>)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PVRenderedTexture;
  v4 = [(PVRenderedTexture *)&v9 init];
  v5 = v4;
  if (v4)
  {
    m_Obj = v4->_glTexture.m_Obj;
    v7 = *(HGGLTexture **)a3.m_Obj;
    if (m_Obj != *(HGGLTexture **)a3.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGGLTexture *))(*(void *)m_Obj + 24))(v5->_glTexture.m_Obj);
        v7 = *(HGGLTexture **)a3.m_Obj;
      }
      v5->_glTexture.m_Obj = v7;
      if (v7) {
        (*(void (**)(HGGLTexture *))(*(void *)v7 + 16))(v7);
      }
    }
  }
  return v5;
}

- (unsigned)textureName
{
  return *((_DWORD *)self->_glTexture.m_Obj + 42);
}

- (unsigned)textureTarget
{
  return *((_DWORD *)self->_glTexture.m_Obj + 40);
}

- (CGSize)textureSize
{
  int TextureRect = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  double v5 = (double)(v4 - TextureRect);
  uint64_t v6 = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  double v8 = (double)(v7 - HIDWORD(v6));
  double v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGRect)textureRect
{
  double TextureRect = (double)(int)HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  double v4 = (double)(int)((unint64_t)HGGLTexture::GetTextureRect(self->_glTexture.m_Obj) >> 32);
  int v5 = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  double v7 = (double)(v6 - v5);
  uint64_t v8 = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  double v10 = (double)(v9 - HIDWORD(v8));
  double v11 = TextureRect;
  double v12 = v4;
  double v13 = v7;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)bitmapRect
{
  m_Obj = self->_glTexture.m_Obj;
  int v3 = *((_DWORD *)m_Obj + 5);
  int v4 = *((_DWORD *)m_Obj + 6);
  double v5 = (double)v3;
  double v6 = (double)v4;
  double v7 = (double)(*((_DWORD *)m_Obj + 7) - v3);
  double v8 = (double)(*((_DWORD *)m_Obj + 8) - v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void).cxx_destruct
{
  m_Obj = self->_glTexture.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGGLTexture *, SEL))(*(void *)m_Obj + 24))(m_Obj, a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end