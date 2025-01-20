@interface NTKFace(NTKFaceDescriptorAdditions)
@end

@implementation NTKFace(NTKFaceDescriptorAdditions)

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Face Descriptor is nil", v1, 2u);
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Face Bundle is nil for descriptor %@", v2, v3, v4, v5, v6);
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1BC5A9000, v1, OS_LOG_TYPE_ERROR, "Default Face for bundle %@ is nil for descriptor %@", v2, 0x16u);
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_2();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "Default Face of style %@ is nil for descriptor %@", v6, 0x16u);
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Device is nil for descriptor %@", v2, v3, v4, v5, v6);
}

@end