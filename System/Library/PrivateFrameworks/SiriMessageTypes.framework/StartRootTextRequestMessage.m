@interface StartRootTextRequestMessage
@end

@implementation StartRootTextRequestMessage

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_optionalRequestContextData));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType);
  uint64_t v4 = *(void *)&self->super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes27StartRootTextRequestMessage_textRequestType];
  sub_25D014910(v3, v4);
}

@end