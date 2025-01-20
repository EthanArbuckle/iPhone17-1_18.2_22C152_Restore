@interface PXStoryMutableConcreteTimeline
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_appendSegmentFromTimeline:(id)a3 withIdentifier:(int64_t)a4;
- (int64_t)addClipWithTimeRange:(id *)a3 frame:(CGRect)a4 info:(id *)a5 resourceIndex:(int64_t)a6;
- (int64_t)addSegmentWithTimeRange:(id *)a3 info:(id *)a4;
- (int64_t)appendSegmentWithDurationInfo:(id *)a3 clipCount:(int64_t)a4 compositionInfo:(id *)a5 configuration:(id)a6;
- (int64_t)insertClipInTimeRange:(id *)a3 resourceKind:(int64_t)a4 options:(unint64_t)a5 resourceIndex:(int64_t)a6 frame:(CGRect)a7 transitionInfo:(id *)a8 kenBurnsAnimationInfo:(id *)a9;
- (void)appendTimeRange:(id *)a3 fromTimeline:(id)a4;
- (void)appendTimeline:(id)a3;
- (void)dealloc;
- (void)modifyInfoForSegmentAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)modifyOptionsForClipWithIdentifier:(int64_t)a3 hintIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)removeAllClipsAndSegments;
- (void)setStartTime:(id *)a3;
- (void)setTimeline:(id)a3;
@end

@implementation PXStoryMutableConcreteTimeline

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXStoryConcreteTimeline alloc];
  return [(PXStoryConcreteTimeline *)v4 initWithTimeline:self];
}

- (void)setStartTime:(id *)a3
{
  if ([(PXStoryConcreteTimeline *)self numberOfClips]
    || [(PXStoryConcreteTimeline *)self numberOfSegments])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXStoryConcreteTimeline.m" lineNumber:726 description:@"currently only supporting changing the start time for an empty timeline"];
  }
  [(PXStoryConcreteTimeline *)self timeRange];
  CMTime duration = v8;
  CMTime start = (CMTime)*a3;
  CMTimeRangeMake(&v9, &start, &duration);
  long long v6 = *(_OWORD *)&v9.start.epoch;
  *(_OWORD *)&self->super._timeRange.start.value = *(_OWORD *)&v9.start.value;
  *(_OWORD *)&self->super._timeRange.start.epoch = v6;
  *(_OWORD *)&self->super._timeRange.duration.timescale = *(_OWORD *)&v9.duration.timescale;
}

- (void)removeAllClipsAndSegments
{
  v2 = self;
  [(PXStoryConcreteTimeline *)self setNumberOfClips:0];
  [(PXStoryConcreteTimeline *)v2 setNumberOfSegments:0];
  v2 = (PXStoryMutableConcreteTimeline *)((char *)v2 + 8);
  *(_OWORD *)&start.value = PXStoryTimeZero;
  start.epoch = 0;
  *(_OWORD *)&duration.value = PXStoryTimeZero;
  duration.epoch = 0;
  CMTimeRangeMake(&v4, &start, &duration);
  long long v3 = *(_OWORD *)&v4.start.epoch;
  *(_OWORD *)&v2->super.super.super.isa = *(_OWORD *)&v4.start.value;
  *(_OWORD *)&v2->super._timeRange.start.timescale = v3;
  *(_OWORD *)&v2->super._timeRange.duration.value = *(_OWORD *)&v4.duration.timescale;
}

- (void)modifyOptionsForClipWithIdentifier:(int64_t)a3 hintIndex:(int64_t)a4 usingBlock:(id)a5
{
  CMTimeRange v9 = (void (**)(id, unint64_t *))a5;
  int64_t v10 = [(PXStoryConcreteTimeline *)self numberOfClips];
  if (a4 < 0 || v10 <= a4 || *(&self->super._clipInfos->var0 + 96 * a4) != a3) {
    PXAssertGetLog();
  }
  if (a4 >= v10)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimeline.m", 715, @"no clip found with identifier %li", a3);
  }
  v9[2](v9, &self->super._clipInfos->var3 + 96 * a4);
}

