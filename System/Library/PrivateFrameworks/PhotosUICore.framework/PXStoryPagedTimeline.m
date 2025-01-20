@interface PXStoryPagedTimeline
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($7DA682ECC7253F641496E0B6E9C98204)keyPageMix;
- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3;
- (CGSize)size;
- (PXCArrayStore)transformedClipInfosStore;
- (PXCArrayStore)transformedRectsStore;
- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3;
- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3 interpageSpacing:(double)a4;
- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3 keyPage:(id *)a4 spec:(id)a5;
- (PXStoryPagedTimelineSpec)spec;
- (id)clipSizeTranformer;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)description;
- (int64_t)_bestClipIndexForSegmentWithClipInfos:(id *)a3 frames:(const CGRect *)a4 count:(int64_t)a5;
- (int64_t)_pageIndexAtX:(double)a3;
- (int64_t)numberOfPages;
- (void)_enumerateSegmentsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)_transormClips:(id *)a3 frames:(const CGRect *)a4 count:(int64_t)a5 transformHandler:(id)a6 resultHandler:(id)a7;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
@end

@implementation PXStoryPagedTimeline

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clipSizeTranformer, 0);
  objc_storeStrong((id *)&self->_transformedRectsStore, 0);
  objc_storeStrong((id *)&self->_transformedClipInfosStore, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (id)clipSizeTranformer
{
  return self->_clipSizeTranformer;
}

- (PXCArrayStore)transformedRectsStore
{
  return self->_transformedRectsStore;
}

- (PXCArrayStore)transformedClipInfosStore
{
  return self->_transformedClipInfosStore;
}

- (PXStoryPagedTimelineSpec)spec
{
  return self->_spec;
}

- ($7DA682ECC7253F641496E0B6E9C98204)keyPageMix
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = ($BC569A352189BBB700BC3B7A67A9BAFC)self[3];
  return self;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var1;
  return self;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  int64_t v4 = [(PXStoryDerivedTimeline *)self indexOfSegmentWithIdentifier:a3];
  [(PXStoryPagedTimeline *)self keyPageMix];
  v5 = &v16;
  if (v15 <= 0.5) {
    v5 = (uint64_t *)&v14;
  }
  if (*v5)
  {
    [(PXStoryPagedTimeline *)self keyPageMix];
    int64_t v6 = [(PXStoryDerivedTimeline *)self indexOfSegmentWithIdentifier:v13];
    [(PXStoryPagedTimeline *)self keyPageMix];
    int64_t v7 = [(PXStoryDerivedTimeline *)self indexOfSegmentWithIdentifier:v12];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4 == v6 || v4 == v7) {
      [(PXStoryPagedTimeline *)self keyPageMix];
    }
    PXClamp();
  }
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v6 = a5;
  [(PXStoryDerivedTimeline *)self originalTimeline];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXRectWithOriginAndSize();
}

