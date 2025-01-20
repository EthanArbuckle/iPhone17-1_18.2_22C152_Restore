@interface PVOrientationEffect
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (BOOL)oldShowAlt;
- (BOOL)showAlt;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (HGRef<HGXForm>)rotationNodeForPercent:(float)a3 atCenter:(CGPoint)a4;
- (PVEffectTimeNotificationDelegate)timeNotificationDelegate;
- (PVOrientationEffect)initWithEffectID:(id)a3;
- (double)animationTime;
- (double)switchSetTime;
- (double)switchTime;
- (id)inputsForTime:(id *)a3;
- (int)oldInputID;
- (unsigned)inputID;
- (void)dealloc;
- (void)orientationChangeRequest:(id)a3;
- (void)setAnimationTime:(double)a3;
- (void)setInputID:(unsigned int)a3;
- (void)setOldInputID:(int)a3;
- (void)setOldShowAlt:(BOOL)a3;
- (void)setShowAlt:(BOOL)a3;
- (void)setSwitchSetTime:(double)a3;
- (void)setSwitchTime:(double)a3;
- (void)setTimeNotificationDelegate:(id)a3;
@end

@implementation PVOrientationEffect

- (PVOrientationEffect)initWithEffectID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVOrientationEffect;
  v5 = [(PVEffect *)&v8 initWithEffectID:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_orientationChangeRequest_ name:@"PVOrientationEffectChange" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PVOrientationEffect;
  [(PVEffect *)&v4 dealloc];
}

