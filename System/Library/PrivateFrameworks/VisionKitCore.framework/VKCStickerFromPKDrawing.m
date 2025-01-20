@interface VKCStickerFromPKDrawing
- (CGImage)inputImage;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UIView)currentView;
- (VKCStickerFromPKDrawing)initWithFrameVar:(CGRect)a3 currentView:(id)a4 inputtedImage:(CGImage *)a5;
- (VKCStickerFromPKDrawingDelegate)delegate;
- (_UIStickerPickerViewController)stickerPickerViewController;
- (void)_generateStickerRepresentations:(CGImage *)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)presentStickerPickerViewController:(CGRect)a3;
- (void)setCurrentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setInputImage:(CGImage *)a3;
- (void)setStickerPickerViewController:(id)a3;
- (void)stickerPickerViewControllerDidDismiss;
- (void)stickerPickerViewControllerDidLoad;
@end

@implementation VKCStickerFromPKDrawing

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  CGImageRelease(self->_inputImage);
  v4.receiver = self;
  v4.super_class = (Class)VKCStickerFromPKDrawing;
  [(VKCStickerFromPKDrawing *)&v4 dealloc];
}

- (VKCStickerFromPKDrawing)initWithFrameVar:(CGRect)a3 currentView:(id)a4 inputtedImage:(CGImage *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VKCStickerFromPKDrawing;
  v12 = -[VKCStickerFromPKDrawing initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    [(VKCStickerFromPKDrawing *)v12 setInputImage:a5];
    [(VKCStickerFromPKDrawing *)v13 setCurrentView:v11];
    v14 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42DD8]);
    feedbackGenerator = v13->_feedbackGenerator;
    v13->_feedbackGenerator = v14;
  }
  return v13;
}

- (void)presentStickerPickerViewController:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F43330]);
  [(VKCStickerFromPKDrawing *)self setStickerPickerViewController:v8];

  v9 = [(VKCStickerFromPKDrawing *)self stickerPickerViewController];
  [v9 setDelegate:self];

  v10 = [(VKCStickerFromPKDrawing *)self currentView];
  id v11 = [(VKCStickerFromPKDrawing *)self stickerPickerViewController];
  v12 = [v11 popoverPresentationController];
  [v12 setSourceView:v10];

  v13 = [(VKCStickerFromPKDrawing *)self stickerPickerViewController];
  [v13 setModalTransitionStyle:0];

  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v14 = CGRectGetMidX(v31) + -20.0;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v15 = CGRectGetMidY(v32) + -20.0;
  v16 = [(VKCStickerFromPKDrawing *)self stickerPickerViewController];
  [v16 setSourceView:self];

  double v18 = VKMRectWithOriginAndSize(v17, v14, v15, 40.0, 40.0);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(VKCStickerFromPKDrawing *)self stickerPickerViewController];
  objc_msgSend(v25, "setSourceRect:", v18, v20, v22, v24);

  id v29 = [(VKCStickerFromPKDrawing *)self currentView];
  v26 = [v29 window];
  v27 = [v26 rootViewController];
  v28 = [(VKCStickerFromPKDrawing *)self stickerPickerViewController];
  [v27 presentViewController:v28 animated:0 completion:0];
}

