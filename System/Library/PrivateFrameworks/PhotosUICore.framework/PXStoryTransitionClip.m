@interface PXStoryTransitionClip
- ($1FE1EEDD30F8401E3A9AF97812D83A51)clipInfo;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRangeForClipDuration:(SEL)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange;
- (BOOL)isEqualToClip:(id)a3;
- (BOOL)isVisuallyEqualToClip:(id)a3;
- (PFStoryRecipeDisplayAssetNormalization)colorNormalization;
- (PXStoryClip)originalClip;
- (PXStoryResource)resource;
- (PXStoryTransitionClip)initWithClipInfo:(id *)a3 originalClip:(id)a4;
- (id)copyWithInfo:(id *)a3;
- (int64_t)identifier;
@end

@implementation PXStoryTransitionClip

- (void).cxx_destruct
{
}

- (PXStoryClip)originalClip
{
  return self->_originalClip;
}

- ($1FE1EEDD30F8401E3A9AF97812D83A51)clipInfo
{
  return ($1FE1EEDD30F8401E3A9AF97812D83A51 *)memcpy(retstr, &self->_clipInfo, 0x300uLL);
}

- (id)copyWithInfo:(id *)a3
{
  v5 = [PXStoryTransitionClip alloc];
  v6 = [(PXStoryTransitionClip *)self originalClip];
  memcpy(v9, a3, sizeof(v9));
  v7 = [(PXStoryTransitionClip *)v5 initWithClipInfo:v9 originalClip:v6];

  return v7;
}

- (BOOL)isVisuallyEqualToClip:(id)a3
{
  v4 = (PXStoryTransitionClip *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(PXStoryTransitionClip *)self isEqualToClip:v5])
      {
        v6 = [(PXStoryTransitionClip *)self originalClip];
        v7 = [(PXStoryTransitionClip *)v5 originalClip];
        char v8 = [v6 isVisuallyEqualToClip:v7];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isEqualToClip:(id)a3
{
  v4 = (PXStoryTransitionClip *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXStoryTransitionClip *)self originalClip];
      v7 = [(PXStoryTransitionClip *)v5 originalClip];

      char v8 = [v6 isEqualToClip:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)playbackTimeRangeForClipDuration:(SEL)a3
{
  v6 = [(PXStoryTransitionClip *)self originalClip];
  if (v6)
  {
    char v8 = v6;
    [v6 playbackTimeRangeForClipDuration:a4];
    v6 = v8;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (PFStoryRecipeDisplayAssetNormalization)colorNormalization
{
  v2 = [(PXStoryTransitionClip *)self originalClip];
  v3 = [v2 colorNormalization];

  return (PFStoryRecipeDisplayAssetNormalization *)v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange
{
  v4 = [(PXStoryTransitionClip *)self originalClip];
  if (v4)
  {
    v6 = v4;
    [v4 videoTimeRange];
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (PXStoryResource)resource
{
  v2 = [(PXStoryTransitionClip *)self originalClip];
  v3 = [v2 resource];

  return (PXStoryResource *)v3;
}

- (int64_t)identifier
{
  [(PXStoryTransitionClip *)self clipInfo];
  return v3;
}

- (PXStoryTransitionClip)initWithClipInfo:(id *)a3 originalClip:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryTransitionClip;
  char v8 = [(PXStoryTransitionClip *)&v11 init];
  v9 = v8;
  if (v8)
  {
    memcpy(&v8->_clipInfo, a3, 0x300uLL);
    objc_storeStrong((id *)&v9->_originalClip, a4);
  }

  return v9;
}

@end