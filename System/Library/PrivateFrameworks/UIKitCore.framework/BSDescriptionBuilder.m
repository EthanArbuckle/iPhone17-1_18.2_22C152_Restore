@interface BSDescriptionBuilder
@end

@implementation BSDescriptionBuilder

void __89__BSDescriptionBuilder_UIKitAdditions__ui_appendUserInterfaceIdiom_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  _NSStringFromUIUserInterfaceIdiom(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v4];
}

void __93__BSDescriptionBuilder_UIKitAdditions__ui_appendObject_withName_usingLightweightDescription___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = NSString;
    id v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
  }
  else
  {
    v8 = @"(nil)";
  }
  [v9 appendString:v8];
}

uint64_t __64__BSDescriptionBuilder_UIKitAdditions__ui_appendFloat_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%g", *(void *)(a1 + 32));
}

uint64_t __82__BSDescriptionBuilder_UIKitAdditions__ui_appendVector_withName_decimalPrecision___block_invoke(void *a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", a1[4], a1[5], a1[4], a1[6]];
}

void __83__BSDescriptionBuilder_UIKitAdditions__ui_appendTransform_withName_skipIfIdentity___block_invoke(_OWORD *a1, void *a2)
{
  id v3 = a2;
  long long v4 = a1[3];
  *(_OWORD *)&v7.a = a1[2];
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = a1[4];
  if (CGAffineTransformIsIdentity(&v7))
  {
    [v3 appendString:@"<CGAffineTransformIdentity>"];
  }
  else
  {
    long long v5 = a1[3];
    *(_OWORD *)&v7.a = a1[2];
    *(_OWORD *)&v7.c = v5;
    *(_OWORD *)&v7.tx = a1[4];
    v6 = NSStringFromCGAffineTransform(&v7);
    [v3 appendString:v6];
  }
}

void __93__BSDescriptionBuilder_UIKitAdditions__ui_appendInterfaceOrientation_withName_skipIfUnknown___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BSInterfaceOrientationDescription();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendString:v3];
}

void __95__BSDescriptionBuilder_UIKitAdditions__ui_appendInterfaceOrientationMask_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BSInterfaceOrientationMaskDescription();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendString:v3];
}

uint64_t __104__BSDescriptionBuilder_UIKitAdditions__ui_appendReferenceDisplayModeStatus_withName_skipIfNotSupported___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void *)(a1 + 32) - 1;
  if (v2 > 2) {
    id v3 = @"notSupported";
  }
  else {
    id v3 = off_1E52EE500[v2];
  }
  return [a2 appendString:v3];
}

void __107__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebugDescription_withName_skipIfNil___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 activeMultilinePrefix];
  long long v5 = [v2 _orientationDebugDescriptionWithMultilinePrefix:v6];
  [v4 appendString:v5];
}

id __114__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebuggingArraySection_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 activeMultilinePrefix];
  long long v5 = [v4 stringByAppendingString:@"    "];

  id v6 = [v3 _orientationDebugDescriptionWithMultilinePrefix:v5];

  return v6;
}

@end