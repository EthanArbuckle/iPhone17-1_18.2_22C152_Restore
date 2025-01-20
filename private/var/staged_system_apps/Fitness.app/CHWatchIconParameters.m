@interface CHWatchIconParameters
- (int)iconVariant2x;
- (int)iconVariant3x;
- (void)setIconVariant2x:(int)a3;
- (void)setIconVariant3x:(int)a3;
@end

@implementation CHWatchIconParameters

- (int)iconVariant2x
{
  return self->_iconVariant2x;
}

- (void)setIconVariant2x:(int)a3
{
  self->_iconVariant2x = a3;
}

- (int)iconVariant3x
{
  return self->_iconVariant3x;
}

- (void)setIconVariant3x:(int)a3
{
  self->_iconVariant3x = a3;
}

@end