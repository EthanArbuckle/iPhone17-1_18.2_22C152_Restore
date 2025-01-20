@interface SBSensorActivityAttribution
- (BOOL)isEqual:(id)a3;
- (BOOL)usedRecently;
- (SBSensorActivityAttribution)initWithDataAccessAttribution:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)sensor;
- (unint64_t)hash;
@end

@implementation SBSensorActivityAttribution

uint64_t __39__SBSensorActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sensor];
}

- (id)succinctDescription
{
  v2 = [(SBSensorActivityAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBSensorActivityAttribution;
  v3 = [(SBActivityAttribution *)&v7 succinctDescriptionBuilder];
  [(SBSensorActivityAttribution *)self sensor];
  v4 = SBFDescriptionForSensorType();
  id v5 = (id)[v3 appendObject:v4 withName:@"sensor"];

  return v3;
}

id __35__SBSensorActivityAttribution_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBSensorActivityAttribution;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t v6 = [(SBSensorActivityAttribution *)self sensor];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__SBSensorActivityAttribution_isEqual___block_invoke;
  v12[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v13 = v7;
  id v8 = (id)[v5 appendInteger:v6 counterpart:v12];
  if ([v5 isEqual])
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSensorActivityAttribution;
    BOOL v9 = [(SBActivityAttribution *)&v11 isEqual:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__SBSensorActivityAttribution_hash__block_invoke;
  v8[3] = &unk_1E6AF5470;
  v8[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[SBSensorActivityAttribution sensor](self, "sensor"));
  unint64_t v6 = [v3 hash];

  return v6;
}

- (int64_t)sensor
{
  return self->_sensor;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

- (SBSensorActivityAttribution)initWithDataAccessAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 dataAccessType];
  if (v5 == 2)
  {
    id v8 = [v4 locationAttribution];
    unint64_t v6 = [v8 activityAttribution];

    uint64_t v7 = 2;
  }
  else if (v5 == 1)
  {
    BOOL v9 = [v4 cameraCaptureAttribution];
    unint64_t v6 = [v9 activityAttribution];

    uint64_t v7 = 0;
  }
  else if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = [v4 audioRecordingActivityAttribution];
    uint64_t v7 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSensorActivityAttribution;
  v10 = [(SBActivityAttribution *)&v13 initWithSTActivityAttribution:v6];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_sensor = v7;
    v10->_usedRecently = [v4 isRecent];
  }

  return v11;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSensorActivityAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBSensorActivityAttribution;
  id v4 = a3;
  uint64_t v5 = [(SBActivityAttribution *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBSensorActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __69__SBSensorActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) sensor];
  SBFDescriptionForSensorType();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (id)[v1 appendObject:v3 withName:@"sensor"];
}

@end