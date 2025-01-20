@interface UIView(PKUIAnimationUtilities)
- (double)pkui_setAlpha:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setAlpha:()PKUIAnimationUtilities withAnimationFactory:animation:;
- (double)pkui_setAlpha:()PKUIAnimationUtilities withAnimationFactory:completion:;
- (double)pkui_setBounds:()PKUIAnimationUtilities animated:;
- (double)pkui_setBounds:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
- (double)pkui_setCornerRadius:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
- (double)pkui_setFrame:()PKUIAnimationUtilities animated:;
- (double)pkui_setFrame:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
- (double)pkui_setPosition:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
- (double)pkui_setShadowOffset:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities withAnimationFactory:animation:;
- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities withAnimationFactory:completion:;
- (double)pkui_setShadowRadius:()PKUIAnimationUtilities animated:withCompletion:;
- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities animated:;
- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities animated:completion:;
- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities withAnimationFactory:animation:;
- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities withAnimationFactory:completion:;
- (void)pkui_setAlpha:()PKUIAnimationUtilities animated:;
- (void)pkui_setCornerRadius:()PKUIAnimationUtilities animated:;
- (void)pkui_setPosition:()PKUIAnimationUtilities animated:;
- (void)pkui_setShadowOffset:()PKUIAnimationUtilities animated:;
- (void)pkui_setShadowOpacity:()PKUIAnimationUtilities animated:;
- (void)pkui_setShadowRadius:()PKUIAnimationUtilities animated:;
- (void)pkui_setTransform:()PKUIAnimationUtilities animated:;
- (void)pkui_setTransform:()PKUIAnimationUtilities animated:withCompletion:;
- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:;
- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:;
- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:;
@end

@implementation UIView(PKUIAnimationUtilities)

- (double)pkui_setAlpha:()PKUIAnimationUtilities withAnimationFactory:animation:
{
  id v8 = a4;
  [a1 alpha];
  double v10 = v9;
  if (v9 == a2
    || (v21[0] = MEMORY[0x1E4F143A8],
        v21[1] = 3221225472,
        v21[2] = __79__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_animation___block_invoke,
        v21[3] = &unk_1E59CB460,
        v21[4] = a1,
        *(double *)&v21[5] = a2,
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v21],
        !v8))
  {
    v11 = 0;
    if (!a5) {
      goto LABEL_9;
    }
LABEL_8:
    objc_storeStrong(a5, v11);
    goto LABEL_9;
  }
  v11 = [v8 springAnimationWithKeyPath:@"opacity"];
  [v11 setAdditive:0];
  v12 = [a1 layer];
  v13 = [v12 presentationLayer];
  v14 = v13;
  v15 = NSNumber;
  double v16 = v10;
  if (v13)
  {
    objc_msgSend(v13, "opacity", v10);
    double v16 = v17;
  }
  v18 = [v15 numberWithDouble:v16];
  [v11 setFromValue:v18];

  v19 = [NSNumber numberWithDouble:a2];
  [v11 setToValue:v19];

  if (a5) {
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities animated:
{
  if (a7)
  {
    v12 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", v12, 0, a2, a3, a4, a5);
    double v14 = v13;
  }
  else
  {
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", 0, 0, a2, a3, a4, a5);
    return v15;
  }
  return v14;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a7)
  {
    double v13 = (void *)MEMORY[0x1E4F85060];
    id v14 = a8;
    id v15 = (id)[v13 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", v15, v14, a2, a3, a4, a5);
    double v17 = v16;
  }
  else
  {
    id v15 = a8;
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", 0, v15, a2, a3, a4, a5);
    double v17 = v18;
  }

  return v17;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v14 = a8;
  id v27 = 0;
  if (a7) {
    id v15 = &v27;
  }
  else {
    id v15 = 0;
  }
  objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:animation:", a7, v15, a2, a3, a4, a5);
  double v17 = v16;
  id v18 = v27;
  if (v27)
  {
    if (v14)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __88__UIView_PKUIAnimationUtilities__pkui_setFrame_withAdditiveAnimationFactory_completion___block_invoke;
      v25 = &unk_1E59CA9F8;
      id v26 = v14;
      objc_msgSend(v18, "pkui_setCompletionHandler:", &v22);
    }
    v19 = objc_msgSend(a1, "layer", v22, v23, v24, v25);
    id v20 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v27);
  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities animated:
{
  if (a7)
  {
    v12 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", v12, 0, a2, a3, a4, a5);
    double v14 = v13;
  }
  else
  {
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", 0, 0, a2, a3, a4, a5);
    return v15;
  }
  return v14;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a7)
  {
    double v13 = (void *)MEMORY[0x1E4F85060];
    id v14 = a8;
    id v15 = (id)[v13 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", v15, v14, a2, a3, a4, a5);
    double v17 = v16;
  }
  else
  {
    id v15 = a8;
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", 0, v15, a2, a3, a4, a5);
    double v17 = v18;
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v14 = a8;
  id v27 = 0;
  if (a7) {
    id v15 = &v27;
  }
  else {
    id v15 = 0;
  }
  objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:animation:", a7, v15, a2, a3, a4, a5);
  double v17 = v16;
  id v18 = v27;
  if (v27)
  {
    if (v14)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __89__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_completion___block_invoke;
      v25 = &unk_1E59CA9F8;
      id v26 = v14;
      objc_msgSend(v18, "pkui_setCompletionHandler:", &v22);
    }
    v19 = objc_msgSend(a1, "layer", v22, v23, v24, v25);
    id v20 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v27);
  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

  return v17;
}

- (void)pkui_setPosition:()PKUIAnimationUtilities animated:
{
  if (a5)
  {
    id v8 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", v8, 0, a2, a3);
  }
  else
  {
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", 0, 0);
  }
}

- (double)pkui_setPosition:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a5)
  {
    double v9 = (void *)MEMORY[0x1E4F85060];
    id v10 = a6;
    id v11 = (id)[v9 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", v11, v10, a2, a3);
    double v13 = v12;
  }
  else
  {
    id v11 = a6;
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", 0, v11, a2, a3);
    double v13 = v14;
  }

  return v13;
}

- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v10 = a6;
  id v23 = 0;
  if (a5) {
    id v11 = &v23;
  }
  else {
    id v11 = 0;
  }
  objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  double v13 = v12;
  id v14 = v23;
  if (v23)
  {
    if (v10)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __91__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_completion___block_invoke;
      v21 = &unk_1E59CA9F8;
      id v22 = v10;
      objc_msgSend(v14, "pkui_setCompletionHandler:", &v18);
    }
    id v15 = objc_msgSend(a1, "layer", v18, v19, v20, v21);
    id v16 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v23);
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

  return v13;
}

- (void)pkui_setTransform:()PKUIAnimationUtilities animated:
{
  if (a4)
  {
    v6 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    long long v7 = a3[5];
    long long v19 = a3[4];
    long long v20 = v7;
    long long v8 = a3[7];
    long long v21 = a3[6];
    long long v22 = v8;
    long long v9 = a3[1];
    long long v15 = *a3;
    long long v16 = v9;
    long long v10 = a3[3];
    long long v17 = a3[2];
    long long v18 = v10;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v15, v6, 0);
  }
  else
  {
    long long v11 = a3[5];
    long long v19 = a3[4];
    long long v20 = v11;
    long long v12 = a3[7];
    long long v21 = a3[6];
    long long v22 = v12;
    long long v13 = a3[1];
    long long v15 = *a3;
    long long v16 = v13;
    long long v14 = a3[3];
    long long v17 = a3[2];
    long long v18 = v14;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v15, 0, 0);
  }
}

- (void)pkui_setTransform:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a4)
  {
    long long v7 = (void *)MEMORY[0x1E4F85060];
    id v8 = a5;
    long long v9 = (void *)[v7 sharedDefaultFactory];
    long long v10 = a3[5];
    long long v23 = a3[4];
    long long v24 = v10;
    long long v11 = a3[7];
    long long v25 = a3[6];
    long long v26 = v11;
    long long v12 = a3[1];
    long long v19 = *a3;
    long long v20 = v12;
    long long v13 = a3[3];
    long long v21 = a3[2];
    long long v22 = v13;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v19, v9, v8);
  }
  else
  {
    long long v14 = a3[5];
    long long v23 = a3[4];
    long long v24 = v14;
    long long v15 = a3[7];
    long long v25 = a3[6];
    long long v26 = v15;
    long long v16 = a3[1];
    long long v19 = *a3;
    long long v20 = v16;
    long long v17 = a3[3];
    long long v21 = a3[2];
    long long v22 = v17;
    id v18 = a5;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v19, 0, v18);
  }
}

- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v9 = a4;
  id v21 = 0;
  *a5 = 0u;
  a5[1] = 0u;
  a5[2] = 0u;
  a5[3] = 0u;
  a5[4] = 0u;
  a5[5] = 0u;
  a5[6] = 0u;
  a5[7] = 0u;
  if (a3) {
    long long v10 = &v21;
  }
  else {
    long long v10 = 0;
  }
  long long v11 = a2[5];
  v20[4] = a2[4];
  v20[5] = v11;
  long long v12 = a2[7];
  v20[6] = a2[6];
  v20[7] = v12;
  long long v13 = a2[1];
  v20[0] = *a2;
  v20[1] = v13;
  long long v14 = a2[3];
  v20[2] = a2[2];
  v20[3] = v14;
  objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:animation:", v20, a3, v10);
  id v15 = v21;
  if (v21)
  {
    if (v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __92__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_completion___block_invoke;
      v18[3] = &unk_1E59CA9F8;
      id v19 = v9;
      objc_msgSend(v15, "pkui_setCompletionHandler:", v18);
    }
    long long v16 = [a1 layer];
    id v17 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v21);
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (void)pkui_setAlpha:()PKUIAnimationUtilities animated:
{
  if (a4)
  {
    v6 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", v6, 0, a2);
  }
  else
  {
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", 0, 0);
  }
}

- (double)pkui_setAlpha:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a4)
  {
    long long v7 = (void *)MEMORY[0x1E4F85060];
    id v8 = a5;
    id v9 = (id)[v7 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", v9, v8, a2);
    double v11 = v10;
  }
  else
  {
    id v9 = a5;
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", 0, v9, a2);
    double v11 = v12;
  }

  return v11;
}

- (double)pkui_setAlpha:()PKUIAnimationUtilities withAnimationFactory:completion:
{
  id v8 = a5;
  id v21 = 0;
  if (a4) {
    id v9 = &v21;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:animation:", a4, v9, a2);
  double v11 = v10;
  id v12 = v21;
  if (v21)
  {
    if (v8)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __80__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_completion___block_invoke;
      id v19 = &unk_1E59CA9F8;
      id v20 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v16);
    }
    long long v13 = objc_msgSend(a1, "layer", v16, v17, v18, v19);
    [v13 removeAnimationForKey:@"opacity"];
    [v13 addAnimation:v21 forKey:@"opacity"];
  }
  else
  {
    if (!a4 && v10 != a2)
    {
      long long v14 = [a1 layer];
      [v14 removeAnimationForKey:@"opacity"];
    }
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }

  return v11;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities animated:
{
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E4F85060];
    id v6 = a3;
    id v7 = (id)[v5 sharedDefaultFactory];
    uint64_t v8 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v6, v7, 0);
  }
  else
  {
    id v7 = a3;
    uint64_t v8 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v7, 0, 0);
  }

  return v8;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities animated:completion:
{
  if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F85060];
    id v8 = a5;
    id v9 = a3;
    id v10 = (id)[v7 sharedDefaultFactory];
    uint64_t v11 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v9, v10, v8);
  }
  else
  {
    id v9 = a5;
    id v10 = a3;
    uint64_t v11 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v10, 0, v9);
  }

  return v11;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities withAnimationFactory:completion:
{
  id v8 = a5;
  id v19 = 0;
  if (a4) {
    id v9 = &v19;
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:animation:", a3, a4, v9);
  id v11 = v19;
  if (v19)
  {
    if (v8)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __90__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_completion___block_invoke;
      uint64_t v17 = &unk_1E59CA9F8;
      id v18 = v8;
      objc_msgSend(v11, "pkui_setCompletionHandler:", &v14);
    }
    id v12 = objc_msgSend(a1, "layer", v14, v15, v16, v17);
    [v12 removeAnimationForKey:@"backgroundColor"];
    [v12 addAnimation:v19 forKey:@"backgroundColor"];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v10;
}

- (void)pkui_setCornerRadius:()PKUIAnimationUtilities animated:
{
  if (a4)
  {
    id v6 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", v6, 0, a2);
  }
  else
  {
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", 0, 0);
  }
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F85060];
    id v8 = a5;
    id v9 = (id)[v7 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", v9, v8, a2);
    double v11 = v10;
  }
  else
  {
    id v9 = a5;
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", 0, v9, a2);
    double v11 = v12;
  }

  return v11;
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v8 = a5;
  id v21 = 0;
  if (a4) {
    id v9 = &v21;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  double v11 = v10;
  id v12 = v21;
  if (v21)
  {
    if (v8)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __95__UIView_PKUIAnimationUtilities__pkui_setCornerRadius_withAdditiveAnimationFactory_completion___block_invoke;
      id v19 = &unk_1E59CA9F8;
      id v20 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v16);
    }
    long long v13 = objc_msgSend(a1, "layer", v16, v17, v18, v19);
    id v14 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v21);
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (void)pkui_setShadowOpacity:()PKUIAnimationUtilities animated:
{
  if (a4)
  {
    id v6 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", v6, 0, a2);
  }
  else
  {
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", 0, 0);
  }
}

- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F85060];
    id v8 = a5;
    id v9 = (id)[v7 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", v9, v8, a2);
    double v11 = v10;
  }
  else
  {
    id v9 = a5;
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", 0, v9, a2);
    double v11 = v12;
  }

  return v11;
}

- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities withAnimationFactory:completion:
{
  id v8 = a5;
  id v20 = 0;
  if (a4) {
    id v9 = &v20;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:animation:", a4, v9, a2);
  double v11 = v10;
  id v12 = v20;
  if (v20)
  {
    if (v8)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __88__UIView_PKUIAnimationUtilities__pkui_setShadowOpacity_withAnimationFactory_completion___block_invoke;
      id v18 = &unk_1E59CA9F8;
      id v19 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v15);
    }
    long long v13 = objc_msgSend(a1, "layer", v15, v16, v17, v18);
    [v13 removeAnimationForKey:@"shadowOpacity"];
    [v13 addAnimation:v20 forKey:@"shadowOpacity"];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (void)pkui_setShadowOffset:()PKUIAnimationUtilities animated:
{
  if (a5)
  {
    id v8 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", v8, 0, a2, a3);
  }
  else
  {
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", 0, 0);
  }
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a5)
  {
    id v9 = (void *)MEMORY[0x1E4F85060];
    id v10 = a6;
    id v11 = (id)[v9 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", v11, v10, a2, a3);
    double v13 = v12;
  }
  else
  {
    id v11 = a6;
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", 0, v11, a2, a3);
    double v13 = v14;
  }

  return v13;
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v10 = a6;
  id v23 = 0;
  if (a5) {
    id v11 = &v23;
  }
  else {
    id v11 = 0;
  }
  objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  double v13 = v12;
  id v14 = v23;
  if (v23)
  {
    if (v10)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __95__UIView_PKUIAnimationUtilities__pkui_setShadowOffset_withAdditiveAnimationFactory_completion___block_invoke;
      id v21 = &unk_1E59CA9F8;
      id v22 = v10;
      objc_msgSend(v14, "pkui_setCompletionHandler:", &v18);
    }
    uint64_t v15 = objc_msgSend(a1, "layer", v18, v19, v20, v21);
    id v16 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v23);
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

  return v13;
}

