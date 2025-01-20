@interface UIKBPhoneToCarPlayTransformation
+ (id)cachedKeys;
+ (id)cachedKeysForTransformationContext:(id)a3;
+ (id)fillFrame:(CGRect)a3 withEmptyKeyNamed:(id)a4 inKeyplane:(id)a5 withTransformationContext:(id)a6;
+ (id)transform10KeyKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformQWERTYKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
+ (unint64_t)columnBySwappingForLeftHandDriveIfNeeded:(unint64_t)a3;
+ (void)removeAddedKeysFromKeyplane:(id)a3;
@end

@implementation UIKBPhoneToCarPlayTransformation

+ (id)transformationIdentifier
{
  return @"ptc";
}

+ (id)cachedKeys
{
  v2 = (void *)__cachedKeys;
  if (!__cachedKeys)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = (void *)__cachedKeys;
    __cachedKeys = v3;

    v2 = (void *)__cachedKeys;
  }
  return v2;
}

+ (unint64_t)columnBySwappingForLeftHandDriveIfNeeded:(unint64_t)a3
{
  char IsRightHandDrive = UIKeyboardCarPlayIsRightHandDrive();
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 4) {
    unint64_t v5 = a3 - 3;
  }
  else {
    unint64_t v5 = a3;
  }
  if (a3 - 1 <= 2) {
    unint64_t v6 = a3 + 4;
  }
  else {
    unint64_t v6 = v5;
  }
  if (IsRightHandDrive) {
    return a3;
  }
  else {
    return v6;
  }
}

+ (id)fillFrame:(CGRect)a3 withEmptyKeyNamed:(id)a4 inKeyplane:(id)a5 withTransformationContext:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [a1 cachedKeys];
  v17 = [v16 objectForKey:v13];

  if (v17)
  {
    [v14 removeKey:v17];
  }
  else
  {
    v18 = [v14 firstCachedKeyWithName:@"Return-Key"];
    v17 = (void *)[v18 copy];
  }
  [v17 setDisplayType:0];
  [v17 setInteractionType:0];
  [v17 setDisplayString:&stru_1ED0E84C0];
  [v17 setRepresentedString:&stru_1ED0E84C0];
  objc_msgSend(v17, "setFrame:", x, y, width, height);
  objc_msgSend(v17, "setPaddedFrame:", x, y, width, height);
  [v17 setName:v13];
  v19 = [a1 cachedKeys];
  v20 = [v17 name];
  [v19 setObject:v17 forKey:v20];

  [v17 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [v15 screenTraits];

  v30 = [v29 screen];
  [v30 scale];
  objc_msgSend(v14, "insertKey:withFrame:andShiftKeys:scale:", v17, 0, v22, v24, v26, v28, v31);

  return v17;
}

