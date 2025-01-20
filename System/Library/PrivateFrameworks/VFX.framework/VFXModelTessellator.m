@interface VFXModelTessellator
+ (BOOL)supportsSecureCoding;
+ (id)modelTessellator;
- ($B3497AEC183BF984E87C521FCF53B341)_tessellatorValueForGeometry:(SEL)a3;
- (BOOL)isAdaptive;
- (BOOL)isScreenSpace;
- (VFXModelTessellator)init;
- (VFXModelTessellator)initWithCoder:(id)a3;
- (float)edgeTessellationFactor;
- (float)insideTessellationFactor;
- (float)maximumEdgeLength;
- (float)tessellationFactorScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)smoothingMode;
- (unint64_t)tessellationPartitionMode;
- (void)addClient:(id)a3;
- (void)clientWillDie:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeClient:(id)a3;
- (void)setAdaptive:(BOOL)a3;
- (void)setEdgeTessellationFactor:(float)a3;
- (void)setInsideTessellationFactor:(float)a3;
- (void)setMaximumEdgeLength:(float)a3;
- (void)setScreenSpace:(BOOL)a3;
- (void)setSmoothingMode:(int64_t)a3;
- (void)setTessellationFactorScale:(float)a3;
- (void)setTessellationPartitionMode:(unint64_t)a3;
- (void)tessellatorValueDidChange;
- (void)tessellatorValueDidChangeForClient:(id)a3;
@end

@implementation VFXModelTessellator

- (VFXModelTessellator)init
{
  v9.receiver = self;
  v9.super_class = (Class)VFXModelTessellator;
  v2 = [(VFXModelTessellator *)&v9 init];
  if (v2)
  {
    *((void *)v2 + 1) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 20) = _Q0;
    *(_OWORD *)(v2 + 40) = xmmword_1B6E4F270;
  }
  return (VFXModelTessellator *)v2;
}

- (VFXModelTessellator)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VFXModelTessellator;
  v4 = [(VFXModelTessellator *)&v26 init];
  if (v4)
  {
    v4->_clients = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    objc_msgSend_decodeFloatForKey_(a3, v5, @"tessellationFactorScale", v6);
    v4->_tessellationFactorScale = v7;
    objc_msgSend_decodeFloatForKey_(a3, v8, @"maximumEdgeLength", v9);
    v4->_maximumEdgeLength = v10;
    objc_msgSend_decodeFloatForKey_(a3, v11, @"edgeTessellationFactor", v12);
    v4->_edgeTessellationFactor = v13;
    objc_msgSend_decodeFloatForKey_(a3, v14, @"insideTessellationFactor", v15);
    v4->_insideTessellationFactor = v16;
    v4->_adaptive = objc_msgSend_decodeBoolForKey_(a3, v17, @"adaptive", v18);
    v4->_screenSpace = objc_msgSend_decodeBoolForKey_(a3, v19, @"screenSpace", v20);
    v4->_partitionMode = objc_msgSend_decodeIntegerForKey_(a3, v21, @"tessellationPartitionMode", v22);
    v4->_smoothingMode = objc_msgSend_decodeIntegerForKey_(a3, v23, @"smoothingMode", v24);
  }
  return v4;
}

+ (id)modelTessellator
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v4 = self->_tessellationFactorScale;
  objc_msgSend_encodeFloat_forKey_(a3, a2, @"tessellationFactorScale", v3, v4);
  *(float *)&double v7 = self->_maximumEdgeLength;
  objc_msgSend_encodeFloat_forKey_(a3, v8, @"maximumEdgeLength", v9, v7);
  *(float *)&double v10 = self->_edgeTessellationFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v11, @"edgeTessellationFactor", v12, v10);
  *(float *)&double v13 = self->_insideTessellationFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v14, @"insideTessellationFactor", v15, v13);
  objc_msgSend_encodeBool_forKey_(a3, v16, self->_adaptive, @"adaptive");
  objc_msgSend_encodeBool_forKey_(a3, v17, self->_screenSpace, @"screenSpace");
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_partitionMode, @"tessellationPartitionMode");
  int64_t smoothingMode = self->_smoothingMode;

  objc_msgSend_encodeInteger_forKey_(a3, v19, smoothingMode, @"smoothingMode");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXModelTessellator;
  [(VFXModelTessellator *)&v3 dealloc];
}

