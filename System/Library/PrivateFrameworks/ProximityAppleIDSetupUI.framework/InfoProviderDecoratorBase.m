@interface InfoProviderDecoratorBase
- (void)authenticateWithAccount:(id)a3 with:(id)a4 completion:(id)a5;
- (void)didPerformLocalAuthenticationWithCompletion:(id)a3;
- (void)fetchManifestWithCompletion:(id)a3;
- (void)fetchViewDetailsWithDevicePair:(id)a3 completion:(id)a4;
- (void)shouldPerformLocalAuthenticationWithCompletion:(id)a3;
- (void)signInSucceededWithAccount:(id)a3 completion:(id)a4;
@end

@implementation InfoProviderDecoratorBase

- (void)fetchManifestWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(void **)self->underlyingInfoProvider;
  v8[4] = sub_22E7BE20C;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_22E7BD01C;
  v8[3] = &block_descriptor_74;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_fetchManifestWithCompletion_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)fetchViewDetailsWithDevicePair:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(void **)self->underlyingInfoProvider;
  v11[4] = sub_22E7BE22C;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_22E7BD01C;
  v11[3] = &block_descriptor_68;
  v9 = _Block_copy(v11);
  id v10 = a3;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_fetchViewDetailsWithDevicePair_completion_, v10, v9);
  _Block_release(v9);

  swift_release();
  swift_release();
}

- (void)authenticateWithAccount:(id)a3 with:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = *(void **)self->underlyingInfoProvider;
  v14[4] = sub_22E7BE228;
  v14[5] = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_22E7BD350;
  v14[3] = &block_descriptor_62;
  v11 = _Block_copy(v14);
  id v12 = a3;
  id v13 = a4;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_authenticateWithAccount_with_completion_, v12, v13, v11);
  _Block_release(v11);

  swift_release();
  swift_release();
}

- (void)signInSucceededWithAccount:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_22E7F3E90();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = *(void **)self->underlyingInfoProvider;
  swift_retain();
  v8 = (void *)sub_22E7F3E60();
  v10[4] = sub_22E7BE230;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22E7DEF3C;
  v10[3] = &block_descriptor_55;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_signInSucceededWithAccount_completion_, v8, v9);
  _Block_release(v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)shouldPerformLocalAuthenticationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void **)self->underlyingInfoProvider;
  v8[4] = sub_22E7BE204;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_22E7BD734;
  v8[3] = &block_descriptor_48;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_shouldPerformLocalAuthenticationWithCompletion_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)didPerformLocalAuthenticationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void **)self->underlyingInfoProvider;
  v8[4] = sub_22E7BE1FC;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_22E7DEF3C;
  v8[3] = &block_descriptor_42;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_didPerformLocalAuthenticationWithCompletion_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

@end