@interface TVRUIMediaInfoCell
@end

@implementation TVRUIMediaInfoCell

void __36___TVRUIMediaInfoCell_setMediaInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained mediaInfo];
    v9 = [v8 identifier];
    int v10 = [v12 isEqualToString:v9];

    if (v10)
    {
      v11 = [v7 imageView];
      [v11 setImage:v5];
    }
  }
}

@end