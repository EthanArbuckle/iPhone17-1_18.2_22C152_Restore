@interface PXStoryConcreteClip
- ($1FE1EEDD30F8401E3A9AF97812D83A51)info;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_videoTimeRangeForTargetDuration:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRangeForClipDuration:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange;
- (BOOL)isEqualToClip:(id)a3;
- (BOOL)isVisuallyEqualToClip:(id)a3;
- (NSString)description;
- (PFStoryRecipeDisplayAssetNormalization)colorNormalization;
- (PXStoryConcreteClip)init;
- (PXStoryConcreteClip)initWithInfo:(id *)a3 resourceKind:(int64_t)a4 resourceIndex:(int64_t)a5 resourceOccurrenceIndex:(int64_t)a6 resourcesDataSource:(id)a7;
- (PXStoryResource)resource;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (id)copyWithInfo:(id *)a3;
- (id)videoHighlight;
- (int64_t)identifier;
- (int64_t)resourceIndex;
- (int64_t)resourceKind;
- (int64_t)resourceOccurrenceIndex;
- (unint64_t)hash;
@end

@implementation PXStoryConcreteClip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (int64_t)resourceOccurrenceIndex
{
  return self->_resourceOccurrenceIndex;
}

- (int64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (int64_t)resourceKind
{
  return self->_resourceKind;
}

- ($1FE1EEDD30F8401E3A9AF97812D83A51)info
{
  return ($1FE1EEDD30F8401E3A9AF97812D83A51 *)memcpy(retstr, &self->_info, 0x300uLL);
}

- (PXStoryResource)resource
{
  return self->_resource;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (id)copyWithInfo:(id *)a3
{
  v5 = [PXStoryConcreteClip alloc];
  int64_t v6 = [(PXStoryConcreteClip *)self resourceKind];
  int64_t v7 = [(PXStoryConcreteClip *)self resourceIndex];
  int64_t v8 = [(PXStoryConcreteClip *)self resourceOccurrenceIndex];
  v9 = [(PXStoryConcreteClip *)self resourcesDataSource];
  memcpy(v12, a3, sizeof(v12));
  v10 = [(PXStoryConcreteClip *)v5 initWithInfo:v12 resourceKind:v6 resourceIndex:v7 resourceOccurrenceIndex:v8 resourcesDataSource:v9];

  return v10;
}

- (BOOL)isVisuallyEqualToClip:(id)a3
{
  v4 = (PXStoryConcreteClip *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  if ([(PXStoryConcreteClip *)self isEqualToClip:v5]
    && self->_info.playbackStyle == v5->_info.playbackStyle)
  {
    BOOL v6 = self->_info.clipSize.width == v5->_info.clipSize.width
      && self->_info.clipSize.height == v5->_info.clipSize.height;
    if (v6 && ((LODWORD(v5->_info.options) ^ LODWORD(self->_info.options)) & 0xDLL) == 0)
    {
      BOOL v7 = 0;
      if (self->_info.assetContentInfo.size.width != v5->_info.assetContentInfo.size.width
        || self->_info.assetContentInfo.size.height != v5->_info.assetContentInfo.size.height)
      {
        goto LABEL_12;
      }
      CGFloat x = self->_info.assetContentInfo.acceptableCropRect.origin.x;
      CGFloat y = self->_info.assetContentInfo.acceptableCropRect.origin.y;
      CGFloat width = self->_info.assetContentInfo.acceptableCropRect.size.width;
      CGFloat height = self->_info.assetContentInfo.acceptableCropRect.size.height;
      CGFloat v31 = self->_info.assetContentInfo.faceAreaRect.origin.y;
      CGFloat v32 = self->_info.assetContentInfo.faceAreaRect.origin.x;
      CGFloat v29 = self->_info.assetContentInfo.faceAreaRect.size.height;
      CGFloat v30 = self->_info.assetContentInfo.faceAreaRect.size.width;
      CGFloat v23 = self->_info.assetContentInfo.bestPlaybackRect.origin.y;
      CGFloat v24 = self->_info.assetContentInfo.bestPlaybackRect.origin.x;
      CGFloat v21 = self->_info.assetContentInfo.bestPlaybackRect.size.height;
      CGFloat v22 = self->_info.assetContentInfo.bestPlaybackRect.size.width;
      CGFloat v13 = v5->_info.assetContentInfo.acceptableCropRect.origin.x;
      CGFloat v14 = v5->_info.assetContentInfo.acceptableCropRect.origin.y;
      CGFloat v15 = v5->_info.assetContentInfo.acceptableCropRect.size.width;
      CGFloat v16 = v5->_info.assetContentInfo.acceptableCropRect.size.height;
      CGFloat v27 = v5->_info.assetContentInfo.faceAreaRect.origin.y;
      CGFloat v28 = v5->_info.assetContentInfo.faceAreaRect.origin.x;
      CGFloat v25 = v5->_info.assetContentInfo.faceAreaRect.size.height;
      CGFloat v26 = v5->_info.assetContentInfo.faceAreaRect.size.width;
      CGFloat v19 = v5->_info.assetContentInfo.bestPlaybackRect.origin.y;
      CGFloat v20 = v5->_info.assetContentInfo.bestPlaybackRect.origin.x;
      CGFloat v17 = v5->_info.assetContentInfo.bestPlaybackRect.size.height;
      CGFloat v18 = v5->_info.assetContentInfo.bestPlaybackRect.size.width;
      if (CGRectEqualToRect(self->_info.assetContentInfo.preferredCropRect, v5->_info.assetContentInfo.preferredCropRect))
      {
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        v36.origin.CGFloat x = v13;
        v36.origin.CGFloat y = v14;
        v36.size.CGFloat width = v15;
        v36.size.CGFloat height = v16;
        if (CGRectEqualToRect(v33, v36))
        {
          v34.origin.CGFloat y = v31;
          v34.origin.CGFloat x = v32;
          v34.size.CGFloat height = v29;
          v34.size.CGFloat width = v30;
          v37.origin.CGFloat y = v27;
          v37.origin.CGFloat x = v28;
          v37.size.CGFloat height = v25;
          v37.size.CGFloat width = v26;
          if (CGRectEqualToRect(v34, v37))
          {
            v35.origin.CGFloat y = v23;
            v35.origin.CGFloat x = v24;
            v35.size.CGFloat height = v21;
            v35.size.CGFloat width = v22;
            v38.origin.CGFloat y = v19;
            v38.origin.CGFloat x = v20;
            v38.size.CGFloat height = v17;
            v38.size.CGFloat width = v18;
            if (CGRectEqualToRect(v35, v38)) {
              PXEdgeInsetsEqualToEdgeInsets();
            }
          }
        }
      }
    }
  }
  BOOL v7 = 0;
LABEL_12:

LABEL_15:
  return v7;
}

- (unint64_t)hash
{
  int64_t v3 = [(PXStoryConcreteClip *)self resourceKind];
  return v3 ^ (2 * [(PXStoryConcreteClip *)self resourceIndex]);
}

- (BOOL)isEqualToClip:(id)a3
{
  v4 = (PXStoryConcreteClip *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(PXStoryConcreteClip *)self resourceKind];
      if (v6 == [(PXStoryConcreteClip *)v5 resourceKind]
        && (int64_t v7 = [(PXStoryConcreteClip *)self resourceIndex],
            v7 == [(PXStoryConcreteClip *)v5 resourceIndex])
        && (int64_t v8 = [(PXStoryConcreteClip *)self resourceOccurrenceIndex],
            v8 == [(PXStoryConcreteClip *)v5 resourceOccurrenceIndex]))
      {
        v9 = [(PXStoryConcreteClip *)self resourcesDataSource];
        v10 = [(PXStoryConcreteClip *)v5 resourcesDataSource];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (PFStoryRecipeDisplayAssetNormalization)colorNormalization
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource displayAssetResourceAtIndex:self->_resourceIndex];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v3, "px_storyResourceDisplayAsset");
    v5 = [v4 uuid];
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "resource px_storyResourceDisplayAsset uuid is %@", (uint8_t *)&v11, 0xCu);
  }
  if ([(PXStoryConcreteClip *)self resourceKind] == 1
    || [(PXStoryConcreteClip *)self resourceKind] == 5)
  {
    int64_t v6 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource movieHighlightsForDisplayAssetAtIndex:self->_resourceIndex];
    int64_t v7 = [v6 bestHighlight];
    int64_t v8 = [v7 normalizationData];

    if (v8)
    {

LABEL_8:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CDC8]) initWithAnalysisData:v8];
      goto LABEL_11;
    }
    int64_t v8 = objc_msgSend(v3, "px_storyResourceFetchNormalizationData");

    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
    int64_t v8 = 0;
  }
  v9 = 0;
