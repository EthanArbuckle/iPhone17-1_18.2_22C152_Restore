@interface PLProcessAssertion
- (PLProcessAssertion)initWithIdentifier:(id)a3;
- (id)description;
@end

@implementation PLProcessAssertion

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%p:%@ %@ %p>", self, v4, objc_opt_class(), self->_processAssertion];
}

- (PLProcessAssertion)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLProcessAssertion;
  v5 = [(PLProcessAssertion *)&v10 init];
  if (v5)
  {
    getpid();
    uint64_t v6 = SBSProcessAssertionCreateForPID();
    id processAssertion = v5->_processAssertion;
    v5->_id processAssertion = (id)v6;

    v8 = v5;
  }

  return v5;
}

@end