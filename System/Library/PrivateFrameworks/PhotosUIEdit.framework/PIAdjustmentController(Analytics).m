@interface PIAdjustmentController(Analytics)
- (uint64_t)analyticsPayload;
@end

@implementation PIAdjustmentController(Analytics)

- (uint64_t)analyticsPayload
{
  return MEMORY[0x263EFFA78];
}

@end