@interface TSDRep(SXAccessibility)
- (double)SXAXConvertNaturalRectToScreenSpace:()SXAccessibility;
- (id)_accessibilityParentForFindingScrollParent;
- (id)_accessibilityWindow;
- (uint64_t)SXAXConvertNaturalPointToScreenSpace:()SXAccessibility;
- (uint64_t)SXAXConvertScreenPointToNaturalSpace:()SXAccessibility;
- (uint64_t)SXAXConvertScreenRectToNaturalSpace:()SXAccessibility;
- (uint64_t)accessibilityFrame;
- (uint64_t)isAccessibilityElement;
@end

@implementation TSDRep(SXAccessibility)

- (double)SXAXConvertNaturalRectToScreenSpace:()SXAccessibility
{
  if ([a1 hasBeenRemoved]) {
    return *MEMORY[0x263F001A8];
  }
  objc_msgSend(a1, "convertNaturalRectToUnscaledCanvas:", a2, a3, a4, a5);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [a1 interactiveCanvasController];
  objc_msgSend(v19, "convertUnscaledToBoundsRect:", v12, v14, v16, v18);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v28 = [a1 interactiveCanvasController];
  v29 = [v28 canvasView];
  v31.origin.x = v21;
  v31.origin.y = v23;
  v31.size.width = v25;
  v31.size.height = v27;
  *(void *)&double v10 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v31, v29);

  return v10;
}

- (uint64_t)SXAXConvertScreenRectToNaturalSpace:()SXAccessibility
{
  uint64_t result = [a1 hasBeenRemoved];
  if ((result & 1) == 0)
  {
    double v11 = [a1 interactiveCanvasController];
    objc_msgSend(v11, "convertBoundsToUnscaledRect:", a2, a3, a4, a5);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    return objc_msgSend(a1, "convertNaturalRectFromUnscaledCanvas:", v13, v15, v17, v19);
  }
  return result;
}

- (uint64_t)SXAXConvertNaturalPointToScreenSpace:()SXAccessibility
{
  return objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:", a3, a4, 0.0, 0.0);
}

- (uint64_t)SXAXConvertScreenPointToNaturalSpace:()SXAccessibility
{
  return objc_msgSend(a1, "SXAXConvertScreenRectToNaturalSpace:", a3, a4, 0.0, 0.0);
}

- (uint64_t)isAccessibilityElement
{
  return 0;
}

- (uint64_t)accessibilityFrame
{
  [a1 naturalBounds];
  return objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:");
}

- (id)_accessibilityParentForFindingScrollParent
{
  v1 = [a1 interactiveCanvasController];
  v2 = [v1 canvasView];

  return v2;
}

- (id)_accessibilityWindow
{
  v1 = [a1 interactiveCanvasController];
  v2 = [v1 canvasView];
  v3 = [v2 window];

  return v3;
}

@end