LABEL_11:

  return (PFStoryRecipeDisplayAssetNormalization *)v9;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRangeForClipDuration:(SEL)a3
{
  result = [(PXStoryConcreteClip *)self resourceKind];
  if (result == ($28FEB1B56BB3ED5175BFC6DE64DE503F *)1)
  {
    memset(&v19, 0, sizeof(v19));
    [(PXStoryConcreteClip *)self videoTimeRange];
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    CMTimeMakeWithSeconds(&v18, a4, 600);
    result = [(PXStoryConcreteClip *)self _videoTimeRangeForTargetDuration:&v18];
    if ((v19.start.flags & 1) != 0
      && (v19.duration.flags & 1) != 0
      && !v19.duration.epoch
      && (v19.duration.value & 0x8000000000000000) == 0)
    {
      [(PXStoryConcreteClip *)self info];
      *(_OWORD *)CGFloat v16 = v13;
      *(_OWORD *)&v16[16] = v14;
      uint64_t v17 = v15;
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v16[4];
      time1.start.epoch = v14 >> 32;
      *(_OWORD *)&time2.start.value = PXStoryTimeZero;
      time2.start.epoch = 0;
      result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeCompare(&time1.start, &time2.start);
      if ((int)result >= 1)
      {
        *(_OWORD *)&time2.start.value = *(_OWORD *)&retstr->var0.var0;
        time2.start.epoch = retstr->var0.var3;
        memset(&time2.duration, 0, sizeof(time2.duration));
        *(_OWORD *)&time1.start.value = *(_OWORD *)&retstr->var1.var0;
        time1.start.epoch = retstr->var1.var3;
        CMTime rhs = *(CMTime *)&v16[4];
        CMTimeAdd(&time2.duration, &time1.start, &rhs);
        CMTimeRange time1 = time2;
        CMTimeRangeGetEnd(&v11, &time1);
        CMTimeRange time1 = v19;
        CMTimeRangeGetEnd(&v10, &time1);
        time1.start = v11;
        CMTime rhs = v10;
        result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeCompare(&time1.start, &rhs);
        if ((int)result >= 1)
        {
          CMTimeRange time1 = v19;
          CMTimeRangeGetEnd(&v8, &time1);
          CMTime rhs = time2.duration;
          time1.start = v8;
          CMTimeSubtract(&v9, &time1.start, &rhs);
          time2.start = v9;
          time1.start = v9;
          CMTime rhs = v19.start;
          result = ($28FEB1B56BB3ED5175BFC6DE64DE503F *)CMTimeCompare(&time1.start, &rhs);
          if ((result & 0x80000000) != 0) {
            CMTimeRange time2 = v19;
          }
          *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time2.start.value;
          retstr->var0.var3 = time2.start.epoch;
        }
      }
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0uLL;
    *(_OWORD *)&retstr->var1.var1 = 0uLL;
    *(_OWORD *)&retstr->var0.var0 = 0uLL;
  }
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)_videoTimeRangeForTargetDuration:(SEL)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  int64_t v7 = [(PXStoryConcreteClip *)self videoHighlight];
  if (v7)
  {
    [(PXStoryConcreteClip *)self info];
    *(_OWORD *)&v38[16] = v32;
    long long v39 = v33;
    long long v40 = v34;
    long long v41 = v35;
    long long v42 = v36;
    long long buf = v30;
    *(_OWORD *)CGRect v38 = v31;
    *(_OWORD *)&time[0].value = *(_OWORD *)&v38[8];
    time[0].epoch = *((void *)&v32 + 1);
    Float64 Seconds = CMTimeGetSeconds(time);
    memset(time, 0, sizeof(time));
    [v7 bestTimeRangeForTargetDuration:Seconds];
    memset(v28, 0, sizeof(v28));
    long long v27 = 0u;
    [v7 timeRange];
    *(_OWORD *)&time2[16] = *(_OWORD *)&time[0].epoch;
    long long v24 = *(_OWORD *)&time[1].timescale;
    *(_OWORD *)CMTime rhs = v27;
    *(_OWORD *)&rhs[16] = v28[0];
    long long v22 = v28[1];
    *(_OWORD *)CMTimeRange time2 = *(_OWORD *)&time[0].value;
    PXStoryTimeRangeIntersection(time2, rhs, time1);
    *(_OWORD *)&time[0].epoch = *(_OWORD *)&time1[16];
    *(_OWORD *)&time[1].timescale = v26;
    *(_OWORD *)&time[0].value = *(_OWORD *)time1;
    *(_OWORD *)CMTimeRange time1 = *(_OWORD *)&a4->var0;
    *(void *)&time1[16] = a4->var3;
    *(_OWORD *)CMTimeRange time2 = *(_OWORD *)&time[1].value;
    *(void *)&time2[16] = *((void *)&v26 + 1);
    if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) <= 0)
    {
      memset(time1, 0, 24);
      *(CMTime *)CMTimeRange time2 = time[1];
      *(_OWORD *)CMTime rhs = *(_OWORD *)&a4->var0;
      *(void *)&rhs[16] = a4->var3;
      CMTimeSubtract(&v20, (CMTime *)time2, (CMTime *)rhs);
      CMTimeMultiplyByRatio((CMTime *)time1, &v20, 1, 2);
      *(CMTime *)CMTime rhs = time[0];
      CMTime v19 = *(CMTime *)time1;
      CMTimeAdd((CMTime *)time2, (CMTime *)rhs, &v19);
    }
    else
    {
      *(_OWORD *)CMTimeRange time1 = *(_OWORD *)&a4->var0;
      *(void *)&time1[16] = a4->var3;
      *(_OWORD *)CMTimeRange time2 = *(_OWORD *)((char *)v28 + 8);
      *(void *)&time2[16] = *((void *)&v28[1] + 1);
      if ((CMTimeCompare((CMTime *)time1, (CMTime *)time2) & 0x80000000) == 0)
      {
        long long v9 = v28[0];
        *(_OWORD *)&retstr->var0.var0 = v27;
        *(_OWORD *)&retstr->var0.var3 = v9;
        *(_OWORD *)&retstr->var1.var1 = v28[1];
        goto LABEL_12;
      }
      memset(time1, 0, 24);
      *(CMTime *)CMTimeRange time2 = time[0];
      *(_OWORD *)CMTime rhs = v27;
      *(void *)&rhs[16] = *(void *)&v28[0];
      CMTimeSubtract(&v18, (CMTime *)time2, (CMTime *)rhs);
      *(_OWORD *)CMTimeRange time2 = *(_OWORD *)&a4->var0;
      *(void *)&time2[16] = a4->var3;
      *(CMTime *)CMTime rhs = time[1];
      CMTimeSubtract(&v17, (CMTime *)time2, (CMTime *)rhs);
      *(_OWORD *)CMTimeRange time2 = *(_OWORD *)((char *)v28 + 8);
      *(void *)&time2[16] = *((void *)&v28[1] + 1);
      *(CMTime *)CMTime rhs = time[1];
      CMTimeSubtract(&v16, (CMTime *)time2, (CMTime *)rhs);
      CMTimeMultiplyTimeByTimeRatio();
      *(CMTime *)CMTimeRange time2 = time[0];
      *(_OWORD *)CMTime rhs = *(_OWORD *)time1;
      *(void *)&rhs[16] = *(void *)&time1[16];
      CMTimeSubtract(&v14, (CMTime *)time2, (CMTime *)rhs);
      CMTimeConvertScale(&v15, &v14, 600, kCMTimeRoundingMethod_RoundAwayFromZero);
      *(_OWORD *)CMTime rhs = v27;
      *(void *)&rhs[16] = *(void *)&v28[0];
      CMTimeMaximum((CMTime *)time2, &v15, (CMTime *)rhs);
    }
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time2;
    retstr->var0.var3 = *(void *)&time2[16];
    *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&a4->var0;
    retstr->var1.var3 = a4->var3;
    goto LABEL_12;
  }
  [(PXStoryConcreteClip *)self info];
  if (v13 == 4)
  {
    CMTime v10 = PLStoryGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CMTime v11 = [(PXStoryConcreteClip *)self resource];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Video clip is missing movie highlight! %@", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_12:

  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange
{
  [(PXStoryConcreteClip *)self info];
  long long v19 = v12;
  long long v20 = v13;
  long long v21 = v14;
  long long v15 = v8;
  long long v16 = v9;
  long long v17 = v10;
  long long v18 = v11;
  long long v6 = v11;
  uint64_t v7 = v12;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  return [(PXStoryConcreteClip *)self _videoTimeRangeForTargetDuration:&v6];
}

- (id)videoHighlight
{
  if ([(PXStoryConcreteClip *)self resourceKind] == 1)
  {
    int64_t v3 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource movieHighlightsForDisplayAssetAtIndex:self->_resourceIndex];
    if (v3)
    {
      [(PXStoryConcreteClip *)self info];
      uint64_t v4 = PXStoryMovieHighlightForPlaybackStyle(v3, v9);
      v5 = (void *)v4;
      if ((unint64_t)(v9 - 3) > 2 || v4 != 0) {
        goto LABEL_12;
      }
      uint64_t v7 = PLStoryGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        [(PXStoryConcreteClip *)self resource];
        objc_claimAutoreleasedReturnValue();
        PXDisplayAssetPlaybackStyleDescription();
      }
    }
    v5 = 0;
LABEL_12:

    goto LABEL_14;
  }
  v5 = 0;