+ (void)removeAddedKeysFromKeyplane:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = objc_msgSend(a1, "cachedKeys", 0);
  unint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 removeKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (id)transformQWERTYKeyplane:(id)a3 withTransformationContext:(id)a4
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v78 = a1;
  [a1 removeAddedKeysFromKeyplane:v6];
  id v79 = v6;
  [v6 keyUnionFrame];
  double v9 = v8;
  double v11 = v10;
  v80 = v7;
  long long v12 = [v7 screenTraits];
  long long v13 = [v12 screen];
  [v13 scale];

  [v6 frame];
  uint64_t v14 = [v6 numberOfRows];
  LODWORD(v6) = UIKeyboardAlwaysShowCandidateBarForCurrentInputMode();
  [v80 keyboardSize];
  unsigned int v77 = v6;
  UICeilToScale((v15 - v9) / (double)(v14 + (unint64_t)v6), 1.0);
  BOOL v17 = v16 <= 0.0 || v14 == 0;
  if (!v17 && v11 > 0.0)
  {
    double v18 = v16;
    v19 = [v79 keys];
    [v80 keyboardSize];
    double v21 = v20 / v11;
    if (v20 / v11 != 1.0)
    {
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v22 = v19;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v110 objects:v115 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v111 != v24) {
              objc_enumerationMutation(v22);
            }
            double v26 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            [v26 frame];
            double v28 = v27;
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            v35 = [v26 shape];
            v36 = (void *)[v35 copy];

            objc_msgSend(v36, "setFrame:", v21 * v28, v30, v21 * v32, v34);
            [v26 setShape:v36];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v110 objects:v115 count:16];
        }
        while (v23);
      }
    }
    uint64_t v104 = 0;
    v105 = (id *)&v104;
    uint64_t v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__152;
    v108 = __Block_byref_object_dispose__152;
    id v109 = 0;
    v37 = [v19 sortedArrayUsingComparator:&__block_literal_global_415];

    v38 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_2;
    aBlock[3] = &unk_1E52DCB08;
    id v39 = v38;
    id v103 = v39;
    v40 = _Block_copy(aBlock);
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_3;
    v99[3] = &unk_1E5300020;
    v84 = v40;
    v101 = v84;
    id v76 = v39;
    id v100 = v76;
    v41 = _Block_copy(v99);
    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x2020000000;
    v98[3] = 0;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_4;
    v93[3] = &unk_1E5300048;
    v96 = v98;
    id v97 = v78;
    id v74 = v79;
    id v94 = v74;
    id v83 = v80;
    id v95 = v83;
    v42 = _Block_copy(v93);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_5;
    v89[3] = &unk_1E5300070;
    v92 = &v104;
    id v43 = v41;
    id v90 = v43;
    v81 = v42;
    v91 = v81;
    v44 = (void (**)(void *, uint64_t, void))_Block_copy(v89);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    obuint64_t j = v37;
    uint64_t v45 = [obj countByEnumeratingWithState:&v85 objects:v114 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v86;
      double v47 = v18 * round(v18 / v18);
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v86 != v46) {
            objc_enumerationMutation(obj);
          }
          v49 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          objc_msgSend(v49, "frame", v74, v76);
          double v51 = v50;
          double v53 = v52;
          double v54 = v9 + v18 * ((double)v77 + (double)(int)([v49 displayRowHint] - 1));
          id v55 = v105[5];
          if (v55
            && (int v56 = [v55 displayRowHint], v56 == objc_msgSend(v49, "displayRowHint")))
          {
            [v105[5] frame];
            double MaxX = CGRectGetMaxX(v118);
            if ([v105[5] interactionType] == 14)
            {
              UIRoundToScale(v51, 1.0);
              v44[2](v44, 1, 0);
              [v105[5] frame];
              double MaxX = CGRectGetMaxX(v119);
            }
            double v58 = MaxX - v51;
            UIRoundToScale(v53 - v58, 1.0);
            double v60 = v59;
            double v61 = v51 + v58;
          }
          else
          {
            double v62 = v84[2](v51);
            UIFloorToScale(v62, 1.0);
            double v61 = v63;
            UIRoundToScale(v53, 1.0);
            double v60 = v64;
            [v83 keyboardSize];
            v44[2](v44, 0, 1);
            if (v61 > 1.0)
            {
              v65 = v81[2](0.0, v54, v61, v47);
              [v65 frame];
              (*((void (**)(id, void *, uint64_t))v43 + 2))(v43, v65, 1);
            }
          }
          (*((void (**)(id, void *, uint64_t, double, double, double, double))v43 + 2))(v43, v49, 1, v61, v54, v60, v47);
          if ([v49 visible])
          {
            [v49 frame];
            if (v66 > 0.0) {
              objc_storeStrong(v105 + 5, v49);
            }
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v85 objects:v114 count:16];
      }
      while (v45);
    }

    [v83 keyboardSize];
    v44[2](v44, 0, 1);
    if (v77)
    {
      v67 = [v78 cachedKeys];
      v68 = [v67 objectForKey:@"Candidate-Selection"];

      if (!v68)
      {
        v69 = [v74 firstCachedKeyWithName:@"Space-Key"];
        v68 = (void *)[v69 copy];
      }
      objc_msgSend(v68, "setName:", @"Candidate-Selection", v74);
      [v68 setDisplayString:&stru_1ED0E84C0];
      [v68 setRepresentedString:&stru_1ED0E84C0];
      [v68 setDisplayType:1];
      [v68 setInteractionType:3];
      [v83 keyboardSize];
      objc_msgSend(v68, "setFrame:", 0.0, v9, v70, v18);
      [v68 frame];
      objc_msgSend(v68, "setPaddedFrame:");
      v71 = [v78 cachedKeys];
      v72 = [v68 name];
      [v71 setObject:v68 forKey:v72];

      [v68 frame];
      objc_msgSend(v75, "insertKey:withFrame:andShiftKeys:scale:", v68, 0);
    }
    _Block_object_dispose(v98, 8);

    _Block_object_dispose(&v104, 8);
  }

  return v79;
}

