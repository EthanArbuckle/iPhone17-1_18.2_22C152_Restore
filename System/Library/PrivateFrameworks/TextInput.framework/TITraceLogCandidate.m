@interface TITraceLogCandidate
+ (id)_wordSourcesFromCandidateString:(id)a3;
+ (id)candidateFromCandidateString:(id)a3;
+ (id)candidateFromFinalCandidateString:(id)a3;
+ (id)candidateFromRemovedCandidateString:(id)a3;
- (NSArray)wordSources;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)dynamicUsageCount;
- (NSNumber)penalty;
- (NSString)filterName;
- (NSString)lexiconLocaleIdentifier;
- (NSString)priorContext;
- (NSString)token;
- (double)contextProbability;
- (double)probability;
- (unsigned)wordId;
- (void)setContextProbability:(double)a3;
- (void)setDynamicUsageCount:(id)a3;
- (void)setFilterName:(id)a3;
- (void)setLexiconLocaleIdentifier:(id)a3;
- (void)setPenalty:(id)a3;
- (void)setPriorContext:(id)a3;
- (void)setProbability:(double)a3;
- (void)setToken:(id)a3;
- (void)setWordId:(unsigned int)a3;
- (void)setWordSources:(id)a3;
@end

@implementation TITraceLogCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorContext, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_lexiconLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_penalty, 0);
  objc_storeStrong((id *)&self->_dynamicUsageCount, 0);
  objc_storeStrong((id *)&self->_wordSources, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (void)setPriorContext:(id)a3
{
}

- (NSString)priorContext
{
  return self->_priorContext;
}

- (void)setFilterName:(id)a3
{
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void)setLexiconLocaleIdentifier:(id)a3
{
}

- (NSString)lexiconLocaleIdentifier
{
  return self->_lexiconLocaleIdentifier;
}

- (void)setPenalty:(id)a3
{
}

- (NSNumber)penalty
{
  return self->_penalty;
}

- (void)setDynamicUsageCount:(id)a3
{
}

- (NSNumber)dynamicUsageCount
{
  return self->_dynamicUsageCount;
}

- (void)setWordSources:(id)a3
{
}

- (NSArray)wordSources
{
  return self->_wordSources;
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setContextProbability:(double)a3
{
  self->_contextProbability = a3;
}

- (double)contextProbability
{
  return self->_contextProbability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setWordId:(unsigned int)a3
{
  self->_wordId = a3;
}

- (unsigned)wordId
{
  return self->_wordId;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"TITraceLogCandidate" forKey:@"_sourceClass"];
  v4 = [(TITraceLogCandidate *)self token];
  [v3 setObject:v4 forKey:@"token"];

  v5 = NSNumber;
  [(TITraceLogCandidate *)self probability];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKey:@"probability"];

  v7 = NSNumber;
  [(TITraceLogCandidate *)self contextProbability];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKey:@"contextProbability"];

  v9 = [(TITraceLogCandidate *)self filterName];

  if (v9)
  {
    v10 = [(TITraceLogCandidate *)self filterName];
    [v3 setObject:v10 forKey:@"filterName"];
  }
  v11 = [(TITraceLogCandidate *)self lexiconLocaleIdentifier];

  if (v11)
  {
    v12 = [(TITraceLogCandidate *)self lexiconLocaleIdentifier];
    [v3 setObject:v12 forKey:@"lexiconLocaleIdentifier"];
  }
  v13 = [(TITraceLogCandidate *)self dynamicUsageCount];

  if (v13)
  {
    v14 = [(TITraceLogCandidate *)self dynamicUsageCount];
    [v3 setObject:v14 forKey:@"dynamicUsageCount"];
  }
  v15 = [(TITraceLogCandidate *)self penalty];

  if (v15)
  {
    v16 = [(TITraceLogCandidate *)self penalty];
    [v3 setObject:v16 forKey:@"penalty"];
  }
  v17 = [(TITraceLogCandidate *)self wordSources];

  if (v17)
  {
    v18 = [(TITraceLogCandidate *)self wordSources];
    [v3 setObject:v18 forKey:@"wordSources"];
  }
  v19 = [(TITraceLogCandidate *)self priorContext];

  if (v19)
  {
    v20 = [(TITraceLogCandidate *)self priorContext];
    [v3 setObject:v20 forKey:@"priorContext"];
  }
  v21 = (void *)[v3 copy];

  return (NSDictionary *)v21;
}

