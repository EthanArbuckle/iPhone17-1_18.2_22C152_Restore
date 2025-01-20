@interface PXStoryClipSeparatorEffectFactory
+ ($AEFAD17AB1CC80BF212AA0D0E83A8824)parametersForPanTowardsEdge:(SEL)a3 distance:(unsigned int)a4;
+ ($AEFAD17AB1CC80BF212AA0D0E83A8824)parametersForRotationWithAngle:(SEL)a3;
+ (void)getParameters:(id *)a3 forOppositePansWithDistance:(double)a4 threeUpComposition:(id)a5;
+ (void)getParameters:(id *)a3 forOppositeRotationsWithAngle:(double)a4 threeUpComposition:(id)a5;
+ (void)getParameters:(id *)a3 forParallelPansWithDistance:(double)a4 threeUpComposition:(id)a5;
+ (void)getParameters:(id *)a3 forParallelRotationsWithAngle:(double)a4 threeUpComposition:(id)a5;
@end

@implementation PXStoryClipSeparatorEffectFactory

+ (void)getParameters:(id *)a3 forOppositeRotationsWithAngle:(double)a4 threeUpComposition:(id)a5
{
  id v9 = a5;
  if ([v9 numberOfClips] != 3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 177, @"Invalid parameter not satisfying: %@", @"composition.numberOfClips == 3" object file lineNumber description];
  }
  id v10 = v9;
  uint64_t v11 = *(void *)[v10 dividerAxes];
  id v12 = v10;
  uint64_t v13 = [v12 dividerAxes];

  if (v11 != *(void *)(v13 + 8))
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 178, @"Invalid parameter not satisfying: %@", @"composition.dividerAxes[0] == composition.dividerAxes[1]" object file lineNumber description];
  }
  [a1 parametersForRotationWithAngle:a4];
  *(_OWORD *)&a3->var0 = v16;
  a3->var2 = v17;
  [a1 parametersForRotationWithAngle:-a4];
  *(_OWORD *)&a3[1].var0 = v16;
  a3[1].var2 = v17;
}

+ (void)getParameters:(id *)a3 forParallelRotationsWithAngle:(double)a4 threeUpComposition:(id)a5
{
  id v9 = a5;
  if ([v9 numberOfClips] != 3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 171, @"Invalid parameter not satisfying: %@", @"composition.numberOfClips == 3" object file lineNumber description];
  }
  id v10 = v9;
  uint64_t v11 = *(void *)[v10 dividerAxes];
  id v12 = v10;
  uint64_t v13 = [v12 dividerAxes];

  if (v11 != *(void *)(v13 + 8))
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 172, @"Invalid parameter not satisfying: %@", @"composition.dividerAxes[0] == composition.dividerAxes[1]" object file lineNumber description];
  }
  [a1 parametersForRotationWithAngle:a4];
  *(_OWORD *)&a3[1].var0 = v16;
  a3[1].var2 = v17;
  *(_OWORD *)&a3->var0 = *(_OWORD *)&a3[1].var0;
  a3->var2 = v17;
}

+ (void)getParameters:(id *)a3 forOppositePansWithDistance:(double)a4 threeUpComposition:(id)a5
{
  id v7 = a5;
  if ([v7 numberOfClips] != 3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 163, @"Invalid parameter not satisfying: %@", @"composition.numberOfClips == 3" object file lineNumber description];
  }
  id v8 = v7;
  uint64_t v9 = *(void *)[v8 dividerAxes];
  id v10 = v8;
  if (v9 != *(void *)([v10 dividerAxes] + 8))
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 164, @"Invalid parameter not satisfying: %@", @"composition.dividerAxes[0] == composition.dividerAxes[1]" object file lineNumber description];
  }
  [v10 mainDividerAxis];
  PXAxisTransposed();
}

+ (void)getParameters:(id *)a3 forParallelPansWithDistance:(double)a4 threeUpComposition:(id)a5
{
  id v7 = a5;
  if ([v7 numberOfClips] != 3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 156, @"Invalid parameter not satisfying: %@", @"composition.numberOfClips == 3" object file lineNumber description];
  }
  id v8 = v7;
  uint64_t v9 = *(void *)[v8 dividerAxes];
  id v10 = v8;
  if (v9 != *(void *)([v10 dividerAxes] + 8))
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXStoryClipSeparatorEffect.m", 157, @"Invalid parameter not satisfying: %@", @"composition.dividerAxes[0] == composition.dividerAxes[1]" object file lineNumber description];
  }
  [v10 mainDividerAxis];
  PXAxisTransposed();
}

+ ($AEFAD17AB1CC80BF212AA0D0E83A8824)parametersForRotationWithAngle:(SEL)a3
{
  retstr->var0 = 42;
  retstr->var1 = 0.0;
  retstr->var2 = a4;
  return result;
}

+ ($AEFAD17AB1CC80BF212AA0D0E83A8824)parametersForPanTowardsEdge:(SEL)a3 distance:(unsigned int)a4
{
  if (a5 < 0.0) {
    PXRectEdgeOpposite();
  }
  retstr->var0 = a4;
  retstr->var1 = a5;
  retstr->var2 = 0.0;
  return result;
}

@end