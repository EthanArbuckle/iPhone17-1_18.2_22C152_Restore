@interface CHChannelText
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (OZChannelText)ozChannel;
- (id)string;
- (void)setAttributedString:(id)a3;
- (void)setString:(id)a3;
- (void)setString:(id)a3 affectLayout:(BOOL)a4;
@end

@implementation CHChannelText

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelText)ozChannel
{
  result = (OZChannelText *)self->super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (id)string
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  (*(void (**)(PCString *__return_ptr))(*(void *)pOZChannel + 848))(&v5);
  }
  v3 = PCString::ns_str(&v5);
  PCString::~PCString(&v5);
  return v3;
}

- (void)setString:(id)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    PCString v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  (*(void (**)(void *, PCString *, void, void))(*(void *)v5 + 864))(v5, &v6, 0, 0);
  PCString::~PCString(&v6);
}

- (void)setString:(id)a3 affectLayout:(BOOL)a4
{
  BOOL v4 = a4;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  v8.var0 = 0;
  PCString::set(&v8, (CFStringRef)a3);
  (*(void (**)(void *, PCString *, void, BOOL))(*(void *)v7 + 864))(v7, &v8, 0, v4);
  PCString::~PCString(&v8);
}

- (void)setAttributedString:(id)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  BOOL v4 = *(void (**)(void))(*(void *)pOZChannel + 872);
  }

  v4();
}

@end