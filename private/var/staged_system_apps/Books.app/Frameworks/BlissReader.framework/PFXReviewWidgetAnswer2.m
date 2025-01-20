@interface PFXReviewWidgetAnswer2
- (NSString)accessibilityDescription;
- (NSString)targetAccessibilityDescription;
- (TSDBezierPath)targetRegion;
- (TSDInfoGeometry)answerGeometry;
- (double)answerWeight;
- (int)placementHint;
- (void)dealloc;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAnswerGeometry:(id)a3;
- (void)setAnswerWeight:(double)a3;
- (void)setTargetAccessibilityDescription:(id)a3;
- (void)setTargetRegion:(id)a3;
@end

@implementation PFXReviewWidgetAnswer2

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetAnswer2;
  [(PFXReviewWidgetAnswer2 *)&v3 dealloc];
}

- (int)placementHint
{
  targetRegion = self->_targetRegion;
  if (targetRegion)
  {
    if (self->_answerGeometry)
    {
      [(TSDBezierPath *)targetRegion bounds];
      TSDCenterOfRect();
      double v5 = v4;
      double v7 = v6;
      [(TSDInfoGeometry *)self->_answerGeometry center];
      double v10 = v9 - v5;
      double v11 = vabdd_f64(v8, v7);
      if (v11 >= -v10)
      {
        if (v11 >= v10)
        {
          if (v8 - v7 <= fabs(v10)) {
            LODWORD(targetRegion) = 1;
          }
          else {
            LODWORD(targetRegion) = 3;
          }
        }
        else
        {
          LODWORD(targetRegion) = 2;
        }
      }
      else
      {
        LODWORD(targetRegion) = 4;
      }
    }
    else
    {
      LODWORD(targetRegion) = 0;
    }
  }
  return (int)targetRegion;
}

- (double)answerWeight
{
  return self->_answerWeight;
}

- (void)setAnswerWeight:(double)a3
{
  self->_answerWeight = a3;
}

- (TSDBezierPath)targetRegion
{
  return self->_targetRegion;
}

- (void)setTargetRegion:(id)a3
{
}

- (TSDInfoGeometry)answerGeometry
{
  return self->_answerGeometry;
}

- (void)setAnswerGeometry:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)targetAccessibilityDescription
{
  return self->_targetAccessibilityDescription;
}

- (void)setTargetAccessibilityDescription:(id)a3
{
}

@end