@interface SBSBackgroundActivityAssertionData
+ (BOOL)supportsSecureCoding;
- (BOOL)isExclusive;
- (BOOL)showsWhenForeground;
- (NSSet)backgroundActivityIdentifiers;
- (NSString)description;
- (NSString)statusString;
- (NSString)uniqueIdentifier;
- (SBSBackgroundActivityAssertionData)init;
- (SBSBackgroundActivityAssertionData)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6;
- (SBSBackgroundActivityAssertionData)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6 uniqueIdentifier:(id)a7;
- (SBSBackgroundActivityAssertionData)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundActivityIdentifiers:(id)a3;
- (void)setExclusive:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setShowsWhenForeground:(BOOL)a3;
- (void)setStatusString:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SBSBackgroundActivityAssertionData

- (SBSBackgroundActivityAssertionData)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSBackgroundActivityAssertionData.m" lineNumber:55 description:@"use initWithBackgroundActivityIdentifiers:…"];

  return 0;
}

- (SBSBackgroundActivityAssertionData)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a3;
  v12 = [v10 UUID];
  v13 = [v12 UUIDString];
  v14 = [(SBSBackgroundActivityAssertionData *)self initWithBackgroundActivityIdentifiers:v11 forPID:v8 exclusive:v7 showsWhenForeground:v6 uniqueIdentifier:v13];

  return v14;
}

- (SBSBackgroundActivityAssertionData)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6 uniqueIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SBSBackgroundActivityAssertionData;
  v14 = [(SBSBackgroundActivityAssertionData *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    backgroundActivityIdentifiers = v14->_backgroundActivityIdentifiers;
    v14->_backgroundActivityIdentifiers = (NSSet *)v15;

    v14->_pid = a4;
    v14->_exclusive = a5;
    v14->_showsWhenForeground = a6;
    uint64_t v17 = [v13 copy];
    uniqueIdentifier = v14->_uniqueIdentifier;
    v14->_uniqueIdentifier = (NSString *)v17;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  backgroundActivityIdentifiers = self->_backgroundActivityIdentifiers;
  id v6 = a3;
  v5 = [(NSSet *)backgroundActivityIdentifiers allObjects];
  [v6 encodeObject:v5 forKey:@"backgroundActivityIdentifiers"];

  [v6 encodeInteger:self->_pid forKey:@"pid"];
  [v6 encodeBool:self->_exclusive forKey:@"exclusive"];
  [v6 encodeBool:self->_showsWhenForeground forKey:@"showsWhenForeground"];
  [v6 encodeObject:self->_statusString forKey:@"statusString"];
  [v6 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
}

- (SBSBackgroundActivityAssertionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"backgroundActivityIdentifiers"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"pid"];
  uint64_t v7 = [v4 decodeBoolForKey:@"exclusive"];
  uint64_t v8 = [v4 decodeBoolForKey:@"showsWhenForeground"];
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v10 = [(SBSBackgroundActivityAssertionData *)self initWithBackgroundActivityIdentifiers:v9 forPID:v6 exclusive:v7 showsWhenForeground:v8 uniqueIdentifier:0];

  if (v10)
  {
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 copy];
      uniqueIdentifier = v10->_uniqueIdentifier;
      v10->_uniqueIdentifier = (NSString *)v13;

      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusString"];
      uint64_t v16 = [v15 copy];
      statusString = v10->_statusString;
      v10->_statusString = (NSString *)v16;
    }
    else
    {
      uint64_t v15 = v10;
      v10 = 0;
    }
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[(SBSBackgroundActivityAssertionData *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSBackgroundActivityAssertionData *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSBackgroundActivityAssertionData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBSBackgroundActivityAssertionData *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__SBSBackgroundActivityAssertionData_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E566BB08;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __76__SBSBackgroundActivityAssertionData_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  soft_STBackgroundActivityIdentifiersDescription([*(id *)(a1 + 32) backgroundActivityIdentifiers]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) appendString:v7 withName:@"backgroundActivityIdentifiers"];
  id v2 = [*(id *)(a1 + 40) appendInt:[*(id *)(a1 + 32) pid] withName:@"pid"];
  id v3 = [*(id *)(a1 + 40) appendBool:[*(id *)(a1 + 32) isExclusive] withName:@"exclusive"];
  id v4 = [*(id *)(a1 + 40) appendBool:[*(id *)(a1 + 32) showsWhenForeground] withName:@"showsWhenForeground"];
  v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  [v5 appendString:v6 withName:@"identifier"];
}

- (NSSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void)setBackgroundActivityIdentifiers:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (BOOL)showsWhenForeground
{
  return self->_showsWhenForeground;
}

- (void)setShowsWhenForeground:(BOOL)a3
{
  self->_showsWhenForeground = a3;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
}

@end