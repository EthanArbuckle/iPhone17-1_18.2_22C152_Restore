@interface PXPhotoLibraryProcessingProgressReport
+ (id)_highlightEnrichmentProgressDescription:(id *)a3;
+ (id)_processingProgressDescription:(id *)a3;
+ (id)_syndicationProgressDescription:(id *)a3;
+ (id)colorForComplete;
+ (id)colorForDefault;
+ (id)colorForNotEnriched;
+ (id)colorForPartial;
+ (id)colorForSceneComplete;
+ (id)highlightEnrichmentProgressImageWithProgressReport:(id *)a3;
+ (id)syndicationProgressImageWithProgressReport:(id *)a3;
+ (void)requestBriefDescriptionForLibrary:(id)a3 resultBlock:(id)a4;
+ (void)requestFullDescriptionForLibrary:(id)a3 resultBlock:(id)a4;
@end

@implementation PXPhotoLibraryProcessingProgressReport

+ (id)syndicationProgressImageWithProgressReport:(id *)a3
{
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 150.0, 40.0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PXPhotoLibraryProcessingProgressReport_syndicationProgressImageWithProgressReport___block_invoke;
  v17[3] = &__block_descriptor_192_e40_v16__0__UIGraphicsImageRendererContext_8l;
  long long v5 = *(_OWORD *)&a3->var4;
  long long v6 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)&a3->var0;
  long long v20 = *(_OWORD *)&a3->var2;
  long long v21 = v5;
  long long v8 = *(_OWORD *)&a3->var8;
  long long v22 = v6;
  long long v23 = v8;
  long long v18 = xmmword_1AB302E30;
  long long v19 = v7;
  __asm { FMOV            V1.2D, #4.0 }
  long long v24 = xmmword_1AB302E40;
  long long v25 = _Q1;
  __asm { FMOV            V1.2D, #2.0 }
  long long v26 = xmmword_1AB302E50;
  long long v27 = _Q1;
  v15 = [v4 imageWithActions:v17];

  return v15;
}

void __85__PXPhotoLibraryProcessingProgressReport_syndicationProgressImageWithProgressReport___block_invoke(uint64_t a1, void *a2)
{
  id v39 = a2;
  v3 = (CGContext *)[v39 CGContext];
  double v4 = *(double *)(a1 + 32);
  double v5 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 56) / (double)*(uint64_t *)(a1 + 48);
  id v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v6 CGColor]);

  objc_msgSend(v39, "fillRect:", v4, *(double *)(a1 + 128), v5, *(double *)(a1 + 136));
  double v7 = v4 + v5;
  double v8 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 64) / (double)*(uint64_t *)(a1 + 48);
  id v9 = [MEMORY[0x1E4FB1618] systemGray2Color];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v9 CGColor]);

  objc_msgSend(v39, "fillRect:", v7, *(double *)(a1 + 128), v8, *(double *)(a1 + 136));
  double v10 = v7 + v8;
  double v11 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 72) / (double)*(uint64_t *)(a1 + 48);
  id v12 = [MEMORY[0x1E4FB1618] systemGray2Color];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v12 CGColor]);

  objc_msgSend(v39, "fillRect:", v10, *(double *)(a1 + 128), v11, *(double *)(a1 + 136));
  double v13 = v10 + v11;
  double v14 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 80) / (double)*(uint64_t *)(a1 + 48);
  id v15 = [MEMORY[0x1E4FB1618] systemGray2Color];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v15 CGColor]);

  objc_msgSend(v39, "fillRect:", v13, *(double *)(a1 + 128), v14, *(double *)(a1 + 136));
  double v16 = v13 + v14;
  double v17 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 88) / (double)*(uint64_t *)(a1 + 48);
  id v18 = [MEMORY[0x1E4FB1618] systemGray3Color];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v18 CGColor]);

  objc_msgSend(v39, "fillRect:", v16, *(double *)(a1 + 128), v17, *(double *)(a1 + 136));
  double v19 = v16 + v17;
  double v20 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 96) / (double)*(uint64_t *)(a1 + 48);
  id v21 = [MEMORY[0x1E4FB1618] systemGray4Color];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v21 CGColor]);

  objc_msgSend(v39, "fillRect:", v19, *(double *)(a1 + 128), v20, *(double *)(a1 + 136));
  double v22 = v19 + v20;
  double v23 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 104) / (double)*(uint64_t *)(a1 + 48);
  id v24 = [MEMORY[0x1E4FB1618] systemRedColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v24 CGColor]);

  objc_msgSend(v39, "fillRect:", v22, *(double *)(a1 + 128), v23, *(double *)(a1 + 136));
  double v25 = v22 + v23;
  double v26 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 112) / (double)*(uint64_t *)(a1 + 48);
  id v27 = [MEMORY[0x1E4FB1618] systemTealColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v27 CGColor]);

  objc_msgSend(v39, "fillRect:", v25, *(double *)(a1 + 128), v26, *(double *)(a1 + 136));
  double v28 = v25 + v26;
  double v29 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 120) / (double)*(uint64_t *)(a1 + 48);
  id v30 = [MEMORY[0x1E4FB1618] systemGreenColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v30 CGColor]);

  objc_msgSend(v39, "fillRect:", v28, *(double *)(a1 + 128), v29, *(double *)(a1 + 136));
  id v31 = [MEMORY[0x1E4FB1618] grayColor];
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v31 CGColor]);

  Mutable = CGPathCreateMutable();
  double x = *(double *)(a1 + 144);
  double y = *(double *)(a1 + 152);
  double width = *(double *)(a1 + 160) + x * -2.0;
  double height = *(double *)(a1 + 168) + y * -2.0;
  char v37 = 1;
  do
  {
    char v38 = v37;
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    CGPathAddRoundedRect(Mutable, 0, v41, *(double *)(a1 + 176) + 1.0, *(double *)(a1 + 184) + 1.0);
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    CGRect v43 = CGRectInset(v42, 0.5, 0.5);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
    char v37 = 0;
  }
  while ((v38 & 1) != 0);
  CGContextBeginPath(v3);
  CGContextAddPath(v3, Mutable);
  CGContextClosePath(v3);
  CGContextStrokePath(v3);
  CGPathRelease(Mutable);
}

