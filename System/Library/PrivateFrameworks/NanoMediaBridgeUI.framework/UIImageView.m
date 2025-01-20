@interface UIImageView
@end

@implementation UIImageView

void __88__UIImageView_MPArtworkCatalog__setArtworkCatalog_withPlaceholderImage_withDesiredSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5 && WeakRetained == v8)
  {
    v7 = objc_msgSend(v8, "_imageFromImage:scaledToSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
    [v8 setImage:v7];
  }
}

@end