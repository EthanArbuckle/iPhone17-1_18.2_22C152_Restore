@interface SITraceableHelpers
+ (id)traceableTransform:(__n128)a3;
@end

@implementation SITraceableHelpers

+ (id)traceableTransform:(__n128)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  v28 = objc_msgSend(NSNumber, "numberWithFloat:");
  v37[0] = v28;
  v27 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  v37[1] = v27;
  v26 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v37[2] = v26;
  v25 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  v37[3] = v25;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  v38[0] = v24;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  v23 = [NSNumber numberWithFloat:v4];
  v36[0] = v23;
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  v22 = [NSNumber numberWithFloat:v5];
  v36[1] = v22;
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  v21 = [NSNumber numberWithFloat:v6];
  v36[2] = v21;
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  v20 = [NSNumber numberWithFloat:v7];
  v36[3] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
  v38[1] = v19;
  v18 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v35[0] = v18;
  v8 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v35[1] = v8;
  v9 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v35[2] = v9;
  v10 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v35[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
  v38[2] = v11;
  v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v34[0] = v12;
  v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v34[1] = v13;
  v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v34[2] = v14;
  v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v34[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v38[3] = v16;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];

  return v33;
}

@end