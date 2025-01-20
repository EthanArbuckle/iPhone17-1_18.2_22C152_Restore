@interface TIKeyboardCandidateGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlternativeText;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)candidates;
- (NSString)title;
- (TIKeyboardCandidateGroup)initWithCoder:(id)a3;
- (TIKeyboardCandidateGroup)initWithTitle:(id)a3 candidates:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCandidates;
- (unint64_t)hash;
- (void)addCandidate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TIKeyboardCandidateGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setCandidates:(id)a3
{
}

- (NSOrderedSet)candidates
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  v25.receiver = self;
  v25.super_class = (Class)TIKeyboardCandidateGroup;
  v4 = [(TIKeyboardCandidateGroup *)&v25 description];
  v5 = [(TIKeyboardCandidateGroup *)self title];
  v6 = [(TIKeyboardCandidateGroup *)self candidates];
  uint64_t v7 = [v6 count];
  v8 = [(TIKeyboardCandidateGroup *)self candidates];
  uint64_t v9 = [v8 count];
  v10 = @"\n";
  if (!v9) {
    v10 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"%@: Group '%@' (%d candidates)%@", v4, v5, v7, v10];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = [(TIKeyboardCandidateGroup *)self candidates];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v17 = [v16 candidate];
        v18 = [v16 label];
        v19 = [v16 alternativeText];
        [v3 appendFormat:@"\tcandidate='%@'; label='%@'; alternativeText='%@'\n", v17, v18, v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v13);
  }

  return v3;
}

- (void)addCandidate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TIKeyboardCandidateGroup *)self mutableCandidates];
    [v5 addObject:v4];
  }
}

- (BOOL)hasAlternativeText
{
  if (![(NSOrderedSet *)self->_candidates count]) {
    return 0;
  }
  v3 = [(NSOrderedSet *)self->_candidates objectAtIndex:0];
  id v4 = [v3 alternativeText];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (id)mutableCandidates
{
  p_candidates = &self->_candidates;
  if (self->_candidates)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = *p_candidates;
      goto LABEL_7;
    }
    id v4 = (NSOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:*p_candidates];
  }
  else
  {
    id v4 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  }
  v3 = v4;
  objc_storeStrong((id *)p_candidates, v4);
LABEL_7:

  return v3;
}

- (unint64_t)hash
{
  v3 = [(TIKeyboardCandidateGroup *)self title];
  id v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardCandidateGroup;
    id v5 = [(TIKeyboardCandidateGroup *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TIKeyboardCandidateGroup *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(TIKeyboardCandidateGroup *)self title];
      uint64_t v7 = [(TIKeyboardCandidateGroup *)v5 title];
      if ([v6 isEqualToString:v7])
      {
        objc_super v8 = [(TIKeyboardCandidateGroup *)self candidates];
        uint64_t v9 = [(TIKeyboardCandidateGroup *)v5 candidates];
        char v10 = [v8 isEqualToOrderedSet:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (TIKeyboardCandidateGroup)initWithTitle:(id)a3 candidates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardCandidateGroup;
  objc_super v8 = [(TIKeyboardCandidateGroup *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(TIKeyboardCandidateGroup *)v8 setTitle:v6];
    [(TIKeyboardCandidateGroup *)v9 setCandidates:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [+[TIKeyboardCandidateGroup allocWithZone:a3] init];
  id v5 = [(TIKeyboardCandidateGroup *)self title];
  [(TIKeyboardCandidateGroup *)v4 setTitle:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(TIKeyboardCandidateGroup *)self candidates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TIKeyboardCandidateGroup *)v4 addCandidate:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(TIKeyboardCandidateGroup *)self candidates];

  if (v4)
  {
    id v5 = [(TIKeyboardCandidateGroup *)self candidates];
    [v8 encodeObject:v5 forKey:@"candidates"];
  }
  id v6 = [(TIKeyboardCandidateGroup *)self title];

  if (v6)
  {
    uint64_t v7 = [(TIKeyboardCandidateGroup *)self title];
    [v8 encodeObject:v7 forKey:@"title"];
  }
}

- (TIKeyboardCandidateGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardCandidateGroup;
  id v5 = [(TIKeyboardCandidateGroup *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"candidates"];
    candidates = v5->_candidates;
    v5->_candidates = (NSOrderedSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end