- (void)_generateStickerRepresentations:(CGImage *)a3 type:(unint64_t)a4 completion:(id)a5
{
  char v5 = a4;
  id v8 = a5;
  v9 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", a3);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  id v32 = [MEMORY[0x1E4F1CA48] array];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2810000000;
  v29[3] = &unk_1DB350762;
  int v30 = 0;
  v10 = dispatch_group_create();
  id v11 = +[VKImageDataRequirements stickerRequirements];
  if (v5)
  {
    dispatch_group_enter(v10);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__VKCStickerFromPKDrawing__generateStickerRepresentations_type_completion___block_invoke;
    v24[3] = &unk_1E6BF0DE0;
    id v25 = v11;
    v27 = v29;
    v28 = v31;
    v26 = v10;
    objc_msgSend(v9, "vk_imageDataWithRequirements:completion:", v25, v24);
  }
  if ((v5 & 4) != 0)
  {
    dispatch_group_enter(v10);
    v12 = +[VKImageDataRequirements stickerThumbnailRequirements];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__VKCStickerFromPKDrawing__generateStickerRepresentations_type_completion___block_invoke_2;
    v20[3] = &unk_1E6BF0E08;
    double v22 = v29;
    double v23 = v31;
    double v21 = v10;
    objc_msgSend(v9, "vk_imageDataWithRequirements:completion:", v12, v20);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__VKCStickerFromPKDrawing__generateStickerRepresentations_type_completion___block_invoke_3;
  v15[3] = &unk_1E6BF0E30;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  double v19 = v31;
  id v13 = v8;
  id v14 = v9;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v15);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __75__VKCStickerFromPKDrawing__generateStickerRepresentations_type_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  if (a2)
  {
    v7 = (objc_class *)MEMORY[0x1E4F43338];
    id v8 = a2;
    id v9 = objc_alloc_init(v7);
    [v9 setData:v8];

    [v9 setRole:*MEMORY[0x1E4F441E0]];
    v10 = [*(id *)(a1 + 32) uti];
    [v9 setType:v10];

    objc_msgSend(v9, "setSize:", a3, a4);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) insertObject:v9 atIndex:0];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  }
  id v11 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v11);
}

void __75__VKCStickerFromPKDrawing__generateStickerRepresentations_type_completion___block_invoke_2(void *a1, void *a2, double a3, double a4)
{
  if (a2)
  {
    v7 = (objc_class *)MEMORY[0x1E4F43338];
    id v8 = a2;
    id v9 = objc_alloc_init(v7);
    [v9 setData:v8];

    [v9 setRole:*MEMORY[0x1E4F441D8]];
    v10 = +[VKImageDataRequirements stickerThumbnailRequirements];
    id v11 = [v10 uti];
    [v9 setType:v11];

    objc_msgSend(v9, "setSize:", a3, a4);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  }
  v12 = a1[4];
  dispatch_group_leave(v12);
}

void __75__VKCStickerFromPKDrawing__generateStickerRepresentations_type_completion___block_invoke_3(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) currentView];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)stickerPickerViewControllerDidLoad
{
  id v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Sticker Picker Did Load from PencilKit stroke to sticker process", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_super v4 = [(VKCStickerFromPKDrawing *)self inputImage];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__VKCStickerFromPKDrawing_stickerPickerViewControllerDidLoad__block_invoke;
  v5[3] = &unk_1E6BF0E58;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  [(VKCStickerFromPKDrawing *)self _generateStickerRepresentations:v4 type:5 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __61__VKCStickerFromPKDrawing_stickerPickerViewControllerDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (v9)
  {
    v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __61__VKCStickerFromPKDrawing_stickerPickerViewControllerDidLoad__block_invoke_cold_1((uint64_t)v9, v12);
    }
  }
  else if (WeakRetained)
  {
    id v13 = [*(id *)(a1 + 32) stickerPickerViewController];
    id v14 = [*(id *)(a1 + 32) currentView];
    [v13 addStickerWithRepresentations:v7 previewView:v8 originatingView:v14];
  }
}

- (void)setInputImage:(CGImage *)a3
{
  inputImage = self->_inputImage;
  if (inputImage != a3)
  {
    CGImageRelease(inputImage);
    self->_inputImage = a3;
    CGImageRetain(a3);
  }
  self->_inputImage = a3;
}

- (void)stickerPickerViewControllerDidDismiss
{
}

- (VKCStickerFromPKDrawingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCStickerFromPKDrawingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGImage)inputImage
{
  return self->_inputImage;
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (_UIStickerPickerViewController)stickerPickerViewController
{
  return self->_stickerPickerViewController;
}

- (void)setStickerPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerPickerViewController, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__VKCStickerFromPKDrawing_stickerPickerViewControllerDidLoad__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error createStickerRepresentations: %@", (uint8_t *)&v2, 0xCu);
}

@end