+ (id)candidateFromFinalCandidateString:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^\\[(.+)\\] ln\\(omega\\) (.+) .+$" options:0 error:0];
  v5 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v6 = [v5 firstObject];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 rangeAtIndex:1];
    v10 = objc_msgSend(v3, "substringWithRange:", v8, v9);
    uint64_t v11 = [v7 rangeAtIndex:2];
    v13 = objc_msgSend(v3, "substringWithRange:", v11, v12);
    v14 = objc_alloc_init(TITraceLogCandidate);
    [(TITraceLogCandidate *)v14 setToken:v10];
    [v13 doubleValue];
    -[TITraceLogCandidate setProbability:](v14, "setProbability:");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)candidateFromCandidateString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^\\[(.+)\\] word_id \\[(.+)\\](\\d+) options:ln P\\([^)]+\\ (-?\\d+\\.\\d+) error:ln P\\([^)]+\\] (-?\\d+\\.\\d+)(.*)$"), 0, 0);
  v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = [v6 firstObject];
  if (v7)
  {
    uint64_t v8 = objc_alloc_init(TITraceLogCandidate);
    uint64_t v9 = [v7 rangeAtIndex:1];
    uint64_t v11 = objc_msgSend(v4, "substringWithRange:", v9, v10);
    [(TITraceLogCandidate *)v8 setToken:v11];

    uint64_t v12 = [v7 rangeAtIndex:2];
    v14 = objc_msgSend(v4, "substringWithRange:", v12, v13);
    [(TITraceLogCandidate *)v8 setLexiconLocaleIdentifier:v14];

    uint64_t v15 = [v7 rangeAtIndex:3];
    v17 = objc_msgSend(v4, "substringWithRange:", v15, v16);
    -[TITraceLogCandidate setWordId:](v8, "setWordId:", [v17 intValue]);

    uint64_t v18 = [v7 rangeAtIndex:4];
    v20 = objc_msgSend(v4, "substringWithRange:", v18, v19);
    uint64_t v21 = [v7 rangeAtIndex:5];
    v23 = objc_msgSend(v4, "substringWithRange:", v21, v22);
    [v20 doubleValue];
    -[TITraceLogCandidate setProbability:](v8, "setProbability:");
    [v23 doubleValue];
    -[TITraceLogCandidate setContextProbability:](v8, "setContextProbability:");
    if ((unint64_t)[v7 numberOfRanges] >= 7)
    {
      v46 = v23;
      v47 = v20;
      id v48 = a1;
      uint64_t v24 = [v7 rangeAtIndex:6];
      v26 = objc_msgSend(v4, "substringWithRange:", v24, v25);
      v27 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @".*sources=\\([^\\)]+, f=(\\d+)[^\\]*\\)"), 0, 0);

      v28 = objc_msgSend(v27, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length"));
      v29 = [v28 firstObject];
      v30 = v29;
      unint64_t v31 = 0x1E4F28000;
      if (v29)
      {
        uint64_t v32 = [v29 rangeAtIndex:1];
        v34 = objc_msgSend(v26, "substringWithRange:", v32, v33);
        v35 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v34, "intValue"));
        [(TITraceLogCandidate *)v8 setDynamicUsageCount:v35];

        unint64_t v31 = 0x1E4F28000uLL;
      }
      v5 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @".*sources=\\([^\\)]+, p=(\\d+)[^\\]*\\)"), 0, 0);

      v36 = objc_msgSend(v5, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length"));

      v37 = [v36 firstObject];

      if (v37)
      {
        uint64_t v38 = [v37 rangeAtIndex:1];
        v40 = objc_msgSend(v26, "substringWithRange:", v38, v39);
        unint64_t v41 = v31;
        v42 = v40;
        v43 = objc_msgSend(*(id *)(v41 + 3792), "numberWithInt:", objc_msgSend(v40, "intValue"));
        [(TITraceLogCandidate *)v8 setPenalty:v43];
      }
      v20 = v47;
      a1 = v48;
      v23 = v46;
    }
    if ([v4 containsString:@"details=("]
    {
      v44 = [a1 _wordSourcesFromCandidateString:v4];
      [(TITraceLogCandidate *)v8 setWordSources:v44];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)candidateFromRemovedCandidateString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^\\[(.+)\\] removed by (.+)$" options:0 error:0];
  v5 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v6 = [v5 firstObject];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 rangeAtIndex:1];
    uint64_t v10 = objc_msgSend(v3, "substringWithRange:", v8, v9);
    uint64_t v11 = [v7 rangeAtIndex:2];
    uint64_t v13 = objc_msgSend(v3, "substringWithRange:", v11, v12);
    v14 = objc_alloc_init(TITraceLogCandidate);
    [(TITraceLogCandidate *)v14 setToken:v10];
    [(TITraceLogCandidate *)v14 setFilterName:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_wordSourcesFromCandidateString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
  double v14 = 0.0;
  double v15 = 0.0;
  objc_msgSend(v5, "scanUpToString:intoString:", @"details=("), 0;
  objc_msgSend(v5, "scanString:intoString:", @"details=("), 0;
  v6 = &stru_1EDBDCE38;
  if (([v5 isAtEnd] & 1) == 0)
  {
    do
    {
      v7 = v6;
      uint64_t v13 = v6;
      int v8 = [v5 scanUpToString:@": " intoString:&v13];
      v6 = v13;

      if (v8
        && [v5 scanString:@": " intoString:0]
        && [v5 scanDouble:&v15]
        && [v5 scanString:@"+" intoString:0]
        && [v5 scanDouble:&v14])
      {
        uint64_t v9 = [TITraceLogCandidateWordSource alloc];
        uint64_t v10 = [(TITraceLogCandidateWordSource *)v9 initWithWordSource:v6 probability:v15 linguisticContextProbability:v14];
        [v4 addObject:v10];
        [v5 scanString:@" " intoString:0];
      }
    }
    while (![v5 isAtEnd]);
  }
  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

@end