- (void)orientationChangeRequest:(id)a3
{
  id v12 = [a3 userInfo];
  objc_super v4 = [v12 objectForKeyedSubscript:@"seconds"];
  v5 = [v12 objectForKeyedSubscript:@"alt"];
  uint64_t v6 = [v12 objectForKeyedSubscript:@"inputID"];
  v7 = (void *)v6;
  if (v5)
  {
    BOOL v8 = [(PVOrientationEffect *)self showAlt];
    -[PVOrientationEffect setShowAlt:](self, "setShowAlt:", [v5 BOOLValue]);
    [(PVOrientationEffect *)self setOldShowAlt:v8];
    if (!v7) {
      goto LABEL_6;
    }
  }
  else if (!v6)
  {
    goto LABEL_7;
  }
  unsigned int v9 = [(PVOrientationEffect *)self inputID];
  -[PVOrientationEffect setInputID:](self, "setInputID:", [v7 intValue]);
  [(PVOrientationEffect *)self setOldInputID:v9 != 0];
LABEL_6:
  [v4 doubleValue];
  -[PVOrientationEffect setSwitchTime:](self, "setSwitchTime:");
LABEL_7:
  v10 = [v12 objectForKeyedSubscript:@"timeDelegate"];
  if (v10)
  {
    if (objc_opt_respondsToSelector()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    [(PVOrientationEffect *)self setTimeNotificationDelegate:v11];
  }
}

- (void)setShowAlt:(BOOL)a3
{
  BOOL v3 = a3;
  [(PVOrientationEffect *)self animationTime];
  if (v5 > 0.0)
  {
    if (self->_showAlt != v3)
    {
      [(PVOrientationEffect *)self setSwitchTime:-1.0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      goto LABEL_6;
    }
    [(PVOrientationEffect *)self switchTime];
    if (v6 == -1.0)
    {
      double v7 = 0.0;
LABEL_6:
      [(PVOrientationEffect *)self setSwitchSetTime:v7];
    }
  }
  self->_oldShowAlt = v3;
  self->_showAlt = v3;
}

- (void)setInputID:(unsigned int)a3
{
  [(PVOrientationEffect *)self animationTime];
  if (v5 > 0.0 && self->_inputID != a3)
  {
    [(PVOrientationEffect *)self setSwitchTime:-1.0];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PVOrientationEffect setSwitchSetTime:](self, "setSwitchSetTime:");
  }
  self->_oldInputID = a3;
  self->_inputID = a3;
}

- (id)inputsForTime:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  CMTime v11 = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&v11);
  double v5 = NSNumber;
  [(PVOrientationEffect *)self switchTime];
  if (v6 <= Seconds) {
    uint64_t v7 = [(PVOrientationEffect *)self inputID];
  }
  else {
    uint64_t v7 = [(PVOrientationEffect *)self oldInputID];
  }
  BOOL v8 = [v5 numberWithUnsignedInt:v7];
  v12[0] = v8;
  unsigned int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v6, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.compositor", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:a1 forEffectID:v10 withProperties:v7];
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v6, @"displayName", @"BuiltIn", @"contentGroup", 0);
  unsigned int v9 = +[PVContentRegistry sharedInstance];
  [v9 registerContentClass:objc_opt_class() forID:v10 type:@"effect.video.compositor" withProperties:v8];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  CMTime v11 = v6;
  v66[2] = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v64 = *a3;
  uint64_t v12 = -[PVOrientationEffect inputsForTime:](self, "inputsForTime:", &v64, a4, a5);
  v13 = [(id)v12 firstObject];
  unsigned int v14 = [v13 intValue];

  v15 = [(PVOrientationEffect *)self timeNotificationDelegate];
  LOBYTE(v12) = v15 == 0;

  if ((v12 & 1) == 0)
  {
    v16 = [(PVOrientationEffect *)self timeNotificationDelegate];
    long long v62 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [v16 effectRenderedTime:&v62];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v66[0] = &unk_1F11EC010;
    v65[0] = @"seconds";
    v65[1] = @"timeDelegate";
    v18 = [MEMORY[0x1E4F1CA98] null];
    v66[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    [v17 postNotificationName:@"PVOrientationEffectChange" object:0 userInfo:v19];
  }
  [(PVOrientationEffect *)self animationTime];
  float v20 = 1.0;
  if (v21 > 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v23 = v22;
    [(PVOrientationEffect *)self switchSetTime];
    double v25 = v24;
    [(PVOrientationEffect *)self animationTime];
    double v26 = v23 - v25;
    if (v26 < v27)
    {
      [(PVOrientationEffect *)self switchTime];
      if (v28 == -1.0)
      {
        CMTime time = (CMTime)*a3;
        double Seconds = CMTimeGetSeconds(&time);
        if (Seconds == 0.0)
        {
          [(PVOrientationEffect *)self animationTime];
          double v30 = -v31;
        }
        else
        {
          double v30 = Seconds - v26;
        }
        [(PVOrientationEffect *)self setSwitchTime:v30];
      }
      CMTime v60 = (CMTime)*a3;
      double v32 = CMTimeGetSeconds(&v60);
      [(PVOrientationEffect *)self switchTime];
      double v34 = v33;
      [(PVOrientationEffect *)self animationTime];
      float v36 = (v32 - v34) / v35;
      if (v36 >= 0.0 && v36 <= 1.0)
      {
        float v38 = (float)(1.0 - v36) * 3.14159265;
        float v20 = cosf(v38) * 0.5 + 0.5;
      }
    }
  }
  double v39 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
  double v41 = v40;
  double v42 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
  double v43 = v39 * v42 * 0.5;
  double v44 = v41 * v42 * 0.5;
  if (v20 == 1.0)
  {
    if ([(PVOrientationEffect *)self showAlt])
    {
      LODWORD(v45) = 1.0;
      -[PVOrientationEffect rotationNodeForPercent:atCenter:](self, "rotationNodeForPercent:atCenter:", v45, v43, v44);
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v14, &v59);
      (*(void (**)(char *, void, HGNode *))(*(void *)v57 + 120))(v57, 0, v59);
      v46 = v59;
      if (v59) {
        v46 = (HGNode *)(*(uint64_t (**)(HGNode *))(*(void *)v59 + 24))(v59);
      }
      void *v11 = (HGNode *)v57;
    }
    else
    {
      return (HGRef<HGNode>)PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v14, v11);
    }
    return (HGRef<HGNode>)v46;
  }
  v47 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
  HGHWMultiBlend::HGHWMultiBlend(v47);
  PVInputHGNodeMap<unsigned int>::MapKeys(a4, &v57);
  v48 = (unsigned int *)v57;
  if (v57 != v58)
  {
    while (1)
    {
      uint64_t v49 = *v48;
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, *v48, &v59);
      BOOL v50 = [(PVOrientationEffect *)self showAlt];
      if (v50 != [(PVOrientationEffect *)self oldShowAlt])
      {
        *(float *)&double v51 = v20;
        -[PVOrientationEffect rotationNodeForPercent:atCenter:](self, "rotationNodeForPercent:atCenter:", v51, v43, v44);
        (*(void (**)(HGNode *, void, HGNode *))(*(void *)v56 + 120))(v56, 0, v59);
        v52 = v59;
        v53 = v56;
        if (v59 != v56)
        {
          if (v59)
          {
            (*(void (**)(void))(*(void *)v59 + 24))();
            v53 = v56;
          }
          v59 = v53;
          if (!v53) {
            goto LABEL_30;
          }
          (*(void (**)(HGNode *))(*(void *)v53 + 16))(v53);
          v52 = v56;
        }
        if (v52) {
          (*(void (**)(HGNode *))(*(void *)v52 + 24))(v52);
        }
      }
LABEL_30:
      unsigned int v54 = [(PVOrientationEffect *)self inputID];
      v55.n128_f32[0] = v20;
      if (v54 != v49)
      {
        if ([(PVOrientationEffect *)self oldInputID] == v49) {
          v55.n128_f32[0] = 1.0 - v20;
        }
        else {
          v55.n128_f32[0] = 0.0;
        }
      }
      (*(void (**)(HGHWMultiBlend *, uint64_t, HGNode *, uint64_t, __n128))(*(void *)v47 + 624))(v47, v49, v59, 9, v55);
      v46 = v59;
      if (v59) {
        v46 = (HGNode *)(*(uint64_t (**)(HGNode *))(*(void *)v59 + 24))(v59);
      }
      if (++v48 == (unsigned int *)v58)
      {
        v48 = (unsigned int *)v57;
        break;
      }
    }
  }
  void *v11 = (HGNode *)v47;
  if (v48)
  {
    v58 = (char *)v48;
    operator delete(v48);
  }
  return (HGRef<HGNode>)v46;
}

