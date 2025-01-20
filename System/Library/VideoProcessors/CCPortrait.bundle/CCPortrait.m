BOOL enableFGBlur(int a1)
{
  return a1 > 0;
}

id sub_262E11EA4(__int16 a1)
{
  v34[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = (unsigned __int16)(3 * a1 * a1);
  v2 = (short float *)malloc_type_malloc(8 * v1, 0xCB4280B1uLL);
  v3 = malloc_type_malloc(4 * v1, 0xF417B6FBuLL);
  if (!v2) {
    sub_262E48B94();
  }
  v5 = v3;
  if (!v3) {
    sub_262E48BC0();
  }
  if (v1)
  {
    uint64_t v6 = 0;
    v7 = v3 + 1;
    v8 = v2 + 2;
    short float v9 = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(3.0)) / (short float)v1;
    do
    {
      _H0 = (short float)(unsigned __int16)v6;
      __asm { FCVT            S0, H0 }
      _S1 = floorf(sqrtf((float)(_S0 + 0.5) / 3.0));
      __asm
      {
        FCVT            H1, S1
        FCVT            S2, H1
      }
      _S0 = _S0 + (float)((float)(_S2 * -3.0) * _S2);
      __asm { FCVT            H0, S0 }
      _S3 = (float)(_S2 * 6.0) + 3.0;
      __asm { FCVT            H3, S3 }
      *(short float *)&_S3 = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)) / *(short float *)&_S3;
      __asm
      {
        FCVT            S4, H3
        FCVT            S0, H0
      }
      _S0 = (float)(_S4 + _S4) * _S0;
      __asm { FCVT            H0, S0 }
      _S2 = (float)(_S2 + 1.0) * (float)(_S2 + 1.0);
      __asm { FCVT            H2, S2 }
      *(v8 - 2) = v9 * (short float)(*(short float *)&_S1 * *(short float *)&_S1);
      *(v8 - 1) = v9 * *(short float *)&_S2;
      short float *v8 = *(short float *)&_S3;
      *((_WORD *)v8 + 1) = 0;
      __asm { FCVT            D0, H0 }
      _KR00_16 = __sincos_stret(_D0 * 3.14159265);
      __asm { FCVT            H1, D1 }
      *(v7 - 1) = _H1;
      __asm { FCVT            H0, D0 }
      _WORD *v7 = _H0;
      ++v6;
      v7 += 2;
      v8 += 4;
    }
    while (v1 != v6);
  }
  v28 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)v2, 8 * v1);
  v30 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v29, (uint64_t)v5, 4 * v1);
  free(v2);
  free(v5);
  v34[0] = v28;
  v34[1] = v30;
  v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v31, (uint64_t)v34, 2);

  return v32;
}

void sub_262E121AC()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  id v35 = (id)objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  v4 = objc_msgSend_dictionaryRepresentation(v35, v2, v3);
  uint64_t v6 = v4;
  if (v4)
  {
    v4 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"hairnetModelPath");
  }
  v7 = (void *)qword_26B425298;
  qword_26B425298 = (uint64_t)v4;

  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  int v14 = objc_msgSend_fileExistsAtPath_(v10, v11, qword_26B425298);
  v15 = (void *)qword_26B425298;
  if (v14)
  {
    v16 = (const char *)objc_msgSend_UTF8String((void *)qword_26B425298, v12, v13);
    printf("Using Hairnet model at: %s\n", v16);
  }
  else
  {
    qword_26B425298 = 0;
  }
  if (!qword_26B425298)
  {
    uint64_t v18 = objc_msgSend_pathFromBaseName_(EspressoWrapper, v17, @"hairnet-v1");
    v19 = (void *)qword_26B425298;
    qword_26B425298 = v18;

    int v23 = objc_msgSend_fileExistsAtPath_(v10, v20, qword_26B425298);
    v24 = (void *)qword_26B425298;
    if (v23)
    {
      v25 = (const char *)objc_msgSend_UTF8String((void *)qword_26B425298, v21, v22);
      printf("Using Hairnet model at: %s\n", v25);
    }
    else
    {
      qword_26B425298 = 0;
    }
    if (!qword_26B425298)
    {
      v26 = (void *)MEMORY[0x263F086E0];
      uint64_t v27 = objc_opt_class();
      v29 = objc_msgSend_bundleForClass_(v26, v28, v27);
      uint64_t v31 = objc_msgSend_pathForResource_ofType_(v29, v30, @"model_quantized.espresso", @"net");
      v32 = (void *)qword_26B425298;
      qword_26B425298 = v31;

      if (objc_msgSend_fileExistsAtPath_(v10, v33, qword_26B425298))
      {
        puts("Using Hairnet model in CCPortrait.bundle");
      }
      else
      {
        v34 = (void *)qword_26B425298;
        qword_26B425298 = 0;
      }
      if (!qword_26B425298) {
        puts("Hairnet model not found.");
      }
    }
  }
}

CGFloat sub_262E1299C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  if (a6 != 2)
  {
    v11 = objc_msgSend_objectForKeyedSubscript_(a7, a6, @"SparseRenderer::kPreFilterRadius");
    objc_msgSend_floatValue(v11, v12, v13);
    float v15 = v14;

    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    *(void *)&a1 = (unint64_t)CGRectInset(v17, (float)-v15, 0.0);
  }
  return a1;
}

CGFloat sub_262E12A50(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  if (a6 != 2)
  {
    v11 = objc_msgSend_objectForKeyedSubscript_(a7, a6, @"SparseRenderer::kPreFilterRadius");
    objc_msgSend_floatValue(v11, v12, v13);
    float v15 = v14;

    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    *(void *)&a1 = (unint64_t)CGRectInset(v17, 0.0, (float)-v15);
  }
  return a1;
}

CGFloat sub_262E12B04(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  if (!a6)
  {
    CGAffineTransformMakeScale(&v11, 2.0, 2.0);
    v12.origin.x = a1;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v12, &v11);
  }
  return a1;
}

CGFloat sub_262E12B8C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v14 = a9;
  v16 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
  objc_msgSend_CGRectValue(v16, v17, v18);
  double v39 = v20;
  double v40 = v19;

  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v14, v21, 1);
  objc_msgSend_CGRectValue(v22, v23, v24);
  double v26 = v25;
  double v28 = v27;

  v30 = objc_msgSend_objectAtIndexedSubscript_(v14, v29, 2);

  objc_msgSend_CGRectValue(v30, v31, v32);
  double v34 = v33;
  double v36 = v35;

  if (a6 != 2)
  {
    if (a6 == 1)
    {
      CGAffineTransformMakeScale(&v41, v26 / v34, v28 / v36);
      v37 = &v41;
    }
    else
    {
      if (a6) {
        return *MEMORY[0x263F001A0];
      }
      CGAffineTransformMakeScale(&v42, v40 / v34, v39 / v36);
      v37 = &v42;
    }
    v43.origin.x = a1;
    v43.origin.y = a2;
    v43.size.width = a3;
    v43.size.height = a4;
    *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v43, v37);
  }
  return a1;
}

CGFloat sub_262E12CF0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v14 = a9;
  v16 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
  objc_msgSend_CGRectValue(v16, v17, v18);
  double v39 = v20;
  double v40 = v19;

  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v14, v21, 1);
  objc_msgSend_CGRectValue(v22, v23, v24);
  double v26 = v25;
  double v28 = v27;

  v30 = objc_msgSend_objectAtIndexedSubscript_(v14, v29, 2);

  objc_msgSend_CGRectValue(v30, v31, v32);
  double v34 = v33;
  double v36 = v35;

  if (a6 != 2)
  {
    if (a6 == 1)
    {
      CGAffineTransformMakeScale(&v41, v26 / v34, v28 / v36);
      v37 = &v41;
    }
    else
    {
      if (a6) {
        return *MEMORY[0x263F001A0];
      }
      CGAffineTransformMakeScale(&v42, v40 / v34, v39 / v36);
      v37 = &v42;
    }
    v43.origin.x = a1;
    v43.origin.y = a2;
    v43.size.width = a3;
    v43.size.height = a4;
    *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v43, v37);
  }
  return a1;
}

CGFloat sub_262E12E54(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v14 = a9;
  v16 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
  objc_msgSend_CGRectValue(v16, v17, v18);
  double v20 = v19;
  double v22 = v21;

  uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v14, v23, 1);

  objc_msgSend_CGRectValue(v24, v25, v26);
  double v28 = v27;
  double v30 = v29;

  if (a6 != 1)
  {
    if (a6)
    {
      return *MEMORY[0x263F001A0];
    }
    else
    {
      CGAffineTransformMakeScale(&v32, v20 / v28, v22 / v30);
      v33.origin.x = a1;
      v33.origin.y = a2;
      v33.size.width = a3;
      v33.size.height = a4;
      *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v33, &v32);
    }
  }
  return a1;
}

double sub_262E12F70(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, void *a9)
{
  id v15 = a9;
  CGRect v17 = objc_msgSend_objectForKeyedSubscript_(a7, v16, @"SparseRenderer::kMaxBlur_ushort");
  __int16 v20 = objc_msgSend_unsignedShortValue(v17, v18, v19);

  _H14 = v20;
  int v23 = objc_msgSend_objectAtIndexedSubscript_(v15, v22, 0);
  objc_msgSend_CGRectValue(v23, v24, v25);
  double v27 = v26;
  double v29 = v28;

  __asm { FCVT            S0, H14 }
  if (v27 >= v29) {
    double v35 = v27;
  }
  else {
    double v35 = v29;
  }
  float v36 = v35;
  CGFloat v37 = (float)-(float)(_S0 * v36);
  v57.origin.double x = a1;
  v57.origin.CGFloat y = a2;
  v57.size.CGFloat width = a3;
  v57.size.CGFloat height = a4;
  CGRect v58 = CGRectInset(v57, v37, v37);
  double x = v58.origin.x;
  CGFloat y = v58.origin.y;
  CGFloat width = v58.size.width;
  CGFloat height = v58.size.height;
  if (a6 == 2)
  {
    CGRect v43 = objc_msgSend_objectAtIndexedSubscript_(v15, v38, 2);
    objc_msgSend_CGRectValue(v43, v44, v45);
    CGFloat v47 = v46;
    CGFloat v49 = v48;

    CGAffineTransformMakeScale(&v56, 1.0 / v27, 1.0 / v29);
    v59.origin.double x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGRect v60 = CGRectApplyAffineTransform(v59, &v56);
    CGFloat v50 = v60.origin.x;
    CGFloat v51 = v60.origin.y;
    CGFloat v52 = v60.size.width;
    CGFloat v53 = v60.size.height;
    CGAffineTransformMakeScale(&v55, v47, v49);
    v61.origin.double x = v50;
    v61.origin.CGFloat y = v51;
    v61.size.CGFloat width = v52;
    v61.size.CGFloat height = v53;
    *(void *)&double x = (unint64_t)CGRectApplyAffineTransform(v61, &v55);
  }

  return x;
}

double sub_262E1311C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, void *a9)
{
  id v15 = a9;
  CGRect v17 = objc_msgSend_objectForKeyedSubscript_(a7, v16, @"SparseRenderer::kMaxBlur_ushort");
  __int16 v20 = objc_msgSend_unsignedShortValue(v17, v18, v19);

  _H14 = v20;
  int v23 = objc_msgSend_objectAtIndexedSubscript_(v15, v22, 0);
  objc_msgSend_CGRectValue(v23, v24, v25);
  double v27 = v26;
  double v29 = v28;

  __asm { FCVT            S0, H14 }
  if (v27 >= v29) {
    double v35 = v27;
  }
  else {
    double v35 = v29;
  }
  float v36 = v35;
  CGFloat v37 = (float)-(float)(_S0 * v36);
  v57.origin.double x = a1;
  v57.origin.CGFloat y = a2;
  v57.size.CGFloat width = a3;
  v57.size.CGFloat height = a4;
  CGRect v58 = CGRectInset(v57, v37, v37);
  double x = v58.origin.x;
  CGFloat y = v58.origin.y;
  CGFloat width = v58.size.width;
  CGFloat height = v58.size.height;
  if (a6 == 1)
  {
    CGRect v43 = objc_msgSend_objectAtIndexedSubscript_(v15, v38, 1);
    objc_msgSend_CGRectValue(v43, v44, v45);
    CGFloat v47 = v46;
    CGFloat v49 = v48;

    CGAffineTransformMakeScale(&v56, 1.0 / v27, 1.0 / v29);
    v59.origin.double x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGRect v60 = CGRectApplyAffineTransform(v59, &v56);
    CGFloat v50 = v60.origin.x;
    CGFloat v51 = v60.origin.y;
    CGFloat v52 = v60.size.width;
    CGFloat v53 = v60.size.height;
    CGAffineTransformMakeScale(&v55, v47, v49);
    v61.origin.double x = v50;
    v61.origin.CGFloat y = v51;
    v61.size.CGFloat width = v52;
    v61.size.CGFloat height = v53;
    *(void *)&double x = (unint64_t)CGRectApplyAffineTransform(v61, &v55);
  }

  return x;
}

double sub_262E132C8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, void *a9)
{
  id v15 = a9;
  CGRect v17 = objc_msgSend_objectForKeyedSubscript_(a7, v16, @"SparseRenderer::kMaxBlur_ushort");
  __int16 v20 = objc_msgSend_unsignedShortValue(v17, v18, v19);

  _H14 = v20;
  int v23 = objc_msgSend_objectAtIndexedSubscript_(v15, v22, 0);
  objc_msgSend_CGRectValue(v23, v24, v25);
  double v27 = v26;
  double v29 = v28;

  __asm { FCVT            S0, H14 }
  if (v27 >= v29) {
    double v35 = v27;
  }
  else {
    double v35 = v29;
  }
  float v36 = v35;
  CGFloat v37 = (float)-(float)(_S0 * v36);
  v57.origin.double x = a1;
  v57.origin.CGFloat y = a2;
  v57.size.CGFloat width = a3;
  v57.size.CGFloat height = a4;
  CGRect v58 = CGRectInset(v57, v37, v37);
  double x = v58.origin.x;
  CGFloat y = v58.origin.y;
  CGFloat width = v58.size.width;
  CGFloat height = v58.size.height;
  if (a6 == 1)
  {
    CGRect v43 = objc_msgSend_objectAtIndexedSubscript_(v15, v38, 1);
    objc_msgSend_CGRectValue(v43, v44, v45);
    CGFloat v47 = v46;
    CGFloat v49 = v48;

    CGAffineTransformMakeScale(&v56, 1.0 / v27, 1.0 / v29);
    v59.origin.double x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGRect v60 = CGRectApplyAffineTransform(v59, &v56);
    CGFloat v50 = v60.origin.x;
    CGFloat v51 = v60.origin.y;
    CGFloat v52 = v60.size.width;
    CGFloat v53 = v60.size.height;
    CGAffineTransformMakeScale(&v55, v47, v49);
    v61.origin.double x = v50;
    v61.origin.CGFloat y = v51;
    v61.size.CGFloat width = v52;
    v61.size.CGFloat height = v53;
    *(void *)&double x = (unint64_t)CGRectApplyAffineTransform(v61, &v55);
  }

  return x;
}

CGFloat sub_262E13474(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  if (a6 != 1)
  {
    CGAffineTransform v11 = objc_msgSend_objectForKeyedSubscript_(a7, a6, @"SparseRenderer::kAntiAliasRadius");
    objc_msgSend_floatValue(v11, v12, v13);
    float v15 = v14;

    v17.origin.double x = a1;
    v17.origin.CGFloat y = a2;
    v17.size.CGFloat width = a3;
    v17.size.CGFloat height = a4;
    *(void *)&a1 = (unint64_t)CGRectInset(v17, (float)-v15, 0.0);
  }
  return a1;
}

CGFloat sub_262E13528(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  if (a6 != 1)
  {
    CGAffineTransform v11 = objc_msgSend_objectForKeyedSubscript_(a7, a6, @"SparseRenderer::kAntiAliasRadius");
    objc_msgSend_floatValue(v11, v12, v13);
    float v15 = v14;

    v17.origin.double x = a1;
    v17.origin.CGFloat y = a2;
    v17.size.CGFloat width = a3;
    v17.size.CGFloat height = a4;
    *(void *)&a1 = (unint64_t)CGRectInset(v17, 0.0, (float)-v15);
  }
  return a1;
}

double sub_262E135DC(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10)
{
  id v15 = a10;
  CGRect v17 = objc_msgSend_objectForKeyedSubscript_(a8, v16, @"inputBlurRadius");
  objc_msgSend_floatValue(v17, v18, v19);
  float v21 = v20;
  objc_msgSend_floatValue(v15, v22, v23);
  float v25 = v24;

  double v26 = a1;
  double v27 = a2;
  double v28 = a3;
  double v29 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v26, (float)((float)(v21 * -3.0) * v25), 0.0);
  return result;
}

double sub_262E13694(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10)
{
  id v15 = a10;
  CGRect v17 = objc_msgSend_objectForKeyedSubscript_(a8, v16, @"inputBlurRadius");
  objc_msgSend_floatValue(v17, v18, v19);
  float v21 = v20;
  objc_msgSend_floatValue(v15, v22, v23);
  float v25 = v24;

  double v26 = a1;
  double v27 = a2;
  double v28 = a3;
  double v29 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v26, 0.0, (float)((float)(v21 * -3.0) * v25));
  return result;
}

CGFloat sub_262E1374C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v22 = a10;
  if (a6 == 1)
  {
    CGAffineTransformMakeScale(&v30, 2.0, 2.0);
    double v28 = &v30;
    goto LABEL_5;
  }
  if (!a6)
  {
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v21, @"blurredScale");
    objc_msgSend_floatValue(v23, v24, v25);
    float v27 = v26;

    CGAffineTransformMakeScale(&v31, v27, v27);
    double v28 = &v31;
LABEL_5:
    v32.origin.double x = a1;
    v32.origin.CGFloat y = a2;
    v32.size.CGFloat width = a3;
    v32.size.CGFloat height = a4;
    *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v32, v28);
  }

  return a1;
}

CGFloat sub_262E13878(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (a6 == 2) {
    goto LABEL_5;
  }
  if (a6 != 1)
  {
    if (!a6)
    {
      CGAffineTransformMakeScale(&v23, 0.5, 0.5);
      v24.origin.double x = a1;
      v24.origin.CGFloat y = a2;
      v24.size.CGFloat width = a3;
      v24.size.CGFloat height = a4;
      *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v24, &v23);
      goto LABEL_6;
    }
LABEL_5:
    a1 = *MEMORY[0x263F001A0];
  }
LABEL_6:

  return a1;
}

CGFloat sub_262E13980(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, unsigned int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v22 = a10;
  if (a6 == 3)
  {
    CGAffineTransformMakeScale(&v40, 0.5, 0.5);
    CGAffineTransform v30 = &v40;
LABEL_8:
    v41.origin.double x = a1;
    v41.origin.CGFloat y = a2;
    v41.size.CGFloat width = a3;
    v41.size.CGFloat height = a4;
    *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v41, v30);
    goto LABEL_9;
  }
  if (a6 != 2)
  {
    if ((a6 & 0x80000000) != 0)
    {
      double v27 = *(double *)(MEMORY[0x263F001A0] + 16);
      double v29 = *(double *)(MEMORY[0x263F001A0] + 24);
    }
    else
    {
      CGAffineTransform v23 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, a6);
      objc_msgSend_CGRectValue(v23, v24, v25);
      double v27 = v26;
      double v29 = v28;
    }
    CGAffineTransform v31 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 2);
    objc_msgSend_CGRectValue(v31, v32, v33);
    double v35 = v34;
    double v37 = v36;

    CGAffineTransformMakeScale(&v39, v27 / v35, v29 / v37);
    CGAffineTransform v30 = &v39;
    goto LABEL_8;
  }
LABEL_9:

  return a1;
}

double sub_262E1549C(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_conformsToProtocol_(v1, v2, (uint64_t)&unk_270E2A1A0))
  {
    id v5 = v1;
    double v8 = (double)(unint64_t)objc_msgSend_width(v5, v6, v7);
    objc_msgSend_height(v5, v9, v10);
  }
  else
  {
    objc_msgSend_extent(v1, v3, v4);
    double v8 = v11;
  }

  return v8;
}

void sub_262E16854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
}

uint64_t sub_262E168B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_262E168C8(uint64_t a1)
{
}

id sub_262E168D0(void *a1)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) & 1) == 0;
  if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24)) {
    uint64_t v1 = a1[6];
  }
  else {
    uint64_t v1 = a1[5];
  }
  return *(id *)(*(void *)(v1 + 8) + 40);
}

id sub_262E16910(void *a1, double a2, double a3, float a4, float a5)
{
  v44[4] = *MEMORY[0x263EF8340];
  id v9 = a1;
  objc_msgSend_extent(v9, v10, v11);
  double v13 = a2 / v12;
  objc_msgSend_extent(v9, v14, v15);
  double v19 = a3 / v18;
  if (fabs(v13 + -1.0) >= 0.0001 || fabs(v19 + -1.0) >= 0.0001)
  {
    id v20 = objc_msgSend_imageByClampingToExtent(v9, v16, v17);

    v43[0] = @"inputScale";
    CGAffineTransform v23 = objc_msgSend_numberWithDouble_(NSNumber, v21, v22, v19);
    v44[0] = v23;
    v43[1] = @"inputAspectRatio";
    double v26 = objc_msgSend_numberWithDouble_(NSNumber, v24, v25, v13 / v19);
    v44[1] = v26;
    v43[2] = @"inputB";
    *(float *)&double v27 = a4;
    CGAffineTransform v30 = objc_msgSend_numberWithFloat_(NSNumber, v28, v29, v27);
    v44[2] = v30;
    v43[3] = @"inputC";
    *(float *)&double v31 = a5;
    double v34 = objc_msgSend_numberWithFloat_(NSNumber, v32, v33, v31);
    v44[3] = v34;
    double v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v44, v43, 4);
    v38 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v20, v37, @"CIBicubicScaleTransform", v36);

    objc_msgSend_imageByCroppingToRect_(v38, v39, v40, 0.0, 0.0, a2, a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      sub_262E491F0();
    }
  }
  id v41 = v9;

  return v41;
}

double sub_262E188D4(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_conformsToProtocol_(v1, v2, (uint64_t)&unk_270E2A1A0))
  {
    id v5 = v1;
    objc_msgSend_width(v5, v6, v7);
    objc_msgSend_height(v5, v8, v9);

    double v10 = 0.0;
  }
  else
  {
    objc_msgSend_extent(v1, v3, v4);
    double v10 = v11;
  }

  return v10;
}

void sub_262E19620()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  if (v2)
  {
    id v12 = v2;
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      double v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"sdof_max_nrings");
      if (v8)
      {
        double v11 = v8;
        dword_26A9974A8 = objc_msgSend_intValue(v8, v9, v10);
      }
    }

    v2 = v12;
  }
}

BOOL sub_262E196B8(const CGImageMetadata *a1, void *a2, _DWORD *a3)
{
  id v5 = a2;
  if (a3 && (*a3 = 0, (uint64_t v6 = sub_262E19744(a1, v5)) != 0))
  {
    uint64_t v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFStringGetTypeID();
    BOOL v12 = v9;
    if (v9) {
      *a3 = objc_msgSend_intValue(v7, v10, v11);
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

CGImageMetadataTag *sub_262E19744(const CGImageMetadata *a1, void *a2)
{
  CFStringRef v3 = a2;
  uint64_t v4 = (__CFString *)v3;
  id v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = CGImageMetadataCopyTagWithPath(a1, 0, v3);
    if (!v6)
    {
LABEL_7:
      id v5 = 0;
      goto LABEL_8;
    }
    uint64_t v7 = v6;
    CFTypeID v8 = (CGImageMetadataTag *)CGImageMetadataTagCopyValue(v6);
    if (!v8 || (v5 = v8, CFTypeID v9 = CFGetTypeID(v8), TypeID = CFStringGetTypeID(), CFRelease(v7), v7 = v5, v9 != TypeID))
    {
      CFRelease(v7);
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

BOOL sub_262E197E4(const CGImageMetadata *a1, void *a2, _DWORD *a3)
{
  id v5 = a2;
  if (a3 && (*a3 = 0, (uint64_t v6 = sub_262E19744(a1, v5)) != 0))
  {
    uint64_t v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFStringGetTypeID();
    BOOL v12 = v9;
    if (v9)
    {
      objc_msgSend_floatValue(v7, v10, v11);
      *a3 = v13;
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void sub_262E1B720()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  id v12 = v2;
  if (v2)
  {
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      CFTypeID v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"maxBlurmapSize");
      if (v8)
      {
        uint64_t v11 = v8;
        qword_26A9974B0 = objc_msgSend_unsignedLongValue(v8, v9, v10);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
}

double sub_262E1C380(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = objc_msgSend_objectAtIndexedSubscript_(a5, a2, 0);
  objc_msgSend_CGRectValue(v5, v6, v7);
  double v9 = v8;

  return v9;
}

double sub_262E1C3E8(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  if (a2)
  {
    if (!v11) {
      sub_262E49A88();
    }
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v13, @"inputParams");
    if (!v15) {
      sub_262E49AB4();
    }
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_length(v16, v17, v18) != 56)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        sub_262E49C34();
      }
    }
    if (objc_msgSend_count(v12, v19, v20) != 2) {
      sub_262E49C08();
    }
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v12, v21, 1);
    objc_msgSend_CGRectValue(v22, v23, v24);
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGAffineTransform v30 = objc_msgSend_objectForKeyedSubscript_(v16, v29, @"height");
      if (!v30) {
        sub_262E49AE0();
      }

      CGRect v32 = objc_msgSend_objectForKeyedSubscript_(v16, v31, @"width");
      if (!v32) {
        sub_262E49B0C();
      }

      double v34 = objc_msgSend_objectForKeyedSubscript_(v16, v33, @"left");
      if (!v34) {
        sub_262E49B38();
      }

      double v36 = objc_msgSend_objectForKeyedSubscript_(v16, v35, @"top");
      if (!v36) {
        sub_262E49B64();
      }

      v38 = objc_msgSend_objectForKeyedSubscript_(v16, v37, @"left");
      objc_msgSend_floatValue(v38, v39, v40);
      double v42 = v41;
      v44 = objc_msgSend_objectForKeyedSubscript_(v16, v43, @"top");
      objc_msgSend_floatValue(v44, v45, v46);
      double v48 = v47;
      CGFloat v50 = objc_msgSend_objectForKeyedSubscript_(v16, v49, @"width");
      objc_msgSend_floatValue(v50, v51, v52);
      double v54 = v53;
      CGAffineTransform v56 = objc_msgSend_objectForKeyedSubscript_(v16, v55, @"height");
      objc_msgSend_floatValue(v56, v57, v58);
      double v60 = v59;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v16, v64, v65) == 56)
      {
        uint64_t v83 = 0;
        memset(v82, 0, sizeof(v82));
        id v66 = v16;
        uint64_t v69 = objc_msgSend_length(v66, v67, v68);
        objc_msgSend_getBytes_range_(v66, v70, (uint64_t)v82, 0, v69);

        double v42 = *(float *)v82;
        double v48 = *((float *)v82 + 1);
        double v54 = *((float *)v82 + 2);
        double v60 = *((float *)v82 + 3);
      }
      else
      {
        v71 = uni_logger_api();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          sub_262E49B90(v71, v72, v73, v74, v75, v76, v77, v78);
        }

        double v54 = 0.100000001;
        double v42 = 0.449999988;
        double v48 = 0.449999988;
        double v60 = 0.100000001;
      }
    }
    CGAffineTransformMakeScale(&v81, v26, v28);
    v84.origin.double x = v42;
    v84.origin.CGFloat y = v48;
    v84.size.CGFloat width = v54;
    v84.size.CGFloat height = v60;
    CGRect v85 = CGRectApplyAffineTransform(v84, &v81);
    unint64_t v63 = (unint64_t)CGRectInset(v85, -1.0, -1.0);
  }
  else
  {
    v16 = objc_msgSend_objectAtIndexedSubscript_(v12, v13, 0);
    objc_msgSend_CGRectValue(v16, v61, v62);
  }
  double v79 = *(double *)&v63;

  return v79;
}