+ (id)highlightEnrichmentProgressImageWithProgressReport:(id *)a3
{
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 150.0, 40.0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  long long v6 = *(_OWORD *)&a3->var0;
  long long v7 = *(_OWORD *)&a3->var2;
  long long v19 = xmmword_1AB302E30;
  long long v20 = v6;
  long long v8 = *(_OWORD *)&a3->var4;
  long long v9 = *(_OWORD *)&a3->var6;
  long long v21 = v7;
  long long v22 = v8;
  v18[2] = __93__PXPhotoLibraryProcessingProgressReport_highlightEnrichmentProgressImageWithProgressReport___block_invoke;
  v18[3] = &__block_descriptor_184_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v18[4] = a1;
  long long v23 = v9;
  long long v24 = xmmword_1AB302E40;
  __asm { FMOV            V0.2D, #4.0 }
  long long v25 = _Q0;
  long long v26 = xmmword_1AB302E50;
  __asm { FMOV            V0.2D, #2.0 }
  long long v27 = _Q0;
  double v16 = [v5 imageWithActions:v18];

  return v16;
}

void __93__PXPhotoLibraryProcessingProgressReport_highlightEnrichmentProgressImageWithProgressReport___block_invoke(uint64_t a1, void *a2)
{
  id v27 = a2;
  v3 = (CGContext *)[v27 CGContext];
  id v4 = [*(id *)(a1 + 32) colorForNotEnriched];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 96) / (double)*(uint64_t *)(a1 + 56);
  objc_msgSend(v27, "fillRect:", v5, *(double *)(a1 + 120), v6, *(double *)(a1 + 128));
  double v7 = v5 + v6;
  double v8 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 88) / (double)*(uint64_t *)(a1 + 56);
  id v9 = [*(id *)(a1 + 32) colorForDefault];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v9 CGColor]);

  objc_msgSend(v27, "fillRect:", v7, *(double *)(a1 + 120), v8, *(double *)(a1 + 128));
  double v10 = v7 + v8;
  double v11 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 80) / (double)*(uint64_t *)(a1 + 56);
  id v12 = [*(id *)(a1 + 32) colorForPartial];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v12 CGColor]);

  objc_msgSend(v27, "fillRect:", v10, *(double *)(a1 + 120), v11, *(double *)(a1 + 128));
  double v13 = v10 + v11;
  double v14 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 72) / (double)*(uint64_t *)(a1 + 56);
  id v15 = [*(id *)(a1 + 32) colorForSceneComplete];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v15 CGColor]);

  objc_msgSend(v27, "fillRect:", v13, *(double *)(a1 + 120), v14, *(double *)(a1 + 128));
  double v16 = v13 + v14;
  double v17 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 64) / (double)*(uint64_t *)(a1 + 56);
  id v18 = [*(id *)(a1 + 32) colorForComplete];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v18 CGColor]);

  objc_msgSend(v27, "fillRect:", v16, *(double *)(a1 + 120), v17, *(double *)(a1 + 128));
  id v19 = [MEMORY[0x1E4FB1618] grayColor];
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v19 CGColor]);

  Mutable = CGPathCreateMutable();
  double x = *(double *)(a1 + 136);
  double y = *(double *)(a1 + 144);
  double width = *(double *)(a1 + 152) + x * -2.0;
  double height = *(double *)(a1 + 160) + y * -2.0;
  char v25 = 1;
  do
  {
    char v26 = v25;
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    CGPathAddRoundedRect(Mutable, 0, v29, *(double *)(a1 + 168) + 1.0, *(double *)(a1 + 176) + 1.0);
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    CGRect v31 = CGRectInset(v30, 0.5, 0.5);
    double x = v31.origin.x;
    double y = v31.origin.y;
    double width = v31.size.width;
    double height = v31.size.height;
    char v25 = 0;
  }
  while ((v26 & 1) != 0);
  CGContextBeginPath(v3);
  CGContextAddPath(v3, Mutable);
  CGContextClosePath(v3);
  CGContextStrokePath(v3);
  CGPathRelease(Mutable);
}