uint64_t __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  double v8 = v7;
  [v4 frame];
  double v10 = v9;
  double v12 = v11;

  if (vabdd_f64(v8, v12) >= 0.1)
  {
    long long v13 = [NSNumber numberWithDouble:v8];
    uint64_t v14 = NSNumber;
    double v15 = v12;
  }
  else
  {
    long long v13 = [NSNumber numberWithDouble:v6];
    uint64_t v14 = NSNumber;
    double v15 = v10;
  }
  double v16 = [v14 numberWithDouble:v15];
  uint64_t v17 = [v13 compare:v16];

  return v17;
}

double __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "floatValue", (void)v12);
        if (vabdd_f64(a2, v9) <= 1.0)
        {
          [v8 floatValue];
          a2 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return a2;
}

void __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_3(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  v22.origin.double x = a4;
  v22.origin.double y = a5;
  v22.size.double width = a6;
  v22.size.double height = a7;
  double MaxX = CGRectGetMaxX(v22);
  double v15 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v15 == MaxX)
  {
    double v16 = *(void **)(a1 + 32);
    uint64_t v17 = [NSNumber numberWithDouble:MaxX];
    [v16 addObject:v17];
  }
  else
  {
    a6 = v15 - a4;
  }
  double v18 = [v13 shape];
  id v20 = (id)[v18 copy];

  objc_msgSend(v20, "setFrame:", a4, a5, a6, a7);
  if (a3) {
    double v19 = 0.5;
  }
  else {
    double v19 = 0.0;
  }
  objc_msgSend(v20, "setPaddedFrame:", a4 + 0.0, a5 + 0.5, a6 - v19, a7 + -0.5);
  [v13 setShape:v20];
}

id __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v10 = objc_msgSend(NSString, "stringWithFormat:", @"Empty-Key-%ld", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v11 = objc_msgSend(*(id *)(a1 + 56), "fillFrame:withEmptyKeyNamed:inKeyplane:withTransformationContext:", v10, *(void *)(a1 + 32), *(void *)(a1 + 40), a2, a3, a4, a5);

  return v11;
}

