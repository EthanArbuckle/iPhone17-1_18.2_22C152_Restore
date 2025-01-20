@interface KTOptInStatus
- (BOOL)everCompletedVerification;
- (BOOL)everOptedIn;
- (BOOL)optedIn;
- (void)setEverCompletedVerification:(BOOL)a3;
- (void)setEverOptedIn:(BOOL)a3;
- (void)setOptedIn:(BOOL)a3;
@end

@implementation KTOptInStatus

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  self->_optedIn = a3;
}

- (BOOL)everOptedIn
{
  return self->_everOptedIn;
}

- (void)setEverOptedIn:(BOOL)a3
{
  self->_everOptedIn = a3;
}

- (BOOL)everCompletedVerification
{
  return self->_everCompletedVerification;
}

- (void)setEverCompletedVerification:(BOOL)a3
{
  self->_everCompletedVerification = a3;
}

@end