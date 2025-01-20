@interface SCLMutableContact
- (void)setContactIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation SCLMutableContact

- (void)setContactIdentifier:(id)a3
{
  self->super._contactIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setType:(unint64_t)a3
{
  self->super._type = a3;
}

- (void)setValue:(id)a3
{
  self->super._value = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

@end