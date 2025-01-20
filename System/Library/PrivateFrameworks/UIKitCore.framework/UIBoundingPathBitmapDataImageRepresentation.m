@interface UIBoundingPathBitmapDataImageRepresentation
@end

@implementation UIBoundingPathBitmapDataImageRepresentation

void ___UIBoundingPathBitmapDataImageRepresentation_block_invoke(unint64_t *a1, void *a2)
{
  id v42 = a2;
  if (a1[5])
  {
    uint64_t v3 = 0;
    v4 = &off_1E52D3000;
    v36 = a1;
    while (v3 == a1[6] && a1[7])
    {
      v5 = [v4[228] blackColor];
      [v5 setFill];

      objc_msgSend(v42, "fillRect:", 0.0, (double)v3, (double)a1[4], (double)a1[7]);
      uint64_t v3 = a1[6] + a1[7] - 1;
LABEL_36:
      if (++v3 >= a1[5]) {
        goto LABEL_37;
      }
    }
    unint64_t v6 = a1[4];
    if (!v6) {
      goto LABEL_36;
    }
    unint64_t v7 = 0;
    double v8 = (double)v3;
    uint64_t v37 = v3;
    while (1)
    {
      unint64_t v9 = a1[5];
      if (v3 > v9 || v3 < 0)
      {
        unint64_t v10 = 0xFFFFLL;
      }
      else
      {
        unint64_t v10 = 0xFFFFLL;
        if (v9)
        {
          if ((v7 & 0x8000000000000000) != 0)
          {
            unint64_t v10 = -(uint64_t)v7;
          }
          else
          {
            unint64_t v11 = a1[6];
            unint64_t v12 = a1[7];
            unint64_t v14 = a1[8];
            unint64_t v13 = a1[9];
            unint64_t v15 = a1[10];
            if (v7 >= v6 - 1) {
              unint64_t v16 = v6 - 1;
            }
            else {
              unint64_t v16 = v7;
            }
            if (v3 >= v9 - 1) {
              unint64_t v17 = v9 - 1;
            }
            else {
              unint64_t v17 = v3;
            }
            if (v17 >= v11)
            {
              if (v17 < v12 + v11)
              {
                unint64_t v10 = v6 - v16;
LABEL_35:
                v30 = [v4[228] blackColor];
                goto LABEL_33;
              }
              v17 -= v12;
            }
            if (v13)
            {
              uint64_t v18 = 0;
              unint64_t v19 = 0;
              unint64_t v20 = v17 * v13;
              unint64_t v21 = v15 + 2 * v17 * v13;
              while (1)
              {
                if (v20 + v18 >= v14)
                {
                  unint64_t v38 = v17;
                  unint64_t v40 = v16;
                  unint64_t v34 = v12;
                  unint64_t v35 = v11;
                  unint64_t v33 = v15;
                  v32 = [MEMORY[0x1E4F28B00] currentHandler];
                  v23 = objc_msgSend(NSString, "stringWithUTF8String:", "_UIBoundingPathBitmapDataRowHitTestResult _UIBoundingPathBitmapDataRowHitTest(const _UIBoundingPathBitmapData, const _UIIntegralPoint)");
                  objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v6, v9, v35, v34, v14, v13);

                  unint64_t v15 = v33;
                  unint64_t v12 = v34;
                  unint64_t v11 = v35;
                  unint64_t v17 = v38;
                  unint64_t v16 = v40;
                }
                __int16 v22 = *(_WORD *)(v21 + 2 * v18);
                v19 += v22 & 0x7FFF;
                unint64_t v10 = v19 - v16;
                if (v19 > v16) {
                  break;
                }
                if (v13 == ++v18) {
                  goto LABEL_30;
                }
              }
              a1 = v36;
              uint64_t v3 = v37;
              v4 = &off_1E52D3000;
              if (v22 < 0) {
                goto LABEL_35;
              }
            }
            else
            {
LABEL_30:
              unint64_t v39 = v17;
              unint64_t v41 = v16;
              unint64_t v24 = v11;
              unint64_t v25 = v12;
              unint64_t v26 = v15;
              v27 = [MEMORY[0x1E4F28B00] currentHandler];
              v28 = objc_msgSend(NSString, "stringWithUTF8String:", "_UIBoundingPathBitmapDataRowHitTestResult _UIBoundingPathBitmapDataRowHitTest(const _UIBoundingPathBitmapData, const _UIIntegralPoint)");
              v43[0] = v6;
              v43[1] = v9;
              v43[2] = v24;
              v43[3] = v25;
              v43[4] = v14;
              v43[5] = v13;
              v43[6] = v26;
              v29 = _UIBoundingPathBitmapDataDescription(v43);
              [v27 handleFailureInFunction:v28, @"_UIBoundingPathBitmapData.h", 256, @"Bitmap is invalid: column %ld is missing for row %ld of bitmap data: %@", v41, v39, v29 file lineNumber description];

              unint64_t v10 = 1;
              a1 = v36;
              uint64_t v3 = v37;
              v4 = &off_1E52D3000;
            }
          }
        }
      }
      v30 = [v4[228] whiteColor];
LABEL_33:
      v31 = v30;
      [v30 setFill];

      objc_msgSend(v42, "fillRect:", (double)(uint64_t)v7, v8, (double)v10, 1.0);
      v7 += v10;
      unint64_t v6 = a1[4];
      if (v7 >= v6) {
        goto LABEL_36;
      }
    }
  }
LABEL_37:
}

@end