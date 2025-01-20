@interface UIHyperInteractor
@end

@implementation UIHyperInteractor

uint64_t __46___UIHyperInteractor__copyUnconstrainedPoint___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __46___UIHyperInteractor__copyInitialTranslation___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __39___UIHyperInteractor__copyTranslation___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

void __40___UIHyperInteractor__commitTranslation__block_invoke(uint64_t a1, double *__A)
{
  vDSP_vaddD(__A, 1, *(const double **)(*(void *)(a1 + 32) + 16), 1, __A, 1, *(void *)(*(void *)(a1 + 32) + 200));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(const double **)(v4 + 24);
  vDSP_Length v6 = *(void *)(v4 + 200);
  vDSP_vaddD(__A, 1, v5, 1, __A, 1, v6);
}

uint64_t __40___UIHyperInteractor__commitTranslation__block_invoke_2()
{
  return catlas_dset_NEWLAPACK();
}

uint64_t __40___UIHyperInteractor__commitTranslation__block_invoke_3()
{
  return catlas_dset_NEWLAPACK();
}

uint64_t __36___UIHyperInteractor__copyVelocity___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __53___UIHyperInteractor__copyOverridePresentationPoint___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __83___UIHyperInteractor__interactionChangedCopyingTranslation_velocity_mutatingState___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __83___UIHyperInteractor__interactionChangedCopyingTranslation_velocity_mutatingState___block_invoke_2()
{
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __53___UIHyperInteractor__interactionEndedMutatingState___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) _commitTranslation];
  v3 = *(void **)(a1 + 32);
  return [v3 _setInteractive:0];
}

@end