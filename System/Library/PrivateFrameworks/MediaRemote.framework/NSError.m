@interface NSError
@end

@implementation NSError

id __44__NSError_MRAdditions__mr_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F28C58];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = objc_msgSend(v4, "mr_initWithProtobuf:", v3);

  return v5;
}

uint64_t __35__NSError_MRAdditions__mr_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mr_protobuf");
}

@end