- (int64_t)addClipWithTimeRange:(id *)a3 frame:(CGRect)a4 info:(id *)a5 resourceIndex:(int64_t)a6
{
}

BOOL __80__PXStoryMutableConcreteTimeline_addClipWithTimeRange_frame_info_resourceIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4 = *(CMTimeRange *)(*(void *)(*(void *)(a1 + 32) + 64)
                      + 48 * *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 8 * a2));
  CMTimeRange range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  *(_OWORD *)&v4.start.value = *(_OWORD *)(a1 + 40);
  v4.start.epoch = *(void *)(a1 + 56);
  range.CMTime start = v5;
  return CMTimeCompare(&range.start, &v4.start) > 0;
}

BOOL __80__PXStoryMutableConcreteTimeline_addClipWithTimeRange_frame_info_resourceIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4 = *(CMTimeRange *)(*(void *)(*(void *)(a1 + 32) + 64)
                      + 48 * *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 8 * a2));
  long long v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.epoch = v2;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 72);
  CMTimeRangeGetEnd(&v6, &range);
  CMTimeRange range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  range.CMTime start = v6;
  v4.CMTime start = v5;
  return CMTimeCompare(&range.start, &v4.start) < 1;
}

- (int64_t)insertClipInTimeRange:(id *)a3 resourceKind:(int64_t)a4 options:(unint64_t)a5 resourceIndex:(int64_t)a6 frame:(CGRect)a7 transitionInfo:(id *)a8 kenBurnsAnimationInfo:(id *)a9
{
  memset(v31, 0, sizeof(v31));
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v75[8] = a3->var1;
  *(void *)v75 = 0;
  long long v74 = PXStoryTimeZero;
  memset(v77, 0, 40);
  long long v76 = PXStoryTimeMaximum;
  signed int add = atomic_fetch_add(PXStoryClipIdentifierMakeUnique_uniqueIdentifier, 1u);
  long long v26 = v76;
  long long v27 = v77[0];
  long long v28 = v77[1];
  uint64_t v29 = *(void *)&v77[2];
  long long v23 = v74;
  long long v24 = *(_OWORD *)v75;
  long long v25 = *(_OWORD *)&v75[16];
  long long v10 = *(_OWORD *)&a9->var0.var0.a;
  long long v11 = *(_OWORD *)&a9->var0.var0.c;
  long long v12 = *(_OWORD *)&a9->var1.var0.a;
  long long v60 = *(_OWORD *)&a9->var0.var0.tx;
  long long v61 = v12;
  long long v58 = v10;
  long long v59 = v11;
  int64_t var3 = a9->var2.var3;
  long long v14 = *(_OWORD *)&a9->var1.var0.c;
  long long v15 = *(_OWORD *)&a9->var2.var0;
  long long v63 = *(_OWORD *)&a9->var1.var0.tx;
  long long v64 = v15;
  long long v62 = v14;
  int64_t v65 = var3;
  long long v16 = *(_OWORD *)&a8->var0;
  long long v17 = *(_OWORD *)&a8->var2.var1;
  uint64_t v68 = *(void *)&a8->var3;
  long long v66 = v16;
  long long v67 = v17;
  long long v35 = xmmword_1AB35D0C0;
  long long v36 = xmmword_1AB35D0D0;
  long long v33 = PXStoryAssetContentInfoNull;
  long long v34 = xmmword_1AB35D0B0;
  long long v39 = xmmword_1AB35D100;
  long long v40 = xmmword_1AB35D110;
  long long v37 = xmmword_1AB35D0E0;
  long long v38 = xmmword_1AB35D0F0;
  long long v18 = *(_OWORD *)&a3->var0.var3;
  v73[0] = *(_OWORD *)&a3->var0.var0;
  v73[1] = v18;
  v73[2] = *(_OWORD *)&a3->var1.var1;
  v22[0] = add;
  v22[1] = a4;
  v22[2] = *(void *)&a7.size.width;
  v22[3] = *(void *)&a7.size.height;
  v22[4] = a5;
  char v30 = 0;
  uint64_t v32 = 0;
  long long v19 = *(_OWORD *)off_1E5DAAF10;
  long long v20 = *((_OWORD *)off_1E5DAAF10 + 1);
  long long v41 = xmmword_1AB35D120;
  long long v42 = v19;
  uint64_t v57 = 0;
  long long v43 = v20;
  long long v44 = PXStoryClippingAnimationInfoNone;
  long long v47 = unk_1AB35D160;
  long long v48 = xmmword_1AB35D170;
  long long v45 = unk_1AB35D140;
  long long v46 = xmmword_1AB35D150;
  long long v51 = unk_1AB35D1A0;
  long long v52 = xmmword_1AB35D1B0;
  long long v49 = unk_1AB35D180;
  long long v50 = xmmword_1AB35D190;
  long long v55 = xmmword_1AB35D1E0;
  long long v56 = xmmword_1AB35D1F0;
  long long v53 = xmmword_1AB35D1C0;
  long long v54 = xmmword_1AB35D1D0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  uint64_t v72 = 0;
  return -[PXStoryMutableConcreteTimeline addClipWithTimeRange:frame:info:resourceIndex:](self, "addClipWithTimeRange:frame:info:resourceIndex:", v73, v22, a6, a7.origin.x, a7.origin.y);
}

