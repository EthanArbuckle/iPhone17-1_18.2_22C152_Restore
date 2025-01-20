@interface PXStoryMultipartPanoramaCropFinder
- (NSArray)saliencyAreas;
- (PXStoryMultipartPanoramaCropFinder)init;
- (PXStoryMultipartPanoramaCropFinder)initWithSaliencyAreas:(id)a3;
- (double)_scoreContentsRects:(const CGRect *)a3 count:(int64_t)a4;
- (id)bestCropContentsRectsWithAspectRatio:(double)a3 axis:(int64_t)a4;
- (int64_t)_findBestRectsWithMaximumCount:(int64_t)a3 aspectRatio:(double)a4;
- (void)_enumeratePossibleContentsRects:(CGRect *)a3 count:(int64_t)a4 usingBlock:(id)a5;
- (void)dealloc;
@end

@implementation PXStoryMultipartPanoramaCropFinder

- (void).cxx_destruct
{
}

- (NSArray)saliencyAreas
{
  return self->_saliencyAreas;
}

- (double)_scoreContentsRects:(const CGRect *)a3 count:(int64_t)a4
{
  if (a4 >= 1) {
    PXRectGetMinForAxis();
  }
  return 0.0;
}

- (void)_enumeratePossibleContentsRects:(CGRect *)a3 count:(int64_t)a4 usingBlock:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a4 <= 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStoryMultipartPanoramaCropFinder.m", 91, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  CGSize size = self->_referenceContentsRect.size;
  CGPoint origin = self->_referenceContentsRect.origin;
  CGSize v12 = size;
  PXSizeValueForAxis();
}

- (int64_t)_findBestRectsWithMaximumCount:(int64_t)a3 aspectRatio:(double)a4
{
  CGSize v6 = (CGSize)*((_OWORD *)off_1E5DAB010 + 1);
  self->_referenceContentsRect.CGPoint origin = *(CGPoint *)off_1E5DAB010;
  self->_referenceContentsRect.CGSize size = v6;
  if (self->_axis == 2) {
    self->_referenceContentsRect.size.width = self->_referenceContentsRect.size.height * a4;
  }
  else {
    self->_referenceContentsRect.size.height = self->_referenceContentsRect.size.width / a4;
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0xC12E848000000000;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (a3 < 1)
  {
    int64_t v10 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    do
    {
      ++v7;
      possibleRects = self->_possibleRects;
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __81__PXStoryMultipartPanoramaCropFinder__findBestRectsWithMaximumCount_aspectRatio___block_invoke;
      v12[3] = &unk_1E5DCCCF8;
      v12[4] = self;
      v12[5] = v17;
      v12[6] = &v13;
      v12[7] = v7;
      [(PXStoryMultipartPanoramaCropFinder *)self _enumeratePossibleContentsRects:possibleRects count:v7 usingBlock:v12];
    }
    while (a3 != v7);
    int64_t v10 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  return v10;
}

void *__81__PXStoryMultipartPanoramaCropFinder__findBestRectsWithMaximumCount_aspectRatio___block_invoke(uint64_t a1)
{
  result = (void *)[*(id *)(a1 + 32) _scoreContentsRects:*(void *)(*(void *)(a1 + 32) + 8) count:*(void *)(a1 + 56)];
  double v4 = v3;
  if (v3 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    result = memcpy(*(void **)(*(void *)(a1 + 32) + 16), *(const void **)(*(void *)(a1 + 32) + 8), 32 * *(void *)(a1 + 56));
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 56);
  }
  return result;
}

- (id)bestCropContentsRectsWithAspectRatio:(double)a3 axis:(int64_t)a4
{
  double v4 = +[PXStoryMultipartPanoramaSettings sharedInstance];
  [v4 maximumNumberOfParts];

  _PXGArrayCapacityResizeToCount();
}

- (void)dealloc
{
  free(self->_possibleRects);
  free(self->_bestRects);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMultipartPanoramaCropFinder;
  [(PXStoryMultipartPanoramaCropFinder *)&v3 dealloc];
}

- (PXStoryMultipartPanoramaCropFinder)initWithSaliencyAreas:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMultipartPanoramaCropFinder;
  v5 = [(PXStoryMultipartPanoramaCropFinder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    saliencyAreas = v5->_saliencyAreas;
    v5->_saliencyAreas = (NSArray *)v6;
  }
  return v5;
}

- (PXStoryMultipartPanoramaCropFinder)init
{
  return [(PXStoryMultipartPanoramaCropFinder *)self initWithSaliencyAreas:0];
}

@end