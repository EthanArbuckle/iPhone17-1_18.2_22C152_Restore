@interface PKActivityItemSource
+ (id)actionableItemWithValue:(id)a3;
+ (id)placeholderURLItemWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
+ (id)placeholderURLItemWithTitle:(id)a3 subtitle:(id)a4 iconURL:(id)a5 iconPlaceholder:(id)a6;
- (PKActivityItemSource)init;
- (PKActivityItemSource)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 value:(id)a6;
- (PKActivityItemSource)initWithTitle:(id)a3 subtitle:(id)a4 iconURL:(id)a5 iconPlaceholder:(id)a6 value:(id)a7;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation PKActivityItemSource

+ (id)placeholderURLItemWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithString:@"https://apple.com"];
  v12 = [[PKActivityItemSource alloc] initWithTitle:v10 subtitle:v9 icon:v8 value:v11];

  return v12;
}

+ (id)placeholderURLItemWithTitle:(id)a3 subtitle:(id)a4 iconURL:(id)a5 iconPlaceholder:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[[v9 alloc] initWithString:@"https://apple.com"];
  v15 = [[PKActivityItemSource alloc] initWithTitle:v13 subtitle:v12 iconURL:v11 iconPlaceholder:v10 value:v14];

  return v15;
}

+ (id)actionableItemWithValue:(id)a3
{
  id v3 = a3;
  v4 = [[PKActivityItemSource alloc] initWithTitle:0 subtitle:0 icon:0 value:v3];

  return v4;
}

- (PKActivityItemSource)init
{
  return 0;
}

- (PKActivityItemSource)initWithTitle:(id)a3 subtitle:(id)a4 iconURL:(id)a5 iconPlaceholder:(id)a6 value:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKActivityItemSource;
  v18 = [(PKActivityItemSource *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_subtitle, a4);
    objc_storeStrong(&v19->_value, a7);
    objc_storeStrong((id *)&v19->_iconURL, a5);
    if (v19->_iconURL)
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F28D78]);
      uint64_t v21 = objc_opt_class();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke;
      v27[3] = &unk_1E59E0240;
      v22 = v19;
      v28 = v22;
      [v20 registerObjectOfClass:v21 visibility:0 loadHandler:v27];
      if (v16) {
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F30A40]) initWithPlatformImage:v16];
      }
      else {
        v23 = 0;
      }
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F30A40]) initWithItemProvider:v20 properties:0 placeholderImage:v23];
      icon = v22->_icon;
      v22->_icon = (LPImage *)v24;
    }
  }

  return v19;
}

uint64_t __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)v4[3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke_2;
  v8[3] = &unk_1E59CC4C0;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  PKCommonCachedImageFromURL(v5, v8);

  return 0;
}

void __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PKActivityItemSource)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 value:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKActivityItemSource;
  id v15 = [(PKActivityItemSource *)&v24 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_subtitle, a4);
    objc_storeStrong(&v16->_value, a6);
    objc_storeStrong((id *)&v16->_iconImage, a5);
    if (v13)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F28D78]);
      uint64_t v18 = objc_opt_class();
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __58__PKActivityItemSource_initWithTitle_subtitle_icon_value___block_invoke;
      v22[3] = &unk_1E59E0240;
      id v23 = v13;
      [v17 registerObjectOfClass:v18 visibility:0 loadHandler:v22];
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F30A40]) initWithItemProvider:v17 properties:0 placeholderImage:0];
      icon = v16->_icon;
      v16->_icon = (LPImage *)v19;
    }
  }

  return v16;
}

uint64_t __58__PKActivityItemSource_initWithTitle_subtitle_icon_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_value;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return self->_value;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F30A70]);
  [v4 setTitle:self->_title];
  [v4 setSummary:self->_subtitle];
  [v4 setImage:self->_icon];

  return v4;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return 0;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end