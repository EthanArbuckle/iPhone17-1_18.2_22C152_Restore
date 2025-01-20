@interface CASupportsAnimationForKey
@end

@implementation CASupportsAnimationForKey

uint64_t ___CASupportsAnimationForKey_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)qword_1EB25C158;
  qword_1EB25C158 = (uint64_t)v0;

  [(id)qword_1EB25C158 addObject:@"bounds"];
  [(id)qword_1EB25C158 addObject:@"opacity"];
  [(id)qword_1EB25C158 addObject:@"position"];
  [(id)qword_1EB25C158 addObject:@"transform"];
  [(id)qword_1EB25C158 addObject:@"contentsRect"];
  [(id)qword_1EB25C158 addObject:@"contentsCenter"];
  [(id)qword_1EB25C158 addObject:@"backgroundColor"];
  [(id)qword_1EB25C158 addObject:@"contentsMultiplyColor"];
  [(id)qword_1EB25C158 addObject:@"filters.opacityPair.inputAmount"];
  [(id)qword_1EB25C158 addObject:@"filters.distanceField.offset"];
  if (dyld_program_sdk_at_least())
  {
    [(id)qword_1EB25C158 addObject:@"cornerRadius"];
    [(id)qword_1EB25C158 addObject:@"scale"];
    [(id)qword_1EB25C158 addObject:@"anchorPoint"];
  }
  if (dyld_program_sdk_at_least())
  {
    [(id)qword_1EB25C158 addObject:@"transform3D"];
    [(id)qword_1EB25C158 addObject:@"shadowOpacity"];
  }
  if (dyld_program_sdk_at_least())
  {
    [(id)qword_1EB25C158 addObject:@"borderWidth"];
    [(id)qword_1EB25C158 addObject:@"borderColor"];
    [(id)qword_1EB25C158 addObject:@"shadowColor"];
    [(id)qword_1EB25C158 addObject:@"shadowOffset"];
    [(id)qword_1EB25C158 addObject:@"shadowRadius"];
  }
  if (dyld_program_sdk_at_least())
  {
    [(id)qword_1EB25C158 addObject:@"meshTransform"];
    [(id)qword_1EB25C158 addObject:@"sublayerTransform"];
    [(id)qword_1EB25C158 addObject:@"shadowPath"];
    [(id)qword_1EB25C158 addObject:@"zPosition"];
    [(id)qword_1EB25C158 addObject:@"anchorPointZ"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.tintAmount"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.clippingExtents.outsetMinX"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.clippingExtents.outsetMaxX"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.clippingExtents.outsetMinY"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.clippingExtents.outsetMaxY"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.clippingExtents.outsetMinZ"];
    [(id)qword_1EB25C158 addObject:@"separatedOptions.clippingExtents.outsetMaxZ"];
    [(id)qword_1EB25C158 addObject:@"cornerRadii"];
    [(id)qword_1EB25C158 addObject:@"path"];
    [(id)qword_1EB25C158 addObject:@"fillColor"];
    [(id)qword_1EB25C158 addObject:@"strokeColor"];
    [(id)qword_1EB25C158 addObject:@"strokeStart"];
    [(id)qword_1EB25C158 addObject:@"strokeEnd"];
    [(id)qword_1EB25C158 addObject:@"lineWidth"];
    [(id)qword_1EB25C158 addObject:@"miterLimit"];
    [(id)qword_1EB25C158 addObject:@"lineDashPhase"];
    [(id)qword_1EB25C158 addObject:@"colors"];
    [(id)qword_1EB25C158 addObject:@"locations"];
    [(id)qword_1EB25C158 addObject:@"startPoint"];
    [(id)qword_1EB25C158 addObject:@"endPoint"];
  }
  uint64_t result = dyld_program_sdk_at_least();
  if (result)
  {
    v3 = (void *)qword_1EB25C158;
    return [v3 addObject:@"separatedOptions.pointsPerMeter"];
  }
  return result;
}

@end