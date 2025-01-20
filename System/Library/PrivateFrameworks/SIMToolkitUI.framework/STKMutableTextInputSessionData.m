@interface STKMutableTextInputSessionData
- (void)setDefaultText:(id)a3;
- (void)setIsDigitsOnly:(BOOL)a3;
- (void)setIsSecure:(BOOL)a3;
- (void)setMaximumInputLength:(unint64_t)a3;
- (void)setMinimumInputLength:(unint64_t)a3;
@end

@implementation STKMutableTextInputSessionData

- (void)setDefaultText:(id)a3
{
  self->super._defaultText = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIsSecure:(BOOL)a3
{
  self->super._isSecure = a3;
}

- (void)setIsDigitsOnly:(BOOL)a3
{
  self->super._isDigitsOnly = a3;
}

- (void)setMinimumInputLength:(unint64_t)a3
{
  self->super._minimumInputLength = a3;
}

- (void)setMaximumInputLength:(unint64_t)a3
{
  self->super._maximumInputLength = a3;
}

@end