- (id)description
{
  if (self->_adaptive)
  {
    BOOL screenSpace = self->_screenSpace;
    double v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    double maximumEdgeLength = self->_maximumEdgeLength;
    if (screenSpace) {
      return (id)objc_msgSend_stringWithFormat_(v4, v7, @"<%@: %p, screen space (maximum edge length: %.3f px)>", v8, maximumEdgeLength, v6, self, self->_maximumEdgeLength);
    }
    else {
      return (id)objc_msgSend_stringWithFormat_(v4, v7, @"<%@: %p, local space (maximum edge length: %.3f)>", v8, maximumEdgeLength, v6, self, self->_maximumEdgeLength);
    }
  }
  else
  {
    v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    return (id)objc_msgSend_stringWithFormat_(v11, v14, @"<%@: %p, uniform (inside: %.3f, edge: %.3f)>", v15, self->_insideTessellationFactor, v13, self, self->_insideTessellationFactor, self->_edgeTessellationFactor);
  }
}

- (void)addClient:(id)a3
{
  objc_msgSend_addObject_(self->_clients, a2, (uint64_t)a3, v3);

  objc_msgSend_tessellatorValueDidChangeForClient_(self, v6, (uint64_t)a3, v7);
}

- (void)removeClient:(id)a3
{
  uint64_t v6 = objc_msgSend_geometryRef(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_worldRef(a3, v7, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B63BF74C;
  v14[3] = &unk_1E6140A18;
  v14[4] = v6;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)a3, v14);
  objc_msgSend_removeObject_(self->_clients, v12, (uint64_t)a3, v13);
}

- (void)clientWillDie:(id)a3
{
  objc_msgSend_removeObject_(self->_clients, a2, (uint64_t)a3, v3);
}

- (void)tessellatorValueDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  clients = self->_clients;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(clients, a2, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(clients);
        }
        objc_msgSend_tessellatorValueDidChangeForClient_(self, v5, *(void *)(*((void *)&v10 + 1) + 8 * i), v6);
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(clients, v5, (uint64_t)&v10, (uint64_t)v14, 16);
    }
    while (v7);
  }
}

- ($B3497AEC183BF984E87C521FCF53B341)_tessellatorValueForGeometry:(SEL)a3
{
  uint64_t v7 = objc_msgSend_tessellator(a4, a3, (uint64_t)a4, v4);
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0;
  *(void *)&retstr->var0 = 0;
  if (objc_msgSend_subdivisionLevel(a4, v8, v9, v10))
  {
    unsigned __int8 v14 = 4;
  }
  else if (objc_msgSend_isAdaptive(v7, v11, v12, v13))
  {
    if (objc_msgSend_isScreenSpace(v7, v11, v12, v13)) {
      unsigned __int8 v14 = 2;
    }
    else {
      unsigned __int8 v14 = 3;
    }
  }
  else
  {
    unsigned __int8 v14 = 1;
  }
  retstr->var0 = v14;
  objc_msgSend_tessellationFactorScale(v7, v11, v12, v13);
  if (v18 < 0.001) {
    float v18 = 0.001;
  }
  retstr->var1 = v18;
  retstr->var2 = objc_msgSend_tessellationPartitionMode(v7, v15, v16, v17);
  result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_smoothingMode(v7, v19, v20, v21);
  retstr->var3 = result;
  switch(v14)
  {
    case 1u:
      objc_msgSend_edgeTessellationFactor(v7, v23, v24, v25);
      retstr->var4.var0.var0 = v27;
      result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_insideTessellationFactor(v7, v28, v29, v30);
      retstr->var4.var0.var1 = v31;
      break;
    case 2u:
    case 3u:
      result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_maximumEdgeLength(v7, v23, v24, v25);
      retstr->var4.var0.var0 = v26;
      break;
    case 4u:
      objc_msgSend_tessellationFactorScale(v7, v23, v24, v25);
      retstr->var4.var3.var0 = (int)v32;
      BYTE1(retstr->var4.var0.var0) = 1;
      result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_isScreenSpace(v7, v33, v34, v35);
      if (result) {
        char v36 = 3;
      }
      else {
        char v36 = 1;
      }
      BYTE1(retstr->var4.var0.var0) = v36;
      break;
    default:
      return result;
  }
  return result;
}

