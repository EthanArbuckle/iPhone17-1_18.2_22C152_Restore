@interface ICTTAudioDocument
+ (id)unarchiveFromData:(id)a3 replicaID:(id)a4;
+ (void)registerWithICCRCoder;
- (BOOL)hasToplineSummary;
- (BOOL)isCallRecording;
- (ICTTAudioDocument)init;
- (ICTTAudioDocument)initWithReplicaID:(id)a3 compatibleDocument:(id)a4;
- (NSArray)orderedFragmentUUIDs;
- (NSDate)callRecordingStartTime;
- (NSNumber)transcriptVersion;
- (NSString)localSpeakerHandle;
- (NSString)recordingSummaryAsPlainText;
- (NSString)remoteSpeakerHandle;
- (NSString)topLineSummaryAsPlainText;
- (NSString)transcriptAsPlainText;
- (id)archivedData;
- (id)document;
- (unint64_t)callType;
- (unint64_t)mergeWithMergeableData:(id)a3 replicaID:(id)a4;
- (void)setCallRecordingStartTime:(id)a3;
- (void)setCallType:(unint64_t)a3;
- (void)setDocument:(id)a3;
- (void)setIsCallRecording:(BOOL)a3;
- (void)setLocalSpeakerHandle:(id)a3;
- (void)setRemoteSpeakerHandle:(id)a3;
- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3;
@end

@implementation ICTTAudioDocument

- (ICTTAudioDocument)initWithReplicaID:(id)a3 compatibleDocument:(id)a4
{
  uint64_t v5 = sub_1C3DB8B98();
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8B58();
  id v8 = a4;
  return (ICTTAudioDocument *)ICTTAudioDocument.init(replicaID:compatibleDocument:)((uint64_t)v7, (uint64_t)a4);
}

- (id)document
{
  return *(id *)((char *)&self->super.isa + OBJC_IVAR___ICTTAudioDocument_document);
}

- (void)setDocument:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTTAudioDocument_document);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTTAudioDocument_document) = (Class)a3;
  id v3 = a3;
}

- (id)archivedData
{
  v2 = self;
  id v3 = [(ICTTAudioDocument *)v2 document];
  id v4 = objc_msgSend(v3, sel_archivedData);

  uint64_t v5 = sub_1C3DB8958();
  unint64_t v7 = v6;

  id v8 = (void *)sub_1C3DB8938();
  sub_1C3C58FC8(v5, v7);
  return v8;
}

