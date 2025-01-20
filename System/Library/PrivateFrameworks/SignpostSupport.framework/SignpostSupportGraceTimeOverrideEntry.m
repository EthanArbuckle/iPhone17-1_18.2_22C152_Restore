@interface SignpostSupportGraceTimeOverrideEntry
- (NSMutableDictionary)overrides;
- (SignpostSupportAnimationGraceTime)defaultGraceTime;
- (SignpostSupportGraceTimeOverrideEntry)initWithEntryLevel:(unint64_t)a3;
- (id)debugDescription;
- (id)debugDescriptionWithWhitespacePrefix:(id)a3;
- (unint64_t)entryLevel;
- (void)setDefaultGraceTime:(id)a3;
@end

@implementation SignpostSupportGraceTimeOverrideEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGraceTime, 0);

  objc_storeStrong((id *)&self->_overrides, 0);
}

- (NSMutableDictionary)overrides
{
  return self->_overrides;
}

- (SignpostSupportGraceTimeOverrideEntry)initWithEntryLevel:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostSupportGraceTimeOverrideEntry;
  v4 = [(SignpostSupportGraceTimeOverrideEntry *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    overrides = v4->_overrides;
    v4->_overrides = (NSMutableDictionary *)v5;

    v4->_entryLevel = a3;
  }
  return v4;
}

- (void)setDefaultGraceTime:(id)a3
{
}

- (SignpostSupportAnimationGraceTime)defaultGraceTime
{
  return self->_defaultGraceTime;
}

- (id)debugDescription
{
  return [(SignpostSupportGraceTimeOverrideEntry *)self debugDescriptionWithWhitespacePrefix:&stru_1EF807BF0];
}

- (id)debugDescriptionWithWhitespacePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SignpostSupportGraceTimeOverrideEntry *)self entryLevel];
  if (v5 > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E5B3FFA0[v5];
  }
  v7 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  objc_super v8 = [v4 stringByAppendingString:@"  "];
  v9 = [(SignpostSupportGraceTimeOverrideEntry *)self overrides];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SignpostSupportGraceTimeOverrideEntry_debugDescriptionWithWhitespacePrefix___block_invoke;
  v17[3] = &unk_1E5B3FF58;
  id v10 = v7;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v17];

  if ([v10 isEqualToString:@"{"])
  {
    [MEMORY[0x1E4F28E78] stringWithFormat:@"None"];
    v12 = v10;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = [NSString stringWithFormat:@"\n%@}", v4];
    [v10 appendString:v12];
  }

  v13 = NSString;
  v14 = [(SignpostSupportGraceTimeOverrideEntry *)self defaultGraceTime];
  v15 = [v13 stringWithFormat:@"%@Grace Time Ms: %llu \n%@%@ overrides : %@", v4, objc_msgSend(v14, "firstFrameGraceTimeMs"), v4, v6, v10];

  return v15;
}

void __78__SignpostSupportGraceTimeOverrideEntry_debugDescriptionWithWhitespacePrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSString;
  unint64_t v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v11 = [v6 stringByAppendingString:@"  "];
  v9 = [v7 debugDescriptionWithWhitespacePrefix:v11];

  id v10 = [v4 stringWithFormat:@"\n%@%@: \n%@", v6, v8, v9];

  [v5 appendString:v10];
}

- (unint64_t)entryLevel
{
  return self->_entryLevel;
}

@end