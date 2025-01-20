@interface PLMinMaxSettings
- (NSNumber)max;
- (NSNumber)min;
- (void)setMax:(id)a3;
- (void)setMin:(id)a3;
@end

@implementation PLMinMaxSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

- (void)setMax:(id)a3
{
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMin:(id)a3
{
}

- (NSNumber)min
{
  return self->_min;
}

@end