double sub_262E1C78C(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  if (a2)
  {
    if (!v11) {
      sub_262E49C60();
    }
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v13, @"inputParams");
    if (!v15) {
      sub_262E49C8C();
    }
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_length(v16, v17, v18) != 56)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        sub_262E49E0C();
      }
    }
    if (objc_msgSend_count(v12, v19, v20) != 2) {
      sub_262E49DE0();
    }
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v12, v21, 1);
    objc_msgSend_CGRectValue(v22, v23, v24);
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGAffineTransform v30 = objc_msgSend_objectForKeyedSubscript_(v16, v29, @"height");
      if (!v30) {
        sub_262E49CB8();
      }

      CGRect v32 = objc_msgSend_objectForKeyedSubscript_(v16, v31, @"width");
      if (!v32) {
        sub_262E49CE4();
      }

      double v34 = objc_msgSend_objectForKeyedSubscript_(v16, v33, @"left");
      if (!v34) {
        sub_262E49D10();
      }

      double v36 = objc_msgSend_objectForKeyedSubscript_(v16, v35, @"top");
      if (!v36) {
        sub_262E49D3C();
      }

      v38 = objc_msgSend_objectForKeyedSubscript_(v16, v37, @"left");
      objc_msgSend_floatValue(v38, v39, v40);
      double v42 = v41;
      v44 = objc_msgSend_objectForKeyedSubscript_(v16, v43, @"top");
      objc_msgSend_floatValue(v44, v45, v46);
      double v48 = v47;
      CGFloat v50 = objc_msgSend_objectForKeyedSubscript_(v16, v49, @"width");
      objc_msgSend_floatValue(v50, v51, v52);
      double v54 = v53;
      CGAffineTransform v56 = objc_msgSend_objectForKeyedSubscript_(v16, v55, @"height");
      objc_msgSend_floatValue(v56, v57, v58);
      double v60 = v59;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v16, v66, v67) == 56)
      {
        *(void *)&long long v108 = 0;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v105 = 0u;
        id v68 = v16;
        uint64_t v71 = objc_msgSend_length(v68, v69, v70);
        objc_msgSend_getBytes_range_(v68, v72, (uint64_t)&v105, 0, v71);

        double v42 = *(float *)&v105;
        double v48 = *((float *)&v105 + 1);
        double v54 = *((float *)&v105 + 2);
        double v60 = *((float *)&v105 + 3);
      }
      else
      {
        uint64_t v73 = uni_logger_api();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
          sub_262E49D68(v73, v74, v75, v76, v77, v78, v79, v80);
        }

        double v60 = 0.0;
        double v54 = 0.0;
        double v48 = 0.0;
        double v42 = 0.0;
      }
    }
    CGAffineTransform v81 = objc_msgSend_objectForKeyedSubscript_(v11, v61, @"inputEyes");
    if (v81)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v81, v82, v83) == 72)
      {
        double v102 = v28;
        double v103 = v26;
        id v84 = v81;
        uint64_t v109 = 0;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        uint64_t v87 = objc_msgSend_length(v84, v85, v86);
        objc_msgSend_getBytes_range_(v84, v88, (uint64_t)&v105, 0, v87);
        int v89 = v109;
        if ((int)v109 < 1)
        {
          double height = v60;
          double width = v54;
          double y = v48;
          double x = v42;
        }
        else
        {
          uint64_t v90 = 0;
          do
          {
            v91 = (int32x2_t *)&v105 + v90;
            float32x2_t v92 = (float32x2_t)*v91;
            float32x2_t v93 = (float32x2_t)v91[4];
            float32x2_t v94 = (float32x2_t)vzip2_s32((int32x2_t)v93, *v91);
            if (vcgt_f32(v93, (float32x2_t)*v91).u8[0]) {
              unsigned int v95 = -1;
            }
            else {
              unsigned int v95 = 0;
            }
            int8x8_t v96 = vbsl_s8((int8x8_t)vdup_n_s32(v95), (int8x8_t)v92, (int8x8_t)v93);
            double y = *(float *)&v96.i32[1];
            double x = *(float *)v96.i32;
            double width = fabsf(vsub_f32(v93, v92).f32[0]);
            double height = fabsf(vsub_f32(v94, (float32x2_t)vdup_lane_s32((int32x2_t)v94, 1)).f32[0]);
            if (v90)
            {
              v110.origin.double x = v42;
              v110.origin.double y = v48;
              v110.size.double width = v54;
              v110.size.double height = v60;
              v114.origin.double x = x;
              v114.origin.double y = y;
              v114.size.double width = width;
              v114.size.double height = height;
              CGRect v111 = CGRectUnion(v110, v114);
              double x = v111.origin.x;
              double y = v111.origin.y;
              double width = v111.size.width;
              double height = v111.size.height;
              int v89 = v109;
            }
            ++v90;
            double v42 = x;
            double v48 = y;
            double v54 = width;
            double v60 = height;
          }
          while (v90 < v89);
        }

        double v60 = height;
        double v54 = width;
        double v48 = y;
        double v42 = x;
        CGFloat v28 = v102;
        CGFloat v26 = v103;
      }
    }
    CGAffineTransformMakeScale(&v104, v26, v28);
    v112.origin.double x = v42;
    v112.origin.double y = v48;
    v112.size.double width = v54;
    v112.size.double height = v60;
    CGRect v113 = CGRectApplyAffineTransform(v112, &v104);
    *(void *)&double v65 = (unint64_t)CGRectInset(v113, -1.0, -1.0);
  }
  else
  {
    v16 = objc_msgSend_objectAtIndexedSubscript_(v12, v13, 0);
    objc_msgSend_CGRectValue(v16, v62, v63);
    double v65 = v64;
  }

  return v65;
}

double sub_262E1CCA8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v7 = a2;
  id v8 = a6;
  id v10 = objc_msgSend_objectAtIndexedSubscript_(a5, v9, v7);
  objc_msgSend_CGRectValue(v10, v11, v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  objc_msgSend_floatValue(v8, v21, v22);
  CGFloat v24 = (float)(1.0 / v23);
  objc_msgSend_floatValue(v8, v25, v26);
  float v28 = v27;

  CGAffineTransformMakeScale(&v31, v24, (float)(1.0 / v28));
  v32.origin.double x = v14;
  v32.origin.double y = v16;
  v32.size.double width = v18;
  v32.size.double height = v20;
  *(void *)&double v29 = (unint64_t)CGRectApplyAffineTransform(v32, &v31);

  return v29;
}

void sub_262E1CDC0()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  if (v2)
  {
    id v12 = v2;
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"fullRect");
      if (v8)
      {
        id v11 = v8;
        byte_26A9975E0 = objc_msgSend_BOOLValue(v8, v9, v10);
      }
    }

    v2 = v12;
  }
}

double sub_262E1CE58(double a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v12) {
    sub_262E49E38();
  }
  CGFloat v16 = v14;
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v12, v15, @"faceParams");
  if (!v17) {
    sub_262E49E64();
  }
  CGFloat v18 = (void *)v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_262E49EBC();
  }
  memset(v69, 0, sizeof(v69));
  if (byte_26A9975E0)
  {
    id v21 = objc_msgSend_objectAtIndexedSubscript_(v13, v19, a3);
    objc_msgSend_CGRectValue(v21, v22, v23);
    double v25 = v24;
  }
  else
  {
    if (objc_msgSend_length(v18, v19, v20) != 192) {
      sub_262E49E90();
    }
    objc_msgSend_getBytes_length_(v18, v26, (uint64_t)v69, 192);
    double x = *MEMORY[0x263F001A0];
    CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
    CGRect v32 = objc_msgSend_objectAtIndexedSubscript_(v13, v31, 0);
    objc_msgSend_CGRectValue(v32, v33, v34);
    float v36 = v35;
    float v66 = v36;

    v38 = objc_msgSend_objectAtIndexedSubscript_(v13, v37, 0);
    objc_msgSend_CGRectValue(v38, v39, v40);
    float v42 = v41;
    float v65 = v42;

    uint64_t v43 = 0;
    uint64_t v44 = 0;
    float v45 = 1.0;
    do
    {
      float v46 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x40);
      float v47 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x50);
      float v48 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x60);
      float v49 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x10);
      float v50 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x20);
      float v67 = v49;
      float v68 = v50;
      if (v46 <= v45)
      {
        float v51 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x30);
        BOOL v52 = v51 < 0.0 || v51 > v45;
        if (!v52 && v46 >= 0.0)
        {
          CGFloat v53 = x;
          CGFloat v54 = y;
          CGFloat v63 = width;
          CGFloat v64 = height;
          v70.origin.double x = (float)(v51 * v66);
          v70.origin.CGFloat y = (float)(v46 * v65);
          v70.size.CGFloat width = 0.0;
          v70.size.CGFloat height = 0.0;
          CGRect v71 = CGRectInset(v70, -0.5, -0.5);
          double x = v71.origin.x;
          CGFloat y = v71.origin.y;
          CGFloat width = v71.size.width;
          CGFloat height = v71.size.height;
          if (v43)
          {
            ++v43;
            v72.origin.double x = v53;
            v72.origin.CGFloat y = v54;
            v72.size.CGFloat width = v63;
            v72.size.CGFloat height = v64;
            v82.origin.double x = x;
            v82.origin.CGFloat y = y;
            v82.size.CGFloat width = width;
            v82.size.CGFloat height = height;
            CGRect v73 = CGRectUnion(v72, v82);
            double x = v73.origin.x;
            CGFloat y = v73.origin.y;
            CGFloat width = v73.size.width;
            CGFloat height = v73.size.height;
          }
          else
          {
            uint64_t v43 = 1;
          }
          float v45 = 1.0;
          float v49 = v67;
          float v50 = v68;
        }
      }
      if (v48 > v45 || (v47 >= 0.0 ? (BOOL v55 = v47 > v45) : (BOOL v55 = 1), v55 || v48 < 0.0))
      {
        CGFloat v59 = height;
        CGFloat v58 = width;
        CGFloat v57 = y;
        CGFloat v56 = x;
      }
      else
      {
        v74.origin.double x = (float)(v47 * v66);
        v74.origin.CGFloat y = (float)(v48 * v65);
        v74.size.CGFloat width = 0.0;
        v74.size.CGFloat height = 0.0;
        CGRect v75 = CGRectInset(v74, -0.5, -0.5);
        CGFloat v56 = v75.origin.x;
        CGFloat v57 = v75.origin.y;
        CGFloat v58 = v75.size.width;
        CGFloat v59 = v75.size.height;
        if (v43)
        {
          ++v43;
          v76.origin.double x = x;
          v76.origin.CGFloat y = y;
          v76.size.CGFloat width = width;
          v76.size.CGFloat height = height;
          v83.origin.double x = v56;
          v83.origin.CGFloat y = v57;
          v83.size.CGFloat width = v58;
          v83.size.CGFloat height = v59;
          CGRect v77 = CGRectUnion(v76, v83);
          CGFloat v56 = v77.origin.x;
          CGFloat v57 = v77.origin.y;
          CGFloat v58 = v77.size.width;
          CGFloat v59 = v77.size.height;
        }
        else
        {
          uint64_t v43 = 1;
        }
        float v45 = 1.0;
        float v49 = v67;
        float v50 = v68;
      }
      if (v50 > v45 || (v49 >= 0.0 ? (BOOL v60 = v49 > v45) : (BOOL v60 = 1), v60 || v50 < 0.0))
      {
        CGFloat height = v59;
        CGFloat width = v58;
        CGFloat y = v57;
        double x = v56;
      }
      else
      {
        v78.origin.double x = (float)(v49 * v66);
        v78.origin.CGFloat y = (float)(v50 * v65);
        v78.size.CGFloat width = 0.0;
        v78.size.CGFloat height = 0.0;
        CGRect v79 = CGRectInset(v78, -0.5, -0.5);
        double x = v79.origin.x;
        CGFloat y = v79.origin.y;
        CGFloat width = v79.size.width;
        CGFloat height = v79.size.height;
        if (v43)
        {
          ++v43;
          v80.origin.double x = v56;
          v80.origin.CGFloat y = v57;
          v80.size.CGFloat width = v58;
          v80.size.CGFloat height = v59;
          v84.origin.double x = x;
          v84.origin.CGFloat y = y;
          v84.size.CGFloat width = width;
          v84.size.CGFloat height = height;
          CGRect v81 = CGRectUnion(v80, v84);
          double x = v81.origin.x;
          CGFloat y = v81.origin.y;
          CGFloat width = v81.size.width;
          CGFloat height = v81.size.height;
        }
        else
        {
          uint64_t v43 = 1;
        }
        float v45 = 1.0;
      }
      ++v44;
    }
    while (v44 != 4);
    if (v43) {
      double v25 = x;
    }
    else {
      double v25 = a1;
    }
  }

  return v25;
}

CGFloat sub_262E1D2A4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8, void *a9)
{
  int v9 = (int)a6;
  if (a6 <= 1)
  {
    uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(a9, a6, a6);
    objc_msgSend_CGRectValue(v10, v11, v12);
LABEL_15:
    a1 = v13;
    goto LABEL_16;
  }
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"params");
  uint64_t v10 = (void *)v18;
  if ((v9 - 3) > 1) {
    goto LABEL_13;
  }
  if (!v18) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_length(v10, v19, v20) != 160) {
    goto LABEL_13;
  }
  uint64_t v23 = objc_msgSend_length(v10, v21, v22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0);
  objc_msgSend_getBytes_range_(v10, v24, (uint64_t)&v32, 0, v23);
  if (v9 == 3)
  {
    __asm { FCMP            H0, #0 }
    if (!(!_ZF & _CF)) {
      goto LABEL_12;
    }
  }
  if (v9 != 4) {
    goto LABEL_13;
  }
  __asm { FCMP            H0, #0 }
  if (!(!_ZF & _CF))
  {
LABEL_12:
    a1 = *MEMORY[0x263F001A8];
  }
  else
  {
LABEL_13:
    if (v9 == 3)
    {
      v33.origin.double x = a1;
      v33.origin.CGFloat y = a2;
      v33.size.CGFloat width = a3;
      v33.size.CGFloat height = a4;
      *(void *)&double v13 = (unint64_t)CGRectInset(v33, -3.0, -3.0);
      goto LABEL_15;
    }
  }
LABEL_16:

  return a1;
}

CGFloat sub_262E1D42C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, unsigned int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v22 = a10;
  if (a6 > 1)
  {
    if (a6 - 3 <= 1)
    {
      v28.origin.double x = a1;
      v28.origin.CGFloat y = a2;
      v28.size.CGFloat width = a3;
      v28.size.CGFloat height = a4;
      *(void *)&a1 = (unint64_t)CGRectInset(v28, -3.0, -3.0);
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, a6);
    objc_msgSend_CGRectValue(v23, v24, v25);
    a1 = v26;
  }
  return a1;
}

double sub_262E1D558(double a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v12) {
    sub_262E49EE8();
  }
  CGFloat v16 = v14;
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v12, v15, @"inputParams");
  if (!v17) {
    sub_262E49F14();
  }
  id v18 = (void *)v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_262E49F6C();
  }
  memset(v65, 0, sizeof(v65));
  if (byte_26A9975E0)
  {
    id v21 = objc_msgSend_objectAtIndexedSubscript_(v13, v19, a3);
    objc_msgSend_CGRectValue(v21, v22, v23);
    double v25 = v24;
  }
  else
  {
    if (objc_msgSend_length(v18, v19, v20) != 192) {
      sub_262E49F40();
    }
    objc_msgSend_getBytes_length_(v18, v26, (uint64_t)v65, 192);
    CGFloat v28 = *MEMORY[0x263F001A0];
    CGFloat v27 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v29 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v30 = *(double *)(MEMORY[0x263F001A0] + 24);
    long long v32 = objc_msgSend_objectAtIndexedSubscript_(v13, v31, 0);
    objc_msgSend_CGRectValue(v32, v33, v34);
    float v36 = v35;
    float v64 = v36;

    v38 = objc_msgSend_objectAtIndexedSubscript_(v13, v37, 0);
    objc_msgSend_CGRectValue(v38, v39, v40);
    float v42 = v41;
    float v63 = v42;

    CGFloat v43 = v30;
    CGFloat v44 = v29;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    float v47 = 1.0;
    do
    {
      float v48 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x40);
      float v49 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x50);
      float v50 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x60);
      if (v48 > v47
        || ((float v51 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x30), v51 >= 0.0)
          ? (BOOL v52 = v51 > v47)
          : (BOOL v52 = 1),
            v52 || v48 < 0.0))
      {
        CGFloat height = v43;
        CGFloat width = v44;
        CGFloat y = v27;
        CGFloat x = v28;
      }
      else
      {
        CGFloat v61 = v43;
        CGFloat v62 = v44;
        v66.origin.CGFloat x = (float)(v51 * v64);
        v66.origin.CGFloat y = (float)(v48 * v63);
        v66.size.CGFloat width = 0.0;
        v66.size.CGFloat height = 0.0;
        CGRect v67 = CGRectInset(v66, -0.5, -0.5);
        CGFloat x = v67.origin.x;
        CGFloat y = v67.origin.y;
        CGFloat width = v67.size.width;
        CGFloat height = v67.size.height;
        if (v45)
        {
          ++v45;
          v68.origin.CGFloat x = v28;
          v68.origin.CGFloat y = v27;
          v68.size.CGFloat height = v61;
          v68.size.CGFloat width = v62;
          v75.origin.CGFloat x = x;
          v75.origin.CGFloat y = y;
          v75.size.CGFloat width = width;
          v75.size.CGFloat height = height;
          CGRect v69 = CGRectUnion(v68, v75);
          CGFloat x = v69.origin.x;
          CGFloat y = v69.origin.y;
          CGFloat width = v69.size.width;
          CGFloat height = v69.size.height;
        }
        else
        {
          uint64_t v45 = 1;
        }
        float v47 = 1.0;
      }
      if (v50 > v47 || (v49 >= 0.0 ? (BOOL v57 = v49 > v47) : (BOOL v57 = 1), v57 || v50 < 0.0))
      {
        CGFloat v43 = height;
        CGFloat v44 = width;
        CGFloat v27 = y;
        CGFloat v28 = x;
      }
      else
      {
        v70.origin.CGFloat x = (float)(v49 * v64);
        v70.origin.CGFloat y = (float)(v50 * v63);
        v70.size.CGFloat width = 0.0;
        v70.size.CGFloat height = 0.0;
        CGRect v71 = CGRectInset(v70, -0.5, -0.5);
        CGFloat v28 = v71.origin.x;
        CGFloat v27 = v71.origin.y;
        CGFloat v44 = v71.size.width;
        CGFloat v43 = v71.size.height;
        if (v45)
        {
          ++v45;
          v72.origin.CGFloat x = x;
          v72.origin.CGFloat y = y;
          v72.size.CGFloat width = width;
          v72.size.CGFloat height = height;
          v76.origin.CGFloat x = v28;
          v76.origin.CGFloat y = v27;
          v76.size.CGFloat width = v44;
          v76.size.CGFloat height = v43;
          CGRect v73 = CGRectUnion(v72, v76);
          CGFloat v28 = v73.origin.x;
          CGFloat v27 = v73.origin.y;
          CGFloat v44 = v73.size.width;
          CGFloat v43 = v73.size.height;
        }
        else
        {
          uint64_t v45 = 1;
        }
        float v47 = 1.0;
      }
      ++v46;
    }
    while (v46 != 4);
    v74.origin.CGFloat x = v28;
    v74.origin.CGFloat y = v27;
    v74.size.CGFloat width = v44;
    v74.size.CGFloat height = v43;
    unint64_t v58 = (unint64_t)CGRectInset(v74, -1.0, -1.0);
    if (v45) {
      double v25 = *(double *)&v58;
    }
    else {
      double v25 = a1;
    }
  }

  return v25;
}

double sub_262E1D910(double a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (!a3)
  {
    uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(a6, a3, 0);
    objc_msgSend_CGRectValue(v7, v8, v9);
    a1 = v10;
  }
  return a1;
}

CGFloat sub_262E1D990(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  if (!a6)
  {
    CGAffineTransformMakeScale(&v11, 2.0, 2.0);
    v12.origin.CGFloat x = a1;
    v12.origin.CGFloat y = a2;
    v12.size.CGFloat width = a3;
    v12.size.CGFloat height = a4;
    *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v12, &v11);
  }
  return a1;
}

double sub_262E1DA18(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, (float)(v16 + -1.0) * -0.5, 0.0);
  return result;
}

double sub_262E1DAB8(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_262E1DB58(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, (float)(v16 + -1.0) * -0.5, 0.0);
  return result;
}

double sub_262E1DBF8(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_262E1DC98(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, (float)(v16 + -1.0) * -0.5, 0.0);
  return result;
}

double sub_262E1DD38(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_262E1DDD8(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  CGRect v12 = objc_msgSend_objectForKeyedSubscript_(a8, a6, @"windowSize");
  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  double v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v17, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_262E1DE78(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v12 = a8;
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"inputScaleX");
  float v16 = objc_msgSend_objectForKeyedSubscript_(v12, v15, @"inputScaleY");

  objc_msgSend_floatValue(v14, v17, v18);
  CGFloat v20 = 1.0 / v19;
  objc_msgSend_floatValue(v16, v21, v22);
  CGAffineTransformMakeScale(&v26, v20, 1.0 / v23);
  v27.origin.CGFloat x = a1;
  v27.origin.CGFloat y = a2;
  v27.size.CGFloat width = a3;
  v27.size.CGFloat height = a4;
  CGRect v28 = CGRectApplyAffineTransform(v27, &v26);
  *(void *)&double v24 = (unint64_t)CGRectInset(v28, -2.0, -2.0);

  return v24;
}

double sub_262E1DF80(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

id sub_262E1E0DC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v3, 125, a1, 1, 0);
    uint64_t v7 = v5;
    if (v5)
    {
      objc_msgSend_setUsage_(v5, v6, 19);
      double v10 = objc_msgSend_newTextureWithDescriptor_(v4, v8, (uint64_t)v7);
      if (v10)
      {
        CGAffineTransform v11 = objc_msgSend_imageWithMTLTexture_(UniImage, v9, (uint64_t)v10);
      }
      else
      {
        CGAffineTransform v11 = 0;
      }
    }
    else
    {
      CGAffineTransform v11 = 0;
    }
  }
  else
  {
    CGAffineTransform v11 = 0;
  }

  return v11;
}

double sub_262E1EE84(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v15 = a7;
  objc_msgSend_floatValue(a10, v16, v17);
  float v19 = v18;
  id v21 = objc_msgSend_objectForKeyedSubscript_(v15, v20, @"DisparityRefinement::kRadius");

  objc_msgSend_floatValue(v21, v22, v23);
  float v25 = v24;

  double v26 = a1;
  double v27 = a2;
  double v28 = a3;
  double v29 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v26, (float)-(float)(v19 * v25), 0.0);
  return result;
}

CGFloat sub_262E1EF38(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a6 == 1)
  {
    id v15 = a7;
    objc_msgSend_floatValue(a10, v16, v17);
    float v19 = v18;
    id v21 = objc_msgSend_objectForKeyedSubscript_(v15, v20, @"DisparityRefinement::kRadius");

    objc_msgSend_floatValue(v21, v22, v23);
    float v25 = v24;

    v27.origin.CGFloat x = a1;
    v27.origin.CGFloat y = a2;
    v27.size.CGFloat width = a3;
    v27.size.CGFloat height = a4;
    *(void *)&a1 = (unint64_t)CGRectInset(v27, 0.0, (float)-(float)(v19 * v25));
  }
  return a1;
}

CGFloat sub_262E1F008(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (!v20) {
    sub_262E4A2DC();
  }
  float v24 = v21;
  if (objc_msgSend_count(v20, v22, v23) != 3) {
    sub_262E4A380();
  }
  if (a6 != 2)
  {
    if (a6 == 1)
    {
      CGAffineTransformMakeScale(&v51, 2.0, 2.0);
      double v41 = &v51;
      goto LABEL_8;
    }
    if (!a6)
    {
      double v26 = objc_msgSend_objectAtIndexedSubscript_(v20, v25, 2);
      objc_msgSend_CGRectValue(v26, v27, v28);
      double v30 = v29;
      double v32 = v31;

      uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v20, v33, 0);
      objc_msgSend_CGRectValue(v34, v35, v36);
      double v38 = v37;
      double v40 = v39;

      CGAffineTransformMakeScale(&v52, v38 / v30, v40 / v32);
      double v41 = &v52;
LABEL_8:
      v53.origin.CGFloat x = a1;
      v53.origin.CGFloat y = a2;
      v53.size.CGFloat width = a3;
      v53.size.CGFloat height = a4;
      *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v53, v41);
      goto LABEL_12;
    }
    float v42 = uni_logger_api();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_262E4A308(v42, v43, v44, v45, v46, v47, v48, v49);
    }
  }
LABEL_12:

  return a1;
}

