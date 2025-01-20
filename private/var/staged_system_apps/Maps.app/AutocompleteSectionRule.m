@interface AutocompleteSectionRule
+ (id)ruleExcludingSourceType:(int64_t)a3;
+ (id)ruleExcludingSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4;
+ (id)ruleMatchingAnySourceType;
+ (id)ruleMatchingAnySourceTypeWithIndexInCompletionSections:(id)a3;
+ (id)ruleWithSourceType:(int64_t)a3;
+ (id)ruleWithSourceType:(int64_t)a3 indexInCompletionSections:(id)a4;
+ (id)ruleWithSourceType:(int64_t)a3 matchesAnySourceSubtype:(BOOL)a4 sourceSubtype:(int64_t)a5 indexInCompletionSections:(id)a6;
+ (id)ruleWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4;
+ (id)ruleWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4 indexInCompletionSections:(id)a5;
- (BOOL)excludesAnySourceSubtype;
- (BOOL)excludesAnySourceType;
- (BOOL)matchesAnyIndexInCompletionSections;
- (BOOL)matchesAnySourceSubtype;
- (BOOL)matchesAnySourceType;
- (BOOL)matchesItemWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4 indexInCompletionSections:(id)a5;
- (NSNumber)indexInCompletionSections;
- (id)debugDescription;
- (id)initMatchingAnySourceType:(BOOL)a3 sourceType:(int64_t)a4 matchesAnySourceSubtype:(BOOL)a5 sourceSubtype:(int64_t)a6 matchesAnyIndexInCompletionSections:(BOOL)a7 indexInCompletionSections:(id)a8 excludesAnySourceType:(BOOL)a9 excludedSourceType:(int64_t)a10 excludesAnySourceSubtype:(BOOL)a11 excludedSourceSubtype:(int64_t)a12;
- (int64_t)excludedSourceSubtype;
- (int64_t)excludedSourceType;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (void)setExcludedSourceSubtype:(int64_t)a3;
- (void)setExcludedSourceType:(int64_t)a3;
- (void)setExcludesAnySourceSubtype:(BOOL)a3;
- (void)setExcludesAnySourceType:(BOOL)a3;
- (void)setIndexInCompletionSections:(id)a3;
- (void)setMatchesAnyIndexInCompletionSections:(BOOL)a3;
- (void)setMatchesAnySourceSubtype:(BOOL)a3;
- (void)setMatchesAnySourceType:(BOOL)a3;
- (void)setSourceSubtype:(int64_t)a3;
- (void)setSourceType:(int64_t)a3;
@end

@implementation AutocompleteSectionRule

+ (id)ruleMatchingAnySourceType
{
  LOBYTE(v5) = 0;
  LOBYTE(v4) = 0;
  id v2 = [objc_alloc((Class)a1) initMatchingAnySourceType:1 sourceType:0 matchesAnySourceSubtype:1 sourceSubtype:0 matchesAnyIndexInCompletionSections:1 indexInCompletionSections:0 excludesAnySourceType:v4 excludedSourceType:0 excludesAnySourceSubtype:v5 excludedSourceSubtype:0];

  return v2;
}

+ (id)ruleMatchingAnySourceTypeWithIndexInCompletionSections:(id)a3
{
  id v4 = a3;
  LOBYTE(v8) = 0;
  LOBYTE(v7) = 0;
  id v5 = [objc_alloc((Class)a1) initMatchingAnySourceType:1 sourceType:0 matchesAnySourceSubtype:1 sourceSubtype:0 matchesAnyIndexInCompletionSections:0 indexInCompletionSections:v4 excludesAnySourceType:v7 excludedSourceType:0 excludesAnySourceSubtype:v8 excludedSourceSubtype:0];

  return v5;
}

+ (id)ruleWithSourceType:(int64_t)a3
{
  return _[a1 ruleWithSourceType:a3 matchesAnySourceSubtype:1 sourceSubtype:0 indexInCompletionSections:0];
}

+ (id)ruleWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  return _[a1 ruleWithSourceType:a3 matchesAnySourceSubtype:0 sourceSubtype:a4 indexInCompletionSections:0];
}

+ (id)ruleWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4 indexInCompletionSections:(id)a5
{
  return _[a1 ruleWithSourceType:a3 matchesAnySourceSubtype:0 sourceSubtype:a4 indexInCompletionSections:a5];
}

+ (id)ruleWithSourceType:(int64_t)a3 indexInCompletionSections:(id)a4
{
  return _[a1 ruleWithSourceType:a3 matchesAnySourceSubtype:1 sourceSubtype:0 indexInCompletionSections:a4];
}

+ (id)ruleWithSourceType:(int64_t)a3 matchesAnySourceSubtype:(BOOL)a4 sourceSubtype:(int64_t)a5 indexInCompletionSections:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  LOBYTE(v13) = 0;
  LOBYTE(v12) = 0;
  id v10 = [[AutocompleteSectionRule alloc] initMatchingAnySourceType:0 sourceType:a3 matchesAnySourceSubtype:v7 sourceSubtype:a5 matchesAnyIndexInCompletionSections:0 indexInCompletionSections:v9 excludesAnySourceType:v12 excludedSourceType:0 excludesAnySourceSubtype:v13 excludedSourceSubtype:0];

  return v10;
}

+ (id)ruleExcludingSourceType:(int64_t)a3
{
  return [a1 ruleExcludingSourceType:a3 sourceSubtype:0];
}

