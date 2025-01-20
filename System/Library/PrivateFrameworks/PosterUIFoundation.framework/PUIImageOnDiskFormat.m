@interface PUIImageOnDiskFormat
+ (PUIImageOnDiskFormat)defaultATX;
+ (PUIImageOnDiskFormat)png;
+ (id)atxWithBlockSize:(unsigned int)a3 twiddling:(BOOL)a4;
- (NSDictionary)addImageOptions;
- (NSDictionary)destinationOptions;
- (NSString)filenameExtension;
- (NSString)typeIdentifier;
- (PUIImageOnDiskFormat)initWithTypeIdentifier:(id)a3 filenameExtension:(id)a4 destinationOptions:(id)a5 addImageOptions:(id)a6;
- (PUIImageOnDiskFormat)initWithTypeRecord:(id)a3 destinationOptions:(id)a4 addImageOptions:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatByAppendingDestinationOptions:(id)a3 addImageOptions:(id)a4;
- (id)resolveAddImageOptionsForImage:(CGImage *)a3;
- (id)resolveDestinationOptionsForImage:(CGImage *)a3;
@end

@implementation PUIImageOnDiskFormat

- (PUIImageOnDiskFormat)initWithTypeIdentifier:(id)a3 filenameExtension:(id)a4 destinationOptions:(id)a5 addImageOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"typeIdentifier != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:]();
    }
LABEL_11:
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0B214CLL);
  }
  if (!v11)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"filenameExtension != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:]();
    }
    goto LABEL_11;
  }
  v14 = v13;
  v15 = [(PUIImageOnDiskFormat *)self init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    filenameExtension = v15->_filenameExtension;
    v15->_filenameExtension = (NSString *)v16;

    uint64_t v18 = [v10 copy];
    typeIdentifier = v15->_typeIdentifier;
    v15->_typeIdentifier = (NSString *)v18;

    uint64_t v20 = [v12 copy];
    destinationOptions = v15->_destinationOptions;
    v15->_destinationOptions = (NSDictionary *)v20;

    uint64_t v22 = [v14 copy];
    addImageOptions = v15->_addImageOptions;
    v15->_addImageOptions = (NSDictionary *)v22;
  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PUIImageOnDiskFormat alloc];
  filenameExtension = self->_filenameExtension;
  typeIdentifier = self->_typeIdentifier;
  destinationOptions = self->_destinationOptions;
  addImageOptions = self->_addImageOptions;
  return [(PUIImageOnDiskFormat *)v4 initWithTypeIdentifier:typeIdentifier filenameExtension:filenameExtension destinationOptions:destinationOptions addImageOptions:addImageOptions];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addImageOptions, 0);
  objc_storeStrong((id *)&self->_destinationOptions, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_filenameExtension, 0);
}

+ (id)atxWithBlockSize:(unsigned int)a3 twiddling:(BOOL)a4
{
  BOOL v4 = a4;
  v12[4] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F0F080];
  uint64_t v5 = *MEMORY[0x263F0F078];
  v11[0] = *MEMORY[0x263F0F1B0];
  v11[1] = v5;
  v6 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v12[1] = v6;
  v11[2] = *MEMORY[0x263F0F088];
  v7 = [NSNumber numberWithBool:v4];
  v11[3] = *MEMORY[0x263F0F090];
  v12[2] = v7;
  v12[3] = MEMORY[0x263EFFA80];
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  v9 = [[PUIImageOnDiskFormat alloc] initWithTypeIdentifier:@"com.apple.atx" filenameExtension:@"atx" destinationOptions:0 addImageOptions:v8];
  return v9;
}

+ (PUIImageOnDiskFormat)defaultATX
{
  return (PUIImageOnDiskFormat *)[a1 atxWithBlockSize:68 twiddling:1];
}

+ (PUIImageOnDiskFormat)png
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0F4D0];
  v15[0] = &unk_27081B3B0;
  uint64_t v3 = *MEMORY[0x263F0F4E0];
  v14[0] = v2;
  v14[1] = v3;
  uint64_t v12 = *MEMORY[0x263F0F4D8];
  id v13 = &unk_27081B3C8;
  BOOL v4 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  v6 = [PUIImageOnDiskFormat alloc];
  v7 = (void *)*MEMORY[0x263F1DC08];
  v8 = [(id)*MEMORY[0x263F1DC08] identifier];
  v9 = [v7 preferredFilenameExtension];
  id v10 = [(PUIImageOnDiskFormat *)v6 initWithTypeIdentifier:v8 filenameExtension:v9 destinationOptions:0 addImageOptions:v5];

  return v10;
}

- (PUIImageOnDiskFormat)initWithTypeRecord:(id)a3 destinationOptions:(id)a4 addImageOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 identifier];
  uint64_t v12 = [v10 preferredFilenameExtension];

  id v13 = [(PUIImageOnDiskFormat *)self initWithTypeIdentifier:v11 filenameExtension:v12 destinationOptions:v9 addImageOptions:v8];
  return v13;
}

- (id)resolveDestinationOptionsForImage:(CGImage *)a3
{
  if (a3)
  {
    BOOL v4 = [(PUIImageOnDiskFormat *)self destinationOptions];

    if (v4)
    {
      uint64_t v5 = [(PUIImageOnDiskFormat *)self destinationOptions];
      v6 = (void *)[v5 mutableCopy];

      PUIResolveMaxPixelOption(v6);
    }
    else
    {
      v6 = 0;
    }
    return v6;
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"image != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageOnDiskFormat resolveDestinationOptionsForImage:]();
    }
    [v8 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)resolveAddImageOptionsForImage:(CGImage *)a3
{
  if (a3)
  {
    BOOL v4 = [(PUIImageOnDiskFormat *)self addImageOptions];

    if (v4)
    {
      uint64_t v5 = [(PUIImageOnDiskFormat *)self addImageOptions];
      v6 = (void *)[v5 mutableCopy];

      PUIResolveMaxPixelOption(v6);
    }
    else
    {
      v6 = 0;
    }
    return v6;
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"image != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIImageOnDiskFormat resolveAddImageOptionsForImage:]();
    }
    [v8 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)formatByAppendingDestinationOptions:(id)a3 addImageOptions:(id)a4
{
  v6 = (NSDictionary *)MEMORY[0x263EFFA78];
  if (self->_destinationOptions) {
    destinationOptions = self->_destinationOptions;
  }
  else {
    destinationOptions = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  id v8 = a4;
  id v9 = [(NSDictionary *)destinationOptions bs_dictionaryByAddingEntriesFromDictionary:a3];
  if (self->_addImageOptions) {
    addImageOptions = self->_addImageOptions;
  }
  else {
    addImageOptions = v6;
  }
  id v11 = [(NSDictionary *)addImageOptions bs_dictionaryByAddingEntriesFromDictionary:v8];

  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTypeIdentifier:self->_typeIdentifier filenameExtension:self->_filenameExtension destinationOptions:v9 addImageOptions:v11];
  return v12;
}

- (NSString)filenameExtension
{
  return self->_filenameExtension;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSDictionary)destinationOptions
{
  return self->_destinationOptions;
}

- (NSDictionary)addImageOptions
{
  return self->_addImageOptions;
}

- (void)initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)resolveDestinationOptionsForImage:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)resolveAddImageOptionsForImage:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end