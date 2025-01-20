@interface SASButtonActvationRequest
- (BOOL)isButtonRequest;
- (BOOL)isDeviceButtonRequest;
- (BOOL)isHoldToTalkSource;
- (BOOL)isTestingRequest;
- (BOOL)isVoiceRequest;
- (int64_t)buttonIdentifier;
- (void)setButtonIdentifier:(int64_t)a3;
@end

@implementation SASButtonActvationRequest

- (BOOL)isVoiceRequest
{
  return 0;
}

- (BOOL)isHoldToTalkSource
{
  return 1;
}

- (BOOL)isButtonRequest
{
  return 1;
}

- (BOOL)isDeviceButtonRequest
{
  unint64_t v2 = [(SASButtonActvationRequest *)self buttonIdentifier];
  return (v2 < 0xA) & (0x206u >> v2);
}

- (BOOL)isTestingRequest
{
  return 0;
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int64_t)a3
{
  self->_buttonIdentifier = a3;
}

@end