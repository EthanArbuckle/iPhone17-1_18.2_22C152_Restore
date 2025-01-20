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
    sub_1A8A76558();
    v4 = *(void (**)(uint64_t, char *))self->_setHostname;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    uint64_t v6 = sub_1A8A76538();
  }
  else
  {
    v4 = *(void (**)(uint64_t, char *))self->_setHostname;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  v4(v5, sel_setHost_);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)setService:(id)a3
{
  if (a3)
  {
    sub_1A8A76558();
    v4 = *(void (**)(uint64_t, char *))self->_setService;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    uint64_t v6 = sub_1A8A76538();
  }
  else
  {
    v4 = *(void (**)(uint64_t, char *))self->_setService;
    uint64_t v5 = *(void *)self->underlying;
    swift_retain();
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  v4(v5, sel_setService_);
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
    a3 = (id)sub_1A8A76018();
  }
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_1A8860B04((uint64_t)a3, (uint64_t)sub_1A886111C, v6);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end