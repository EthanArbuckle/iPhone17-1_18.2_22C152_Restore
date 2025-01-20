@interface CSConcreteUnlockRequest
- (BOOL)confirmedNotInPocket;
- (BOOL)wantsBiometricPresentation;
- (NSString)name;
- (int)intent;
- (int)source;
- (void)setConfirmedNotInPocket:(BOOL)a3;
- (void)setIntent:(int)a3;
- (void)setName:(id)a3;
- (void)setSource:(int)a3;
- (void)setWantsBiometricPresentation:(BOOL)a3;
@end

@implementation CSConcreteUnlockRequest

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (int)source
{
  return self->source;
}

- (void)setSource:(int)a3
{
  self->source = a3;
}

- (int)intent
{
  return self->intent;
}

- (void)setIntent:(int)a3
{
  self->intent = a3;
}

- (BOOL)wantsBiometricPresentation
{
  return self->wantsBiometricPresentation;
}

- (void)setWantsBiometricPresentation:(BOOL)a3
{
  self->wantsBiometricPresentation = a3;
}

- (BOOL)confirmedNotInPocket
{
  return self->confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->confirmedNotInPocket = a3;
}

- (void).cxx_destruct
{
}

@end