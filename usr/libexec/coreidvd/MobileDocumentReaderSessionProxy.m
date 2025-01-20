@interface MobileDocumentReaderSessionProxy
- (_TtC8coreidvd32MobileDocumentReaderSessionProxy)init;
- (void)cachedIssuerRootsWithCompletionHandler:(id)a3;
- (void)canRequestDocument:(_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)a3 completionHandler:(id)a4;
- (void)cancelReadWithCompletionHandler:(id)a3;
- (void)certificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 completionHandler:(id)a4;
- (void)clearCachedIssuerRootsWithCompletionHandler:(id)a3;
- (void)deleteCertificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 completionHandler:(id)a4;
- (void)deleteIdentityKey:(_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)a3 completionHandler:(id)a4;
- (void)identityKey:(_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)a3 completionHandler:(id)a4;
- (void)loadIssuerRootsWithCompletionHandler:(id)a3;
- (void)merchantFor:(NSString *)a3 completionHandler:(id)a4;
- (void)prepareWith:(_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *)a3 completionHandler:(id)a4;
- (void)readDocumentWith:(_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)a3 engagementType:(_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)a4 completionHandler:(id)a5;
- (void)readerInstanceIdentifierWithCompletionHandler:(id)a3;
- (void)registerAuditToken:(_TtC7CoreIDV13XPCAuditToken *)a3 completionHandler:(id)a4;
- (void)storeCertificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 certificateDER:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation MobileDocumentReaderSessionProxy

- (void)registerAuditToken:(_TtC7CoreIDV13XPCAuditToken *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FD20;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FD28;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FD30, (uint64_t)v14);
  swift_release();
}

- (void)readerInstanceIdentifierWithCompletionHandler:(id)a3
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
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10072FD00;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10072FD08;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_10072FD10, (uint64_t)v12);
  swift_release();
}

- (void)prepareWith:(_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FCE0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FCE8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FCF0, (uint64_t)v14);
  swift_release();
}

- (void)merchantFor:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FCC0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FCC8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FCD0, (uint64_t)v14);
  swift_release();
}

- (void)canRequestDocument:(_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FCA0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FCA8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FCB0, (uint64_t)v14);
  swift_release();
}

- (void)readDocumentWith:(_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)a3 engagementType:(_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10072FC80;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10072FC88;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_10072FC90, (uint64_t)v16);
  swift_release();
}

- (void)cancelReadWithCompletionHandler:(id)a3
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
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10072FC60;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10072FC68;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_10072FC70, (uint64_t)v12);
  swift_release();
}

- (void)identityKey:(_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FC40;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FC48;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FC50, (uint64_t)v14);
  swift_release();
}

- (void)deleteIdentityKey:(_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FC20;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FC28;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FC30, (uint64_t)v14);
  swift_release();
}

- (void)certificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FC00;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FC08;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FC10, (uint64_t)v14);
  swift_release();
}

- (void)storeCertificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 certificateDER:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10072FBE0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10072FBE8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1005A3B00((uint64_t)v11, (uint64_t)&unk_10072FBF0, (uint64_t)v16);
  swift_release();
}

- (void)deleteCertificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10072FBC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10072FBC8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1005A3B00((uint64_t)v9, (uint64_t)&unk_10072FBD0, (uint64_t)v14);
  swift_release();
}

- (void)cachedIssuerRootsWithCompletionHandler:(id)a3
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
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10072FBA0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10072FBA8;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_10072FBB0, (uint64_t)v12);
  swift_release();
}

- (void)clearCachedIssuerRootsWithCompletionHandler:(id)a3
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
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10072FB80;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10072FB88;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_10072FB90, (uint64_t)v12);
  swift_release();
}

- (void)loadIssuerRootsWithCompletionHandler:(id)a3
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
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10072FB70;
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

- (_TtC8coreidvd32MobileDocumentReaderSessionProxy)init
{
  swift_defaultActor_initialize();
  result = (_TtC8coreidvd32MobileDocumentReaderSessionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end