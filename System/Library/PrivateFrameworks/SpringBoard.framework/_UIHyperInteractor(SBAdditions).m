@interface _UIHyperInteractor(SBAdditions)
- (BOOL)sbpip_isRubberBanding;
- (uint64_t)sbpip_isInteractive;
- (void)sbpip_setInteractive:()SBAdditions;
@end

@implementation _UIHyperInteractor(SBAdditions)

- (BOOL)sbpip_isRubberBanding
{
  if ([a1 _dimensions] != 2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"_UIHyperInteractor_SBAdditions.m" lineNumber:17 description:@"This _UIHyperInteractor category can only handle 2D interactors."];
  }
  double v4 = *(double *)[a1 _translation];
  double v5 = *(double *)([a1 _translation] + 8);
  double v6 = v4 + *(double *)[a1 _unconstrainedPoint];
  double v7 = v5 + *(double *)([a1 _unconstrainedPoint] + 8);
  double v8 = *(double *)[a1 _closestPoint];
  return v7 != *(double *)([a1 _closestPoint] + 8) || v6 != v8;
}

- (void)sbpip_setInteractive:()SBAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &kSBPIPInteractionControllerHyperInteractorIsDirtyAssociationKey, v2, (void *)1);
}

- (uint64_t)sbpip_isInteractive
{
  v1 = objc_getAssociatedObject(a1, &kSBPIPInteractionControllerHyperInteractorIsDirtyAssociationKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end