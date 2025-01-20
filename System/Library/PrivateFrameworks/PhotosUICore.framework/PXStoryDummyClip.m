@interface PXStoryDummyClip
- ($1FE1EEDD30F8401E3A9AF97812D83A51)info;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRangeForClipDuration:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange;
- (BOOL)isEqualToClip:(id)a3;
- (BOOL)isVisuallyEqualToClip:(id)a3;
- (NSString)resourceIdentifier;
- (PFStoryRecipeDisplayAssetNormalization)colorNormalization;
- (PXStoryDummyClip)init;
- (PXStoryDummyClip)initWithInfo:(id *)a3 resource:(id)a4 resourceOccurrenceIndex:(int64_t)a5;
- (PXStoryResource)resource;
- (id)copyWithInfo:(id *)a3;
- (int64_t)identifier;
- (int64_t)resourceOccurrenceIndex;
- (unint64_t)hash;
@end

@implementation PXStoryDummyClip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceIdentifier, 0);
  objc_storeStrong((id *)&self->_colorNormalization, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (int64_t)resourceOccurrenceIndex
{
  return self->_resourceOccurrenceIndex;
}

- (NSString)resourceIdentifier
{
  return self->_resourceIdentifier;
}

- (PFStoryRecipeDisplayAssetNormalization)colorNormalization
{
  return self->_colorNormalization;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
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
  v5 = [PXStoryDummyClip alloc];
  v6 = [(PXStoryDummyClip *)self resource];
  int64_t v7 = [(PXStoryDummyClip *)self resourceOccurrenceIndex];
  memcpy(v10, a3, sizeof(v10));
  v8 = [(PXStoryDummyClip *)v5 initWithInfo:v10 resource:v6 resourceOccurrenceIndex:v7];

  return v8;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRangeForClipDuration:(SEL)a3
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- (BOOL)isVisuallyEqualToClip:(id)a3
{
  v4 = (PXStoryDummyClip *)a3;
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
  if ([(PXStoryDummyClip *)self isEqualToClip:v5]
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
  v2 = [(PXStoryDummyClip *)self resourceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToClip:(id)a3
{
  v4 = (PXStoryDummyClip *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(PXStoryDummyClip *)self resourceIdentifier];
      BOOL v7 = [(PXStoryDummyClip *)v5 resourceIdentifier];
      if ([v6 isEqual:v7])
      {
        int64_t v8 = [(PXStoryDummyClip *)self resourceOccurrenceIndex];
        BOOL v9 = v8 == [(PXStoryDummyClip *)v5 resourceOccurrenceIndex];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (PXStoryDummyClip)initWithInfo:(id *)a3 resource:(id)a4 resourceOccurrenceIndex:(int64_t)a5
{
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryDummyClip;
  v10 = [(PXStoryDummyClip *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_identifier = a3->var0;
    memcpy(&v10->_info, a3, 0x300uLL);
    objc_storeStrong((id *)&v11->_resource, a4);
    uint64_t v12 = [(PXStoryResource *)v11->_resource px_storyResourceIdentifier];
    resourceIdentifier = v11->_resourceIdentifier;
    v11->_resourceIdentifier = (NSString *)v12;

    v11->_resourceOccurrenceIndeCGFloat x = a5;
    *(_OWORD *)&v11->_videoTimeRange.start.value = 0u;
    *(_OWORD *)&v11->_videoTimeRange.start.epoch = 0u;
    *(_OWORD *)&v11->_videoTimeRange.duration.timescale = 0u;
    colorNormalization = v11->_colorNormalization;
    v11->_colorNormalization = 0;
  }
  return v11;
}

- (PXStoryDummyClip)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyClip.m", 22, @"%s is not available as initializer", "-[PXStoryDummyClip init]");

  abort();
}

@end