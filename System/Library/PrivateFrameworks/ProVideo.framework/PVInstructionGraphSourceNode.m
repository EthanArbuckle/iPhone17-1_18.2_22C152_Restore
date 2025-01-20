@interface PVInstructionGraphSourceNode
- (AVTimedMetadataGroup)timedMetadataGroup;
- (BOOL)isOverlayTrack;
- (BOOL)isPortrait;
- (CGAffineTransform)transform;
- (HGRef<HGNode>)applyWrapModeToInput:(HGRef<HGNode>)a3;
- (PVInstructionGraphSourceNode)init;
- (PVTransformAnimation)transformAnimation;
- (id)getAllSourceNodes;
- (id)instructionGraphNodeDescription;
- (int)textureWrapMode;
- (int)transformAnimationContentMode;
- (void)setIsOverlayTrack:(BOOL)a3;
- (void)setTextureWrapMode:(int)a3;
- (void)setTimedMetadataGroup:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setTransformAnimation:(id)a3;
- (void)setTransformAnimationContentMode:(int)a3;
@end

@implementation PVInstructionGraphSourceNode

- (PVInstructionGraphSourceNode)init
{
  v8.receiver = self;
  v8.super_class = (Class)PVInstructionGraphSourceNode;
  v2 = [(PVInstructionGraphNode *)&v8 init];
  v3 = v2;
  if (v2)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v2->_timedMetadataGroup = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_transform.b = v5;
    *(_OWORD *)&v2->_transform.d = v4;
    v6 = *(void **)&v2->_textureWrapMode;
    *(void *)&v2->_textureWrapMode = 0;

    *(_DWORD *)&v3->_isOverlayTrack = 0;
  }
  return v3;
}

- (id)getAllSourceNodes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:self];
}

- (BOOL)isPortrait
{
  [(PVInstructionGraphSourceNode *)self transform];
  float v2 = atan2(0.0, 0.0);
  return fabsf(fabsf(v2) + -3.1416) >= 0.00001 && v2 != 0.0;
}

- (HGRef<HGNode>)applyWrapModeToInput:(HGRef<HGNode>)a3
{
  v6 = v3;
  v7 = *(HGTextureWrap **)a3.var0;
  PVInstructionGraphSourceNode *v3 = *(HGTextureWrap **)a3.var0;
  if (v7) {
    (*(void (**)(HGTextureWrap *, SEL))(*(void *)v7 + 16))(v7, a2);
  }
  v8.var0 = (HGNode *)[(PVInstructionGraphSourceNode *)self textureWrapMode];
  if (LODWORD(v8.var0) == 1)
  {
    v9 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v9);
    (*(void (**)(HGTextureWrap *, void, void))(*(void *)v9 + 120))(v9, 0, *(void *)a3.var0);
    HGTextureWrap::SetTextureWrapMode((uint64_t)v9, (const char *)1, v10);
    if (v7 != v9)
    {
      if (v7) {
        (*(void (**)(HGTextureWrap *))(*(void *)v7 + 24))(v7);
      }
      void *v6 = v9;
      (*(void (**)(HGTextureWrap *))(*(void *)v9 + 16))(v9);
    }
    return (HGRef<HGNode>)(*(uint64_t (**)(HGTextureWrap *))(*(void *)v9 + 24))(v9);
  }
  return v8;
}

- (id)instructionGraphNodeDescription
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"address";
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  v12[0] = v3;
  v11[1] = @"class";
  long long v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  v12[1] = v5;
  v11[2] = @"sourceTransform";
  [(PVInstructionGraphSourceNode *)self transform];
  v6 = NSStringFromCGAffineTransform(&transform);
  v12[2] = v6;
  v11[3] = @"isPortrait";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PVInstructionGraphSourceNode isPortrait](self, "isPortrait"));
  v12[3] = v7;
  HGRef<HGNode> v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v8;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_timedMetadataGroup = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.b = v4;
  *(_OWORD *)&self->_transform.d = v3;
}

- (PVTransformAnimation)transformAnimation
{
  return *(PVTransformAnimation **)&self->_textureWrapMode;
}

- (void)setTransformAnimation:(id)a3
{
}

- (int)transformAnimationContentMode
{
  return *((_DWORD *)&self->super._isDebugDrawingEnabled + 1);
}

- (void)setTransformAnimationContentMode:(int)a3
{
  *((_DWORD *)&self->super._isDebugDrawingEnabled + 1) = a3;
}

- (int)textureWrapMode
{
  return *(_DWORD *)&self->_isOverlayTrack;
}

- (void)setTextureWrapMode:(int)a3
{
  *(_DWORD *)&self->_isOverlayTrack = a3;
}

- (AVTimedMetadataGroup)timedMetadataGroup
{
  return (AVTimedMetadataGroup *)self->_transformAnimation;
}

- (void)setTimedMetadataGroup:(id)a3
{
}

- (BOOL)isOverlayTrack
{
  return *(&self->super._isDebugDrawingEnabled + 1);
}

- (void)setIsOverlayTrack:(BOOL)a3
{
  *(&self->super._isDebugDrawingEnabled + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformAnimation, 0);

  objc_storeStrong((id *)&self->_textureWrapMode, 0);
}

@end