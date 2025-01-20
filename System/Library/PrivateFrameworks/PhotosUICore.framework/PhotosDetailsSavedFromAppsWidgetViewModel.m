@interface PhotosDetailsSavedFromAppsWidgetViewModel
@end

@implementation PhotosDetailsSavedFromAppsWidgetViewModel

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSavedFromAppsWidgetViewModel_attributionInfo));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosDetailsSavedFromAppsWidgetViewModel__attributionAppIcon;
  sub_1A9AF3BC4(0, (unint64_t *)&unk_1E981BB10, (uint64_t (*)(uint64_t))sub_1AA098F78, MEMORY[0x1E4F1AC70]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end