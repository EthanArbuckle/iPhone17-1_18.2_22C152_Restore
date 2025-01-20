@interface SBSMutableUserNotificationTextFieldDefinition
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SBSMutableUserNotificationTextFieldDefinition

- (void)setTitle:(id)a3
{
  if (self->super._title != a3)
  {
    self->super._title = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setValue:(id)a3
{
  if (self->super._value != a3)
  {
    self->super._value = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setSecure:(BOOL)a3
{
  self->super._isSecure = a3;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->super._maxLength = a3;
  self->super._hasSetMaxLength = 1;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->super._keyboardType = a3;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->super._autocorrectionType = a3;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->super._autocapitalizationType = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBSUserNotificationTextFieldDefinition);
  [(SBSUserNotificationTextFieldDefinition *)self _copyPropertiesToDefinition:v4];
  return v4;
}

@end