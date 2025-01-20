@interface ICContentFairPlayKeySession
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
- (void)setBypassCache:(BOOL)a3;
- (void)setKeyResponseData:(id)a3;
- (void)stopAndInvalidateKeysWithCompletion:(id)a3;
@end

@implementation ICContentFairPlayKeySession

- (NSString)id
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PFFairPlayAsset)asset
{
  return (PFFairPlayAsset *)*(id *)self->asset;
}

- (BOOL)bypassCache
{
  return self->bypassCache[0];
}

- (void)setBypassCache:(BOOL)a3
{
  swift_beginAccess();
  self->bypassCache[0] = a3;
  swift_retain();
  id v5 = sub_1ACE4CD14();
  objc_msgSend(v5, sel_setBypassCache_, self->bypassCache[0]);
  swift_release();
}

- (NSString)keyStoreFilePath
{
  v2 = *(void **)&self->keyStore[7];
  if (v2)
  {
    self;
    uint64_t v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      v4 = (void *)v3;
      swift_retain();
      swift_unknownObjectRetain();
      id v5 = objc_msgSend(v4, sel_filePath);
      sub_1ACE761B8();
      swift_release();
      swift_unknownObjectRelease();

      v2 = (void *)sub_1ACE76178();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (PFFairPlayKeyResponseData)keyResponseData
{
  return (PFFairPlayKeyResponseData *)*(id *)&self->keyResponseData[7];
}

- (void)setKeyResponseData:(id)a3
{
  swift_beginAccess();
  id v5 = *(void **)&self->keyResponseData[7];
  *(void *)&self->keyResponseData[7] = a3;
  id v6 = a3;
}

- (void)pauseAutomaticKeyRenewal
{
}

- (void)resumeAutomaticKeyRenewal
{
}

- (void)register
{
}

- (void)deregister
{
}

- (void)processKeyWith:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_1ACE761B8();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  *v7 = sub_1ACA83FF0;
  v7[1] = (void (*)(uint64_t))v6;
  swift_retain();
  sub_1ACA76F34(v8);
  swift_retain();
  id v9 = sub_1ACE4CD14();
  id v10 = (id)sub_1ACE76178();
  objc_msgSend(v9, sel_processKeyWithIdentifier_, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)renewKey
{
  swift_retain();
  ICContentFairPlayKeySession.renewKey()();
  swift_release();
}

- (void)stopAndInvalidateKeysWithCompletion:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  id v5 = sub_1ACE4CD14();
  v7[4] = sub_1ACA3A598;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1ACCB9FCC;
  v7[3] = &block_descriptor_14_1;
  uint64_t v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_stopSessionInvalidatingKeys_withCompletion_, 1, v6);
  _Block_release(v6);
  swift_release();
  swift_release();
}

@end