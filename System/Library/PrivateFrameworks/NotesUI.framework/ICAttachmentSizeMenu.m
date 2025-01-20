@interface ICAttachmentSizeMenu
- (BOOL)isOverrideVariant;
- (BOOL)supportsPlainLink;
- (ICAttachmentSizeMenu)initWithTitle:(id)a3 image:(id)a4 preferredViewSize:(signed __int16)a5 supportedSizes:(id)a6 supportsPlainLink:(BOOL)a7 isOverrideVariant:(BOOL)a8 selectedSizeHandler:(id)a9 plainLinkHandler:(id)a10;
- (NSArray)supportedSizes;
- (NSString)title;
- (UIImage)image;
- (id)actionForPlainLink;
- (id)actionForSize:(signed __int16)a3;
- (id)createMenu;
- (id)localizedTitleForPlainLink;
- (id)localizedTitleForSize:(signed __int16)a3;
- (id)plainLinkHandler;
- (id)selectedSizeHandler;
- (signed)preferredViewSize;
- (void)setImage:(id)a3;
- (void)setPlainLinkHandler:(id)a3;
- (void)setPreferredViewSize:(signed __int16)a3;
- (void)setSelectedSizeHandler:(id)a3;
- (void)setSupportedSizes:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICAttachmentSizeMenu

- (ICAttachmentSizeMenu)initWithTitle:(id)a3 image:(id)a4 preferredViewSize:(signed __int16)a5 supportedSizes:(id)a6 supportsPlainLink:(BOOL)a7 isOverrideVariant:(BOOL)a8 selectedSizeHandler:(id)a9 plainLinkHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)ICAttachmentSizeMenu;
  v21 = [(ICAttachmentSizeMenu *)&v33 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    title = v21->_title;
    v21->_title = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    image = v21->_image;
    v21->_image = (UIImage *)v24;

    v21->_preferredViewSize = a5;
    uint64_t v26 = [v18 copy];
    supportedSizes = v21->_supportedSizes;
    v21->_supportedSizes = (NSArray *)v26;

    v21->_supportsPlainLink = a7;
    v21->_isOverrideVariant = a8;
    v28 = _Block_copy(v19);
    id selectedSizeHandler = v21->_selectedSizeHandler;
    v21->_id selectedSizeHandler = v28;

    v30 = _Block_copy(v20);
    id plainLinkHandler = v21->_plainLinkHandler;
    v21->_id plainLinkHandler = v30;
  }
  return v21;
}

- (id)createMenu
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(ICAttachmentSizeMenu *)self actionForPlainLink];
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4FB1970];
    v20[0] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v8 = [v6 menuWithTitle:&stru_1F0973378 image:0 identifier:0 options:1 children:v7];

    [v3 addObject:v8];
  }
  v9 = [(ICAttachmentSizeMenu *)self supportedSizes];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__ICAttachmentSizeMenu_createMenu__block_invoke;
  v19[3] = &unk_1E5FDD038;
  v19[4] = self;
  v10 = objc_msgSend(v9, "ic_compactMap:", v19);

  if ([v10 count])
  {
    v11 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0973378 image:0 identifier:0 options:1 children:v10];
    [v3 addObject:v11];
  }
  v12 = (void *)MEMORY[0x1E4FB1970];
  v13 = [(ICAttachmentSizeMenu *)self title];
  v14 = [(ICAttachmentSizeMenu *)self image];
  v15 = (void *)[v3 copy];
  id v16 = [v12 menuWithTitle:v13 image:v14 identifier:@"com.apple.mobilenotes.attachmentSizeMenu" options:0 children:v15];

  if (![(ICAttachmentSizeMenu *)self isOverrideVariant])
  {
    id v17 = [(ICAttachmentSizeMenu *)self localizedTitleForSize:[(ICAttachmentSizeMenu *)self preferredViewSize]];
    [v16 setSubtitle:v17];
  }
  return v16;
}

uint64_t __34__ICAttachmentSizeMenu_createMenu__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (__int16)[a2 integerValue];
  return [v2 actionForSize:v3];
}

