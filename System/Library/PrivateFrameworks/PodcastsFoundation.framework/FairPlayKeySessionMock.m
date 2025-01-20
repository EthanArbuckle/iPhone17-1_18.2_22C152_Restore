@interface FairPlayKeySessionMock
- (BOOL)bypassCache;
- (NSString)id;
- (NSString)keyStoreFilePath;
- (PFFairPlayAsset)asset;
- (PFFairPlayKeyResponseData)keyResponseData;
- (void)deregister;
- (void)pauseAutomaticKeyRenewal;
- (void)processKeyWith:(id)a3 completion:(id)a4;
- (void)register;
- (void)renewKey;
- (void)resumeAutomaticKeyRenewal;
- (void)stopAndInvalidateKeysWithCompletion:(id)a3;
@end

@implementation FairPlayKeySessionMock

- (NSString)id
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PFFairPlayAsset)asset
{
  v2 = *(uint64_t (**)(uint64_t))self->assetHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v4 = (void *)v2(v3);
    swift_release();
  }
  else
  {
    v4 = (void *)sub_1ACA8FE4C();
  }
  return (PFFairPlayAsset *)v4;
}

- (BOOL)bypassCache
{
  v2 = *(uint64_t (**)(uint64_t))self->bypassCacheHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    char v4 = v2(v3);
    swift_release();
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (NSString)keyStoreFilePath
{
  v2 = *(void (**)(uint64_t))self->keyStoreFilePathHandler;
  if (v2 && (uint64_t v3 = swift_retain(), v2(v3), v5 = v4, swift_release(), v5))
  {
    v6 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (PFFairPlayKeyResponseData)keyResponseData
{
  v2 = *(uint64_t (**)(uint64_t))self->keyResponseDataHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    uint64_t v4 = (void *)v2(v3);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (PFFairPlayKeyResponseData *)v4;
}

- (void)pauseAutomaticKeyRenewal
{
  v2 = *(void (**)(uint64_t))self->pauseHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)resumeAutomaticKeyRenewal
{
  v2 = *(void (**)(uint64_t))self->resumeHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)register
{
  v2 = *(void (**)(uint64_t))self->registerHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)deregister
{
  v2 = *(void (**)(uint64_t))self->deregisterHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)processKeyWith:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1ACE761B8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t), uint64_t))self->processHandler;
  swift_retain();
  if (v10) {
    v10(v6, v8, sub_1ACA83FF0, v9);
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)renewKey
{
  v2 = *(void (**)(uint64_t))self->renewHandler;
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)stopAndInvalidateKeysWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void (**)(void (*)(uint64_t), uint64_t))self->stopAndInvalidateHandler;
  if (v6)
  {
    swift_retain();
    v6(sub_1ACA3A598, v5);
    swift_release();
  }
  swift_release();
}

@end