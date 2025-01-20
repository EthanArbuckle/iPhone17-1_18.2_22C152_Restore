@interface UIColor(SXJSONObject)
- (uint64_t)initWithJSONObject:()SXJSONObject andVersion:;
@end

@implementation UIColor(SXJSONObject)

- (uint64_t)initWithJSONObject:()SXJSONObject andVersion:
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 hasPrefix:@"#"])
  {
    objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 1, @"0x");
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 UTF8String];

    size_t v8 = strlen((const char *)v7);
    unint64_t v9 = strtoll((const char *)v7, 0, 0);
    switch(v8)
    {
      case 5uLL:
        int v10 = *(char *)(v7 + 2);
        unsigned int v11 = v10 - 48;
        unsigned int v12 = v10 - 97;
        if ((v10 - 65) >= 6) {
          int v13 = 0;
        }
        else {
          int v13 = v10 - 55;
        }
        int v14 = v10 - 87;
        if (v12 > 5) {
          int v14 = v13;
        }
        if (v11 <= 9) {
          int v14 = v11;
        }
        v15.f32[0] = (float)((float)v14 + (float)((float)v14 * 16.0)) / 255.0;
        int v16 = *(char *)(v7 + 3);
        unsigned int v17 = v16 - 48;
        unsigned int v18 = v16 - 97;
        if ((v16 - 65) >= 6) {
          int v19 = 0;
        }
        else {
          int v19 = v16 - 55;
        }
        int v20 = v16 - 87;
        if (v18 > 5) {
          int v20 = v19;
        }
        if (v17 <= 9) {
          int v20 = v17;
        }
        float v21 = (float)((float)v20 + (float)((float)v20 * 16.0)) / 255.0;
        int v22 = *(char *)(v7 + 4);
        unsigned int v23 = v22 - 48;
        unsigned int v24 = v22 - 97;
        if ((v22 - 65) >= 6) {
          int v25 = 0;
        }
        else {
          int v25 = v22 - 55;
        }
        int v26 = v22 - 87;
        if (v24 > 5) {
          int v26 = v25;
        }
        if (v23 <= 9) {
          int v26 = v23;
        }
        float v27 = (float)((float)v26 + (float)((float)v26 * 16.0)) / 255.0;
        v15.f32[1] = v21;
        goto LABEL_58;
      case 6uLL:
        int v29 = *(char *)(v7 + 2);
        unsigned int v30 = v29 - 48;
        unsigned int v31 = v29 - 97;
        if ((v29 - 65) >= 6) {
          int v32 = 0;
        }
        else {
          int v32 = v29 - 55;
        }
        int v33 = v29 - 87;
        if (v31 > 5) {
          int v33 = v32;
        }
        if (v30 <= 9) {
          int v33 = v30;
        }
        v15.f32[0] = (float)((float)v33 + (float)((float)v33 * 16.0)) / 255.0;
        int v34 = *(char *)(v7 + 3);
        unsigned int v35 = v34 - 48;
        unsigned int v36 = v34 - 97;
        if ((v34 - 65) >= 6) {
          int v37 = 0;
        }
        else {
          int v37 = v34 - 55;
        }
        int v38 = v34 - 87;
        if (v36 > 5) {
          int v38 = v37;
        }
        if (v35 <= 9) {
          int v38 = v35;
        }
        float v39 = (float)((float)v38 + (float)((float)v38 * 16.0)) / 255.0;
        int v40 = *(char *)(v7 + 4);
        unsigned int v41 = v40 - 48;
        unsigned int v42 = v40 - 97;
        if ((v40 - 65) >= 6) {
          int v43 = 0;
        }
        else {
          int v43 = v40 - 55;
        }
        int v44 = v40 - 87;
        if (v42 > 5) {
          int v44 = v43;
        }
        if (v41 <= 9) {
          int v44 = v41;
        }
        float v27 = (float)((float)v44 + (float)((float)v44 * 16.0)) / 255.0;
        int v45 = *(char *)(v7 + 5);
        unsigned int v46 = v45 - 48;
        unsigned int v47 = v45 - 97;
        if ((v45 - 65) >= 6) {
          int v48 = 0;
        }
        else {
          int v48 = v45 - 55;
        }
        int v49 = v45 - 87;
        if (v47 > 5) {
          int v49 = v48;
        }
        if (v46 <= 9) {
          int v49 = v46;
        }
        float v50 = (float)((float)v49 + (float)((float)v49 * 16.0)) / 255.0;
        v15.f32[1] = v39;
        break;
      case 8uLL:
        v53.i64[0] = 255;
        v53.i64[1] = 255;
        float32x2_t v15 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v9), (uint64x2_t)xmmword_222BEF660), v53)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)));
        float v27 = (double)v9 / 255.0;
LABEL_58:
        float v50 = 1.0;
        break;
      case 0xAuLL:
        v54.i64[0] = 255;
        v54.i64[1] = 255;
        float32x2_t v15 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v9), (uint64x2_t)xmmword_222BEF650), v54)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)));
        float v27 = (double)BYTE1(v9) / 255.0;
        float v50 = (double)v9 / 255.0;
        break;
      default:
        v51 = [MEMORY[0x263F08690] currentHandler];
        v52 = [NSString stringWithUTF8String:"UIColor+SXJSONObject.m"];
        [v51 handleFailureInMethod:a2 object:a1 file:v52 lineNumber:84 description:@"Invalid color string"];

        float32x2_t v15 = 0;
        float v27 = 0.0;
        float v50 = 0.0;
        break;
    }
    uint64_t v28 = [MEMORY[0x263F1C550] colorWithRed:v15.f32[0] green:v15.f32[1] blue:v27 alpha:v50];
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

@end