void __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, long long *a3, long long *a4)
{
  if (*(unsigned char *)(a1 + 136))
  {
    [*(id *)(a1 + 32) frameForSegmentWithIdentifier:a2];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F1DB28];
    uint64_t v10 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v15 = *(void **)(a1 + 40);
  long long v16 = *a3;
  long long v17 = a3[2];
  v31[1] = a3[1];
  v31[2] = v17;
  long long v18 = *(_OWORD *)(a1 + 104);
  v30[0] = *(_OWORD *)(a1 + 88);
  v30[1] = v18;
  v30[2] = *(_OWORD *)(a1 + 120);
  v31[0] = v16;
  PXStoryTimeRangeIntersection(v31, v30, v32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v20[3] = &unk_1E5DB0078;
  char v29 = *(unsigned char *)(a1 + 136);
  v20[4] = *(void *)(a1 + 32);
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  uint64_t v25 = v14;
  long long v19 = a4[1];
  long long v26 = *a4;
  long long v27 = v19;
  long long v28 = a4[2];
  id v21 = *(id *)(a1 + 48);
  objc_msgSend(v15, "enumerateClipsInTimeRange:rect:usingBlock:", v32, v20, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v12 = *(unsigned char *)(a1 + 128);
  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) _bestClipIndexForSegmentWithClipInfos:a5 frames:a4 count:a2];
    char v12 = *(unsigned char *)(a1 + 128);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void **)(a1 + 32);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  long long v15 = *(_OWORD *)(a1 + 64);
  long long v23 = *(_OWORD *)(a1 + 48);
  long long v24 = v15;
  long long v16 = *(_OWORD *)(a1 + 96);
  long long v25 = *(_OWORD *)(a1 + 80);
  v22[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_3;
  v22[3] = &__block_descriptor_121_e73__CGRect__CGPoint_dd__CGSize_dd__48__0_CGRect__CGPoint_dd__CGSize_dd__8q40l;
  char v28 = v12;
  v22[4] = v13;
  long long v26 = v16;
  long long v27 = *(_OWORD *)(a1 + 112);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_4;
  v17[3] = &unk_1E5DB0050;
  id v18 = *(id *)(a1 + 40);
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v21 = a6;
  [v14 _transormClips:a5 frames:a4 count:a2 transformHandler:v22 resultHandler:v17];
}

double __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  if (*(unsigned char *)(a1 + 120))
  {
    if (*(void *)(a1 + 32) == a2) {
      return *(double *)(a1 + 40);
    }
    else {
      return *MEMORY[0x1E4F1DB28];
    }
  }
  else
  {
    long long v7 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&v8.c = v7;
    *(_OWORD *)&v8.tx = *(_OWORD *)(a1 + 104);
    *(void *)&double result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a3, &v8);
  }
  return result;
}

uint64_t __66__PXStoryPagedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_4(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], a1[6], a3, a2, a1[7]);
}

- (id)clipWithIdentifier:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXStoryPagedTimeline;
  int64_t v4 = [(PXStoryDerivedTimeline *)&v12 clipWithIdentifier:a3];
  v5 = v4;
  memset(__src, 0, 512);
  if (v4) {
    [v4 info];
  }
  else {
    bzero(__src, 0x300uLL);
  }
  id v6 = [(PXStoryPagedTimeline *)self clipSizeTranformer];
  __src[1].receiver = COERCE_ID(v6[2](*(double *)&__src[1].receiver, *(double *)&__src[1].super_class));
  __src[1].super_class = v7;

  memcpy(v10, __src, sizeof(v10));
  CGAffineTransform v8 = (void *)[v5 copyWithInfo:v10];

  return v8;
}

- (void)_transormClips:(id *)a3 frames:(const CGRect *)a4 count:(int64_t)a5 transformHandler:(id)a6 resultHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [(PXStoryPagedTimeline *)self clipSizeTranformer];
  long long v15 = [(PXStoryPagedTimeline *)self transformedClipInfosStore];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke;
  v19[3] = &unk_1E5DB0008;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a5;
  long long v24 = a4;
  long long v25 = a3;
  id v21 = v14;
  id v22 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  [v15 accessArrayWithElementsCount:a5 accessBlock:v19];
}

void __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int64_t v4 = [*(id *)(a1 + 32) transformedRectsStore];
  uint64_t v5 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke_2;
  v9[3] = &unk_1E5DAFFE0;
  uint64_t v13 = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  id v10 = v6;
  uint64_t v14 = v7;
  uint64_t v15 = a2;
  uint64_t v16 = v8;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v4 accessArrayWithElementsCount:v5 accessBlock:v9];
}

