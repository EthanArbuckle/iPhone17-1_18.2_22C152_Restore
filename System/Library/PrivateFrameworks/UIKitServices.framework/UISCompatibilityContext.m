@interface UISCompatibilityContext
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)supportedDisplaySizes;
- (NSString)description;
- (UISCompatibilityContext)initWithBSXPCCoder:(id)a3;
- (UISCompatibilityContext)initWithSupportedDisplaySizes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation UISCompatibilityContext

- (UISCompatibilityContext)initWithSupportedDisplaySizes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISCompatibilityContext;
  v5 = [(UISCompatibilityContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    supportedDisplaySizes = v5->_supportedDisplaySizes;
    v5->_supportedDisplaySizes = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISCompatibilityContext *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(UISCompatibilityContext *)self supportedDisplaySizes];
    v7 = [(UISCompatibilityContext *)v5 supportedDisplaySizes];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  return ~[(NSArray *)self->_supportedDisplaySizes hash];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_supportedDisplaySizes withName:@"SupportedDisplaySizes"];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UISCompatibilityContext alloc];
  v5 = [(UISCompatibilityContext *)self supportedDisplaySizes];
  uint64_t v6 = [(UISCompatibilityContext *)v4 initWithSupportedDisplaySizes:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UISMutableCompatibilityContext alloc];
  v5 = [(UISCompatibilityContext *)self supportedDisplaySizes];
  uint64_t v6 = [(UISCompatibilityContext *)v4 initWithSupportedDisplaySizes:v5];

  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UISCompatibilityContext *)self supportedDisplaySizes];
  [v4 encodeCollection:v5 forKey:@"DisplaySizes"];
}

- (UISCompatibilityContext)initWithBSXPCCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UISCompatibilityContext;
  id v5 = [(UISCompatibilityContext *)&v25 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"DisplaySizes"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    objc_super v9 = v7;
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v22;
      double v12 = *MEMORY[0x1E4F1DB30];
      double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "bs_CGSizeValue");
          if (v16 == v12 && v15 == v13)
          {

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v20 = 0;
              _os_log_error_impl(&dword_191ABF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error decoding supported display sizes.", v20, 2u);
            }
            objc_super v9 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      objc_super v9 = v7;
    }
LABEL_17:

    if (v9) {
      v18 = v9;
    }
    else {
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_supportedDisplaySizes, v18);
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSArray)supportedDisplaySizes
{
  return self->_supportedDisplaySizes;
}

- (void).cxx_destruct
{
}

@end