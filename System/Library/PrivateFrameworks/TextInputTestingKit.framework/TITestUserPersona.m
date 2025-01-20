@interface TITestUserPersona
- (CGPoint)userPointForKey:(id)a3;
- (NSDictionary)personaData;
- (NSMutableDictionary)cachedKeyInfo;
- (NSMutableDictionary)keyInfo;
- (TITestUserPersona)initWithPersonaName:(id)a3;
- (UIKBTree)currentKeyplane;
- (void)setCachedKeyInfo:(id)a3;
- (void)setCurrentKeyplane:(id)a3;
- (void)setKeyInfo:(id)a3;
- (void)setPersonaData:(id)a3;
- (void)updateFromKeyplane:(id)a3;
@end

@implementation TITestUserPersona

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKeyInfo, 0);
  objc_storeStrong((id *)&self->_currentKeyplane, 0);
  objc_storeStrong((id *)&self->_personaData, 0);
}

- (void)setCachedKeyInfo:(id)a3
{
}

- (NSMutableDictionary)cachedKeyInfo
{
  return self->_cachedKeyInfo;
}

- (void)setKeyInfo:(id)a3
{
  self->_keyInfo = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)keyInfo
{
  return self->_keyInfo;
}

- (void)setCurrentKeyplane:(id)a3
{
}

- (UIKBTree)currentKeyplane
{
  return self->_currentKeyplane;
}

- (void)setPersonaData:(id)a3
{
}

- (NSDictionary)personaData
{
  return self->_personaData;
}

