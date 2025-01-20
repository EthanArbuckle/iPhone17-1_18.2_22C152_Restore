@interface NTKCompanionFaceViewController
- (NTKCompanionFaceViewController)initWithFace:(id)a3;
- (NTKCompanionFaceViewController)initWithFace:(id)a3 forEditing:(BOOL)a4;
@end

@implementation NTKCompanionFaceViewController

- (NTKCompanionFaceViewController)initWithFace:(id)a3
{
  return [(NTKCompanionFaceViewController *)self initWithFace:a3 forEditing:0];
}

- (NTKCompanionFaceViewController)initWithFace:(id)a3 forEditing:(BOOL)a4
{
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__NTKCompanionFaceViewController_initWithFace_forEditing___block_invoke;
  v13[3] = &unk_1E62CB348;
  BOOL v15 = a4;
  id v7 = v6;
  id v14 = v7;
  v12.receiver = self;
  v12.super_class = (Class)NTKCompanionFaceViewController;
  v8 = [(NTKFaceViewController *)&v12 initWithFace:v7 configuration:v13];
  v9 = v8;
  if (v8)
  {
    v10 = [(NTKCompanionFaceViewController *)v8 view];
    [v10 setUserInteractionEnabled:0];
  }
  return v9;
}

void __58__NTKCompanionFaceViewController_initWithFace_forEditing___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 setDataMode:3];
  [v8 setShouldShowSnapshot:*(unsigned char *)(a1 + 40) == 0];
  [v8 setShowsCanonicalContent:1];
  [v8 freeze];
  v3 = [*(id *)(a1 + 32) device];
  if ([v3 deviceCategory] != 1)
  {
    [v3 screenCornerRadius];
    double v5 = v4;
    id v6 = [v8 faceView];
    [v6 _setContinuousCornerRadius:v5];

    id v7 = [v8 faceView];
    [v7 setClipsToBounds:1];
  }
}

@end