@interface PFStoryConcreteRecipeClip
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)idealDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoCueOffset;
- (BOOL)isEqualToClip:(id)a3;
- (NSString)assetIdentifier;
- (NSString)diagnosticDescription;
- (PFStoryConcreteRecipeClip)initWithAssetIdentifier:(id)a3 playbackStyle:(int64_t)a4 minimumDuration:(id *)a5 idealDuration:(id *)a6 maximumDuration:(id *)a7 videoCueOffset:(id *)a8 motionStyle:(int64_t)a9 transition:(int64_t)a10;
- (int64_t)motionStyle;
- (int64_t)playbackStyle;
- (int64_t)transition;
@end

@implementation PFStoryConcreteRecipeClip

- (void).cxx_destruct
{
}

- (int64_t)transition
{
  return self->_transition;
}

- (int64_t)motionStyle
{
  return self->_motionStyle;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoCueOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)idealDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (BOOL)isEqualToClip:(id)a3
{
  v4 = (PFStoryConcreteRecipeClip *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    v5 = [(PFStoryConcreteRecipeClip *)self assetIdentifier];
    v6 = [(PFStoryConcreteRecipeClip *)v4 assetIdentifier];
    int v7 = [v5 isEqual:v6];

    if (!v7) {
      goto LABEL_23;
    }
    int64_t v8 = [(PFStoryConcreteRecipeClip *)self playbackStyle];
    if (v8 != [(PFStoryConcreteRecipeClip *)v4 playbackStyle]) {
      goto LABEL_23;
    }
    [(PFStoryConcreteRecipeClip *)self minimumDuration];
    if (v4) {
      [(PFStoryConcreteRecipeClip *)v4 minimumDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    if (CMTimeCompare(&time1, &time2)) {
      goto LABEL_23;
    }
    [(PFStoryConcreteRecipeClip *)self idealDuration];
    if (v4) {
      [(PFStoryConcreteRecipeClip *)v4 idealDuration];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    if (CMTimeCompare(&v18, &v17)) {
      goto LABEL_23;
    }
    [(PFStoryConcreteRecipeClip *)self maximumDuration];
    if (v4) {
      [(PFStoryConcreteRecipeClip *)v4 maximumDuration];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    if (CMTimeCompare(&v16, &v15)) {
      goto LABEL_23;
    }
    [(PFStoryConcreteRecipeClip *)self videoCueOffset];
    if (v4) {
      [(PFStoryConcreteRecipeClip *)v4 videoCueOffset];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    if (CMTimeCompare(&v14, &v13)
      || (int64_t v10 = [(PFStoryConcreteRecipeClip *)self motionStyle],
          v10 != [(PFStoryConcreteRecipeClip *)v4 motionStyle]))
    {
LABEL_23:
      BOOL v9 = 0;
    }
    else
    {
      int64_t v11 = [(PFStoryConcreteRecipeClip *)self transition];
      BOOL v9 = v11 == [(PFStoryConcreteRecipeClip *)v4 transition];
    }
  }

  return v9;
}

- (NSString)diagnosticDescription
{
  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  v4 = [(PFStoryRecipeArchiver *)v3 archivedJSONObjectWithClip:self];
  v5 = [v4 description];

  return (NSString *)v5;
}

- (PFStoryConcreteRecipeClip)initWithAssetIdentifier:(id)a3 playbackStyle:(int64_t)a4 minimumDuration:(id *)a5 idealDuration:(id *)a6 maximumDuration:(id *)a7 videoCueOffset:(id *)a8 motionStyle:(int64_t)a9 transition:(int64_t)a10
{
  id v16 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFStoryConcreteRecipeClip;
  CMTime v17 = [(PFStoryConcreteRecipeClip *)&v24 init];
  CMTime v18 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v16;

  *((void *)v17 + 2) = a4;
  long long v19 = *(_OWORD *)&a5->var0;
  *((void *)v17 + 5) = a5->var3;
  *(_OWORD *)(v17 + 24) = v19;
  long long v20 = *(_OWORD *)&a6->var0;
  *((void *)v17 + 8) = a6->var3;
  *((_OWORD *)v17 + 3) = v20;
  long long v21 = *(_OWORD *)&a7->var0;
  *((void *)v17 + 11) = a7->var3;
  *(_OWORD *)(v17 + 72) = v21;
  int64_t var3 = a8->var3;
  *((_OWORD *)v17 + 6) = *(_OWORD *)&a8->var0;
  *((void *)v17 + 14) = var3;
  *((void *)v17 + 15) = a9;
  *((void *)v17 + 16) = a10;
  return (PFStoryConcreteRecipeClip *)v17;
}

@end