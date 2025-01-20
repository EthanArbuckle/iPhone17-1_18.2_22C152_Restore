float SCNVector3.init(_:_:_:)(double a1)
{
  return a1;
}

__C::SCNVector3 __swiftcall SCNVector3.init(_:_:_:)(Swift::Int a1, Swift::Int a2, Swift::Int a3)
{
  float v3 = (float)a1;
  float v4 = (float)a2;
  float v5 = (float)a3;
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

float32x2_t SCNVector3.init(_:)(float64x2_t a1)
{
  return vcvt_f32_f64(a1);
}

double SIMD3<>.init(_:)(float a1, float a2)
{
  return COERCE_DOUBLE(__PAIR64__(LODWORD(a2), LODWORD(a1)));
}

double SIMD3<>.init(_:)(float32x2_t a1, float32_t a2)
{
  a1.f32[1] = a2;
  *(void *)&double result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

float SCNVector4.init(_:_:_:_:)(double a1)
{
  return a1;
}

__C::SCNVector4 __swiftcall SCNVector4.init(_:_:_:_:)(Swift::Int a1, Swift::Int a2, Swift::Int a3, Swift::Int a4)
{
  float v4 = (float)a1;
  float v5 = (float)a2;
  float v6 = (float)a3;
  float v7 = (float)a4;
  result.w = v7;
  result.z = v6;
  result.y = v5;
  result.x = v4;
  return result;
}

float32x2_t SCNVector4.init(_:)(float64x2_t a1)
{
  return vcvt_f32_f64(a1);
}

__n64 SIMD4<>.init(_:)(double a1, float a2)
{
  result.n64_f32[1] = a2;
  return result;
}

double SIMD4<>.init(_:)(float32x2_t a1, float32_t a2)
{
  a1.f32[1] = a2;
  *(void *)&double result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

void __swiftcall SCNMatrix4.init(_:)(__C::SCNMatrix4 *__return_ptr retstr, simd_float4x4 *a2)
{
  *(_OWORD *)&retstr->m11 = v2;
  *(_OWORD *)&retstr->m21 = v3;
  *(_OWORD *)&retstr->m31 = v4;
  *(_OWORD *)&retstr->m41 = v5;
}

void __swiftcall SCNMatrix4.init(_:)(__C::SCNMatrix4 *__return_ptr retstr, simd_double4x4 *a2)
{
  float64x2_t v3 = *(float64x2_t *)a2->columns[2].f64;
  float64x2_t v2 = *(float64x2_t *)&a2->columns[2].f64[2];
  float64x2_t v5 = *(float64x2_t *)a2->columns[3].f64;
  float64x2_t v4 = *(float64x2_t *)&a2->columns[3].f64[2];
  float32x4_t v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)a2->columns[1].f64), *(float64x2_t *)&a2->columns[1].f64[2]);
  *(float32x4_t *)&retstr->m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)a2->columns[0].f64), *(float64x2_t *)&a2->columns[0].f64[2]);
  *(float32x4_t *)&retstr->m21 = v6;
  *(float32x4_t *)&retstr->m31 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v3), v2);
  *(float32x4_t *)&retstr->m41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v4);
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, __C::SCNMatrix4 *a2)
{
  float32x4_t v2 = *(float32x4_t *)&a2->m21;
  float64x2_t v3 = vcvt_hight_f64_f32(*(float32x4_t *)&a2->m11);
  float32x4_t v4 = *(float32x4_t *)&a2->m31;
  float32x4_t v5 = *(float32x4_t *)&a2->m41;
  *(float64x2_t *)retstr->columns[0].f64 = vcvtq_f64_f32(*(float32x2_t *)&a2->m11);
  *(float64x2_t *)&retstr->columns[0].f64[2] = v3;
  *(float64x2_t *)retstr->columns[1].f64 = vcvtq_f64_f32(*(float32x2_t *)v2.f32);
  *(float64x2_t *)&retstr->columns[1].f64[2] = vcvt_hight_f64_f32(v2);
  *(float64x2_t *)retstr->columns[2].f64 = vcvtq_f64_f32(*(float32x2_t *)v4.f32);
  *(float64x2_t *)&retstr->columns[2].f64[2] = vcvt_hight_f64_f32(v4);
  *(float64x2_t *)retstr->columns[3].f64 = vcvtq_f64_f32(*(float32x2_t *)v5.f32);
  *(float64x2_t *)&retstr->columns[3].f64[2] = vcvt_hight_f64_f32(v5);
}

