@interface PUPhotoImportHistoryCell
@end

@implementation PUPhotoImportHistoryCell

void __38___PUPhotoImportHistoryCell_setAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39718]];
  uint64_t v6 = [v5 integerValue];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained
    && (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
     || v6 == (int)[WeakRetained currentImageRequestToken]))
  {
    v9 = [v8 imageView];
    [v9 setImage:v10];
  }
}

@end