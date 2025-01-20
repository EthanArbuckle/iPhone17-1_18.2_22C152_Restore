@interface MTBaseMAPIRequest
- (MTBaseMAPIRequest)init;
@end

@implementation MTBaseMAPIRequest

- (MTBaseMAPIRequest)init
{
  v3 = (objc_class *)type metadata accessor for MediaRequestController();
  id v4 = objc_allocWithZone(v3);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  v7 = (Class *)((char *)&v5->super.isa + OBJC_IVAR___MTBaseMAPIRequest_mediaRequestController);
  v7[3] = v3;
  v7[4] = &protocol witness table for MediaRequestController;
  void *v7 = v6;
  swift_beginAccess();
  uint64_t v8 = v7[3];
  uint64_t v9 = v7[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(1, v8, v9);
  swift_endAccess();

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for BaseMAPIRequest();
  return [(MTBaseMAPIRequest *)&v11 init];
}

- (void).cxx_destruct
{
}

@end