id SCNGeometryElement.init<A>(indices:primitiveType:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 > 3)
  {
    __break(1u);
LABEL_30:
    uint64_t v22 = v3;
    uint64_t v20 = type metadata accessor for _ArrayBuffer();
    uint64_t WitnessTable = swift_getWitnessTable();
    MEMORY[0x21D4B40A0](&v22, v8, v20, WitnessTable);
    swift_unknownObjectRetain();
    v12 = (unsigned char *)_ContiguousArrayBuffer.firstElementAddress.getter();
    swift_release();
  }
  else
  {
    uint64_t v8 = a3;
    unint64_t v5 = a2;
    uint64_t v3 = a1;
    uint64_t v9 = MEMORY[0x21D4B4060](a1, a3);
    uint64_t v4 = v9;
    switch(v5)
    {
      case 0uLL:
        uint64_t v4 = v9 / 3;
        goto LABEL_11;
      case 1uLL:
        uint64_t v4 = v9 - 2;
        if (!__OFSUB__(v9, 2)) {
          goto LABEL_11;
        }
        __break(1u);
LABEL_7:
        if (v9 >= 0) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = v9 + 1;
        }
        uint64_t v4 = v10 >> 1;
LABEL_11:
        uint64_t v11 = *(void *)(v8 - 8);
        uint64_t v6 = *(void *)(v11 + 72);
        uint64_t v7 = v9 * v6;
        if ((unsigned __int128)(v9 * (__int128)v6) >> 64 == (v9 * v6) >> 63)
        {
          swift_bridgeObjectRetain();
          if ((_swift_isClassOrObjCExistentialType() & 1) == 0
            || (v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
          {
            swift_bridgeObjectRelease();
            if (_swift_isClassOrObjCExistentialType()) {
              v12 = (unsigned char *)((v3 & 0xFFFFFFFFFFFFFF8)
            }
                            + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
            else {
              v12 = (unsigned char *)(v3
            }
                            + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
            goto LABEL_18;
          }
        }
        else
        {
          __break(1u);
        }
        if (MEMORY[0x21D4B4070](v3, v8)) {
          goto LABEL_30;
        }
        swift_bridgeObjectRelease();
        v12 = 0;
LABEL_18:
        if ((_swift_isClassOrObjCExistentialType() & 1) == 0
          || (v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
        {
          _swift_isClassOrObjCExistentialType();
          swift_bridgeObjectRetain();
          if (v12) {
            break;
          }
          goto LABEL_22;
        }
        swift_unknownObjectRetain();
        if (!v12)
        {
LABEL_22:
          v12 = (unsigned char *)(~*(_DWORD *)(v11 + 80) | 0xFFFFFFFFFFFFFF00);
          break;
        }
        break;
      case 2uLL:
        goto LABEL_7;
      case 3uLL:
        goto LABEL_11;
      default:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        JUMPOUT(0x21C9FDC68);
    }
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v14 = specialized Data.init(bytes:count:)(v12, v7);
  unint64_t v16 = v15;
  swift_unknownObjectRelease();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v14, v16);
  id v18 = [ObjCClassFromMetadata geometryElementWithData:isa, v5, v4, v6];
  swift_bridgeObjectRelease();

  return v18;
}

SCNGeometrySource __swiftcall SCNGeometrySource.init(vertices:)(Swift::OpaquePointer vertices)
{
  return (SCNGeometrySource)SCNGeometrySource.init(vertices:)((uint64_t)vertices._rawValue, (SEL *)&selRef_geometrySourceWithVertices_count_);
}

SCNGeometrySource __swiftcall SCNGeometrySource.init(normals:)(Swift::OpaquePointer normals)
{
  return (SCNGeometrySource)SCNGeometrySource.init(vertices:)((uint64_t)normals._rawValue, (SEL *)&selRef_geometrySourceWithNormals_count_);
}

SCNGeometrySource __swiftcall SCNGeometrySource.init(textureCoordinates:)(Swift::OpaquePointer textureCoordinates)
{
  return (SCNGeometrySource)SCNGeometrySource.init(vertices:)((uint64_t)textureCoordinates._rawValue, (SEL *)&selRef_geometrySourceWithTextureCoordinates_count_);
}

id SCNGeometrySource.init(vertices:)(uint64_t a1, SEL *a2)
{
  id v2 = [swift_getObjCClassFromMetadata() *a2, a1 + 32, *(void *)(a1 + 16)];
  swift_bridgeObjectRelease();
  return v2;
}

float SCNBoundingVolume.boundingBox.getter@<S0>(uint64_t a1@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v3 = *(_DWORD *)(MEMORY[0x263F16BF8] + 4);
  unsigned int v4 = *(_DWORD *)(MEMORY[0x263F16BF8] + 8);
  float v10 = *(float *)MEMORY[0x263F16BF8];
  unint64_t v11 = __PAIR64__(v4, v3);
  unint64_t v8 = __PAIR64__(v3, LODWORD(v10));
  unsigned int v9 = v4;
  [v1 sel_getBoundingBoxMin_max_:&v10, &v8];
  unsigned int v6 = v9;
  float result = v10;
  *(void *)&long long v7 = v11;
  *((void *)&v7 + 1) = v8;
  *(float *)a1 = v10;
  *(_OWORD *)(a1 + 4) = v7;
  *(_DWORD *)(a1 + 20) = v6;
  return result;
}

double key path getter for SCNBoundingVolume.boundingBox : <A>A@<D0>(uint64_t a1@<X8>)
{
  SCNBoundingVolume.boundingBox.getter((uint64_t)&v4);
  double result = *(double *)&v4;
  uint64_t v3 = v5;
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 16) = v3;
  return result;
}

id key path setter for SCNBoundingVolume.boundingBox : <A>A(float *a1)
{
  return SCNBoundingVolume.boundingBox.setter(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
}

id SCNBoundingVolume.boundingBox.setter(float a1, float a2, float a3, float a4, float a5, float a6)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(float *)unsigned int v9 = a1;
  *(float *)&v9[1] = a2;
  *(float *)&v9[2] = a3;
  *(float *)unint64_t v8 = a4;
  *(float *)&v8[1] = a5;
  *(float *)&v8[2] = a6;
  return [v6 setBoundingBoxMin:v9 max:v8];
}

void (*SCNBoundingVolume.boundingBox.modify(void *a1))(void ***a1, char a2)
{
  uint64_t v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  *(void *)uint64_t v3 = v1;
  v4.i32[0] = *(_DWORD *)(MEMORY[0x263F16BF8] + 8);
  v5.i64[0] = *MEMORY[0x263F16BF8];
  *((void *)v3 + 4) = *MEMORY[0x263F16BF8];
  int8x16_t v6 = vextq_s8(vextq_s8(v4, v4, 4uLL), v5, 0xCuLL);
  v6.i32[3] = v6.i32[0];
  *(int8x16_t *)(v3 + 40) = v6;
  [v1 sel_getBoundingBoxMin_max_:v3 + 32, v3 + 44];
  *(_OWORD *)(v3 + 8) = *((_OWORD *)v3 + 2);
  *((void *)v3 + 3) = *((void *)v3 + 6);
  return SCNBoundingVolume.boundingBox.modify;
}

void SCNBoundingVolume.boundingBox.modify(void ***a1, char a2)
{
  id v2 = *a1;
  uint64_t v3 = (*a1)[1];
  uint64_t v4 = (uint64_t)(*a1 + 4);
  uint64_t v5 = (uint64_t)*a1 + 44;
  int v7 = *((_DWORD *)*a1 + 4);
  int v6 = *((_DWORD *)*a1 + 5);
  *(void *)&long long v8 = (*a1)[3];
  unsigned int v9 = **a1;
  if (a2)
  {
    *((_DWORD *)v2 + 13) = v7;
    *((_DWORD *)v2 + 8) = v6;
    *((void *)&v8 + 1) = v3;
    *(_OWORD *)((char *)v2 + 36) = v8;
    [v9 setBoundingBoxMin:v5 max:v4];
  }
  else
  {
    v2[4] = v3;
    *((_DWORD *)v2 + 10) = v7;
    *((_DWORD *)v2 + 11) = v6;
    v2[6] = (void *)v8;
    [v9 setBoundingBoxMin:v4 max:v5];
  }

  free(v2);
}

float SCNBoundingVolume.boundingSphere.getter()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(MEMORY[0x263F16BF8] + 8);
  uint64_t v4 = *MEMORY[0x263F16BF8];
  int v5 = v1;
  uint64_t v3 = 0;
  [v0 sel_getBoundingSphereCenter_radius_:&v4, &v3];
  return *(float *)&v4;
}

uint64_t SCNSceneSource.entryWithIdentifier<A>(_:withClass:)()
{
  int v1 = (void *)MEMORY[0x21D4B4050]();
  id v2 = [v0 sel_entryWithIdentifier_withClass_:v1:swift_getObjCClassFromMetadata()];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (v7)
  {
    outlined init with take of Any(&v6, &v8);
    swift_dynamicCast();
    return v4;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v6);
    return 0;
  }
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.init(bytes:count:)(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  type metadata accessor for Data.RangeReference();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21C9FE41C()
{
  return 8;
}

void *sub_21C9FE428(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SCNMatrix4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy64_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SCNMatrix4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SCNMatrix4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for SCNMatrix4(uint64_t a1)
{
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SCNVector4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SCNVector4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for SCNVector4(uint64_t a1)
{
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SCNVector3(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SCNVector3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 12) = v3;
  return result;
}

void type metadata accessor for SCNVector3(uint64_t a1)
{
}

void type metadata accessor for SCNMatrix4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id one-time initialization function for SCNVector3InNSValueObjCType()
{
  id v0 = [self valueWithSCNVector3:0.0, 0.0, 0.0];
  id v1 = [v0 objCType];
  id result = v0;
  SCNVector3InNSValueObjCType = (uint64_t)v1;
  return result;
}

id one-time initialization function for SCNVector4InNSValueObjCType()
{
  id v0 = [self valueWithSCNVector4:0.0, 0.0, 0.0, 0.0];
  id v1 = [v0 objCType];
  id result = v0;
  SCNVector4InNSValueObjCType = (uint64_t)v1;
  return result;
}

NSValue __swiftcall SCNVector3._bridgeToObjectiveC()()
{
  int v3 = v2;
  int v4 = v1;
  int v5 = v0;
  uint64_t v6 = self;
  LODWORD(v7) = v5;
  LODWORD(v8) = v4;
  LODWORD(v9) = v3;
  id v10 = [v6 valueWithSCNVector3:v7, v8, v9];

  return (NSValue)v10;
}

id static SCNVector3._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 SCNVector3Value];
    *(void *)a2 = v6 | ((unint64_t)v7 << 32);
    *(_DWORD *)(a2 + 8) = v8;
    *(unsigned char *)(a2 + 12) = 0;
  }
  return result;
}

BOOL static SCNVector3._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if (v5)
  {
    unint64_t v6 = 0;
    int v7 = 0;
  }
  else
  {
    [v3 SCNVector3Value];
    unint64_t v6 = v8 | ((unint64_t)v9 << 32);
  }
  BOOL result = v5 == 0;
  *(void *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 12) = v5 != 0;
  return result;
}

id static SCNVector3._unconditionallyBridgeFromObjectiveC(_:)(id result)
{
  if (!result) {
    goto LABEL_9;
  }
  id v1 = result;
  int v2 = (const char *)[v1 objCType];
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1) {
    swift_once();
  }
  BOOL result = (id)strcmp(v2, (const char *)SCNVector3InNSValueObjCType);
  if (result)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }

  return [v1 SCNVector3Value];
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance SCNVector3()
{
  int v1 = *v0;
  int v2 = v0[1];
  int v3 = v0[2];
  int v4 = self;
  LODWORD(v5) = v1;
  LODWORD(v6) = v2;
  LODWORD(v7) = v3;
  id v8 = [v4 valueWithSCNVector3:v5, v6, v7];

  return v8;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance SCNVector3(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 SCNVector3Value];
    *(void *)a2 = v6 | ((unint64_t)v7 << 32);
    *(_DWORD *)(a2 + 8) = v8;
    *(unsigned char *)(a2 + 12) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance SCNVector3(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if (v5)
  {
    unint64_t v6 = 0;
    int v7 = 0;
  }
  else
  {
    [v3 SCNVector3Value];
    unint64_t v6 = v8 | ((unint64_t)v9 << 32);
  }
  BOOL result = v5 == 0;
  *(void *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 12) = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance SCNVector3@<X0>(id result@<X0>, _DWORD *a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    int v4 = (const char *)[v3 objCType];
    if (one-time initialization token for SCNVector3InNSValueObjCType != -1) {
      swift_once();
    }
    BOOL result = (id)strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
    if (!result)
    {
      BOOL result = [v3 SCNVector3Value];
      *a2 = v5;
      a2[1] = v6;
      a2[2] = v7;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

NSValue __swiftcall SCNVector4._bridgeToObjectiveC()()
{
  int v4 = v3;
  int v5 = v2;
  int v6 = v1;
  int v7 = v0;
  unsigned int v8 = self;
  LODWORD(v9) = v7;
  LODWORD(v10) = v6;
  LODWORD(v11) = v5;
  LODWORD(v12) = v4;
  id v13 = [v8 valueWithSCNVector4:v9, v10, v11, v12];

  return (NSValue)v13;
}

id static SCNVector4._forceBridgeFromObjectiveC(_:result:)(void *a1, int8x16_t *a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 SCNVector4Value];
    v8.i64[0] = v6;
    v8.i64[1] = v7;
    v10.i32[1] = v9;
    *a2 = vorrq_s8((int8x16_t)vshll_n_s32(v10, 0x20uLL), v8);
    a2[1].i8[0] = 0;
  }
  return result;
}

BOOL static SCNVector4._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, int8x16_t *a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  int8x16_t v6 = 0uLL;
  if (!v5)
  {
    [v3 SCNVector4Value];
    v9.i64[0] = v7;
    v9.i64[1] = v8;
    v11.i32[1] = v10;
    int8x16_t v6 = vorrq_s8((int8x16_t)vshll_n_s32(v11, 0x20uLL), v9);
  }
  BOOL result = v5 == 0;
  *a2 = v6;
  a2[1].i8[0] = v5 != 0;
  return result;
}

id static SCNVector4._unconditionallyBridgeFromObjectiveC(_:)(id result)
{
  if (!result) {
    goto LABEL_9;
  }
  id v1 = result;
  int v2 = (const char *)[v1 objCType];
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1) {
    swift_once();
  }
  BOOL result = (id)strcmp(v2, (const char *)SCNVector4InNSValueObjCType);
  if (result)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }

  return [v1 SCNVector4Value];
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance SCNVector4()
{
  int v1 = *v0;
  int v2 = v0[1];
  int v3 = v0[2];
  int v4 = v0[3];
  int v5 = self;
  LODWORD(v6) = v1;
  LODWORD(v7) = v2;
  LODWORD(v8) = v3;
  LODWORD(v9) = v4;
  id v10 = [v5 sel_valueWithSCNVector4_:v6, v7, v8, v9];

  return v10;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance SCNVector4(void *a1, int8x16_t *a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 SCNVector4Value];
    v8.i64[0] = v6;
    v8.i64[1] = v7;
    v10.i32[1] = v9;
    *a2 = vorrq_s8((int8x16_t)vshll_n_s32(v10, 0x20uLL), v8);
    a2[1].i8[0] = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance SCNVector4(void *a1, int8x16_t *a2)
{
  id v3 = a1;
  int v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  int8x16_t v6 = 0uLL;
  if (!v5)
  {
    [v3 SCNVector4Value];
    v9.i64[0] = v7;
    v9.i64[1] = v8;
    v11.i32[1] = v10;
    int8x16_t v6 = vorrq_s8((int8x16_t)vshll_n_s32(v11, 0x20uLL), v9);
  }
  BOOL result = v5 == 0;
  *a2 = v6;
  a2[1].i8[0] = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance SCNVector4@<X0>(id result@<X0>, _DWORD *a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    int v4 = (const char *)[v3 objCType];
    if (one-time initialization token for SCNVector4InNSValueObjCType != -1) {
      swift_once();
    }
    BOOL result = (id)strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
    if (!result)
    {
      BOOL result = [v3 SCNVector4Value];
      *a2 = v5;
      a2[1] = v6;
      a2[2] = v7;
      a2[3] = v8;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id one-time initialization function for SCNMatrix4InNSValueObjCType()
{
  memset(v3, 0, sizeof(v3));
  id v0 = [self valueWithSCNMatrix4:v3];
  id v1 = [v0 objCType];
  id result = v0;
  SCNMatrix4InNSValueObjCType = (uint64_t)v1;
  return result;
}

NSValue __swiftcall SCNMatrix4._bridgeToObjectiveC()()
{
  id v1 = self;
  long long v2 = v0[1];
  v6[0] = *v0;
  v6[1] = v2;
  long long v3 = v0[3];
  v6[2] = v0[2];
  v6[3] = v3;
  id v4 = [v1 valueWithSCNMatrix4:v6];

  return (NSValue)v4;
}

id static SCNMatrix4._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 SCNMatrix4Value];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_OWORD *)(a2 + 48) = v9;
    *(unsigned char *)(a2 + 64) = 0;
  }
  return result;
}