- (CGPoint)userPointForKey:(id)a3
{
  keyInfo = self->_keyInfo;
  v4 = [a3 name];
  v5 = [(NSMutableDictionary *)keyInfo objectForKey:v4];

  v6 = [v5 errorGenerator];
  [v6 randomPointInDistribution];
  double v8 = v7;
  double v10 = v9;

  v11 = [v5 rotationMatrix];

  if (v11)
  {
    v12 = [v5 rotationMatrix];
    objc_msgSend(v12, "transformedPoint:", v8, v10);
    double v8 = v13;
    double v10 = v14;
  }
  [v5 center];
  double v16 = v15;
  [v5 center];
  double v18 = v10 + v17;

  double v19 = v8 + v16;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)updateFromKeyplane:(id)a3
{
  v5 = (UIKBTree *)a3;
  if (self->_currentKeyplane != v5)
  {
    objc_storeStrong((id *)&self->_currentKeyplane, a3);
    cachedKeyInfo = self->_cachedKeyInfo;
    double v7 = [(UIKBTree *)self->_currentKeyplane name];
    double v8 = [(NSMutableDictionary *)cachedKeyInfo objectForKey:v7];

    if (!v8)
    {
      v50 = v5;
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      double v10 = self->_cachedKeyInfo;
      v11 = [(UIKBTree *)self->_currentKeyplane name];
      [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];

      v47 = [(UIKBTree *)v5 keys];
      id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v89[0] = 0;
      v89[1] = v89;
      v89[2] = 0x5012000000;
      v89[3] = __Block_byref_object_copy__805;
      v89[4] = __Block_byref_object_dispose__806;
      v89[5] = &unk_23F0564DE;
      long long v13 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v90 = *MEMORY[0x263F001A8];
      long long v91 = v13;
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke;
      v85[3] = &unk_26504FB40;
      id v14 = v9;
      id v86 = v14;
      id v49 = v12;
      id v87 = v49;
      v88 = v89;
      [v47 enumerateObjectsUsingBlock:v85];
      uint64_t v79 = 0;
      v80 = &v79;
      uint64_t v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__32;
      v83 = __Block_byref_object_dispose__33;
      id v84 = 0;
      personaData = self->_personaData;
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_34;
      v76[3] = &unk_26504FB68;
      v77 = v5;
      v78 = &v79;
      [(NSDictionary *)personaData enumerateKeysAndObjectsUsingBlock:v76];
      id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v51 = [(id)v80[5] objectForKey:@"KEYGROUPS"];
      id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v16 = objc_alloc(MEMORY[0x263EFF9C0]);
      double v17 = [v14 allKeys];
      double v18 = (void *)[v16 initWithArray:v17];

      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_2;
      v70[3] = &unk_26504FBE0;
      v75 = v89;
      double v8 = (NSMutableDictionary *)v14;
      v71 = v8;
      id v19 = v18;
      id v72 = v19;
      id v20 = v48;
      id v73 = v20;
      id v21 = v42;
      id v74 = v21;
      v46 = v19;
      [v51 enumerateKeysAndObjectsUsingBlock:v70];
      if ([v19 count]) {
        [v21 setObject:v19 forKey:@"OTHERS"];
      }
      id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v22 = [v21 allKeys];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_5;
      v68[3] = &unk_26504FC08;
      id v23 = v41;
      id v69 = v23;
      [v22 enumerateObjectsUsingBlock:v68];

      v24 = [(id)v80[5] objectForKey:@"AFFINES"];
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_6;
      v64[3] = &unk_26504FC58;
      id v25 = v23;
      id v65 = v25;
      id v26 = v49;
      id v66 = v26;
      id v27 = v20;
      id v67 = v27;
      v45 = v24;
      [v24 enumerateKeysAndObjectsUsingBlock:v64];
      v28 = [(id)v80[5] objectForKey:@"GLOBALS"];
      v44 = [v28 objectForKey:@"STDDEVXAXISPCT"];

      v29 = [(id)v80[5] objectForKey:@"GLOBALS"];
      v43 = [v29 objectForKey:@"STDDEVYAXISPCT"];

      id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_138;
      v58[3] = &unk_26504FC80;
      id v31 = v26;
      id v59 = v31;
      id v32 = v27;
      id v60 = v32;
      id v33 = v30;
      id v61 = v33;
      id v34 = v44;
      id v62 = v34;
      id v35 = v43;
      id v63 = v35;
      [v21 enumerateKeysAndObjectsUsingBlock:v58];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_149;
      v52[3] = &unk_26504FCD0;
      id v36 = v21;
      id v53 = v36;
      id v37 = v25;
      id v54 = v37;
      id v38 = v31;
      id v55 = v38;
      id v39 = v32;
      id v56 = v39;
      id v40 = v33;
      id v57 = v40;
      [(NSMutableDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v52];

      _Block_object_dispose(&v79, 8);
      _Block_object_dispose(v89, 8);

      v5 = v50;
    }
    self->_keyInfo = v8;
  }
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  v5 = objc_alloc_init(TITestUserPersonaKeyInfo);
  [v16 frame];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double MidX = CGRectGetMidX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  -[TITestUserPersonaKeyInfo setCenter:](v5, "setCenter:", MidX, CGRectGetMidY(v19));
  v11 = (void *)a1[4];
  id v12 = [v16 name];
  [v11 setObject:v5 forKey:v12];

  long long v13 = (void *)a1[5];
  id v14 = [v16 name];
  [v13 setObject:v16 forKey:v14];

  uint64_t v15 = *(void *)(a1[6] + 8);
  if (a3)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    *(CGRect *)(*(void *)(a1[6] + 8) + 48) = CGRectUnion(*(CGRect *)(v15 + 48), v20);
  }
  else
  {
    *(CGFloat *)(v15 + 48) = x;
    *(CGFloat *)(v15 + 56) = y;
    *(CGFloat *)(v15 + 64) = width;
    *(CGFloat *)(v15 + 72) = height;
  }
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_34(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  double v8 = [*(id *)(a1 + 32) name];
  int v9 = [v8 containsString:v10];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"OTHERS"])
  {
    fwrite("Invalid key group 'OTHERS' -- keys remaining after grouping is complete will automatically go into the 'OTHERS' group\n", 0x76uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    abort();
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  double v8 = [v6 objectForKey:@"AREA"];

  if (v8)
  {
    int v9 = [v6 objectForKey:@"AREA"];
    id v10 = [v9 objectForKey:@"RECT"];
    v11 = [v9 objectForKey:@"OVAL"];
    id v12 = [v9 objectForKey:@"REFKEYRECT"];
    if (!v12)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Missing REFKEYRECT in area key group '%s'\n", (const char *)[v5 UTF8String]);
      abort();
    }
    if (v10 && v11)
    {
      id v57 = (FILE *)*MEMORY[0x263EF8348];
      [v5 UTF8String];
      fprintf(v57, "Invalid area key group '%s' - both RECT and OVAL specified.\n");
    }
    else
    {
      if (v10)
      {
        long long v13 = [v10 objectForKey:@"TOPPCT"];
        [v13 doubleValue];
        double v15 = v14;

        id v16 = [v10 objectForKey:@"LEFTPCT"];
        [v16 doubleValue];
        double v18 = v17;

        CGRect v19 = [v10 objectForKey:@"HEIGHTPCT"];
        [v19 doubleValue];
        double v21 = v20;

        v22 = [v10 objectForKey:@"WIDTHPCT"];
        [v22 doubleValue];
        double v24 = v23 / 100.0;

        id v25 = *(double **)(*(void *)(a1 + 64) + 8);
        double v26 = v25[8];
        double v27 = v25[9];
        double v28 = v25[6] + v26 * (v18 / 100.0);
        double v29 = v25[7] + v27 * (v15 / 100.0);
        double v30 = v24 * v26;
        double v31 = v21 / 100.0 * v27;
        v77[0] = MEMORY[0x263EF8330];
        v77[1] = 3221225472;
        v77[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_3;
        v77[3] = &unk_26504FB90;
        double v59 = v28;
        double v80 = v28;
        double v81 = v29;
        double v82 = v30;
        double v83 = v31;
        id v32 = *(void **)(a1 + 32);
        id v78 = *(id *)(a1 + 40);
        id v33 = v7;
        id v79 = v33;
        [v32 enumerateKeysAndObjectsUsingBlock:v77];

        id v34 = [v12 objectForKey:@"TOPPCT"];
        [v34 doubleValue];
        double v36 = v35;

        id v37 = [v12 objectForKey:@"LEFTPCT"];
        [v37 doubleValue];
        double v39 = v38;

        id v40 = [v12 objectForKey:@"HEIGHTPCT"];
        [v40 doubleValue];
        double v42 = v41;

        v43 = [v12 objectForKey:@"WIDTHPCT"];
        [v43 doubleValue];
        double v44 = v36 / 100.0;
        double v45 = v42 / 100.0;
        double v47 = v46 / 100.0;

        CGFloat v48 = v59 + v30 * (v39 / 100.0);
        CGFloat v49 = v29 + v31 * v44;
        CGFloat v50 = v30 * v47;
        CGFloat v51 = v31 * v45;
        v84.origin.CGFloat x = v48;
        v84.origin.CGFloat y = v49;
        v84.size.CGFloat width = v50;
        v84.size.CGFloat height = v51;
        CGFloat MidX = CGRectGetMidX(v84);
        v85.origin.CGFloat x = v48;
        v85.origin.CGFloat y = v49;
        v85.size.CGFloat width = v50;
        v85.size.CGFloat height = v51;
        CGFloat MidY = CGRectGetMidY(v85);
        v76[0] = 0;
        v76[1] = v76;
        v76[2] = 0x2020000000;
        v76[3] = 0x7FF0000000000000;
        uint64_t v70 = 0;
        v71 = &v70;
        uint64_t v72 = 0x3032000000;
        id v73 = __Block_byref_object_copy__32;
        id v74 = __Block_byref_object_dispose__33;
        id v75 = 0;
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_4;
        v60[3] = &unk_26504FBB8;
        id v54 = *(id *)(a1 + 32);
        CGFloat v64 = v48;
        CGFloat v65 = v49;
        CGFloat v66 = v50;
        CGFloat v67 = v51;
        CGFloat v68 = MidX;
        CGFloat v69 = MidY;
        id v61 = v54;
        id v62 = v76;
        id v63 = &v70;
        [v33 enumerateObjectsUsingBlock:v60];
        uint64_t v55 = v71[5];
        if (!v55)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "No reference key found in area for key group '%s'\n", (const char *)[v5 UTF8String]);
          abort();
        }
        [*(id *)(a1 + 48) setObject:v55 forKey:v5];

        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(v76, 8);

        goto LABEL_10;
      }
      v58 = (FILE *)*MEMORY[0x263EF8348];
      if (v11)
      {
        fwrite("NYI", 3uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      }
      else
      {
        [v5 UTF8String];
        fprintf(v58, "Invalid area key group '%s' - no RECT or OVAL specified.\n");
      }
    }
    abort();
  }
  id v56 = [v6 objectForKey:@"NAMES"];

  if (v56)
  {
    fwrite("NYI", 3uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    abort();
  }
LABEL_10:
  [*(id *)(a1 + 56) setObject:v7 forKey:v5];
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_alloc_init(TIFitAffineMLLMatrixWrapper);
  [*(id *)(a1 + 32) setObject:v3 forKey:v4];
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKey:v5];
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Invalid AFFINES entry %s: Must match an ASSIGNMENT group.\n", (const char *)[v5 UTF8String]);
    abort();
  }
  double v8 = [v6 objectForKey:@"VALUES"];

  if (v8)
  {
    int v9 = [v6 objectForKey:@"VALUES"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v9 count] != 6)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "VALUES should be an array of 6 numbers in AFFINES entry %s.\n", (const char *)[v5 UTF8String]);
      abort();
    }
    uint64_t v67 = 0;
    CGFloat v68 = &v67;
    uint64_t v69 = 0x5812000000;
    uint64_t v70 = __Block_byref_object_copy__90;
    v71 = __Block_byref_object_dispose__91;
    uint64_t v72 = &unk_23F0564DE;
    TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v73);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_93;
    v64[3] = &unk_26504FC30;
    id v10 = v5;
    id v65 = v10;
    CGFloat v66 = &v67;
    [v9 enumerateObjectsUsingBlock:v64];
    v11 = [*(id *)(a1 + 32) objectForKey:v10];
    [v11 setMatrix:v68 + 6];

    _Block_object_dispose(&v67, 8);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v73[3]);
  }
  else
  {
    id v12 = [v6 objectForKey:@"TRANS"];
    id v62 = v12;
    uint64_t v13 = [v6 objectForKey:@"ROTRAD"];
    if (!v13)
    {
      double v14 = [v6 objectForKey:@"ROTDEG"];
      double v15 = v14;
      if (!v14
        || (id v16 = NSNumber,
            [v14 doubleValue],
            [v16 numberWithDouble:v17 * 3.14159265 / 180.0],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v15,
            !v13))
      {
        double v18 = [v6 objectForKey:@"ROTGRA"];
        CGRect v19 = v18;
        if (v18)
        {
          double v20 = NSNumber;
          [v18 doubleValue];
          uint64_t v13 = [v20 numberWithDouble:v21 * 3.14159265 / 200.0];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
    }
    v22 = [v6 objectForKey:@"SKEWROTRAD"];
    id v63 = (void *)v13;
    if (!v22)
    {
      double v23 = [v6 objectForKey:@"SKEWROTDEG"];
      double v24 = v23;
      if (!v23
        || (id v25 = NSNumber,
            [v23 doubleValue],
            [v25 numberWithDouble:v26 * 3.14159265 / 180.0],
            v22 = objc_claimAutoreleasedReturnValue(),
            v24,
            !v22))
      {
        double v27 = [v6 objectForKey:@"SKEWROTGRA"];
        double v28 = v27;
        if (v27)
        {
          double v29 = NSNumber;
          [v27 doubleValue];
          v22 = [v29 numberWithDouble:v30 * 3.14159265 / 200.0];
        }
        else
        {
          v22 = 0;
        }
      }
    }
    double v31 = [v6 objectForKey:@"SCALE"];
    id v32 = [*(id *)(a1 + 32) objectForKey:v5];
    [v63 doubleValue];
    objc_msgSend(v32, "setRotation:");
    [v22 doubleValue];
    objc_msgSend(v32, "setSkewRotation:");
    if (v12)
    {
      id v33 = [v12 objectForKey:@"XPCT"];
      id v34 = v33;
      if (v33)
      {
        id v35 = v33;
      }
      else
      {
        id v35 = [NSNumber numberWithDouble:0.0];
      }
      double v36 = v35;

      id v37 = [v62 objectForKey:@"YPCT"];
      double v38 = v37;
      if (v37)
      {
        id v39 = v37;
      }
      else
      {
        id v39 = [NSNumber numberWithDouble:0.0];
      }
      id v40 = v39;

      double v41 = *(void **)(a1 + 40);
      double v42 = [*(id *)(a1 + 48) objectForKey:v5];
      v43 = [v41 objectForKey:v42];
      [v43 frame];
      double v45 = v44;
      double v47 = v46;

      [v36 doubleValue];
      double v49 = v48;
      [v40 doubleValue];
      [v32 setXTrans:v45 * (v49 / 100.0) yTrans:v47 * (v50 / 100.0)];

      id v12 = v62;
    }
    if (v31)
    {
      CGFloat v51 = [v31 objectForKey:@"XPCT"];
      v52 = v51;
      if (v51)
      {
        id v53 = v51;
      }
      else
      {
        id v53 = [NSNumber numberWithDouble:100.0];
      }
      id v54 = v53;

      uint64_t v55 = [v31 objectForKey:@"YPCT"];
      id v56 = v55;
      if (v55)
      {
        id v57 = v55;
      }
      else
      {
        id v57 = [NSNumber numberWithDouble:100.0];
      }
      v58 = v57;

      [v54 doubleValue];
      double v60 = v59;
      [v58 doubleValue];
      [v32 setXScale:v60 / 100.0 yScale:v61 / 100.0];

      id v12 = v62;
    }
  }
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_138(uint64_t a1, void *a2)
{
  v20[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) objectForKey:v3];
  id v6 = [v4 objectForKey:v5];

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  v19[0] = @"GAUSSIAN_ERROR_STDDEV_X";
  v11 = NSNumber;
  id v12 = *(void **)(a1 + 48);
  [*(id *)(a1 + 56) doubleValue];
  double v14 = [v11 numberWithDouble:v8 * (v13 / 100.0)];
  v20[0] = v14;
  v19[1] = @"GAUSSIAN_ERROR_STDDEV_Y";
  double v15 = NSNumber;
  [*(id *)(a1 + 64) doubleValue];
  double v17 = [v15 numberWithDouble:v10 * (v16 / 100.0)];
  v19[2] = @"SCALE_ERROR_UNITS_TO_POINTS";
  v20[1] = v17;
  v20[2] = &unk_26F2C9F20;
  double v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v12 setObject:v18 forKey:v3];
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_150;
  v29[3] = &unk_26504FCA8;
  id v8 = v5;
  id v30 = v8;
  double v9 = [v7 keysOfEntriesPassingTest:v29];
  double v10 = [v9 anyObject];
  v11 = [*(id *)(a1 + 40) objectForKey:v10];
  id v12 = *(void **)(a1 + 48);
  double v13 = [*(id *)(a1 + 56) objectForKey:v10];
  double v14 = [v12 objectForKey:v13];

  [v14 frame];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v32);
  [v6 center];
  double v22 = v21;
  [v6 center];
  objc_msgSend(v11, "transformedPoint:", v22 - MidX, v23 - MidY);
  objc_msgSend(v6, "setCenter:", MidX + v24, MidY + v25);
  double v26 = [TIGaussianErrorGenerator alloc];
  double v27 = [*(id *)(a1 + 64) objectForKey:v10];
  double v28 = [(TIGaussianErrorGenerator *)v26 initWithAttributes:v27];

  [v6 setErrorGenerator:v28];
  [v6 setRotationMatrix:v11];
}