+ (id)unarchiveFromData:(id)a3 replicaID:(id)a4
{
  uint64_t v6 = sub_1C3DB8B98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = sub_1C3DB8958();
  unint64_t v14 = v13;

  sub_1C3DB8B58();
  swift_getObjCClassMetadata();
  id v15 = sub_1C3C52B64();
  sub_1C3C58FC8(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (unint64_t)mergeWithMergeableData:(id)a3 replicaID:(id)a4
{
  uint64_t v7 = sub_1C3DB8B98();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  unint64_t v13 = self;
  uint64_t v14 = sub_1C3DB8958();
  unint64_t v16 = v15;

  sub_1C3DB8B58();
  id v17 = ICTTAudioDocument.merge(withMergeableData:replicaID:)();
  sub_1C3C58FC8(v14, v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (unint64_t)v17;
}

- (NSArray)orderedFragmentUUIDs
{
  v2 = self;
  unint64_t v3 = ICTTAudioDocument.orderedFragments.getter();
  sub_1C3C5220C(v3);

  swift_bridgeObjectRelease();
  sub_1C3DB8B98();
  id v4 = (void *)sub_1C3DB9FF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3
{
  uint64_t v4 = sub_1C3DB9A98();
  uint64_t v5 = self;
  sub_1C3C53198(v4);

  swift_bridgeObjectRelease();
}

- (NSString)transcriptAsPlainText
{
  return (NSString *)sub_1C3C55E00(self, (uint64_t)a2, (void (*)(void))ICTTAudioDocument.transcriptAsPlainText.getter);
}

- (NSNumber)transcriptVersion
{
  v2 = self;
  unint64_t v3 = ICTTAudioDocument.orderedFragments.getter();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
    result = (NSNumber *)sub_1C3DBAFB8();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  result = *(NSNumber **)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x1C877C220](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v6 = *(id *)(v4 + 32);
  }
  uint64_t v7 = v6;
LABEL_9:
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v7, sel_transcriptVersion);

  return (NSNumber *)v8;
}

- (ICTTAudioDocument)init
{
  result = (ICTTAudioDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)hasToplineSummary
{
  v2 = self;
  unsigned __int8 v3 = ICTTAudioDocument.hasToplineSummary.getter();

  return v3 & 1;
}

- (BOOL)isCallRecording
{
  v2 = self;
  unsigned __int8 v3 = ICTTAudioDocument.isCallRecording.getter();

  return v3 & 1;
}

- (void)setIsCallRecording:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = self;
  id v4 = [(ICTTAudioDocument *)v10 document];
  id v5 = objc_msgSend(v4, sel_rootObject);

  if (!v5)
  {
    id v8 = v10;
    goto LABEL_5;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v9 = (ICTTAudioDocument *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, v3);
    objc_msgSend(v7, sel_setCallRecording_, v9);

    swift_unknownObjectRelease();
    id v8 = v9;
LABEL_5:

    return;
  }

  swift_unknownObjectRelease();
}

- (unint64_t)callType
{
  v2 = self;
  id v3 = ICTTAudioDocument.callType.getter();

  return (unint64_t)v3;
}

- (void)setCallType:(unint64_t)a3
{
  id v10 = self;
  id v4 = [(ICTTAudioDocument *)v10 document];
  id v5 = objc_msgSend(v4, sel_rootObject);

  if (!v5)
  {
    id v8 = v10;
    goto LABEL_5;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v9 = (ICTTAudioDocument *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithUnsignedInteger_, a3);
    objc_msgSend(v7, sel_setCallType_, v9);

    swift_unknownObjectRelease();
    id v8 = v9;
LABEL_5:

    return;
  }

  swift_unknownObjectRelease();
}

- (NSString)localSpeakerHandle
{
  return (NSString *)sub_1C3C55AA0(self, (uint64_t)a2, (SEL *)&selRef_callLocalSpeakerHandle);
}

- (void)setLocalSpeakerHandle:(id)a3
{
}

- (NSString)remoteSpeakerHandle
{
  return (NSString *)sub_1C3C55AA0(self, (uint64_t)a2, (SEL *)&selRef_callRemoteSpeakerHandle);
}

- (void)setRemoteSpeakerHandle:(id)a3
{
}

- (NSDate)callRecordingStartTime
{
  return (NSDate *)sub_1C3C55AA0(self, (uint64_t)a2, (SEL *)&selRef_callRecordingStartTime);
}

- (void)setCallRecordingStartTime:(id)a3
{
}

- (NSString)topLineSummaryAsPlainText
{
  return (NSString *)sub_1C3C55E00(self, (uint64_t)a2, ICTTAudioDocument.topLineSummaryAsPlainText.getter);
}

- (NSString)recordingSummaryAsPlainText
{
  return (NSString *)sub_1C3C55E00(self, (uint64_t)a2, ICTTAudioDocument.recordingSummaryAsPlainText.getter);
}

+ (void)registerWithICCRCoder
{
  v0 = self;
  type metadata accessor for ICTTAudioRecording((uint64_t)v0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)sub_1C3DB9BF8();
  objc_msgSend(v0, sel_registerClass_forType_, ObjCClassFromMetadata, v2);

  type metadata accessor for ICTTAudioRecording.Fragment();
  uint64_t v3 = swift_getObjCClassFromMetadata();
  id v4 = (void *)sub_1C3DB9BF8();
  objc_msgSend(v0, sel_registerClass_forType_, v3, v4);

  type metadata accessor for ICTTTranscriptSegment();
  uint64_t v5 = swift_getObjCClassFromMetadata();
  id v6 = (id)sub_1C3DB9BF8();
  objc_msgSend(v0, sel_registerClass_forType_, v5, v6);
}

@end