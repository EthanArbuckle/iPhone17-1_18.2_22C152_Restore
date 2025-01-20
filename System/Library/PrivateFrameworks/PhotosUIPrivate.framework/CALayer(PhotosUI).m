@interface CALayer(PhotosUI)
+ (void)pu_animateAlongsideView:()PhotosUI animations:;
- (id)_pu_uniqueAnimationKeyWithProposedKey:()PhotosUI;
- (uint64_t)pu_setPosition:()PhotosUI;
- (uint64_t)pu_setTransform:()PhotosUI;
@end

@implementation CALayer(PhotosUI)

- (id)_pu_uniqueAnimationKeyWithProposedKey:()PhotosUI
{
  id v4 = a3;
  v5 = [a1 animationForKey:v4];

  v6 = v4;
  if (v5)
  {
    uint64_t v7 = 2;
    v8 = v4;
    do
    {
      v6 = [NSString stringWithFormat:@"%@-%ld", v4, v7];

      ++v7;
      v9 = [a1 animationForKey:v6];

      v8 = v6;
    }
    while (v9);
  }

  return v6;
}

- (uint64_t)pu_setTransform:()PhotosUI
{
  memset(&v33, 0, sizeof(v33));
  [a1 transform];
  long long v5 = a3[5];
  *(_OWORD *)&a.m31 = a3[4];
  *(_OWORD *)&a.m33 = v5;
  long long v6 = a3[7];
  *(_OWORD *)&a.m41 = a3[6];
  *(_OWORD *)&a.m43 = v6;
  long long v7 = a3[1];
  *(_OWORD *)&a.m11 = *a3;
  *(_OWORD *)&a.m13 = v7;
  long long v8 = a3[3];
  *(_OWORD *)&a.m21 = a3[2];
  *(_OWORD *)&a.m23 = v8;
  CATransform3D b = v33;
  uint64_t result = CATransform3DEqualToTransform(&a, &b);
  if ((result & 1) == 0)
  {
    if (PULayerReferenceBasicAnimation)
    {
      v10 = (void *)[(id)PULayerReferenceBasicAnimation mutableCopy];
      memset(&a, 0, sizeof(a));
      long long v11 = a3[5];
      *(_OWORD *)&b.m31 = a3[4];
      *(_OWORD *)&b.m33 = v11;
      long long v12 = a3[7];
      *(_OWORD *)&b.m41 = a3[6];
      *(_OWORD *)&b.m43 = v12;
      long long v13 = a3[1];
      *(_OWORD *)&b.m11 = *a3;
      *(_OWORD *)&b.m13 = v13;
      long long v14 = a3[3];
      *(_OWORD *)&b.m21 = a3[2];
      *(_OWORD *)&b.m23 = v14;
      CATransform3DInvert(&v30, &b);
      CATransform3D b = v33;
      CATransform3DConcat(&a, &b, &v30);
      CATransform3D b = a;
      v15 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&b];
      [v10 setFromValue:v15];

      long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&b.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&b.m33 = v16;
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&b.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&b.m43 = v17;
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&b.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&b.m13 = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&b.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&b.m23 = v19;
      v20 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&b];
      [v10 setToValue:v20];

      [v10 setKeyPath:@"transform"];
      v21 = [v10 keyPath];
      v22 = objc_msgSend(a1, "_pu_uniqueAnimationKeyWithProposedKey:", v21);

      v23 = [v10 keyPath];
      char v24 = [v22 isEqualToString:v23];

      if ((v24 & 1) == 0)
      {
        v25 = PLUIGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(b.m11) = 0;
          _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEFAULT, "Additive animations of CALayer's transform will not always produce the expected results.", (uint8_t *)&b, 2u);
        }
      }
      [a1 addAnimation:v10 forKey:v22];
    }
    long long v26 = a3[5];
    *(_OWORD *)&a.m31 = a3[4];
    *(_OWORD *)&a.m33 = v26;
    long long v27 = a3[7];
    *(_OWORD *)&a.m41 = a3[6];
    *(_OWORD *)&a.m43 = v27;
    long long v28 = a3[1];
    *(_OWORD *)&a.m11 = *a3;
    *(_OWORD *)&a.m13 = v28;
    long long v29 = a3[3];
    *(_OWORD *)&a.m21 = a3[2];
    *(_OWORD *)&a.m23 = v29;
    return [a1 setTransform:&a];
  }
  return result;
}

- (uint64_t)pu_setPosition:()PhotosUI
{
  uint64_t result = [a1 position];
  if (a2 != v7 || a3 != v8)
  {
    if (PULayerReferenceBasicAnimation)
    {
      double v10 = v7;
      double v11 = v8;
      long long v12 = (void *)[(id)PULayerReferenceBasicAnimation mutableCopy];
      long long v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v10 - a2, v11 - a3);
      [v12 setFromValue:v13];

      long long v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [v12 setToValue:v14];

      [v12 setKeyPath:@"position"];
      v15 = [v12 keyPath];
      long long v16 = objc_msgSend(a1, "_pu_uniqueAnimationKeyWithProposedKey:", v15);

      [a1 addAnimation:v12 forKey:v16];
    }
    return objc_msgSend(a1, "setPosition:", a2, a3);
  }
  return result;
}

+ (void)pu_animateAlongsideView:()PhotosUI animations:
{
  id v21 = a3;
  double v8 = a4;
  if (v21)
  {
    if (!v8) {
      goto LABEL_12;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"CALayer+PhotosUI.m", 31, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];

    if (!v8) {
      goto LABEL_12;
    }
  }
  v9 = (void *)PULayerReferenceView;
  if (PULayerReferenceView) {
    BOOL v10 = PULayerReferenceView == (void)v21;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = NSStringFromSelector(a2);
    [v19 handleFailureInMethod:a2, a1, @"CALayer+PhotosUI.m", 36, @"nested calls to %@ with different views (%@ vs %@)", v20, v21, PULayerReferenceView object file lineNumber description];

    v9 = (void *)PULayerReferenceView;
  }
  id v11 = v9;
  if (v11)
  {
    v8[2](v8);
  }
  else
  {
    long long v12 = objc_msgSend(v21, "_pu_referenceBasicAnimationForCurrentAnimation");
    long long v13 = (void *)[v12 mutableCopy];

    [v13 setDelegate:0];
    [v13 setAdditive:1];
    objc_storeStrong((id *)&PULayerReferenceView, a3);
    long long v14 = (void *)PULayerReferenceBasicAnimation;
    PULayerReferenceBasicAnimation = (uint64_t)v13;
    id v15 = v13;

    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];

    v8[2](v8);
    [MEMORY[0x1E4F39CF8] commit];
    long long v16 = (void *)PULayerReferenceView;
    PULayerReferenceView = 0;

    long long v17 = (void *)PULayerReferenceBasicAnimation;
    PULayerReferenceBasicAnimation = 0;
  }
LABEL_12:
}

@end