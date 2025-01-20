@interface UIUserInterfaceStyleArbiterTransition
- (id)description;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)type;
- (void)setHour:(int64_t)a3;
- (void)setMinute:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation UIUserInterfaceStyleArbiterTransition

- (id)description
{
  int64_t v3 = [(UIUserInterfaceStyleArbiterTransition *)self type];
  if (v3 == 2)
  {
    v4 = @"Sunset";
  }
  else if (v3 == 1)
  {
    v4 = @"Sunrise";
  }
  else if (v3)
  {
    v4 = @"Unknown";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Time: %02ld:%02ld", -[UIUserInterfaceStyleArbiterTransition hour](self, "hour"), -[UIUserInterfaceStyleArbiterTransition minute](self, "minute"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [NSString stringWithFormat:@"<%@ %p: %@>", objc_opt_class(), self, v4];

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)hour
{
  return self->_hour;
}

- (void)setHour:(int64_t)a3
{
  self->_hour = a3;
}

- (int64_t)minute
{
  return self->_minute;
}

- (void)setMinute:(int64_t)a3
{
  self->_minute = a3;
}

@end