double sub_262E1F1B0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (!v19) {
    sub_262E4A3AC();
  }
  uint64_t v23 = v21;
  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v19, v22, @"outputDimension");
  if (!v24) {
    sub_262E4A3D8();
  }
  float v25 = (void *)v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_262E4A4A8();
  }
  if (!v20 || objc_msgSend_count(v20, v26, v27) != 2) {
    sub_262E4A404();
  }
  int v91 = 0;
  objc_msgSend_getBytes_length_(v25, v28, (uint64_t)&v91, 4);
  double v30 = objc_msgSend_objectForKeyedSubscript_(v18, v29, @"DisparityRefinement::kRadius");
  objc_msgSend_floatValue(v30, v31, v32);
  float v34 = v33;

  uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v18, v35, @"DisparityRefinement::kOuterSamplingRadius_ushort");
  _H0 = objc_msgSend_unsignedShortValue(v36, v37, v38);
  __asm { FCVT            S8, H0 }

  LOWORD(v45) = v91;
  float v46 = v34 * (float)v45;
  uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(v20, v47, 1);
  objc_msgSend_CGRectValue(v48, v49, v50);
  float v52 = v51;
  float v53 = v46 / v52;

  float v55 = v53 * _S8;
  if (a6 == 1)
  {
    CGFloat v62 = objc_msgSend_objectAtIndexedSubscript_(v20, v54, 0);
    objc_msgSend_CGRectValue(v62, v63, v64);
    double v66 = v65;
    CGFloat rect = a4;
    double v68 = v67;

    CGRect v70 = objc_msgSend_objectAtIndexedSubscript_(v20, v69, 1);
    objc_msgSend_CGRectValue(v70, v71, v72);
    double v74 = v73;
    double v76 = v75;

    CGFloat v77 = v74 / v66;
    CGFloat v78 = v76 / v68;
    CGAffineTransformMakeScale(&v90, v77, v78);
    v92.origin.CGFloat x = a1;
    v92.origin.CGFloat y = a2;
    v92.size.CGFloat width = a3;
    v92.size.CGFloat height = rect;
    CGRect v93 = CGRectApplyAffineTransform(v92, &v90);
    *(CGRect *)&CGFloat v57 = CGRectInset(v93, v77 * (float)-v55, v78 * (float)-v55);
    double v56 = -2.5;
    double v61 = -2.5;
    goto LABEL_10;
  }
  if (!a6)
  {
    double v56 = (float)-v55;
    CGFloat v57 = a1;
    CGFloat v58 = a2;
    CGFloat v59 = a3;
    double v60 = a4;
    double v61 = v56;
LABEL_10:
    *(void *)&double v79 = (unint64_t)CGRectInset(*(CGRect *)&v57, v56, v61);
    goto LABEL_14;
  }
  CGRect v80 = uni_logger_api();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
    sub_262E4A430(v80, v81, v82, v83, v84, v85, v86, v87);
  }

  double v79 = *MEMORY[0x263F001A0];
LABEL_14:

  return v79;
}

CGFloat sub_262E1F478(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v22 = a10;
  if (a6)
  {
    if ((a6 & 0xFFFFFFFD) == 1)
    {
      v28.origin.CGFloat x = a1;
      v28.origin.CGFloat y = a2;
      v28.size.CGFloat width = a3;
      v28.size.CGFloat height = a4;
      *(void *)&a1 = (unint64_t)CGRectInset(v28, -2.0, -2.0);
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0);
    objc_msgSend_CGRectValue(v23, v24, v25);
    a1 = v26;
  }
  return a1;
}

double sub_262E1F580(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v22 = a10;
  if (a6 == 1)
  {
    CGRect v28 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 1);
    objc_msgSend_CGRectValue(v28, v29, v30);
    double v32 = v31;
    float v34 = objc_msgSend_objectAtIndexedSubscript_(v20, v33, 2);
    objc_msgSend_CGRectValue(v34, v35, v36);
    CGFloat v38 = v32 / v37;

    double v40 = objc_msgSend_objectAtIndexedSubscript_(v20, v39, 1);
    objc_msgSend_CGRectValue(v40, v41, v42);
    double v44 = v43;
    float v46 = objc_msgSend_objectAtIndexedSubscript_(v20, v45, 2);
    objc_msgSend_CGRectValue(v46, v47, v48);
    CGFloat v50 = v44 / v49;

    CGAffineTransformMakeScale(&v54, v38, v50);
    v55.origin.CGFloat x = a1;
    v55.origin.CGFloat y = a2;
    v55.size.CGFloat width = a3;
    v55.size.CGFloat height = a4;
    CGRect v56 = CGRectApplyAffineTransform(v55, &v54);
    CGFloat v51 = -2.0;
    CGFloat v52 = -2.0;
LABEL_7:
    *(void *)&double v27 = (unint64_t)CGRectInset(v56, v51, v52);
    goto LABEL_8;
  }
  if (a6)
  {
    if ((a6 & 0xFFFFFFFE) != 2) {
      abort();
    }
    CGFloat v51 = -2.0;
    CGFloat v52 = -2.0;
    v56.origin.CGFloat x = a1;
    v56.origin.CGFloat y = a2;
    v56.size.CGFloat width = a3;
    v56.size.CGFloat height = a4;
    goto LABEL_7;
  }
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0);
  objc_msgSend_CGRectValue(v23, v24, v25);
  double v27 = v26;

LABEL_8:
  return v27;
}

double sub_262E1F758(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -5.0, -1.0);
  return result;
}

double sub_262E1F764(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -5.0);
  return result;
}

double sub_262E1F770(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_msgSend_floatValue(a10, a6, a7);
  double v15 = (float)-ceilf(v14 * 4.0);
  double v16 = a1;
  double v17 = a2;
  double v18 = a3;
  double v19 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v16, v15, 0.0);
  return result;
}

double sub_262E1F7E4(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_msgSend_floatValue(a10, a6, a7);
  double v15 = (float)-ceilf(v14 * 4.0);
  double v16 = a1;
  double v17 = a2;
  double v18 = a3;
  double v19 = a4;

  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v16, 0.0, v15);
  return result;
}

void sub_262E2160C()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  if (v2)
  {
    id v12 = v2;
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"useEyeSLM");
      if (v8)
      {
        CGAffineTransform v11 = v8;
        byte_26A9975E8 = 1;
        byte_26A9975E9 = objc_msgSend_BOOLValue(v8, v9, v10);
      }
    }

    v2 = v12;
  }
}

void sub_262E23C90()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  if (v2)
  {
    id v12 = v2;
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"useGlasses");
      if (v8)
      {
        CGAffineTransform v11 = v8;
        byte_26A9974B8 = objc_msgSend_BOOLValue(v8, v9, v10);
      }
    }

    v2 = v12;
  }
}

void sub_262E25F3C()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  if (v2)
  {
    id v12 = v2;
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"crispHair");
      if (v8)
      {
        CGAffineTransform v11 = v8;
        byte_26A9975F0 = 1;
        byte_26A9975F1 = objc_msgSend_BOOLValue(v8, v9, v10);
      }
    }

    v2 = v12;
  }
}

void sub_262E25FE0()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v2 = objc_msgSend_initWithSuiteName_(v0, v1, @"com.apple.coremedia");
  if (v2)
  {
    id v14 = v2;
    id v5 = objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    uint64_t v7 = v5;
    if (v5)
    {
      id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"doHairnet");
      char isEqual = objc_msgSend_isEqual_(v8, v9, MEMORY[0x263EFFA88]);
    }
    else
    {
      id v8 = 0;
      char isEqual = objc_msgSend_isEqual_(0, v6, MEMORY[0x263EFFA88]);
    }
    if ((isEqual & 1) != 0
      || (objc_msgSend_isEqual_(v8, v11, (uint64_t)&unk_270E1E6A8) & 1) != 0
      || objc_msgSend_isEqual_(v8, v11, @"1"))
    {
      byte_26A9975F8 = 121;
    }
    if ((objc_msgSend_isEqual_(v8, v11, MEMORY[0x263EFFA80]) & 1) != 0
      || (objc_msgSend_isEqual_(v8, v12, (uint64_t)&unk_270E1E678) & 1) != 0
      || objc_msgSend_isEqual_(v8, v13, @"0"))
    {
      byte_26A9975F8 = 110;
    }

    v2 = v14;
  }
}

void sub_262E267A8(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  CFStringRef v3 = objc_msgSend_sortedArrayUsingComparator_(a2, (const char *)a2, (uint64_t)&unk_270E12D78);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v35, v39, 16);
  if (!v5)
  {
    int v34 = 0;
LABEL_13:
    memset_pattern16((void *)(a1 + 64 * v34), &unk_262E516B0, ((unint64_t)(3 - v34) << 6) + 64);
    goto LABEL_14;
  }
  uint64_t v8 = v5;
  int v9 = 0;
  uint64_t v10 = *(void *)v36;
  do
  {
    uint64_t v11 = 0;
    int v12 = v9;
    uint64_t v13 = v9;
    int v14 = 4 * v9;
    do
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(v3);
      }
      if (v13 + v11 <= 3)
      {
        double v15 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        double v16 = (void *)(a1 + 16 * v14);
        objc_msgSend_centerPos(v15, v6, v7);
        void *v16 = v17;
        v16[1] = v18;
        double v19 = (void *)(a1 + 16 * (v14 + 1));
        objc_msgSend_leftEyeCenterPos(v15, v20, v21);
        void *v19 = v22;
        v19[1] = v23;
        uint64_t v24 = (void *)(a1 + 16 * (v14 + 2));
        objc_msgSend_rightEyeCenterPos(v15, v25, v26);
        void *v24 = v27;
        v24[1] = v28;
        double v29 = (void *)(a1 + 16 * (v14 + 3));
        objc_msgSend_chinCenterPos(v15, v30, v31);
        void *v29 = v32;
        v29[1] = v33;
      }
      ++v11;
      v14 += 4;
    }
    while (v8 != v11);
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v35, v39, 16);
    int v9 = v13 + v11;
  }
  while (v8);
  int v34 = v12 + v11;
  if (v12 + (int)v11 <= 3) {
    goto LABEL_13;
  }
LABEL_14:
}

BOOL sub_262E273C0(uint64_t a1, char a2)
{
  return *(float *)(a1 + 4 * (a2 & 3) + 48) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 64) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 80) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 96) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 16) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 32) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 112) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 128) != -1.0;
}

uint64_t sub_262E27488(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_msgSend_leftEyeCenterPos(v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  objc_msgSend_rightEyeCenterPos(v5, v12, v13);
  double v15 = v14;
  double v17 = v16;

  objc_msgSend_leftEyeCenterPos(v4, v18, v19);
  double v21 = v20;
  double v23 = v22;
  objc_msgSend_rightEyeCenterPos(v4, v24, v25);
  double v27 = v26;
  double v29 = v28;

  double v30 = (v9 - v15) * (v9 - v15) + (v11 - v17) * (v11 - v17);
  double v31 = (v21 - v27) * (v21 - v27) + (v23 - v29) * (v23 - v29);
  if (v30 > v31) {
    return -1;
  }
  else {
    return v30 < v31;
  }
}

void sub_262E27550(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_262E28CA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_262E28CDC(void *a1)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F00650];
  id v2 = a1;
  id v5 = objc_msgSend_metalTexture(v2, v3, v4);
  uint64_t v6 = *MEMORY[0x263F008F0];
  v26[0] = *MEMORY[0x263F00900];
  v26[1] = v6;
  v27[0] = MEMORY[0x263EFFA88];
  uint64_t v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v7, v8);
  v27[1] = v9;
  double v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v27, v26, 2);
  uint64_t v13 = objc_msgSend_imageWithMTLTexture_options_(v1, v12, (uint64_t)v5, v11);

  objc_msgSend_region(v2, v14, v15);
  CGFloat v17 = v16;
  objc_msgSend_region(v2, v18, v19);
  CGFloat v21 = v20;

  CGAffineTransformMakeTranslation(&v25, v17, v21);
  double v23 = objc_msgSend_imageByApplyingTransform_(v13, v22, (uint64_t)&v25);

  return v23;
}

CFTypeRef sub_262E28E3C(size_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = 0;
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F04130];
  uint64_t v8 = *MEMORY[0x263F04180];
  char v9 = 1;
  do
  {
    char v10 = v9;
    double v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, 1278226536, 0, v7, v8, MEMORY[0x263EFFA78]);
    v18[1] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v18, &v17, 2);
    CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferCreate(0, a1, (size_t)a2, 0x4C303068u, v13, &v16);
    CVPixelBufferRef v14 = v16;

    *(void *)(a3 + 8 * v6) = v14;
    CFTypeRef result = CFAutorelease(v14);
    char v9 = 0;
    uint64_t v6 = 1;
  }
  while ((v10 & 1) != 0);
  return result;
}

id sub_262E28F74(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a2 + 8 * v5));
    id v9 = v3;
    if (IOSurfaceGetPixelFormat(IOSurface) != 1278226536) {
      sub_262E4AFB0();
    }
    char v10 = (void *)MEMORY[0x263F12A50];
    size_t Width = IOSurfaceGetWidth(IOSurface);
    size_t Height = IOSurfaceGetHeight(IOSurface);
    CVPixelBufferRef v14 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v10, v13, 25, Width, Height, 0);
    uint64_t v17 = objc_msgSend_usage(v14, v15, v16);
    objc_msgSend_setUsage_(v14, v18, v17 | 3);
    double v20 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v9, v19, (uint64_t)v14, IOSurface, 0);

    objc_msgSend_addObject_(v4, v21, (uint64_t)v20);
    char v6 = 0;
    uint64_t v5 = 1;
  }
  while ((v7 & 1) != 0);

  return v4;
}

id sub_262E290A8(void *a1, const char *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  double v11 = objc_msgSend_imageByClampingToExtent(a1, a2, a3);
  CGAffineTransformMakeTranslation(&v18, -a4, -a5);
  CFDictionaryRef v13 = objc_msgSend_imageByApplyingTransform_(v11, v12, (uint64_t)&v18);

  uint64_t v16 = objc_msgSend_imageByCroppingToRect_(v13, v14, v15, 0.0, 0.0, a6, a7);

  return v16;
}

id sub_262E29158(void *a1)
{
  v41[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v5 = objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v2, @"ccp_interleavedToPlanar");
  if (v1 && (objc_msgSend_extent(v1, v3, v4), !CGRectIsInfinite(v43)))
  {
    objc_msgSend_extent(v1, v6, v7);
    double v10 = v9;
    objc_msgSend_extent(v1, v11, v12);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGAffineTransformMakeScale(&v38, 1.0, 3.0);
    v44.origin.double x = v14;
    v44.origin.double y = v16;
    v44.size.double width = v18;
    v44.size.double height = v20;
    CGRect v45 = CGRectApplyAffineTransform(v44, &v38);
    double x = v45.origin.x;
    double y = v45.origin.y;
    double width = v45.size.width;
    double height = v45.size.height;
    v41[0] = v1;
    double v27 = objc_msgSend_numberWithDouble_(NSNumber, v25, v26, v10, MEMORY[0x263EF8330], 3221225472, sub_262E29F80, &unk_2655BCCC8, *(void *)&v10);
    v41[1] = v27;
    double v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v28, (uint64_t)v41, 2);
    uint64_t v39 = *MEMORY[0x263F009C8];
    double v31 = objc_msgSend_numberWithInt_(NSNumber, v30, *MEMORY[0x263F008D0]);
    uint64_t v40 = v31;
    uint64_t v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)&v40, &v39, 1);
    long long v35 = objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v5, v34, (uint64_t)&v37, v29, v33, x, y, width, height);

    id v1 = v35;
    uint64_t v8 = v1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_262E293B0(void *a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v3 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v2, @"to_range_m1_p1");
  objc_msgSend_extent(v1, v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v19[0] = v1;
  double v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v19, 1);

  double v17 = objc_msgSend_applyWithExtent_arguments_(v3, v16, (uint64_t)v15, v7, v9, v11, v13);

  return v17;
}

void sub_262E294BC(void *a1, void *a2, void *a3, void *a4)
{
  v33[3] = *MEMORY[0x263EF8340];
  id v7 = a1;
  v32[0] = @"inputRVector";
  double v8 = (void *)MEMORY[0x263F00680];
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  CGFloat v14 = objc_msgSend_vectorWithX_Y_Z_W_(v8, v12, v13, 1.0, 0.0, 0.0, 0.0);
  v33[0] = v14;
  v32[1] = @"inputGVector";
  double v17 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x263F00680], v15, v16, 1.0, 0.0, 0.0, 0.0);
  v33[1] = v17;
  v32[2] = @"inputBVector";
  CGFloat v20 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x263F00680], v18, v19, 1.0, 0.0, 0.0, 0.0);
  v33[2] = v20;
  double v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v33, v32, 3);
  uint64_t v24 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v11, v23, @"CIColorMatrix", v22);

  id v25 = objc_alloc(MEMORY[0x263F00670]);
  double v27 = objc_msgSend_initWithMTLTexture_commandBuffer_(v25, v26, (uint64_t)v10, v9);

  objc_msgSend_setFlipped_(v27, v28, 1);
  objc_msgSend_setColorSpace_(v27, v29, 0);
  id v31 = (id)objc_msgSend_startTaskToRender_toDestination_error_(v7, v30, (uint64_t)v24, v27, 0);
}

void sub_262E296A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = uni_logger_api();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_262E4AFDC(v4);
  }

  SEL v5 = NSSelectorFromString(&cfstr_Seterror.isa);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_performSelector_withObject_(*(void **)(a1 + 32), v6, (uint64_t)v5, v3);
  }
}

void sub_262E29730(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_internalCommandQueue(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_commandBuffer(v4, v5, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_commit(v13, v7, v8);
  objc_msgSend_waitUntilCompleted(v13, v9, v10);
  objc_msgSend_clearCaches(*(void **)(a1 + 32), v11, v12);
}

id ApplyHairnetProcessor(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  v41[1] = *MEMORY[0x263EF8340];
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v19 = a7;
  if (v13 && v14 && v16 && v17)
  {
    LODWORD(v20) = *(_DWORD *)(a6 + 56);
    LODWORD(v21) = *(_DWORD *)(a6 + 60);
    uint64_t v22 = objc_msgSend_apply_sdof_mask_alpha_chromaWeight_chromaBlurSigma_model_(ApplyHairnetModel, v18, (uint64_t)v13, v15, v16, v14, v17, v20, v21);
    if (!v22) {
      sub_262E4B0E4();
    }
    uint64_t v24 = (void *)v22;
    id v25 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v23, @"divide_alpha");
    objc_msgSend_extent(v24, v26, v27);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v41[0] = v24;
    uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, (uint64_t)v41, 1);
    objc_msgSend_applyWithExtent_arguments_(v25, v38, (uint64_t)v37, v29, v31, v33, v35);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v39 = v15;
  }

  return v39;
}

