@interface DiagnosticExtensionFileFinder
- (_TtC28SiriPrivateLearningAnalytics29DiagnosticExtensionFileFinder)init;
- (id)getFileList;
@end

@implementation DiagnosticExtensionFileFinder

- (id)getFileList
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD635B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D3004380;
  uint64_t v4 = qword_1EBD5FB80;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)algn_1EBD5FB78;
  *(void *)(inited + 32) = qword_1EBD5FB70;
  *(void *)(inited + 40) = v6;
  uint64_t v7 = qword_1EBD5FBB0;
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void *)algn_1EBD5FBA8;
  *(void *)(inited + 48) = qword_1EBD5FBA0;
  *(void *)(inited + 56) = v8;
  swift_bridgeObjectRetain();
  v9 = sub_1D2FFCA24(inited);
  swift_setDeallocating();
  swift_arrayDestroy();

  return v9;
}

- (_TtC28SiriPrivateLearningAnalytics29DiagnosticExtensionFileFinder)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticExtensionFileFinder();
  return [(DiagnosticExtensionFileFinder *)&v3 init];
}

@end