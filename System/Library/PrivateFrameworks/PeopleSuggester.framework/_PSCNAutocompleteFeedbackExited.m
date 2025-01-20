@interface _PSCNAutocompleteFeedbackExited
+ (BOOL)supportsSecureCoding;
- (_PSCNAutocompleteFeedbackExited)initWithCoder:(id)a3;
- (_PSCNAutocompleteFeedbackExited)initWithExitStatus:(int64_t)a3;
- (int64_t)exitStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSCNAutocompleteFeedbackExited

- (_PSCNAutocompleteFeedbackExited)initWithExitStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PSCNAutocompleteFeedbackExited;
  result = [(_PSCNAutocompleteFeedbackExited *)&v5 init];
  if (result) {
    result->_exitStatus = a3;
  }
  return result;
}

- (_PSCNAutocompleteFeedbackExited)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSCNAutocompleteFeedbackExited;
  objc_super v5 = [(_PSCNAutocompleteFeedbackExited *)&v8 init];
  if (v5)
  {
    v5->_exitStatus = [v4 decodeIntegerForKey:@"exitStatus"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)exitStatus
{
  return self->_exitStatus;
}

@end