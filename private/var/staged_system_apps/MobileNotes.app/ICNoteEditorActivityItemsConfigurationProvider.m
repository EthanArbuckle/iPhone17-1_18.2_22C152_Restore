@interface ICNoteEditorActivityItemsConfigurationProvider
- (ICNoteEditorActivityItemsConfigurationProvider)initWithDelegate:(id)a3;
- (ICNoteEditorActivityItemsConfigurationProviderDelegate)delegate;
- (id)activityItemsConfiguration;
- (void)setDelegate:(id)a3;
@end

@implementation ICNoteEditorActivityItemsConfigurationProvider

- (ICNoteEditorActivityItemsConfigurationProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteEditorActivityItemsConfigurationProvider;
  v5 = [(ICNoteEditorActivityItemsConfigurationProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)activityItemsConfiguration
{
  objc_opt_class();
  v3 = [(ICNoteEditorActivityItemsConfigurationProvider *)self delegate];
  id v4 = [v3 noteForActivityItemsConfiguration];
  v5 = ICDynamicCast();

  if ([v5 canBeSharedViaICloud])
  {
    uint64_t v6 = [v5 sharedRootObject];
    v7 = (void *)v6;
    if (v6) {
      objc_super v8 = (void *)v6;
    }
    else {
      objc_super v8 = v5;
    }
    id v9 = v8;

    id v10 = objc_alloc_init((Class)LPLinkMetadata);
    objc_opt_class();
    uint64_t v11 = ICDynamicCast();
    objc_opt_class();
    uint64_t v12 = ICDynamicCast();
    v13 = (void *)v12;
    if (v11 | v12)
    {
      v14 = &ICFolderNameMaxLength_ptr;
      v15 = &ICFolderNameMaxLength_ptr;
      if (v11)
      {
        v16 = [(id)v11 title];
        [v10 setTitle:v16];

        v17 = [(ICNoteEditorActivityItemsConfigurationProvider *)self delegate];
        uint64_t v18 = [v17 isDarkModeForActivityItemsConfiguration];

        v19 = +[ICAppearanceInfo appearanceInfoWithType:v18];
        id v20 = [objc_alloc((Class)ICThumbnailConfiguration) initForSharePreviewThumbnailWithNote:v11 appearanceInfo:v19];
        id v21 = objc_alloc_init((Class)NSItemProvider);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100037DF4;
        v38[3] = &unk_100625280;
        id v39 = v20;
        id v22 = v20;
        v15 = &ICFolderNameMaxLength_ptr;
        [v21 registerDataRepresentationForContentType:UTTypePNG visibility:0 loadHandler:v38];
        [v10 setImageProvider:v21];

        v14 = &ICFolderNameMaxLength_ptr;
      }
      else if (v12)
      {
        v24 = [(id)v12 title];
        [v10 setTitle:v24];

        id v25 = objc_alloc((Class)LPImage);
        v26 = +[ICCollaborationController shareSheetFolderThumbnailImage];
        id v27 = [v25 initWithPlatformImage:v26];
        [v10 setImage:v27];
      }
      id v28 = objc_alloc_init((Class)v15[476]);
      v29 = [v14[245] sharedInstance];
      [v29 registerShareForObject:v9 itemProvider:v28 generateThumbnails:0];

      id v30 = objc_alloc((Class)UIActivityItemsConfiguration);
      id v40 = v28;
      v31 = +[NSArray arrayWithObjects:&v40 count:1];
      id v23 = [v30 initWithItemProviders:v31];

      v32 = +[NSMutableDictionary dictionary];
      [v32 ic_setNonNilObject:v10 forNonNilKey:UIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata];
      v33 = [v10 title];
      [v32 ic_setNonNilObject:v33 forNonNilKey:UIActivityItemsConfigurationMetadataKeyTitle];

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100037F68;
      v36[3] = &unk_1006252A8;
      id v37 = v32;
      id v34 = v32;
      [v23 setMetadataProvider:v36];
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (ICNoteEditorActivityItemsConfigurationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteEditorActivityItemsConfigurationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end