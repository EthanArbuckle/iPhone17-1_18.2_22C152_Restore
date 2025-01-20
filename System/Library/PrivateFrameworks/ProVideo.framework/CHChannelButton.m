@interface CHChannelButton
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (OZChannelButton)ozChannel;
- (id)callback;
- (void)performCallback;
- (void)setButtonTitle:(id)a3;
- (void)setCallback:(id)a3;
- (void)setSelector:(SEL)a3 andTarget:(id)a4;
@end

@implementation CHChannelButton

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelButton)ozChannel
{
  result = (OZChannelButton *)self->super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (void)setSelector:(SEL)a3 andTarget:(id)a4
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  CFStringRef v8 = (const __CFString *)NSStringFromSelector(a3);
  v10.var0 = 0;
  PCString::set(&v10, v8);
  v9.var0 = (__CFString *)&v10;
  OZChannelButton::setCallbackSelectorAsString(v7, v9, a4);
  PCString::~PCString(&v10);
}

- (id)callback
{
  pOZChannel = (OZChannelButton *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannelButton::getCallbackBlock(pOZChannel);
}

- (void)setCallback:(id)a3
{
  pOZChannel = (OZChannelButton *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelButton::setCallbackBlock(pOZChannel, a3);
}

- (void)setButtonTitle:(id)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  PCString::set(v5 + 22, &v6);
  PCString::~PCString(&v6);
}

- (void)performCallback
{
  pOZChannel = (OZChannelButton *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelButton::callCallback(pOZChannel);
}

@end