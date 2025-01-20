@interface NTKFace(NTKFaceInstanceDescriptorAdditions)
@end

@implementation NTKFace(NTKFaceInstanceDescriptorAdditions)

+ (void)faceWithInstanceDescriptor:()NTKFaceInstanceDescriptorAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "JSON data is nil for instance descriptor %@", (uint8_t *)&v2, 0xCu);
}

+ (void)faceWithInstanceDescriptor:()NTKFaceInstanceDescriptorAdditions .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "JSON object is of wrong class type %@", (uint8_t *)&v2, 0xCu);
}

@end