- (id)actionForPlainLink
{
  if ([(ICAttachmentSizeMenu *)self supportsPlainLink])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v4 = [(ICAttachmentSizeMenu *)self localizedTitleForPlainLink];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__ICAttachmentSizeMenu_actionForPlainLink__block_invoke;
    v7[3] = &unk_1E5FDBE98;
    v7[4] = self;
    v5 = [v3 actionWithTitle:v4 image:0 identifier:0 handler:v7];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __42__ICAttachmentSizeMenu_actionForPlainLink__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) plainLinkHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) plainLinkHandler];
    v3[2]();
  }
}

- (id)actionForSize:(signed __int16)a3
{
  int v3 = a3;
  v5 = -[ICAttachmentSizeMenu localizedTitleForSize:](self, "localizedTitleForSize:");
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__ICAttachmentSizeMenu_actionForSize___block_invoke;
    v12[3] = &unk_1E5FDD060;
    v12[4] = self;
    __int16 v13 = v3;
    v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:v5 image:0 identifier:0 handler:v12];
    if (![(ICAttachmentSizeMenu *)self isOverrideVariant])
    {
      int v7 = [(ICAttachmentSizeMenu *)self preferredViewSize];
      BOOL v8 = v7 == v3;
      if (v7 == v3) {
        v9 = (void *)MEMORY[0x1E4FB2590];
      }
      else {
        v9 = (void *)MEMORY[0x1E4FB2570];
      }
      [v6 setState:v8];
      [v6 setAccessibilityTraits:*v9];
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentSizeMenu actionForSize:](v3, v10);
    }

    v6 = 0;
  }

  return v6;
}

void __38__ICAttachmentSizeMenu_actionForSize___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) selectedSizeHandler];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) selectedSizeHandler];
    v3[2](v3, *(__int16 *)(a1 + 40));
  }
}

- (id)localizedTitleForPlainLink
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Plain Link" value:@"Plain Link" table:0 allowSiri:1];
}

- (id)localizedTitleForSize:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v4 = [(ICAttachmentSizeMenu *)self isOverrideVariant];
  if (v4)
  {
    if (v3)
    {
      if (v3 == 2)
      {
        v5 = (void *)MEMORY[0x1E4F83770];
        v6 = @"Set All to Medium";
      }
      else
      {
        if (v3 != 1) {
          goto LABEL_15;
        }
        v5 = (void *)MEMORY[0x1E4F83770];
        v6 = @"Set All to Small";
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x1E4F83770];
      v6 = @"Set All to Large";
    }
  }
  else if (v3)
  {
    if (v3 == 2)
    {
      v5 = (void *)MEMORY[0x1E4F83770];
      v6 = @"Medium";
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_15;
      }
      v5 = (void *)MEMORY[0x1E4F83770];
      v6 = @"Small";
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F83770];
    v6 = @"Large";
  }
  uint64_t v4 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
LABEL_15:
  return (id)v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (signed)preferredViewSize
{
  return self->_preferredViewSize;
}

- (void)setPreferredViewSize:(signed __int16)a3
{
  self->_preferredViewSize = a3;
}

- (NSArray)supportedSizes
{
  return self->_supportedSizes;
}

- (void)setSupportedSizes:(id)a3
{
}

- (BOOL)supportsPlainLink
{
  return self->_supportsPlainLink;
}

- (BOOL)isOverrideVariant
{
  return self->_isOverrideVariant;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (id)selectedSizeHandler
{
  return self->_selectedSizeHandler;
}

- (void)setSelectedSizeHandler:(id)a3
{
}

- (id)plainLinkHandler
{
  return self->_plainLinkHandler;
}

- (void)setPlainLinkHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_plainLinkHandler, 0);
  objc_storeStrong(&self->_selectedSizeHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_supportedSizes, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)actionForSize:(__int16)a1 .cold.1(__int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Unable to determine label for attachment size: %hd", (uint8_t *)v2, 8u);
}

@end