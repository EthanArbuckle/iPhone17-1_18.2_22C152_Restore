@interface VFXLOD
+ (BOOL)supportsSecureCoding;
+ (id)levelOfDetailWithModel:(id)a3 screenSpaceRadius:(float)a4;
+ (id)levelOfDetailWithModel:(id)a3 worldSpaceDistance:(float)a4;
- (VFXLOD)initWithCoder:(id)a3;
- (VFXLOD)initWithModel:(id)a3 thresholdMode:(int64_t)a4 lod:(__CFXLOD *)a5;
- (VFXLOD)initWithModel:(id)a3 thresholdMode:(int64_t)a4 thresholdValue:(id)a5;
- (VFXModel)model;
- (float)screenSpaceRadius;
- (float)worldSpaceDistance;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)thresholdValue;
- (int64_t)thresholdMode;
- (void)__CFObject;
- (void)_customEncodingOfVFXLOD:(id)a3;
- (void)_didDecodeVFXLOD:(id)a3;
- (void)_setupWithModel:(id)a3 thresholdMode:(int64_t)a4 value:(float)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VFXLOD

- (void)dealloc
{
  lod = self->_lod;
  if (lod)
  {
    CFRelease(lod);
    self->_lod = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)VFXLOD;
  [(VFXLOD *)&v4 dealloc];
}

- (void)_setupWithModel:(id)a3 thresholdMode:(int64_t)a4 value:(float)a5
{
  model = self->_model;
  if (model != a3)
  {

    self->_model = (VFXModel *)a3;
  }
  self->_mode = a4;
  v10 = (const void *)objc_msgSend___CFObject(a3, a2, (uint64_t)a3, a4);
  self->_lod = (__CFXLOD *)sub_1B647B1B4(v10, a4, a5);
}

- (VFXLOD)initWithModel:(id)a3 thresholdMode:(int64_t)a4 lod:(__CFXLOD *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)VFXLOD;
  v7 = [(VFXLOD *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    if (a5) {
      v7->_lod = (__CFXLOD *)CFRetain(a5);
    }
    v8->_mode = a4;
  }
  return v8;
}

- (VFXLOD)initWithModel:(id)a3 thresholdMode:(int64_t)a4 thresholdValue:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)VFXLOD;
  v11 = [(VFXLOD *)&v15 init];
  if (v11)
  {
    objc_msgSend_doubleValue(a5, v8, v9, v10);
    *(float *)&double v12 = v12;
    objc_msgSend__setupWithModel_thresholdMode_value_(v11, v13, (uint64_t)a3, a4, v12);
  }
  return v11;
}

+ (id)levelOfDetailWithModel:(id)a3 screenSpaceRadius:(float)a4
{
  v6 = objc_alloc_init(VFXLOD);
  *(float *)&double v7 = a4;
  objc_msgSend__setupWithModel_thresholdMode_value_(v6, v8, (uint64_t)a3, 1, v7);

  return v6;
}

+ (id)levelOfDetailWithModel:(id)a3 worldSpaceDistance:(float)a4
{
  v6 = objc_alloc_init(VFXLOD);
  *(float *)&double v7 = a4;
  objc_msgSend__setupWithModel_thresholdMode_value_(v6, v8, (uint64_t)a3, 0, v7);

  return v6;
}

- (void)__CFObject
{
  return self->_lod;
}

- (VFXModel)model
{
  return self->_model;
}

- (int64_t)thresholdMode
{
  return self->_mode;
}

- (id)thresholdValue
{
  float v11 = sub_1B647B2FC((uint64_t)self->_lod, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  double v12 = NSNumber;
  double v13 = v11;

  return (id)objc_msgSend_numberWithDouble_(v12, v8, v9, v10, v13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t mode = self->_mode;
  model = self->_model;

  return (id)MEMORY[0x1F4181798](v4, sel_initWithModel_thresholdMode_lod_, model, mode);
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (float)screenSpaceRadius
{
  if (self->_mode == 1) {
    return sub_1B647B2FC((uint64_t)self->_lod, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return 0.0;
  }
}

- (float)worldSpaceDistance
{
  if (self->_mode) {
    return 0.0;
  }
  else {
    return sub_1B647B2FC((uint64_t)self->_lod, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_model(self, a2, v2, v3);
  double v14 = sub_1B647B2FC((uint64_t)self->_lod, v7, v8, v9, v10, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, @"levelOfDetail <%p>: model:%@ threshold:%f useDistance:%d", v16, self, v6, *(void *)&v14, self->_mode == 0);
}

- (void)_customEncodingOfVFXLOD:(id)a3
{
  uint64_t v9 = NSNumber;
  float v10 = sub_1B647B2FC((uint64_t)self->_lod, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  uint64_t v15 = objc_msgSend_numberWithDouble_(v9, v11, v12, v13, v10);

  objc_msgSend_encodeObject_forKey_(a3, v14, v15, @"threshold");
}

- (void)_didDecodeVFXLOD:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"threshold");
  objc_msgSend_doubleValue(v7, v8, v9, v10);
  *(float *)&double v12 = v12;
  int64_t mode = self->_mode;
  model = self->_model;

  objc_msgSend__setupWithModel_thresholdMode_value_(self, v11, (uint64_t)model, mode, v12);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend__customEncodingOfVFXLOD_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_mode, @"mode");
  model = self->_model;
  if (model)
  {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)model, @"model");
  }
}

- (VFXLOD)initWithCoder:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)VFXLOD;
  uint64_t v7 = [(VFXLOD *)&v20 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->_int64_t mode = objc_msgSend_decodeIntegerForKey_(a3, v11, @"mode", v12);
    uint64_t v13 = objc_opt_class();
    v7->_model = (VFXModel *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"model");
    objc_msgSend__didDecodeVFXLOD_(v7, v15, (uint64_t)a3, v16);
    objc_msgSend_setImmediateMode_(VFXTransaction, v17, v8, v18);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end