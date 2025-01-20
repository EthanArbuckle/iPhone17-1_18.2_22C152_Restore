@interface HGInputBitmapCacheItem
- (CGSize)fullSize;
- (HGInputBitmapCacheItem)initWithHGBitmap:(void *)a3 fullSize:(CGSize)a4 colorSpace:(id)a5 gainMap:(HGRef<HGBitmap>)a6;
- (HGRef<HGBitmap>)gainMap;
- (NSDate)lastUsedTime;
- (PVColorSpace)colorSpace;
- (id).cxx_construct;
- (vector<HGRef<HGBitmap>,)bitmaps;
- (void)updateLastUsedTime;
@end

@implementation HGInputBitmapCacheItem

- (HGInputBitmapCacheItem)initWithHGBitmap:(void *)a3 fullSize:(CGSize)a4 colorSpace:(id)a5 gainMap:(HGRef<HGBitmap>)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HGInputBitmapCacheItem;
  v13 = [(HGInputBitmapCacheItem *)&v20 init];
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    uint64_t p_bitmaps = (uint64_t)&v13->_bitmaps;
    if (&v14->_bitmaps != a3) {
      std::vector<HGRef<HGBitmap>>::__assign_with_size[abi:ne180100]<HGRef<HGBitmap>*,HGRef<HGBitmap>*>(p_bitmaps, *(uint64_t **)a3, *((uint64_t **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
    }
    v15->_fullSize.CGFloat width = width;
    v15->_fullSize.CGFloat height = height;
    objc_storeStrong((id *)&v14->_colorSpace, a5);
    m_Obj = v15->_gainMap.m_Obj;
    v18 = *(HGBitmap **)a6.m_Obj;
    if (m_Obj != *(HGBitmap **)a6.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGBitmap *))(*(void *)m_Obj + 24))(v15->_gainMap.m_Obj);
        v18 = *(HGBitmap **)a6.m_Obj;
      }
      v15->_gainMap.m_Obj = v18;
      if (v18) {
        (*(void (**)(HGBitmap *))(*(void *)v18 + 16))(v18);
      }
    }
    [(HGInputBitmapCacheItem *)v15 updateLastUsedTime];
  }

  return v15;
}

- (void)updateLastUsedTime
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  lastUsedTime = self->_lastUsedTime;
  self->_lastUsedTime = v3;
}

- (vector<HGRef<HGBitmap>,)bitmaps
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<HGRef<HGBitmap>, std::allocator<HGRef<HGBitmap>>> *)std::vector<HGRef<HGBitmap>>::__init_with_size[abi:ne180100]<HGRef<HGBitmap>*,HGRef<HGBitmap>*>((uint64_t *)retstr, (uint64_t *)self->_bitmaps.__begin_, (uint64_t *)self->_bitmaps.__end_, ((char *)self->_bitmaps.__end_- (char *)self->_bitmaps.__begin_) >> 3);
}

- (NSDate)lastUsedTime
{
  return self->_lastUsedTime;
}

- (CGSize)fullSize
{
  double width = self->_fullSize.width;
  double height = self->_fullSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PVColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (HGRef<HGBitmap>)gainMap
{
  m_Obj = self->_gainMap.m_Obj;
  *v2 = m_Obj;
  if (m_Obj) {
    return (HGRef<HGBitmap>)(*(uint64_t (**)(void))(*(void *)m_Obj + 16))();
  }
  return (HGRef<HGBitmap>)m_Obj;
}

- (void).cxx_destruct
{
  uint64_t p_bitmaps = &self->_bitmaps;
  std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitmaps);
  m_Obj = self->_gainMap.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGBitmap *))(*(void *)m_Obj + 24))(m_Obj);
  }
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end