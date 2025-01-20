@interface CertUIPrompt
- (void)setHost:(id)a3;
- (void)setService:(id)a3;
- (void)setTrust:(__SecTrust *)a3;
- (void)showPromptWithOptions:(id)a3 responseBlock:(id)a4;
@end

@implementation CertUIPrompt

- (void)setHost:(id)a3
{
  if (a3)
  {
    sub_1005E1C00();
    v4 = *(void (**)(uint64_t, const char *))self->_setHostname;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    NSString v6 = sub_1005E1BD0();
  }
  else
  {
    v4 = *(void (**)(uint64_t, const char *))self->_setHostname;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    NSString v6 = 0;
  }
  id v7 = v6;
  v4(v5, "setHost:");
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)setService:(id)a3
{
  if (a3)
  {
    sub_1005E1C00();
    v4 = *(void (**)(uint64_t, const char *))self->_setService;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    NSString v6 = sub_1005E1BD0();
  }
  else
  {
    v4 = *(void (**)(uint64_t, const char *))self->_setService;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    NSString v6 = 0;
  }
  id v7 = v6;
  v4(v5, "setService:");
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)setTrust:(__SecTrust *)a3
{
}

- (void)showPromptWithOptions:(id)a3 responseBlock:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  if (a3) {
    a3 = (id)sub_1005E1970();
  }
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_100351CD0((uint64_t)a3, (uint64_t)sub_1003522E8, v6);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end