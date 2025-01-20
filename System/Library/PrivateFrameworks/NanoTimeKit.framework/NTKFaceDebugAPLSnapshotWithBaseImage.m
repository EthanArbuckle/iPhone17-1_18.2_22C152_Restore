@interface NTKFaceDebugAPLSnapshotWithBaseImage
@end

@implementation NTKFaceDebugAPLSnapshotWithBaseImage

uint64_t ___NTKFaceDebugAPLSnapshotWithBaseImage_block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  CGContextSetRGBFillColor(v3, 0.0, 0.0, 0.0, 0.5);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v4, v5, v6, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  v9 = (const CGPath *)[v8 CGPath];

  CGContextAddPath(v3, v9);
  CGContextDrawPath(v3, kCGPathFill);
  double v10 = (*(double *)(a1 + 56) - *(double *)(a1 + 64)) * 0.5;
  v11 = *(void **)(a1 + 40);

  return objc_msgSend(v11, "drawAtPoint:", 0.0, v10);
}

@end