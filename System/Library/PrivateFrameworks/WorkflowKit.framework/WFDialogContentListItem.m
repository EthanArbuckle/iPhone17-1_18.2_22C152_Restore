@interface WFDialogContentListItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hideSubtitle;
- (BOOL)loadAltTextWithCompletion:(id)a3;
- (BOOL)loadImageWithSize:(CGSize)a3 completion:(id)a4;
- (BOOL)loadSubtitleWithCompletion:(id)a3;
- (NSData)archivedContentItem;
- (NSString)subtitle;
- (WFContentItem)contentItem;
- (WFDialogContentListItem)initWithCoder:(id)a3;
- (WFDialogContentListItem)initWithContentItem:(id)a3 encodedTypedValue:(id)a4 selected:(BOOL)a5 hideSubtitle:(BOOL)a6;
- (WFDialogContentListItem)initWithContentItem:(id)a3 encodedTypedValue:(id)a4 selected:(BOOL)a5 serializedPossibleState:(id)a6;
- (WFDialogContentListItem)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 selected:(BOOL)a6 contentItem:(id)a7 encodedTypedValue:(id)a8 hideSubtitle:(BOOL)a9 serializedPossibleState:(id)a10;
- (WFImage)image;
- (void)_loadContentItemWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
- (void)setArchivedContentItem:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setHideSubtitle:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation WFDialogContentListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedContentItem, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

- (void)setArchivedContentItem:(id)a3
{
}

- (NSData)archivedContentItem
{
  return self->_archivedContentItem;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setImage:(id)a3
{
}

- (WFImage)image
{
  return self->_image;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setContentItem:(id)a3
{
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (BOOL)loadImageWithSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v20[1] = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, void *, void *))a4;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFDialogContentListItem.m", 207, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if ([(WFDialogListItem *)self showingStaticContent])
  {
    v9 = [(WFDialogContentListItem *)self image];
    v10 = objc_msgSend(v9, "resizedImageWithSizeInPoints:", width, height);

    uint64_t v19 = *MEMORY[0x1E4FB4C40];
    v20[0] = &unk_1F23170B8;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v8[2](v8, v10, v11);
    char v12 = v10 != 0;
  }
  else
  {
    v13 = [(WFDialogContentListItem *)self contentItem];
    if (v13)
    {
      v10 = v13;
      char v12 = objc_msgSend(v13, "getListThumbnail:forSize:", v8, width, height);
    }
    else
    {
      v14 = getWFDialogLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFDialogContentListItem loadImageWithSize:completion:]";
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Attempting to load image without loading the content item first. Please call -[WFDialogListItem prepareForDisplayWithCompletionHandler:] first.", buf, 0xCu);
      }

      v10 = 0;
      char v12 = 0;
    }
  }

  return v12;
}

- (BOOL)loadAltTextWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFDialogContentListItem.m", 184, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if ([(WFDialogListItem *)self showingStaticContent])
  {
    char v6 = 0;
  }
  else
  {
    v7 = [(WFDialogContentListItem *)self contentItem];
    if (v7)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__WFDialogContentListItem_loadAltTextWithCompletion___block_invoke;
      v11[3] = &unk_1E6554600;
      char v12 = v5;
      char v6 = [v7 getListAltText:v11];
      v8 = v12;
    }
    else
    {
      v8 = getWFDialogLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFDialogContentListItem loadAltTextWithCompletion:]";
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Attempting to load alt text without loading the content item first. Please call -[WFDialogListItem prepareForDisplayWithCompletionHandler:] first.", buf, 0xCu);
      }
      char v6 = 0;
    }
  }
  return v6;
}

uint64_t __53__WFDialogContentListItem_loadAltTextWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)loadSubtitleWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFDialogContentListItem.m", 153, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if ([(WFDialogListItem *)self showingStaticContent])
  {
    char v6 = [(WFDialogContentListItem *)self subtitle];
    v5[2](v5, v6);

    v7 = [(WFDialogContentListItem *)self subtitle];
    char v8 = [v7 length] != 0;
LABEL_13:

    goto LABEL_14;
  }
  if (![(WFDialogContentListItem *)self hideSubtitle])
  {
    v7 = [(WFDialogContentListItem *)self contentItem];
    if (v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__WFDialogContentListItem_loadSubtitleWithCompletion___block_invoke;
      v12[3] = &unk_1E65545D8;
      v14 = v5;
      id v13 = v7;
      char v8 = [v13 getListSubtitle:v12];

      v9 = v14;
    }
    else
    {
      v9 = getWFDialogLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[WFDialogContentListItem loadSubtitleWithCompletion:]";
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Attempting to load subtitles without loading the content item first. Please call -[WFDialogListItem prepareForDisplayWithCompletionHandler:] first.", buf, 0xCu);
      }
      char v8 = 0;
    }

    goto LABEL_13;
  }
  char v8 = 0;
LABEL_14:

  return v8;
}

