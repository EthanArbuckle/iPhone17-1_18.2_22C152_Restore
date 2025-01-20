@interface TMLTransform3D
+ (void)initializeJSContext:(id)a3;
- (CATransform3D)transform;
- (TMLAffineTransform)affineTransform;
- (TMLTransform3D)initWithTransform3D:(CATransform3D *)a3;
- (double)m11;
- (double)m12;
- (double)m13;
- (double)m14;
- (double)m21;
- (double)m22;
- (double)m23;
- (double)m24;
- (double)m31;
- (double)m32;
- (double)m33;
- (double)m34;
- (double)m41;
- (double)m42;
- (double)m43;
- (double)m44;
- (id)CATransform3DValue;
- (void)setM11:(double)a3;
- (void)setM12:(double)a3;
- (void)setM13:(double)a3;
- (void)setM14:(double)a3;
- (void)setM21:(double)a3;
- (void)setM22:(double)a3;
- (void)setM23:(double)a3;
- (void)setM24:(double)a3;
- (void)setM31:(double)a3;
- (void)setM32:(double)a3;
- (void)setM33:(double)a3;
- (void)setM34:(double)a3;
- (void)setM41:(double)a3;
- (void)setM42:(double)a3;
- (void)setM43:(double)a3;
- (void)setM44:(double)a3;
@end

@implementation TMLTransform3D

- (TMLTransform3D)initWithTransform3D:(CATransform3D *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TMLTransform3D;
  result = [(TMLTransform3D *)&v11 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->m11;
    long long v6 = *(_OWORD *)&a3->m13;
    long long v7 = *(_OWORD *)&a3->m21;
    *(_OWORD *)&result->_transform.m23 = *(_OWORD *)&a3->m23;
    *(_OWORD *)&result->_transform.m21 = v7;
    *(_OWORD *)&result->_transform.m13 = v6;
    *(_OWORD *)&result->_transform.m11 = v5;
    long long v8 = *(_OWORD *)&a3->m31;
    long long v9 = *(_OWORD *)&a3->m33;
    long long v10 = *(_OWORD *)&a3->m41;
    *(_OWORD *)&result->_transform.m43 = *(_OWORD *)&a3->m43;
    *(_OWORD *)&result->_transform.m41 = v10;
    *(_OWORD *)&result->_transform.m33 = v9;
    *(_OWORD *)&result->_transform.m31 = v8;
  }
  return result;
}

- (id)CATransform3DValue
{
  long long v2 = *(_OWORD *)&self->_transform.m33;
  long long v11 = *(_OWORD *)&self->_transform.m31;
  long long v12 = v2;
  long long v3 = *(_OWORD *)&self->_transform.m43;
  long long v13 = *(_OWORD *)&self->_transform.m41;
  long long v14 = v3;
  long long v4 = *(_OWORD *)&self->_transform.m13;
  v8[0] = *(_OWORD *)&self->_transform.m11;
  v8[1] = v4;
  long long v5 = *(_OWORD *)&self->_transform.m23;
  long long v9 = *(_OWORD *)&self->_transform.m21;
  long long v10 = v5;
  long long v6 = objc_msgSend_valueWithCATransform3D_(MEMORY[0x263F08D40], a2, *(double *)&v9, v8);
  return v6;
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v53 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v54 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v55 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v56 = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v50[0] = *MEMORY[0x263F15740];
  v50[1] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v51 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v52 = v9;
  long long v11 = objc_msgSend_initWithTransform3D_(v5, v10, *(double *)&v51, v50);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, v13, v11, @"CATransform3DIdentity");

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_239851768;
  v49[3] = &unk_264DAC558;
  v49[4] = a1;
  long long v14 = (void *)MEMORY[0x23ECA7DD0](v49);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, v14, @"CATransform3DMakeTranslation");

  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_2398517E4;
  v48[3] = &unk_264DAC558;
  v48[4] = a1;
  v17 = (void *)MEMORY[0x23ECA7DD0](v48);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v18, v19, v17, @"CATransform3DMakeScale");

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_239851860;
  v47[3] = &unk_264DAC578;
  v47[4] = a1;
  v20 = (void *)MEMORY[0x23ECA7DD0](v47);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, v22, v20, @"CATransform3DMakeRotation");

  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = sub_2398518E4;
  v46[3] = &unk_264DAC598;
  v46[4] = a1;
  v23 = (void *)MEMORY[0x23ECA7DD0](v46);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v24, v25, v23, @"CATransform3DConcat");

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_2398519C0;
  v45[3] = &unk_264DAC5B8;
  v45[4] = a1;
  v26 = (void *)MEMORY[0x23ECA7DD0](v45);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, v28, v26, @"CATransform3DTranslate");

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = sub_239851A88;
  v44[3] = &unk_264DAC5B8;
  v44[4] = a1;
  v29 = (void *)MEMORY[0x23ECA7DD0](v44);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v30, v31, v29, @"CATransform3DScale");

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_239851B50;
  v43[3] = &unk_264DAC5D8;
  v43[4] = a1;
  v32 = (void *)MEMORY[0x23ECA7DD0](v43);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v33, v34, v32, @"CATransform3DRotate");

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = sub_239851C20;
  v42[3] = &unk_264DAC5F8;
  v42[4] = a1;
  v35 = (void *)MEMORY[0x23ECA7DD0](v42);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v36, v37, v35, @"CATransform3DInvert");

  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = sub_239851CC0;
  v41[3] = &unk_264DAC618;
  v41[4] = a1;
  v38 = (void *)MEMORY[0x23ECA7DD0](v41);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v39, v40, v38, @"CATransform3DMakeAffineTransform");
}