uint64_t __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_150(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  *a4 = result;
  return result;
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_93(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "VALUES entry %ld in AFFINES entry %s is not a number or string.\n", a3, (const char *)[*(id *)(a1 + 32) UTF8String]);
    abort();
  }
  [v6 doubleValue];
  *(void *)MEMORY[0x2455C21B0](*(void *)(*(void *)(a1 + 40) + 8) + 48) = v5;
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  CGFloat v8 = *(double *)(a1 + 64);
  CGFloat v9 = *(double *)(a1 + 72);
  [v5 center];
  v14.CGFloat x = v10;
  v14.CGFloat y = v11;
  v15.origin.CGFloat x = v6;
  v15.origin.CGFloat y = v7;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v9;
  if (CGRectContainsPoint(v15, v14) && [*(id *)(a1 + 32) containsObject:v12])
  {
    [*(id *)(a1 + 40) addObject:v12];
    [*(id *)(a1 + 32) removeObject:v12];
  }
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  v13.CGFloat x = v6;
  v13.CGFloat y = v8;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 56), v13))
  {
    double v9 = (v8 - *(double *)(a1 + 96)) * (v8 - *(double *)(a1 + 96))
       + (v6 - *(double *)(a1 + 88)) * (v6 - *(double *)(a1 + 88));
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v9 < *(double *)(v10 + 24))
    {
      *(double *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

- (TITestUserPersona)initWithPersonaName:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TITestUserPersona;
  double v5 = [(TITestUserPersona *)&v18 init];
  if (v5)
  {
    double v6 = __URLWithPersonaForPersonaName(v4);
    double v7 = [v6 pathExtension];
    int v8 = [v7 isEqualToString:@"plist"];

    if (v8)
    {
      uint64_t v9 = [NSDictionary dictionaryWithContentsOfURL:v6];
      personaData = v5->_personaData;
      v5->_personaData = (NSDictionary *)v9;
    }
    else
    {
      id v11 = [v6 pathExtension];
      int v12 = [v11 isEqualToString:@"json"];

      if (!v12) {
        goto LABEL_8;
      }
      CGPoint v13 = (void *)MEMORY[0x263F08900];
      CGPoint v14 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6];
      personaData = [v13 JSONObjectWithData:v14 options:0 error:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_personaData, personaData);
      }
    }

LABEL_8:
    CGRect v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedKeyInfo = v5->_cachedKeyInfo;
    v5->_cachedKeyInfo = v15;
  }
  return v5;
}

@end