+ (id)_highlightEnrichmentProgressDescription:(id *)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = 0x1E4F29000uLL;
  if (a3->var0 - a3->var1 < 1) {
    [NSString stringWithFormat:@"%@\n\t%2.1f%%\n", @"Highlights:", *(void *)&a3->var6, v39, v40];
  }
  else {
  CGRect v42 = [NSString stringWithFormat:@"%@\n\t%2.1f%% (%lu/%lu pending)\n", @"Highlights:", *(void *)&a3->var6, a3->var0 - a3->var1, a3->var0];
  }
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v42];
  CGRect v41 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  objc_msgSend(v6, "appendAttributedString:");
  double v7 = (uint64_t *)MEMORY[0x1E4FB0700];
  if (a3->var5 >= 1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"\tNot Enriched: %lu\n", a3->var5);
    uint64_t v51 = *v7;
    double v10 = [a1 colorForNotEnriched];
    v52[0] = v10;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    id v12 = (void *)[v8 initWithString:v9 attributes:v11];

    unint64_t v5 = 0x1E4F29000uLL;
    [v6 appendAttributedString:v12];
  }
  if (a3->var4 >= 1)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v14 = objc_msgSend(NSString, "stringWithFormat:", @"\tMetadata Only: %lu\n", a3->var4);
    uint64_t v49 = *v7;
    id v15 = [a1 colorForDefault];
    v50 = v15;
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    double v17 = (void *)[v13 initWithString:v14 attributes:v16];

    unint64_t v5 = 0x1E4F29000uLL;
    [v6 appendAttributedString:v17];
  }
  if (a3->var3 >= 1)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"\tMetadata and Score: %lu\n", a3->var3);
    uint64_t v47 = *v7;
    long long v20 = [a1 colorForPartial];
    v48 = v20;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    long long v22 = (void *)[v18 initWithString:v19 attributes:v21];

    unint64_t v5 = 0x1E4F29000uLL;
    [v6 appendAttributedString:v22];
  }
  if (a3->var2 <= 0)
  {
    uint64_t v25 = *v7;
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
    long long v24 = objc_msgSend(NSString, "stringWithFormat:", @"\tMetadata and Scenes: %lu\n", a3->var2);
    uint64_t v25 = *v7;
    uint64_t v45 = v25;
    char v26 = [a1 colorForSceneComplete];
    v46 = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    double v28 = (void *)[v23 initWithString:v24 attributes:v27];

    unint64_t v5 = 0x1E4F29000;
    [v6 appendAttributedString:v28];
  }
  id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
  objc_msgSend(*(id *)(v5 + 24), "stringWithFormat:", @"\tComplete: %lu\n", a3->var1);
  v31 = unint64_t v30 = v5;
  uint64_t v43 = v25;
  v32 = [a1 colorForComplete];
  v44 = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v34 = (void *)[v29 initWithString:v31 attributes:v33];

  [v6 appendAttributedString:v34];
  id v35 = objc_alloc(MEMORY[0x1E4F28B18]);
  v36 = objc_msgSend(*(id *)(v30 + 24), "stringWithFormat:", @"\tTotal: %lu\n", a3->var0);
  char v37 = (void *)[v35 initWithString:v36];

  [v6 appendAttributedString:v37];
  return v6;
}