- (void)setTimeline:(id)a3
{
  id v4 = a3;
  [(PXStoryMutableConcreteTimeline *)self removeAllClipsAndSegments];
  [(PXStoryMutableConcreteTimeline *)self appendTimeline:v4];
}

- (int64_t)_appendSegmentFromTimeline:(id)a3 withIdentifier:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  memset(v38, 0, sizeof(v38));
  long long v37 = 0u;
  if (v6)
  {
    [v6 timeRangeForSegmentWithIdentifier:a4];
    *(_OWORD *)&v34[8] = *(_OWORD *)((char *)v38 + 8);
    *(void *)&v34[24] = *((void *)&v38[1] + 1);
    *(void *)long long v34 = 0;
    long long v33 = PXStoryTimeZero;
    memset(v36, 0, 40);
    long long v35 = PXStoryTimeMaximum;
    [v7 infoForSegmentWithIdentifier:a4];
  }
  else
  {
    *(_OWORD *)&v34[8] = *(_OWORD *)((char *)v38 + 8);
    *(void *)&v34[24] = *((void *)&v38[1] + 1);
    *(void *)long long v34 = 0;
    long long v33 = PXStoryTimeZero;
    memset(v36, 0, 40);
    long long v35 = PXStoryTimeMaximum;
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));
  }
  long long v30 = *(_OWORD *)((char *)v28 + 8);
  long long v31 = *(_OWORD *)((char *)&v28[1] + 8);
  uint64_t v32 = *((void *)&v28[2] + 1);
  long long v16 = v37;
  long long v17 = v38[0];
  long long v18 = v38[1];
  uint64_t v8 = [v7 _smallestRangeOfClipsPotentiallyIntersectingTimeRange:&v16];
  uint64_t v10 = v9;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__PXStoryMutableConcreteTimeline__appendSegmentFromTimeline_withIdentifier___block_invoke;
  v24[3] = &unk_1E5DC01C8;
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  id v25 = v7;
  long long v20 = v36[0];
  long long v21 = v36[1];
  long long v16 = v33;
  long long v17 = *(_OWORD *)v34;
  long long v18 = *(_OWORD *)&v34[16];
  long long v19 = v35;
  uint64_t v22 = *(void *)&v36[2];
  uint64_t v23 = 0;
  v14[0] = v30;
  v14[1] = v31;
  uint64_t v15 = v32;
  id v11 = v7;
  int64_t v12 = [(PXStoryMutableConcreteTimeline *)self appendSegmentWithDurationInfo:&v16 clipCount:v10 compositionInfo:v14 configuration:v24];

  return v12;
}

void __76__PXStoryMutableConcreteTimeline__appendSegmentFromTimeline_withIdentifier___block_invoke()
{
}

