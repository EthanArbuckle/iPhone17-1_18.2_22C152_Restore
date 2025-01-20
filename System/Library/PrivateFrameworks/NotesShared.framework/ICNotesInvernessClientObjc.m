@interface ICNotesInvernessClientObjc
- (CKContainer)container;
- (ICNotesInvernessClientObjc)init;
- (ICNotesInvernessClientObjc)initWithContainer:(id)a3 environment:(int64_t)a4 localURLString:(id)a5;
- (NSString)localURLString;
- (int64_t)environment;
- (void)didCompleteInstallOrUpdateWithPreviousBuildNumber:(id)a3 previousVersion:(id)a4 currentBuildNumber:(id)a5 currentVersion:(id)a6 platformName:(id)a7 continuationToken:(id)a8 callback:(id)a9;
- (void)runGarbageCollectorWithProgress:(id)a3 callback:(id)a4;
- (void)sendMentionNotificationWithRecipientUserId:(id)a3 senderName:(id)a4 noteTitle:(id)a5 mentionSnippet:(id)a6 shareRecordName:(id)a7 shareOwnerUserId:(id)a8 noteRecordName:(id)a9 inlineAttachmentRecordName:(id)a10 callback:(id)a11;
@end

@implementation ICNotesInvernessClientObjc

- (CKContainer)container
{
  return (CKContainer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___ICNotesInvernessClientObjc_container));
}

- (int64_t)environment
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNotesInvernessClientObjc_environment);
}

- (NSString)localURLString
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C3DB9BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ICNotesInvernessClientObjc)initWithContainer:(id)a3 environment:(int64_t)a4 localURLString:(id)a5
{
  uint64_t v8 = sub_1C3DB9C38();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNotesInvernessClientObjc_container) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNotesInvernessClientObjc_environment) = (Class)a4;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___ICNotesInvernessClientObjc_localURLString);
  uint64_t *v9 = v8;
  v9[1] = v10;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for NotesInvernessClient();
  id v11 = a3;
  return [(ICNotesInvernessClientObjc *)&v13 init];
}

- (void)sendMentionNotificationWithRecipientUserId:(id)a3 senderName:(id)a4 noteTitle:(id)a5 mentionSnippet:(id)a6 shareRecordName:(id)a7 shareOwnerUserId:(id)a8 noteRecordName:(id)a9 inlineAttachmentRecordName:(id)a10 callback:(id)a11
{
  v47 = self;
  uint64_t v46 = type metadata accessor for MentionNotificationRequestV2(0);
  MEMORY[0x1F4188790](v46);
  v44 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = _Block_copy(a11);
  uint64_t v39 = sub_1C3DB9C38();
  uint64_t v13 = v12;
  uint64_t v42 = v12;
  uint64_t v38 = sub_1C3DB9C38();
  uint64_t v15 = v14;
  uint64_t v43 = v14;
  uint64_t v37 = sub_1C3DB9C38();
  uint64_t v17 = v16;
  uint64_t v36 = sub_1C3DB9C38();
  uint64_t v19 = v18;
  uint64_t v35 = sub_1C3DB9C38();
  uint64_t v21 = v20;
  uint64_t v34 = sub_1C3DB9C38();
  uint64_t v23 = v22;
  uint64_t v24 = sub_1C3DB9C38();
  uint64_t v26 = v25;
  uint64_t v45 = v25;
  uint64_t v27 = sub_1C3DB9C38();
  uint64_t v29 = v28;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v40;
  uint64_t v48 = v39;
  uint64_t v49 = v13;
  uint64_t v50 = v38;
  uint64_t v51 = v15;
  uint64_t v52 = v37;
  uint64_t v53 = v17;
  uint64_t v54 = v36;
  uint64_t v55 = v19;
  uint64_t v56 = v35;
  uint64_t v57 = v21;
  uint64_t v58 = v34;
  uint64_t v59 = v23;
  uint64_t v60 = v24;
  uint64_t v61 = v26;
  uint64_t v62 = v27;
  uint64_t v63 = v29;
  sub_1C3D31328(&qword_1EA3877C8, (void (*)(uint64_t))type metadata accessor for MentionNotificationRequestV2);
  v30 = v47;
  uint64_t v31 = (uint64_t)v44;
  sub_1C3DB8F58();
  sub_1C3D305D8();
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = v41;
  *(void *)(v32 + 16) = sub_1C3D32BA4;
  *(void *)(v32 + 24) = v33;
  swift_retain();
  sub_1C3CE0314(v31);
  swift_release();
  swift_release();
  sub_1C3D32B44(v31, type metadata accessor for MentionNotificationRequestV2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)didCompleteInstallOrUpdateWithPreviousBuildNumber:(id)a3 previousVersion:(id)a4 currentBuildNumber:(id)a5 currentVersion:(id)a6 platformName:(id)a7 continuationToken:(id)a8 callback:(id)a9
{
  uint64_t v36 = self;
  uint64_t updated = type metadata accessor for DidCompleteInstallOrUpdateRequest(0);
  MEMORY[0x1F4188790](updated);
  uint64_t v38 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = _Block_copy(a9);
  uint64_t v34 = sub_1C3DB9C38();
  uint64_t v12 = v11;
  uint64_t v33 = sub_1C3DB9C38();
  uint64_t v14 = v13;
  uint64_t v37 = v13;
  uint64_t v32 = sub_1C3DB9C38();
  uint64_t v16 = v15;
  uint64_t v17 = sub_1C3DB9C38();
  uint64_t v19 = v18;
  uint64_t v39 = v18;
  uint64_t v20 = sub_1C3DB9C38();
  uint64_t v22 = v21;
  id v23 = a8;
  uint64_t v36 = v36;
  uint64_t v24 = sub_1C3DB8958();
  unint64_t v26 = v25;

  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v35;
  uint64_t v41 = v34;
  uint64_t v42 = v12;
  uint64_t v43 = v33;
  uint64_t v44 = v14;
  uint64_t v45 = v17;
  uint64_t v46 = v19;
  uint64_t v47 = v32;
  uint64_t v48 = v16;
  uint64_t v49 = v20;
  uint64_t v50 = v22;
  uint64_t v51 = v24;
  unint64_t v52 = v26;
  sub_1C3D31328(&qword_1EB6FB728, (void (*)(uint64_t))type metadata accessor for DidCompleteInstallOrUpdateRequest);
  uint64_t v28 = (uint64_t)v38;
  sub_1C3DB8F58();
  uint64_t v29 = v36;
  sub_1C3D305D8();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_1C3D329B8;
  *(void *)(v30 + 24) = v27;
  swift_retain();
  sub_1C3CE04D0(v28);
  swift_release();
  swift_release();
  sub_1C3D32B44(v28, type metadata accessor for DidCompleteInstallOrUpdateRequest);
  swift_release();
  sub_1C3C58FC8(v24, v26);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)runGarbageCollectorWithProgress:(id)a3 callback:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1C3D32620(a3, 0, 0xF000000000000000, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (ICNotesInvernessClientObjc)init
{
  result = (ICNotesInvernessClientObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end