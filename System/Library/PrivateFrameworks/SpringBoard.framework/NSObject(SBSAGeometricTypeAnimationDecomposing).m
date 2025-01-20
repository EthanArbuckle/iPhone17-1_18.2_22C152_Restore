@interface NSObject(SBSAGeometricTypeAnimationDecomposing)
- (id)_independentlyAnimatableMemberKeyPathsForProperty:()SBSAGeometricTypeAnimationDecomposing;
- (void)_setValue:()SBSAGeometricTypeAnimationDecomposing byUpdatingMemberKeypaths:forKeyPath:;
@end

@implementation NSObject(SBSAGeometricTypeAnimationDecomposing)

- (id)_independentlyAnimatableMemberKeyPathsForProperty:()SBSAGeometricTypeAnimationDecomposing
{
  if (_independentlyAnimatableMemberKeyPathsForProperty____onceToken != -1) {
    dispatch_once(&_independentlyAnimatableMemberKeyPathsForProperty____onceToken, &__block_literal_global_92);
  }
  v0 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____emptySet;
  return v0;
}

- (void)_setValue:()SBSAGeometricTypeAnimationDecomposing byUpdatingMemberKeypaths:forKeyPath:
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"NSObject+SBSAGeometricTypeAnimationDecomposing.m" lineNumber:31 description:@"Subclass Responsibility"];
}

@end