- (void)appendTimeRange:(id *)a3 fromTimeline:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PXStoryMutableConcreteTimeline_appendTimeRange_fromTimeline___block_invoke;
  v10[3] = &unk_1E5DC01A0;
  v10[4] = self;
  id v11 = v6;
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  id v8 = v6;
  [v8 enumerateSegmentsInTimeRange:v9 usingBlock:v10];
}

uint64_t __63__PXStoryMutableConcreteTimeline_appendTimeRange_fromTimeline___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 >= 1)
  {
    uint64_t v14 = v7;
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = v8;
    uint64_t v19 = v9;
    uint64_t v11 = a2;
    uint64_t v12 = result;
    do
    {
      uint64_t v13 = *a4;
      a4 += 25;
      result = objc_msgSend(*(id *)(v12 + 32), "_appendSegmentFromTimeline:withIdentifier:", *(void *)(v12 + 40), v13, v14, v15, v16, v17, v18, v19);
      --v11;
    }
    while (v11);
  }
  return result;
}

- (void)appendTimeline:(id)a3
{
  id v5 = a3;
  [(PXStoryConcreteTimeline *)self size];
  double v7 = v6;
  double v9 = v8;
  [v5 size];
  if (v7 != v11 || v9 != v10) {
    PXAssertGetLog();
  }
  id v13 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  id v14 = [v5 resourcesDataSource];
  if (v13 == v14)
  {
  }
  else
  {
    uint64_t v15 = v14;
    char v16 = [v13 isEqual:v14];

    if (v16) {
      goto LABEL_11;
    }
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryConcreteTimeline.m" lineNumber:582 description:@"timeline resources data sources aren't compatible"];
  }

LABEL_11:
  memset(&v20, 0, sizeof(v20));
  [(PXStoryConcreteTimeline *)self timeRange];
  CMTimeRange range = v18;
  CMTimeRangeGetEnd(&v19, &range);
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CMTime rhs = v17;
  range.CMTime start = v19;
  CMTimeSubtract(&v20, &range.start, &rhs);
  -[PXStoryConcreteTimeline setNumberOfClips:](self, "setNumberOfClips:", [v5 numberOfClips] + -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips"));
  _PXGArrayCopyRangeToArray();
}

- (int64_t)addSegmentWithTimeRange:(id *)a3 info:(id *)a4
{
  int64_t v7 = [(PXStoryConcreteTimeline *)self numberOfSegments];
  [(PXStoryConcreteTimeline *)self setNumberOfSegments:v7 + 1];
  double v8 = &self->super._segmentTimeRanges[v7];
  long long v9 = *(_OWORD *)&a3->var1.var1;
  long long v10 = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v8->var0.int64_t var3 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v8->var1.var1 = v9;
  *(_OWORD *)&v8->var0.var0 = v10;
  v7 *= 200;
  double v11 = (char *)self->super._segmentInfos + v7;
  long long v12 = *(_OWORD *)&a4->var3.var0.var0;
  long long v13 = *(_OWORD *)&a4->var3.var0.var3;
  long long v14 = *(_OWORD *)&a4->var3.var1.var1;
  *((_OWORD *)v11 + 5) = *(_OWORD *)&a4->var2.var3;
  *((_OWORD *)v11 + 6) = v12;
  *((_OWORD *)v11 + 7) = v13;
  *((_OWORD *)v11 + 8) = v14;
  long long v15 = *(_OWORD *)&a4->var1.var3;
  long long v16 = *(_OWORD *)&a4->var2.var0;
  long long v17 = *(_OWORD *)&a4->var2.var2.var1;
  *((_OWORD *)v11 + 1) = *(_OWORD *)&a4->var1.var1;
  *((_OWORD *)v11 + 2) = v15;
  *((_OWORD *)v11 + 3) = v16;
  *((_OWORD *)v11 + 4) = v17;
  long long v18 = *(_OWORD *)&a4->var3.var2.var0;
  long long v19 = *(_OWORD *)&a4->var3.var2.var3;
  long long v20 = *(_OWORD *)&a4->var3.var3.var0.var1;
  *((void *)v11 + 24) = a4->var3.var3.var1;
  *((_OWORD *)v11 + 10) = v19;
  *((_OWORD *)v11 + 11) = v20;
  *((_OWORD *)v11 + 9) = v18;
  *(_OWORD *)double v11 = *(_OWORD *)&a4->var0;
  long long v21 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v21;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v23, &range);
  range.CMTime start = (CMTime)self->super._timeRange.duration;
  CMTime time2 = v23;
  CMTimeMaximum(&v24, &range.start, &time2);
  self->super._timeRange.CMTime duration = ($95D729B680665BEAEFA1D6FCA8238556)v24;
  return *(int64_t *)((char *)&self->super._segmentInfos->var0 + v7);
}