uint64_t __83__PXStoryPagedTimeline__transormClips_frames_count_transformHandler_resultHandler___block_invoke_2(void *a1, uint64_t a2)
{
  if ((uint64_t)a1[7] >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 24;
    do
    {
      uint64_t v7 = (double *)(a2 + v6);
      *(v7 - 3) = (*(double (**)(double, double, double, double))(a1[4] + 16))(*(double *)(a1[8] + v6 - 24), *(double *)(a1[8] + v6 - 16), *(double *)(a1[8] + v6 - 8), *(double *)(a1[8] + v6));
      *((void *)v7 - 2) = v8;
      *((void *)v7 - 1) = v9;
      *(void *)uint64_t v7 = v10;
      memcpy((void *)(a1[9] + v4), (const void *)(a1[10] + v4), 0x300uLL);
      uint64_t v11 = a1[9] + v4;
      *(double *)(v11 + 16) = (*(double (**)(double, double))(a1[5] + 16))(*(double *)(v11 + 16), *(double *)(v11 + 24));
      *(void *)(v11 + 24) = v12;
      ++v5;
      v4 += 768;
      v6 += 32;
    }
    while (v5 < a1[7]);
  }
  uint64_t v13 = *(uint64_t (**)(void))(a1[6] + 16);
  return v13();
}

- (int64_t)_bestClipIndexForSegmentWithClipInfos:(id *)a3 frames:(const CGRect *)a4 count:(int64_t)a5
{
  if (a5 < 2) {
    return 0;
  }
  int64_t v31 = 0;
  int64_t v7 = 0;
  int64_t v8 = 0;
  uint64_t v9 = 0;
  p_size = &a4->size;
  double v11 = 0.0;
  p_var1 = &a3->var1;
  double v13 = 0.0;
  do
  {
    if (*p_var1 == 1)
    {
      CGFloat width = p_size[-1].width;
      CGFloat height = p_size[-1].height;
      CGFloat v16 = p_size->width;
      CGFloat v17 = p_size->height;
      v32.origin.x = width;
      v32.origin.y = height;
      v32.size.CGFloat width = p_size->width;
      v32.size.CGFloat height = v17;
      double v18 = CGRectGetWidth(v32);
      v33.origin.x = width;
      v33.origin.y = height;
      v33.size.CGFloat width = v16;
      v33.size.CGFloat height = v17;
      double v19 = v18 * CGRectGetHeight(v33);
      if (v19 > v11)
      {
        ++v9;
        int64_t v7 = v8;
        double v11 = v19;
      }
      if (v9 <= 1)
      {
        id v20 = [(PXStoryPagedTimeline *)self clipWithIdentifier:*(p_var1 - 1)];
        id v21 = [v20 resource];
        id v22 = objc_msgSend(v21, "px_storyResourceDisplayAsset");

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v22;
          [v23 overallAestheticScore];
          double v25 = v24;
          [v23 curationScore];
          double v27 = v26;

          BOOL v28 = v27 + v25 <= v13;
          if (v27 + v25 > v13) {
            double v13 = v27 + v25;
          }
          int64_t v29 = v31;
          if (!v28) {
            int64_t v29 = v8;
          }
          int64_t v31 = v29;
        }
      }
    }
    p_var1 += 96;
    ++v8;
    p_size += 2;
  }
  while (a5 != v8);
  if (v9 <= 1) {
    return v31;
  }
  else {
    return v7;
  }
}

