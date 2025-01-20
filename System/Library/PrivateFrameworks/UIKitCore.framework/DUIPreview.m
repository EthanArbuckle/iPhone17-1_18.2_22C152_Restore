@interface DUIPreview
@end

@implementation DUIPreview

double __26___DUIPreview_scaleFactor__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) boundingSize];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v5 = v4 / v2;
  double v7 = v6 / v3;
  if (v5 >= v7) {
    double v5 = v7;
  }
  double v8 = *(double *)(a1 + 64);
  double v9 = *(double *)(a1 + 56) / v2;
  if (v9 < v8 / v3) {
    double v9 = v8 / v3;
  }
  return fmax(v9, fmin(v5, 1.0));
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke()
{
  return @"backgroundColor";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_2()
{
  return @"contentOffset";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_3()
{
  return @"contentSize";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_4()
{
  return @"hidesSourceView";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_5()
{
  return @"liftAnchorPoint";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_6()
{
  return @"originalCenter";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_7()
{
  return @"originalRotation";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_8()
{
  return @"originalCenterInCoordinateSpace";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_9()
{
  return @"coordinateSpaceSourceLayerContext";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_10()
{
  return @"outline";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_11()
{
  return @"hasCustomOutline";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_12()
{
  return @"shadowPath";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_13()
{
  return @"previewMode";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_14()
{
  return @"avoidAnimation";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_15()
{
  return @"wantsSuppressedMask";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_16()
{
  return @"shadowProperties";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_17()
{
  return @"overrideStackTransform";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_18()
{
  return @"initialBadgeLocation";
}

__CFString *__29___DUIPreview_initWithCoder___block_invoke_19()
{
  return @"preferredStackOrder";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke()
{
  return @"backgroundColor";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_2()
{
  return @"contentOffset";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_3()
{
  return @"contentSize";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_4()
{
  return @"hidesSourceView";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_5()
{
  return @"liftAnchorPoint";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_6()
{
  return @"originalCenter";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_7()
{
  return @"originalRotation";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_8()
{
  return @"originalCenterInCoordinateSpace";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_9()
{
  return @"coordinateSpaceSourceLayerContext";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_10()
{
  return @"outline";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_11()
{
  return @"hasCustomOutline";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_12()
{
  return @"shadowPath";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_13()
{
  return @"previewMode";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_14()
{
  return @"avoidAnimation";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_15()
{
  return @"wantsSuppressedMask";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_16()
{
  return @"shadowProperties";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_17()
{
  return @"overrideStackTransform";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_18()
{
  return @"initialBadgeLocation";
}

__CFString *__31___DUIPreview_encodeWithCoder___block_invoke_19()
{
  return @"preferredStackOrder";
}

@end