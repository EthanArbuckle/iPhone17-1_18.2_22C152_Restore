@interface PKPhysicsGrid
+ (id)gridFromOccupancyArray:(const char *)a3 bytePitch:(int)a4 width:(int)a5 height:(int)a6;
+ (id)gridFromRGBAU8PixelData:(const char *)a3 imageWidth:(int)a4 imageHeight:(int)a5 alphaThreshold:(float)a6 accuracy:(float)a7;
+ (id)vectorGridFromRGBAU8PixelData:(const char *)a3 imageWidth:(int)a4 imageHeight:(int)a5 accuracy:(float)a6;
- (BOOL)isGridRegionOccupied:(int)a3 y:(int)a4 width:(int)a5 height:(int)a6;
- (id).cxx_construct;
- (id)physicsBodyFromLVS0:(CGRect)a3;
- (id)physicsBodyFromSmoothedOutline:(double)a3 size:(CGSize)a4;
- (int)height;
- (int)width;
- (shared_ptr<PKCGrid>)gridPtr;
- (shared_ptr<PKPath>)pathFromOutlineWithSmoothingThreshold:(double)a3 bounds:(id)a4;
- (unsigned)gridDataAtX:(int)a3 y:(int)a4 z:(int)a5;
- (void)setGridPtr:(shared_ptr<PKCGrid>)a3;
@end

@implementation PKPhysicsGrid

+ (id)gridFromOccupancyArray:(const char *)a3 bytePitch:(int)a4 width:(int)a5 height:(int)a6
{
  v10 = objc_alloc_init(PKPhysicsGrid);
  _ZNSt3__115allocate_sharedB8ne180100I7PKCGridNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v14);
  shared_ptr<PKCGrid> v11 = v14;
  shared_ptr<PKCGrid> v14 = (shared_ptr<PKCGrid>)0;
  cntrl = (std::__shared_weak_count *)v10->grid.__cntrl_;
  v10->grid = v11;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    if (v14.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14.__cntrl_);
    }
  }
  PKCGrid::setGridSize(v10->grid.__ptr_, a5, a6, 1);
  PKCGrid::setData(v10->grid.__ptr_, (const unsigned __int8 *)a3, a4, a6 * a5);

  return v10;
}

+ (id)gridFromRGBAU8PixelData:(const char *)a3 imageWidth:(int)a4 imageHeight:(int)a5 alphaThreshold:(float)a6 accuracy:(float)a7
{
  v12 = objc_alloc_init(PKPhysicsGrid);
  _ZNSt3__115allocate_sharedB8ne180100I7PKCGridNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v16);
  shared_ptr<PKCGrid> v13 = v16;
  shared_ptr<PKCGrid> v16 = (shared_ptr<PKCGrid>)0;
  cntrl = (std::__shared_weak_count *)v12->grid.__cntrl_;
  v12->grid = v13;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    if (v16.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16.__cntrl_);
    }
  }
  PKCGrid::setGridSize(v12->grid.__ptr_, (int)(float)((float)a4 * a7), (int)(float)((float)a5 * a7), 1);
  PKCGrid::tagPixelData(v12->grid.__ptr_, a6, (const unsigned __int8 *)a3, a4, a5);

  return v12;
}

+ (id)vectorGridFromRGBAU8PixelData:(const char *)a3 imageWidth:(int)a4 imageHeight:(int)a5 accuracy:(float)a6
{
  v9 = objc_alloc_init(PKPhysicsGrid);
  _ZNSt3__115allocate_sharedB8ne180100I7PKCGridNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v13);
  shared_ptr<PKCGrid> v10 = v13;
  shared_ptr<PKCGrid> v13 = (shared_ptr<PKCGrid>)0;
  cntrl = (std::__shared_weak_count *)v9->grid.__cntrl_;
  v9->grid = v10;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    if (v13.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13.__cntrl_);
    }
  }
  PKCGrid::setGridSize(v9->grid.__ptr_, a4, a5, 1);
  PKCGrid::setVectorData(v9->grid.__ptr_, (const unsigned __int8 *)a3, a4, a5);

  return v9;
}

- (BOOL)isGridRegionOccupied:(int)a3 y:(int)a4 width:(int)a5 height:(int)a6
{
  return PKCGrid::isGridRegionOccupied(self->grid.__ptr_, (float)a3, (float)a4, (float)a5, (float)a6);
}

- (unsigned)gridDataAtX:(int)a3 y:(int)a4 z:(int)a5
{
  if ((a4 | a3 | a5) < 0) {
    return 0;
  }
  ptr = self->grid.__ptr_;
  if (*(_DWORD *)ptr <= a3 || *((_DWORD *)ptr + 1) <= a4 || *((_DWORD *)ptr + 2) <= a5) {
    return 0;
  }
  else {
    return *(unsigned char *)(*((void *)ptr + 5) + a3 + *(_DWORD *)ptr * a4);
  }
}

- (id)physicsBodyFromSmoothedOutline:(double)a3 size:(CGSize)a4
{
  CGSize v7 = a4;
  float v4 = a3;
  v5 = PKCGrid::physicsBodyFromSmoothedOutline(self->grid.__ptr_, v4, (float64x2_t *)&v7);

  return v5;
}

- (shared_ptr<PKPath>)pathFromOutlineWithSmoothingThreshold:(double)a3 bounds:(id)a4
{
  float v5 = a3;
  PKCGrid::pathFromOutlineWithSmoothingThreshold(self->grid.__ptr_, v5, LODWORD(a4.var0.var0), LODWORD(a4.var0.var1), LODWORD(a4.var1.var0), LODWORD(a4.var1.var1), v4);
  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (id)physicsBodyFromLVS0:(CGRect)a3
{
  return +[PKPhysicsBody initWithMarchingCubes:pixelFrame:](PKPhysicsBody, "initWithMarchingCubes:pixelFrame:", self->grid.__ptr_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)width
{
  return *(_DWORD *)self->grid.__ptr_;
}

- (int)height
{
  return *((_DWORD *)self->grid.__ptr_ + 1);
}

- (shared_ptr<PKCGrid>)gridPtr
{
  cntrl = self->grid.__cntrl_;
  *v2 = self->grid.__ptr_;
  v2[1] = (PKCGrid *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKCGrid *)self;
  return result;
}

- (void)setGridPtr:(shared_ptr<PKCGrid>)a3
{
  float v4 = *(PKCGrid **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->grid.__cntrl_;
  self->grid.__ptr_ = v4;
  self->grid.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->quadTree, 0);
  cntrl = self->grid.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end