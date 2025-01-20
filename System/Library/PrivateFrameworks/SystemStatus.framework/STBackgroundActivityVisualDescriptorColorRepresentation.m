@interface STBackgroundActivityVisualDescriptorColorRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BSColor)BSColor;
- (NSString)description;
- (NSString)patternColorKitImageName;
- (NSString)systemColorName;
- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithBSColor:(id)a3;
- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithCoder:(id)a3;
- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithPatternColorKitImageName:(id)a3;
- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithPlistRepresentation:(id)a3;
- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithSystemColorName:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STBackgroundActivityVisualDescriptorColorRepresentation

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithPlistRepresentation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "bs_safeStringForKey:", @"SystemColorName");
  v6 = objc_msgSend(v4, "bs_safeArrayForKey:", @"RGBAColor");
  v7 = objc_msgSend(v4, "bs_safeStringForKey:", @"_PatternColorKitImageName");

  if (!v5)
  {
    if (!v6)
    {
      if (!v7)
      {
        v9 = 0;
        goto LABEL_18;
      }
      v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self initWithPatternColorKitImageName:v7];
      goto LABEL_3;
    }
    objc_msgSend(v6, "bs_objectsOfClass:", objc_opt_class());
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if ([v10 count] == 3 || objc_msgSend(v10, "count") == 4)
    {
      v11 = [v10 objectAtIndexedSubscript:0];
      [v11 doubleValue];
      double v13 = v12;

      v14 = [v10 objectAtIndexedSubscript:1];
      [v14 doubleValue];
      double v16 = v15;

      v17 = [v10 objectAtIndexedSubscript:2];
      [v17 doubleValue];
      double v19 = v18;

      double v20 = 1.0;
      if ([v10 count] == 4)
      {
        v21 = [v10 objectAtIndexedSubscript:3];
        [v21 doubleValue];
        double v20 = v22;
      }
      v23 = [MEMORY[0x1E4F4F6E0] colorWithRed:v13 green:v16 blue:v19 alpha:v20];

      if (v23)
      {
        self = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self initWithBSColor:v23];
        v9 = self;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    v24 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138543362;
      id v27 = v10;
      _os_log_error_impl(&dword_1D9514000, v24, OS_LOG_TYPE_ERROR, "Expected an RGB or RGBA color as an array of numbers, but got: '%{public}@'", (uint8_t *)&v26, 0xCu);
    }

    v23 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self initWithSystemColorName:v5];
LABEL_3:
  self = v8;
  v9 = self;
LABEL_18:

  return v9;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithSystemColorName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivityVisualDescriptorColorRepresentation;
  v5 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    systemColorName = v5->_systemColorName;
    v5->_systemColorName = (NSString *)v6;
  }
  return v5;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithBSColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivityVisualDescriptorColorRepresentation;
  uint64_t v6 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_BSColor, a3);
  }

  return v7;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithPatternColorKitImageName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivityVisualDescriptorColorRepresentation;
  id v5 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    patternColorKitImageName = v5->_patternColorKitImageName;
    v5->_patternColorKitImageName = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self systemColorName];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke;
  v20[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v20];

  objc_super v9 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self BSColor];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_2;
  v18[3] = &unk_1E6B63058;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:v9 counterpart:v18];

  double v12 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self patternColorKitImageName];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_3;
  v16[3] = &unk_1E6B630A8;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendString:v12 counterpart:v16];

  LOBYTE(v12) = [v5 isEqual];
  return (char)v12;
}

uint64_t __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemColorName];
}

uint64_t __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) BSColor];
}

uint64_t __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) patternColorKitImageName];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self systemColorName];
  id v5 = (id)[v3 appendString:v4];

  uint64_t v6 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self BSColor];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self patternColorKitImageName];
  id v9 = (id)[v3 appendString:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (NSString)description
{
  return (NSString *)[(STBackgroundActivityVisualDescriptorColorRepresentation *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STBackgroundActivityVisualDescriptorColorRepresentation *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self systemColorName];
  [v7 appendString:v8 withName:@"systemColorName" skipIfEmpty:1];

  id v9 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self BSColor];
  id v10 = (id)[v7 appendObject:v9 withName:@"BSColor" skipIfNil:1];

  id v11 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self patternColorKitImageName];
  [v7 appendString:v11 withName:@"patternColorKitImageName" skipIfEmpty:1];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self systemColorName];
  [v4 encodeObject:v5 forKey:@"systemColorName"];

  id v6 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self BSColor];
  [v4 encodeObject:v6 forKey:@"BSColor"];

  id v7 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self patternColorKitImageName];
  [v4 encodeObject:v7 forKey:@"patternColorKitImageName"];
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemColorName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BSColor"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patternColorKitImageName"];

  if (v5)
  {
    id v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self initWithSystemColorName:v5];
  }
  else if (v6)
  {
    id v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self initWithBSColor:v6];
  }
  else
  {
    if (!v7)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    id v8 = [(STBackgroundActivityVisualDescriptorColorRepresentation *)self initWithPatternColorKitImageName:v7];
  }
  self = v8;
  id v9 = self;
LABEL_8:

  return v9;
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (NSString)patternColorKitImageName
{
  return self->_patternColorKitImageName;
}

- (BSColor)BSColor
{
  return self->_BSColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSColor, 0);
  objc_storeStrong((id *)&self->_patternColorKitImageName, 0);

  objc_storeStrong((id *)&self->_systemColorName, 0);
}

@end