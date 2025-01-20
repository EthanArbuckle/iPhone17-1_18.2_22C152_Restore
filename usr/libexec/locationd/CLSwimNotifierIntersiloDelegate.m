@interface CLSwimNotifierIntersiloDelegate
- (BOOL)valid;
- (CLSwimNotifierIntersiloDelegate)init;
- (void)setValid:(BOOL)a3;
@end

@implementation CLSwimNotifierIntersiloDelegate

- (CLSwimNotifierIntersiloDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSwimNotifierIntersiloDelegate;
  result = [(CLSwimNotifierIntersiloDelegate *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end