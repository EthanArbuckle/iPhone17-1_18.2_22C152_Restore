@interface MNNavigationServiceCallback_DidUpdateStepIndex
+ (BOOL)supportsSecureCoding;
- (MNNavigationServiceCallback_DidUpdateStepIndex)initWithCoder:(id)a3;
- (unint64_t)segmentIndex;
- (unint64_t)stepIndex;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setSegmentIndex:(unint64_t)a3;
- (void)setStepIndex:(unint64_t)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateStepIndex

- (unint64_t)type
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateStepIndex;
  id v4 = a3;
  [(MNNavigationServiceCallbackParameters *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_stepIndex, @"_stepIndex", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_segmentIndex forKey:@"_segmentIndex"];
}

- (MNNavigationServiceCallback_DidUpdateStepIndex)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_DidUpdateStepIndex;
  objc_super v5 = [(MNNavigationServiceCallbackParameters *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_stepIndex = [v4 decodeIntegerForKey:@"_stepIndex"];
    v5->_segmentIndex = [v4 decodeIntegerForKey:@"_segmentIndex"];
    v6 = v5;
  }

  return v5;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->_segmentIndex = a3;
}

@end