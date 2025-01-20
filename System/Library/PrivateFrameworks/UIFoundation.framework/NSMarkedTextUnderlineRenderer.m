@interface NSMarkedTextUnderlineRenderer
@end

@implementation NSMarkedTextUnderlineRenderer

void __93____NSMarkedTextUnderlineRenderer__renderUnderlineInTextRange_alphaValue_adjustmentCallback___block_invoke(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  double v5 = a5.n128_f64[0];
  double v6 = a4.n128_f64[0];
  double v7 = a3.n128_f64[0];
  double v8 = a2.n128_f64[0];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  double v12 = *(double *)(v11 + 40);
  if (v10)
  {
    double v8 = (*(double (**)(__n128, __n128, __n128, __n128))(v10 + 16))(a2, a3, a4, a5);
    double v7 = v13;
    double v6 = v14;
    double v5 = v15;
    uint64_t v11 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v11 + 48) & 0x3000;
  switch(v16)
  {
    case 12288:
      goto LABEL_8;
    case 4096:
      goto LABEL_10;
    case 0:
      v17 = (void *)[*(id *)(v11 + 8) textLayoutFragment];
      v18 = objc_msgSend((id)objc_msgSend(v17, "textLayoutManager"), "textContainerForLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "textElement"), "elementRange"), "location"));
      if (v18 && [v18 layoutOrientation])
      {
LABEL_8:
        if (*(unsigned char *)(a1 + 64)) {
          double v19 = v7 + v5 + *(double *)(*(void *)(a1 + 32) + 32);
        }
        else {
          double v19 = *(double *)(*(void *)(a1 + 32) + 32) - (v7 + v5);
        }
        goto LABEL_18;
      }
LABEL_10:
      [*(id *)(*(void *)(a1 + 32) + 8) glyphOrigin];
      double v21 = (v5 - v20) * 0.5;
      double v22 = floor(v21);
      if (v21 >= 4.0) {
        double v23 = (v21 - v12) * 0.666;
      }
      else {
        double v23 = v22;
      }
      double v24 = v7 + v23;
      double v25 = v7 + v5 - v23;
      BOOL v26 = *(unsigned char *)(a1 + 64) == 0;
      goto LABEL_15;
  }
  double v27 = *(double *)(v11 + 32);
  double v24 = v27 - v7;
  double v25 = v7 + v27;
  BOOL v26 = *(unsigned char *)(a1 + 64) == 0;
LABEL_15:
  if (v26) {
    double v19 = v24;
  }
  else {
    double v19 = v25;
  }
LABEL_18:
  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 8) _setColor:*(void *)(*(void *)(a1 + 32) + 56) inGraphicsContext:*(void *)(*(void *)(a1 + 32) + 16)];
  double v28 = v6 + v8;
  if (v6 + v8 - v8 > 1.0) {
    double v8 = v8 + 1.0;
  }
  if (v28 - v8 <= 1.0) {
    double v29 = v28;
  }
  else {
    double v29 = v28 + -1.0;
  }
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 48), v12);
  CGContextSetLineCap(*(CGContextRef *)(a1 + 48), kCGLineCapRound);
  CGContextSetAlpha(*(CGContextRef *)(a1 + 48), *(CGFloat *)(a1 + 56));
  CGContextMoveToPoint(*(CGContextRef *)(a1 + 48), v8, v19);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 48), v29, v19);
  CGContextStrokePath(*(CGContextRef *)(a1 + 48));
  v30 = *(CGContext **)(a1 + 48);

  CGContextRestoreGState(v30);
}

@end