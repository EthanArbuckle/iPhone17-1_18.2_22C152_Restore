@interface ICRemoteRequestOperationResponseIsAllowedForClassName
@end

@implementation ICRemoteRequestOperationResponseIsAllowedForClassName

void ___ICRemoteRequestOperationResponseIsAllowedForClassName_block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v3 = (void *)_ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNames;
  _ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNames = v2;
}

@end