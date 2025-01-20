@interface ICSharedWithYouControllerInternal
+ (ICSharedWithYouControllerInternal)sharedController;
- (ICSharedWithYouControllerInternal)init;
- (NSManagedObjectContext)managedObjectContext;
- (id)highlightForURL:(id)a3;
- (void)dealloc;
- (void)fetchShareMetadataWithURLs:(id)a3 completion:(id)a4;
- (void)highlightCenterHighlightsDidChange:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)userAcceptedInvitationWithShareMetadata:(id)a3 associatedObjectID:(id)a4;
@end

@implementation ICSharedWithYouControllerInternal

+ (ICSharedWithYouControllerInternal)sharedController
{
  if (qword_26AD81060 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD80FA0;

  return (ICSharedWithYouControllerInternal *)v2;
}

- (NSManagedObjectContext)managedObjectContext
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_managedObjectContext);
  swift_beginAccess();
  return (NSManagedObjectContext *)*v2;
}

- (void)setManagedObjectContext:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_managedObjectContext);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_20BFDE7D8();
  sub_20BFDEB68();
  _s11NotesEditor23SharedWithYouControllerC34highlightCenterHighlightsDidChangeyySo011SWHighlightH0CF_0();
}

- (id)highlightForURL:(id)a3
{
  uint64_t v4 = sub_20C15F5D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20C15F580();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_highlightCenter);
  v9 = self;
  id v10 = objc_msgSend(v8, sel_highlights);
  sub_20BFCEE58(0, &qword_26AD81208);
  unint64_t v11 = sub_20C162CF0();

  v15 = v7;
  v12 = sub_20BFDF83C(sub_20BFEB488, (uint64_t)v14, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (void)fetchShareMetadataWithURLs:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_20C15F5D0();
  uint64_t v6 = sub_20C162CF0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  SharedWithYouController.fetchShareMetadata(_:_:)(v6, (uint64_t)sub_20BFE6610, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)userAcceptedInvitationWithShareMetadata:(id)a3 associatedObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  SharedWithYouController.userAcceptedInvitation(_:_:)((CKShareMetadata)v6, (NSManagedObjectID)v7);
}

- (ICSharedWithYouControllerInternal)init
{
  return (ICSharedWithYouControllerInternal *)SharedWithYouController.init()();
}

- (void)dealloc
{
  v2 = self;
  SharedWithYouController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___ICSharedWithYouControllerInternal_logger;
  uint64_t v4 = sub_20C160280();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSharedWithYouControllerInternal_fetchShareMetadataQueue);
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s11NotesEditor23SharedWithYouControllerC34highlightCenterHighlightsDidChangeyySo011SWHighlightH0CF_0();
}

@end