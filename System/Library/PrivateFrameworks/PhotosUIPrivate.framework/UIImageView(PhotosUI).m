@interface UIImageView(PhotosUI)
- (PUImageViewExtraction)pu_extractPlayOverlayBackgroundImageFromCenter:()PhotosUI asynchronously:handler:;
@end

@implementation UIImageView(PhotosUI)

- (PUImageViewExtraction)pu_extractPlayOverlayBackgroundImageFromCenter:()PhotosUI asynchronously:handler:
{
  id v11 = a4;
  if (v11)
  {
    if (!a3) {
      goto LABEL_5;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"UIImageView+PhotosUI.m", 26, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    if (!a3) {
      goto LABEL_5;
    }
  }
  if (pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken != -1) {
    dispatch_once(&pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken, &__block_literal_global_103808);
  }
LABEL_5:
  v12 = [a1 image];
  [a1 bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v21 = [a1 contentMode];
  v22 = objc_alloc_init(PUImageViewExtraction);
  if (pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken_10 != -1) {
    dispatch_once(&pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken_10, &__block_literal_global_12);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_3;
  aBlock[3] = &unk_1E5F2EA88;
  v23 = v22;
  v32 = v23;
  double v35 = a5;
  double v36 = a6;
  id v24 = v12;
  id v33 = v24;
  uint64_t v37 = v14;
  uint64_t v38 = v16;
  uint64_t v39 = v18;
  uint64_t v40 = v20;
  uint64_t v41 = v21;
  char v42 = a3;
  id v25 = v11;
  id v34 = v25;
  v26 = _Block_copy(aBlock);
  v27 = v26;
  if (a3)
  {
    (*((void (**)(id, uint64_t))v25 + 2))(v25, pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__approximationImage);
    dispatch_async((dispatch_queue_t)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___extractionQueue, v27);
  }
  else
  {
    (*((void (**)(void *))v26 + 2))(v26);
  }
  v28 = v23;

  return v28;
}

@end