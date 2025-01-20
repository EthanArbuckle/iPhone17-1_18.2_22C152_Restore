@interface QOSErrorMessageInternal
+ (id)getObjcInstanceWithConfig:(id)a3 error:(id *)a4 logger:(id)a5 metricsRecorder:(id)a6 defaultAlert:(id)a7;
- (QOSErrorMessageInternal)init;
@end

@implementation QOSErrorMessageInternal

- (QOSErrorMessageInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(QOSErrorMessageInternal *)&v3 init];
}

+ (id)getObjcInstanceWithConfig:(id)a3 error:(id *)a4 logger:(id)a5 metricsRecorder:(id)a6 defaultAlert:(id)a7
{
  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  v16 = (char *)a3;
  v17 = (void *)sub_25AC7B620(v16, (uint64_t)sub_25AC7BC24, v13, (uint64_t)sub_25AC7BC8C, v14, (uint64_t)sub_25AC7BCF8, v15);
  swift_release();
  swift_release();
  swift_release();

  return v17;
}

@end