- (TMLAffineTransform)affineTransform
{
  long long v3 = [TMLAffineTransform alloc];
  long long v4 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&v12.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&v12.m33 = v4;
  long long v5 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&v12.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&v12.m43 = v5;
  long long v6 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&v12.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&v12.m13 = v6;
  long long v7 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&v12.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&v12.m23 = v7;
  CATransform3DGetAffineTransform(&v13, &v12);
  long long v10 = objc_msgSend_initWithAffineTransform_(v3, v8, v9, &v13);
  return (TMLAffineTransform *)v10;
}

- (void)setM11:(double)a3
{
  self->_transform.m11 = a3;
}

- (double)m11
{
  return self->_transform.m11;
}

- (void)setM12:(double)a3
{
  self->_transform.m12 = a3;
}

- (double)m12
{
  return self->_transform.m12;
}

- (void)setM13:(double)a3
{
  self->_transform.m13 = a3;
}

- (double)m13
{
  return self->_transform.m13;
}

- (void)setM14:(double)a3
{
  self->_transform.m14 = a3;
}

- (double)m14
{
  return self->_transform.m14;
}

- (void)setM21:(double)a3
{
  self->_transform.m21 = a3;
}

- (double)m21
{
  return self->_transform.m21;
}

- (void)setM22:(double)a3
{
  self->_transform.m22 = a3;
}

- (double)m22
{
  return self->_transform.m22;
}

- (void)setM23:(double)a3
{
  self->_transform.m23 = a3;
}

- (double)m23
{
  return self->_transform.m23;
}

- (void)setM24:(double)a3
{
  self->_transform.m24 = a3;
}

- (double)m24
{
  return self->_transform.m24;
}

- (void)setM31:(double)a3
{
  self->_transform.m31 = a3;
}

- (double)m31
{
  return self->_transform.m31;
}

- (void)setM32:(double)a3
{
  self->_transform.m32 = a3;
}

- (double)m32
{
  return self->_transform.m32;
}

- (void)setM33:(double)a3
{
  self->_transform.m33 = a3;
}

- (double)m33
{
  return self->_transform.m33;
}

- (void)setM34:(double)a3
{
  self->_transform.m34 = a3;
}

- (double)m34
{
  return self->_transform.m34;
}

- (void)setM41:(double)a3
{
  self->_transform.m41 = a3;
}

- (double)m41
{
  return self->_transform.m41;
}

- (void)setM42:(double)a3
{
  self->_transform.m42 = a3;
}

- (double)m42
{
  return self->_transform.m42;
}

- (void)setM43:(double)a3
{
  self->_transform.m43 = a3;
}

- (double)m43
{
  return self->_transform.m43;
}

- (void)setM44:(double)a3
{
  self->_transform.m44 = a3;
}

- (double)m44
{
  return self->_transform.m44;
}

- (CATransform3D)transform
{
  long long v3 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

@end