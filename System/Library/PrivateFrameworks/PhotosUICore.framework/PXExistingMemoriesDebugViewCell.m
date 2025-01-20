@interface PXExistingMemoriesDebugViewCell
- (PHMemory)memory;
- (void)setMemory:(id)a3;
@end

@implementation PXExistingMemoriesDebugViewCell

- (void).cxx_destruct
{
}

- (void)setMemory:(id)a3
{
}

- (PHMemory)memory
{
  return (PHMemory *)objc_getProperty(self, a2, 1016, 1);
}

@end