@interface SBINFocusAppIntent
- (BOOL)isEqual:(id)a3;
- (NSString)modeIdentifier;
- (SBINFocusAppIntent)initWithModeIdentifier:(id)a3 systemContext:(id)a4;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBINFocusAppIntent

- (SBINFocusAppIntent)initWithModeIdentifier:(id)a3 systemContext:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBINFocusAppIntent;
  v8 = [(SBINAppIntent *)&v11 initWithIdentifier:@"Focus" systemContext:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_modeIdentifier, a3);
  }

  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SBINFocusAppIntent_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_265525A00;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

uint64_t __51__SBINFocusAppIntent_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)SBINFocusAppIntent;
  objc_msgSendSuper2(&v4, sel_appendDescriptionToFormatter_, v2);
  return [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"modeIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBINFocusAppIntent;
  if ([(SBINAppIntent *)&v9 isEqual:v4]
    && (self,
        id v5 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    char v7 = BSEqualStrings();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SBINFocusAppIntent;
  unint64_t v3 = [(SBINAppIntent *)&v5 hash];
  return [(NSString *)self->_modeIdentifier hash] ^ v3;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void).cxx_destruct
{
}

@end