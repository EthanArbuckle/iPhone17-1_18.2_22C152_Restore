@interface _UIWindowAnchoringConstraint
- (BOOL)_addToEngine:(id)a3 integralizationAdjustment:(double)a4 mutuallyExclusiveConstraints:(id *)a5;
@end

@implementation _UIWindowAnchoringConstraint

- (BOOL)_addToEngine:(id)a3 integralizationAdjustment:(double)a4 mutuallyExclusiveConstraints:(id *)a5
{
  window = self->_window;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || window
    && [(UIView *)window _forceLayoutEngineSolutionInRationalEdges])
  {
    char v10 = 1;
  }
  else
  {
    [(UIWindow *)self->_window _setIsLoweringAnchoringConstraints:1];
    char v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIWindowAnchoringConstraint;
  BOOL v11 = [(_UIWindowAnchoringConstraint *)&v13 _addToEngine:a3 integralizationAdjustment:a5 mutuallyExclusiveConstraints:a4];
  if ((v10 & 1) == 0) {
    [(UIWindow *)self->_window _setIsLoweringAnchoringConstraints:0];
  }
  return v11;
}

@end