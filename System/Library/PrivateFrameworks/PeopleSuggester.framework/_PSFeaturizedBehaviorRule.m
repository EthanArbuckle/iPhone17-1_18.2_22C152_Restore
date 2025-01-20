@interface _PSFeaturizedBehaviorRule
- (BMRule)rule;
- (NSMutableDictionary)features;
- (_PSFeaturizedBehaviorRule)initWithRule:(id)a3 score:(double)a4 features:(id)a5;
- (double)score;
- (void)setFeatures:(id)a3;
- (void)setRule:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation _PSFeaturizedBehaviorRule

- (_PSFeaturizedBehaviorRule)initWithRule:(id)a3 score:(double)a4 features:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_PSFeaturizedBehaviorRule;
  v10 = [(_PSFeaturizedBehaviorRule *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(_PSFeaturizedBehaviorRule *)v10 setRule:v8];
    [(_PSFeaturizedBehaviorRule *)v11 setScore:a4];
    [(_PSFeaturizedBehaviorRule *)v11 setFeatures:v9];
  }

  return v11;
}

- (BMRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
}

- (NSMutableDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);

  objc_storeStrong((id *)&self->_rule, 0);
}

@end