void sub_262E29F98(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_262E2C5C0(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, _DWORD *a4)
{
  unint64_t v4 = ((unint64_t)*(unsigned int *)(a1 + 8) + 0x7FFFFFFF0) >> 3;
  if ((v4 & 0x80000000) == 0) {
    int v5 = ((unint64_t)*(unsigned int *)(a1 + 8) + 0x7FFFFFFF0) >> 3;
  }
  else {
    int v5 = v4 + 1;
  }
  int v6 = v5 >> 1;
  int v7 = *(unsigned __int16 *)(a1 + 8 * (v5 >> 1) + 16);
  BOOL v8 = v7 != a2;
  if (v7 != a2 && (int)v4 >= 2)
  {
    int v10 = 0;
    int v11 = v4 - 1;
    do
    {
      if ((__int16)v7 <= (__int16)a2)
      {
        if ((__int16)v7 < (__int16)a2)
        {
          int v10 = v6 + 1;
          int v12 = v11 + v6 + 1;
          if (v12 + 1 >= 0) {
            int v13 = v12 + 1;
          }
          else {
            int v13 = v12 + 2;
          }
          int v6 = v13 >> 1;
          if (*(__int16 *)(a1 + 8 * v6 + 16) <= (__int16)v7) {
            return 4294867295;
          }
          int v7 = *(unsigned __int16 *)(a1 + 8 * v6 + 16);
        }
      }
      else
      {
        if (*(__int16 *)(a1 + 8 * ((v6 + v10) / 2) + 16) >= (__int16)v7) {
          return 4294867295;
        }
        int v11 = v6 - 1;
        int v7 = *(unsigned __int16 *)(a1 + 8 * ((v6 + v10) / 2) + 16);
        int v6 = (v6 + v10) / 2;
      }
      BOOL v8 = v7 != a2;
    }
    while (v7 != a2 && v10 < v11);
  }
  uint64_t v14 = 4294867292;
  if (v8) {
    return 4294867294;
  }
  if (*(__int16 *)(a1 + 8 * v6 + 18) != a3) {
    return 4294867293;
  }
  if (a3 - 1 <= 1)
  {
    uint64_t v14 = 0;
    *a4 = *(_DWORD *)(a1 + 8 * v6 + 20);
  }
  return v14;
}

void sub_262E2C6EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id createInpaintingMask(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, float *a7)
{
  v361[2] = *MEMORY[0x263EF8340];
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v329 = v13;
  objc_msgSend_extent(v13, v19, v20);
  double v22 = v21;
  double v24 = v23;
  id v25 = v18;
  uint64_t v27 = v25;
  v343 = v17;
  v344 = a7;
  if (v25)
  {
    double v28 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"lEye");
    double v30 = objc_msgSend_objectForKeyedSubscript_(v27, v29, @"rEye");
    double v32 = objc_msgSend_objectForKeyedSubscript_(v27, v31, @"chin");
    unint64_t v35 = objc_msgSend_count(v28, v33, v34);
    float v37 = 1.0;
    if (v35 >= 2)
    {
      uint64_t v38 = 0;
      float v39 = v24;
      float v40 = v22;
      unint64_t v41 = v35 >> 1;
      float v37 = 0.0;
      float v354 = v39 / v40;
      do
      {
        objc_msgSend_valueAtIndex_(v28, v36, v38);
        float v43 = v42;
        objc_msgSend_valueAtIndex_(v28, v44, v38 + 1);
        *(float *)&double v45 = v45;
        float v46 = v354 * *(float *)&v45;
        objc_msgSend_valueAtIndex_(v30, v47, v38);
        float v49 = v48;
        objc_msgSend_valueAtIndex_(v30, v50, v38 + 1);
        *(float *)&double v51 = v51;
        float v52 = v354 * *(float *)&v51;
        objc_msgSend_valueAtIndex_(v32, v53, v38);
        float v55 = v54;
        objc_msgSend_valueAtIndex_(v32, v56, v38 + 1);
        *(float *)&double v57 = v57;
        float v58 = v354 * *(float *)&v57;
        float v59 = hypotf(v43 - v49, v46 - v52);
        float v60 = v37;
        float v61 = v59 + v59;
        float v62 = hypotf(v43 - v55, v46 - v58);
        float v37 = fmaxf(v60, fmaxf(fmaxf(v61, v62), hypotf(v49 - v55, v52 - v58)) * 4.0);
        v38 += 2;
        --v41;
      }
      while (v41);
    }

    id v17 = v343;
    a7 = v344;
  }
  else
  {
    float v37 = 1.0;
  }

  objc_msgSend_extent(v17, v63, v64);
  double v66 = v65;
  double v68 = v67;
  v336 = sub_262E2D7D0(v14, v65, v67);

  v328 = sub_262E2D7D0(v15, v66, v68);

  double v350 = v66;
  double v351 = v68;
  if (v16)
  {
    v327 = sub_262E2D7D0(v16, v66, v68);
  }
  else
  {
    CGRect v69 = uni_logger_api();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.a) = 136446210;
      *(void *)((char *)&buf.a + 4) = "createInpaintingMask";
      _os_log_impl(&dword_262E0F000, v69, OS_LOG_TYPE_INFO, "%{public}s Note: glasses matte is nil and will be treated as if it contains all zeros.", (uint8_t *)&buf, 0xCu);
    }

    v327 = 0;
  }
  CGRect v70 = sub_262E2D8E4(v17, a7[1]);
  objc_msgSend_extent(v17, v71, v72);
  double v74 = v73;
  double v76 = v75;
  float v77 = a7[11];
  float v345 = a7[12];
  id v78 = v27;
  CGRect v80 = v78;
  unint64_t v81 = 0x263EFF000;
  unint64_t v82 = 0x263EFF000;
  v330 = v78;
  v331 = v70;
  if (v27)
  {
    uint64_t v83 = objc_msgSend_objectForKeyedSubscript_(v78, v79, @"lEye");
    uint64_t v85 = objc_msgSend_objectForKeyedSubscript_(v80, v84, @"rEye");
    uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v80, v86, @"chin");
    v347 = (void *)v87;
    if (v77 <= 0.0)
    {
      uint64_t v27 = 0;
    }
    else
    {
      CGAffineTransform v90 = (void *)v87;
      float v91 = v74;
      float v337 = v91;
      float v92 = v76;
      float v339 = v92;
      CGRect v93 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v88, v89);
      unint64_t v96 = objc_msgSend_count(v83, v94, v95);
      v341 = v85;
      if (v96 >= 2)
      {
        float v334 = v77;
        uint64_t v100 = 0;
        unint64_t v101 = v96 >> 1;
        v333 = (void *)*MEMORY[0x263F009C8];
        unsigned int v332 = *MEMORY[0x263F008D0];
        BOOL v102 = v345 > 1.0;
        if (v345 < 0.001) {
          BOOL v102 = 1;
        }
        BOOL v355 = v102;
        v335 = v83;
        do
        {
          objc_msgSend_valueAtIndex_(v83, v97, v100);
          double v104 = v103;
          objc_msgSend_valueAtIndex_(v83, v105, v100 + 1);
          double v107 = v106;
          objc_msgSend_valueAtIndex_(v85, v108, v100);
          double v110 = v109;
          objc_msgSend_valueAtIndex_(v85, v111, v100 + 1);
          double v113 = v112;
          objc_msgSend_valueAtIndex_(v90, v114, v100);
          double v116 = v115;
          objc_msgSend_valueAtIndex_(v90, v117, v100 + 1);
          double v119 = v118;
          uint64_t v121 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v120, @"ellipse");
          if (!v121) {
            sub_262E4BFE0();
          }
          v124 = (void *)v121;
          if (v355)
          {
            v125 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v122, v123);
          }
          else
          {
            float v126 = v104;
            float v127 = v107;
            float v128 = v110;
            float v129 = v113;
            float v130 = v116;
            float v131 = v37;
            float v132 = v337 * v130;
            float v133 = v119;
            float v134 = v339 * v133;
            float v135 = (float)(v132 + (float)((float)(v334 * (float)((float)(v337 * v126) - (float)(v337 * v128))) * 0.5))
                 - v132;
            float v136 = (float)(v134 + (float)((float)(v334 * (float)((float)(v339 * v127) - (float)(v339 * v129))) * 0.5))
                 - v134;
            float v137 = hypotf(v135, v136);
            double v138 = (float)(v132 - v137);
            double v139 = (float)(v134 - v137);
            double v140 = v137 + v137;
            float v141 = (float)(v135 * (float)(v345 * v137)) / v137;
            float v142 = (float)(v136 * (float)(v345 * v137)) / v137;
            v352 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v143, v144, (float)(v132 + v141), (float)(v134 + v142));
            float v145 = v132 - v141;
            float v37 = v131;
            v148 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v146, v147, v145, (float)(v134 - v142));
            *(void *)&buf.a = v352;
            *(void *)&buf.b = v148;
            v151 = objc_msgSend_numberWithDouble_(NSNumber, v149, v150, v140);
            *(void *)&buf.c = v151;
            v153 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v152, (uint64_t)&buf, 3);
            v360 = v333;
            v155 = objc_msgSend_numberWithInt_(NSNumber, v154, v332);
            v361[0] = v155;
            v157 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v156, (uint64_t)v361, &v360, 1);
            v125 = objc_msgSend_applyWithExtent_arguments_options_(v124, v158, (uint64_t)v153, v157, v138, v139, v140, v140);

            CGAffineTransform v90 = v347;
            uint64_t v83 = v335;

            uint64_t v85 = v341;
          }

          v99 = sub_262E2DA9C(v93, v125);

          v100 += 2;
          CGRect v93 = v99;
          --v101;
        }
        while (v101);
      }
      else
      {
        v99 = v93;
      }
      v159 = objc_msgSend_blackImage(MEMORY[0x263F00650], v97, v98);
      v161 = objc_msgSend_imageByCompositingOverImage_(v99, v160, (uint64_t)v159);

      uint64_t v27 = objc_msgSend_imageByCroppingToRect_(v161, v162, v163, 0.0, 0.0, v337, v339);

      uint64_t v85 = v341;
      a7 = v344;
      CGRect v80 = v330;
      CGRect v70 = v331;
      unint64_t v82 = 0x263EFF000uLL;
      unint64_t v81 = 0x263EFF000uLL;
    }
  }
  v164 = sub_262E2DA9C(v328, v27);

  uint64_t v165 = sub_262E2DCB8(v164, v70);

  id v166 = v329;
  if (!v166) {
    sub_262E4BEAC();
  }
  v168 = v166;
  uint64_t v169 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v167, @"makeGrey");
  if (!v169) {
    sub_262E4BED8();
  }
  v172 = (void *)v169;
  v340 = (void *)v165;
  v342 = v27;
  objc_msgSend_extent(v168, v170, v171);
  double v174 = v173;
  double v176 = v175;
  double v178 = v177;
  double v180 = v179;
  *(void *)&buf.a = v168;
  v182 = objc_msgSend_arrayWithObjects_count_(*(void **)(v81 + 2240), v181, (uint64_t)&buf, 1);
  v353 = (void *)*MEMORY[0x263F009C8];
  v360 = (void *)*MEMORY[0x263F009C8];
  unsigned int v356 = *MEMORY[0x263F008D0];
  v184 = objc_msgSend_numberWithInt_(NSNumber, v183, *MEMORY[0x263F008D0]);
  v361[0] = v184;
  v186 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v82 + 2352), v185, (uint64_t)v361, &v360, 1);
  v188 = objc_msgSend_applyWithExtent_arguments_options_(v172, v187, (uint64_t)v182, v186, v174, v176, v178, v180);

  id v189 = v188;
  if (!v189) {
    sub_262E4BF04();
  }
  v191 = v189;
  uint64_t v192 = objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v190, @"sobelGrey");
  if (!v192) {
    sub_262E4BF30();
  }
  v195 = (void *)v192;
  double v348 = fmax(v350, v351);
  objc_msgSend_extent(v191, v193, v194);
  double v197 = v196;
  double v346 = v198;
  double v200 = v199;
  double v202 = v201;
  objc_msgSend_extent(v191, v203, v204);
  CGRect v364 = CGRectInset(v363, -1.0, -1.0);
  double x = v364.origin.x;
  double y = v364.origin.y;
  double width = v364.size.width;
  double height = v364.size.height;
  *(void *)&buf.a = v191;
  v210 = objc_msgSend_arrayWithObjects_count_(*(void **)(v81 + 2240), v209, (uint64_t)&buf, 1);
  v360 = v353;
  v212 = objc_msgSend_numberWithInt_(NSNumber, v211, v356);
  v361[0] = v212;
  v214 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v82 + 2352), v213, (uint64_t)v361, &v360, 1);
  v216 = objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v195, v215, (uint64_t)&unk_270E12D98, v210, v214, x, y, width, height);

  v365.origin.double x = v197;
  v365.origin.double y = v346;
  v365.size.double width = v200;
  v365.size.double height = v202;
  if (!CGRectIsInfinite(v365))
  {
    uint64_t v219 = objc_msgSend_imageByCroppingToRect_(v216, v217, v218, v197, v346, v200, v202);

    v216 = (void *)v219;
  }
  float v220 = v348;

  id v221 = v216;
  objc_msgSend_extent(v221, v222, v223);
  double v225 = v350 / v224;
  objc_msgSend_extent(v221, v226, v227);
  double v230 = v351 / v229;
  v338 = v168;
  if (fabs(v225 + -1.0) >= 0.0001 || fabs(v230 + -1.0) >= 0.0001)
  {
    double v233 = fmax(v225, v230);
    if (v233 <= 1.0)
    {
      int v234 = 0;
      while (v233 <= 0.5)
      {
        double v233 = v233 + v233;
        double v225 = v225 + v225;
        double v230 = v230 + v230;
        ++v234;
      }
      float v349 = v348;
      v235 = objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v228, @"downByTwoRMax");
      objc_msgSend_setCanReduceOutputChannels_(v235, v236, 1);
      objc_msgSend_setPreservesRange_(v235, v237, 1);
      v240 = objc_msgSend_imageByClampingToExtent(v221, v238, v239);

      if (v234)
      {
        double v243 = *MEMORY[0x263F00190];
        double v244 = *(double *)(MEMORY[0x263F00190] + 8);
        double v245 = *(double *)(MEMORY[0x263F00190] + 16);
        double v246 = *(double *)(MEMORY[0x263F00190] + 24);
        do
        {
          v361[0] = v240;
          v247 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v241, (uint64_t)v361, 1);
          v359 = v353;
          v249 = objc_msgSend_numberWithInt_(NSNumber, v248, v356);
          v360 = v249;
          v251 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v82 + 2352), v250, (uint64_t)&v360, &v359, 1);
          v253 = objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v235, v252, (uint64_t)&unk_270E12DB8, v247, v251, v243, v244, v245, v246);

          unint64_t v82 = 0x263EFF000;
          v240 = v253;
          --v234;
        }
        while (v234);
      }
      else
      {
        v253 = v240;
      }
      if (fabs(v225 + -1.0) >= 0.0001 || fabs(v230 + -1.0) >= 0.0001)
      {
        CGAffineTransformMakeScale(&buf, v225, v230);
        uint64_t v255 = objc_msgSend_imageByApplyingTransform_(v253, v254, (uint64_t)&buf);

        v253 = (void *)v255;
      }
      a7 = v344;
      unint64_t v81 = 0x263EFF000uLL;
      float v220 = v349;
      v256 = objc_msgSend_imageByCroppingToRect_(v253, v241, v242, 0.0, 0.0, v350, v351);

      id v231 = v256;
      v232 = v231;
    }
    else
    {
      v232 = sub_262E2D7D0(v221, v350, v351);
      id v231 = v221;
    }
  }
  else
  {
    id v231 = v221;
    v232 = v231;
  }

  v257 = sub_262E2DEA4(v336, v37 * (float)(a7[2] * v220));
  int v259 = *((_DWORD *)a7 + 3);
  int v258 = *((_DWORD *)a7 + 4);
  id v260 = v257;
  if (!v260) {
    sub_262E4BF5C();
  }
  v262 = v260;
  uint64_t v263 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v261, @"threshold_between");
  if (!v263) {
    sub_262E4BF88();
  }
  v266 = (void *)v263;
  objc_msgSend_extent(v262, v264, v265);
  double v268 = v267;
  double v270 = v269;
  double v272 = v271;
  double v274 = v273;
  *(void *)&buf.a = v262;
  LODWORD(v267) = v259;
  v277 = objc_msgSend_numberWithFloat_(NSNumber, v275, v276, v267);
  *(void *)&buf.b = v277;
  LODWORD(v278) = v258;
  v281 = objc_msgSend_numberWithFloat_(NSNumber, v279, v280, v278);
  *(void *)&buf.c = v281;
  v283 = objc_msgSend_arrayWithObjects_count_(*(void **)(v81 + 2240), v282, (uint64_t)&buf, 3);
  v360 = v353;
  uint64_t v285 = objc_msgSend_numberWithInt_(NSNumber, v284, v356);
  unint64_t v286 = v82;
  v287 = (void *)v285;
  v361[0] = v285;
  v289 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v286 + 2352), v288, (uint64_t)v361, &v360, 1);
  v291 = objc_msgSend_applyWithExtent_arguments_options_(v266, v290, (uint64_t)v283, v289, v268, v270, v272, v274);

  if (!v291) {
    sub_262E4BFB4();
  }

  v292 = v343;
  v293 = sub_262E2E000(v343, v37 * (float)(v344[9] * v220));
  v294 = sub_262E2D8E4(v293, v344[10]);

  v295 = sub_262E2DEA4(v340, v37 * (float)(v344[5] * v220));

  v296 = sub_262E2E0C8(v295, v344[6]);

  v297 = v327;
  if (v327)
  {
    v298 = sub_262E2E000(v327, v37 * (float)(v344[7] * v220));

    v297 = sub_262E2E0C8(v298, v344[8]);
  }
  v357 = v296;
  v299 = sub_262E2DCB8(v291, v296);
  v300 = sub_262E2E280(v294);
  v301 = sub_262E2DCB8(v299, v300);

  if (v297)
  {
    v302 = sub_262E2E280(v297);
    uint64_t v303 = sub_262E2DCB8(v301, v302);

    v301 = (void *)v303;
  }
  v304 = sub_262E2E0C8(v232, *v344);

  v305 = sub_262E2DCB8(v304, v301);

  float v306 = v344[13] * v220;
  id v307 = v305;
  v310 = v307;
  uint64_t v311 = (2 * vcvtms_s32_f32(v306 * 0.5)) | 1;
  if ((int)v311 > 2)
  {
    v313 = objc_msgSend_imageByClampingToExtent(v307, v308, v309);
    v361[0] = @"inputWidth";
    v315 = objc_msgSend_numberWithInt_(NSNumber, v314, v311);
    *(void *)&buf.a = v315;
    v361[1] = @"inputHeight";
    v317 = objc_msgSend_numberWithInt_(NSNumber, v316, v311);
    *(void *)&buf.b = v317;
    v319 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v318, (uint64_t)&buf, v361, 2);
    v321 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v313, v320, @"CIMorphologyRectangleMaximum", v319);

    v292 = v343;
    objc_msgSend_extent(v310, v322, v323);
    objc_msgSend_imageByCroppingToRect_(v321, v324, v325);
    id v312 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v312 = v307;
  }

  return v312;
}

id sub_262E2D7D0(void *a1, double a2, double a3)
{
  id v5 = a1;
  objc_msgSend_extent(v5, v6, v7);
  double v9 = a2 / v8;
  objc_msgSend_extent(v5, v10, v11);
  double v15 = a3 / v14;
  if (fabs(v9 + -1.0) >= 0.0001 || fabs(v15 + -1.0) >= 0.0001)
  {
    id v16 = objc_msgSend_imageByClampingToExtent(v5, v12, v13);

    CGAffineTransformMakeScale(&v23, v9, v15);
    id v18 = objc_msgSend_imageByApplyingTransform_(v16, v17, (uint64_t)&v23);

    objc_msgSend_imageByCroppingToRect_(v18, v19, v20, 0.0, 0.0, a2, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5) {
      sub_262E4C00C();
    }
  }
  id v21 = v5;

  return v21;
}

id sub_262E2D8E4(void *a1, float a2)
{
  v32[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (!v3) {
    sub_262E4C038();
  }
  id v5 = v3;
  uint64_t v6 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v4, @"threshold_lt");
  if (!v6) {
    sub_262E4C064();
  }
  double v9 = (void *)v6;
  objc_msgSend_extent(v5, v7, v8);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v32[0] = v5;
  *(float *)&double v10 = a2;
  uint64_t v20 = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v10);
  v32[1] = v20;
  double v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, (uint64_t)v32, 2);
  uint64_t v30 = *MEMORY[0x263F009C8];
  double v24 = objc_msgSend_numberWithInt_(NSNumber, v23, *MEMORY[0x263F008D0]);
  double v31 = v24;
  uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v31, &v30, 1);
  double v28 = objc_msgSend_applyWithExtent_arguments_options_(v9, v27, (uint64_t)v22, v26, v11, v13, v15, v17);

  if (!v28) {
    sub_262E4C090();
  }

  return v28;
}

id sub_262E2DA9C(void *a1, void *a2)
{
  v44[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  objc_msgSend_extent(v3, v5, v6);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend_extent(v4, v15, v16);
  v50.origin.double x = v17;
  v50.origin.double y = v18;
  v50.size.double width = v19;
  v50.size.double height = v20;
  v46.origin.double x = v8;
  v46.origin.double y = v10;
  v46.size.double width = v12;
  v46.size.double height = v14;
  CGRect v47 = CGRectUnion(v46, v50);
  double x = v47.origin.x;
  double y = v47.origin.y;
  double width = v47.size.width;
  double height = v47.size.height;
  if (CGRectIsEmpty(v47))
  {
    objc_msgSend_emptyImage(MEMORY[0x263F00650], v25, v26);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    double v31 = v27;
    goto LABEL_8;
  }
  objc_msgSend_extent(v3, v25, v26);
  if (CGRectIsEmpty(v48))
  {
    id v27 = v4;
    goto LABEL_7;
  }
  objc_msgSend_extent(v4, v28, v29);
  if (CGRectIsEmpty(v49))
  {
    id v27 = v3;
    goto LABEL_7;
  }
  uint64_t v33 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v30, @"orMasks");
  if (!v33) {
    sub_262E4C0BC();
  }
  unint64_t v35 = (void *)v33;
  v44[0] = v3;
  v44[1] = v4;
  long long v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)v44, 2);
  uint64_t v42 = *MEMORY[0x263F009C8];
  uint64_t v38 = objc_msgSend_numberWithInt_(NSNumber, v37, *MEMORY[0x263F008D0]);
  float v43 = v38;
  float v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)&v43, &v42, 1);
  double v31 = objc_msgSend_applyWithExtent_arguments_options_(v35, v41, (uint64_t)v36, v40, x, y, width, height);

LABEL_8:

  return v31;
}

id sub_262E2DCB8(void *a1, void *a2)
{
  v40[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  objc_msgSend_extent(v3, v5, v6);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend_extent(v4, v15, v16);
  v44.origin.double x = v17;
  v44.origin.double y = v18;
  v44.size.double width = v19;
  v44.size.double height = v20;
  v42.origin.double x = v8;
  v42.origin.double y = v10;
  v42.size.double width = v12;
  v42.size.double height = v14;
  CGRect v43 = CGRectIntersection(v42, v44);
  double x = v43.origin.x;
  double y = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  if (CGRectIsEmpty(v43))
  {
    id v27 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v25, v26);
  }
  else
  {
    uint64_t v28 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v25, @"andMasks");
    if (!v28) {
      sub_262E4C0E8();
    }
    uint64_t v30 = (void *)v28;
    v40[0] = v3;
    v40[1] = v4;
    double v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v40, 2);
    uint64_t v38 = *MEMORY[0x263F009C8];
    uint64_t v33 = objc_msgSend_numberWithInt_(NSNumber, v32, *MEMORY[0x263F008D0]);
    float v39 = v33;
    unint64_t v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)&v39, &v38, 1);
    id v27 = objc_msgSend_applyWithExtent_arguments_options_(v30, v36, (uint64_t)v31, v35, x, y, width, height);
  }

  return v27;
}

id sub_262E2DEA4(void *a1, float a2)
{
  id v3 = a1;
  uint64_t v6 = v3;
  for (double i = 1.0; a2 >= 16.0; a2 = a2 * 0.5)
    double i = i + i;
  objc_msgSend_extent(v3, v4, v5);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGFloat v18 = objc_msgSend_imageByClampingToExtent(v6, v16, v17);

  CGAffineTransformMakeScale(&v31, 1.0 / i, 1.0 / i);
  CGFloat v20 = objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v18, v19, (uint64_t)&v31, 1);

  CGAffineTransform v23 = objc_msgSend_imageByApplyingGaussianBlurWithSigma_(v20, v21, v22, a2);

  CGAffineTransformMakeScale(&v30, i, i);
  id v25 = objc_msgSend_imageByApplyingTransform_(v23, v24, (uint64_t)&v30);

  uint64_t v28 = objc_msgSend_imageByCroppingToRect_(v25, v26, v27, v9, v11, v13, v15);

  if (!v28) {
    sub_262E4C114();
  }

  return v28;
}

id sub_262E2E000(void *a1, float a2)
{
  id v3 = a1;
  objc_msgSend_extent(v3, v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v16 = objc_msgSend_imageByClampingToExtent(v3, v14, v15);

  CGFloat v19 = objc_msgSend_imageByApplyingGaussianBlurWithSigma_(v16, v17, v18, a2);

  uint64_t v22 = objc_msgSend_imageByCroppingToRect_(v19, v20, v21, v7, v9, v11, v13);

  if (!v22) {
    sub_262E4C140();
  }

  return v22;
}

id sub_262E2E0C8(void *a1, float a2)
{
  v32[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (!v3) {
    sub_262E4C16C();
  }
  uint64_t v5 = v3;
  uint64_t v6 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v4, @"threshold_gt");
  if (!v6) {
    sub_262E4C198();
  }
  double v9 = (void *)v6;
  objc_msgSend_extent(v5, v7, v8);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v32[0] = v5;
  *(float *)&double v10 = a2;
  CGFloat v20 = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v10);
  v32[1] = v20;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, (uint64_t)v32, 2);
  uint64_t v30 = *MEMORY[0x263F009C8];
  double v24 = objc_msgSend_numberWithInt_(NSNumber, v23, *MEMORY[0x263F008D0]);
  CGAffineTransform v31 = v24;
  uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v31, &v30, 1);
  uint64_t v28 = objc_msgSend_applyWithExtent_arguments_options_(v9, v27, (uint64_t)v22, v26, v11, v13, v15, v17);

  if (!v28) {
    sub_262E4C1C4();
  }

  return v28;
}

id sub_262E2E280(void *a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (!v1) {
    sub_262E4C1F0();
  }
  id v3 = v1;
  uint64_t v4 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v2, @"invertMask");
  if (!v4) {
    sub_262E4C21C();
  }
  double v7 = (void *)v4;
  objc_msgSend_extent(v3, v5, v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v27[0] = v3;
  double v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v27, 1);
  uint64_t v19 = objc_msgSend_numberWithInt_(NSNumber, v18, *MEMORY[0x263F008D0], *MEMORY[0x263F009C8]);
  uint64_t v26 = v19;
  uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)&v26, &v25, 1);
  CGAffineTransform v23 = objc_msgSend_applyWithExtent_arguments_options_(v7, v22, (uint64_t)v17, v21, v9, v11, v13, v15);

  if (!v23) {
    sub_262E4C248();
  }

  return v23;
}

double sub_262E2E408(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double sub_262E2E414(double a1, double a2, double a3, double a4)
{
  v5.origin.double x = a1 + a1;
  v5.origin.double y = a2 + a2;
  v5.size.double width = a3 + a3;
  v5.size.double height = a4 + a4;
  *(void *)&double result = (unint64_t)CGRectIntegral(v5);
  return result;
}

void sub_262E2E8CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262E2E8E8(uint64_t a1, const char *a2, uint64_t a3)
{
  qword_26A997600 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);

  return MEMORY[0x270F9A758]();
}

void sub_262E2F544(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_262E2FB3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262E2FB50(uint64_t a1, const char *a2, uint64_t a3)
{
  qword_26A997618 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);

  return MEMORY[0x270F9A758]();
}

id sub_262E2FB90(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v7) {
    sub_262E4C694();
  }
  id v8 = v7;
  objc_sync_enter(v8);
  double v9 = NSNumber;
  uint64_t v12 = objc_msgSend_registryID(v6, v10, v11);
  double v14 = objc_msgSend_numberWithUnsignedLongLong_(v9, v13, v12);
  double v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (!v16)
  {
    double v16 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v17, v18);
    uint64_t v19 = NSNumber;
    uint64_t v22 = objc_msgSend_registryID(v6, v20, v21);
    double v24 = objc_msgSend_numberWithUnsignedLongLong_(v19, v23, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v25, (uint64_t)v16, v24);

    if (!v16) {
      __assert_rtn("findObjectInCache", "UniDeviceCache.m", 36, "deviceDict");
    }
  }
  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v5);

  objc_sync_exit(v8);

  return v26;
}

void sub_262E2FCE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262E30374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262E30390(uint64_t a1, const char *a2, uint64_t a3)
{
  qword_26A997628 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);

  return MEMORY[0x270F9A758]();
}

void sub_262E30600(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_262E3061C()
{
  if (qword_26B425300 != -1) {
    dispatch_once(&qword_26B425300, &unk_270E12E38);
  }
  id v0 = (void *)qword_26B425330;

  return v0;
}

void sub_262E30884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262E30B9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262E30BD0(uint64_t a1, const char *a2, uint64_t a3)
{
  qword_26B425330 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);

  return MEMORY[0x270F9A758]();
}

void sub_262E30CC4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  id v5 = objc_msgSend_bundleForClass_(v2, v4, v3);
  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = (id *)(a1 + 40);
  uint64_t v9 = objc_msgSend_URLForResource_withExtension_(v5, v8, v7, @"metallib");
  double v10 = (void *)qword_26B4252D0;
  qword_26B4252D0 = v9;

  if (!qword_26B4252D0)
  {
    uint64_t v11 = uni_logger_compile();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_262E4C8F0(v6);
    }
  }
}

void sub_262E310B8(uint64_t a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_bundleForClass_(MEMORY[0x263F086E0], a2, *(void *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v7 = objc_msgSend_URLForResource_withExtension_(v3, v6, v5, @"metallib");
  id v8 = (void *)qword_26B4252D8;
  qword_26B4252D8 = v7;

  if (!qword_26B4252D8)
  {
    uint64_t v9 = uni_logger_compile();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_262E4CB34(v4);
    }
  }
}

void sub_262E3146C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_262E322EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_262E32304(uint64_t a1, const char *a2)
{
  qword_26B4252F0 = objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x263F08968], a2, 5, 5);

  return MEMORY[0x270F9A758]();
}

void sub_262E336E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_262E33768()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  id v1 = (void *)qword_26B4252E8;
  qword_26B4252E8 = (uint64_t)v0;

  objc_msgSend_setName_((void *)qword_26B4252E8, v2, @"com.apple.ccportrait.EspressoWrapper.nscache");
  objc_msgSend_setCountLimit_((void *)qword_26B4252E8, v3, 8);
  uint64_t v4 = qword_26B4252E8;

  return MEMORY[0x270F9A6D0](v4, sel_setEvictsObjectsWhenApplicationEntersBackground_, 1);
}

void sub_262E33C70(uint64_t a1, const char *a2, uint64_t a3)
{
  if ((objc_msgSend_built(*(void **)(a1 + 32), a2, a3) & 1) == 0)
  {
    uint64_t context = espresso_create_context();
    if (context || (uint64_t context = espresso_create_context()) != 0)
    {
      uint64_t plan = espresso_create_plan();
      if (plan)
      {
        uint64_t v6 = plan;
        if (espresso_plan_submit_set_multiple_buffering()
          || (objc_msgSend_path(*(void **)(a1 + 32), v7, v8),
              id v9 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_UTF8String(v9, v10, v11),
              int v12 = espresso_plan_add_network(),
              v9,
              v12)
          || espresso_plan_build())
        {
          syslog(3, "r==ESPRESSO_STATUS_SUCCESS is false. (%s) at %s:%d");
        }
        else
        {
          objc_msgSend_setPlanIdx_(*(void **)(a1 + 32), v13, 0);
          objc_msgSend_setPlan_(*(void **)(a1 + 32), v14, v6);
          objc_msgSend_setCtx_(*(void **)(a1 + 32), v15, context);
          objc_msgSend_setBuilt_(*(void **)(a1 + 32), v16, 1);
        }
      }
      else
      {
        syslog(3, "plan is false. (%s) at %s:%d");
      }
    }
    else
    {
      syslog(3, "ctx is false. (%s) at %s:%d");
    }
  }
}

void sub_262E340A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(int *)(a2 + 4);
    if (v2)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], (const char *)a2, @"com.apple.unified_rendering", v2, 0);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void sub_262E371A8(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v10 = objc_msgSend_kernel(a1, v6, v7);
    if (v10 && (objc_msgSend_containsObject_(v5, v9, (uint64_t)v10) & 1) == 0)
    {
      objc_msgSend_addObject_(v5, v11, (uint64_t)v10);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      double v14 = objc_msgSend_inputs(v10, v12, v13, 0);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
      if (v16)
      {
        uint64_t v19 = v16;
        uint64_t v20 = *(void *)v28;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v14);
            }
            uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * v21);
            CGAffineTransform v23 = objc_msgSend_inputs(v10, v17, v18);
            uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, v22);

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              sub_262E371A8(v25, v5, v8);
            }

            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
        }
        while (v19);
      }

      objc_msgSend_addPointer_(v8, v26, (uint64_t)v10);
    }
  }
}