+ (id)ruleExcludingSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  LOBYTE(v7) = a4 != 0;
  LOBYTE(v6) = 1;
  id v4 = [[AutocompleteSectionRule alloc] initMatchingAnySourceType:0 sourceType:0 matchesAnySourceSubtype:0 sourceSubtype:0 matchesAnyIndexInCompletionSections:0 indexInCompletionSections:0 excludesAnySourceType:v6 excludedSourceType:a3 excludesAnySourceSubtype:v7 excludedSourceSubtype:a4];

  return v4;
}

- (id)initMatchingAnySourceType:(BOOL)a3 sourceType:(int64_t)a4 matchesAnySourceSubtype:(BOOL)a5 sourceSubtype:(int64_t)a6 matchesAnyIndexInCompletionSections:(BOOL)a7 indexInCompletionSections:(id)a8 excludesAnySourceType:(BOOL)a9 excludedSourceType:(int64_t)a10 excludesAnySourceSubtype:(BOOL)a11 excludedSourceSubtype:(int64_t)a12
{
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)AutocompleteSectionRule;
  v20 = [(AutocompleteSectionRule *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_matchesAnySourceType = a3;
    v20->_matchesAnySourceSubtype = a5;
    v20->_sourceType = a4;
    v20->_sourceSubtype = a6;
    v20->_matchesAnyIndexInCompletionSections = a7;
    objc_storeStrong((id *)&v20->_indexInCompletionSections, a8);
    v21->_excludesAnySourceType = a9;
    v21->_excludesAnySourceSubtype = a11;
    v21->_excludedSourceType = a10;
    v21->_excludedSourceSubtype = a12;
  }

  return v21;
}

- (BOOL)matchesItemWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4 indexInCompletionSections:(id)a5
{
  id v8 = a5;
  if ([(AutocompleteSectionRule *)self excludesAnySourceType])
  {
    if (![(AutocompleteSectionRule *)self excludesAnySourceSubtype]
      || [(AutocompleteSectionRule *)self excludedSourceType] != a3
      || [(AutocompleteSectionRule *)self excludedSourceSubtype] != a4)
    {
      unsigned __int8 v9 = [(AutocompleteSectionRule *)self excludedSourceType] != a3;
      goto LABEL_22;
    }
LABEL_21:
    unsigned __int8 v9 = 0;
    goto LABEL_22;
  }
  if (![(AutocompleteSectionRule *)self matchesAnySourceType]
    && [(AutocompleteSectionRule *)self sourceType] != a3
    || ![(AutocompleteSectionRule *)self matchesAnySourceSubtype]
    && [(AutocompleteSectionRule *)self sourceSubtype] != a4)
  {
    goto LABEL_21;
  }
  if (![(AutocompleteSectionRule *)self matchesAnyIndexInCompletionSections])
  {
    id v10 = [(AutocompleteSectionRule *)self indexInCompletionSections];
    v11 = v10;
    if (!v8 && v10)
    {

      goto LABEL_21;
    }
    v14 = [(AutocompleteSectionRule *)self indexInCompletionSections];

    if (v8 && !v14) {
      goto LABEL_21;
    }
  }
  if ([(AutocompleteSectionRule *)self matchesAnyIndexInCompletionSections])
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    uint64_t v12 = [(AutocompleteSectionRule *)self indexInCompletionSections];

    unsigned __int8 v9 = 1;
    if (v8 && v12)
    {
      uint64_t v13 = [(AutocompleteSectionRule *)self indexInCompletionSections];
      unsigned __int8 v9 = [v13 isEqualToNumber:v8];
    }
  }
LABEL_22:

  return v9;
}

- (id)debugDescription
{
  int64_t v3 = [(AutocompleteSectionRule *)self sourceType];
  int64_t v4 = [(AutocompleteSectionRule *)self sourceSubtype];
  id v5 = [(AutocompleteSectionRule *)self indexInCompletionSections];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Allow type:%ld; subtype:%ld, indexInResponse:%@",
    v3,
    v4,
  uint64_t v6 = v5);

  return v6;
}

- (BOOL)matchesAnySourceType
{
  return self->_matchesAnySourceType;
}

- (void)setMatchesAnySourceType:(BOOL)a3
{
  self->_matchesAnySourceType = a3;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)matchesAnySourceSubtype
{
  return self->_matchesAnySourceSubtype;
}

- (void)setMatchesAnySourceSubtype:(BOOL)a3
{
  self->_matchesAnySourceSubtype = a3;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (void)setSourceSubtype:(int64_t)a3
{
  self->_sourceSubtype = a3;
}

- (BOOL)matchesAnyIndexInCompletionSections
{
  return self->_matchesAnyIndexInCompletionSections;
}

- (void)setMatchesAnyIndexInCompletionSections:(BOOL)a3
{
  self->_matchesAnyIndexInCompletionSections = a3;
}

- (NSNumber)indexInCompletionSections
{
  return self->_indexInCompletionSections;
}

- (void)setIndexInCompletionSections:(id)a3
{
}

- (BOOL)excludesAnySourceType
{
  return self->_excludesAnySourceType;
}

- (void)setExcludesAnySourceType:(BOOL)a3
{
  self->_excludesAnySourceType = a3;
}

- (int64_t)excludedSourceType
{
  return self->_excludedSourceType;
}

- (void)setExcludedSourceType:(int64_t)a3
{
  self->_excludedSourceType = a3;
}

- (BOOL)excludesAnySourceSubtype
{
  return self->_excludesAnySourceSubtype;
}

- (void)setExcludesAnySourceSubtype:(BOOL)a3
{
  self->_excludesAnySourceSubtype = a3;
}

- (int64_t)excludedSourceSubtype
{
  return self->_excludedSourceSubtype;
}

- (void)setExcludedSourceSubtype:(int64_t)a3
{
  self->_excludedSourceSubtype = a3;
}

- (void).cxx_destruct
{
}

@end