@interface TMLAffineTransform
+ (void)initializeJSContext:(id)a3;
- (CGAffineTransform)transform;
- (TMLAffineTransform)initWithAffineTransform:(CGAffineTransform *)a3;
- (double)a;
- (double)b;
- (double)c;
- (double)d;
- (double)tx;
- (double)ty;
- (id)CGAffineTransformValue;
@end

@implementation TMLAffineTransform

- (TMLAffineTransform)initWithAffineTransform:(CGAffineTransform *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TMLAffineTransform;
  result = [(TMLAffineTransform *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->a;
    long long v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)&a3->tx;
    *(_OWORD *)&result->_transform.c = v6;
    *(_OWORD *)&result->_transform.a = v5;
  }
  return result;
}

- (id)CGAffineTransformValue
{
  long long v2 = *(_OWORD *)&self->_transform.c;
  v5[0] = *(_OWORD *)&self->_transform.a;
  v5[1] = v2;
  long long v6 = *(_OWORD *)&self->_transform.tx;
  v3 = objc_msgSend_valueWithCGAffineTransform_(MEMORY[0x263F08D40], a2, *(double *)&v6, v5);
  return v3;
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v51[0] = *MEMORY[0x263F000D0];
  v51[1] = v6;
  long long v52 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  v8 = objc_msgSend_initWithAffineTransform_(v5, v7, *(double *)&v52, v51);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, v10, v8, @"CGAffineTransformIdentity");

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_239840984;
  v50[3] = &unk_264DAC050;
  v50[4] = a1;
  v11 = (void *)MEMORY[0x23ECA7DD0](v50);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, v13, v11, @"affinetransform");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, v15, v11, @"CGAffineTransformMake");

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_2398409FC;
  v49[3] = &unk_264DAC070;
  v49[4] = a1;
  v16 = (void *)MEMORY[0x23ECA7DD0](v49);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v17, v18, v16, @"CGAffineTransformMakeTranslation");

  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_239840A68;
  v48[3] = &unk_264DAC070;
  v48[4] = a1;
  v19 = (void *)MEMORY[0x23ECA7DD0](v48);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v20, v21, v19, @"CGAffineTransformMakeScale");

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_239840AD4;
  v47[3] = &unk_264DAC090;
  v47[4] = a1;
  v22 = (void *)MEMORY[0x23ECA7DD0](v47);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v23, v24, v22, @"CGAffineTransformMakeRotation");

  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = sub_239840B38;
  v46[3] = &unk_264DAC0B0;
  v46[4] = a1;
  v25 = (void *)MEMORY[0x23ECA7DD0](v46);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v26, v27, v25, @"CGAffineTransformConcat");

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_239840C04;
  v45[3] = &unk_264DAC0D0;
  v45[4] = a1;
  v28 = (void *)MEMORY[0x23ECA7DD0](v45);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v29, v30, v28, @"CGAffineTransformTranslate");

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = sub_239840CAC;
  v44[3] = &unk_264DAC0D0;
  v44[4] = a1;
  v31 = (void *)MEMORY[0x23ECA7DD0](v44);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v32, v33, v31, @"CGAffineTransformScale");

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_239840D54;
  v43[3] = &unk_264DAC0F0;
  v43[4] = a1;
  v34 = (void *)MEMORY[0x23ECA7DD0](v43);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v35, v36, v34, @"CGAffineTransformRotate");

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = sub_239840DF4;
  v42[3] = &unk_264DAC110;
  v42[4] = a1;
  v37 = (void *)MEMORY[0x23ECA7DD0](v42);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v38, v39, v37, @"CGAffineTransformInvert");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v40, v41, &unk_26ECEBDF8, @"CGAffineTransformEqualToTransform");
}

- (double)a
{
  return self->_transform.a;
}

- (double)b
{
  return self->_transform.b;
}

- (double)c
{
  return self->_transform.c;
}

- (double)d
{
  return self->_transform.d;
}

- (double)tx
{
  return self->_transform.tx;
}

- (double)ty
{
  return self->_transform.ty;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

@end