+ (id)_syndicationProgressDescription:(id *)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@"Syndication Summary:\n"];
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __74__PXPhotoLibraryProcessingProgressReport__syndicationProgressDescription___block_invoke;
  v33 = &unk_1E5DC3B60;
  id v5 = v4;
  id v34 = v5;
  double v6 = (void (**)(void *, uint64_t, int64_t, void *))_Block_copy(&aBlock);
  int64_t var1 = a3->var1;
  id v8 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -6, var1, v8);

  int64_t var2 = a3->var2;
  double v10 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -5, var2, v10);

  int64_t var3 = a3->var3;
  id v12 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -4, var3, v12);

  int64_t var4 = a3->var4;
  double v14 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -3, var4, v14);

  int64_t var5 = a3->var5;
  double v16 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -2, var5, v16);

  int64_t var6 = a3->var6;
  id v18 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -1, var6, v18);

  int64_t var7 = a3->var7;
  long long v20 = [MEMORY[0x1E4FB1618] systemDarkRedColor];
  v6[2](v6, 0, var7, v20);

  int64_t var8 = a3->var8;
  long long v22 = [MEMORY[0x1E4FB1618] systemDarkTealColor];
  v6[2](v6, 1, var8, v22);

  int64_t var9 = a3->var9;
  long long v24 = [MEMORY[0x1E4FB1618] systemDarkGreenColor];
  v6[2](v6, 2, var9, v24);

  id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
  char v26 = objc_msgSend(NSString, "stringWithFormat:", @"\tTotal: %lu\n", a3->var0, aBlock, v31, v32, v33);
  id v27 = (void *)[v25 initWithString:v26];

  [v5 appendAttributedString:v27];
  id v28 = v5;

  return v28;
}

void __74__PXPhotoLibraryProcessingProgressReport__syndicationProgressDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  double v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a4;
  id v8 = [v6 alloc];
  id v9 = NSString;
  double v10 = PHAssetSyndicationEligibilityShortDescription();
  double v11 = [v9 stringWithFormat:@"\t%@: %lu\n", v10, a3];
  uint64_t v14 = *MEMORY[0x1E4FB0700];
  v15[0] = v7;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v13 = (void *)[v8 initWithString:v11 attributes:v12];

  [*(id *)(a1 + 32) appendAttributedString:v13];
}

+ (id)_processingProgressDescription:(id *)a3
{
  if (a3->var0 - a3->var2 < 1) {
    [NSString stringWithFormat:@"%@\n\t%2.1f%%\n", @"Scenes 🏞:", *(void *)&a3->var6, v16, v20];
  }
  else {
  id v4 = [NSString stringWithFormat:@"%@\n\t%2.1f%% (%lu/%lu pending)\n", @"Scenes 🏞:", *(void *)&a3->var6, a3->var0 - a3->var2, a3->var0];
  }
  if (a3->var0 - a3->var3 < 1) {
    [NSString stringWithFormat:@"%@\n\t%2.1f%%\n", @"Faces 🧑:", *(void *)&a3->var7, v17, v21];
  }
  else {
  id v5 = [NSString stringWithFormat:@"%@\n\t%2.1f%% (%lu/%lu pending)\n", @"Faces 🧑:", *(void *)&a3->var7, a3->var0 - a3->var3, a3->var0];
  }
  if (a3->var0 - a3->var4 < 1) {
    [NSString stringWithFormat:@"%@\n\t%2.1f%%\n", @"MediaAnalysis (image):", *(void *)&a3->var8, v18, v22];
  }
  else {
  double v6 = [NSString stringWithFormat:@"%@\n\t%2.1f%% (%lu/%lu pending)\n", @"MediaAnalysis (image):", *(void *)&a3->var8, a3->var0 - a3->var4, a3->var0];
  }
  int64_t var1 = a3->var1;
  if (var1 - a3->var5 < 1) {
    [NSString stringWithFormat:@"%@\n\t%2.1f%%\n", @"MediaAnalysis (video):", *(void *)&a3->var9, v19, v23];
  }
  else {
  id v8 = [NSString stringWithFormat:@"%@\n\t%2.1f%% (%lu/%lu pending)\n", @"MediaAnalysis (video):", *(void *)&a3->var9, var1 - a3->var5, var1];
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  double v10 = (void *)[v9 mutableCopy];
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
  [v10 appendAttributedString:v11];

  [v10 appendAttributedString:v9];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
  [v10 appendAttributedString:v12];

  [v10 appendAttributedString:v9];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  [v10 appendAttributedString:v13];

  [v10 appendAttributedString:v9];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
  [v10 appendAttributedString:v14];

  [v10 appendAttributedString:v9];
  return v10;
}

+ (void)requestFullDescriptionForLibrary:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F8E7F0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke;
  v11[3] = &unk_1E5DC3B38;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 requestProcessingProgressForLibrary:v9 result:v11];
}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 48);
  long long v4 = a2[3];
  v24[2] = a2[2];
  v24[3] = v4;
  v24[4] = a2[4];
  long long v5 = a2[1];
  v24[0] = *a2;
  v24[1] = v5;
  id v6 = [v3 _processingProgressDescription:v24];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_2;
  aBlock[3] = &unk_1E5DC3AC0;
  id v7 = v6;
  id v22 = v7;
  id v23 = *(id *)(a1 + 40);
  id v8 = _Block_copy(aBlock);
  uint64_t v9 = [*(id *)(a1 + 32) wellKnownPhotoLibraryIdentifier];
  id v10 = (void *)MEMORY[0x1E4F8E7F0];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v9 == 3)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_4;
    v19[3] = &unk_1E5DC3AE8;
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = (id *)v20;
    v20[0] = v8;
    v20[1] = v12;
    id v14 = v8;
    [v10 requestSyndicationProgressForLibrary:v11 result:v19];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_5;
    v17[3] = &unk_1E5DC3B10;
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = (id *)v18;
    v18[0] = v8;
    v18[1] = v15;
    id v16 = v8;
    [v10 requestHighlightEnrichmentProgressForLibrary:v11 result:v17];
  }
}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 appendAttributedString:*(void *)(a1 + 32)];
  [v5 appendAttributedString:v4];

  id v6 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setAlignment:0];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v7, 0, objc_msgSend(v5, "length"));
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
  objc_msgSend(v5, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v5, "length"));

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_3;
  v12[3] = &unk_1E5DD3280;
  id v10 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 40);
  long long v4 = a2[3];
  v7[2] = a2[2];
  v7[3] = v4;
  v7[4] = a2[4];
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  id v6 = [v3 _syndicationProgressDescription:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_5(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 40);
  long long v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  long long v5 = a2[3];
  v7[2] = a2[2];
  v7[3] = v5;
  id v6 = [v3 _highlightEnrichmentProgressDescription:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)requestBriefDescriptionForLibrary:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F8E7F0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke;
  v11[3] = &unk_1E5DC3B38;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 requestProcessingProgressForLibrary:v10 result:v11];
}