- (void)modifyInfoForSegmentAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int64_t v7 = (void (**)(id, unsigned char *))a4;
  if ([(PXStoryConcreteTimeline *)self numberOfSegments] <= a3)
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimeline.m", 550, @"Asked to modify out-of bounds segment index %ld", a3);
  }
  double v8 = (char *)self->super._segmentInfos + 200 * a3;
  uint64_t v9 = *(void *)v8;
  long long v10 = *(_OWORD *)(v8 + 88);
  long long v49 = *(_OWORD *)(v8 + 72);
  long long v50 = v10;
  long long v11 = *(_OWORD *)(v8 + 120);
  *(_OWORD *)long long v51 = *(_OWORD *)(v8 + 104);
  *(_OWORD *)&v51[16] = v11;
  long long v12 = *(_OWORD *)(v8 + 24);
  long long v45 = *(_OWORD *)(v8 + 8);
  long long v46 = v12;
  long long v13 = *(_OWORD *)(v8 + 56);
  long long v47 = *(_OWORD *)(v8 + 40);
  long long v48 = v13;
  long long v43 = *(_OWORD *)(v8 + 184);
  long long v42 = *(_OWORD *)(v8 + 168);
  long long v41 = *(_OWORD *)(v8 + 152);
  long long v40 = *(_OWORD *)(v8 + 136);
  *(void *)long long v39 = v9;
  *(_OWORD *)&v39[72] = v49;
  *(_OWORD *)&v39[88] = v50;
  *(_OWORD *)&v39[104] = *(_OWORD *)v51;
  *(_OWORD *)&v39[120] = *(_OWORD *)&v51[16];
  *(_OWORD *)&v39[8] = v45;
  *(_OWORD *)&v39[24] = v46;
  *(_OWORD *)&v39[40] = v47;
  *(_OWORD *)&v39[56] = v13;
  *(_OWORD *)&v39[184] = v43;
  *(_OWORD *)&v39[168] = v42;
  *(_OWORD *)&v39[152] = v41;
  *(_OWORD *)&v39[136] = v40;
  v7[2](v7, v39);
  if (*(void *)v39 != v9)
  {
    long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"PXStoryConcreteTimeline.m" lineNumber:554 description:@"Modified segment info identifier must match existing identifier."];
  }
  long long v14 = (char *)self->super._segmentInfos + 200 * a3;
  *(_OWORD *)long long v14 = *(_OWORD *)v39;
  long long v15 = *(_OWORD *)&v39[16];
  long long v16 = *(_OWORD *)&v39[32];
  long long v17 = *(_OWORD *)&v39[64];
  *((_OWORD *)v14 + 3) = *(_OWORD *)&v39[48];
  *((_OWORD *)v14 + 4) = v17;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v16;
  long long v18 = *(_OWORD *)&v39[80];
  long long v19 = *(_OWORD *)&v39[96];
  long long v20 = *(_OWORD *)&v39[128];
  *((_OWORD *)v14 + 7) = *(_OWORD *)&v39[112];
  *((_OWORD *)v14 + 8) = v20;
  *((_OWORD *)v14 + 5) = v18;
  *((_OWORD *)v14 + 6) = v19;
  long long v21 = *(_OWORD *)&v39[144];
  long long v22 = *(_OWORD *)&v39[160];
  long long v23 = *(_OWORD *)&v39[176];
  *((void *)v14 + 24) = *(void *)&v39[192];
  *((_OWORD *)v14 + 10) = v22;
  *((_OWORD *)v14 + 11) = v23;
  *((_OWORD *)v14 + 9) = v21;
  CMTime v24 = &self->super._segmentTimeRanges[a3];
  int64_t v25 = *(void *)&v39[128];
  *(_OWORD *)&v24->var1.var0 = *(_OWORD *)&v39[112];
  v24->var1.int64_t var3 = v25;
  memset(&v38, 0, sizeof(v38));
  *(_OWORD *)&lhs.var0.var0 = *(_OWORD *)&v39[112];
  lhs.var0.int64_t var3 = *(void *)&v39[128];
  *(_OWORD *)&rhs.var0.var0 = *(_OWORD *)&v51[8];
  rhs.var0.int64_t var3 = *(void *)&v51[24];
  CMTimeSubtract(&v38, (CMTime *)&lhs, (CMTime *)&rhs);
  lhs.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v38;
  *(_OWORD *)&rhs.var0.var0 = PXStoryTimeZero;
  rhs.var0.int64_t var3 = 0;
  if (CMTimeCompare((CMTime *)&lhs, (CMTime *)&rhs))
  {
    int64_t v26 = a3 + 1;
    if (a3 + 1 < [(PXStoryConcreteTimeline *)self numberOfSegments])
    {
      int64_t v27 = 48 * a3 + 48;
      do
      {
        long long v28 = (char *)self->super._segmentTimeRanges + v27;
        $28FEB1B56BB3ED5175BFC6DE64DE503F rhs = *($28FEB1B56BB3ED5175BFC6DE64DE503F *)v28;
        CMTime v36 = v38;
        PXStoryTimeRangeOffset((CMTime *)&rhs, &v36, (CMTimeRange *)&lhs);
        long long v29 = *(_OWORD *)&lhs.var0.var0;
        long long v30 = *(_OWORD *)&lhs.var1.var1;
        *((_OWORD *)v28 + 1) = *(_OWORD *)&lhs.var0.var3;
        *((_OWORD *)v28 + 2) = v30;
        *(_OWORD *)long long v28 = v29;
        ++v26;
        v27 += 48;
      }
      while (v26 < [(PXStoryConcreteTimeline *)self numberOfSegments]);
    }
  }
  segmentTimeRanges = self->super._segmentTimeRanges;
  p_timeRange = &self->super._timeRange;
  $28FEB1B56BB3ED5175BFC6DE64DE503F rhs = segmentTimeRanges[a3];
  $28FEB1B56BB3ED5175BFC6DE64DE503F lhs = rhs;
  CMTimeRangeGetEnd(&v35, (CMTimeRange *)&lhs);
  *(_OWORD *)&lhs.var0.var0 = *(_OWORD *)&p_timeRange->duration.value;
  lhs.var0.int64_t var3 = p_timeRange->duration.epoch;
  rhs.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v35;
  CMTimeMaximum(&v36, (CMTime *)&lhs, (CMTime *)&rhs);
  p_timeRange->CMTime duration = ($95D729B680665BEAEFA1D6FCA8238556)v36;
}

- (int64_t)appendSegmentWithDurationInfo:(id *)a3 clipCount:(int64_t)a4 compositionInfo:(id *)a5 configuration:(id)a6
{
  id v10 = a6;
  int64_t v11 = [(PXStoryConcreteTimeline *)self numberOfClips];
  [(PXStoryConcreteTimeline *)self setNumberOfClips:v11 + a4];
  range.start.value = self->_bufferCapacity;
  p_playbackStyles = &self->_playbackStyles;
  int64_t v12 = a4;
  _PXGArrayCapacityResizeToCount();
}

- (void)dealloc
{
  free(self->_playbackStyles);
  free(self->_assetContentInfos);
  free(self->_safeAreaInsets);
  free(self->_clippingAnimationInfos);
  free(self->_kenBurnsAnimationInfos);
  free(self->_transitionInfos);
  free(self->_audioInfos);
  free(self->_clipOptions);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMutableConcreteTimeline;
  [(PXStoryConcreteTimeline *)&v3 dealloc];
}

@end