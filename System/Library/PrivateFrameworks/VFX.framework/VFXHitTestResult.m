@interface VFXHitTestResult
+ (id)hitTestResultsFromHitTestResultRef:(__CFArray *)a3;
- (CGPoint)textureCoordinate;
- (CGPoint)textureCoordinatesWithMappingChannel:(int64_t)a3;
- (VFXHitTestResult)initWithResult:(__CFXHitTestResult *)a3;
- (VFXNode)boneNode;
- (VFXNode)node;
- (__n128)modelTransform;
- (double)localCoordinates;
- (double)localNormal;
- (double)worldCoordinates;
- (double)worldNormal;
- (id)description;
- (int64_t)faceIndex;
- (int64_t)geometryIndex;
- (void)dealloc;
@end

@implementation VFXHitTestResult

- (VFXHitTestResult)initWithResult:(__CFXHitTestResult *)a3
{
  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)VFXHitTestResult;
    v3 = [(VFXHitTestResult *)&v6 init];
    if (v3) {
      v3->_result = (__CFXHitTestResult *)CFRetain(a3);
    }
  }
  return v3;
}

- (void)dealloc
{
  result = self->_result;
  if (result)
  {
    CFRelease(result);
    self->_result = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXHitTestResult;
  [(VFXHitTestResult *)&v4 dealloc];
}

- (VFXNode)node
{
  result = (VFXNode *)sub_1B63D495C((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXNode *)objc_msgSend_nodeWithNodeRef_(VFXNode, v9, (uint64_t)result, v10);
  }
  return result;
}

- (VFXNode)boneNode
{
  result = (VFXNode *)sub_1B63D49A8((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    return (VFXNode *)objc_msgSend_nodeWithNodeRef_(VFXNode, v9, (uint64_t)result, v10);
  }
  return result;
}

- (int64_t)geometryIndex
{
  return sub_1B63D4A70((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int64_t)faceIndex
{
  return sub_1B63D4ABC((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (CGPoint)textureCoordinatesWithMappingChannel:(int64_t)a3
{
  float64x2_t v8 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(sub_1B63D4CEC((uint64_t)self->_result, a3, a3, v3, v4, v5, v6, v7)));
  double v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (CGPoint)textureCoordinate
{
  NSLog(&cfstr_Texturecoordin_0.isa, a2);

  objc_msgSend_textureCoordinatesWithMappingChannel_(self, v3, 0, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

+ (id)hitTestResultsFromHitTestResultRef:(__CFArray *)a3
{
  uint64_t v5 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v6, v5, v7);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v12 = objc_msgSend_objectAtIndex_(a3, v8, i, v9);
      v13 = [VFXHitTestResult alloc];
      v16 = objc_msgSend_initWithResult_(v13, v14, v12, v15);
      objc_msgSend_addObject_(v10, v17, (uint64_t)v16, v18);
    }
  }
  return v10;
}

- (id)description
{
  objc_msgSend_worldCoordinates(self, a2, v2, v3);
  long long v24 = v5;
  double v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  float64x2_t v8 = NSStringFromClass(v7);
  uint64_t v12 = objc_msgSend_geometryIndex(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_node(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_boneNode(self, v17, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v6, v21, @"<%@: %p <%f,%f,%f> | geometryIndex=%d node=%@ bone=%@>", v22, v8, self, *(float *)&v24, *((float *)&v24 + 1), *((float *)&v24 + 2), v12, v16, v20);
}

- (double)localCoordinates
{
  float64x2_t v8 = (long long *)sub_1B63D4B08(*(void *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    long long v9 = *v8;
  }
  else {
    *(void *)&long long v9 = 0;
  }
  return *(double *)&v9;
}

- (double)worldCoordinates
{
  float64x2_t v8 = (long long *)sub_1B63D4B54(*(void *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    long long v9 = *v8;
  }
  else {
    *(void *)&long long v9 = 0;
  }
  return *(double *)&v9;
}

- (double)localNormal
{
  float64x2_t v8 = (long long *)sub_1B63D4BA0(*(void *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    long long v9 = *v8;
  }
  else {
    *(void *)&long long v9 = 0;
  }
  return *(double *)&v9;
}

- (double)worldNormal
{
  return sub_1B63D4BEC(*(float32x4_t **)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
}

- (__n128)modelTransform
{
  uint64_t v8 = sub_1B63D4CA0(*(void *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  uint64_t v9 = MEMORY[0x1E4F149A0];
  if (v8) {
    uint64_t v9 = v8;
  }
  return *(__n128 *)v9;
}

@end