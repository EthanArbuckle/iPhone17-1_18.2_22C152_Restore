@interface TITraceLogCandidateGroup
+ (id)groupFromGroupString:(id)a3;
- (NSArray)candidates;
- (NSDictionary)dictionaryRepresentation;
- (NSString)omegaFactorsString;
- (NSString)sequenceString;
- (TITraceLogCandidateGroup)init;
- (double)omegaGeometryScore;
- (double)omegaLanguagePowerScore;
- (double)omegaTypingScore;
- (double)omegaWordScore;
- (double)probability;
- (void)addCandidate:(id)a3;
- (void)setOmegaFactorsString:(id)a3;
- (void)setOmegaGeometryScore:(double)a3;
- (void)setOmegaLanguagePowerScore:(double)a3;
- (void)setOmegaTypingScore:(double)a3;
- (void)setOmegaWordScore:(double)a3;
- (void)setProbability:(double)a3;
- (void)setSequenceString:(id)a3;
@end

@implementation TITraceLogCandidateGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_omegaFactorsString, 0);
  objc_storeStrong((id *)&self->_sequenceString, 0);

  objc_storeStrong((id *)&self->_candidates, 0);
}

- (void)setOmegaGeometryScore:(double)a3
{
  self->_omegaGeometryScore = a3;
}

- (double)omegaGeometryScore
{
  return self->_omegaGeometryScore;
}

- (void)setOmegaTypingScore:(double)a3
{
  self->_omegaTypingScore = a3;
}

- (double)omegaTypingScore
{
  return self->_omegaTypingScore;
}

- (void)setOmegaLanguagePowerScore:(double)a3
{
  self->_omegaLanguagePowerScore = a3;
}

- (double)omegaLanguagePowerScore
{
  return self->_omegaLanguagePowerScore;
}

- (void)setOmegaWordScore:(double)a3
{
  self->_omegaWordScore = a3;
}

- (double)omegaWordScore
{
  return self->_omegaWordScore;
}

- (void)setOmegaFactorsString:(id)a3
{
}

- (NSString)omegaFactorsString
{
  return self->_omegaFactorsString;
}

- (void)setSequenceString:(id)a3
{
}

- (NSString)sequenceString
{
  return self->_sequenceString;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)probability
{
  return self->_probability;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"TITraceLogCandidateGroup" forKey:@"_sourceClass"];
  v4 = [(TITraceLogCandidateGroup *)self sequenceString];
  [v3 setObject:v4 forKey:@"sequenceString"];

  v5 = NSNumber;
  [(TITraceLogCandidateGroup *)self probability];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKey:@"probability"];

  v7 = NSNumber;
  [(TITraceLogCandidateGroup *)self omegaWordScore];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKey:@"omegaWordScore"];

  v9 = NSNumber;
  [(TITraceLogCandidateGroup *)self omegaLanguagePowerScore];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKey:@"omegaLanguagePowerScore"];

  v11 = NSNumber;
  [(TITraceLogCandidateGroup *)self omegaTypingScore];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  [v3 setObject:v12 forKey:@"omegaTypingScore"];

  v13 = NSNumber;
  [(TITraceLogCandidateGroup *)self omegaGeometryScore];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  [v3 setObject:v14 forKey:@"omegaGeometryScore"];

  v15 = [(TITraceLogCandidateGroup *)self omegaFactorsString];

  if (v15)
  {
    v16 = [(TITraceLogCandidateGroup *)self omegaFactorsString];
    [v3 setObject:v16 forKey:@"omegaFactorsString"];
  }
  v17 = (void *)MEMORY[0x1E4F1CA48];
  v18 = [(TITraceLogCandidateGroup *)self candidates];
  v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = [(TITraceLogCandidateGroup *)self candidates];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  [v3 setObject:v19 forKey:@"candidates"];

  return (NSDictionary *)v3;
}

- (NSArray)candidates
{
  v2 = (void *)[(NSMutableArray *)self->_candidates copy];

  return (NSArray *)v2;
}

- (void)addCandidate:(id)a3
{
}

