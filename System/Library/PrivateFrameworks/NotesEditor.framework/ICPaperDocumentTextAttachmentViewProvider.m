@interface ICPaperDocumentTextAttachmentViewProvider
+ (void)registerIfNecessary;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6;
- (ICPaperDocumentTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (NSTextLocation)location;
- (NSTextLocation)updatedLocationForRecycledViewProvider;
- (void)loadView;
- (void)setLocation:(id)a3;
- (void)setUpdatedLocationForRecycledViewProvider:(id)a3;
@end

@implementation ICPaperDocumentTextAttachmentViewProvider

+ (void)registerIfNecessary
{
  swift_getObjCClassMetadata();
  v2 = self;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v4 = *MEMORY[0x263F5AE38];

  objc_msgSend(v2, sel_registerTextAttachmentViewProviderClass_forFileType_, ObjCClassFromMetadata, v4);
}

- (ICPaperDocumentTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  swift_unknownObjectRetain();
  return (ICPaperDocumentTextAttachmentViewProvider *)sub_20C00DA04(v9, a4, a5, (uint64_t)a6);
}

- (NSTextLocation)location
{
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___ICPaperDocumentTextAttachmentViewProvider_updatedLocationForRecycledViewProvider);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (v4)
  {
    v5 = self;
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentViewProvider();
    v7 = self;
    v6 = [(NSTextAttachmentViewProvider *)&v9 location];
  }
  swift_unknownObjectRetain();

  return v6;
}

- (void)setLocation:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___ICPaperDocumentTextAttachmentViewProvider_updatedLocationForRecycledViewProvider);
  swift_beginAccess();
  *uint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSTextLocation)updatedLocationForRecycledViewProvider
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (NSTextLocation *)v2;
}

- (void)setUpdatedLocationForRecycledViewProvider:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___ICPaperDocumentTextAttachmentViewProvider_updatedLocationForRecycledViewProvider);
  swift_beginAccess();
  *uint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)loadView
{
  v2 = self;
  sub_20C00DEE4();
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v13 = self;
  sub_20C00F3B8(a3, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  swift_unknownObjectRetain();
  id v13 = a5;
  double v14 = self;
  sub_20C00F3B8(a5, x, y, width, height);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  swift_unknownObjectRelease();

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void).cxx_destruct
{
}

@end