uint64_t sub_262E3735C(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      double v17 = objc_msgSend_mk(v1, v3, v4);

      if (v17)
      {
        uint64_t v20 = objc_msgSend_mk(v1, v18, v19);
        id v9 = objc_msgSend_label(v20, v21, v22);

        uint64_t v25 = objc_msgSend_length(@"run kernel: modify_blurmap_apply", v23, v24);
        long long v27 = objc_msgSend_substringWithRange_(@"run kernel: modify_blurmap_apply", v26, 12, v25 - 12);
        int isEqualToString = objc_msgSend_isEqualToString_(v9, v28, (uint64_t)v27);

        if (isEqualToString)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: modify_blurmap_apply";
LABEL_142:
          double v15 = _os_activity_create(&dword_262E0F000, v14, v13, OS_ACTIVITY_FLAG_DEFAULT);

          goto LABEL_143;
        }
        uint64_t v32 = objc_msgSend_length(@"run kernel: modify_blurmap_glasses_apply", v30, v31);
        uint64_t v34 = objc_msgSend_substringWithRange_(@"run kernel: modify_blurmap_glasses_apply", v33, 12, v32 - 12);
        int v36 = objc_msgSend_isEqualToString_(v9, v35, (uint64_t)v34);

        if (v36)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: modify_blurmap_glasses_apply";
          goto LABEL_142;
        }
        uint64_t v39 = objc_msgSend_length(@"run kernel: threshold_hard_apply", v37, v38);
        unint64_t v41 = objc_msgSend_substringWithRange_(@"run kernel: threshold_hard_apply", v40, 12, v39 - 12);
        int v43 = objc_msgSend_isEqualToString_(v9, v42, (uint64_t)v41);

        if (v43)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: threshold_hard_apply";
          goto LABEL_142;
        }
        uint64_t v47 = objc_msgSend_length(@"run kernel: map_linear_apply", v44, v45);
        CGRect v49 = objc_msgSend_substringWithRange_(@"run kernel: map_linear_apply", v48, 12, v47 - 12);
        int v51 = objc_msgSend_isEqualToString_(v9, v50, (uint64_t)v49);

        if (v51)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: map_linear_apply";
          goto LABEL_142;
        }
        uint64_t v54 = objc_msgSend_length(@"run kernel: map_linear_no_secondary_tex_apply", v52, v53);
        CGRect v56 = objc_msgSend_substringWithRange_(@"run kernel: map_linear_no_secondary_tex_apply", v55, 12, v54 - 12);
        int v58 = objc_msgSend_isEqualToString_(v9, v57, (uint64_t)v56);

        if (v58)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: map_linear_no_secondary_tex_apply";
          goto LABEL_142;
        }
        uint64_t v61 = objc_msgSend_length(@"run kernel: disparity_refinement_bicubic_upscale", v59, v60);
        float v63 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_bicubic_upscale", v62, 12, v61 - 12);
        int v65 = objc_msgSend_isEqualToString_(v9, v64, (uint64_t)v63);

        if (v65)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_bicubic_upscale";
          goto LABEL_142;
        }
        uint64_t v68 = objc_msgSend_length(@"run kernel: disparity_refinement_slm_passthrough", v66, v67);
        CGRect v70 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_slm_passthrough", v69, 12, v68 - 12);
        int v72 = objc_msgSend_isEqualToString_(v9, v71, (uint64_t)v70);

        if (v72)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_slm_passthrough";
          goto LABEL_142;
        }
        uint64_t v75 = objc_msgSend_length(@"run kernel: disparity_refinement_calcweightsX", v73, v74);
        float v77 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_calcweightsX", v76, 12, v75 - 12);
        int v79 = objc_msgSend_isEqualToString_(v9, v78, (uint64_t)v77);

        if (v79)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_calcweightsX";
          goto LABEL_142;
        }
        uint64_t v82 = objc_msgSend_length(@"run kernel: disparity_refinement_calcweightsY", v80, v81);
        uint64_t v84 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_calcweightsY", v83, 12, v82 - 12);
        int v86 = objc_msgSend_isEqualToString_(v9, v85, (uint64_t)v84);

        if (v86)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_calcweightsY";
          goto LABEL_142;
        }
        uint64_t v89 = objc_msgSend_length(@"run kernel: disparity_refinement_preproc", v87, v88);
        float v91 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_preproc", v90, 12, v89 - 12);
        int v93 = objc_msgSend_isEqualToString_(v9, v92, (uint64_t)v91);

        if (v93)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_preproc";
          goto LABEL_142;
        }
        uint64_t v96 = objc_msgSend_length(@"run kernel: disparity_refinement_sample", v94, v95);
        uint64_t v98 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_sample", v97, 12, v96 - 12);
        int v100 = objc_msgSend_isEqualToString_(v9, v99, (uint64_t)v98);

        if (v100)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_sample";
          goto LABEL_142;
        }
        uint64_t v103 = objc_msgSend_length(@"run kernel: disparity_refinement_antialias", v101, v102);
        long long v105 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_antialias", v104, 12, v103 - 12);
        int v107 = objc_msgSend_isEqualToString_(v9, v106, (uint64_t)v105);

        if (v107)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_antialias";
          goto LABEL_142;
        }
        uint64_t v110 = objc_msgSend_length(@"run kernel: facemask_calc", v108, v109);
        double v112 = objc_msgSend_substringWithRange_(@"run kernel: facemask_calc", v111, 12, v110 - 12);
        int v114 = objc_msgSend_isEqualToString_(v9, v113, (uint64_t)v112);

        if (v114)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: facemask_calc";
          goto LABEL_142;
        }
        uint64_t v117 = objc_msgSend_length(@"run kernel: facemask_apply", v115, v116);
        double v119 = objc_msgSend_substringWithRange_(@"run kernel: facemask_apply", v118, 12, v117 - 12);
        int v121 = objc_msgSend_isEqualToString_(v9, v120, (uint64_t)v119);

        if (v121)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: facemask_apply";
          goto LABEL_142;
        }
        uint64_t v124 = objc_msgSend_length(@"run kernel: fpDisparityRefinementPreprocessing", v122, v123);
        float v126 = objc_msgSend_substringWithRange_(@"run kernel: fpDisparityRefinementPreprocessing", v125, 12, v124 - 12);
        int v128 = objc_msgSend_isEqualToString_(v9, v127, (uint64_t)v126);

        if (v128)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: fpDisparityRefinementPreprocessing";
          goto LABEL_142;
        }
        uint64_t v131 = objc_msgSend_length(@"run kernel: fp_slm_calc", v129, v130);
        float v133 = objc_msgSend_substringWithRange_(@"run kernel: fp_slm_calc", v132, 12, v131 - 12);
        int v135 = objc_msgSend_isEqualToString_(v9, v134, (uint64_t)v133);

        if (v135)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: fp_slm_calc";
          goto LABEL_142;
        }
        uint64_t v138 = objc_msgSend_length(@"run kernel: fp_slm_calc_eyes", v136, v137);
        double v140 = objc_msgSend_substringWithRange_(@"run kernel: fp_slm_calc_eyes", v139, 12, v138 - 12);
        int v142 = objc_msgSend_isEqualToString_(v9, v141, (uint64_t)v140);

        if (v142)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: fp_slm_calc_eyes";
          goto LABEL_142;
        }
        uint64_t v145 = objc_msgSend_length(@"run kernel: segmentation_fusion_apply", v143, v144);
        uint64_t v147 = objc_msgSend_substringWithRange_(@"run kernel: segmentation_fusion_apply", v146, 12, v145 - 12);
        int v149 = objc_msgSend_isEqualToString_(v9, v148, (uint64_t)v147);

        if (v149)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: segmentation_fusion_apply";
          goto LABEL_142;
        }
        uint64_t v152 = objc_msgSend_length(@"run kernel: slm_shiftmap_calcminmax", v150, v151);
        v154 = objc_msgSend_substringWithRange_(@"run kernel: slm_shiftmap_calcminmax", v153, 12, v152 - 12);
        int v156 = objc_msgSend_isEqualToString_(v9, v155, (uint64_t)v154);

        if (v156)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: slm_shiftmap_calcminmax";
          goto LABEL_142;
        }
        uint64_t v159 = objc_msgSend_length(@"run kernel: slm_calc", v157, v158);
        v161 = objc_msgSend_substringWithRange_(@"run kernel: slm_calc", v160, 12, v159 - 12);
        int v163 = objc_msgSend_isEqualToString_(v9, v162, (uint64_t)v161);

        if (v163)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: slm_calc";
          goto LABEL_142;
        }
        uint64_t v166 = objc_msgSend_length(@"run kernel: slm_calc_eyes", v164, v165);
        v168 = objc_msgSend_substringWithRange_(@"run kernel: slm_calc_eyes", v167, 12, v166 - 12);
        int v170 = objc_msgSend_isEqualToString_(v9, v169, (uint64_t)v168);

        if (v170)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: slm_calc_eyes";
          goto LABEL_142;
        }
        uint64_t v173 = objc_msgSend_length(@"run kernel: eye_protection_face_calc", v171, v172);
        double v175 = objc_msgSend_substringWithRange_(@"run kernel: eye_protection_face_calc", v174, 12, v173 - 12);
        int v177 = objc_msgSend_isEqualToString_(v9, v176, (uint64_t)v175);

        if (v177)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: eye_protection_face_calc";
          goto LABEL_142;
        }
        uint64_t v180 = objc_msgSend_length(@"run kernel: eye_protection_glasses_face_calc", v178, v179);
        v182 = objc_msgSend_substringWithRange_(@"run kernel: eye_protection_glasses_face_calc", v181, 12, v180 - 12);
        int v184 = objc_msgSend_isEqualToString_(v9, v183, (uint64_t)v182);

        if (v184)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: eye_protection_glasses_face_calc";
          goto LABEL_142;
        }
        uint64_t v187 = objc_msgSend_length(@"run kernel: crispHair_BlurX", v185, v186);
        id v189 = objc_msgSend_substringWithRange_(@"run kernel: crispHair_BlurX", v188, 12, v187 - 12);
        int v191 = objc_msgSend_isEqualToString_(v9, v190, (uint64_t)v189);

        if (v191)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: crispHair_BlurX";
          goto LABEL_142;
        }
        uint64_t v194 = objc_msgSend_length(@"run kernel: crispHair_BlurY", v192, v193);
        double v196 = objc_msgSend_substringWithRange_(@"run kernel: crispHair_BlurY", v195, 12, v194 - 12);
        int v198 = objc_msgSend_isEqualToString_(v9, v197, (uint64_t)v196);

        if (v198)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: crispHair_BlurY";
          goto LABEL_142;
        }
        uint64_t v201 = objc_msgSend_length(@"run kernel: crispHair_expandedDispX", v199, v200);
        v203 = objc_msgSend_substringWithRange_(@"run kernel: crispHair_expandedDispX", v202, 12, v201 - 12);
        int v205 = objc_msgSend_isEqualToString_(v9, v204, (uint64_t)v203);

        if (v205)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: crispHair_expandedDispX";
          goto LABEL_142;
        }
        uint64_t v208 = objc_msgSend_length(@"run kernel: crispHair_expandedDispY", v206, v207);
        v210 = objc_msgSend_substringWithRange_(@"run kernel: crispHair_expandedDispY", v209, 12, v208 - 12);
        int v212 = objc_msgSend_isEqualToString_(v9, v211, (uint64_t)v210);

        if (v212)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: crispHair_expandedDispY";
          goto LABEL_142;
        }
        uint64_t v215 = objc_msgSend_length(@"run kernel: crispHairDownsamplingSingle", v213, v214);
        v217 = objc_msgSend_substringWithRange_(@"run kernel: crispHairDownsamplingSingle", v216, 12, v215 - 12);
        int v219 = objc_msgSend_isEqualToString_(v9, v218, (uint64_t)v217);

        if (v219)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: crispHairDownsamplingSingle";
          goto LABEL_142;
        }
        uint64_t v222 = objc_msgSend_length(@"run kernel: blurmap_x_smoothing", v220, v221);
        double v224 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_x_smoothing", v223, 12, v222 - 12);
        int v226 = objc_msgSend_isEqualToString_(v9, v225, (uint64_t)v224);

        if (v226)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_x_smoothing";
          goto LABEL_142;
        }
        uint64_t v229 = objc_msgSend_length(@"run kernel: blurmap_y_smoothing", v227, v228);
        id v231 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_y_smoothing", v230, 12, v229 - 12);
        int v233 = objc_msgSend_isEqualToString_(v9, v232, (uint64_t)v231);

        if (v233)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_y_smoothing";
          goto LABEL_142;
        }
        uint64_t v236 = objc_msgSend_length(@"run kernel: blurmap_x_smoothing_scaled", v234, v235);
        v238 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_x_smoothing_scaled", v237, 12, v236 - 12);
        int v240 = objc_msgSend_isEqualToString_(v9, v239, (uint64_t)v238);

        if (v240)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_x_smoothing_scaled";
          goto LABEL_142;
        }
        uint64_t v243 = objc_msgSend_length(@"run kernel: blurmap_y_smoothing_scaled", v241, v242);
        double v245 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_y_smoothing_scaled", v244, 12, v243 - 12);
        int v247 = objc_msgSend_isEqualToString_(v9, v246, (uint64_t)v245);

        if (v247)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_y_smoothing_scaled";
          goto LABEL_142;
        }
        uint64_t v250 = objc_msgSend_length(@"run kernel: blurmap_x_smoothing_unbiased", v248, v249);
        v252 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_x_smoothing_unbiased", v251, 12, v250 - 12);
        int v254 = objc_msgSend_isEqualToString_(v9, v253, (uint64_t)v252);

        if (v254)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_x_smoothing_unbiased";
          goto LABEL_142;
        }
        uint64_t v257 = objc_msgSend_length(@"run kernel: blurmap_y_smoothing_unbiased", v255, v256);
        int v259 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_y_smoothing_unbiased", v258, 12, v257 - 12);
        int v261 = objc_msgSend_isEqualToString_(v9, v260, (uint64_t)v259);

        if (v261)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_y_smoothing_unbiased";
          goto LABEL_142;
        }
        uint64_t v264 = objc_msgSend_length(@"run kernel: blurmap_x_smoothing_scaled_unbiased", v262, v263);
        v266 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_x_smoothing_scaled_unbiased", v265, 12, v264 - 12);
        int v268 = objc_msgSend_isEqualToString_(v9, v267, (uint64_t)v266);

        if (v268)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_x_smoothing_scaled_unbiased";
          goto LABEL_142;
        }
        uint64_t v271 = objc_msgSend_length(@"run kernel: blurmap_y_smoothing_scaled_unbiased", v269, v270);
        double v273 = objc_msgSend_substringWithRange_(@"run kernel: blurmap_y_smoothing_scaled_unbiased", v272, 12, v271 - 12);
        int v275 = objc_msgSend_isEqualToString_(v9, v274, (uint64_t)v273);

        if (v275)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blurmap_y_smoothing_scaled_unbiased";
          goto LABEL_142;
        }
        uint64_t v278 = objc_msgSend_length(@"run kernel: sparserendering_preprocess", v276, v277);
        uint64_t v280 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_preprocess", v279, 12, v278 - 12);
        int v282 = objc_msgSend_isEqualToString_(v9, v281, (uint64_t)v280);

        if (v282)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_preprocess";
          goto LABEL_142;
        }
        uint64_t v285 = objc_msgSend_length(@"run kernel: sparserendering_preprocess_scaled", v283, v284);
        v287 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_preprocess_scaled", v286, 12, v285 - 12);
        int v289 = objc_msgSend_isEqualToString_(v9, v288, (uint64_t)v287);

        if (v289)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_preprocess_scaled";
          goto LABEL_142;
        }
        uint64_t v292 = objc_msgSend_length(@"run kernel: sparserendering_prefilter_x", v290, v291);
        v294 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_prefilter_x", v293, 12, v292 - 12);
        int v296 = objc_msgSend_isEqualToString_(v9, v295, (uint64_t)v294);

        if (v296)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_prefilter_x";
          goto LABEL_142;
        }
        uint64_t v299 = objc_msgSend_length(@"run kernel: sparserendering_prefilter_y", v297, v298);
        v301 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_prefilter_y", v300, 12, v299 - 12);
        int v303 = objc_msgSend_isEqualToString_(v9, v302, (uint64_t)v301);

        if (v303)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_prefilter_y";
          goto LABEL_142;
        }
        uint64_t v306 = objc_msgSend_length(@"run kernel: sparserendering_sample_withAlpha", v304, v305);
        v308 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_sample_withAlpha", v307, 12, v306 - 12);
        int v310 = objc_msgSend_isEqualToString_(v9, v309, (uint64_t)v308);

        if (v310)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_sample_withAlpha";
          goto LABEL_142;
        }
        uint64_t v313 = objc_msgSend_length(@"run kernel: sparserendering_sample_noAlpha", v311, v312);
        v315 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_sample_noAlpha", v314, 12, v313 - 12);
        int v317 = objc_msgSend_isEqualToString_(v9, v316, (uint64_t)v315);

        if (v317)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_sample_noAlpha";
          goto LABEL_142;
        }
        uint64_t v320 = objc_msgSend_length(@"run kernel: sparserendering_antialias_x", v318, v319);
        v322 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_antialias_x", v321, 12, v320 - 12);
        int v324 = objc_msgSend_isEqualToString_(v9, v323, (uint64_t)v322);

        if (v324)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_antialias_x";
          goto LABEL_142;
        }
        uint64_t v327 = objc_msgSend_length(@"run kernel: sparserendering_antialias_y", v325, v326);
        v329 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_antialias_y", v328, 12, v327 - 12);
        int v331 = objc_msgSend_isEqualToString_(v9, v330, (uint64_t)v329);

        if (v331)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_antialias_y";
          goto LABEL_142;
        }
        uint64_t v334 = objc_msgSend_length(@"run kernel: sparserendering_yuv_out_1", v332, v333);
        v336 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_yuv_out_1", v335, 12, v334 - 12);
        int v338 = objc_msgSend_isEqualToString_(v9, v337, (uint64_t)v336);

        if (v338)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_yuv_out_1";
          goto LABEL_142;
        }
        uint64_t v341 = objc_msgSend_length(@"run kernel: sparserendering_yuv_out_2", v339, v340);
        v343 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_yuv_out_2", v342, 12, v341 - 12);
        int v345 = objc_msgSend_isEqualToString_(v9, v344, (uint64_t)v343);

        if (v345)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_yuv_out_2";
          goto LABEL_142;
        }
        uint64_t v348 = objc_msgSend_length(@"run kernel: sparserendering_extractY", v346, v347);
        double v350 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_extractY", v349, 12, v348 - 12);
        int v352 = objc_msgSend_isEqualToString_(v9, v351, (uint64_t)v350);

        if (v352)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_extractY";
          goto LABEL_142;
        }
        uint64_t v355 = objc_msgSend_length(@"run kernel: sparserendering_sample_noAlpha_ray", v353, v354);
        v357 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_sample_noAlpha_ray", v356, 12, v355 - 12);
        int v359 = objc_msgSend_isEqualToString_(v9, v358, (uint64_t)v357);

        if (v359)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_sample_noAlpha_ray";
          goto LABEL_142;
        }
        uint64_t v362 = objc_msgSend_length(@"run kernel: sparserendering_add_noise", v360, v361);
        CGRect v364 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_add_noise", v363, 12, v362 - 12);
        int v366 = objc_msgSend_isEqualToString_(v9, v365, (uint64_t)v364);

        if (v366)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_add_noise";
          goto LABEL_142;
        }
        uint64_t v369 = objc_msgSend_length(@"run kernel: sparserendering_blend_raytraced", v367, v368);
        v371 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_blend_raytraced", v370, 12, v369 - 12);
        int v373 = objc_msgSend_isEqualToString_(v9, v372, (uint64_t)v371);

        if (v373)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_blend_raytraced";
          goto LABEL_142;
        }
        uint64_t v376 = objc_msgSend_length(@"run kernel: disparity_refinement_extract_positive_blur_values", v374, v375);
        v378 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_extract_positive_blur_values", v377, 12, v376 - 12);
        int v380 = objc_msgSend_isEqualToString_(v9, v379, (uint64_t)v378);

        if (v380)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_extract_positive_blur_values";
          goto LABEL_142;
        }
        uint64_t v383 = objc_msgSend_length(@"run kernel: disparity_refinement_extract_negative_blur_values", v381, v382);
        v385 = objc_msgSend_substringWithRange_(@"run kernel: disparity_refinement_extract_negative_blur_values", v384, 12, v383 - 12);
        int v387 = objc_msgSend_isEqualToString_(v9, v386, (uint64_t)v385);

        if (v387)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: disparity_refinement_extract_negative_blur_values";
          goto LABEL_142;
        }
        uint64_t v390 = objc_msgSend_length(@"run kernel: sparserendering_antialias_x_4chan", v388, v389);
        v392 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_antialias_x_4chan", v391, 12, v390 - 12);
        int v394 = objc_msgSend_isEqualToString_(v9, v393, (uint64_t)v392);

        if (v394)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_antialias_x_4chan";
          goto LABEL_142;
        }
        uint64_t v397 = objc_msgSend_length(@"run kernel: sparserendering_antialias_y_4chan", v395, v396);
        v399 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_antialias_y_4chan", v398, 12, v397 - 12);
        int v401 = objc_msgSend_isEqualToString_(v9, v400, (uint64_t)v399);

        if (v401)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_antialias_y_4chan";
          goto LABEL_142;
        }
        uint64_t v404 = objc_msgSend_length(@"run kernel: sparserendering_add_noise_only", v402, v403);
        v406 = objc_msgSend_substringWithRange_(@"run kernel: sparserendering_add_noise_only", v405, 12, v404 - 12);
        int v408 = objc_msgSend_isEqualToString_(v9, v407, (uint64_t)v406);

        if (v408)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sparserendering_add_noise_only";
          goto LABEL_142;
        }
        uint64_t v411 = objc_msgSend_length(@"run kernel: median3x3_oneChannel", v409, v410);
        v413 = objc_msgSend_substringWithRange_(@"run kernel: median3x3_oneChannel", v412, 12, v411 - 12);
        int v415 = objc_msgSend_isEqualToString_(v9, v414, (uint64_t)v413);

        if (v415)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: median3x3_oneChannel";
          goto LABEL_142;
        }
        uint64_t v418 = objc_msgSend_length(@"run kernel: median3x3_twoChannel", v416, v417);
        v420 = objc_msgSend_substringWithRange_(@"run kernel: median3x3_twoChannel", v419, 12, v418 - 12);
        int v422 = objc_msgSend_isEqualToString_(v9, v421, (uint64_t)v420);

        if (v422)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: median3x3_twoChannel";
          goto LABEL_142;
        }
        uint64_t v425 = objc_msgSend_length(@"run kernel: sobel_oneChannel", v423, v424);
        v427 = objc_msgSend_substringWithRange_(@"run kernel: sobel_oneChannel", v426, 12, v425 - 12);
        int v429 = objc_msgSend_isEqualToString_(v9, v428, (uint64_t)v427);

        if (v429)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sobel_oneChannel";
          goto LABEL_142;
        }
        uint64_t v432 = objc_msgSend_length(@"run kernel: sobel_yChannel_Thresholded", v430, v431);
        v434 = objc_msgSend_substringWithRange_(@"run kernel: sobel_yChannel_Thresholded", v433, 12, v432 - 12);
        int v436 = objc_msgSend_isEqualToString_(v9, v435, (uint64_t)v434);

        if (v436)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: sobel_yChannel_Thresholded";
          goto LABEL_142;
        }
        uint64_t v439 = objc_msgSend_length(@"run kernel: blendBackgroundBlur", v437, v438);
        v441 = objc_msgSend_substringWithRange_(@"run kernel: blendBackgroundBlur", v440, 12, v439 - 12);
        int v443 = objc_msgSend_isEqualToString_(v9, v442, (uint64_t)v441);

        if (v443)
        {
          uint64_t v13 = uni_activity();
          double v14 = "run kernel: blendBackgroundBlur";
          goto LABEL_142;
        }
LABEL_144:
        uint64_t v46 = 0;
        goto LABEL_145;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = objc_msgSend_inputs(v1, v5, v6);
      id v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"desiredFormat");

      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
          if (v12 == 70)
          {
            uint64_t v13 = uni_activity();
            double v14 = "linear to sRGB texture view";
          }
          else if (v12 == 71)
          {
            uint64_t v13 = uni_activity();
            double v14 = "sRGB to linear texture view";
          }
          else
          {
            uint64_t v13 = uni_activity();
            double v14 = "texture view of misc type";
          }
          goto LABEL_142;
        }
      }
      goto LABEL_144;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = uni_activity();
      uint64_t v16 = "run kernel: Gaussian Blur";
LABEL_24:
      id v9 = _os_activity_create(&dword_262E0F000, v16, v15, OS_ACTIVITY_FLAG_DEFAULT);
LABEL_143:

      uint64_t v46 = 1;
LABEL_145:

      goto LABEL_146;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = uni_activity();
      uint64_t v16 = "run kernel: Guided Filter";
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = uni_activity();
      uint64_t v16 = "run kernel: Highlight Recovery";
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = uni_activity();
      uint64_t v16 = "run kernel: Morphology";
      goto LABEL_24;
    }
  }
  uint64_t v46 = 0;
LABEL_146:

  return v46;
}

void sub_262E3B0CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_262E3B0FC()
{
  if (qword_26B425310 != -1) {
    dispatch_once(&qword_26B425310, &unk_270E12F18);
  }
  id v0 = (void *)qword_26B425308;

  return v0;
}

void sub_262E3B310(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262E3B994(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_262E40668(_Unwind_Exception *a1)
{
}

uint64_t sub_262E407F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_262E40804(uint64_t a1)
{
}

double sub_262E4080C(uint64_t a1, const char *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  objc_msgSend_roiCallback(*(void **)(a1 + 32), a2, a3);
  uint64_t v13 = (double (**)(void, void, void, void, void, void, double, double, double, double))objc_claimAutoreleasedReturnValue();
  double v14 = ((double (**)(void, const char *, void, void, void, void, double, double, double, double))v13)[2](v13, a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4, a5, a6, a7);

  return v14;
}

uint64_t sub_262E4155C(uint64_t a1, const char *a2, uint64_t a3)
{
  qword_26B425308 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);

  return MEMORY[0x270F9A758]();
}

void sub_262E4159C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

void sub_262E415BC(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t sub_262E415F4()
{
  return v0;
}

id uni_logger_general()
{
  if (qword_26A997640 != -1) {
    dispatch_once(&qword_26A997640, &unk_270E12F38);
  }
  uint64_t v0 = (void *)qword_26A997638;

  return v0;
}

uint64_t sub_262E41B20()
{
  qword_26A997638 = (uint64_t)os_log_create("com.apple.unified_rendering", "general");

  return MEMORY[0x270F9A758]();
}

id uni_logger_api()
{
  if (qword_26A997650 != -1) {
    dispatch_once(&qword_26A997650, &unk_270E12F58);
  }
  uint64_t v0 = (void *)qword_26A997648;

  return v0;
}

uint64_t sub_262E41BB8()
{
  qword_26A997648 = (uint64_t)os_log_create("com.apple.unified_rendering", "api");

  return MEMORY[0x270F9A758]();
}

id uni_logger_render()
{
  if (qword_26B4252B8 != -1) {
    dispatch_once(&qword_26B4252B8, &unk_270E12F78);
  }
  uint64_t v0 = (void *)qword_26B4252B0;

  return v0;
}

uint64_t sub_262E41C50()
{
  qword_26B4252B0 = (uint64_t)os_log_create("com.apple.unified_rendering", "render");

  return MEMORY[0x270F9A758]();
}

id uni_logger_performance()
{
  if (qword_26A997660 != -1) {
    dispatch_once(&qword_26A997660, &unk_270E12F98);
  }
  uint64_t v0 = (void *)qword_26A997658;

  return v0;
}

uint64_t sub_262E41CE8()
{
  qword_26A997658 = (uint64_t)os_log_create("com.apple.unified_rendering", "performace");

  return MEMORY[0x270F9A758]();
}

id uni_logger_compile()
{
  if (qword_26A997670 != -1) {
    dispatch_once(&qword_26A997670, &unk_270E12FB8);
  }
  uint64_t v0 = (void *)qword_26A997668;

  return v0;
}

uint64_t sub_262E41D80()
{
  qword_26A997668 = (uint64_t)os_log_create("com.apple.unified_rendering", "compile");

  return MEMORY[0x270F9A758]();
}

id uni_logger_cache()
{
  if (qword_26A997680 != -1) {
    dispatch_once(&qword_26A997680, &unk_270E12FD8);
  }
  uint64_t v0 = (void *)qword_26A997678;

  return v0;
}

uint64_t sub_262E41E18()
{
  qword_26A997678 = (uint64_t)os_log_create("com.apple.unified_rendering", "cache");

  return MEMORY[0x270F9A758]();
}

id uni_activity()
{
  if (qword_26B425340 != -1) {
    dispatch_once(&qword_26B425340, &unk_270E12FF8);
  }
  uint64_t v0 = (void *)qword_26B425338;

  return v0;
}

uint64_t sub_262E41EB0()
{
  qword_26B425338 = (uint64_t)_os_activity_create(&dword_262E0F000, "com.apple.unified_rendering", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);

  return MEMORY[0x270F9A758]();
}

id sub_262E42340(void *a1)
{
  void v33[4] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v1 = NSNumber;
    id v2 = a1;
    objc_msgSend_extent(v2, v3, v4);
    uint64_t v7 = objc_msgSend_numberWithDouble_(v1, v5, v6);
    v33[0] = v7;
    id v8 = NSNumber;
    objc_msgSend_extent(v2, v9, v10);
    double v14 = objc_msgSend_numberWithDouble_(v8, v11, v12, v13);
    v33[1] = v14;
    double v15 = NSNumber;
    objc_msgSend_extent(v2, v16, v17);
    uint64_t v21 = objc_msgSend_numberWithDouble_(v15, v18, v19, v20);
    v33[2] = v21;
    uint64_t v22 = NSNumber;
    objc_msgSend_extent(v2, v23, v24);
    double v26 = v25;

    long long v29 = objc_msgSend_numberWithDouble_(v22, v27, v28, v26);
    v33[3] = v29;
    uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v30, (uint64_t)v33, 4);
  }
  else
  {
    uint64_t v31 = (void *)MEMORY[0x263EFFA68];
  }

  return v31;
}

