@interface NSValue(PXViewSpecDescriptor)
+ (uint64_t)px_valueWithViewSpecDescriptor:()PXViewSpecDescriptor;
- (uint64_t)px_viewSpecDescriptorValue;
@end

@implementation NSValue(PXViewSpecDescriptor)

- (uint64_t)px_viewSpecDescriptorValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return [a1 getValue:x8_0];
}

+ (uint64_t)px_valueWithViewSpecDescriptor:()PXViewSpecDescriptor
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{PXViewSpecDescriptor=qQ{CGSize=dd}}"];
}

@end