void __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"🏞: %2.0f%%  🧑: %2.0f%%", *(void *)(a2 + 48), *(void *)(a2 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) wellKnownPhotoLibraryIdentifier];
  long long v5 = (void *)MEMORY[0x1E4F8E7F0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v4 == 3)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_2;
    v18[3] = &unk_1E5DC3A70;
    id v7 = (id *)&v20;
    long long v13 = *(_OWORD *)(a1 + 40);
    id v8 = (id)v13;
    long long v20 = v13;
    id v9 = &v19;
    uint64_t v19 = v3;
    id v10 = v3;
    [v5 requestSyndicationProgressForLibrary:v6 result:v18];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_4;
    v15[3] = &unk_1E5DC3A98;
    id v7 = (id *)&v17;
    long long v14 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v14;
    long long v17 = v14;
    id v9 = &v16;
    id v16 = v3;
    id v12 = v3;
    [v5 requestHighlightEnrichmentProgressForLibrary:v6 result:v15];
  }
}

void __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 48);
  long long v4 = a2[3];
  v12[2] = a2[2];
  v12[3] = v4;
  void v12[4] = a2[4];
  long long v5 = a2[1];
  v12[0] = *a2;
  v12[1] = v5;
  uint64_t v6 = [v3 syndicationProgressImageWithProgressReport:v12];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_3;
  block[3] = &unk_1E5DD0E78;
  id v11 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 48);
  long long v4 = a2[1];
  v12[0] = *a2;
  v12[1] = v4;
  long long v5 = a2[3];
  v12[2] = a2[2];
  v12[3] = v5;
  uint64_t v6 = [v3 highlightEnrichmentProgressImageWithProgressReport:v12];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_5;
  block[3] = &unk_1E5DD0E78;
  id v11 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)colorForComplete
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.8 blue:0.0 alpha:1.0];
}

+ (id)colorForSceneComplete
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.45 green:0.8 blue:0.0 alpha:1.0];
}

+ (id)colorForPartial
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.65 green:0.8 blue:0.0 alpha:1.0];
}

+ (id)colorForDefault
{
  return (id)[MEMORY[0x1E4FB1618] orangeColor];
}

+ (id)colorForNotEnriched
{
  return (id)[MEMORY[0x1E4FB1618] redColor];
}

@end