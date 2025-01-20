@interface _UIStatusBarAnimationFactory
+ (id)fadeAnimationWithDuration:(double)a3;
+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4;
+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4 offset:(UIOffset)a5;
+ (id)noAnimation;
+ (id)pulseAnimationWithDuration:(double)a3 scale:(double)a4;
@end

@implementation _UIStatusBarAnimationFactory

+ (id)noAnimation
{
  if (qword_1EB262FB8 != -1) {
    dispatch_once(&qword_1EB262FB8, &__block_literal_global_498);
  }
  v2 = (void *)_MergedGlobals_1227;
  return v2;
}

+ (id)fadeAnimationWithDuration:(double)a3
{
  return (id)[a1 fadeAnimationWithDuration:a3 scale:1.0];
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4
{
  return (id)objc_msgSend(a1, "fadeAnimationWithDuration:scale:offset:", a3, a4, 0.0, 0.0);
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4 offset:(UIOffset)a5
{
  double vertical = a5.vertical;
  double horizontal = a5.horizontal;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__184;
  v22[4] = __Block_byref_object_dispose__184;
  id v23 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v9 = *MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v21.c = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v21.tx = v11;
  if (horizontal != 0.0 || vertical != 0.0)
  {
    *(_OWORD *)&v20.a = v9;
    *(_OWORD *)&v20.c = v10;
    *(_OWORD *)&v20.tx = v11;
    CGAffineTransformTranslate(&v21, &v20, horizontal, vertical);
  }
  if (a4 != 1.0)
  {
    CGAffineTransform v19 = v21;
    CGAffineTransformScale(&v20, &v19, a4, a4);
    CGAffineTransform v21 = v20;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  CGAffineTransform v17 = v21;
  v16[2] = __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke;
  v16[3] = &unk_1E5307628;
  v16[4] = v22;
  double v18 = a3;
  v12 = +[_UIStatusBarAnimation animationWithBlock:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3;
  v15[3] = &unk_1E5301EC8;
  v15[4] = v22;
  [v12 setPrepareBlock:v15];
  v13 = [NSString stringWithFormat:@"fadeAnimation[%.2f]", *(void *)&a3];
  [v12 setIdentifier:v13];

  _Block_object_dispose(v22, 8);
  return v12;
}

+ (id)pulseAnimationWithDuration:(double)a3 scale:(double)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke;
  v6[3] = &__block_descriptor_48_e69_v32__0___UIStatusBarAnimation_8___UIStatusBarDisplayItem_16___v__B_24l;
  *(double *)&v6[4] = a3;
  *(double *)&v6[5] = a4;
  v4 = +[_UIStatusBarAnimation animationWithBlock:v6];
  return v4;
}

@end