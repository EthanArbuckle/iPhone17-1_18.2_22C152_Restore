@interface MTSecureDownloadRenewalManager
+ (id)inContextKeyDataFor:(int64_t)a3 ctx:(id)a4;
- (MTSecureDownloadRenewalManager)init;
- (MTSecureDownloadRenewalManager)initWithDelegate:(id)a3;
- (void)requestSecureDeletionOf:(int64_t)a3 completionHandler:(id)a4;
- (void)requestSecureDeletionOfOrphanedKeysWithCompletionHandler:(id)a3;
- (void)requestSecureDeletionOfStoreTrackIds:(id)a3 completionHandler:(id)a4;
- (void)updateDRMKeysForDownloads;
- (void)updateDRMKeysForDownloadsWithUrlProtocolDelegate:(id)a3 completionHandler:(id)a4;
@end

@implementation MTSecureDownloadRenewalManager

- (MTSecureDownloadRenewalManager)init
{
  return [(MTSecureDownloadRenewalManager *)self initWithDelegate:0];
}

- (MTSecureDownloadRenewalManager)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (MTSecureDownloadRenewalManager *)sub_1ACC41944((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)requestSecureDeletionOfOrphanedKeysWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1ACC44E68;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1ACC358E4((void (*)(void))v7, v6);
  sub_1ACA76F34((uint64_t)v7);
}

- (void)requestSecureDeletionOf:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1ACC44E68;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1ACC360E4(a3, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)requestSecureDeletionOfStoreTrackIds:(id)a3 completionHandler:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = sub_1ACE76578();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_1ACC44E68;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1ACC36814(v6, (uint64_t)v5, v7);
  sub_1ACA76F34((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)updateDRMKeysForDownloads
{
  v2 = self;
  sub_1ACC42210(0, 0);
}

- (void)updateDRMKeysForDownloadsWithUrlProtocolDelegate:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_1ACC44E60;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1ACC42210((uint64_t)v5, v6);
  sub_1ACA76F34((uint64_t)v5);
  swift_unknownObjectRelease();
}

+ (id)inContextKeyDataFor:(int64_t)a3 ctx:(id)a4
{
  id v5 = a4;
  _s18PodcastsFoundation28SecureDownloadRenewalManagerC16inContextKeyData3for3ctxSo09MTOfflineiJ0CSgs5Int64V_So015NSManagedObjectH0CtFZ_0(a3, v5);
  uint64_t v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MTSecureDownloadRenewalManager_bugReporter);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTSecureDownloadRenewalManager____lazy_storage___secureKeyLoader);
}

@end