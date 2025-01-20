@interface CALayer(NeutrinoUIDebugging)
- (id)nu_layerRecursiveDescription;
- (void)_nu_recursiveDescriptionWithLevel:()NeutrinoUIDebugging result:;
@end

@implementation CALayer(NeutrinoUIDebugging)

- (id)nu_layerRecursiveDescription
{
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(a1, "_nu_recursiveDescriptionWithLevel:result:", 0, v2);

  return v2;
}

- (void)_nu_recursiveDescriptionWithLevel:()NeutrinoUIDebugging result:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3 >= 1)
  {
    uint64_t v7 = a3;
    do
    {
      [v6 appendFormat:@" | "];
      --v7;
    }
    while (v7);
  }
  memset(&v30, 0, sizeof(v30));
  [a1 transform];
  CATransform3D v29 = v30;
  if (CATransform3DIsIdentity(&v29))
  {
    v8 = &stru_26C82A148;
  }
  else
  {
    [NSString stringWithFormat:@", %@ = {{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}", @"transform", *(_OWORD *)&v30.m11, *(_OWORD *)&v30.m13, *(_OWORD *)&v30.m21, *(_OWORD *)&v30.m23, *(_OWORD *)&v30.m31, *(_OWORD *)&v30.m33, *(_OWORD *)&v30.m41, *(_OWORD *)&v30.m43];
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  memset(&v29, 0, sizeof(v29));
  [a1 sublayerTransform];
  CATransform3D v28 = v29;
  if (CATransform3DIsIdentity(&v28))
  {
    v23 = &stru_26C82A148;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @", %@ = {{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}", @"sublayerTransform", *(void *)&v29.m11, *(void *)&v29.m12, *(void *)&v29.m13, *(void *)&v29.m14, *(void *)&v29.m21, *(void *)&v29.m22, *(void *)&v29.m23, *(void *)&v29.m24, *(void *)&v29.m31, *(void *)&v29.m32, *(void *)&v29.m33, *(void *)&v29.m34, *(void *)&v29.m41, *(void *)&v29.m42, *(void *)&v29.m43,
      *(void *)&v29.m44);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [a1 frame];
  v11 = NSStringFromCGRect(v35);
  [a1 bounds];
  v12 = NSStringFromCGRect(v36);
  if ([a1 isHidden]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [a1 position];
  v14 = NSStringFromCGPoint(v33);
  [a1 anchorPoint];
  v15 = NSStringFromCGPoint(v34);
  if ([a1 wantsExtendedDynamicRangeContent]) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [v6 appendFormat:@"<%p %@> frame = %@, bounds = %@%@%@, isHidden = %@, position = %@, anchor = %@, edr = %@\n", a1, v10, v11, v12, v8, v23, v13, v14, v15, v16];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v17 = [a1 sublayers];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    uint64_t v21 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "_nu_recursiveDescriptionWithLevel:result:", v21, v6);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v19);
  }
}

@end