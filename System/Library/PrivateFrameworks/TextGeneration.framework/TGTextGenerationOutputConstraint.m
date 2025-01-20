@interface TGTextGenerationOutputConstraint
- (BOOL)isEqual:(id)a3;
- (NSNumber)maxWordCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setMaxWordCount:(id)a3;
@end

@implementation TGTextGenerationOutputConstraint

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(TGTextGenerationOutputConstraint);
  v5 = [(TGTextGenerationOutputConstraint *)self maxWordCount];
  [(TGTextGenerationOutputConstraint *)v4 setMaxWordCount:v5];

  v6 = self;
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(TGMutableTextGenerationOutputConstraint);
  v5 = [(TGTextGenerationOutputConstraint *)self maxWordCount];
  [(TGTextGenerationOutputConstraint *)v4 setMaxWordCount:v5];

  v6 = self;
  return v6;
}

- (unint64_t)hash
{
  v2 = [(TGTextGenerationOutputConstraint *)self maxWordCount];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v7 = v4;
    v8 = [(TGTextGenerationOutputConstraint *)self maxWordCount];
    v9 = [v7 maxWordCount];

    char v6 = TGTextGenerationEqualAllowingNil(v8, v9);
  }

  return v6;
}

- (NSNumber)maxWordCount
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMaxWordCount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end