@interface NTKCFaceDetailPhotoCropViewController
- (NTKCFaceDetailPhotoCropViewController)initWithIndex:(unint64_t)a3 inPhotosEditor:(id)a4 forFace:(id)a5 timeStyle:(id)a6 completionHandler:(id)a7;
- (NTKCompanionCustomPhotosEditor)editor;
- (NTKDigitalTimeLabelStyle)timeStyle;
- (NTKFace)face;
- (unint64_t)index;
- (void)viewDidLoad;
@end

@implementation NTKCFaceDetailPhotoCropViewController

- (NTKCFaceDetailPhotoCropViewController)initWithIndex:(unint64_t)a3 inPhotosEditor:(id)a4 forFace:(id)a5 timeStyle:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [[_NTKCFaceDetailPhotoCropViewController alloc] initWithIndex:a3 inPhotosEditor:v15 forFace:v14 timeStyle:v13 completionHandler:v12];

  v25.receiver = self;
  v25.super_class = (Class)NTKCFaceDetailPhotoCropViewController;
  v17 = [(NTKCNavigationController *)&v25 initWithRootViewController:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_implementationVC, v16);
    id v19 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v19 configureWithOpaqueBackground];
    v20 = [(NTKCFaceDetailPhotoCropViewController *)v18 navigationBar];
    [v20 setStandardAppearance:v19];

    v21 = [(NTKCFaceDetailPhotoCropViewController *)v18 navigationBar];
    [v21 setScrollEdgeAppearance:v19];

    v22 = [(NTKCFaceDetailPhotoCropViewController *)v18 navigationItem];
    [v22 setLargeTitleDisplayMode:2];

    v23 = [(NTKCFaceDetailPhotoCropViewController *)v18 navigationBar];
    [v23 setPrefersLargeTitles:0];
  }
  return v18;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailPhotoCropViewController;
  [(NTKCFaceDetailPhotoCropViewController *)&v3 viewDidLoad];
  [(NTKCFaceDetailPhotoCropViewController *)self setToolbarHidden:0];
}

- (unint64_t)index
{
  return [(_NTKCFaceDetailPhotoCropViewController *)self->_implementationVC index];
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return [(_NTKCFaceDetailPhotoCropViewController *)self->_implementationVC editor];
}

- (NTKFace)face
{
  return [(_NTKCFaceDetailPhotoCropViewController *)self->_implementationVC face];
}

- (NTKDigitalTimeLabelStyle)timeStyle
{
  return [(_NTKCFaceDetailPhotoCropViewController *)self->_implementationVC timeStyle];
}

- (void).cxx_destruct
{
}

uint64_t __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, double x, double y, double width, double height)
{
  id v11 = a2;
  [v11 scale];
  double v13 = v12;
  *(double *)(*(void *)(a1 + 32) + 992) = v12;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (!CGRectIsEmpty(v17) && v13 != 0.0)
  {
    CGAffineTransformMakeScale(&v16, 1.0 / v13, 1.0 / v13);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v16);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];

  [*(id *)(*(void *)(a1 + 32) + 984) setCenteredView:v14];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setCropRect:", x, y, width, height);
}

void __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 1064) originalCropForPhotoAtIndex:*(void *)(*(void *)(a1 + 32) + 1056)];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 1064);
    uint64_t v7 = *(void *)(v5 + 1056);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_3;
    v8[3] = &unk_1E62C2148;
    id v9 = *(id *)(a1 + 40);
    [v6 imageAndCropForPhotoAtIndex:v7 completion:v8];
  }
}

uint64_t __53___NTKCFaceDetailPhotoCropViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56___NTKCFaceDetailPhotoCropViewController__cancelPressed__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1040) = 1;
  return [*(id *)(a1 + 32) _cancelPressed];
}

uint64_t __56___NTKCFaceDetailPhotoCropViewController__deletePressed__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
  return [*(id *)(a1 + 32) _deletePressed];
}

@end