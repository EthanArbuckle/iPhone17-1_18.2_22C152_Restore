@interface PXStoryViewModel.AssociatedData
- (_TtCE12PhotosUICoreCSo16PXStoryViewModelP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData)init;
- (_TtCE12PhotosUICoreCSo16PXStoryViewModelP33_F04B6F2764CD012E39AF3DBCA957C80F14AssociatedData)init;
@end

@implementation PXStoryViewModel.AssociatedData

- (_TtCE12PhotosUICoreCSo16PXStoryViewModelP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCE12PhotosUICoreCSo16PXStoryViewModelP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_isFirstActivation) = 1;
  v3 = (char *)self
     + OBJC_IVAR____TtCE12PhotosUICoreCSo16PXStoryViewModelP33_1B50DC52D4D0467ED56FE78BF1017C3914AssociatedData_lastIsActiveChangeDate;
  uint64_t v4 = sub_1AB23075C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)_s14AssociatedDataCMa_5(0);
  return [(PXStoryViewModel.AssociatedData *)&v6 init];
}

- (void).cxx_destruct
{
}

- (_TtCE12PhotosUICoreCSo16PXStoryViewModelP33_F04B6F2764CD012E39AF3DBCA957C80F14AssociatedData)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCE12PhotosUICoreCSo16PXStoryViewModelP33_F04B6F2764CD012E39AF3DBCA957C80F14AssociatedData_actionContext) = 0;
  v3.receiver = self;
  v3.super_class = (Class)_s14AssociatedDataCMa_13();
  return [(PXStoryViewModel.AssociatedData *)&v3 init];
}

@end