@interface SBSwitcherModifierEventResponseSnapshot
- (NSArray)responseDescriptions;
- (NSArray)responseNames;
- (SBSwitcherModifierEventResponseSnapshot)initWithEventResponse:(id)a3;
@end

@implementation SBSwitcherModifierEventResponseSnapshot

- (SBSwitcherModifierEventResponseSnapshot)initWithEventResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSwitcherModifierEventResponseSnapshot;
    v5 = [(SBSwitcherModifierEventResponseSnapshot *)&v19 init];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__SBSwitcherModifierEventResponseSnapshot_initWithEventResponse___block_invoke;
      v16[3] = &unk_1E6B0CA40;
      v8 = (NSArray *)v6;
      v17 = v8;
      v9 = (NSArray *)v7;
      v18 = v9;
      [v4 enumerateResponseTreeUsingBlock:v16];
      responseNames = v5->_responseNames;
      v5->_responseNames = v8;
      v11 = v8;

      responseDescriptions = v5->_responseDescriptions;
      v5->_responseDescriptions = v9;
      v13 = v9;
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __65__SBSwitcherModifierEventResponseSnapshot_initWithEventResponse___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = NSStringFromSBSwitcherModifierEventResponseType([v4 type]);
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 description];

  [v6 addObject:v7];
}

- (NSArray)responseNames
{
  return self->_responseNames;
}

- (NSArray)responseDescriptions
{
  return self->_responseDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescriptions, 0);
  objc_storeStrong((id *)&self->_responseNames, 0);
}

@end