void sub_262E43520(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v20 = a1;
  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_count(v20, v3, v4) == 3)
  {
    uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(v20, v5, 0);
    uint64_t v9 = objc_msgSend_unsignedIntegerValue(v6, v7, v8);
    uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v20, v10, 1);
    uint64_t v14 = objc_msgSend_unsignedIntegerValue(v11, v12, v13);
    uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v20, v15, 2);
    uint64_t v19 = objc_msgSend_unsignedIntegerValue(v16, v17, v18);
    *a2 = v9;
    a2[1] = v14;
    a2[2] = v19;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
}

id sub_262E43910(void *a1)
{
  id v1 = a1;
  if (!v1) {
    sub_262E4E814();
  }
  uint64_t v3 = v1;
  uint64_t v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v1, v2, @"\n", &stru_270E15D18);

  return v4;
}

void sub_262E44ED0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_262E45BBC()
{
  return 1;
}

void sub_262E45BC4(void *a1, uint64_t a2, void *a3)
{
  id v101 = a3;
  uint64_t v6 = objc_msgSend_name(a1, v4, v5);
  objc_msgSend_encodeObject_forKey_(v101, v7, (uint64_t)v6, @"name");

  uint64_t v8 = NSNumber;
  uint64_t v11 = objc_msgSend_type(a1, v9, v10);
  uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(v8, v12, v11);
  objc_msgSend_encodeObject_forKey_(v101, v14, (uint64_t)v13, @"type");

  double v15 = NSNumber;
  uint64_t v18 = objc_msgSend_access(a1, v16, v17);
  id v20 = objc_msgSend_numberWithUnsignedInteger_(v15, v19, v18);
  objc_msgSend_encodeObject_forKey_(v101, v21, (uint64_t)v20, @"access");

  uint64_t v22 = NSNumber;
  uint64_t v25 = objc_msgSend_index(a1, v23, v24);
  long long v27 = objc_msgSend_numberWithUnsignedInteger_(v22, v26, v25);
  objc_msgSend_encodeObject_forKey_(v101, v28, (uint64_t)v27, @"index");

  uint64_t v31 = objc_msgSend_type(a1, v29, v30);
  switch(v31)
  {
    case 2:
      int v65 = NSNumber;
      uint64_t v66 = objc_msgSend_textureType(a1, v32, v33);
      uint64_t v68 = objc_msgSend_numberWithUnsignedInteger_(v65, v67, v66);
      objc_msgSend_encodeObject_forKey_(v101, v69, (uint64_t)v68, @"textureType");

      CGRect v70 = NSNumber;
      uint64_t v73 = objc_msgSend_textureDataType(a1, v71, v72);
      uint64_t v75 = objc_msgSend_numberWithUnsignedInteger_(v70, v74, v73);
      objc_msgSend_encodeObject_forKey_(v101, v76, (uint64_t)v75, @"textureDataType");

      float v77 = NSNumber;
      uint64_t isDepthTexture = objc_msgSend_isDepthTexture(a1, v78, v79);
      uint64_t v82 = objc_msgSend_numberWithBool_(v77, v81, isDepthTexture);
      objc_msgSend_encodeObject_forKey_(v101, v83, (uint64_t)v82, @"isDepthTexture");

      uint64_t v84 = NSNumber;
      uint64_t v87 = objc_msgSend_arrayLength(a1, v85, v86);
      float v63 = objc_msgSend_numberWithUnsignedInteger_(v84, v88, v87);
      objc_msgSend_encodeObject_forKey_(v101, v89, (uint64_t)v63, @"arrayLength");
      goto LABEL_10;
    case 1:
      CGAffineTransform v90 = NSNumber;
      uint64_t v91 = objc_msgSend_threadgroupMemoryAlignment(a1, v32, v33);
      int v93 = objc_msgSend_numberWithUnsignedInteger_(v90, v92, v91);
      objc_msgSend_encodeObject_forKey_(v101, v94, (uint64_t)v93, @"threadgroupMemoryAlignment");

      uint64_t v95 = NSNumber;
      uint64_t v98 = objc_msgSend_threadgroupMemoryDataSize(a1, v96, v97);
      float v63 = objc_msgSend_numberWithUnsignedInteger_(v95, v99, v98);
      objc_msgSend_encodeObject_forKey_(v101, v100, (uint64_t)v63, @"threadgroupMemoryDataSize");
      goto LABEL_10;
    case 0:
      uint64_t v34 = NSNumber;
      uint64_t v35 = objc_msgSend_bufferAlignment(a1, v32, v33);
      float v37 = objc_msgSend_numberWithUnsignedInteger_(v34, v36, v35);
      objc_msgSend_encodeObject_forKey_(v101, v38, (uint64_t)v37, @"bufferAlignment");

      uint64_t v39 = NSNumber;
      uint64_t v42 = objc_msgSend_bufferDataSize(a1, v40, v41);
      CGRect v44 = objc_msgSend_numberWithUnsignedInteger_(v39, v43, v42);
      objc_msgSend_encodeObject_forKey_(v101, v45, (uint64_t)v44, @"bufferDataSize");

      uint64_t v46 = NSNumber;
      uint64_t v49 = objc_msgSend_bufferDataType(a1, v47, v48);
      int v51 = objc_msgSend_numberWithUnsignedInteger_(v46, v50, v49);
      objc_msgSend_encodeObject_forKey_(v101, v52, (uint64_t)v51, @"bufferDataType");

      float v55 = objc_msgSend_bufferStructType(a1, v53, v54);

      if (v55)
      {
        int v58 = objc_msgSend_bufferStructType(a1, v56, v57);
        objc_msgSend_encodeObject_forKey_(v101, v59, (uint64_t)v58, @"bufferStructType");
      }
      uint64_t v60 = objc_msgSend_bufferPointerType(a1, v56, v57);

      if (v60)
      {
        float v63 = objc_msgSend_bufferPointerType(a1, v61, v62);
        objc_msgSend_encodeObject_forKey_(v101, v64, (uint64_t)v63, @"bufferPointerType");
LABEL_10:
      }
      break;
  }
}

URMTLArgument *sub_262E45F60(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(URMTLArgument);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"name");
  objc_msgSend_setName_(v5, v10, (uint64_t)v9);

  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v6, @"type");
  uint64_t v15 = objc_msgSend_unsignedIntegerValue(v12, v13, v14);
  objc_msgSend_setType_(v5, v16, v15);

  uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v6, @"access");
  uint64_t v21 = objc_msgSend_unsignedIntegerValue(v18, v19, v20);
  objc_msgSend_setAccess_(v5, v22, v21);

  uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v6, @"index");
  uint64_t v27 = objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  objc_msgSend_setIndex_(v5, v28, v27);

  uint64_t v31 = objc_msgSend_type(v5, v29, v30);
  if (v31 == 2)
  {
    int v58 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v6, @"textureType");
    uint64_t v61 = objc_msgSend_unsignedIntegerValue(v58, v59, v60);
    objc_msgSend_setTextureType_(v5, v62, v61);

    uint64_t v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v6, @"textureDataType");
    uint64_t v67 = objc_msgSend_unsignedIntegerValue(v64, v65, v66);
    objc_msgSend_setTextureDataType_(v5, v68, v67);

    CGRect v70 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v6, @"isDepthTexture");
    uint64_t v73 = objc_msgSend_BOOLValue(v70, v71, v72);
    objc_msgSend_setIsDepthTexture_(v5, v74, v73);

    CGRect v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v75, v6, @"arrayLength");
    uint64_t v78 = objc_msgSend_unsignedIntegerValue(v56, v76, v77);
    objc_msgSend_setArrayLength_(v5, v79, v78);
  }
  else if (v31 == 1)
  {
    CGRect v80 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v6, @"threadgroupMemoryAlignment");
    uint64_t v83 = objc_msgSend_unsignedIntegerValue(v80, v81, v82);
    objc_msgSend_setThreadgroupMemoryAlignment_(v5, v84, v83);

    CGRect v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v6, @"threadgroupMemoryDataSize");
    uint64_t v88 = objc_msgSend_unsignedIntegerValue(v56, v86, v87);
    objc_msgSend_setThreadgroupMemoryDataSize_(v5, v89, v88);
  }
  else
  {
    if (v31)
    {
      CGAffineTransform v90 = 0;
      goto LABEL_9;
    }
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v6, @"bufferAlignment");
    uint64_t v36 = objc_msgSend_unsignedIntegerValue(v33, v34, v35);
    objc_msgSend_setBufferAlignment_(v5, v37, v36);

    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v6, @"bufferDataSize");
    uint64_t v42 = objc_msgSend_unsignedIntegerValue(v39, v40, v41);
    objc_msgSend_setBufferDataSize_(v5, v43, v42);

    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v6, @"bufferDataType");
    uint64_t v48 = objc_msgSend_unsignedIntegerValue(v45, v46, v47);
    objc_msgSend_setBufferDataType_(v5, v49, v48);

    uint64_t v50 = objc_opt_class();
    float v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"bufferStructType");
    objc_msgSend_setBufferStructType_(v5, v53, (uint64_t)v52);

    uint64_t v54 = objc_opt_class();
    CGRect v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"bufferPointerType");
    objc_msgSend_setBufferPointerType_(v5, v57, (uint64_t)v56);
  }

  CGAffineTransform v90 = v5;
LABEL_9:

  return v90;
}

uint64_t sub_262E462DC()
{
  return 1;
}

void sub_262E462E4(void *a1, uint64_t a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_elementType(a1, v6, v7);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)v10, @"elementType");

  uint64_t v12 = NSNumber;
  uint64_t v15 = objc_msgSend_access(a1, v13, v14);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(v12, v16, v15);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v17, @"access");

  uint64_t v19 = NSNumber;
  uint64_t v22 = objc_msgSend_alignment(a1, v20, v21);
  uint64_t v24 = objc_msgSend_numberWithUnsignedInteger_(v19, v23, v22);
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)v24, @"alignment");

  uint64_t v26 = NSNumber;
  uint64_t v29 = objc_msgSend_dataSize(a1, v27, v28);
  uint64_t v31 = objc_msgSend_numberWithUnsignedInteger_(v26, v30, v29);
  objc_msgSend_encodeObject_forKey_(v5, v32, (uint64_t)v31, @"dataSize");

  uint64_t v33 = NSNumber;
  uint64_t IsArgumentBuffer = objc_msgSend_elementIsArgumentBuffer(a1, v34, v35);
  objc_msgSend_numberWithBool_(v33, v37, IsArgumentBuffer);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)v39, @"elementIsArgumentBuffer");
}

URMTLPointerType *sub_262E4644C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init(URMTLPointerType);
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"elementType");
  uint64_t v11 = objc_msgSend_unsignedIntegerValue(v8, v9, v10);
  objc_msgSend_setElementType_(v5, v12, v11);

  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v6, @"access");
  uint64_t v17 = objc_msgSend_unsignedIntegerValue(v14, v15, v16);
  objc_msgSend_setAccess_(v5, v18, v17);

  uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v6, @"alignment");
  uint64_t v23 = objc_msgSend_unsignedIntegerValue(v20, v21, v22);
  objc_msgSend_setAlignment_(v5, v24, v23);

  uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v6, @"dataSize");
  uint64_t v29 = objc_msgSend_unsignedIntegerValue(v26, v27, v28);
  objc_msgSend_setDataSize_(v5, v30, v29);

  uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v6, @"elementIsArgumentBuffer");

  uint64_t v35 = objc_msgSend_BOOLValue(v32, v33, v34);
  objc_msgSend_setElementIsArgumentBuffer_(v5, v36, v35);

  return v5;
}

uint64_t sub_262E465A8()
{
  return 1;
}

void sub_262E465B0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_members(a1, v5, v6);
  uint64_t v8 = (void *)MEMORY[0x263EFF980];
  uint64_t v11 = objc_msgSend_count(v7, v9, v10);
  uint64_t v13 = objc_msgSend_arrayWithCapacity_(v8, v12, v11);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v7;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v41, v45, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void **)(*((void *)&v41 + 1) + 8 * v19);
        uint64_t v21 = objc_alloc_init(URMTLStructMemberInternal);
        uint64_t v24 = objc_msgSend_name(v20, v22, v23, (void)v41);
        objc_msgSend_setName_(v21, v25, (uint64_t)v24);

        uint64_t v28 = objc_msgSend_offset(v20, v26, v27);
        objc_msgSend_setOffset_(v21, v29, v28);
        uint64_t v32 = objc_msgSend_dataType(v20, v30, v31);
        objc_msgSend_setDataType_(v21, v33, v32);
        uint64_t v36 = objc_msgSend_argumentIndex(v20, v34, v35);
        objc_msgSend_setArgumentIndex_(v21, v37, v36);
        objc_msgSend_addObject_(v13, v38, (uint64_t)v21);

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v39, (uint64_t)&v41, v45, 16);
    }
    while (v17);
  }

  objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v13, @"members");
}

URMTLStructType *sub_262E4677C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init(URMTLStructType);
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"members");

  objc_msgSend_setMembers_(v5, v9, (uint64_t)v8);
  return v5;
}

id tmpTexturesFromTexture(void *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a1;
  if (a2)
  {
    uint64_t v7 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v5, a2);
    uint64_t v10 = objc_msgSend_device(v6, v8, v9);
    objc_msgSend_bufferOffset(v6, v11, v12);
    uint64_t v13 = (void *)MEMORY[0x263F12A50];
    uint64_t v16 = objc_msgSend_width(v6, v14, v15);
    uint64_t v19 = objc_msgSend_height(v6, v17, v18);
    uint64_t v21 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v13, v20, a3, v16, v19, 0);
    objc_msgSend_setUsage_(v21, v22, 19);
    uint64_t v24 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v10, v23, a3);
    MTLPixelFormatGetInfoForDevice();
    objc_msgSend_width(v6, v25, v26, 0, 0, 0);
    uint64_t v29 = ((v24 - 1) & -v24) * objc_msgSend_height(v6, v27, v28);
    if (v29 * (unint64_t)a2 > objc_msgSend_allocatedSize(v6, v30, v31))
    {
      uint64_t v32 = uni_logger_performance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGAffineTransform buf = 136446722;
        int v51 = "tmpTexturesFromTexture";
        __int16 v52 = 2048;
        uint64_t v53 = objc_msgSend_allocatedSize(v6, v33, v34);
        __int16 v54 = 2048;
        uint64_t v55 = v29;
        _os_log_impl(&dword_262E0F000, v32, OS_LOG_TYPE_INFO, "%{public}s Insufficient backing size = %ld need %ld", buf, 0x20u);
      }
    }
    do
    {
      id v39 = uni_logger_performance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_description(v21, v40, v41);
        id v35 = objc_claimAutoreleasedReturnValue();
        uint64_t v38 = objc_msgSend_UTF8String(v35, v36, v37);
        *(_DWORD *)CGAffineTransform buf = 136446466;
        int v51 = "tmpTexturesFromTexture";
        __int16 v52 = 2080;
        uint64_t v53 = v38;
        _os_log_debug_impl(&dword_262E0F000, v39, OS_LOG_TYPE_DEBUG, "%{public}s Creating texture at runtime %s", buf, 0x16u);
      }
      long long v43 = objc_msgSend_newTextureWithDescriptor_(v10, v42, (uint64_t)v21);
      uint64_t v45 = objc_msgSend_imageWithMTLTexture_(UniImage, v44, (uint64_t)v43);
      objc_msgSend_addObject_(v7, v46, (uint64_t)v45);

      --a2;
    }
    while (a2);
    uint64_t v48 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v47, (uint64_t)v7);
  }
  else
  {
    uint64_t v48 = (void *)MEMORY[0x263EFFA68];
  }

  return v48;
}

uint64_t sub_262E46D4C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    return objc_msgSend_setObject_forKey_(a1, a2, a3);
  }
  else {
    return objc_msgSend_removeObjectForKey_(a1, a2, a4);
  }
}

id loadBMTL(uint64_t a1, void *a2, _DWORD *a3)
{
  id v5 = a2;
  uint64_t v8 = objc_msgSend_fileURLWithPath_(NSURL, v6, a1);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x263EFF8F8], v7, (uint64_t)v8);
    uint64_t v10 = v9;
    if (!v9) {
      goto LABEL_7;
    }
    id v11 = v9;
    id v14 = (unsigned int *)objc_msgSend_bytes(v11, v12, v13);
    if (!v14) {
      goto LABEL_7;
    }
    uint64_t v17 = v14;
    uint64_t v19 = *v14;
    uint64_t v18 = v14[1];
    uint64_t v21 = v14[2];
    uint64_t v20 = v14[3];
    if (a3) {
      *a3 = v20;
    }
    if (objc_msgSend_length(v11, v15, v16) >= (unint64_t)(v20 * v18) + 16)
    {
      uint64_t v25 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v22, v21, v19, v18, 0);
      uint64_t v27 = v25;
      if (v25)
      {
        objc_msgSend_setUsage_(v25, v26, 19);
        uint64_t v23 = objc_msgSend_newTextureWithDescriptor_(v5, v28, (uint64_t)v27);
        memset(v30, 0, 24);
        v30[3] = v19;
        v30[4] = v18;
        v30[5] = 1;
        objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v23, v29, (uint64_t)v30, 0, v17 + 4, v20);
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
LABEL_7:
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

