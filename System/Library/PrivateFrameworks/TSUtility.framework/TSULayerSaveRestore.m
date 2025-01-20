@interface TSULayerSaveRestore
- (BOOL)restoreLayer:(id)a3;
- (TSURetainedPointerKeyDictionary)layerStates;
- (id)objectForLayer:(id)a3 key:(id)a4;
- (void)dealloc;
- (void)saveLayer:(id)a3;
- (void)setLayerStates:(id)a3;
@end

@implementation TSULayerSaveRestore

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSULayerSaveRestore;
  [(TSULayerSaveRestore *)&v3 dealloc];
}

- (id)objectForLayer:(id)a3 key:(id)a4
{
  id v5 = [(TSUNoCopyDictionary *)[(TSULayerSaveRestore *)self layerStates] objectForKey:a3];
  return (id)[v5 objectForKey:a4];
}

- (void)saveLayer:(id)a3
{
  if (a3)
  {
    if (![(TSULayerSaveRestore *)self layerStates])
    {
      id v5 = objc_alloc_init(TSURetainedPointerKeyDictionary);
      [(TSULayerSaveRestore *)self setLayerStates:v5];
    }
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = (void *)MEMORY[0x263F08D40];
    [a3 transform];
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v7, "valueWithCATransform3D:", &v15), @"transform");
    v8 = NSNumber;
    [a3 opacity];
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v8, "numberWithFloat:"), @"opacity");
    v9 = NSNumber;
    [a3 shadowOpacity];
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v9, "numberWithFloat:"), @"shadowOpacity");
    v10 = (void *)MEMORY[0x263F08D40];
    [a3 position];
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v10, "valueWithCGPoint:"), @"position");
    v11 = (void *)MEMORY[0x263F08D40];
    [a3 anchorPoint];
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v11, "valueWithCGPoint:"), @"anchorPoint");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isHidden")), @"hidden");
    v12 = NSNumber;
    [a3 zPosition];
    *(float *)&double v13 = v13;
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v12, "numberWithFloat:", v13), @"zPosition");
    if ([a3 superlayer]) {
      uint64_t v14 = [a3 superlayer];
    }
    else {
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];
    }
    [v6 setObject:v14 forKey:@"superlayer"];
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "superlayer"), "sublayers"), "indexOfObject:", a3)), @"layerIndex");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_msgSend(a3, "animationKeys"), "count") != 0), @"hasAnimations");
    [(TSUNoCopyDictionary *)[(TSULayerSaveRestore *)self layerStates] setObject:v6 forKey:a3];
  }
}

- (BOOL)restoreLayer:(id)a3
{
  if (a3)
  {
    id v5 = [(TSUNoCopyDictionary *)[(TSULayerSaveRestore *)self layerStates] objectForKey:a3];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = [v5 objectForKey:@"superlayer"];
      if (v7)
      {
        v8 = (void *)v7;
        if (v7 != [MEMORY[0x263EFF9D0] null] && v8 != objc_msgSend(a3, "superlayer")) {
          objc_msgSend(v8, "insertSublayer:atIndex:", a3, objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"layerIndex"), "intValue"));
        }
      }
      memset(&v36, 0, sizeof(v36));
      v9 = (void *)[v6 objectForKey:@"transform"];
      if (v9) {
        [v9 CATransform3DValue];
      }
      else {
        memset(&v36, 0, sizeof(v36));
      }
      [a3 transform];
      CATransform3D a = v36;
      if (!CATransform3DEqualToTransform(&a, &b))
      {
        CATransform3D v33 = v36;
        [a3 setTransform:&v33];
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"opacity"), "floatValue");
      float v11 = v10;
      [a3 opacity];
      if (*(float *)&v12 != v11)
      {
        *(float *)&double v12 = v11;
        [a3 setOpacity:v12];
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"shadowOpacity"), "floatValue");
      float v14 = v13;
      [a3 shadowOpacity];
      if (*(float *)&v15 != v14)
      {
        *(float *)&double v15 = v14;
        [a3 setShadowOpacity:v15];
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"position"), "CGPointValue");
      double v17 = v16;
      double v19 = v18;
      [a3 position];
      if (v21 != v17 || v20 != v19) {
        objc_msgSend(a3, "setPosition:", v17, v19);
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"anchorPoint"), "CGPointValue");
      double v23 = v22;
      double v25 = v24;
      [a3 anchorPoint];
      if (v27 != v23 || v26 != v25) {
        objc_msgSend(a3, "setAnchorPoint:", v23, v25);
      }
      uint64_t v28 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"hidden"), "BOOLValue");
      if (v28 != [a3 isHidden]) {
        [a3 setHidden:v28];
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"zPosition"), "floatValue");
      double v30 = v29;
      [a3 zPosition];
      if (v31 != v30) {
        [a3 setZPosition:v30];
      }
      if ((objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"hasAnimations"), "BOOLValue") & 1) == 0) {
        [a3 removeAllAnimations];
      }
      [(TSUNoCopyDictionary *)[(TSULayerSaveRestore *)self layerStates] removeObjectForKey:a3];
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (TSURetainedPointerKeyDictionary)layerStates
{
  return self->_layerStates;
}

- (void)setLayerStates:(id)a3
{
}

@end