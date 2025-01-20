@interface PXGenerativeStoryTTRWorkflowBuilder
+ (void)presentViewController:(id)a3 memory:(id)a4 attachmentFileUrls:(id)a5;
- (PXGenerativeStoryTTRWorkflowBuilder)init;
@end

@implementation PXGenerativeStoryTTRWorkflowBuilder

+ (void)presentViewController:(id)a3 memory:(id)a4 attachmentFileUrls:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (a5)
  {
    sub_1AB2305AC();
    uint64_t v5 = sub_1AB23AADC();
  }
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  sub_1AA867CB0(5, 1, &v11);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v5;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

- (PXGenerativeStoryTTRWorkflowBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeStoryTTRWorkflowBuilder();
  return [(PXGenerativeStoryTTRWorkflowBuilder *)&v3 init];
}

@end