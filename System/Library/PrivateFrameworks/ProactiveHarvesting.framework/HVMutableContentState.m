@interface HVMutableContentState
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConsumers:(id)a3;
- (void)setLevelOfService:(unsigned __int8)a3;
@end

@implementation HVMutableContentState

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HVContentState alloc];
  consumers = self->super._consumers;
  uint64_t levelOfService = self->super._levelOfService;

  return [(HVContentState *)v4 initWithConsumers:consumers levelOfService:levelOfService];
}

- (void)setLevelOfService:(unsigned __int8)a3
{
  self->super._uint64_t levelOfService = a3;
}

- (void)setConsumers:(id)a3
{
  self->super._consumers = (NSSet *)[a3 copy];

  MEMORY[0x270F9A758]();
}

@end