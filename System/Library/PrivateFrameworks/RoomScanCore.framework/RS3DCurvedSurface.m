@interface RS3DCurvedSurface
+ (BOOL)supportsSecureCoding;
- (RS3DCurvedSurface)init;
- (RS3DCurvedSurface)initWithCoder:(id)a3;
- (RS3DCurvedSurface)initWithDictionaryRepresentation:(id)a3;
- (RS3DCurvedSurface)initWithDictionaryRepresentation:(id)a3 WithGroupId:(unsigned int)a4;
- (double)circleCenter;
- (float)endOrientation;
- (float)radius;
- (float)startOrientation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)rotateAlongZAxisRightHand:(float)a3;
- (void)translateBy:(RS3DCurvedSurface *)self;
@end

@implementation RS3DCurvedSurface

- (float)endOrientation
{
  return self->_endOrientation;
}

- (float)startOrientation
{
  return self->_startOrientation;
}

- (float)radius
{
  return self->_radius;
}

- (double)circleCenter
{
  return *(double *)(a1 + 360);
}

- (void)translateBy:(RS3DCurvedSurface *)self
{
  float32x2_t v4 = v2;
  v5.receiver = self;
  v5.super_class = (Class)RS3DCurvedSurface;
  -[RS3DSurface translateBy:](&v5, sel_translateBy_);
  *(float32x2_t *)&self->_circleCenter[4] = vadd_f32(v4, *(float32x2_t *)&self->_circleCenter[4]);
}

- (void)rotateAlongZAxisRightHand:(float)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RS3DCurvedSurface;
  -[RS3DSurface rotateAlongZAxisRightHand:](&v9, sel_rotateAlongZAxisRightHand_);
  __float2 v7 = __sincosf_stret(a3);
  *(float *)v6.i32 = v7.__cosval;
  *(__float2 *)v5.i8 = v7;
  *(float *)&v6.i32[1] = -v7.__sinval;
  int8x16_t v8 = (int8x16_t)vzip1q_s32(v6, v5);
  *(float32x2_t *)&self->_circleCenter[4] = vmla_lane_f32(vmul_n_f32(*(float32x2_t *)v8.i8, COERCE_FLOAT(*(void *)&self->_circleCenter[4])), (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), *(float32x2_t *)&self->_circleCenter[4], 1);
}

- (RS3DCurvedSurface)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RS3DCurvedSurface;
  int32x4_t v5 = [(RS3DSurface *)&v20 initWithCoder:v4];
  if (v5)
  {
    int32x4_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"circle_center");
    sub_25B52FD28(v12, &v5->_circleCenter[4]);
    objc_msgSend_decodeFloatForKey_(v4, v13, @"radius");
    v5->_radius = v14;
    objc_msgSend_decodeFloatForKey_(v4, v15, @"starting_orientation");
    v5->_startOrientation = v16;
    objc_msgSend_decodeFloatForKey_(v4, v17, @"ending_orientation");
    v5->_endOrientation = v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RS3DCurvedSurface;
  id v5 = [(RS3DSurface *)&v16 encodeWithCoder:v4];
  uint64_t v8 = sub_25B52FEF0(*(double *)&self->_circleCenter[4], (uint64_t)v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"circle_center");

  *(float *)&double v10 = self->_radius;
  objc_msgSend_encodeFloat_forKey_(v4, v11, @"radius", v10);
  *(float *)&double v12 = self->_startOrientation;
  objc_msgSend_encodeFloat_forKey_(v4, v13, @"starting_orientation", v12);
  *(float *)&double v14 = self->_endOrientation;
  objc_msgSend_encodeFloat_forKey_(v4, v15, @"ending_orientation", v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RS3DCurvedSurface;
  id result = [(RS3DSurface *)&v5 copyWithZone:a3];
  *((void *)result + 45) = *(void *)&self->_circleCenter[4];
  *((_DWORD *)result + 84) = LODWORD(self->_radius);
  *((_DWORD *)result + 85) = LODWORD(self->_startOrientation);
  *((_DWORD *)result + 86) = LODWORD(self->_endOrientation);
  *((_DWORD *)result + 87) = LODWORD(self->_floorHeight);
  *((_DWORD *)result + 88) = LODWORD(self->_ceilingHeight);
  return result;
}

