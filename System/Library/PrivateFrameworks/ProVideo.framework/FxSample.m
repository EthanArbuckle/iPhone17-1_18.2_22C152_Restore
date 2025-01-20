@interface FxSample
+ (id)_requiredSamplesForSamples:(id)a3;
- (BOOL)isPredetermined;
- (BOOL)supportsContextType:(int)a3;
- (FxSample)init;
- (double)time;
- (id)context;
- (id)domainOfDefinition;
- (id)evaluateWithOptions:(id)a3;
- (id)regionOfInterest;
- (id)requiredSamples;
- (id)stream;
- (unint64_t)fieldOrder;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setRegionOfInterest:(id)a3;
- (void)setStream:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation FxSample

- (FxSample)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxSample;
  v2 = [(FxSample *)&v4 init];
  if (v2) {
    v2->_priv = (FxSamplePriv *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800409938AC02uLL);
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v13.receiver);
  priv = self->_priv;
  if (priv)
  {
    id var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    id var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    id var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v13.receiver = self;
  v13.super_class = (Class)FxSample;
  [(FxSample *)&v13 dealloc];
}

- (id)stream
{
  return self->_priv->var3;
}

- (void)setStream:(id)a3
{
  id var3 = self->_priv->var3;
  if (var3 != a3)
  {
    if (var3) {

    }
    self->_priv->id var3 = a3;
  }
}

- (double)time
{
  return self->_priv->var0;
}

- (void)setTime:(double)a3
{
  self->_priv->var0 = a3;
}

- (id)context
{
  return self->_priv->var1;
}

- (void)setContext:(id)a3
{
  id var1 = self->_priv->var1;
  if (var1 != a3)
  {
    if (var1) {

    }
    self->_priv->id var1 = a3;
  }
}

- (BOOL)supportsContextType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)[self->_priv->var3 provider];

  return [v5 isContextTypeSupported:v3 bySample:self];
}

- (id)domainOfDefinition
{
  uint64_t v3 = (void *)[self->_priv->var3 provider];

  return (id)[v3 domainOfDefinitionForSample:self];
}

- (unint64_t)fieldOrder
{
  uint64_t v3 = (void *)[self->_priv->var3 provider];

  return [v3 fieldOrderForSample:self];
}

- (id)regionOfInterest
{
  id result = self->_priv->var2;
  if (!result) {
    return +[FxShape infiniteShape];
  }
  return result;
}

- (void)setRegionOfInterest:(id)a3
{
  id var2 = self->_priv->var2;
  if (var2 != a3)
  {
    if (var2) {

    }
    self->_priv->id var2 = a3;
  }
}

- (BOOL)isPredetermined
{
  id v3 = [(FxSample *)self stream];
  FxDebugAssert(v3 != 0, &cfstr_StreamIsNullIn.isa, v4, v5, v6, v7, v8, v9, v12);
  v10 = (void *)[v3 provider];

  return [v10 isSamplePredetermined:self];
}

+ (id)_requiredSamplesForSamples:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = (void *)[a3 objectEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    do
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "stream"), "provider"), "requiredSamplesForSample:", v8);
      if (v9)
      {
        v10 = v9;
        if (![v9 count])
        {
          [v10 objectAtIndex:0];
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(a1, "_requiredSamplesForSamples:", v10));
        }
      }
      uint64_t v8 = (void *)[v6 nextObject];
    }
    while (v8);
  }
  return v5;
}

- (id)requiredSamples
{
  BOOL v3 = [(FxSample *)self stream] != 0;
  FxDebugAssert(v3, &cfstr_StreamIsNullIn.isa, v4, v5, v6, v7, v8, v9, v13);
  v10 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObject:self];

  return (id)[v10 _requiredSamplesForSamples:v11];
}

