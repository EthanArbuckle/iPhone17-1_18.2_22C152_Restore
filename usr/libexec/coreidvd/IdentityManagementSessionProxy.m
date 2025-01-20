@interface IdentityManagementSessionProxy
- (void)clearDataAfterTerminalProofingStateWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)deleteBoundACLWithCompletionHandler:(id)a3;
- (void)fetchBioBindingDetailsWithCompletionHandler:(id)a3;
- (void)fetchBiomeFedStatsUIWithCompletion:(id)a3;
- (void)fetchExtendedReviewDisplayInfo:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)fetchImageQualitySettingsWithCompletion:(id)a3;
- (void)fetchTermsAndConditionsWithCompletion:(id)a3;
- (void)getLivenessConfigWithCompletionHandler:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3;
- (void)isWatchPairedWithIdType:(int64_t)a3 completionHandler:(id)a4;
- (void)prepareForProofingDisplay:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 idType:(int64_t)a5 completionHandler:(id)a6;
- (void)prepareForProofingIdentity:(_TtC13CoreIDVShared25IdentityProofingDocuments *)a3 completionHandler:(id)a4;
- (void)proofIdentity:(id)a3 :(unint64_t)a4 :(BOOL)a5 totalUploadAssetsFileSizeInBytes:(int64_t)a6 completion:(id)a7;
- (void)proofIdentityUsing:(id)a3 proofingOptions:(unint64_t)a4 completion:(id)a5;
- (void)proofingCancelledWithConfiguration:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3;
- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5;
- (void)provisionIdentityWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)retrieveBioBindingUnboundACLWithCompletionHandler:(id)a3;
- (void)retrieveBoundACLWithCompletionHandler:(id)a3;
- (void)retrievePasscodeBindingUnboundACLWithCompletionHandler:(id)a3;
- (void)saveIdentityProofingBiomeDataSharingUserConsent:(BOOL)a3 state:(NSString *)a4 proofingOptions:(unint64_t)a5 completionHandler:(id)a6;
- (void)setGlobalBoundACLWithData:(NSData *)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)setModifiedGlobalBoundACLWithData:(NSData *)a3 externalizedLAContext:(NSData *)a4 completionHandler:(id)a5;
- (void)triggerAssetsUploadWithProofingOptions:(unint64_t)a3 canUploadOnExpensiveNetwork:(BOOL)a4 completion:(id)a5;
- (void)uploadLivenessVideoWithLivenessVideoURL:(_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)a3 shouldScheduleUploads:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation IdentityManagementSessionProxy

- (void)triggerAssetsUploadWithProofingOptions:(unint64_t)a3 canUploadOnExpensiveNetwork:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  swift_retain();
  sub_1005A6338(a3, a4, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)prepareForProofingDisplay:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 idType:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100733940;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100733948;
  v18[5] = v17;
  v19 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v13, (uint64_t)&unk_100733950, (uint64_t)v18);
  swift_release();
}

- (void)prepareForProofingIdentity:(_TtC13CoreIDVShared25IdentityProofingDocuments *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100733920;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100733928;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_100733930, (uint64_t)v14);
  swift_release();
}

- (void)fetchImageQualitySettingsWithCompletion:(id)a3
{
}

- (void)fetchExtendedReviewDisplayInfo:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1007338F8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100733900;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_100733908, (uint64_t)v16);
  swift_release();
}

- (void)provisionIdentityWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1007338D8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1007338E0;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_1007338E8, (uint64_t)v16);
  swift_release();
}

- (void)proofIdentity:(id)a3 :(unint64_t)a4 :(BOOL)a5 totalUploadAssetsFileSizeInBytes:(int64_t)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  swift_retain();
  sub_100597834(v13, a4, v8, a6, (uint64_t)sub_10026270C, v12);
  swift_release();
  swift_release();
}

- (void)fetchTermsAndConditionsWithCompletion:(id)a3
{
}

- (void)proofIdentityUsing:(id)a3 proofingOptions:(unint64_t)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  swift_retain();
  sub_1005A7BE8(v8, v10, a4, (uint64_t)self, v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)proofingCancelledWithConfiguration:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1007338B0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1007338B8;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_1007338C0, (uint64_t)v16);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100733890;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100733898;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_1007338A0, (uint64_t)v16);
  swift_release();
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100733870;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100733878;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100733880, (uint64_t)v12);
  swift_release();
}

- (void)isWatchPairedWithIdType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100733850;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100733858;
  v14[5] = v13;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_100733860, (uint64_t)v14);
  swift_release();
}

- (void)setGlobalBoundACLWithData:(NSData *)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100733830;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100733838;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_100733840, (uint64_t)v16);
  swift_release();
}

- (void)setModifiedGlobalBoundACLWithData:(NSData *)a3 externalizedLAContext:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100733810;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100733818;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_100733820, (uint64_t)v16);
  swift_release();
}

- (void)retrieveBioBindingUnboundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1007337F0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1007337F8;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100733800, (uint64_t)v12);
  swift_release();
}

- (void)retrievePasscodeBindingUnboundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1007337D0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1007337D8;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_1007337E0, (uint64_t)v12);
  swift_release();
}

- (void)retrieveBoundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1007337B0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1007337B8;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_1007337C0, (uint64_t)v12);
  swift_release();
}

- (void)deleteBoundACLWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100733790;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100733798;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_1007337A0, (uint64_t)v12);
  swift_release();
}

- (void)fetchBioBindingDetailsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100733770;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100733778;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100733780, (uint64_t)v12);
  swift_release();
}

- (void)getLivenessConfigWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100733750;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100733758;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100733760, (uint64_t)v12);
  swift_release();
}

- (void)uploadLivenessVideoWithLivenessVideoURL:(_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)a3 shouldScheduleUploads:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100733730;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100733738;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_100733740, (uint64_t)v16);
  swift_release();
}

- (void)saveIdentityProofingBiomeDataSharingUserConsent:(BOOL)a3 state:(NSString *)a4 proofingOptions:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100733708;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100733710;
  v18[5] = v17;
  uint64_t v19 = a4;
  swift_retain();
  sub_1005A3B00((uint64_t)v13, (uint64_t)&unk_100733718, (uint64_t)v18);
  swift_release();
}

- (void)fetchBiomeFedStatsUIWithCompletion:(id)a3
{
}

- (void)clearDataAfterTerminalProofingStateWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1007336E8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1007336F0;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_1007336F8, (uint64_t)v16);
  swift_release();
}

- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1007336A8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100724BD0;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100721260, (uint64_t)v12);
  swift_release();
}

@end