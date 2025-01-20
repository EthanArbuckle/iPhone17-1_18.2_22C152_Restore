@interface _UITextInputSessionActionInformation
- (BOOL)sessionHasDictation;
- (BOOL)sessionHasOnlyPrimaryInput;
- (NSString)sessionActionString;
- (void)setSessionActionString:(id)a3;
- (void)setSessionHasDictation:(BOOL)a3;
- (void)setSessionHasOnlyPrimaryInput:(BOOL)a3;
@end

@implementation _UITextInputSessionActionInformation

- (NSString)sessionActionString
{
  return self->_sessionActionString;
}

- (void)setSessionActionString:(id)a3
{
}

- (BOOL)sessionHasOnlyPrimaryInput
{
  return self->_sessionHasOnlyPrimaryInput;
}

- (void)setSessionHasOnlyPrimaryInput:(BOOL)a3
{
  self->_sessionHasOnlyPrimaryInput = a3;
}

- (BOOL)sessionHasDictation
{
  return self->_sessionHasDictation;
}

- (void)setSessionHasDictation:(BOOL)a3
{
  self->_sessionHasDictation = a3;
}

- (void).cxx_destruct
{
}

@end