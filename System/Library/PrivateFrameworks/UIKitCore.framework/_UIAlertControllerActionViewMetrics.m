@interface _UIAlertControllerActionViewMetrics
- (double)descriptiveLabelTextWidth;
- (double)labelTextWidth;
- (void)setDescriptiveLabelTextWidth:(double)a3;
- (void)setLabelTextWidth:(double)a3;
@end

@implementation _UIAlertControllerActionViewMetrics

- (double)descriptiveLabelTextWidth
{
  return self->_descriptiveLabelTextWidth;
}

- (void)setDescriptiveLabelTextWidth:(double)a3
{
  self->_descriptiveLabelTextWidth = a3;
}

- (double)labelTextWidth
{
  return self->_labelTextWidth;
}

- (void)setLabelTextWidth:(double)a3
{
  self->_labelTextWidth = a3;
}

@end