BOOL static SCNMatrix4._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if (v5)
  {
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    [v3 SCNMatrix4Value];
    *(_OWORD *)a2 = v7;
    *(_OWORD *)(a2 + 16) = v8;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v10;
  }
  BOOL result = v5 == 0;
  *(unsigned char *)(a2 + 64) = v5 != 0;
  return result;
}

id static SCNMatrix4._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, _OWORD *a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    id v4 = (const char *)[v3 objCType];
    if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1) {
      swift_once();
    }
    BOOL result = (id)strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
    if (!result)
    {
      BOOL result = [v3 SCNMatrix4Value];
      *a2 = v5;
      a2[1] = v6;
      a2[2] = v7;
      a2[3] = v8;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance SCNMatrix4()
{
  id v1 = self;
  long long v2 = v0[1];
  v6[0] = *v0;
  v6[1] = v2;
  long long v3 = v0[3];
  v6[2] = v0[2];
  v6[3] = v3;
  id v4 = [v1 valueWithSCNMatrix4:v6];

  return v4;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance SCNMatrix4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 SCNMatrix4Value];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_OWORD *)(a2 + 48) = v9;
    *(unsigned char *)(a2 + 64) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance SCNMatrix4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (const char *)[v3 objCType];
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if (v5)
  {
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    [v3 SCNMatrix4Value];
    *(_OWORD *)a2 = v7;
    *(_OWORD *)(a2 + 16) = v8;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v10;
  }
  BOOL result = v5 == 0;
  *(unsigned char *)(a2 + 64) = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance SCNMatrix4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (a1)
  {
    id v3 = a1;
    id v4 = (const char *)[v3 objCType];
    if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1) {
      swift_once();
    }
    if (!strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType))
    {
      id result = [v3 SCNMatrix4Value];
      *a2 = v6;
      a2[1] = v7;
      a2[2] = v8;
      a2[3] = v9;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return (id)__DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t type metadata accessor for _ArrayBuffer()
{
  return MEMORY[0x270F9EA50]();
}

uint64_t ContiguousArray.init<A>(_:)()
{
  return MEMORY[0x270F9ECA0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _ContiguousArrayBuffer.firstElementAddress.getter()
{
  return MEMORY[0x270F9F4B8]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}