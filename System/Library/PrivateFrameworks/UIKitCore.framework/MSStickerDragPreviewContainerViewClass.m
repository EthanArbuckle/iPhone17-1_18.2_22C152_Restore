@interface MSStickerDragPreviewContainerViewClass
@end

@implementation MSStickerDragPreviewContainerViewClass

Class __get_MSStickerDragPreviewContainerViewClass_block_invoke(uint64_t a1)
{
  if (!qword_1EB25BCC0) {
    qword_1EB25BCC0 = _sl_dlopen();
  }
  Class result = objc_getClass("_MSStickerDragPreviewContainerView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB25BCB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end