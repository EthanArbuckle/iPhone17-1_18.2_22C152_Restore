@interface SBSAnalyticsState
+ (id)withTimestamp:(double)a3;
+ (id)withTimestamp:(double)a3 payload:(id)a4;
- (NSString)debugDescription;
- (SBSAnalyticsState)initWithTimestamp:(double)a3 payload:(id)a4;
- (double)timestamp;
- (id)coreAnalyticsRepresentation;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBSAnalyticsState

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_payload objectForKeyedSubscript:a3];
}

- (void).cxx_destruct
{
}

+ (id)withTimestamp:(double)a3 payload:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithTimestamp:v6 payload:a3];

  return v7;
}

- (SBSAnalyticsState)initWithTimestamp:(double)a3 payload:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (v7 && (_SBSupportedType(v7) & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"payload must contain only NSDictionary, NSArray, NSNumber, NSData, NString, NSNull objects", 0 reason userInfo];
    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSAnalyticsState;
  v9 = [(SBSAnalyticsState *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_timestamp = a3;
    objc_storeStrong((id *)&v9->_payload, a4);
  }

  return v10;
}

- (double)timestamp
{
  return self->_timestamp;
}

+ (id)withTimestamp:(double)a3
{
  return (id)[a1 withTimestamp:0 payload:a3];
}

- (id)coreAnalyticsRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_payload];
  v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKeyedSubscript:@"kSBSAnalyticsTimestamp"];

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(SBSAnalyticsState *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSAnalyticsState *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__SBSAnalyticsState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E566BB08;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

uint64_t __59__SBSAnalyticsState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendTimeInterval:@"timestamp" withName:0 decomposeUnits:*(double *)(*(void *)(a1 + 40) + 8)];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);
  return [v3 appendDictionarySection:v4 withName:@"payload" skipIfEmpty:1];
}

- (id)succinctDescription
{
  id v2 = [(SBSAnalyticsState *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendTimeInterval:@"timestamp" withName:0 decomposeUnits:self->_timestamp];
  return v3;
}

@end