- (id)dictionaryRepresentation
{
  v38.receiver = self;
  v38.super_class = (Class)RS3DCurvedSurface;
  v3 = [(RS3DSurface *)&v38 dictionaryRepresentation];
  int32x4_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  double v10 = sub_25B52FEF0(*(double *)&self->_circleCenter[4], v7, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v11, (uint64_t)v10, @"circle_center");

  *(float *)&double v12 = self->_radius;
  v15 = objc_msgSend_numberWithFloat_(NSNumber, v13, v14, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v16, (uint64_t)v15, @"radius");

  *(float *)&double v17 = self->_startOrientation;
  objc_super v20 = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v21, (uint64_t)v20, @"starting_orientation");

  *(float *)&double v22 = self->_endOrientation;
  v25 = objc_msgSend_numberWithFloat_(NSNumber, v23, v24, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v26, (uint64_t)v25, @"ending_orientation");

  *(float *)&double v27 = self->_floorHeight;
  v30 = objc_msgSend_numberWithFloat_(NSNumber, v28, v29, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v31, (uint64_t)v30, @"floor_height");

  *(float *)&double v32 = self->_ceilingHeight;
  v35 = objc_msgSend_numberWithFloat_(NSNumber, v33, v34, v32);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v36, (uint64_t)v35, @"ceiling_height");

  return v6;
}

- (RS3DCurvedSurface)initWithDictionaryRepresentation:(id)a3 WithGroupId:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_init(self, v6, v7);
  uint64_t v9 = v8;
  objc_msgSend_fillWithDictionaryRepresentation_(v8, v10, (uint64_t)v5);
  objc_msgSend_objectForKeyedSubscript_(v5, v11, @"circle_center");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13) {
    sub_25B52FD28(v13, v8 + 45);
  }

  objc_msgSend_objectForKeyedSubscript_(v5, v14, @"radius");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (v16)
  {
    objc_msgSend_floatValue(v16, v17, v18);
    *((_DWORD *)v9 + 84) = v19;
  }

  objc_msgSend_objectForKeyedSubscript_(v5, v20, @"starting_orientation");
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  if (v22)
  {
    objc_msgSend_floatValue(v22, v23, v24);
    *((_DWORD *)v9 + 85) = v25;
  }

  objc_msgSend_objectForKeyedSubscript_(v5, v26, @"ending_orientation");
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v28 = v27;
  }
  else {
    id v28 = 0;
  }

  if (v28)
  {
    objc_msgSend_floatValue(v28, v29, v30);
    *((_DWORD *)v9 + 86) = v31;
  }

  v33 = objc_msgSend_objectForKeyedSubscript_(v5, v32, @"floor_height");

  if (v33)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v34, @"floor_height");
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }

    if (v36)
    {
      objc_msgSend_floatValue(v36, v37, v38);
      *((_DWORD *)v9 + 87) = v39;
    }
  }
  v40 = objc_msgSend_objectForKeyedSubscript_(v5, v34, @"ceiling_height");

  if (v40)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v41, @"ceiling_height");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v43 = v42;
    }
    else {
      id v43 = 0;
    }

    if (v43)
    {
      objc_msgSend_floatValue(v43, v44, v45);
      *((_DWORD *)v9 + 88) = v46;
    }
  }
  return (RS3DCurvedSurface *)v9;
}

- (RS3DCurvedSurface)initWithDictionaryRepresentation:(id)a3
{
  return (RS3DCurvedSurface *)objc_msgSend_initWithDictionaryRepresentation_WithGroupId_(self, a2, (uint64_t)a3, 0);
}

- (RS3DCurvedSurface)init
{
  v3.receiver = self;
  v3.super_class = (Class)RS3DCurvedSurface;
  id result = [(RS3DSurface *)&v3 init];
  if (result)
  {
    result->_radius = 0.0;
    *(void *)&result->_circleCenter[4] = 0;
    result->_startOrientation = 0.0;
    result->_endOrientation = 0.0;
    result->_floorHeight = 0.0;
    result->_ceilingHeight = 0.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end