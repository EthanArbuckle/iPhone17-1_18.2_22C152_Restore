@interface _PXStoryConcreteCompanionTimelineAsset
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange;
- ($AD15B6C785738E514ABCC493A298F7F8)finalContentsRect;
- ($AD15B6C785738E514ABCC493A298F7F8)initialContentsRect;
- (CGRect)frame;
- (PHAsset)photoLibraryAsset;
- (PXStoryClip)clip;
- (PXStoryCompanionColorEffect)colorNormalizationEffect;
- (_PXStoryConcreteCompanionTimelineAsset)initWithFrame:(CGRect)a3 clip:(id)a4;
- (int64_t)playbackStyle;
@end

@implementation _PXStoryConcreteCompanionTimelineAsset

- (void).cxx_destruct
{
}

- (PXStoryClip)clip
{
  return self->_clip;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXStoryCompanionColorEffect)colorNormalizationEffect
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__142613;
  v21 = __Block_byref_object_dispose__142614;
  id v22 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = +[PXStoryColorNormalizationCubeLibrary sharedInstance];
  v5 = [(_PXStoryConcreteCompanionTimelineAsset *)self clip];
  v6 = [v5 colorNormalization];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __66___PXStoryConcreteCompanionTimelineAsset_colorNormalizationEffect__block_invoke;
  v14 = &unk_1E5DBEAE8;
  v16 = &v17;
  v7 = v3;
  v15 = v7;
  [v4 requestColorCubeForAssetNormalization:v6 completionHandler:&v11];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = [_PXStoryConcreteCompanionColorEffect alloc];
  v9 = -[_PXStoryConcreteCompanionColorEffect initWithColorLookupCube:](v8, "initWithColorLookupCube:", v18[5], v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return (PXStoryCompanionColorEffect *)v9;
}

- ($AD15B6C785738E514ABCC493A298F7F8)finalContentsRect
{
  dispatch_semaphore_t v3 = [(_PXStoryConcreteCompanionTimelineAsset *)self clip];
  if (v3) {
    [v3 info];
  }
  else {
    bzero(v5, 0x300uLL);
  }
  long long v8 = *(_OWORD *)&v5[600];
  long long v9 = v6;
  long long v10 = v7;
  PXStoryCompanionRectFromPXStoryContentsRect();
}

- ($AD15B6C785738E514ABCC493A298F7F8)initialContentsRect
{
  dispatch_semaphore_t v3 = [(_PXStoryConcreteCompanionTimelineAsset *)self clip];
  if (v3) {
    [v3 info];
  }
  else {
    bzero(v5, 0x300uLL);
  }
  long long v8 = *(_OWORD *)&v5[552];
  long long v9 = v6;
  long long v10 = v7;
  PXStoryCompanionRectFromPXStoryContentsRect();
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)videoTimeRange
{
  v4 = [(_PXStoryConcreteCompanionTimelineAsset *)self clip];
  v5 = v4;
  if (v4)
  {
    [v4 videoTimeRange];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  *(_OWORD *)&retstr->var0.var0 = v7;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = v9;

  return result;
}

- (int64_t)playbackStyle
{
  v2 = [(_PXStoryConcreteCompanionTimelineAsset *)self clip];
  if (!v2) {
    return 0;
  }
  dispatch_semaphore_t v3 = v2;
  [v2 info];
  int64_t v4 = v6;

  if ((unint64_t)(v4 - 1) >= 5) {
    return 0;
  }
  else {
    return v4;
  }
}

- (PHAsset)photoLibraryAsset
{
  int64_t v4 = [(_PXStoryConcreteCompanionTimelineAsset *)self clip];
  v5 = [v4 resource];

  int64_t v6 = objc_msgSend(v5, "px_storyResourceDisplayAsset");

  id v7 = v6;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXStoryConcreteCompanionTimeline.m", 172, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v11, v13 object file lineNumber description];
  }
  else
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXStoryConcreteCompanionTimeline.m", 172, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v11 object file lineNumber description];
  }

LABEL_3:
  return (PHAsset *)v7;
}

- (_PXStoryConcreteCompanionTimelineAsset)initWithFrame:(CGRect)a3 clip:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryConcreteCompanionTimelineAsset;
  uint64_t v11 = [(_PXStoryConcreteCompanionTimelineAsset *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_frame.origin.CGFloat x = x;
    v11->_frame.origin.CGFloat y = y;
    v11->_frame.size.CGFloat width = width;
    v11->_frame.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_clip, a4);
  }

  return v12;
}

@end