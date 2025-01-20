@interface ICSystemPaperDrawingsHelper
+ (id)drawingsForAttachment:(id)a3;
- (ICSystemPaperDrawingsHelper)init;
@end

@implementation ICSystemPaperDrawingsHelper

+ (id)drawingsForAttachment:(id)a3
{
  id v3 = a3;
  _s11NotesShared27ICSystemPaperDrawingsHelperC21drawingsForAttachmentySay9PencilKit9PKDrawingVGSo12ICAttachmentCFZ_0(v3);

  sub_1C3DB9A78();
  v4 = (void *)sub_1C3DB9FF8();
  swift_bridgeObjectRelease();
  return v4;
}

- (ICSystemPaperDrawingsHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ICSystemPaperDrawingsHelper();
  return [(ICSystemPaperDrawingsHelper *)&v3 init];
}

@end