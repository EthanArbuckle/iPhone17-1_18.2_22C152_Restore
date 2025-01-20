@interface SFCounterfactualInfo
- (BOOL)cfDiffered;
- (BOOL)cfUsed;
- (unint64_t)cfError;
- (void)setCfDiffered:(BOOL)a3;
- (void)setCfError:(unint64_t)a3;
- (void)setCfUsed:(BOOL)a3;
@end

@implementation SFCounterfactualInfo

- (void)setCfError:(unint64_t)a3
{
  self->_cfError = a3;
}

- (unint64_t)cfError
{
  return self->_cfError;
}

- (void)setCfUsed:(BOOL)a3
{
  self->_cfUsed = a3;
}

- (BOOL)cfUsed
{
  return self->_cfUsed;
}

- (void)setCfDiffered:(BOOL)a3
{
  self->_cfDiffered = a3;
}

- (BOOL)cfDiffered
{
  return self->_cfDiffered;
}

@end