- (HGRef<HGXForm>)rotationNodeForPercent:(float)a3 atCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v9 = v4;
  HGTransform::HGTransform((HGTransform *)v14);
  HGTransform::Translate((HGTransform *)v14, -x, -y, 0.0);
  BOOL v10 = [(PVOrientationEffect *)self showAlt];
  float v11 = 1.0 - a3;
  if (v10) {
    float v11 = a3;
  }
  HGTransform::Rotate((HGTransform *)v14, (float)(v11 * -90.0), 0.0, 0.0, 1.0);
  HGTransform::Translate((HGTransform *)v14, x, y, 0.0);
  uint64_t v12 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v12);
  *unsigned int v9 = v12;
  (*(void (**)(HGXForm *, unsigned char *))(*(void *)v12 + 576))(v12, v14);
  HGTransform::~HGTransform((HGTransform *)v14);
  return v13;
}

- (BOOL)showAlt
{
  return self->_showAlt;
}

- (unsigned)inputID
{
  return self->_inputID;
}

- (double)animationTime
{
  return self->_animationTime;
}

- (void)setAnimationTime:(double)a3
{
  self->_animationTime = a3;
}

- (double)switchTime
{
  return self->_switchTime;
}

- (void)setSwitchTime:(double)a3
{
  self->_switchTime = a3;
}

- (double)switchSetTime
{
  return self->_switchSetTime;
}

- (void)setSwitchSetTime:(double)a3
{
  self->_switchSetTime = a3;
}

- (BOOL)oldShowAlt
{
  return self->_oldShowAlt;
}

- (void)setOldShowAlt:(BOOL)a3
{
  self->_oldShowAlt = a3;
}

- (int)oldInputID
{
  return self->_oldInputID;
}

- (void)setOldInputID:(int)a3
{
  self->_oldInputID = a3;
}

- (PVEffectTimeNotificationDelegate)timeNotificationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timeNotificationDelegate);

  return (PVEffectTimeNotificationDelegate *)WeakRetained;
}

- (void)setTimeNotificationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end