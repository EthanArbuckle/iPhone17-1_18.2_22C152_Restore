@interface STMediaStatusDomainMicrophoneRecordingAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STActivityAttribution)activityAttribution;
- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithActivityAttribution:(id)a3;
- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithActivityAttribution:(id)a3 maximumHistoryAccessed:(double)a4;
- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithCoder:(id)a3;
- (double)maximumHistoryAccessed;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMediaStatusDomainMicrophoneRecordingAttribution

id __91__STMediaStatusDomainMicrophoneRecordingAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) activityAttribution];
  id v4 = (id)[v2 appendObject:v3 withName:@"activityAttribution"];

  v5 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) maximumHistoryAccessed];
  return (id)objc_msgSend(v5, "appendDouble:withName:decimalPrecision:", @"maximumHistoryAccessed", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self activityAttribution];
  [v5 encodeObject:v4 forKey:@"activityAttribution"];

  [(STMediaStatusDomainMicrophoneRecordingAttribution *)self maximumHistoryAccessed];
  objc_msgSend(v5, "encodeDouble:forKey:", @"maximumHistoryAccessed");
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self activityAttribution];
  id v5 = (id)[v3 appendObject:v4];

  [(STMediaStatusDomainMicrophoneRecordingAttribution *)self maximumHistoryAccessed];
  id v6 = (id)objc_msgSend(v3, "appendDouble:");
  unint64_t v7 = [v3 hash];

  return v7;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (double)maximumHistoryAccessed
{
  return self->_maximumHistoryAccessed;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__STMediaStatusDomainMicrophoneRecordingAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B63080;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttribution"];
  [v4 decodeDoubleForKey:@"maximumHistoryAccessed"];
  double v7 = v6;

  if (v5)
  {
    self = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self initWithActivityAttribution:v5 maximumHistoryAccessed:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithActivityAttribution:(id)a3 maximumHistoryAccessed:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STMediaStatusDomainMicrophoneRecordingAttribution;
  double v7 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    activityAttribution = v7->_activityAttribution;
    v7->_activityAttribution = (STActivityAttribution *)v8;

    v7->_maximumHistoryAccessed = a4;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(STMediaStatusDomainMicrophoneRecordingAttribution *)self descriptionWithMultilinePrefix:0];
}

- (void).cxx_destruct
{
}

- (STMediaStatusDomainMicrophoneRecordingAttribution)initWithActivityAttribution:(id)a3
{
  return [(STMediaStatusDomainMicrophoneRecordingAttribution *)self initWithActivityAttribution:a3 maximumHistoryAccessed:0.0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self activityAttribution];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke;
  v19[3] = &unk_1E6B63058;
  id v7 = v4;
  id v20 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v19];

  [(STMediaStatusDomainMicrophoneRecordingAttribution *)self maximumHistoryAccessed];
  double v10 = v9;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke_2;
  v17 = &unk_1E6B63DB0;
  id v18 = v7;
  id v11 = v7;
  id v12 = (id)[v5 appendDouble:&v14 counterpart:v10];
  LOBYTE(v7) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)v7;
}

uint64_t __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAttribution];
}

uint64_t __61__STMediaStatusDomainMicrophoneRecordingAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) maximumHistoryAccessed];
}

- (id)succinctDescription
{
  v2 = [(STMediaStatusDomainMicrophoneRecordingAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end