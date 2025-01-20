@interface SCLMutableInterruptEvent
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSender:(id)a3;
- (void)setShouldAlwaysInterrupt:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setUrgency:(unint64_t)a3;
@end

@implementation SCLMutableInterruptEvent

- (void)setType:(unint64_t)a3
{
  self->super._type = a3;
}

- (void)setUrgency:(unint64_t)a3
{
  self->super._urgency = a3;
}

- (void)setSender:(id)a3
{
  self->super._sender = (SCLContact *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setShouldAlwaysInterrupt:(BOOL)a3
{
  self->super._urgency = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SCLInterruptEvent alloc];
  return [(SCLInterruptEvent *)v4 _initWithEvent:self];
}

@end