- (void)tessellatorValueDidChangeForClient:(id)a3
{
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  if (self) {
    objc_msgSend__tessellatorValueForGeometry_(self, a2, (uint64_t)a3, v3);
  }
  uint64_t v5 = objc_msgSend_worldRef(a3, a2, (uint64_t)a3, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B63BFA7C;
  v7[3] = &unk_1E6140A40;
  v7[4] = a3;
  long long v8 = v10;
  uint64_t v9 = v11;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)a3, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_tessellationFactorScale(self, v5, v6, v7);
  v4[8] = v8;
  objc_msgSend_maximumEdgeLength(self, v9, v10, v11);
  v4[5] = v12;
  objc_msgSend_edgeTessellationFactor(self, v13, v14, v15);
  v4[6] = v16;
  objc_msgSend_insideTessellationFactor(self, v17, v18, v19);
  v4[7] = v20;
  *((unsigned char *)v4 + 16) = objc_msgSend_isAdaptive(self, v21, v22, v23);
  *((unsigned char *)v4 + 17) = objc_msgSend_isScreenSpace(self, v24, v25, v26);
  *((void *)v4 + 5) = objc_msgSend_smoothingMode(self, v27, v28, v29);
  return v4;
}

- (int64_t)smoothingMode
{
  return self->_smoothingMode;
}

- (void)setSmoothingMode:(int64_t)a3
{
  if (self->_smoothingMode != a3)
  {
    self->_int64_t smoothingMode = a3;
    MEMORY[0x1F4181798]();
  }
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (void)setAdaptive:(BOOL)a3
{
  if (self->_adaptive != a3)
  {
    self->_adaptive = a3;
    MEMORY[0x1F4181798]();
  }
}

- (BOOL)isScreenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)a3
{
  if (self->_screenSpace != a3)
  {
    self->_BOOL screenSpace = a3;
    MEMORY[0x1F4181798]();
  }
}

- (float)tessellationFactorScale
{
  return self->_tessellationFactorScale;
}

- (void)setTessellationFactorScale:(float)a3
{
  if (self->_tessellationFactorScale != a3)
  {
    self->_tessellationFactorScale = a3;
    MEMORY[0x1F4181798]();
  }
}

- (float)edgeTessellationFactor
{
  return self->_edgeTessellationFactor;
}

- (void)setEdgeTessellationFactor:(float)a3
{
  if (self->_edgeTessellationFactor != a3)
  {
    self->_edgeTessellationFactor = a3;
    MEMORY[0x1F4181798]();
  }
}

- (float)insideTessellationFactor
{
  return self->_insideTessellationFactor;
}

- (void)setInsideTessellationFactor:(float)a3
{
  if (self->_insideTessellationFactor != a3)
  {
    self->_insideTessellationFactor = a3;
    MEMORY[0x1F4181798]();
  }
}

- (float)maximumEdgeLength
{
  return self->_maximumEdgeLength;
}

- (void)setMaximumEdgeLength:(float)a3
{
  if (self->_maximumEdgeLength != a3)
  {
    self->_double maximumEdgeLength = a3;
    MEMORY[0x1F4181798]();
  }
}

- (unint64_t)tessellationPartitionMode
{
  return self->_partitionMode;
}

- (void)setTessellationPartitionMode:(unint64_t)a3
{
  if (self->_partitionMode != a3)
  {
    self->_partitionMode = a3;
    MEMORY[0x1F4181798]();
  }
}

@end