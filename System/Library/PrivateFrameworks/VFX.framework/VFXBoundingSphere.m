@interface VFXBoundingSphere
- (__n128)center;
- (float)radius;
- (id)centerValue;
- (id)description;
- (void)setCenter:(VFXBoundingSphere *)self;
- (void)setCenterValue:(id)a3;
- (void)setRadius:(float)a3;
@end

@implementation VFXBoundingSphere

- (id)centerValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_center(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_center(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_center(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setCenterValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setCenter_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"bsphere %p - center:[%f %f %f] radius:%f", v2, self, *(float *)self->center, *(float *)&self->center[4], *(float *)&self->center[8], self->radius);
}

- (__n128)center
{
  return a1[1];
}

- (void)setCenter:(VFXBoundingSphere *)self
{
  *(_OWORD *)self->center = v2;
}

- (float)radius
{
  return self->radius;
}

- (void)setRadius:(float)a3
{
  self->radius = a3;
}

@end