- (void)_enumerateSegmentsInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v9 = a4;
  uint64_t v10 = [(PXStoryDerivedTimeline *)self originalTimeline];
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  int64_t v11 = [(PXStoryPagedTimeline *)self _pageIndexAtX:CGRectGetMinX(v30)];
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  int64_t v12 = [(PXStoryPagedTimeline *)self _pageIndexAtX:CGRectGetMaxX(v31)];
  if (v11 <= v12)
  {
    int64_t v13 = v12;
    if (v11 < 0) {
      goto LABEL_8;
    }
LABEL_4:
    if (v11 >= [(PXStoryPagedTimeline *)self numberOfPages]) {
      goto LABEL_8;
    }
    uint64_t v14 = [v10 identifierForSegmentAtIndex:v11];
    memset(&v29, 0, sizeof(v29));
    if (v10) {
      [v10 timeRangeForSegmentWithIdentifier:v14];
    }
    [(PXStoryPagedTimeline *)self frameForSegmentWithIdentifier:v14];
    double v15 = v32.size.width;
    double v16 = v32.size.height;
    CGFloat MinX = CGRectGetMinX(v32);
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeTranslation(&v28, MinX, 0.0);
    double v18 = [(PXStoryDerivedTimeline *)self originalTimeline];
    [v18 size];
    double v20 = v19;
    double v22 = v21;

    CGAffineTransform v26 = v28;
    CGAffineTransformScale(&v27, &v26, v15 / v20, v16 / v22);
    CGAffineTransform v28 = v27;
    id v23 = (void (*)(void *, uint64_t, CGAffineTransform *, CGAffineTransform *, char *))v9[2];
    long long v24 = *(_OWORD *)&v27.tx;
    CGAffineTransform v27 = v29;
    *(_OWORD *)&v26.a = *(_OWORD *)&v28.a;
    *(_OWORD *)&v26.c = *(_OWORD *)&v28.c;
    char v25 = 0;
    *(_OWORD *)&v26.tCGFloat x = v24;
    v23(v9, v14, &v27, &v26, &v25);
    if (!v25)
    {
LABEL_8:
      while (v13 != v11)
      {
        if ((++v11 & 0x8000000000000000) == 0) {
          goto LABEL_4;
        }
      }
    }
  }
}

- (int64_t)_pageIndexAtX:(double)a3
{
  uint64_t v5 = [(PXStoryPagedTimeline *)self spec];
  [v5 regularPageSize];
  double v7 = v6;
  int64_t v8 = [(PXStoryPagedTimeline *)self spec];
  [v8 regularInterpageSpacing];
  double v10 = v7 + v9;

  [(PXStoryPagedTimeline *)self keyPageMix];
  int64_t v11 = &v30;
  if (v29 <= 0.5) {
    int64_t v11 = (uint64_t *)&v28;
  }
  if (!*v11) {
    return (uint64_t)(a3 / v10);
  }
  [(PXStoryPagedTimeline *)self keyPageMix];
  int64_t v12 = &v27;
  if (v26 <= 0.5) {
    int64_t v12 = &v25;
  }
  uint64_t v13 = *v12;
  -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](self, "frameForSegmentWithIdentifier:", *v12, v26);
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  if (CGRectGetMinX(v31) > a3) {
    return (uint64_t)(a3 / v10);
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (CGRectGetMaxX(v32) > a3) {
    return [(PXStoryDerivedTimeline *)self indexOfSegmentWithIdentifier:v13];
  }
  double v19 = [(PXStoryPagedTimeline *)self spec];
  [v19 keyPageSize];
  double v21 = v20;
  double v22 = [(PXStoryPagedTimeline *)self spec];
  [v22 keyInterpageSpacing];
  double v24 = v21 + v23;

  return (uint64_t)((a3 - v24) / v10) + 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(PXStoryPagedTimeline *)self numberOfPages];
  [(PXStoryPagedTimeline *)self size];
  double v7 = NSStringFromCGSize(v12);
  int64_t v8 = [(PXStoryDerivedTimeline *)self originalTimeline];
  double v9 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; Pages: %ld; Size: %@; Original Timeline:\n\t%@>",
                 v5,
                 self,
                 v6,
                 v7,
                 v8);

  return v9;
}

- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3 keyPage:(id *)a4 spec:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v49.receiver = self;
  v49.super_class = (Class)PXStoryPagedTimeline;
  double v10 = [(PXStoryDerivedTimeline *)&v49 initWithOriginalTimeline:v8];
  int64_t v11 = v10;
  if (v10)
  {
    p_spec = (id *)&v10->_spec;
    objc_storeStrong((id *)&v10->_spec, a5);
    int64_t var2 = a4->var2;
    *(_OWORD *)&v11->_keyPageMix.firstSegmentIdentifier = *(_OWORD *)&a4->var0;
    v11->_keyPageMix.secondSegmentIdentifier = var2;
    *(_OWORD *)&start.value = PXStoryTimeZero;
    start.epoch = 0;
    *(_OWORD *)&duration.value = PXStoryTimeMaximum;
    duration.epoch = 0;
    CMTimeRangeMake(&v48, &start, &duration);
    long long v14 = *(_OWORD *)&v48.start.value;
    long long v15 = *(_OWORD *)&v48.duration.timescale;
    *(_OWORD *)&v11->_timeRange.start.epoch = *(_OWORD *)&v48.start.epoch;
    *(_OWORD *)&v11->_timeRange.duration.timescale = v15;
    *(_OWORD *)&v11->_timeRange.start.value = v14;
    uint64_t v16 = [v8 numberOfSegments];
    v11->_numberOfPages = v16;
    double v17 = (double)(v16 - 1);
    [v9 regularPageSize];
    double v19 = v18;
    [v9 regularInterpageSpacing];
    double v21 = v19 + v20;
    [v9 regularInterpageSpacing];
    double v23 = -(v22 - v17 * v21);
    [v9 keyPageSize];
    double v25 = v24;
    [v9 keyInterpageSpacing];
    v11->_size.CGFloat width = v23 + v25 + v26 * 2.0;
    [v9 keyPageSize];
    v11->_size.CGFloat height = v27;
    uint64_t v28 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:768];
    transformedClipInfosStore = v11->_transformedClipInfosStore;
    v11->_transformedClipInfosStore = (PXCArrayStore *)v28;

    uint64_t v30 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:32];
    transformedRectsStore = v11->_transformedRectsStore;
    v11->_transformedRectsStore = (PXCArrayStore *)v30;

    if ([*p_spec displayOneAssetPerPage])
    {
      [*p_spec regularPageSize];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke;
      v47[3] = &__block_descriptor_48_e28__CGSize_dd_24__0_CGSize_dd_8l;
      v47[4] = v32;
      v47[5] = v33;
      v34 = v47;
    }
    else
    {
      v35 = [(PXStoryDerivedTimeline *)v11 originalTimeline];
      [v35 size];
      double v37 = v36;
      double v39 = v38;

      [*p_spec regularPageSize];
      memset(&v48, 0, sizeof(v48));
      CGAffineTransformMakeScale((CGAffineTransform *)&v48, v40 / v37, v41 / v39);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke_2;
      v45[3] = &__block_descriptor_80_e28__CGSize_dd_24__0_CGSize_dd_8l;
      CMTimeRange v46 = v48;
      v34 = v45;
    }
    v42 = _Block_copy(v34);
    id clipSizeTranformer = v11->_clipSizeTranformer;
    v11->_id clipSizeTranformer = v42;
  }
  return v11;
}

double __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __62__PXStoryPagedTimeline_initWithOriginalTimeline_keyPage_spec___block_invoke_2(uint64_t a1, double a2, double a3)
{
  return a3 * *(double *)(a1 + 48) + *(double *)(a1 + 32) * a2;
}

- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3 interpageSpacing:(double)a4
{
  id v6 = a3;
  double v7 = objc_alloc_init(PXStoryPagedTimelineSpec);
  [(PXStoryPagedTimelineSpec *)v7 setRegularInterpageSpacing:a4];
  [v6 size];
  -[PXStoryPagedTimelineSpec setRegularPageSize:](v7, "setRegularPageSize:");
  [(PXStoryPagedTimelineSpec *)v7 setKeyInterpageSpacing:a4];
  [v6 size];
  -[PXStoryPagedTimelineSpec setKeyPageSize:](v7, "setKeyPageSize:");
  [(PXStoryPagedTimelineSpec *)v7 setDisplayOneAssetPerPage:0];
  memset(v10, 0, sizeof(v10));
  id v8 = [(PXStoryPagedTimeline *)self initWithOriginalTimeline:v6 keyPage:v10 spec:v7];

  return v8;
}

- (PXStoryPagedTimeline)initWithOriginalTimeline:(id)a3
{
  return [(PXStoryPagedTimeline *)self initWithOriginalTimeline:a3 interpageSpacing:0.0];
}

@end