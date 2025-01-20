@interface PKPeerPayment3DScene
+ (double)rotationMatrixForRollPitch:(double)a1;
+ (double)staticRollPitch;
+ (float32x2_t)skewForRollPitch:(double)a1;
- (PKPeerPayment3DScene)init;
- (SCNMaterial)textMaterial;
- (SCNNode)cameraNode;
- (SCNNode)lightNode;
- (SCNNode)textContainerNode;
- (__n128)currentRotationMatrix;
- (__n128)setCurrentRotationMatrix:(__n128)a3;
- (double)currentRollPitch;
- (double)currentSkew;
- (void)resetScene;
- (void)setCameraNode:(id)a3;
- (void)setCurrentRollPitch:(PKPeerPayment3DScene *)self;
- (void)setCurrentSkew:(PKPeerPayment3DScene *)self;
- (void)setLightNode:(id)a3;
- (void)setTextContainerNode:(id)a3;
- (void)setTextMaterial:(id)a3;
@end

@implementation PKPeerPayment3DScene

- (PKPeerPayment3DScene)init
{
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPayment3DScene;
  v2 = [(PKPeerPayment3DScene *)&v21 init];
  if (v2)
  {
    +[PKPeerPayment3DScene staticRollPitch];
    *(void *)v2->_currentRollPitch = v3;
    +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:");
    *(_OWORD *)&v2[1].super.super.isa = v4;
    *(_OWORD *)&v2[1].super._sceneSource = v5;
    *(_OWORD *)&v2[1].super._rootNode = v6;
    *(_OWORD *)&v2[1].super._layerRootNode[1] = v7;
    +[PKPeerPayment3DScene skewForRollPitch:*(double *)v2->_currentRollPitch];
    *(void *)v2->_currentSkew = v8;
    v9 = [MEMORY[0x263F16A98] node];
    v10 = [MEMORY[0x263F169F0] camera];
    [v9 setCamera:v10];
    [v10 setUsesOrthographicProjection:1];
    [v10 setOrthographicScale:4.0];
    LODWORD(v11) = 1114636288;
    objc_msgSend(v9, "setPosition:", 0.0, 0.0, v11);
    [(PKPeerPayment3DScene *)v2 setCameraNode:v9];
    v12 = [(PKPeerPayment3DScene *)v2 rootNode];
    [v12 addChildNode:v9];

    v13 = [MEMORY[0x263F16A98] node];
    [(PKPeerPayment3DScene *)v2 setTextContainerNode:v13];
    v14 = [(PKPeerPayment3DScene *)v2 rootNode];
    [v14 addChildNode:v13];

    v15 = [MEMORY[0x263F16A98] node];
    v16 = [MEMORY[0x263F16A70] light];
    [v15 setLight:v16];
    [v16 setType:*MEMORY[0x263F16B90]];
    v17 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
    [v16 setColor:v17];

    [v16 setSpotInnerAngle:40.0];
    [v16 setSpotOuterAngle:180.0];
    LODWORD(v18) = 1.0;
    objc_msgSend(v15, "setOrientation:", 0.0, 0.0, v18, 0.0);
    [(PKPeerPayment3DScene *)v2 setLightNode:v15];
    v19 = [(PKPeerPayment3DScene *)v2 rootNode];
    [v19 addChildNode:v15];

    [(PKPeerPayment3DScene *)v2 resetScene];
  }
  return v2;
}

- (void)resetScene
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(PKPeerPayment3DScene *)self setPaused:1];
  uint64_t v3 = +[PKPeerPayment3DStore sharedInstance];
  long long v4 = [v3 material];
  [(PKPeerPayment3DScene *)self setTextMaterial:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v5 = [(PKPeerPayment3DScene *)self textContainerNode];
  long long v6 = [v5 childNodes];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) removeFromParentNode];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (double)staticRollPitch
{
  return -0.000000381469818;
}

+ (double)rotationMatrixForRollPitch:(double)a1
{
  __float2 v1 = __sincosf_stret(0.5 * *(float *)&a1);
  float32x4_t v25 = vmulq_n_f32((float32x4_t)xmmword_21EEE77F0, v1.__sinval);
  __float2 v2 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)&a1, 1));
  float32x4_t v3 = vmulq_n_f32((float32x4_t)xmmword_21EEE7800, v2.__sinval);
  v3.i32[3] = LODWORD(v2.__cosval);
  _Q1 = (int32x4_t)vnegq_f32(v3);
  int8x16_t v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, _Q1));
  _Q4 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
  _Q4.i32[0] = _Q1.i32[1];
  _Q4.i32[3] = _Q1.i32[2];
  _Q3 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v3, v1.__cosval), _Q4, v25, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)_Q1, 8uLL), *(float32x2_t *)v25.f32, 1), (float32x4_t)vextq_s8(v5, v5, 8uLL), v25.f32[0]));
  _Q4.i32[0] = _Q3.i32[1];
  _S5 = _Q3.i32[2];
  __asm { FMLS            S1, S5, V3.S[2] }
  _S7 = _Q3.i32[3];
  __asm { FMLA            S1, S7, V3.S[3] }
  v3.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q3.f32[2], _Q3, 3), _Q3.f32[1], _Q3.f32[0]);
  double result = COERCE_DOUBLE(__PAIR64__(v3.f32[0] + v3.f32[0], _Q1.u32[0]));
  __asm
  {
    FMLA            S6, S4, V3.S[1]
    FMLA            S6, S7, V3.S[3]
    FMLS            S6, S3, V3.S[0]
    FMLA            S18, S5, V3.S[1]
    FMLA            S17, S3, V3.S[2]
    FMLA            S16, S5, V3.S[1]
    FMLA            S7, S5, V3.S[2]
    FMLS            S7, S3, V3.S[0]
    FMLS            S7, S4, V3.S[1]
  }
  return result;
}

+ (float32x2_t)skewForRollPitch:(double)a1
{
  float v3 = *(float *)&a1;
  float v4 = sinf(*((float *)&a1 + 1));
  v1.f32[0] = sinf(v3);
  v1.f32[1] = v4;
  return vmul_f32(v1, (float32x2_t)0x3F0000003F000000);
}

- (SCNNode)lightNode
{
  return self->_lightNode;
}

- (void)setLightNode:(id)a3
{
}

- (SCNNode)cameraNode
{
  return self->_cameraNode;
}

- (void)setCameraNode:(id)a3
{
}

- (SCNNode)textContainerNode
{
  return self->_textContainerNode;
}

- (void)setTextContainerNode:(id)a3
{
}

- (SCNMaterial)textMaterial
{
  return self->_textMaterial;
}

- (void)setTextMaterial:(id)a3
{
}

- (__n128)currentRotationMatrix
{
  return a1[16];
}

- (__n128)setCurrentRotationMatrix:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  result[19] = a5;
  return result;
}

- (double)currentSkew
{
  return *(double *)(a1 + 232);
}

- (void)setCurrentSkew:(PKPeerPayment3DScene *)self
{
  *(void *)self->_currentSkew = v2;
}

- (double)currentRollPitch
{
  return *(double *)(a1 + 240);
}

- (void)setCurrentRollPitch:(PKPeerPayment3DScene *)self
{
  *(void *)self->_currentRollPitch = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textMaterial, 0);
  objc_storeStrong((id *)&self->_textContainerNode, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);

  objc_storeStrong((id *)&self->_lightNode, 0);
}

@end