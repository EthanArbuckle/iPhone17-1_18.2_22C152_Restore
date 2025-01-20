@interface PRComplicationSuggestionSet
- (BOOL)isEqual:(id)a3;
- (NSArray)descriptors;
- (NSString)localizedTitle;
- (PRComplicationSuggestionSet)initWithDescriptors:(id)a3 localizedTitle:(id)a4;
- (unint64_t)hash;
@end

@implementation PRComplicationSuggestionSet

- (PRComplicationSuggestionSet)initWithDescriptors:(id)a3 localizedTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRComplicationSuggestionSet;
  v9 = [(PRComplicationSuggestionSet *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptors, a3);
    uint64_t v11 = [v8 copy];
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(PRComplicationSuggestionSet *)self descriptors];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__PRComplicationSuggestionSet_isEqual___block_invoke;
  v17[3] = &unk_1E54DB0E8;
  id v7 = v4;
  id v18 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v17];

  v9 = [(PRComplicationSuggestionSet *)self localizedTitle];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__PRComplicationSuggestionSet_isEqual___block_invoke_2;
  v15[3] = &unk_1E54DB0E8;
  id v10 = v7;
  id v16 = v10;
  id v11 = (id)[v5 appendObject:v9 counterpart:v15];

  if ([v5 isEqual])
  {
    v14.receiver = self;
    v14.super_class = (Class)PRComplicationSuggestionSet;
    BOOL v12 = [(PRComplicationSuggestionSet *)&v14 isEqual:v10];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __39__PRComplicationSuggestionSet_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) descriptors];
}

uint64_t __39__PRComplicationSuggestionSet_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedTitle];
}

- (unint64_t)hash
{
  v3 = [(PRComplicationSuggestionSet *)self descriptors];
  uint64_t v4 = [v3 hash];
  v5 = [(PRComplicationSuggestionSet *)self localizedTitle];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end