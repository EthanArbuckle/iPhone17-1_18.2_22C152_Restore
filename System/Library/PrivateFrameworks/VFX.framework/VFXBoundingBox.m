@interface VFXBoundingBox
- (__n128)max;
- (__n128)min;
- (id)description;
- (id)maxValue;
- (id)minValue;
- (void)setMax:(VFXBoundingBox *)self;
- (void)setMaxValue:(id)a3;
- (void)setMin:(VFXBoundingBox *)self;
- (void)setMinValue:(id)a3;
@end

@implementation VFXBoundingBox

- (id)minValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_min(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_min(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_min(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setMinValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setMin_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)maxValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_max(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_max(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_max(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setMaxValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setMax_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"bbox %p - min:[%f %f %f] max:[%f %f %f]", v2, self, *(float *)self->min, *(float *)&self->min[4], *(float *)&self->min[8], *(float *)self->max, *(float *)&self->max[4], *(float *)&self->max[8]);
}

- (__n128)min
{
  return a1[1];
}

- (void)setMin:(VFXBoundingBox *)self
{
  *(_OWORD *)self->min = v2;
}

- (__n128)max
{
  return a1[2];
}

- (void)setMax:(VFXBoundingBox *)self
{
  *(_OWORD *)self->max = v2;
}

@end