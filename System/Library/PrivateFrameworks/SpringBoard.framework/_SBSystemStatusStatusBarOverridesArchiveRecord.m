@interface _SBSystemStatusStatusBarOverridesArchiveRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSSet)suppressedBackgroundActivityIdentifiers;
- (STStatusBarData)statusBarData;
- (_SBSystemStatusStatusBarOverridesArchiveRecord)initWithCoder:(id)a3;
- (_SBSystemStatusStatusBarOverridesArchiveRecord)initWithStatusBarData:(id)a3 andSuppressedBackgroundActivityIdentifiers:(id)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)recordByApplyingRecord:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStatusBarData:(id)a3;
- (void)setSuppressedBackgroundActivityIdentifiers:(id)a3;
@end

@implementation _SBSystemStatusStatusBarOverridesArchiveRecord

- (_SBSystemStatusStatusBarOverridesArchiveRecord)initWithStatusBarData:(id)a3 andSuppressedBackgroundActivityIdentifiers:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    statusBarData = v9->_statusBarData;
    v9->_statusBarData = (STStatusBarData *)v10;

    uint64_t v12 = [v8 copy];
    suppressedBackgroundActivityIdentifiers = v9->_suppressedBackgroundActivityIdentifiers;
    v9->_suppressedBackgroundActivityIdentifiers = (NSSet *)v12;
  }
  if ([(_SBSystemStatusStatusBarOverridesArchiveRecord *)v9 isEmpty])
  {
    v14 = SBLogStatusBarish();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSStringFromSelector(a2);
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%@ is empty! %@", (uint8_t *)&v17, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEmpty
{
  statusBarData = self->_statusBarData;
  if (!statusBarData || (int v4 = [(STStatusBarData *)statusBarData isEmpty]) != 0)
  {
    suppressedBackgroundActivityIdentifiers = self->_suppressedBackgroundActivityIdentifiers;
    if (suppressedBackgroundActivityIdentifiers) {
      LOBYTE(v4) = [(NSSet *)suppressedBackgroundActivityIdentifiers count] == 0;
    }
    else {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)recordByApplyingRecord:(id)a3
{
  id v4 = a3;
  v5 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self statusBarData];
  v6 = [v4 statusBarData];
  id v7 = [v5 dataByApplyingOverlay:v6];

  id v8 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self suppressedBackgroundActivityIdentifiers];
  v9 = [v4 suppressedBackgroundActivityIdentifiers];

  uint64_t v10 = [v8 setByAddingObjectsFromSet:v9];

  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStatusBarData:v7 andSuppressedBackgroundActivityIdentifiers:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  id v7 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self statusBarData];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9E90;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:v7 counterpart:v19];

  uint64_t v10 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self suppressedBackgroundActivityIdentifiers];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke_2;
  int v17 = &unk_1E6AF9E90;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:v10 counterpart:&v14];

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self statusBarData];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self suppressedBackgroundActivityIdentifiers];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (id)description
{
  return [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self statusBarData];
  [v4 encodeObject:v5 forKey:@"statusBarData"];

  id v6 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self suppressedBackgroundActivityIdentifiers];
  [v4 encodeObject:v6 forKey:@"suppressedBackgroundActivityIdentifiers"];
}

- (_SBSystemStatusStatusBarOverridesArchiveRecord)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusBarData"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  unint64_t v8 = [v6 setWithArray:v7];

  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"suppressedBackgroundActivityIdentifiers"];

  uint64_t v10 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self initWithStatusBarData:v5 andSuppressedBackgroundActivityIdentifiers:v9];
  return v10;
}

- (id)succinctDescription
{
  v2 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_SBSystemStatusStatusBarOverridesArchiveRecord *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98___SBSystemStatusStatusBarOverridesArchiveRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E6AF5290;
  id v8 = v7;
  id v12 = v8;
  v13 = self;
  [v8 appendBodySectionWithName:0 multilinePrefix:v6 block:v11];

  id v9 = v8;
  return v9;
}

- (STStatusBarData)statusBarData
{
  return self->_statusBarData;
}

- (void)setStatusBarData:(id)a3
{
}

- (NSSet)suppressedBackgroundActivityIdentifiers
{
  return self->_suppressedBackgroundActivityIdentifiers;
}

- (void)setSuppressedBackgroundActivityIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressedBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_statusBarData, 0);
}

@end