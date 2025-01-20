@interface VKIconImage
- (BOOL)isBalloonShape;
- (CGColor)calloutFillColor;
- (CGColor)calloutHaloColor;
- (CGColor)calloutTextColor;
- (CGColor)fillColor;
- (CGColor)glyphColor;
- (CGColor)haloColor;
- (CGImage)image;
- (CGSize)imageSize;
- (float)contentScale;
- (float)opacity;
- (id).cxx_construct;
- (id)init:(shared_ptr<grl::IconImage>)a3;
- (unsigned)calloutShape;
@end

@implementation VKIconImage

- (void).cxx_destruct
{
  self->_calloutTextColor._vptr$_retain_ptr = (void **)&unk_1EF5590F8;
  obj = self->_calloutTextColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  self->_calloutHaloColor._vptr$_retain_ptr = (void **)&unk_1EF5590F8;
  v4 = self->_calloutHaloColor._obj;
  if (v4) {
    CFRelease(v4);
  }
  self->_calloutFillColor._vptr$_retain_ptr = (void **)&unk_1EF5590F8;
  v5 = self->_calloutFillColor._obj;
  if (v5) {
    CFRelease(v5);
  }
  self->_glyphColor._vptr$_retain_ptr = (void **)&unk_1EF5590F8;
  v6 = self->_glyphColor._obj;
  if (v6) {
    CFRelease(v6);
  }
  self->_haloColor._vptr$_retain_ptr = (void **)&unk_1EF5590F8;
  v7 = self->_haloColor._obj;
  if (v7) {
    CFRelease(v7);
  }
  self->_fillColor._vptr$_retain_ptr = (void **)&unk_1EF5590F8;
  v8 = self->_fillColor._obj;
  if (v8) {
    CFRelease(v8);
  }
  cntrl = self->_iconImage.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (float)contentScale
{
  ptr = self->_iconImage.__ptr_;
  if (ptr) {
    return *((float *)ptr + 47);
  }
  else {
    return 1.0;
  }
}

- (CGColor)fillColor
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  result = self->_fillColor._obj;
  if (result) {
    return result;
  }
  if (!*((unsigned char *)ptr + 153)) {
    return 0;
  }
  __int32 v9 = *(_DWORD *)((char *)ptr + 154);
  char v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_fillColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  result = v7;
  self->_fillColor._obj = v7;
  return result;
}

- (id)init:(shared_ptr<grl::IconImage>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)VKIconImage;
  v4 = [(VKIconImage *)&v10 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(IconImage **)ptr;
    if (*(void *)ptr)
    {
      uint64_t v7 = *((void *)ptr + 1);
      if (v7) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
      }
      cntrl = (std::__shared_weak_count *)v4->_iconImage.__cntrl_;
      v4->_iconImage.__ptr_ = v6;
      v4->_iconImage.__cntrl_ = (__shared_weak_count *)v7;
      if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v5;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = &unk_1EF5590F8;
  *((void *)self + 4) = 0;
  *((void *)self + 6) = &unk_1EF5590F8;
  *((void *)self + 7) = 0;
  *((void *)self + 9) = &unk_1EF5590F8;
  *((void *)self + 10) = 0;
  *((void *)self + 12) = &unk_1EF5590F8;
  *((void *)self + 13) = 0;
  *((void *)self + 15) = &unk_1EF5590F8;
  *((void *)self + 16) = 0;
  *((void *)self + 18) = &unk_1EF5590F8;
  *((void *)self + 19) = 0;
  return self;
}

- (CGImage)image
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  grl::IconImage::image((grl::IconImage *)ptr, &v5);
  v3 = (CGImage *)cf;
  v5 = &unk_1EF559118;
  if (cf) {
    CFRelease(cf);
  }
  return v3;
}

- (float)opacity
{
  ptr = self->_iconImage.__ptr_;
  if (ptr) {
    return *((float *)ptr + 48);
  }
  else {
    return 1.0;
  }
}

- (BOOL)isBalloonShape
{
  ptr = self->_iconImage.__ptr_;
  return ptr && *((unsigned char *)ptr + 183) && *((unsigned char *)ptr + 184) == 3;
}

- (unsigned)calloutShape
{
  ptr = self->_iconImage.__ptr_;
  if (ptr && *((unsigned char *)ptr + 183) && (unint64_t v3 = *((unsigned __int8 *)ptr + 184), v3 <= 7)) {
    return dword_1A2961D70[v3];
  }
  else {
    return 0;
  }
}

- (CGColor)calloutTextColor
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  result = self->_calloutTextColor._obj;
  if (result) {
    return result;
  }
  if (!*((unsigned char *)ptr + 148)) {
    return 0;
  }
  __int32 v9 = *(_DWORD *)((char *)ptr + 149);
  char v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_calloutTextColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  result = v7;
  self->_calloutTextColor._obj = v7;
  return result;
}

- (CGColor)calloutHaloColor
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  result = self->_calloutHaloColor._obj;
  if (result) {
    return result;
  }
  if (!*((unsigned char *)ptr + 143)) {
    return 0;
  }
  __int32 v9 = *((_DWORD *)ptr + 36);
  char v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_calloutHaloColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  result = v7;
  self->_calloutHaloColor._obj = v7;
  return result;
}

- (CGColor)calloutFillColor
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  result = self->_calloutFillColor._obj;
  if (result) {
    return result;
  }
  if (!*((unsigned char *)ptr + 138)) {
    return 0;
  }
  __int32 v9 = *(_DWORD *)((char *)ptr + 139);
  char v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_calloutFillColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  result = v7;
  self->_calloutFillColor._obj = v7;
  return result;
}

- (CGColor)glyphColor
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  result = self->_glyphColor._obj;
  if (result) {
    return result;
  }
  if (!*((unsigned char *)ptr + 158)) {
    return 0;
  }
  __int32 v9 = *(_DWORD *)((char *)ptr + 159);
  char v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_glyphColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  result = v7;
  self->_glyphColor._obj = v7;
  return result;
}

- (CGColor)haloColor
{
  ptr = self->_iconImage.__ptr_;
  if (!ptr) {
    return 0;
  }
  result = self->_haloColor._obj;
  if (result) {
    return result;
  }
  if (!*((unsigned char *)ptr + 163)) {
    return 0;
  }
  __int32 v9 = *((_DWORD *)ptr + 41);
  char v8 = 1;
  grl::createCGColor(&v9, &v6);
  obj = self->_haloColor._obj;
  if (obj) {
    CFRelease(obj);
  }
  result = v7;
  self->_haloColor._obj = v7;
  return result;
}

- (CGSize)imageSize
{
  ptr = self->_iconImage.__ptr_;
  if (ptr)
  {
    double v4 = *(float *)grl::IconMetrics::size((grl::IconMetrics *)((char *)ptr + 24));
    double v5 = *(float *)(grl::IconMetrics::size((grl::IconMetrics *)((char *)self->_iconImage.__ptr_ + 24)) + 4);
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

@end