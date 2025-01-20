@interface SKUIProfileImagePicker
+ (id)_fixCropRect:(id)a3 forOriginalImage:(id)a4;
- (SKUIProfileImagePicker)initWithClientContext:(id)a3;
- (SKUIProfileImagePickerDelegate)delegate;
- (void)_didCancel;
- (void)_presentImagePickerWithSourceType:(int64_t)a3;
- (void)_showImagePicker;
- (void)_showImageSourcePicker;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SKUIProfileImagePicker

- (SKUIProfileImagePicker)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProfileImagePicker initWithClientContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIProfileImagePicker;
  v6 = [(SKUIProfileImagePicker *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(SKUIProfileImagePicker *)v6 setModalPresentationStyle:4];
    objc_storeStrong((id *)&v7->_clientContext, a3);
    v7->_firstApperance = 0;
  }

  return v7;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  [(SKUIProfileImagePicker *)self dismissViewControllerAnimated:1 completion:0];

  [(SKUIProfileImagePicker *)self _didCancel];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  [(SKUIProfileImagePicker *)self dismissViewControllerAnimated:1 completion:0];
  id v12 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB2A28]];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB29F8]];

  if (v6) {
    BOOL v7 = v12 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = [(id)objc_opt_class() _fixCropRect:v6 forOriginalImage:v12];

    v6 = (void *)v8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 profileImagePicker:self didPickProfileImage:v12 withCropRect:v6];
  }
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v3];

  [(SKUIProfileImagePicker *)self setView:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIProfileImagePicker;
  [(SKUIProfileImagePicker *)&v4 viewDidAppear:a3];
  if (!self->_firstApperance)
  {
    self->_firstApperance = 1;
    [(SKUIProfileImagePicker *)self _showImagePicker];
  }
}

+ (id)_fixCropRect:(id)a3 forOriginalImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 CGRectValue];
  double v10 = v9;
  double v12 = v11;
  double v13 = -0.0;
  if (v7 < 0.0) {
    double v13 = v7;
  }
  double v14 = v8 + v13;
  if (v7 >= 0.0) {
    double v15 = v7;
  }
  else {
    double v15 = 0.0;
  }
  [v6 size];
  if (v15 + v14 > v16)
  {
    [v6 size];
    double v14 = v17 - v15;
  }
  double v18 = -0.0;
  if (v10 < 0.0) {
    double v18 = v10;
  }
  double v19 = v12 + v18;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  [v6 size];
  if (v10 + v19 > v20)
  {
    [v6 size];
    double v19 = v21 - v10;
  }
  [v5 CGRectValue];
  v30.origin.x = v22;
  v30.origin.y = v23;
  v30.size.width = v24;
  v30.size.height = v25;
  v29.origin.x = v15;
  v29.origin.y = v10;
  v29.size.width = v14;
  v29.size.height = v19;
  if (!CGRectEqualToRect(v29, v30))
  {
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v15, v10, v14, v19);

    id v5 = (id)v26;
  }

  return v5;
}

- (void)_didCancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 profileImagePickerDidCancel:self];
  }
}

- (void)_presentImagePickerWithSourceType:(int64_t)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  char v5 = (UIImagePickerController *)objc_alloc_init(MEMORY[0x1E4FB1828]);
  imagePicker = self->_imagePicker;
  self->_imagePicker = v5;

  [(UIImagePickerController *)self->_imagePicker setSourceType:a3];
  double v7 = (void *)SKUIMobileCoreServicesFramework();
  double v8 = (id *)SKUIWeakLinkedSymbolForString("kUTTypeImage", v7);
  double v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = *v8;
  double v11 = [v9 arrayWithObject:v10];
  [(UIImagePickerController *)self->_imagePicker setMediaTypes:v11];
  [(UIImagePickerController *)self->_imagePicker setDelegate:self];
  [(UIImagePickerController *)self->_imagePicker _setImagePickerSavingOptions:3];
  double v12 = (void *)MEMORY[0x1E4F1CA60];
  double v13 = [(UIImagePickerController *)self->_imagePicker _properties];
  double v14 = [v12 dictionaryWithDictionary:v13];

  uint64_t v15 = *MEMORY[0x1E4FB3250];
  v18[0] = *MEMORY[0x1E4FB29F0];
  v18[1] = v15;
  v19[0] = MEMORY[0x1E4F1CC38];
  v19[1] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = *MEMORY[0x1E4FB3210];
  v18[2] = *MEMORY[0x1E4FB31D8];
  v18[3] = v16;
  v19[2] = MEMORY[0x1E4F1CC38];
  v19[3] = MEMORY[0x1E4F1CC38];
  v18[4] = *MEMORY[0x1E4FB31D0];
  v19[4] = MEMORY[0x1E4F1CC38];
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  [v14 addEntriesFromDictionary:v17];

  [(UIImagePickerController *)self->_imagePicker _setProperties:v14];
  [(SKUIProfileImagePicker *)self presentViewController:self->_imagePicker animated:1 completion:0];
}

- (void)_showImagePicker
{
  int v3 = [MEMORY[0x1E4FB1828] isSourceTypeAvailable:1];
  int v4 = [MEMORY[0x1E4FB1828] isSourceTypeAvailable:0];
  if (v3 & 1) != 0 || (v4)
  {
    if ((v3 & v4) == 1)
    {
      [(SKUIProfileImagePicker *)self _showImageSourcePicker];
    }
    else
    {
      [(SKUIProfileImagePicker *)self _presentImagePickerWithSourceType:v3 != 0];
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
    char v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"PROFILE_NO_PHOTO_SOURCE" message:0 preferredStyle:1];
    [v5 addAction:v6];
    [(SKUIProfileImagePicker *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_showImageSourcePicker
{
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SKUIClientContext *)clientContext localizedStringForKey:@"SETTINGS_PROFILE_CANCEL" inTable:@"Settings"];
  }
  else {
  int v4 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_CANCEL" inBundles:0 inTable:@"Settings"];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke;
  v17[3] = &unk_1E6425BA0;
  v17[4] = self;
  char v5 = [MEMORY[0x1E4FB1410] actionWithTitle:v4 style:1 handler:v17];
  id v6 = self->_clientContext;
  if (v6) {
    [(SKUIClientContext *)v6 localizedStringForKey:@"SETTINGS_PROFILE_TAKE_PHOTO" inTable:@"Settings"];
  }
  else {
  double v7 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_TAKE_PHOTO" inBundles:0 inTable:@"Settings"];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_2;
  v16[3] = &unk_1E6425BA0;
  v16[4] = self;
  double v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v7 style:0 handler:v16];
  double v9 = self->_clientContext;
  if (v9) {
    [(SKUIClientContext *)v9 localizedStringForKey:@"SETTINGS_PROFILE_CHOOSE_PHOTO" inTable:@"Settings"];
  }
  else {
  id v10 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_CHOOSE_PHOTO" inBundles:0 inTable:@"Settings"];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_3;
  v15[3] = &unk_1E6425BA0;
  v15[4] = self;
  double v11 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:0 handler:v15];
  double v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:(v13 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  [v14 addAction:v5];
  [v14 addAction:v8];
  [v14 addAction:v11];
  [(SKUIProfileImagePicker *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCancel];
}

uint64_t __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentImagePickerWithSourceType:1];
}

uint64_t __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentImagePickerWithSourceType:0];
}

- (SKUIProfileImagePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIProfileImagePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProfileImagePicker initWithClientContext:]";
}

@end