LABEL_14:
  return v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXStoryConcreteClip identifier](self, "identifier"));
  unint64_t v7 = [(PXStoryConcreteClip *)self resourceKind];
  if (v7 > 5) {
    long long v8 = @"??";
  }
  else {
    long long v8 = off_1E5DC4FD0[v7];
  }
  uint64_t v9 = v8;
  long long v10 = [(PXStoryConcreteClip *)self resource];
  int64_t v11 = [(PXStoryConcreteClip *)self resourceIndex];
  int64_t v12 = [(PXStoryConcreteClip *)self resourceOccurrenceIndex];
  long long v13 = [(PXStoryConcreteClip *)self resourcesDataSource];
  long long v14 = objc_msgSend(v3, "initWithFormat:", @"<%@; %p; ID: %@; Resource Kind: %@; Resource:%@ resourceIndex:%ld resourceOccurenceIndex:%ld resourcesDataSource:%@>",
                  v5,
                  self,
                  v6,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13);

  return (NSString *)v14;
}

- (PXStoryConcreteClip)initWithInfo:(id *)a3 resourceKind:(int64_t)a4 resourceIndex:(int64_t)a5 resourceOccurrenceIndex:(int64_t)a6 resourcesDataSource:(id)a7
{
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryConcreteClip;
  long long v15 = [(PXStoryConcreteClip *)&v21 init];
  long long v16 = v15;
  if (v15)
  {
    v15->_identifier = a3->var0;
    memcpy(&v15->_info, a3, 0x300uLL);
    v16->_resourceKind = a4;
    v16->_resourceIndeCGFloat x = a5;
    v16->_resourceOccurrenceIndeCGFloat x = a6;
    objc_storeStrong((id *)&v16->_resourcesDataSource, a7);
    switch(a4)
    {
      case 0:
        long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:v16 file:@"PXStoryConcreteClip.m" lineNumber:49 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1:
        uint64_t v17 = [v14 displayAssetResourceAtIndex:a5];
        break;
      case 2:
        uint64_t v17 = [v14 songResourceAtIndex:a5];
        break;
      case 3:
        uint64_t v17 = [v14 textResourceAtIndex:a5];
        break;
      case 4:
        uint64_t v17 = [v14 colorResourceAtIndex:a5];
        break;
      case 5:
        uint64_t v17 = [v14 frameFillingEffectResourceAtIndex:a5];
        break;
      default:
        uint64_t v17 = 0;
        break;
    }
    resource = v16->_resource;
    v16->_resource = (PXStoryResource *)v17;
  }
  return v16;
}

- (PXStoryConcreteClip)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteClip.m", 33, @"%s is not available as initializer", "-[PXStoryConcreteClip init]");

  abort();
}

@end