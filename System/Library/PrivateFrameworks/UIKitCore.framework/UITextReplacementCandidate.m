@interface UITextReplacementCandidate
+ (id)textReplacementCandidateForTextReplacement:(id)a3;
- (UITextReplacement)replacement;
- (id)_initWithTextReplacement:(id)a3;
- (id)label;
@end

@implementation UITextReplacementCandidate

+ (id)textReplacementCandidateForTextReplacement:(id)a3
{
  id v3 = a3;
  id v4 = [[UITextReplacementCandidate alloc] _initWithTextReplacement:v3];

  return v4;
}

- (id)_initWithTextReplacement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextReplacementCandidate;
  v6 = [(UITextReplacementCandidate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_replacement, a3);
  }

  return v7;
}

- (id)label
{
  return [(UITextReplacement *)self->_replacement menuTitle];
}

- (UITextReplacement)replacement
{
  return self->_replacement;
}

- (void).cxx_destruct
{
}

@end