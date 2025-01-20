@interface XpcSubscriptionClientProtocolServer
- (void)request:(id)a3 withReply:(id)a4;
@end

@implementation XpcSubscriptionClientProtocolServer

- (void)request:(id)a3 withReply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = qword_26837A228;
  id v8 = a3;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_22A59A3C8();
  __swift_project_value_buffer(v9, (uint64_t)qword_26837ADF0);
  sub_22A59A378();
  uint64_t v10 = (uint64_t)v8 + *MEMORY[0x263F88A98];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_22A5964AC;
  *(void *)(v11 + 24) = v6;
  swift_retain();
  XpcSubscriptionClientProtocolServer.request(_:withReply:)(v10, (uint64_t)sub_22A5973D0, v11);

  swift_release();
  swift_release();
  swift_release();
}

@end