- (void)pkui_setShadowRadius:()PKUIAnimationUtilities animated:
{
  if (a4)
  {
    id v6 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", v6, 0, a2);
  }
  else
  {
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", 0, 0);
  }
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities animated:withCompletion:
{
  if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F85060];
    id v8 = a5;
    id v9 = (id)[v7 sharedDefaultFactory];
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", v9, v8, a2);
    double v11 = v10;
  }
  else
  {
    id v9 = a5;
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", 0, v9, a2);
    double v11 = v12;
  }

  return v11;
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v8 = a5;
  id v21 = 0;
  if (a4) {
    id v9 = &v21;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  double v11 = v10;
  id v12 = v21;
  if (v21)
  {
    if (v8)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __95__UIView_PKUIAnimationUtilities__pkui_setShadowRadius_withAdditiveAnimationFactory_completion___block_invoke;
      uint64_t v19 = &unk_1E59CA9F8;
      id v20 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v16);
    }
    double v13 = objc_msgSend(a1, "layer", v16, v17, v18, v19);
    id v14 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v21);
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v14 = a7;
  if (v14) {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v15 = 0;
  }
  objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:accumulator:", v14, v15, a2, a3, a4, a5);
  double v17 = v16;
  uint64_t v18 = PKGroupAnimations(v15);
  if (a8) {
    objc_storeStrong(a8, v18);
  }

  return v17;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v14 = a7;
  id v15 = a8;
  [a1 frame];
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  v37.origin.double x = a2;
  v37.origin.double y = a3;
  v37.size.double width = a4;
  v37.size.double height = a5;
  CGRect v38 = CGRectStandardize(v37);
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  double height = v38.size.height;
  v38.origin.double x = v17;
  v38.origin.double y = v19;
  v38.size.double width = v21;
  v38.size.double height = v23;
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  if (!CGRectEqualToRect(v38, v39))
  {
    [a1 bounds];
    double v35 = v29;
    double v36 = v28;
    [a1 anchorPoint];
    double v31 = x + v30 * width;
    double v33 = y + v32 * height;
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:accumulator:", v14, v15, v36, v35, width, height);
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:accumulator:", v14, v15, v31, v33);
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v14 = a7;
  if (v14) {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v15 = 0;
  }
  objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:accumulator:", v14, v15, a2, a3, a4, a5);
  double v17 = v16;
  double v18 = PKGroupAnimations(v15);
  if (a8) {
    objc_storeStrong(a8, v18);
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v14 = a7;
  id v15 = a8;
  [a1 bounds];
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  v25.origin.double x = a2;
  v25.origin.double y = a3;
  v25.size.double width = a4;
  v25.size.double height = a5;
  if (!CGRectEqualToRect(v24, v25))
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_accumulator___block_invoke;
    v23[3] = &unk_1E59CBC90;
    v23[4] = a1;
    *(CGFloat *)&v23[5] = a2;
    *(CGFloat *)&v23[6] = a3;
    *(CGFloat *)&v23[7] = a4;
    *(CGFloat *)&v23[8] = a5;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v23];
    if (v14)
    {
      if (x != a2 || y != a3)
      {
        double v20 = [v14 springAnimationWithKeyPath:@"bounds.origin"];
        objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", x, y, a2, a3);
        [v15 addObject:v20];
      }
      if (width != a4 || height != a5)
      {
        CGFloat v21 = [v14 springAnimationWithKeyPath:@"bounds.size"];
        objc_msgSend(v21, "pkui_updateForAdditiveAnimationFromSize:toSize:", width, height, a4, a5);
        [v15 addObject:v21];
      }
    }
  }

  return x;
}

- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v10 = a5;
  [a1 center];
  double v13 = v12;
  double v14 = v11;
  if (v12 != a2 || v11 != a3)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_animation___block_invoke;
    v18[3] = &unk_1E59CBCB8;
    void v18[4] = a1;
    *(double *)&v18[5] = a2;
    *(double *)&v18[6] = a3;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v18];
    if (v10)
    {
      double v16 = [v10 springAnimationWithKeyPath:@"position"];
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v13, v14, a2, a3);
      if (!a6) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  double v16 = 0;
  if (a6) {
LABEL_9:
  }
    objc_storeStrong(a6, v16);
LABEL_10:

  return v13;
}

- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v10 = a6;
  id v15 = 0;
  if (a5) {
    double v11 = &v15;
  }
  else {
    double v11 = 0;
  }
  objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  double v13 = v12;
  if (v15)
  {
    objc_msgSend(v10, "addObject:");
  }
  return v13;
}

- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v9 = a3;
  *a5 = 0u;
  a5[1] = 0u;
  a5[2] = 0u;
  a5[3] = 0u;
  a5[4] = 0u;
  a5[5] = 0u;
  a5[6] = 0u;
  a5[7] = 0u;
  [a1 transform3D];
  long long v10 = a5[5];
  *(_OWORD *)&a.m31 = a5[4];
  *(_OWORD *)&a.m33 = v10;
  long long v11 = a5[7];
  *(_OWORD *)&a.m41 = a5[6];
  *(_OWORD *)&a.m43 = v11;
  long long v12 = a5[1];
  *(_OWORD *)&a.m11 = *a5;
  *(_OWORD *)&a.m13 = v12;
  long long v13 = a5[3];
  *(_OWORD *)&a.m21 = a5[2];
  *(_OWORD *)&a.m23 = v13;
  long long v14 = a2[5];
  *(_OWORD *)&b.m31 = a2[4];
  *(_OWORD *)&b.m33 = v14;
  long long v15 = a2[7];
  *(_OWORD *)&b.m41 = a2[6];
  *(_OWORD *)&b.m43 = v15;
  long long v16 = a2[1];
  *(_OWORD *)&b.m11 = *a2;
  *(_OWORD *)&b.m13 = v16;
  long long v17 = a2[3];
  *(_OWORD *)&b.m21 = a2[2];
  *(_OWORD *)&b.m23 = v17;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    long long v18 = a2[5];
    long long v36 = a2[4];
    long long v37 = v18;
    long long v19 = a2[7];
    long long v38 = a2[6];
    long long v39 = v19;
    long long v20 = a2[1];
    long long v32 = *a2;
    long long v33 = v20;
    long long v21 = a2[3];
    long long v34 = a2[2];
    long long v35 = v21;
    v31[2] = __91__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_animation___block_invoke;
    v31[3] = &unk_1E59CBCE0;
    v31[4] = a1;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v31];
    if (v9)
    {
      double v22 = [v9 springAnimationWithKeyPath:@"transform"];
      long long v23 = a5[5];
      *(_OWORD *)&a.m31 = a5[4];
      *(_OWORD *)&a.m33 = v23;
      long long v24 = a5[7];
      *(_OWORD *)&a.m41 = a5[6];
      *(_OWORD *)&a.m43 = v24;
      long long v25 = a5[1];
      *(_OWORD *)&a.m11 = *a5;
      *(_OWORD *)&a.m13 = v25;
      long long v26 = a5[3];
      *(_OWORD *)&a.m21 = a5[2];
      *(_OWORD *)&a.m23 = v26;
      long long v27 = a2[5];
      *(_OWORD *)&b.m31 = a2[4];
      *(_OWORD *)&b.m33 = v27;
      long long v28 = a2[7];
      *(_OWORD *)&b.m41 = a2[6];
      *(_OWORD *)&b.m43 = v28;
      long long v29 = a2[1];
      *(_OWORD *)&b.m11 = *a2;
      *(_OWORD *)&b.m13 = v29;
      long long v30 = a2[3];
      *(_OWORD *)&b.m21 = a2[2];
      *(_OWORD *)&b.m23 = v30;
      objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  double v22 = 0;
  if (a4) {
LABEL_6:
  }
    objc_storeStrong(a4, v22);
LABEL_7:
}

- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v9 = a4;
  id v16 = 0;
  *a5 = 0u;
  a5[1] = 0u;
  a5[2] = 0u;
  a5[3] = 0u;
  a5[4] = 0u;
  a5[5] = 0u;
  a5[6] = 0u;
  a5[7] = 0u;
  if (a3) {
    long long v10 = &v16;
  }
  else {
    long long v10 = 0;
  }
  long long v11 = a2[5];
  v15[4] = a2[4];
  v15[5] = v11;
  long long v12 = a2[7];
  v15[6] = a2[6];
  v15[7] = v12;
  long long v13 = a2[1];
  v15[0] = *a2;
  v15[1] = v13;
  long long v14 = a2[3];
  v15[2] = a2[2];
  v15[3] = v14;
  objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:animation:", v15, a3, v10);
  if (v16)
  {
    objc_msgSend(v9, "addObject:");
  }
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities withAnimationFactory:animation:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 backgroundColor];
  if ((id)v10 != v8)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke;
    v23[3] = &unk_1E59CA870;
    v23[4] = a1;
    v23[5] = v8;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v23];
    if (v9)
    {
      long long v11 = [v9 springAnimationWithKeyPath:@"backgroundColor"];
      [v11 setAdditive:0];
      long long v12 = [a1 layer];
      long long v13 = [v12 presentationLayer];
      long long v14 = [a1 traitCollection];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke_2;
      v18[3] = &unk_1E59CB8B0;
      id v15 = v11;
      id v19 = v15;
      id v20 = v13;
      uint64_t v21 = v10;
      id v22 = v8;
      id v16 = v13;
      PKUIPerformWithEffectiveTraitCollection(v14, v18);

      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  id v15 = 0;
  if (a5) {
LABEL_6:
  }
    objc_storeStrong(a5, v15);
LABEL_7:

  return v10;
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v8 = a4;
  id v9 = [a1 layer];
  [v9 cornerRadius];
  double v11 = v10;
  if (v10 != a2)
  {
    [v9 setCornerRadius:a2];
    if (v8)
    {
      long long v12 = [v8 springAnimationWithKeyPath:@"cornerRadius"];
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v11, a2);
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  long long v12 = 0;
  if (a5) {
LABEL_6:
  }
    objc_storeStrong(a5, v12);
LABEL_7:

  return v11;
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v8 = a5;
  id v13 = 0;
  if (a4) {
    id v9 = &v13;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  double v11 = v10;
  if (v13)
  {
    objc_msgSend(v8, "addObject:");
  }
  return v11;
}

- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities withAnimationFactory:animation:
{
  id v8 = a4;
  id v9 = [a1 layer];
  [v9 shadowOpacity];
  double v11 = *(float *)&v10;
  if (*(float *)&v10 == a2 || (*(float *)&double v10 = a2, [v9 setShadowOpacity:v10], !v8))
  {
    long long v12 = 0;
    if (!a5) {
      goto LABEL_9;
    }
LABEL_8:
    objc_storeStrong(a5, v12);
    goto LABEL_9;
  }
  long long v12 = [v8 springAnimationWithKeyPath:@"shadowOpacity"];
  [v12 setAdditive:0];
  id v13 = [a1 layer];
  long long v14 = [v13 presentationLayer];
  id v15 = v14;
  id v16 = NSNumber;
  double v17 = v11;
  if (v14)
  {
    objc_msgSend(v14, "shadowOpacity", v11);
    double v17 = v18;
  }
  id v19 = [v16 numberWithDouble:v17];
  [v12 setFromValue:v19];

  id v20 = [NSNumber numberWithDouble:a2];
  [v12 setToValue:v20];

  if (a5) {
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v10 = a5;
  double v11 = [a1 layer];
  [v11 shadowOffset];
  double v14 = v13;
  double v15 = v12;
  if (v13 != a2 || v12 != a3)
  {
    objc_msgSend(v11, "setShadowOffset:", a2, a3);
    if (v10)
    {
      double v17 = [v10 springAnimationWithKeyPath:@"shadowOffset"];
      objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromSize:toSize:", v14, v15, a2, a3);
      if (!a6) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  double v17 = 0;
  if (a6) {
LABEL_9:
  }
    objc_storeStrong(a6, v17);
LABEL_10:

  return v14;
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v10 = a6;
  id v15 = 0;
  if (a5) {
    double v11 = &v15;
  }
  else {
    double v11 = 0;
  }
  objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  double v13 = v12;
  if (v15)
  {
    objc_msgSend(v10, "addObject:");
  }
  return v13;
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v8 = a4;
  id v9 = [a1 layer];
  [v9 shadowRadius];
  double v11 = v10;
  if (v10 != a2)
  {
    [v9 setShadowRadius:a2];
    if (v8)
    {
      double v12 = [v8 springAnimationWithKeyPath:@"shadowRadius"];
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v11, a2);
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  double v12 = 0;
  if (a5) {
LABEL_6:
  }
    objc_storeStrong(a5, v12);
LABEL_7:

  return v11;
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v8 = a5;
  id v13 = 0;
  if (a4) {
    id v9 = &v13;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  double v11 = v10;
  if (v13)
  {
    objc_msgSend(v8, "addObject:");
  }
  return v11;
}

@end