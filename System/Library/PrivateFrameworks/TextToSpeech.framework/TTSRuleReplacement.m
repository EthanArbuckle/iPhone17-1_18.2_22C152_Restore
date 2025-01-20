@interface TTSRuleReplacement
- (BOOL)isTerminalRule;
- (NSString)identifier;
- (NSString)replacement;
- (TTSRegex)regex;
- (TTSRuleGroup)group;
- (TTSRuleset)ruleset;
- (id)postMatch;
- (unint64_t)effectiveIndex;
- (unint64_t)index;
- (unsigned)originalRulesetIndex;
- (void)setGroup:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setIsTerminalRule:(BOOL)a3;
- (void)setOriginalRulesetIndex:(unsigned int)a3;
- (void)setPostMatch:(id)a3;
- (void)setRegex:(id)a3;
- (void)setReplacement:(id)a3;
- (void)setRuleset:(id)a3;
@end

@implementation TTSRuleReplacement

- (unint64_t)effectiveIndex
{
  v6 = objc_msgSend_group(self, a2, v2, v3, v4);

  if (v6)
  {
    v11 = objc_msgSend_group(self, v7, v8, v9, v10);
    unint64_t v16 = objc_msgSend_endIndex(v11, v12, v13, v14, v15);

    return v16;
  }
  else
  {
    return MEMORY[0x1F4181798](self, sel_index, v8, v9, v10);
  }
}

- (NSString)identifier
{
  v6 = NSString;
  v7 = objc_msgSend_ruleset(self, a2, v2, v3, v4);
  v12 = objc_msgSend_identifier(v7, v8, v9, v10, v11);
  uint64_t v13 = NSNumber;
  uint64_t v18 = objc_msgSend_originalRulesetIndex(self, v14, v15, v16, v17);
  v22 = objc_msgSend_numberWithUnsignedInt_(v13, v19, v18, v20, v21);
  v26 = objc_msgSend_stringWithFormat_(v6, v23, @"%@_%@", v24, v25, v12, v22);

  return (NSString *)v26;
}

- (TTSRegex)regex
{
  return self->_regex;
}

- (void)setRegex:(id)a3
{
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
}

- (id)postMatch
{
  return self->_postMatch;
}

- (void)setPostMatch:(id)a3
{
}

- (BOOL)isTerminalRule
{
  return self->_isTerminalRule;
}

- (void)setIsTerminalRule:(BOOL)a3
{
  self->_isTerminalRule = a3;
}

- (TTSRuleset)ruleset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ruleset);

  return (TTSRuleset *)WeakRetained;
}

- (void)setRuleset:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unsigned)originalRulesetIndex
{
  return self->_originalRulesetIndex;
}

- (void)setOriginalRulesetIndex:(unsigned int)a3
{
  self->_originalRulesetIndex = a3;
}

- (TTSRuleGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_ruleset);
  objc_storeStrong(&self->_postMatch, 0);
  objc_storeStrong((id *)&self->_replacement, 0);

  objc_storeStrong((id *)&self->_regex, 0);
}

@end