@interface TSDCanvasView
@end

@implementation TSDCanvasView

uint64_t __52__TSDCanvasView_SXAccessibility___speakThisElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 accessibilityFrame];
  double v6 = v5;
  double v8 = v7;
  [v4 accessibilityFrame];
  double v10 = v9;
  double v12 = v11;

  if (v8 < v12) {
    return -1;
  }
  if (v8 > v12) {
    return 1;
  }
  if (v6 >= v10) {
    return v6 > v10;
  }
  else {
    return -1;
  }
}

uint64_t __53__TSDCanvasView_SXAccessibility___isInPreviewPlatter__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end