- (id)evaluateWithOptions:(id)a3
{
  uint64_t v4 = self;
  id v5 = [(FxSample *)self stream];
  FxDebugAssert(v5 != 0, &cfstr_StreamIsNullIn_0.isa, v6, v7, v8, v9, v10, v11, v53);
  char v12 = (void *)[v5 provider];
  id v13 = [(FxSample *)v4 context];
  if (v13
    && (v14 = v13,
        uint64_t v15 = [v13 contextType],
        ![v12 isContextTypeSupported:v15 bySample:v4]))
  {
    uint64_t v17 = [v14 options];
    v18 = objc_msgSend(-[FxSample regionOfInterest](v4, "regionOfInterest"), "intersectWithShape:", -[FxSample domainOfDefinition](v4, "domainOfDefinition"));
    int v19 = [v18 isInfinite];
    if (FxDebugAssert(v19 ^ 1u, &cfstr_CannotRenderAn.isa, v20, v21, v22, v23, v24, v25, v54))
    {
      [v18 extent];
      switch((int)v15)
      {
        case 0:
          v37 = @"Unsupported FxContext conversion: kFxContextType_Invalid to anything";
          goto LABEL_66;
        case 1:
          if ([v12 isContextTypeSupported:2 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGContext to CGImage";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:3 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: GLTexture to CGImage";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:4 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: GLContext to CGImage";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:5 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: Bitmap to CGImage";
            goto LABEL_66;
          }
          if (![v12 isContextTypeSupported:6 bySample:v4]) {
            return 0;
          }
          v37 = @"Unsupported FxContext conversion: CIImage to CGImage";
          goto LABEL_66;
        case 2:
          CGFloat v38 = v33;
          CGFloat v39 = v34;
          CGFloat v40 = v35;
          CGFloat v41 = v36;
          if ([v12 isContextTypeSupported:1 bySample:v4])
          {
            id v42 = +[FxContext contextForCGImageWithOptions:v17];
            [(FxSample *)v4 setContext:v42];
            if (objc_msgSend((id)objc_msgSend(v5, "provider"), "evaluateSample:withOptions:", v4, a3))
            {
              v43 = (CGImage *)[v42 cgImage];
              v44 = (CGContext *)[v14 cgContext];
              v57.origin.x = v38;
              v57.origin.y = v39;
              v57.size.width = v40;
              v57.size.height = v41;
              CGContextDrawImage(v44, v57, v43);
              v45 = v14;
            }
            else
            {
              v45 = 0;
            }
            [(FxSample *)v4 setContext:v14];
            return v45;
          }
          if ([v12 isContextTypeSupported:6 bySample:v4]) {
            return v4;
          }
          if ([v12 isContextTypeSupported:3 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: GLTexture to CGContext";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:4 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: GLContext to CGContext";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:5 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: Bitmap to CGContext";
            goto LABEL_66;
          }
          return 0;
        case 3:
          if ([v12 isContextTypeSupported:1 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGImage to GLTexture";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:2 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGContext to GLTexture";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:4 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: GLContext to GLTexture";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:5 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: Bitmap to GLTexture";
            goto LABEL_66;
          }
          if (![v12 isContextTypeSupported:6 bySample:v4]) {
            return 0;
          }
          v37 = @"Unsupported FxContext conversion: CIImage to GLTexture";
          goto LABEL_66;
        case 4:
          if ([v12 isContextTypeSupported:6 bySample:v4]) {
            return v4;
          }
          if ([v12 isContextTypeSupported:1 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGImage to GLContext";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:2 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGContext to GLContext";
            goto LABEL_66;
          }
          if (![v12 isContextTypeSupported:3 bySample:v4]
            && ![v12 isContextTypeSupported:5 bySample:v4])
          {
            return 0;
          }
          v37 = @"Unsupported FxContext conversion: Bitmap to GLContext";
          goto LABEL_66;
        case 5:
          if ([v12 isContextTypeSupported:6 bySample:v4]) {
            return v4;
          }
          if ([v12 isContextTypeSupported:1 bySample:v4]) {
            FxDebugLog(&cfstr_UnsupportedFxc_15.isa, v46, v47, v48, v49, v50, v51, v52, v55);
          }
          if ([v12 isContextTypeSupported:2 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGContext to Bitmap";
            goto LABEL_66;
          }
          if ([v12 isContextTypeSupported:3 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: GLTexture to Bitmap";
            goto LABEL_66;
          }
          if (![v12 isContextTypeSupported:4 bySample:v4]) {
            return 0;
          }
          v37 = @"Unsupported FxContext conversion: GLContext to Bitmap";
          goto LABEL_66;
        case 6:
          if (([v12 isContextTypeSupported:3 bySample:v4] & 1) != 0
            || ([v12 isContextTypeSupported:5 bySample:v4] & 1) != 0)
          {
            return v4;
          }
          if ([v12 isContextTypeSupported:1 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGImage to CIImage";
          }
          else if ([v12 isContextTypeSupported:2 bySample:v4])
          {
            v37 = @"Unsupported FxContext conversion: CGContext to CIImage";
          }
          else
          {
            if (![v12 isContextTypeSupported:4 bySample:v4]) {
              return 0;
            }
            v37 = @"Unsupported FxContext conversion: GLContext to CIImage";
          }
LABEL_66:
          FxDebugLog(&v37->isa, v26, v27, v28, v29, v30, v31, v32, v55);
          break;
        default:
          return 0;
      }
    }
    return 0;
  }
  else
  {
    return (id)[v12 evaluateSample:v4 withOptions:a3];
  }
}

@end