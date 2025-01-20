@interface TTSMatchedRuleReplacement
- (NSString)replacement;
- (TTSRegexMatch)match;
- (TTSRuleReplacement)ruleReplacement;
- (void)setMatch:(id)a3;
- (void)setReplacement:(id)a3;
- (void)setRuleReplacement:(id)a3;
@end

@implementation TTSMatchedRuleReplacement

- (TTSRegexMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
}

- (TTSRuleReplacement)ruleReplacement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ruleReplacement);

  return (TTSRuleReplacement *)WeakRetained;
}

- (void)setRuleReplacement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ruleReplacement);
  objc_storeStrong((id *)&self->_replacement, 0);

  objc_storeStrong((id *)&self->_match, 0);
}

@end