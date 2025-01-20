@interface PFLCCurationPositionScore
- (CGRect)cropRect;
- (CGRect)timeLabelRect;
- (PFLCCurationPositionScore)initWithCropScore:(double)a3 cropRect:(CGRect)a4 timeLabelRect:(CGRect)a5 classification:(unint64_t)a6;
- (double)cropScore;
- (id)description;
- (unint64_t)classification;
@end

@implementation PFLCCurationPositionScore

- (PFLCCurationPositionScore)initWithCropScore:(double)a3 cropRect:(CGRect)a4 timeLabelRect:(CGRect)a5 classification:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PFLCCurationPositionScore;
  result = [(PFLCCurationPositionScore *)&v13 init];
  if (result)
  {
    result->_cropScore = a3;
    result->_cropRect.origin.CGFloat x = x;
    result->_cropRect.origin.CGFloat y = y;
    result->_cropRect.size.CGFloat width = width;
    result->_cropRect.size.CGFloat height = height;
    result->_timeLabelRect = a5;
    result->_classification = a6;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  double cropScore = self->_cropScore;
  v5 = _rectAsString(self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  v6 = _rectAsString(self->_timeLabelRect.origin.x, self->_timeLabelRect.origin.y, self->_timeLabelRect.size.width, self->_timeLabelRect.size.height);
  v7 = [v3 stringWithFormat:@"PositionScore[ crop=%.3f, rect=%@, time=%@, clas=%ld ]", *(void *)&cropScore, v5, v6, self->_classification];

  return v7;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)timeLabelRect
{
  double x = self->_timeLabelRect.origin.x;
  double y = self->_timeLabelRect.origin.y;
  double width = self->_timeLabelRect.size.width;
  double height = self->_timeLabelRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)classification
{
  return self->_classification;
}

@end