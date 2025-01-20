@interface UVHardwareEvent
- (NSData)data;
- (UVHardwareEvent)initWithData:(id)a3 error:(id *)a4;
@end

@implementation UVHardwareEvent

- (NSData)data
{
  return (NSData *)[MEMORY[0x263EFF8F8] data];
}

- (UVHardwareEvent)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UVHardwareEvent;
  return [(UVHardwareEvent *)&v5 init];
}

@end