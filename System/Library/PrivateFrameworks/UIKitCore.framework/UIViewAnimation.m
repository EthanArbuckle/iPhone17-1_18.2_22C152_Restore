@interface UIViewAnimation
- (id)description;
- (id)initWithView:(void *)a3 indexPath:(int)a4 viewType:(int)a5 endRect:(char)a6 endAlpha:(char)a7 startFraction:(char)a8 endFraction:(double)a9 curve:(double)a10 animateFromCurrentPosition:(double)a11 shouldDeleteAfterAnimation:(double)a12 editing:(double)a13;
@end

@implementation UIViewAnimation

- (id)initWithView:(void *)a3 indexPath:(int)a4 viewType:(int)a5 endRect:(char)a6 endAlpha:(char)a7 startFraction:(char)a8 endFraction:(double)a9 curve:(double)a10 animateFromCurrentPosition:(double)a11 shouldDeleteAfterAnimation:(double)a12 editing:(double)a13
{
  id v30 = a2;
  id v31 = a3;
  if (a1)
  {
    v35.receiver = a1;
    v35.super_class = (Class)UIViewAnimation;
    v32 = (id *)objc_msgSendSuper2(&v35, sel_init);
    a1 = v32;
    if (v32)
    {
      objc_storeStrong(v32 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      *((_DWORD *)a1 + 4) = a4;
      *((double *)a1 + 9) = a10;
      *((double *)a1 + 10) = a11;
      *((double *)a1 + 11) = a12;
      *((double *)a1 + 5) = a13;
      *((double *)a1 + 6) = a14;
      *((double *)a1 + 7) = a15;
      *((double *)a1 + 8) = a9;
      if (a15 < a14)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:sel_initWithView_indexPath_viewType_endRect_endAlpha_startFraction_endFraction_curve_animateFromCurrentPosition_shouldDeleteAfterAnimation_editing_ object:a1 file:@"UITableViewSupport.m" lineNumber:2944 description:@"Cell animation stop fraction must be greater than start fraction"];
      }
      *((_DWORD *)a1 + 5) = a5;
      *((unsigned char *)a1 + 8) = a6;
      *((unsigned char *)a1 + 9) = a7;
      *((unsigned char *)a1 + 10) = a8;
      *((unsigned char *)a1 + 11) = 1;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (id)description
{
  v3 = NSStringFromCGRect(self->_endRect);
  v4 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)UIViewAnimation;
  uint64_t v5 = [(UIViewAnimation *)&v12 description];
  v6 = (void *)v5;
  v7 = @"YES";
  if (self->_animateFromCurrentPosition) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (self->_shouldDeleteAfterAnimation) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (!self->_editing) {
    v7 = @"NO";
  }
  v10 = [v4 stringWithFormat:@"%@ view: %@ indexPath: %@ end alpha: %g end rect: %@ fraction: %g->%g curve: %d from current position: %@ delete after anim: %@ editing: %@", v5, self->_view, self->_indexPath, *(void *)&self->_endAlpha, v3, *(void *)&self->_startFraction, *(void *)&self->_endFraction, self->_curve, v8, v9, v7];

  return v10;
}

@end