void __86__UIKBPhoneToCarPlayTransformation_transformQWERTYKeyplane_withTransformationContext___block_invoke_5(void *a1, uint64_t a2, int a3, double a4)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) frame];
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    double v12 = v8.n128_f64[0];
    double v13 = v9.n128_f64[0];
    double v14 = v11.n128_f64[0];
    if (a3 && (CGFloat v15 = v10.n128_f64[0], CGRectGetMaxX(*(CGRect *)v8.n128_u64) <= a4 + -10.0))
    {
      uint64_t v17 = a1[5];
      v25.origin.double x = v12;
      v25.origin.double y = v13;
      v25.size.double width = v15;
      v25.size.double height = v14;
      double MaxX = CGRectGetMaxX(v25);
      v26.origin.double x = v12;
      v26.origin.double y = v13;
      v26.size.double width = v15;
      v26.size.double height = v14;
      CGFloat v19 = CGRectGetMaxX(v26);
      id v20 = (*(void (**)(uint64_t, double, double, double, double))(v17 + 16))(v17, MaxX, v13, a4 - v19, v14);
      uint64_t v21 = a1[4];
      [v20 frame];
      (*(void (**)(uint64_t, void *, uint64_t))(v21 + 16))(v21, v20, a2);
      uint64_t v22 = *(void *)(a1[6] + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v20;
    }
    else
    {
      double v16 = *(void (**)(__n128, __n128, __n128, __n128))(a1[4] + 16);
      v8.n128_f64[0] = v12;
      v9.n128_f64[0] = v13;
      v11.n128_f64[0] = v14;
      v10.n128_f64[0] = a4 - v12;
      v16(v8, v9, v10, v11);
    }
  }
}

+ (id)transform10KeyKeyplane:(id)a3 withTransformationContext:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 keyUnionFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v7 keyboardSize];
  double v15 = v14;
  [v7 keyboardSize];
  double v49 = round((v16 - v9) * 0.25);
  double v50 = v9;
  if (v49 > 0.0)
  {
    double v17 = v15 * 0.125;
    if (v15 * 0.125 > 0.0)
    {
      double v18 = [v6 keys];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        double v21 = v11 * 0.125;
        double v22 = round(v13 * 0.25);
        uint64_t v23 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(v18);
            }
            CGRect v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            CGRect v26 = objc_msgSend(v25, "shape", *(void *)&v49, *(void *)&v50);
            double v27 = (void *)[v26 copy];

            [v27 frame];
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;
            double v35 = v34;
            if ([v25 displayType] == 9
              || [v25 displayType] == 2)
            {
              [v25 setVisible:0];
            }
            else
            {
              double v36 = v50 + v49 * round(v31 / v22) + 1.0;
              double v37 = v49 * round(v35 / v22);
              double v38 = (double)(unint64_t)[a1 columnBySwappingForLeftHandDriveIfNeeded:vcvtad_u64_f64(v29 / v21)];
              UIRoundToScale(v17 * v38, 1.0);
              double v40 = v39;
              double v41 = round(v33 / v21);
              int v42 = [v25 interactionType];
              double v43 = 3.0;
              if (v42 != 3) {
                double v43 = v41;
              }
              UIRoundToScale(v17 * (v43 + v38), 1.0);
              double v45 = v44;
              [v7 keyboardSize];
              if (v45 < v46) {
                double v46 = v45;
              }
              double v47 = v46 - v40;
              objc_msgSend(v27, "setFrame:", v40, v36, v46 - v40, v37);
              objc_msgSend(v27, "setPaddedFrame:", v40, v36, v47, v37);
              [v25 setShape:v27];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v20);
      }
    }
  }

  return v6;
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 visualStyling];
  unsigned __int8 v9 = BYTE2(v8);
  [v6 setVisualStyling:v8 & 0xFFFFFFFFFFFFFFC0 | 3];
  if (v9 <= 0x22u && ((1 << v9) & 0x600000002) != 0)
  {
    uint64_t v11 = [a1 transform10KeyKeyplane:v6 withTransformationContext:v7];
LABEL_6:
    double v12 = (void *)v11;

    id v6 = v12;
    goto LABEL_7;
  }
  double v14 = [v6 name];
  int v15 = [v14 containsString:@"iPhone"];

  if (v15)
  {
    uint64_t v11 = [a1 transformQWERTYKeyplane:v6 withTransformationContext:v7];
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

+ (id)cachedKeysForTransformationContext:(id)a3
{
  id v3 = objc_msgSend(a1, "cachedKeys", a3);
  uint64_t v4 = [v3 allValues];

  return v4;
}

@end