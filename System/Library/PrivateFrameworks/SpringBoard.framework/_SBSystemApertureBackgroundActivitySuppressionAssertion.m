@interface _SBSystemApertureBackgroundActivitySuppressionAssertion
- (NSSet)backgroundActivitiesToSuppress;
- (_SBSystemApertureBackgroundActivitySuppressionAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 backgroundActivitiesToSuppress:(id)a5 invalidationBlock:(id)a6;
@end

@implementation _SBSystemApertureBackgroundActivitySuppressionAssertion

- (_SBSystemApertureBackgroundActivitySuppressionAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 backgroundActivitiesToSuppress:(id)a5 invalidationBlock:(id)a6
{
  id v10 = a5;
  v11 = [(BSSimpleAssertion *)self initWithIdentifier:a3 forReason:a4 invalidationBlock:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    backgroundActivitiesToSuppress = v11->_backgroundActivitiesToSuppress;
    v11->_backgroundActivitiesToSuppress = (NSSet *)v12;
  }
  return v11;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return self->_backgroundActivitiesToSuppress;
}

- (void).cxx_destruct
{
}

@end