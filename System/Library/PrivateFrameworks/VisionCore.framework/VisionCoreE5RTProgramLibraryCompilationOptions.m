@interface VisionCoreE5RTProgramLibraryCompilationOptions
- (BOOL)createE5RTCompilerOptions:(e5rt_e5_compiler_options *)a3 error:(id *)a4;
- (BOOL)fullyANEResident;
- (NSString)customCompilationOptions;
- (VisionCoreE5RTProgramLibraryCompilationOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)computeDeviceTypes;
- (void)setComputeDeviceTypes:(unint64_t)a3;
- (void)setCustomCompilationOptions:(id)a3;
- (void)setFullyANEResident:(BOOL)a3;
@end

@implementation VisionCoreE5RTProgramLibraryCompilationOptions

- (void)setCustomCompilationOptions:(id)a3
{
  self->_customCompilationOptions = (NSString *)a3;
}

- (NSString)customCompilationOptions
{
  return self->_customCompilationOptions;
}

- (void)setFullyANEResident:(BOOL)a3
{
  self->_fullyANEResident = a3;
}

- (BOOL)fullyANEResident
{
  return self->_fullyANEResident;
}

- (void)setComputeDeviceTypes:(unint64_t)a3
{
  self->_computeDeviceTypes = a3;
}

- (unint64_t)computeDeviceTypes
{
  return self->_computeDeviceTypes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (BOOL)createE5RTCompilerOptions:(e5rt_e5_compiler_options *)a3 error:(id *)a4
{
  uint64_t v7 = e5rt_e5_compiler_options_create();
  if (v7)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v7];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = [(VisionCoreE5RTProgramLibraryCompilationOptions *)self computeDeviceTypes];
    if (!v9) {
      goto LABEL_11;
    }
    if ((v9 & 7) == 4) {
      [(VisionCoreE5RTProgramLibraryCompilationOptions *)self fullyANEResident];
    }
    uint64_t v10 = e5rt_e5_compiler_options_set_compute_device_types_mask();
    if (v10)
    {
      if (a4)
      {
        [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v10];
        BOOL v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        return 0;
      }
    }
    else
    {
LABEL_11:
      v11 = [(VisionCoreE5RTProgramLibraryCompilationOptions *)self customCompilationOptions];
      v12 = v11;
      if (v11
        && ([v11 UTF8String],
            uint64_t v13 = e5rt_e5_compiler_options_set_custom_ane_compiler_options(),
            v13))
      {
        if (a4)
        {
          [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v13];
          BOOL v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        *a3 = 0;
        BOOL v8 = 1;
      }
    }
  }
  return v8;
}

- (VisionCoreE5RTProgramLibraryCompilationOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)VisionCoreE5RTProgramLibraryCompilationOptions;
  v2 = [(VisionCoreE5RTProgramLibraryCompilationOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_computeDeviceTypes = 0;
    v2->_fullyANEResident = 1;
    v4 = v2;
  }

  return v3;
}

@end