void __54__WFDialogContentListItem_loadSubtitleWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
  else
  {
    id v5 = [(id)objc_opt_class() localizedTypeDescription];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

- (void)_loadContentItemWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = [(WFDialogContentListItem *)self archivedContentItem];

  if (!v5) {
    v4[2](v4, 0);
  }
  char v6 = (void *)MEMORY[0x1E4F28DC0];
  v7 = [(WFDialogContentListItem *)self archivedContentItem];
  char v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__WFDialogContentListItem__loadContentItemWithCompletion___block_invoke;
  v11[3] = &unk_1E65545B0;
  void v11[4] = self;
  id v12 = v4;
  v9 = v4;
  id v10 = (id)objc_msgSend(v6, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v7, v8, v11);
}

void __58__WFDialogContentListItem__loadContentItemWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setContentItem:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, WFDialogContentListItem *))a3;
  if ([(WFDialogListItem *)self showingStaticContent]
    || ([(WFDialogContentListItem *)self contentItem],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v4[2](v4, self);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__WFDialogContentListItem_prepareForDisplayWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E6554588;
    v6[4] = self;
    v7 = v4;
    [(WFDialogContentListItem *)self _loadContentItemWithCompletion:v6];
  }
}

uint64_t __66__WFDialogContentListItem_prepareForDisplayWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDialogContentListItem *)self contentItem];

  if (v5)
  {
    char v6 = (void *)MEMORY[0x1E4F28DB0];
    v7 = [(WFDialogContentListItem *)self contentItem];
    char v8 = objc_msgSend(v6, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 0);

    [(WFDialogContentListItem *)self setArchivedContentItem:v8];
  }
  v9 = [(WFDialogListItem *)self identifier];
  [v4 encodeObject:v9 forKey:@"identifier"];

  id v10 = [(WFDialogListItem *)self title];
  [v4 encodeObject:v10 forKey:@"title"];

  v11 = [(WFDialogContentListItem *)self subtitle];
  [v4 encodeObject:v11 forKey:@"subtitle"];

  id v12 = [(WFDialogContentListItem *)self image];
  [v4 encodeObject:v12 forKey:@"image"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogListItem selected](self, "selected"), @"selected");
  id v13 = [(WFDialogContentListItem *)self archivedContentItem];
  [v4 encodeObject:v13 forKey:@"archivedContentItem"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogContentListItem hideSubtitle](self, "hideSubtitle"), @"hideSubtitle");
  id v14 = [(WFDialogListItem *)self serializedPossibleState];
  [v4 encodeObject:v14 forKey:@"serializedPossibleState"];
}

- (WFDialogContentListItem)initWithCoder:(id)a3
{
  id v3 = a3;
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  unsigned int v20 = [v3 decodeBoolForKey:@"selected"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"archivedContentItem"];
  unsigned int v19 = [v3 decodeBoolForKey:@"hideSubtitle"];
  char v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"encodedTypedValue"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v14 = [v3 decodeObjectOfClasses:v13 forKey:@"serializedPossibleState"];

  uint64_t v15 = [(WFDialogListItem *)self initWithTitle:v21 subtitle:v22 identifier:v23 image:v4 selected:v20 hideSubtitle:v19 encodedTypedValue:v6 serializedPossibleState:v14];
  v16 = v15;
  if (v15)
  {
    [(WFDialogContentListItem *)v15 setArchivedContentItem:v5];
    uint64_t v17 = v16;
  }

  return v16;
}

- (WFDialogContentListItem)initWithContentItem:(id)a3 encodedTypedValue:(id)a4 selected:(BOOL)a5 hideSubtitle:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v11 richListTitle];
  LOBYTE(v15) = a6;
  id v13 = [(WFDialogContentListItem *)self initWithTitle:v12 subtitle:0 image:0 selected:v7 contentItem:v11 encodedTypedValue:v10 hideSubtitle:v15 serializedPossibleState:0];

  return v13;
}

- (WFDialogContentListItem)initWithContentItem:(id)a3 encodedTypedValue:(id)a4 selected:(BOOL)a5 serializedPossibleState:(id)a6
{
  BOOL v21 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v11 listItem];
  id v13 = [v12 title];
  id v14 = [v11 listItem];
  uint64_t v15 = [v14 subtitle];
  v16 = [v11 listItem];
  uint64_t v17 = [v16 image];
  LOBYTE(v20) = 0;
  v18 = [(WFDialogContentListItem *)self initWithTitle:v13 subtitle:v15 image:v17 selected:v21 contentItem:v11 encodedTypedValue:v10 hideSubtitle:v20 serializedPossibleState:v9];

  return v18;
}

- (WFDialogContentListItem)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 selected:(BOOL)a6 contentItem:(id)a7 encodedTypedValue:(id)a8 hideSubtitle:(BOOL)a9 serializedPossibleState:(id)a10
{
  BOOL v11 = a6;
  id v28 = a7;
  v16 = (void *)MEMORY[0x1E4F29128];
  id v17 = a10;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [v16 UUID];
  v23 = [v22 UUIDString];
  v29.receiver = self;
  v29.super_class = (Class)WFDialogContentListItem;
  v24 = [(WFDialogListItem *)&v29 initWithTitle:v21 subtitle:v20 identifier:v23 image:v19 selected:v11 hideSubtitle:a9 encodedTypedValue:v18 serializedPossibleState:v17];

  if (v24)
  {
    objc_storeStrong((id *)&v24->_contentItem, a7);
    v25 = v24;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end