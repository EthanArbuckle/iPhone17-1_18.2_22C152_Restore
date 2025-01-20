@interface PBUIBackdropCompositor
- (PBUIBackdropCompositor)init;
- (id)applyEffect:(id)a3 toImage:(id)a4 error:(id *)a5;
@end

@implementation PBUIBackdropCompositor

- (PBUIBackdropCompositor)init
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIBackdropCompositor;
  return [(PBUIBackdropCompositor *)&v3 init];
}

- (id)applyEffect:(id)a3 toImage:(id)a4 error:(id *)a5
{
  v6 = a3;
  objc_msgSend(a4, "pbui_CGImageBackedImage");
  id v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)[v7 CGImage];
  if (v6)
  {
    long long v9 = v6[3];
    long long v16 = v6[2];
    long long v17 = v9;
    long long v10 = v6[5];
    long long v18 = v6[4];
    long long v19 = v10;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  v11 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v16);
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PBUIBackdropCompositor_applyEffect_toImage_error___block_invoke;
    v13[3] = &unk_1E62B38B8;
    v14 = v6;
    id v15 = v11;
    v8 = objc_msgSend(v7, "pbui_imageByManipulatingInDeviceColorSpaceWithBlock:", v13);
  }
  return v8;
}

id __52__PBUIBackdropCompositor_applyEffect_toImage_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(unsigned char *)(v5 + 8))
  {
    long long v6 = *(_OWORD *)(v5 + 48);
    v12[0] = *(_OWORD *)(v5 + 32);
    v12[1] = v6;
    long long v7 = *(_OWORD *)(v5 + 80);
    v12[2] = *(_OWORD *)(v5 + 64);
    v12[3] = v7;
    v8 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)v12);
    long long v9 = [v4 _applyBackdropViewSettings:v8 includeTints:0 includeBlur:1 allowImageResizing:1];
    long long v10 = [v9 _applyBackdropViewSettings:*(void *)(a1 + 40) includeTints:1 includeBlur:0];
  }
  else
  {
    long long v10 = [v3 _applyBackdropViewSettings:*(void *)(a1 + 40) includeTints:0 includeBlur:1 allowImageResizing:1];
  }

  return v10;
}

@end