@interface PXStoryView.AssociatedData
- (_TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData)init;
@end

@implementation PXStoryView.AssociatedData

- (_TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_isActive) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_isVisible) = 1;
  v2 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_contentFrameOverride;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_itemPlacementContext) = 0;
  v4.receiver = self;
  v4.super_class = (Class)_s14AssociatedDataCMa_6();
  return [(PXStoryView.AssociatedData *)&v4 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE12PhotosUICoreCSo11PXStoryViewP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_itemPlacementContext));
}

@end