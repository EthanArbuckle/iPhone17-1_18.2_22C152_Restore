@interface OZJS3DElement
+ (id)elementWith3DElement:(void *)a3;
- (OZJS3DElement)initWith3DElement:(void *)a3;
- (SCNVector4)floorPosition:(id)a3 atTime:(float)a4;
- (SCNVector4)floorPosition:(id)a3 beneath:(SCNVector3)a4;
- (void)applyColorR:(float)a3 g:(float)a4 b:(float)a5;
- (void)applyContourToMotionPath:(SCNVector3)a3 vertically:(BOOL)a4 direction:(float)a5 rotation:(float)a6 addStart:(BOOL)a7 addEnd:(BOOL)a8;
- (void)setColor:(SCNVector4)a3 forShaderParameterWithName:(id)a4;
- (void)setPosition:(SCNVector3)a3 forShaderParameterWithName:(id)a4;
- (void)setTdElement:(void *)a3;
- (void)tdElement;
@end

@implementation OZJS3DElement

+ (id)elementWith3DElement:(void *)a3
{
  v3 = [[OZJS3DElement alloc] initWith3DElement:a3];

  return v3;
}

- (OZJS3DElement)initWith3DElement:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OZJS3DElement;
  result = -[OZJSElement initWithElement:](&v5, sel_initWithElement_);
  if (result) {
    result->_tdElement = a3;
  }
  return result;
}

- (void)applyColorR:(float)a3 g:(float)a4 b:(float)a5
{
}

- (void)applyContourToMotionPath:(SCNVector3)a3 vertically:(BOOL)a4 direction:(float)a5 rotation:(float)a6 addStart:(BOOL)a7 addEnd:(BOOL)a8
{
  float y = a3.y;
  float z = a3.z;
  OZ3DEngineSceneElement::buildAndApplyMeshContourToMotionPath((OZ3DEngineSceneElement *)self->_tdElement, a4, a7, a8, *(__n128 *)&a3.x, a5, a6);
}

- (void)setPosition:(SCNVector3)a3 forShaderParameterWithName:(id)a4
{
  v4 = (const void ***)*((void *)self->_tdElement + 3008);
  if (v4)
  {
    v6 = *v4;
    v7 = v4[1];
    if (*v4 == v7) {
      goto LABEL_11;
    }
    float z = a3.z;
    float y = a3.y;
    float x = a3.x;
    while (1)
    {
      v11 = (PCString *)((char *)*v6 + 32);
      v13.var0 = 0;
      PCString::set(&v13, (CFStringRef)a4);
      LODWORD(v11) = PCString::compare(v11, &v13);
      PCString::~PCString(&v13);
      if (!v11) {
        break;
      }
      if (++v6 == v7)
      {
        v6 = v7;
        break;
      }
    }
    if (v6 == v4[1])
    {
LABEL_11:
      NSLog(&cfstr_CouldNotFindCh.isa, a2, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, a4);
    }
    else if (*v6
    {
      OZChannelPosition3D::setValue(v12, MEMORY[0x1E4F1FA48], x, y, z);
    }
    else
    {
      NSLog(&cfstr_CouldNotFindPo_0.isa, a2, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, a4);
    }
  }
}

- (void)setColor:(SCNVector4)a3 forShaderParameterWithName:(id)a4
{
  v4 = (const void ***)*((void *)self->_tdElement + 3008);
  if (v4)
  {
    v6 = *v4;
    v7 = v4[1];
    if (*v4 == v7) {
      goto LABEL_11;
    }
    float z = a3.z;
    float y = a3.y;
    float x = a3.x;
    while (1)
    {
      v11 = (PCString *)((char *)*v6 + 32);
      *(void *)&v15.var0.var0 = 0;
      PCString::set((PCString *)&v15, (CFStringRef)a4);
      LODWORD(v11) = PCString::compare(v11, (const PCString *)&v15);
      PCString::~PCString((PCString *)&v15);
      if (!v11) {
        break;
      }
      if (++v6 == v7)
      {
        v6 = v7;
        break;
      }
    }
    if (v6 == v4[1])
    {
LABEL_11:
      NSLog(&cfstr_CouldNotFindCh.isa, a2, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, *(double *)&a3.w, a4);
    }
    else if (*v6
    {
      PCString v13 = v12;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      PCColor::PCColor(&v15, x, y, z, 1.0, DeviceRGB);
      (*(void (**)(void *, void, PCColor *, void))(*(void *)v13 + 840))(v13, MEMORY[0x1E4F1FA48], &v15, 0);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v15.var1._obj);
    }
    else
    {
      NSLog(&cfstr_CoundFindColor.isa, a2, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, *(double *)&a3.w, a4);
    }
  }
}

- (SCNVector4)floorPosition:(id)a3 atTime:(float)a4
{
  OZ3DEngineSceneElement::calcFloorPosition((OZ3DEngineSceneElement *)self->_tdElement, (SCNScene *)a3, a4);
  float v6 = v5;
  float v8 = v7;
  float v10 = v9;
  result.w = v10;
  result.float z = v8;
  result.float y = v6;
  result.float x = v4;
  return result;
}

- (SCNVector4)floorPosition:(id)a3 beneath:(SCNVector3)a4
{
  float y = a4.y;
  OZ3DEngineSceneElement::calcFloorPosition((uint64_t)self->_tdElement, (uint64_t)a3, *(double *)&a4.x);
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  result.w = v11;
  result.float z = v9;
  result.float y = v7;
  result.float x = v5;
  return result;
}

- (void)tdElement
{
  return self->_tdElement;
}

- (void)setTdElement:(void *)a3
{
  self->_tdElement = a3;
}

@end