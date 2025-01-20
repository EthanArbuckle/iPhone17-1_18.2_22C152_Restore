@interface PXTTRWorkflowFactory
+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentFileUrls:(id)a5;
+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentImageUrls:(id)a5;
+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentImageUrls:(id)a5 attachmentFileUrls:(id)a6;
- (PXTTRWorkflowFactory)init;
@end

@implementation PXTTRWorkflowFactory

+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentImageUrls:(id)a5 attachmentFileUrls:(id)a6
{
  id v7 = a5;
  if (a5)
  {
    sub_1AB2305AC();
    a1 = (id)sub_1AB23AADC();
    id v7 = a1;
  }
  if (a6)
  {
    sub_1AB2305AC();
    a1 = (id)sub_1AB23AADC();
    a6 = a1;
  }
  MEMORY[0x1F4188790](a1, a2);
  id v9 = a3;
  sub_1AA99AB20((uint64_t (*)(uint64_t))sub_1AA37B318, &v11);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  *(void *)(v10 + 24) = a6;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentImageUrls:(id)a5
{
  id v5 = a5;
  if (a5)
  {
    sub_1AB2305AC();
    a1 = (id)sub_1AB23AADC();
    id v5 = a1;
  }
  MEMORY[0x1F4188790](a1, a2);
  id v7 = a3;
  sub_1AA99AB20((uint64_t (*)(uint64_t))sub_1AA37B318, &v9);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = 0;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentFileUrls:(id)a5
{
  id v5 = a5;
  if (a5)
  {
    sub_1AB2305AC();
    a1 = (id)sub_1AB23AADC();
    id v5 = a1;
  }
  MEMORY[0x1F4188790](a1, a2);
  id v7 = a3;
  sub_1AA99AB20((uint64_t (*)(uint64_t))sub_1AA37B318, &v9);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = v5;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

- (PXTTRWorkflowFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRWorkflowFactory();
  return [(PXTTRWorkflowFactory *)&v3 init];
}

@end