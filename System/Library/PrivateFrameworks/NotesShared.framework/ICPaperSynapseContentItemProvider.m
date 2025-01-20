@interface ICPaperSynapseContentItemProvider
+ (id)contentItemsForAttachment:(id)a3;
- (ICPaperSynapseContentItemProvider)init;
@end

@implementation ICPaperSynapseContentItemProvider

+ (id)contentItemsForAttachment:(id)a3
{
  id v3 = a3;
  _s11NotesShared33ICPaperSynapseContentItemProviderC12contentItems13forAttachmentSaySo09SYContentF0CGSo12ICAttachmentC_tFZ_0(v3);

  sub_1C3D69C18();
  v4 = (void *)sub_1C3DB9FF8();
  swift_bridgeObjectRelease();
  return v4;
}

- (ICPaperSynapseContentItemProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ICPaperSynapseContentItemProvider();
  return [(ICPaperSynapseContentItemProvider *)&v3 init];
}

@end