- (TITraceLogCandidateGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITraceLogCandidateGroup;
  v2 = [(TITraceLogCandidateGroup *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    candidates = v2->_candidates;
    v2->_candidates = v3;
  }
  return v2;
}

+ (id)groupFromGroupString:(id)a3
{
  id v51 = a3;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v51];
  id v57 = 0;
  [v3 scanUpToString:@"\n" intoString:&v57];
  id v4 = v57;
  v55 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\[(.+)\\] ln\\(omega\\) (.+) = \\[(.+)\\] .+" options:0 error:0];
  v54 = objc_msgSend(v55, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v5 = [v54 firstObject];
  char v6 = 1;
  uint64_t v7 = [v5 rangeAtIndex:1];
  uint64_t v9 = objc_msgSend(v4, "substringWithRange:", v7, v8);
  uint64_t v10 = [v5 rangeAtIndex:2];
  v12 = objc_msgSend(v4, "substringWithRange:", v10, v11);
  uint64_t v13 = [v5 rangeAtIndex:3];
  v15 = objc_msgSend(v4, "substringWithRange:", v13, v14);
  v16 = objc_alloc_init(TITraceLogCandidateGroup);
  v53 = (void *)v9;
  [(TITraceLogCandidateGroup *)v16 setSequenceString:v9];
  v52 = v12;
  [v12 doubleValue];
  -[TITraceLogCandidateGroup setProbability:](v16, "setProbability:");
  id v17 = v15;
  v18 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(-?[0-9]+\\.[0-9]+)\\*\\(W (-?[0-9]+\\.[0-9]+)+ \\+ T (-?[0-9]+\\.[0-9]+)\\) \\+ G (-?[0-9]+\\.[0-9]+)$" options:0 error:0];
  v19 = objc_msgSend(v18, "matchesInString:options:range:", v17, 0, 0, objc_msgSend(v17, "length"));
  v20 = [v19 firstObject];
  uint64_t v21 = v20;
  double v22 = 0.0;
  if (v19)
  {
    if ([v20 numberOfRanges] == 5)
    {
      uint64_t v23 = [v21 rangeAtIndex:1];
      objc_msgSend(v17, "substringWithRange:", v23, v24);
      v25 = v50 = v5;
      uint64_t v26 = [v21 rangeAtIndex:2];
      long long v28 = objc_msgSend(v17, "substringWithRange:", v26, v27);
      uint64_t v29 = [v21 rangeAtIndex:3];
      objc_msgSend(v17, "substringWithRange:", v29, v30);
      v31 = v49 = v18;
      uint64_t v32 = [v21 rangeAtIndex:4];
      v34 = objc_msgSend(v17, "substringWithRange:", v32, v33);
      [v25 doubleValue];
      double v22 = v35;
      [v28 doubleValue];
      double v37 = v36;
      [v31 doubleValue];
      double v39 = v38;
      [v34 doubleValue];
      double v41 = v40;

      v18 = v49;
      v5 = v50;
      char v6 = 0;
      goto LABEL_6;
    }
    char v6 = 1;
  }
  double v37 = 0.0;
  double v39 = 0.0;
  double v41 = 0.0;
LABEL_6:

  if ((v6 & 1) == 0)
  {
    [(TITraceLogCandidateGroup *)v16 setOmegaFactorsString:v17];
    [(TITraceLogCandidateGroup *)v16 setOmegaLanguagePowerScore:v22];
    [(TITraceLogCandidateGroup *)v16 setOmegaWordScore:v37];
    [(TITraceLogCandidateGroup *)v16 setOmegaTypingScore:v39];
    [(TITraceLogCandidateGroup *)v16 setOmegaGeometryScore:v41];
  }
  id v56 = v4;
  int v42 = [v3 scanUpToString:@"\n" intoString:&v56];
  id v43 = v56;

  if (v42)
  {
    v44 = v51;
    do
    {
      v45 = +[TITraceLogCandidate candidateFromCandidateString:v43];
      if (v45) {
        [(TITraceLogCandidateGroup *)v16 addCandidate:v45];
      }

      id v56 = v43;
      char v46 = [v3 scanUpToString:@"\n" intoString:&v56];
      id v47 = v56;

      id v43 = v47;
    }
    while ((v46 & 1) != 0);
  }
  else
  {
    id v47 = v43;
    v44 = v51;
  }

  return v16;
}

@end