id getTextureDataAsBuffer(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v4 = objc_msgSend_device(v1, v2, v3);
    uint64_t v42 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    uint64_t v7 = objc_msgSend_device(v1, v5, v6);
    objc_msgSend_pixelFormat(v1, v8, v9);
    MTLPixelFormatGetInfoForDevice();

    objc_msgSend_width(v1, v10, v11);
    objc_msgSend_height(v1, v12, v13);
    uint64_t v15 = objc_msgSend_newBufferWithLength_options_(v4, v14, 0, 0);
    uint64_t v18 = objc_msgSend_newCommandQueue(v4, v16, v17);
    uint64_t v21 = objc_msgSend_commandBuffer(v18, v19, v20);
    uint64_t v24 = objc_msgSend_blitCommandEncoder(v21, v22, v23);
    memset(v38, 0, sizeof(v38));
    v37[0] = objc_msgSend_width(v1, v25, v26);
    v37[1] = objc_msgSend_height(v1, v27, v28);
    v37[2] = 1;
    objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_(v24, v29, (uint64_t)v1, 0, 0, v38, v37, v15, 0, 0, 0);

    objc_msgSend_endEncoding(v24, v30, v31);
    objc_msgSend_commit(v21, v32, v33);
    objc_msgSend_waitUntilCompleted(v21, v34, v35);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void writeTextureAs2DBMTL(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = getTextureDataAsBuffer(v4);
  uint64_t v8 = objc_msgSend_device(v4, v6, v7, 0, 0, 0);
  objc_msgSend_pixelFormat(v4, v9, v10);
  MTLPixelFormatGetInfoForDevice();

  objc_msgSend_width(v4, v11, v12);
  objc_msgSend_height(v4, v13, v14);
  id v15 = objc_alloc(MEMORY[0x263EFF990]);
  id v17 = objc_msgSend_initWithLength_(v15, v16, 16);
  uint64_t v20 = (_DWORD *)objc_msgSend_mutableBytes(v17, v18, v19);
  _DWORD *v20 = objc_msgSend_width(v4, v21, v22);
  v20[1] = objc_msgSend_height(v4, v23, v24);
  int v27 = objc_msgSend_pixelFormat(v4, v25, v26);

  v20[2] = v27;
  v20[3] = 0;
  id v28 = v5;
  uint64_t v31 = objc_msgSend_contents(v28, v29, v30);
  objc_msgSend_replaceBytesInRange_withBytes_(v17, v32, 16, 0, v31);
  uint64_t v34 = objc_msgSend_fileURLWithPath_(NSURL, v33, (uint64_t)v3);

  objc_msgSend_writeToURL_atomically_(v17, v35, (uint64_t)v34, 0);
}

id createSimilarTexture(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v6 = v3;
  uint64_t v7 = 0;
  if (v3 && a2)
  {
    uint64_t v8 = (void *)MEMORY[0x263F12A50];
    uint64_t v9 = objc_msgSend_width(v3, v4, v5);
    uint64_t v12 = objc_msgSend_height(v6, v10, v11);
    BOOL v15 = (unint64_t)objc_msgSend_mipmapLevelCount(v6, v13, v14) > 1;
    id v17 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v8, v16, a2, v9, v12, v15);
    uint64_t v19 = v17;
    if (v17)
    {
      objc_msgSend_setUsage_(v17, v18, 19);
      uint64_t v22 = objc_msgSend_device(v6, v20, v21);
      uint64_t v7 = objc_msgSend_newTextureWithDescriptor_(v22, v23, (uint64_t)v19);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

id MTLDataTypeAsString(uint64_t a1, const char *a2)
{
  v13[99] = *MEMORY[0x263EF8340];
  v12[0] = &unk_270E1E780;
  v12[1] = &unk_270E1E798;
  v13[0] = @"MTLDataTypeNone";
  v13[1] = @"MTLDataTypeStruct";
  v12[2] = &unk_270E1E7B0;
  v12[3] = &unk_270E1E7C8;
  v13[2] = @"MTLDataTypeArray";
  v13[3] = @"MTLDataTypeFloat";
  v12[4] = &unk_270E1E7E0;
  v12[5] = &unk_270E1E7F8;
  v13[4] = @"MTLDataTypeFloat2";
  v13[5] = @"MTLDataTypeFloat3";
  v12[6] = &unk_270E1E810;
  v12[7] = &unk_270E1E828;
  v13[6] = @"MTLDataTypeFloat4";
  v13[7] = @"MTLDataTypeFloat2x2";
  v12[8] = &unk_270E1E840;
  v12[9] = &unk_270E1E858;
  v13[8] = @"MTLDataTypeFloat2x3";
  v13[9] = @"MTLDataTypeFloat2x4";
  v12[10] = &unk_270E1E870;
  v12[11] = &unk_270E1E888;
  v13[10] = @"MTLDataTypeFloat3x2";
  v13[11] = @"MTLDataTypeFloat3x3";
  v12[12] = &unk_270E1E8A0;
  v12[13] = &unk_270E1E8B8;
  v13[12] = @"MTLDataTypeFloat3x4";
  v13[13] = @"MTLDataTypeFloat4x2";
  v12[14] = &unk_270E1E8D0;
  v12[15] = &unk_270E1E8E8;
  v13[14] = @"MTLDataTypeFloat4x3";
  v13[15] = @"MTLDataTypeFloat4x4";
  v12[16] = &unk_270E1E900;
  v12[17] = &unk_270E1E918;
  v13[16] = @"MTLDataTypeHalf";
  v13[17] = @"MTLDataTypeHalf2";
  v12[18] = &unk_270E1E930;
  v12[19] = &unk_270E1E948;
  v13[18] = @"MTLDataTypeHalf3";
  v13[19] = @"MTLDataTypeHalf4";
  v12[20] = &unk_270E1E960;
  v12[21] = &unk_270E1E978;
  v13[20] = @"MTLDataTypeHalf2x2";
  v13[21] = @"MTLDataTypeHalf2x3";
  v12[22] = &unk_270E1E990;
  v12[23] = &unk_270E1E9A8;
  v13[22] = @"MTLDataTypeHalf2x4";
  v13[23] = @"MTLDataTypeHalf3x2";
  v12[24] = &unk_270E1E9C0;
  v12[25] = &unk_270E1E9D8;
  v13[24] = @"MTLDataTypeHalf3x3";
  v13[25] = @"MTLDataTypeHalf3x4";
  v12[26] = &unk_270E1E9F0;
  v12[27] = &unk_270E1EA08;
  v13[26] = @"MTLDataTypeHalf4x2";
  v13[27] = @"MTLDataTypeHalf4x3";
  v12[28] = &unk_270E1EA20;
  v12[29] = &unk_270E1EA38;
  v13[28] = @"MTLDataTypeHalf4x4";
  v13[29] = @"MTLDataTypeInt";
  v12[30] = &unk_270E1EA50;
  v12[31] = &unk_270E1EA68;
  v13[30] = @"MTLDataTypeInt2";
  v13[31] = @"MTLDataTypeInt3";
  v12[32] = &unk_270E1EA80;
  v12[33] = &unk_270E1EA98;
  v13[32] = @"MTLDataTypeInt4";
  v13[33] = @"MTLDataTypeUInt";
  v12[34] = &unk_270E1EAB0;
  v12[35] = &unk_270E1EAC8;
  v13[34] = @"MTLDataTypeUInt2";
  v13[35] = @"MTLDataTypeUInt3";
  v12[36] = &unk_270E1EAE0;
  v12[37] = &unk_270E1EAF8;
  v13[36] = @"MTLDataTypeUInt4";
  v13[37] = @"MTLDataTypeShort";
  v12[38] = &unk_270E1EB10;
  v12[39] = &unk_270E1EB28;
  v13[38] = @"MTLDataTypeShort2";
  v13[39] = @"MTLDataTypeShort3";
  v12[40] = &unk_270E1EB40;
  v12[41] = &unk_270E1EB58;
  v13[40] = @"MTLDataTypeShort4";
  v13[41] = @"MTLDataTypeUShort";
  v12[42] = &unk_270E1EB70;
  v12[43] = &unk_270E1EB88;
  v13[42] = @"MTLDataTypeUShort2";
  v13[43] = @"MTLDataTypeUShort3";
  v12[44] = &unk_270E1EBA0;
  v12[45] = &unk_270E1EBB8;
  v13[44] = @"MTLDataTypeUShort4";
  v13[45] = @"MTLDataTypeChar";
  v12[46] = &unk_270E1EBD0;
  v12[47] = &unk_270E1EBE8;
  v13[46] = @"MTLDataTypeChar2";
  v13[47] = @"MTLDataTypeChar3";
  v12[48] = &unk_270E1EC00;
  v12[49] = &unk_270E1EC18;
  v13[48] = @"MTLDataTypeChar4";
  v13[49] = @"MTLDataTypeUChar";
  v12[50] = &unk_270E1EC30;
  v12[51] = &unk_270E1EC48;
  v13[50] = @"MTLDataTypeUChar2";
  v13[51] = @"MTLDataTypeUChar3";
  v12[52] = &unk_270E1EC60;
  v12[53] = &unk_270E1EC78;
  v13[52] = @"MTLDataTypeUChar4";
  v13[53] = @"MTLDataTypeBool";
  v12[54] = &unk_270E1EC90;
  v12[55] = &unk_270E1ECA8;
  v13[54] = @"MTLDataTypeBool2";
  v13[55] = @"MTLDataTypeBool3";
  v12[56] = &unk_270E1ECC0;
  v12[57] = &unk_270E1ECD8;
  v13[56] = @"MTLDataTypeBool4";
  v13[57] = @"MTLDataTypeTexture";
  v12[58] = &unk_270E1ECF0;
  v12[59] = &unk_270E1ED08;
  v13[58] = @"MTLDataTypeSampler";
  v13[59] = @"MTLDataTypePointer";
  v12[60] = &unk_270E1ED20;
  v12[61] = &unk_270E1ED38;
  v13[60] = @"MTLDataTypeRenderPipeline";
  v13[61] = @"MTLDataTypeIndirectCommandBuffer";
  v12[62] = &unk_270E1ED50;
  v12[63] = &unk_270E1ED68;
  v13[62] = @"MTLDataTypeVisibleFunctionTable";
  v13[63] = @"MTLDataTypePrivateIndirectArgument";
  v12[64] = &unk_270E1ED80;
  v13[64] = @"MTLDataTypePrivateVoid";
  v12[65] = &unk_270E1ED98;
  v13[65] = @"MTLDataTypeLong";
  v12[66] = &unk_270E1EDB0;
  v13[66] = @"MTLDataTypeLong2";
  v12[67] = &unk_270E1EDC8;
  v13[67] = @"MTLDataTypeLong3";
  v12[68] = &unk_270E1EDE0;
  v13[68] = @"MTLDataTypeLong4";
  v12[69] = &unk_270E1EDF8;
  v13[69] = @"MTLDataTypeULong";
  v12[70] = &unk_270E1EE10;
  v13[70] = @"MTLDataTypeULong2";
  v12[71] = &unk_270E1EE28;
  v13[71] = @"MTLDataTypeULong3";
  v12[72] = &unk_270E1EE40;
  v13[72] = @"MTLDataTypeULong4";
  v12[73] = &unk_270E1EE58;
  v13[73] = @"MTLDataTypeDouble";
  v12[74] = &unk_270E1EE70;
  v13[74] = @"MTLDataTypeDouble2";
  v12[75] = &unk_270E1EE88;
  v13[75] = @"MTLDataTypeDouble3";
  v12[76] = &unk_270E1EEA0;
  v13[76] = @"MTLDataTypeDouble4";
  v12[77] = &unk_270E1EEB8;
  v13[77] = @"MTLDataTypeFloat8";
  v12[78] = &unk_270E1EED0;
  v13[78] = @"MTLDataTypeFloat16";
  v12[79] = &unk_270E1EEE8;
  v13[79] = @"MTLDataTypeHalf8";
  v12[80] = &unk_270E1EF00;
  v13[80] = @"MTLDataTypeHalf16";
  v12[81] = &unk_270E1EF18;
  v13[81] = @"MTLDataTypeInt8";
  v12[82] = &unk_270E1EF30;
  v13[82] = @"MTLDataTypeInt16";
  v12[83] = &unk_270E1EF48;
  v13[83] = @"MTLDataTypeUInt8";
  v12[84] = &unk_270E1EF60;
  v13[84] = @"MTLDataTypeUInt16";
  v12[85] = &unk_270E1EF78;
  v13[85] = @"MTLDataTypeShort8";
  v12[86] = &unk_270E1EF90;
  v13[86] = @"MTLDataTypeShort16";
  v12[87] = &unk_270E1EFA8;
  v13[87] = @"MTLDataTypeUShort8";
  v12[88] = &unk_270E1EFC0;
  v13[88] = @"MTLDataTypeUShort16";
  v12[89] = &unk_270E1EFD8;
  v13[89] = @"MTLDataTypeChar8";
  v12[90] = &unk_270E1EFF0;
  v13[90] = @"MTLDataTypeChar16";
  v12[91] = &unk_270E1F008;
  v13[91] = @"MTLDataTypeUChar8";
  v12[92] = &unk_270E1F020;
  v13[92] = @"MTLDataTypeUChar16";
  v12[93] = &unk_270E1F038;
  v13[93] = @"MTLDataTypeLong8";
  v12[94] = &unk_270E1F050;
  v13[94] = @"MTLDataTypeLong16";
  v12[95] = &unk_270E1F068;
  v13[95] = @"MTLDataTypeULong8";
  v12[96] = &unk_270E1F080;
  v13[96] = @"MTLDataTypeULong16";
  v12[97] = &unk_270E1F098;
  v13[97] = @"MTLDataTypeDouble8";
  v12[98] = &unk_270E1F0B0;
  v13[98] = @"MTLDataTypeDouble16";
  id v3 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v13, v12, 99);
  uint64_t v5 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, a1);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v3, v6, (uint64_t)v5);

  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v8, @"MTLDataType(%lu) (unknown type)", a1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

BOOL isSupportedType(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  if ((unint64_t)(a1 - 3) < 0x36) {
    return 1;
  }
  uint64_t v2 = numComponentsForType(a1, &v4, &v3);
  BOOL result = 0;
  if (v2)
  {
    if (v4) {
      return v3 != 0;
    }
  }
  return result;
}

uint64_t numComponentsForType(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    uint64_t v5 = 0;
    *a2 = 0;
    uint64_t v6 = 81;
    uint64_t v7 = 45;
    uint64_t v8 = 37;
    uint64_t v9 = 8;
    uint64_t v10 = 29;
    uint64_t v11 = 4;
    uint64_t result = 1;
    switch(a1)
    {
      case 3:
      case 16:
      case 29:
      case 33:
      case 37:
      case 41:
      case 45:
      case 49:
      case 53:
      case 81:
      case 85:
      case 89:
        goto LABEL_7;
      case 4:
      case 17:
      case 30:
      case 34:
      case 38:
      case 42:
      case 46:
      case 50:
      case 54:
      case 82:
      case 86:
      case 90:
        --a1;
        uint64_t result = 2;
        goto LABEL_7;
      case 5:
      case 18:
      case 31:
      case 35:
      case 39:
      case 43:
      case 47:
      case 51:
      case 55:
      case 83:
      case 87:
      case 91:
        a1 -= 2;
        uint64_t result = 3;
        goto LABEL_7;
      case 6:
      case 19:
      case 32:
      case 36:
      case 40:
      case 44:
      case 48:
      case 52:
      case 56:
      case 84:
      case 88:
      case 92:
        uint64_t result = 4;
        a1 -= 3;
LABEL_7:
        *a2 = a1;
        if (a1 > 36)
        {
          char v13 = a1 - 45;
          if ((unint64_t)(a1 - 45) <= 0x2C)
          {
            if (((1 << v13) & 0x111) != 0)
            {
LABEL_50:
              uint64_t v12 = 1;
              goto LABEL_60;
            }
            if (((1 << v13) & 0x11000000000) != 0 || a1 == 89)
            {
LABEL_59:
              uint64_t v12 = 8;
              goto LABEL_60;
            }
          }
          if (a1 == 37 || (uint64_t v5 = result, a1 == 41))
          {
LABEL_44:
            uint64_t v12 = 2;
LABEL_60:
            *a3 = v12;
            return result;
          }
        }
        else
        {
          uint64_t v12 = 4;
          if (a1 <= 28)
          {
            if (a1 == 3) {
              goto LABEL_60;
            }
            uint64_t v5 = result;
            if (a1 != 16) {
              goto LABEL_21;
            }
            goto LABEL_44;
          }
          if (a1 == 29) {
            goto LABEL_60;
          }
          uint64_t v5 = result;
          if (a1 == 33) {
            goto LABEL_60;
          }
        }
LABEL_21:
        uint64_t v12 = 0;
        uint64_t result = v5;
        goto LABEL_60;
      case 7:
        goto LABEL_31;
      case 8:
      case 10:
        uint64_t v11 = 6;
        goto LABEL_31;
      case 9:
      case 13:
      case 93:
        uint64_t v11 = 8;
        goto LABEL_31;
      case 11:
        uint64_t v11 = 9;
        goto LABEL_31;
      case 12:
      case 14:
        uint64_t v11 = 12;
        goto LABEL_31;
      case 15:
      case 94:
        uint64_t v11 = 16;
LABEL_31:
        *a2 = 3;
        uint64_t v12 = 4;
        uint64_t result = v11;
        goto LABEL_60;
      case 20:
        goto LABEL_33;
      case 21:
      case 23:
        uint64_t v11 = 6;
        goto LABEL_33;
      case 22:
      case 26:
      case 95:
        uint64_t v11 = 8;
        goto LABEL_33;
      case 24:
        uint64_t v11 = 9;
        goto LABEL_33;
      case 25:
      case 27:
        uint64_t v11 = 12;
        goto LABEL_33;
      case 28:
      case 96:
        uint64_t v11 = 16;
LABEL_33:
        *a2 = 16;
        uint64_t result = v11;
        goto LABEL_44;
      case 97:
        goto LABEL_38;
      case 98:
        uint64_t v9 = 16;
        uint64_t v10 = 29;
        goto LABEL_38;
      case 99:
        uint64_t v9 = 8;
        goto LABEL_37;
      case 100:
        uint64_t v9 = 16;
LABEL_37:
        uint64_t v10 = 33;
LABEL_38:
        *a2 = v10;
        uint64_t v12 = 4;
        uint64_t result = v9;
        goto LABEL_60;
      case 101:
        goto LABEL_43;
      case 102:
        uint64_t v9 = 16;
        uint64_t v8 = 37;
        goto LABEL_43;
      case 103:
        uint64_t v9 = 8;
        goto LABEL_42;
      case 104:
        uint64_t v9 = 16;
LABEL_42:
        uint64_t v8 = 41;
LABEL_43:
        *a2 = v8;
        uint64_t result = v9;
        goto LABEL_44;
      case 105:
        goto LABEL_49;
      case 106:
        uint64_t v9 = 16;
        uint64_t v7 = 45;
        goto LABEL_49;
      case 107:
        uint64_t v9 = 8;
        goto LABEL_48;
      case 108:
        uint64_t v9 = 16;
LABEL_48:
        uint64_t v7 = 49;
LABEL_49:
        *a2 = v7;
        uint64_t result = v9;
        goto LABEL_50;
      case 109:
        goto LABEL_55;
      case 110:
        uint64_t v9 = 16;
        uint64_t v6 = 81;
        goto LABEL_55;
      case 111:
        uint64_t v9 = 8;
        goto LABEL_54;
      case 112:
        uint64_t v9 = 16;
LABEL_54:
        uint64_t v6 = 85;
LABEL_55:
        *a2 = v6;
        goto LABEL_58;
      case 113:
        goto LABEL_57;
      case 114:
        uint64_t v9 = 16;
LABEL_57:
        *a2 = 89;
LABEL_58:
        uint64_t result = v9;
        goto LABEL_59;
      default:
        goto LABEL_21;
    }
  }
  return result;
}

void packSingleValue(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  uint64_t v12 = v9;
  if (a4 > 44)
  {
    if (a4 <= 80)
    {
      switch(a4)
      {
        case '-':
          char v14 = objc_msgSend_charValue(v9, v10, v11);
          break;
        case '1':
          char v14 = objc_msgSend_unsignedCharValue(v9, v10, v11);
          break;
        case '5':
          char v14 = objc_msgSend_BOOLValue(v9, v10, v11);
          break;
        default:
          goto LABEL_32;
      }
      *(unsigned char *)(a5 + a3 + a2) = v14;
      goto LABEL_35;
    }
    switch(a4)
    {
      case 'Q':
        uint64_t v23 = objc_msgSend_longValue(v9, v10, v11);
        break;
      case 'U':
        uint64_t v23 = objc_msgSend_unsignedLongValue(v9, v10, v11);
        break;
      case 'Y':
        objc_msgSend_doubleValue(v9, v10, v11);
        *(void *)(a5 + a3 + 8 * a2) = v16;
        goto LABEL_35;
      default:
        goto LABEL_32;
    }
    *(void *)(a5 + a3 + 8 * a2) = v23;
    goto LABEL_35;
  }
  if (a4 <= 32)
  {
    switch(a4)
    {
      case 3:
        objc_msgSend_floatValue(v9, v10, v11);
        *(_DWORD *)(a5 + a3 + 4 * a2) = v17;
        goto LABEL_35;
      case 16:
        objc_msgSend_floatValue(v9, v10, v11);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(a5 + a3 + 2 * a2) = _S0;
        goto LABEL_35;
      case 29:
        int v13 = objc_msgSend_intValue(v9, v10, v11);
LABEL_26:
        *(_DWORD *)(a5 + a3 + 4 * a2) = v13;
        goto LABEL_35;
    }
    goto LABEL_32;
  }
  switch(a4)
  {
    case '!':
      int v13 = objc_msgSend_unsignedIntValue(v9, v10, v11);
      goto LABEL_26;
    case '%':
      __int16 v15 = objc_msgSend_shortValue(v9, v10, v11);
      goto LABEL_28;
    case ')':
      __int16 v15 = objc_msgSend_unsignedShortValue(v9, v10, v11);
LABEL_28:
      *(_WORD *)(a5 + a3 + 2 * a2) = v15;
      goto LABEL_35;
  }
LABEL_32:
  uni_logger_api();
  uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
    sub_262E4EC88(a4, v24);
  }

LABEL_35:
}

uint64_t pixelFormatName(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!v4)
  {
    objc_msgSend_metalDevice(MEMORY[0x263F2EE30], v2, v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      return 0;
    }
  }
  MTLPixelFormatGetInfoForDevice();
  uint64_t v5 = 14;

  return v5;
}

__CFString *shortTextureDescription(void *a1)
{
  id v1 = a1;
  uint64_t v3 = v1;
  if (v1)
  {
    if ((objc_msgSend_conformsToProtocol_(v1, v2, (uint64_t)&unk_270E2A1A0) & 1) == 0) {
      sub_262E4ED3C();
    }
    uint64_t v6 = NSString;
    uint64_t v7 = objc_msgSend_width(v3, v4, v5);
    uint64_t v10 = objc_msgSend_height(v3, v8, v9);
    uint64_t v13 = objc_msgSend_pixelFormat(v3, v11, v12);
    uint64_t v16 = objc_msgSend_device(v3, v14, v15);
    uint64_t v17 = pixelFormatName(v13, v16);
    objc_msgSend_stringWithFormat_(v6, v18, @" <texture = %p, double width = %ld, height = %ld, format = %s>", v3, v7, v10, v17);
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = @"<texture: nil>";
  }

  return v19;
}

void triggerProgrammaticCapture(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F12800];
  id v2 = a1;
  uint64_t v5 = objc_msgSend_sharedCaptureManager(v1, v3, v4);
  id v6 = objc_alloc_init(MEMORY[0x263F127F0]);
  objc_msgSend_setCaptureObject_(v6, v7, (uint64_t)v2);

  id v17 = 0;
  char started = objc_msgSend_startCaptureWithDescriptor_error_(v5, v8, (uint64_t)v6, &v17);
  id v10 = v17;
  if ((started & 1) == 0)
  {
    uint64_t v11 = uni_logger_api();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_stringWithFormat_(NSString, v12, @"Failed to start capture, error %@", v10);
      id v13 = objc_claimAutoreleasedReturnValue();
      uint64_t v16 = objc_msgSend_UTF8String(v13, v14, v15);
      *(_DWORD *)CGAffineTransform buf = 136446466;
      uint64_t v19 = "triggerProgrammaticCapture";
      __int16 v20 = 2080;
      uint64_t v21 = v16;
      _os_log_impl(&dword_262E0F000, v11, OS_LOG_TYPE_INFO, "%{public}s %s", buf, 0x16u);
    }
  }
}

void stopProgrammaticCapture(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_sharedCaptureManager(MEMORY[0x263F12800], a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopCapture(v5, v3, v4);
}

id parseTXTFile(uint64_t a1, const char *a2)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@/%@", a1, a2);
  uint64_t v4 = objc_msgSend_fileURLWithPath_(NSURL, v3, (uint64_t)v2);
  id v69 = 0;
  id v6 = objc_msgSend_stringWithContentsOfURL_encoding_error_(NSString, v5, (uint64_t)v4, 4, &v69);
  id v7 = v69;

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = 0;
    goto LABEL_38;
  }
  uint64_t v11 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v6, v8, @"'", @"\"");

  char v14 = objc_msgSend_dataUsingEncoding_(v11, v12, 4);
  if (v14)
  {
    id v68 = 0;
    uint64_t v15 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v13, (uint64_t)v14, 0, &v68);
    id v7 = v68;
    if (v15)
    {
      uint64_t v18 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v19 = objc_msgSend_count(v15, v16, v17);
      float v59 = objc_msgSend_dictionaryWithCapacity_(v18, v20, v19);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v21 = v15;
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v64, v71, 16);
      if (v58)
      {
        uint64_t v56 = v4;
        uint64_t v57 = *(void *)v65;
        id v54 = v7;
        uint64_t v55 = v11;
        __int16 v52 = v15;
        uint64_t v53 = v14;
LABEL_10:
        uint64_t v24 = 0;
        uint64_t v26 = v58;
        uint64_t v25 = v59;
        uint64_t v27 = v57;
        while (1)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(v21);
          }
          uint64_t v28 = *(void *)(*((void *)&v64 + 1) + 8 * v24);
          uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v21, v23, v28);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = v29;
            uint64_t v33 = (const char *)objc_msgSend_UTF8String(v30, v31, v32);
            uint64_t v34 = NSNumber;
            double v35 = atof(v33);
            uint64_t v38 = objc_msgSend_numberWithDouble_(v34, v36, v37, v35);
            objc_msgSend_setObject_forKeyedSubscript_(v25, v39, (uint64_t)v38, v28);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v41 = v29;
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                id v42 = v41;
                uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v60, v70, 16);
                if (v44)
                {
                  uint64_t v45 = v44;
                  uint64_t v46 = *(void *)v61;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v45; ++i)
                    {
                      if (*(void *)v61 != v46) {
                        objc_enumerationMutation(v42);
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {

                        uint64_t v25 = v59;
                        goto LABEL_34;
                      }
                    }
                    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v48, (uint64_t)&v60, v70, 16);
                    if (v45) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v25 = v59;
                objc_msgSend_setObject_forKeyedSubscript_(v59, v49, (uint64_t)v42, v28);

                uint64_t v27 = v57;
                uint64_t v26 = v58;
                goto LABEL_28;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
LABEL_34:

                id v10 = 0;
                uint64_t v50 = v25;
                uint64_t v11 = v55;
                uint64_t v4 = v56;
                char v14 = v53;
                id v7 = v54;
                uint64_t v15 = v52;
                goto LABEL_35;
              }
            }
            objc_msgSend_setObject_forKeyedSubscript_(v25, v40, (uint64_t)v29, v28);
          }
LABEL_28:

          if (++v24 == v26)
          {
            uint64_t v11 = v55;
            uint64_t v4 = v56;
            char v14 = v53;
            id v7 = v54;
            uint64_t v15 = v52;
            uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v64, v71, 16);
            if (v58) {
              goto LABEL_10;
            }
            break;
          }
        }
      }

      uint64_t v50 = v59;
      id v10 = v59;
LABEL_35:
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v7 = 0;
    id v10 = 0;
  }

  id v6 = v11;
LABEL_38:

  return v10;
}

id rootTexture(void *a1)
{
  id v1 = a1;

  return v1;
}

float convertFloatToF16AsUshort(float result)
{
  __asm { FCVT            H0, S0 }
  return result;
}

void sub_262E48A08()
{
}

void sub_262E48A34()
{
}

void sub_262E48A60()
{
}

void sub_262E48A8C()
{
}

void sub_262E48AB8()
{
}

void sub_262E48AE4()
{
}

void sub_262E48B10()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 634, "(2 == [_fgSegmentArray count])");
}

void sub_262E48B3C()
{
}

void sub_262E48B68()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 628, "(2 == [_segmentArray count])");
}

void sub_262E48B94()
{
}

void sub_262E48BC0()
{
}

void sub_262E48BEC()
{
}

void sub_262E48C18()
{
}

void sub_262E48C44()
{
}

void sub_262E48C70()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 838, "(2 == [_fgSegmentArray count])");
}

void sub_262E48C9C()
{
}

void sub_262E48CC8()
{
}

void sub_262E48CF4()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 824, "(2 == [_segmentArray count])");
}

void sub_262E48D20()
{
}

void sub_262E48D4C()
{
}

void sub_262E48D78()
{
}

void sub_262E48DA4()
{
}

void sub_262E48DD0()
{
}

void sub_262E48DFC()
{
}

void sub_262E48E28()
{
}

void sub_262E48E54()
{
}

void sub_262E48E80()
{
}

void sub_262E48EAC()
{
}

void sub_262E48ED8()
{
}

void sub_262E48F04()
{
}

void sub_262E48F30()
{
}

void sub_262E48F5C()
{
}

void sub_262E48F88()
{
}

void sub_262E48FB4()
{
}

void sub_262E48FE0()
{
}

void sub_262E4900C()
{
}

void sub_262E49038()
{
}

void sub_262E49064()
{
}

void sub_262E49090()
{
}

void sub_262E490BC()
{
}

void sub_262E490E8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  id v2 = "-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:i"
       "nputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]";
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "%{public}s Unable to get headroom from inputGainmap.", (uint8_t *)&v1, 0xCu);
}

void sub_262E4916C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  id v2 = "-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:i"
       "nputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]";
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "%{public}s Gainmap version or FlexMap version is invalid for a v7+ SDOF config.", (uint8_t *)&v1, 0xCu);
}

void sub_262E491F0()
{
}

void sub_262E4921C()
{
}

void sub_262E49248()
{
}

void sub_262E49274()
{
}

void sub_262E492A0()
{
}

void sub_262E492CC()
{
}

void sub_262E492F8()
{
}

void sub_262E49324()
{
}

void sub_262E49350()
{
}

void sub_262E4937C()
{
}

void sub_262E493A8()
{
}

void sub_262E493D4()
{
}

void sub_262E49400()
{
}

void sub_262E4942C()
{
}

void sub_262E49458()
{
}

void sub_262E49484()
{
}

void sub_262E494B0()
{
}

void sub_262E494DC()
{
}

void sub_262E49508()
{
}

void sub_262E49534()
{
}

void sub_262E49560()
{
}

void sub_262E4958C()
{
}

void sub_262E495B8()
{
}

void sub_262E495E4()
{
}

void sub_262E49610()
{
}

void sub_262E4963C()
{
}

void sub_262E49668()
{
}

void sub_262E49694()
{
}

void sub_262E496C0()
{
}

void sub_262E496EC()
{
}

void sub_262E49718()
{
}

void sub_262E49744()
{
}

void sub_262E49770()
{
}

void sub_262E4979C()
{
}

void sub_262E497C8()
{
}

void sub_262E497F4()
{
}

void sub_262E49820()
{
}

void sub_262E4984C()
{
}

void sub_262E49878()
{
}

void sub_262E498A4()
{
}

void sub_262E498D0()
{
}

void sub_262E498FC()
{
}

void sub_262E49928()
{
}

void sub_262E49954()
{
}

void sub_262E49980()
{
}

void sub_262E499AC()
{
}

void sub_262E499D8()
{
}

void sub_262E49A04()
{
}

void sub_262E49A30()
{
}

void sub_262E49A5C()
{
}

void sub_262E49A88()
{
}

void sub_262E49AB4()
{
}

void sub_262E49AE0()
{
}

void sub_262E49B0C()
{
}

void sub_262E49B38()
{
}

void sub_262E49B64()
{
}

void sub_262E49B90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_262E49C08()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 910, "2 == [imageExtents count]");
}

void sub_262E49C34()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 908, "([inputParams isKindOfClass:[NSData class]] && ((NSData *)inputParams).length == sizeof(simple_lens_model_params_t)) || [inputParams isKindOfClass:[NSDictionary class]]");
}

void sub_262E49C60()
{
}

void sub_262E49C8C()
{
}

void sub_262E49CB8()
{
}

void sub_262E49CE4()
{
}

void sub_262E49D10()
{
}

void sub_262E49D3C()
{
}

void sub_262E49D68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_262E49DE0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 970, "2 == [imageExtents count]");
}

void sub_262E49E0C()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 968, "([inputParams isKindOfClass:[NSData class]] && ((NSData *)inputParams).length == sizeof(simple_lens_model_params_t)) || [inputParams isKindOfClass:[NSDictionary class]]");
}

void sub_262E49E38()
{
}

void sub_262E49E64()
{
}

void sub_262E49E90()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_5", "MakeBlurMap.m", 1140, "[data length] == sizeof(face_mask_params_t)");
}

void sub_262E49EBC()
{
}

void sub_262E49EE8()
{
}

void sub_262E49F14()
{
}

void sub_262E49F40()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_9", "MakeBlurMap.m", 1284, "[data length] == sizeof(face_mask_params_t)");
}

void sub_262E49F6C()
{
}

void sub_262E49F98()
{
}

void sub_262E49FC4()
{
}

void sub_262E49FF0()
{
}

void sub_262E4A01C()
{
}

void sub_262E4A048()
{
}

void sub_262E4A074()
{
}

void sub_262E4A0A0()
{
}

void sub_262E4A0CC()
{
}

void sub_262E4A0F8()
{
}

void sub_262E4A124()
{
}

void sub_262E4A150()
{
}

void sub_262E4A17C()
{
}

void sub_262E4A1A8()
{
}

void sub_262E4A1D4()
{
}

void sub_262E4A200()
{
}

void sub_262E4A22C()
{
}

void sub_262E4A258()
{
}

void sub_262E4A284()
{
}

void sub_262E4A2B0()
{
}

void sub_262E4A2DC()
{
}

void sub_262E4A308(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_262E4A380()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1605, "3 == [imageExtents count]");
}

void sub_262E4A3AC()
{
}

void sub_262E4A3D8()
{
}

void sub_262E4A404()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1638, "imageExtents && 2 == [imageExtents count]");
}

