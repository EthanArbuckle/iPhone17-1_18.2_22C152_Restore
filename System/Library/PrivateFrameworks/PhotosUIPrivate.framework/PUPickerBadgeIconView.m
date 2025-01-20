@interface PUPickerBadgeIconView
- (PUPickerBadgeIconView)initWithFrame:(CGRect)a3;
- (UIImageView)photosImageView;
- (UIImageView)privacyImageView;
- (void)flipToPrivacyIconAfterDelay:(double)a3;
@end

@implementation PUPickerBadgeIconView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyImageView, 0);
  objc_storeStrong((id *)&self->_photosImageView, 0);
}

- (UIImageView)privacyImageView
{
  return self->_privacyImageView;
}

- (UIImageView)photosImageView
{
  return self->_photosImageView;
}

- (void)flipToPrivacyIconAfterDelay:(double)a3
{
  v5 = [(PUPickerBadgeIconView *)self photosImageView];
  v6 = [(PUPickerBadgeIconView *)self privacyImageView];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke;
  v10[3] = &unk_1E5F2D1C0;
  long long v13 = xmmword_1AEFF7D80;
  long long v14 = xmmword_1AEFF7D90;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_after(v7, MEMORY[0x1E4F14428], v10);
}

void __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke_2;
  v4[3] = &unk_1E5F2D2C8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = 2097408;
  v3 = objc_msgSend(v2, "initWithDuration:controlPoint1:controlPoint2:animations:", v4, 0.5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [v3 startAnimation];
}

uint64_t __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke_2(void *a1)
{
  return [MEMORY[0x1E4FB1EB0] transitionFromView:a1[4] toView:a1[5] duration:a1[6] options:0 completion:0.5];
}

- (PUPickerBadgeIconView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PUPickerBadgeIconView;
  v3 = -[PUPickerBadgeIconView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v5 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PhotosIndicator");
    uint64_t v6 = [v4 initWithImage:v5];
    photosImageView = v3->_photosImageView;
    v3->_photosImageView = (UIImageView *)v6;

    [(UIImageView *)v3->_photosImageView setAutoresizingMask:18];
    [(PUPickerBadgeIconView *)v3 bounds];
    -[UIImageView setFrame:](v3->_photosImageView, "setFrame:");
    [(PUPickerBadgeIconView *)v3 addSubview:v3->_photosImageView];
    id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v9 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PrivacyIndicator");
    uint64_t v10 = [v8 initWithImage:v9];
    privacyImageView = v3->_privacyImageView;
    v3->_privacyImageView = (UIImageView *)v10;

    [(UIImageView *)v3->_privacyImageView setAutoresizingMask:18];
    [(PUPickerBadgeIconView *)v3 bounds];
    -[UIImageView setFrame:](v3->_privacyImageView, "setFrame:");
    [(UIImageView *)v3->_privacyImageView setHidden:1];
    [(PUPickerBadgeIconView *)v3 addSubview:v3->_privacyImageView];
  }
  return v3;
}

@end