@interface PRSPosterDescriptor
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)role;
- (NSURL)assetDirectory;
- (PFPosterPath)_path;
- (PRSPosterDescriptor)init;
- (PRSPosterDescriptor)initWithBSXPCCoder:(id)a3;
- (id)_initWithPath:(id)a3;
- (id)loadUserInfoWithError:(id *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRSPosterDescriptor

- (id)_initWithPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterDescriptor _initWithPath:]();
    }
LABEL_11:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78ADFFCLL);
  }
  v6 = v5;
  v7 = [v5 descriptorIdentifier];

  if (!v7)
  {
    v16 = [NSString stringWithFormat:@"descriptors must have descriptorIdentifiers : %@", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterDescriptor _initWithPath:]();
    }
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)PRSPosterDescriptor;
  v8 = [(PRSPosterDescriptor *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    path = v9->_path;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [(PFPosterPath *)path extendValidityForReason:v12];
    pathValidityExtension = v9->_pathValidityExtension;
    v9->_pathValidityExtension = (BSInvalidatable *)v13;
  }
  return v9;
}

- (NSString)identifier
{
  return (NSString *)[(PFPosterPath *)self->_path descriptorIdentifier];
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterDescriptor;
  [(PRSPosterDescriptor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (PRSPosterDescriptor)init
{
  v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"PRSPosterDescriptor.m";
    __int16 v21 = 1024;
    int v22 = 25;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  result = (PRSPosterDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)role
{
  return (NSString *)[(PFPosterPath *)self->_path role];
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PFPosterPath *)self->_path contentsURL];
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)[(PFPosterPath *)self->_path loadUserInfoWithError:a3];
}

- (unint64_t)hash
{
  objc_super v3 = [(PFPosterPath *)self->_path serverIdentity];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 hash];
  }
  else
  {
    v6 = [(PFPosterPath *)self->_path contentsURL];
    unint64_t v5 = [v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRSPosterDescriptor *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = [(PFPosterPath *)self->_path serverIdentity];
      if (v7)
      {
        v8 = [(PFPosterPath *)v4->_path serverIdentity];
        char v6 = BSEqualObjects();
      }
      else
      {
        char v6 = [(PFPosterPath *)self->_path isEqual:v4->_path];
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@:%p path=%@>", v5, self, self->_path];

  return (NSString *)v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (PRSPosterDescriptor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_posterDescriptorPath"];

  char v6 = [(PRSPosterDescriptor *)self _initWithPath:v5];
  return v6;
}

- (PFPosterPath)_path
{
  return self->_path;
}

- (void)_initWithPath:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithPath:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end