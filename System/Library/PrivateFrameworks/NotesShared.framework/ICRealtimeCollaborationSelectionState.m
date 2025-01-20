@interface ICRealtimeCollaborationSelectionState
+ (void)registerWithICCRCoder;
- (ICRealtimeCollaborationSelectionState)init;
@end

@implementation ICRealtimeCollaborationSelectionState

- (ICRealtimeCollaborationSelectionState)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICRealtimeCollaborationSelectionState *)&v3 init];
}

+ (void)registerWithICCRCoder
{
  v2 = self;
  type metadata accessor for RealtimeCollaborationSelectionDocument.State();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = (id)sub_1C3DB9BF8();
  objc_msgSend(v2, sel_registerClass_forType_, ObjCClassFromMetadata, v4);
}

@end