void sub_262E4A430(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_262E4A4A8()
{
}

void sub_262E4A4D4(int a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = 136446978;
  uint64_t v3 = "-[MakeBlurMap performDisparityRefinementViaMatting:inputShiftmap:focusRect:inputLuma:inputChroma:simpleLensModelC"
       "alculatorImage:disparityConfigIndex:outputRefinedImage:tmpRGB:tmpDisparity:tmpRGBA:SDOFVersion:mattingParams:context:]";
  __int16 v4 = 2080;
  id v5 = "Invalid config index for disparity refinement: ";
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 2080;
  BOOL v9 = "; must be in 1..6 range";
  _os_log_error_impl(&dword_262E0F000, a2, OS_LOG_TYPE_ERROR, "%{public}s %s%d%s", (uint8_t *)&v2, 0x26u);
}

void sub_262E4A584()
{
}

void sub_262E4A5B0()
{
}

void sub_262E4A5DC()
{
}

void sub_262E4A608(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_262E4A680(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_262E4A6F8()
{
}

void sub_262E4A724()
{
}

void sub_262E4A750()
{
}

void sub_262E4A77C()
{
}

void sub_262E4A7A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_262E4A820(void *a1, char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_msgSend_description(a1, a2, a3);
  id v4 = objc_claimAutoreleasedReturnValue();
  int v7 = 136446466;
  __int16 v8 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
  __int16 v9 = 2080;
  uint64_t v10 = objc_msgSend_UTF8String(v4, v5, v6);
  _os_log_debug_impl(&dword_262E0F000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "%{public}s Unable to create texture %s", (uint8_t *)&v7, 0x16u);
}

void sub_262E4A8D4()
{
}

void sub_262E4A900()
{
}

void sub_262E4A92C()
{
  __assert_rtn("-[MakeBlurMap enqueueRefinementUsingParams:maskParams:inputBlurMap:inputAlpha:inputHair:inputGlasses:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:outputBlurMap:scale:inputsAlreadyScaled:context:]", "MakeBlurMap.m", 2874, "tmpTextures && tmpTextures.count == numTexturesNeeded");
}

void sub_262E4A958()
{
}

void sub_262E4A984()
{
}

void sub_262E4A9B0()
{
}

void sub_262E4A9DC()
{
}

void sub_262E4AA08()
{
}

void sub_262E4AA34()
{
}

void sub_262E4AA60()
{
}

void sub_262E4AA8C()
{
}

void sub_262E4AAB8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "Reference dimensions of Camera Calibration Data inconsistent with Intrinsic Matrix", v1, 2u);
}

void sub_262E4AAFC()
{
}

void sub_262E4AB28()
{
}

void sub_262E4AB54()
{
}

void sub_262E4AB80()
{
}

void sub_262E4ABAC()
{
}

void sub_262E4ABD8()
{
}

void sub_262E4AC04()
{
}

void sub_262E4AC30()
{
}

void sub_262E4AC5C()
{
}

void sub_262E4AC88()
{
}

void sub_262E4ACB4()
{
}

void sub_262E4ACE0()
{
}

void sub_262E4AD0C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "%{public}s could not execute the Hairnet model.", (uint8_t *)&v1, 0xCu);
}

void sub_262E4AD90(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not bind 'output_residual' to the Hairnet model.", a1);
}

void sub_262E4ADD4(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not bind 'input_alpha' to the Hairnet model.", a1);
}

void sub_262E4AE18(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not bind 'input_mask' to the Hairnet model.", a1);
}

void sub_262E4AE5C(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not bind 'input_corrupted' to the Hairnet model.", a1);
}

void sub_262E4AEA0(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not bind 'input_ref' to the Hairnet model.", a1);
}

void sub_262E4AEE4(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not build the Hairnet model.", a1);
}

void sub_262E4AF28(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not create the output CVPixelBuffer for the Hairnet model.", a1);
}

void sub_262E4AF6C(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_262E29F98(&dword_262E0F000, (int)a2, a3, "%{public}s could not create an input CVPixelBuffer for the Hairnet model.", a1);
}

void sub_262E4AFB0()
{
  __assert_rtn("CreateMTLTexture", "HairnetProcessor.m", 73, "IOSurfaceGetPixelFormat(pb) == kCVPixelFormatType_OneComponent16Half");
}

void sub_262E4AFDC(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]_block_invoke";
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "%{public}s failed to execute the Hairnet model.", (uint8_t *)&v1, 0xCu);
}

void sub_262E4B060()
{
}

void sub_262E4B08C()
{
}

void sub_262E4B0B8()
{
}

void sub_262E4B0E4()
{
}

void sub_262E4B110(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 7;
  _os_log_debug_impl(&dword_262E0F000, log, OS_LOG_TYPE_DEBUG, "Missing FG/BG Dilation size param, using default = %d", (uint8_t *)v1, 8u);
}

void sub_262E4B190()
{
  sub_262E2C728();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing FG/BG Threshold param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B204(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing FG Dead Zone offset param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B274()
{
  sub_262E2C708();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing FG Blur Clamp param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B2E0()
{
  sub_262E2C708();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing FG Blur Scale param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B34C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing CI bicubic downsample param C, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B3C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing CI bicubic downsample param B, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B430(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing FG Anti-Aliasing radius, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B4A4()
{
  sub_262E2C718();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing FG weight smoothstep end param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B518(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing FG weight smoothstep start param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B58C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing FG alpha smoothstep end param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B5FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing FG alpha smoothstep start param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B670()
{
  sub_262E2C708();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing FG hit threshold param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B6DC()
{
  sub_262E2C708();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing FG trace step scale param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet chroma blur sigma param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B7BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet chroma weight param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B838(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask final dilation param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B8B0()
{
  sub_262E2C718();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing hairnet mask beard oval eccentricity param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4B924(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask beard oval width factor param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4B998()
{
  sub_262E2C728();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing hairnet mask blur map sharp threshold param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4BA0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask blur map blur sigma param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4BA88()
{
  sub_262E2C728();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing hairnet mask glasses threshold param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4BAFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask glasses blur sigma param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4BB78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask hair threshold param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4BBF4()
{
  sub_262E2C738();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing hairnet mask hair blur sigma param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4BC60()
{
  sub_262E2C718();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing hairnet mask alpha threshold high param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4BCD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask alpha threshold low param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4BD50()
{
  sub_262E2C738();
  sub_262E2C6EC(&dword_262E0F000, v0, v1, "Missing hairnet mask alpha blur sigma param, using default = %g", v2, v3, v4, v5, v6);
}

void sub_262E4BDBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask blur map threshold param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4BE38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_262E2C6EC(&dword_262E0F000, a1, a3, "Missing hairnet mask gmac threshold param, using default = %g", a5, a6, a7, a8, 0);
}

void sub_262E4BEAC()
{
}

void sub_262E4BED8()
{
}

void sub_262E4BF04()
{
}

void sub_262E4BF30()
{
}

void sub_262E4BF5C()
{
}

void sub_262E4BF88()
{
}

void sub_262E4BFB4()
{
}

void sub_262E4BFE0()
{
}

void sub_262E4C00C()
{
}

void sub_262E4C038()
{
}

void sub_262E4C064()
{
}

void sub_262E4C090()
{
}

void sub_262E4C0BC()
{
}

void sub_262E4C0E8()
{
}

void sub_262E4C114()
{
}

void sub_262E4C140()
{
}

void sub_262E4C16C()
{
}

void sub_262E4C198()
{
}

void sub_262E4C1C4()
{
}

void sub_262E4C1F0()
{
}

void sub_262E4C21C()
{
}

void sub_262E4C248()
{
}

void sub_262E4C274()
{
}

void sub_262E4C2A0()
{
}

void sub_262E4C2CC()
{
}

void sub_262E4C2F8()
{
}

void sub_262E4C324()
{
}

void sub_262E4C350()
{
}

void sub_262E4C37C()
{
}

void sub_262E4C3A8()
{
}

void sub_262E4C3D4()
{
}

void sub_262E4C400(uint64_t a1, const char *a2)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"%@ Unable to get value for key %@");
  id v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_262E2F530();
  sub_262E2F544(&dword_262E0F000, v5, v6, "%{public}s %s", v7, v8, v9, v10, a1, (uint64_t)a2, 2u);
}

void sub_262E4C4B0(uint64_t a1, const char *a2)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"Don't know how to set key %@ on filter %@");
  id v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_262E2F530();
  sub_262E2F544(&dword_262E0F000, v5, v6, "%{public}s %s", v7, v8, v9, v10, a1, (uint64_t)a2, 2u);
}

void sub_262E4C560()
{
}

void sub_262E4C58C()
{
}

void sub_262E4C5B8()
{
}

void sub_262E4C5E4()
{
}

void sub_262E4C610()
{
}

void sub_262E4C63C()
{
}

void sub_262E4C668()
{
}

void sub_262E4C694()
{
}

void sub_262E4C6C0()
{
}

void sub_262E4C6EC()
{
}

void sub_262E4C718()
{
}

void sub_262E4C744()
{
}

void sub_262E4C770()
{
}

void sub_262E4C79C()
{
}

void sub_262E4C7C8(uint64_t a1, char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_msgSend_stringWithFormat_(NSString, a2, @"Don't know how to handle MPS filter with name %@", a1);
  id v3 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)CGAffineTransform buf = 136446466;
  int v7 = "+[UniDeviceCache findKernel:device:]";
  __int16 v8 = 2080;
  uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_262E0F000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);
}

void sub_262E4C898()
{
}

void sub_262E4C8C4()
{
}

void sub_262E4C8F0(id *a1)
{
  id v1 = *a1;
  objc_msgSend_UTF8String(v1, v2, v3);
  sub_262E3148C();
  sub_262E3146C(&dword_262E0F000, v4, v5, "%{public}s Failed finding the Metal library for %s", v6, v7, v8, v9, 2u);
}

void sub_262E4C97C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "CI Metal library does not contain ANY functions; this is likely a problem.";
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v1, 0xCu);
}

void sub_262E4CA00(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = objc_msgSend_description(a2, (const char *)a2, a3);
  sub_262E3146C(&dword_262E0F000, v3, v4, "Error creating CIKernel: %@, err:%@", v5, v6, v7, v8, 2u);
}

void sub_262E4CAA4(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a1;
  int v6 = 136315138;
  uint64_t v7 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_262E0F000, a2, OS_LOG_TYPE_ERROR, "CoreImage Metal library does not contain function for name: %s", (uint8_t *)&v6, 0xCu);
}

void sub_262E4CB34(id *a1)
{
  id v1 = *a1;
  objc_msgSend_UTF8String(v1, v2, v3);
  sub_262E3148C();
  sub_262E3146C(&dword_262E0F000, v4, v5, "%{public}s Failed finding the Metal library for %s", v6, v7, v8, v9, 2u);
}

void sub_262E4CBC0()
{
}

void sub_262E4CBEC()
{
}

void sub_262E4CC18()
{
}

void sub_262E4CC44()
{
}

void sub_262E4CC70()
{
}

void sub_262E4CC9C()
{
}

void sub_262E4CCC8()
{
}

void sub_262E4CCF4()
{
}

void sub_262E4CD20()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_class();
  objc_msgSend_description(v0, v1, v2);
  id v3 = objc_claimAutoreleasedReturnValue();
  int v8 = 136446466;
  uint64_t v9 = "-[UniGuidedFilter initWithDevice:]";
  __int16 v10 = 2080;
  uint64_t v11 = objc_msgSend_UTF8String(v3, v4, v5);
  sub_262E336E4(&dword_262E0F000, v6, v7, "%{public}s Unable to load bundle for class: %s and hence associated function: _combineRGBAndAlpha", (uint8_t *)&v8);
}

void sub_262E4CDD0()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  sub_262E33700();
  _os_log_error_impl(&dword_262E0F000, v0, OS_LOG_TYPE_ERROR, "%{public}s Error = %@", (uint8_t *)v1, 0x16u);
}

void sub_262E4CE50()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  os_log_t v0 = objc_opt_class();
  id v3 = objc_msgSend_description(v0, v1, v2);
  v6[0] = 136446466;
  sub_262E33700();
  sub_262E336E4(&dword_262E0F000, v4, v5, "%{public}s Unable to load library for class %@ and hence associated function: _combineRGBAndAlpha", (uint8_t *)v6);
}

void sub_262E4CEEC()
{
}

void sub_262E4CF18()
{
}

void sub_262E4CF44()
{
}

void sub_262E4CF70()
{
}

void sub_262E4CF9C()
{
}

void sub_262E4CFC8()
{
}

void sub_262E4CFF4()
{
}

void sub_262E4D020()
{
}

void sub_262E4D04C()
{
}

void sub_262E4D078()
{
}

void sub_262E4D0A4()
{
}

void sub_262E4D0D0()
{
}

void sub_262E4D0FC()
{
}

void sub_262E4D128()
{
}

void sub_262E4D154()
{
}

void sub_262E4D180()
{
}

void sub_262E4D1AC()
{
}

void sub_262E4D1D8(uint64_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_msgSend_stringWithFormat_(NSString, a2, @"Error running guided filter: %@", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  int v7 = 136446466;
  int v8 = "-[UniGuidedFilter outputImage:]";
  __int16 v9 = 2080;
  uint64_t v10 = objc_msgSend_UTF8String(v2, v3, v4);
  sub_262E336E4(&dword_262E0F000, v5, v6, "%{public}s %s", (uint8_t *)&v7);
}

void sub_262E4D298()
{
}

void sub_262E4D2C4()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 315, "halfResTex1.width <= temporaryTexture.width");
}

void sub_262E4D2F0()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 316, "halfResTex1.height <= temporaryTexture.height");
}

void sub_262E4D31C()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 369, "[dynamicParams length] == sizeof(params)");
}

void sub_262E4D348()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 347, "MTLPixelFormatFlagsIsCompressed != (halfResTex2Info.flags & MTLPixelFormatFlagsIsCompressed)");
}

void sub_262E4D374()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 343, "MTLPixelFormatFlagsIsCompressed != (halfResTex1Info.flags & MTLPixelFormatFlagsIsCompressed)");
}

void sub_262E4D3A0()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 317, "halfResTex1.pixelFormat == temporaryTexture.pixelFormat");
}

void sub_262E4D3CC()
{
}

void sub_262E4D3F8()
{
}

void sub_262E4D424()
{
}

void sub_262E4D450()
{
}

void sub_262E4D47C(uint8_t *a1, const char *a2, uint64_t *a3, NSObject *a4)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"Running %lu'th kernel", a2);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_UTF8String(v7, v8, v9);
  *(_DWORD *)a1 = 136315138;
  *a3 = v10;
  _os_log_debug_impl(&dword_262E0F000, a4, OS_LOG_TYPE_DEBUG, "%s", a1, 0xCu);
}

void sub_262E4D514()
{
}

void sub_262E4D540()
{
}

void sub_262E4D56C()
{
}

void sub_262E4D598()
{
}

void sub_262E4D5C4()
{
}

void sub_262E4D5F0()
{
}

void sub_262E4D61C()
{
}

void sub_262E4D648()
{
}

void sub_262E4D674(uint64_t a1, const char *a2)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"For function %@ you need to set the following function constants as well: %@");
  id v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_262E415DC();
  sub_262E4159C(&dword_262E0F000, v5, v6, "%s", v7, v8, v9, v10, a1, (uint64_t)a2, v13);
}

void sub_262E4D718()
{
}

void sub_262E4D744()
{
  __assert_rtn("-[UniKernelInternal _dictToConstants:functionConstants:name:]", "UniKernel.m", 155, "a && [a isKindOfClass:[NSArray class]] && a.count == nComp");
}

void sub_262E4D770()
{
}

void sub_262E4D79C(uint64_t a1, const char *a2)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"Error creating function: %@");
  id v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_262E415DC();
  sub_262E4159C(&dword_262E0F000, v5, v6, "%s", v7, v8, v9, v10, a1, v12, v13);
}

void sub_262E4D840()
{
}

void sub_262E4D86C(uint64_t a1, const char *a2)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"missing some struct parameters: %@");
  id v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_262E415DC();
  sub_262E4159C(&dword_262E0F000, v5, v6, "%s", v7, v8, v9, v10, a1, v12, v13);
}

void sub_262E4D910()
{
}

void sub_262E4D93C()
{
}

void sub_262E4D968()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 764, "cType && 1 == strlen(cType)");
}

void sub_262E4D994(char *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = 136446466;
  uint64_t v4 = "-[UniKernel _setNumber:forEncoder:atIndex:]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_262E0F000, a2, OS_LOG_TYPE_ERROR, "%{public}s Unable to set obj-c value for this type of NSNumber: %c", (uint8_t *)&v3, 0x12u);
}

void sub_262E4DA24()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 804, "[n longValue] <= 0x7fffffff");
}

void sub_262E4DA50()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 809, "[n longLongValue] <= 0x7fffffff");
}

void sub_262E4DA7C()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 818, "[n unsignedLongValue] <= 0xffffffffU");
}

void sub_262E4DAA8()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 823, "[n unsignedLongLongValue] <= 0xffffffffU");
}

void sub_262E4DAD4()
{
}

void sub_262E4DB00()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1143, "MTLArgumentAccessReadWrite != arg.access");
}

void sub_262E4DB2C()
{
  sub_262E41600();
  int v2 = NSString;
  objc_msgSend_name(v3, v4, v5);
  objc_claimAutoreleasedReturnValue();
  int v6 = (void *)sub_262E415F4();
  int v9 = objc_msgSend_kernel(v6, v7, v8);
  uint64_t v12 = objc_msgSend_mk(v9, v10, v11);
  objc_msgSend_label(v12, v13, v14);
  objc_claimAutoreleasedReturnValue();
  sub_262E415E8();
  objc_msgSend_stringWithFormat_(v2, v15, @"Unable to set object on encoder for argument %@ on kernel %@");
  id v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v16, v17, v18);
  sub_262E2F530();
  sub_262E415BC(&dword_262E0F000, v19, v20, "%{public}s %s", v21, v22, v23, v24, v25, v26, 2u);
}

void sub_262E4DC28()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1237, "((id<MTLBuffer>)data).length == [arg bufferDataSize]");
}

void sub_262E4DC54()
{
}

void sub_262E4DC80()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1241, "data.length == [arg bufferDataSize]");
}

void sub_262E4DCAC()
{
  sub_262E41600();
  int v2 = NSString;
  objc_msgSend_name(v3, v4, v5);
  objc_claimAutoreleasedReturnValue();
  int v6 = (void *)sub_262E415F4();
  int v9 = objc_msgSend_kernel(v6, v7, v8);
  uint64_t v12 = objc_msgSend_mk(v9, v10, v11);
  objc_msgSend_label(v12, v13, v14);
  objc_claimAutoreleasedReturnValue();
  sub_262E415E8();
  objc_msgSend_stringWithFormat_(v2, v15, @"Expected either NSData, a MTLBuffer or a NSDictionary for argument %@ on kernel %@");
  id v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v16, v17, v18);
  sub_262E2F530();
  sub_262E415BC(&dword_262E0F000, v19, v20, "%{public}s %s", v21, v22, v23, v24, v25, v26, 2u);
}

void sub_262E4DDA8()
{
}

void sub_262E4DDD4()
{
}

void sub_262E4DE00()
{
}

void sub_262E4DE2C(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "Don't know how to handle mtl pixel format ";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  uint64_t v8 = pixelFormatName(a1, 0);
  _os_log_error_impl(&dword_262E0F000, a2, OS_LOG_TYPE_ERROR, "%s%lu (%s)", (uint8_t *)&v3, 0x20u);
}

void sub_262E4DEE0()
{
  __assert_rtn("+[UniKernel _outputTextureForTexture:force:]", "UniKernel.m", 1492, "MTLTextureUsagePixelFormatView == (texture.usage & MTLTextureUsagePixelFormatView)");
}

void sub_262E4DF0C()
{
  __assert_rtn("+[UniKernel _outputTextureForTexture:force:]", "UniKernel.m", 1515, "MTLPixelFormatInvalid != newFormat");
}

void sub_262E4DF38(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "Unable to get CIImage for inputImage", v1, 2u);
}

void sub_262E4DF7C()
{
}

void sub_262E4DFA8(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  __int16 v5 = NSString;
  uint64_t v6 = objc_msgSend_kernel(a1, a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_mk(v6, v7, v8);
  uint64_t v12 = objc_msgSend_label(v9, v10, v11);
  objc_msgSend_stringWithFormat_(v5, v13, @"output texture %@ missing for kernel %@", a2, v12);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v14, v15, v16);
  *(_DWORD *)CGAffineTransform buf = 136446466;
  sub_262E2F530();
  _os_log_error_impl(&dword_262E0F000, a3, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);
}

void sub_262E4E0AC()
{
  sub_262E41600();
  int v2 = NSString;
  objc_msgSend_name(v3, v4, v5);
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)sub_262E415F4();
  uint64_t v9 = objc_msgSend_kernel(v6, v7, v8);
  uint64_t v12 = objc_msgSend_mk(v9, v10, v11);
  objc_msgSend_label(v12, v13, v14);
  objc_claimAutoreleasedReturnValue();
  sub_262E415E8();
  objc_msgSend_stringWithFormat_(v2, v15, @"output buffer %@ missing for kernel %@");
  id v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v16, v17, v18);
  sub_262E2F530();
  sub_262E415BC(&dword_262E0F000, v19, v20, "%{public}s %s", v21, v22, v23, v24, v25, v26, 2u);
}

void sub_262E4E1A8()
{
}

void sub_262E4E1D4()
{
}

void sub_262E4E200(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262E0F000, a2, OS_LOG_TYPE_ERROR, "Argument at index %lu for kernel not set; returning empty image",
    (uint8_t *)&v2,
    0xCu);
}

void sub_262E4E278(uint64_t a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)CGAffineTransform buf = 136315394;
  *(void *)(buf + 4) = "unable to create object for argument with name ";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "%s%s", buf, 0x16u);
}

void sub_262E4E2E4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262E0F000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
}

void sub_262E4E35C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_262E0F000, log, OS_LOG_TYPE_ERROR, "Unhandled argument type by Core Image", v1, 2u);
}

void sub_262E4E3A0()
{
}

void sub_262E4E3CC()
{
}

void sub_262E4E3F8()
{
}

void sub_262E4E424()
{
}

void sub_262E4E450()
{
}

void sub_262E4E47C(uint8_t *a1, id a2, uint64_t *a3, NSObject *a4)
{
  id v7 = a2;
  uint64_t v10 = objc_msgSend_UTF8String(v7, v8, v9);
  *(_DWORD *)a1 = 136315138;
  *a3 = v10;
  _os_log_error_impl(&dword_262E0F000, a4, OS_LOG_TYPE_ERROR, "Don't know how to set value for key %s because it is nil", a1, 0xCu);
}

void sub_262E4E4EC(NSObject *a1, const char *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 136446466;
  uint64_t v5 = "-[UniLibrary initWithDevice:metalOnly:]";
  __int16 v6 = 2080;
  uint64_t v7 = objc_msgSend_UTF8String(0, a2, a3);
  _os_log_error_impl(&dword_262E0F000, a1, OS_LOG_TYPE_ERROR, "%{public}s Unable to open %s metal libary", (uint8_t *)&v4, 0x16u);
}

void sub_262E4E590(uint64_t a1, char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_msgSend_stringWithFormat_(NSString, a2, @"Error compiling library: %@", a1);
  id v3 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)CGAffineTransform buf = 136446466;
  uint64_t v7 = "-[UniLibrary initWithDevice:metalOnly:]";
  __int16 v8 = 2080;
  uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_262E0F000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);
}

void sub_262E4E65C()
{
}

void sub_262E4E688()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 268, "0 != threadsPerThreadGroup.width");
}

void sub_262E4E6B4()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 269, "0 != threadsPerThreadGroup.height");
}

void sub_262E4E6E0()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 270, "0 != threadsPerThreadGroup.depth");
}

void sub_262E4E70C()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 280, "0 != threadsPerGrid.width || 0 != threadgroupsPerGrid.width");
}

void sub_262E4E738()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 281, "0 != threadsPerGrid.height || 0 != threadgroupsPerGrid.height");
}

void sub_262E4E764()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 282, "0 != threadsPerGrid.depth || 0 != threadgroupsPerGrid.depth");
}

void sub_262E4E790()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 285, "0 != threadsPerGrid.width");
}

void sub_262E4E7BC()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 286, "0 != threadsPerGrid.height");
}

void sub_262E4E7E8()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 287, "0 != threadsPerGrid.depth");
}

void sub_262E4E814()
{
}

void sub_262E4E840()
{
}

void sub_262E4E86C()
{
}

void sub_262E4E898()
{
}

void sub_262E4E8C4()
{
}

void sub_262E4E8F0()
{
  os_log_t v0 = objc_opt_class();
  objc_msgSend_description(v0, v1, v2);
  id v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v3, v4, v5);
  objc_msgSend_UTF8String(@"bilinearResampling", v6, v7);
  sub_262E44ED0(&dword_262E0F000, v8, v9, "%{public}s Unable to load bundle for class: %s and hence associated function: %s", v10, v11, v12, v13, 2u);
}

void sub_262E4E9B8(void *a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_functionNames(a1, a2, a3);
  objc_msgSend_description(v3, v4, v5);
  id v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v6, v7, v8);
  sub_262E44ED0(&dword_262E0F000, v9, v10, "%{public}s Unable to create function %@; must be one of %s",
    v11,
    v12,
    v13,
    v14,
    2u);
}

void sub_262E4EA88()
{
}

void sub_262E4EAB4()
{
  __assert_rtn("-[UniTextureView sibling:]", "UniTextureView.m", 52, "MTLTextureUsagePixelFormatView == (texture.usage & MTLTextureUsagePixelFormatView)");
}

void sub_262E4EAE0()
{
  __assert_rtn("-[UniTextureView sibling:]", "UniTextureView.m", 101, "MTLPixelFormatInvalid != newFormat");
}

void sub_262E4EB0C()
{
}

void sub_262E4EB38()
{
}

void sub_262E4EB64()
{
  __assert_rtn("-[UniTextureView run:]", "UniTextureView.m", 146, "t.pixelFormat != texture.pixelFormat");
}

void sub_262E4EB90()
{
}

void sub_262E4EBBC(uint64_t a1, char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_msgSend_stringWithFormat_(NSString, a2, @"Unsupported desired format for use with Core Image: %@", a1);
  id v3 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)CGAffineTransform buf = 136446466;
  uint64_t v7 = "-[UniTextureView outputImage:]";
  __int16 v8 = 2080;
  uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_262E0F000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);
}

void sub_262E4EC88(uint64_t a1, char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  MTLDataTypeAsString(a1, a2);
  id v3 = objc_claimAutoreleasedReturnValue();
  int v6 = 136446466;
  uint64_t v7 = "packSingleValue";
  __int16 v8 = 2080;
  uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_262E0F000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s Don't know how to pack object of type %s", (uint8_t *)&v6, 0x16u);
}

void sub_262E4ED3C()
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4F68](metadata, parent, path);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x270EF4FD8](tag);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x270F28038]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x270F280C8]();
}

uint64_t espresso_plan_submit_set_multiple_buffering()
{
  return MEMORY[0x270F280D0]();
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}