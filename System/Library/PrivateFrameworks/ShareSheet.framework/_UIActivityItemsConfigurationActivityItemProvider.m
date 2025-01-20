@interface _UIActivityItemsConfigurationActivityItemProvider
+ (id)metadataForKey:(id)a3 expectedClass:(Class)a4 activityItemsConfiguration:(id)a5 itemAtSourceIndex:(int64_t)a6;
- (_UIActivityItemsConfigurationActivityItemProvider)initWithActivityItemsConfiguration:(id)a3 itemAtSourceIndex:(int64_t)a4;
- (id)_title;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerRecipients:(id)a3;
- (id)activityViewControllerShareRecipients:(id)a3;
- (id)item;
@end

@implementation _UIActivityItemsConfigurationActivityItemProvider

- (_UIActivityItemsConfigurationActivityItemProvider)initWithActivityItemsConfiguration:(id)a3 itemAtSourceIndex:(int64_t)a4
{
  id v7 = a3;
  v8 = +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:@"linkPresentationMetadata" expectedClass:getLPLinkMetadataClass_1() activityItemsConfiguration:v7 itemAtSourceIndex:a4];
  v9 = +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:@"collaborationModeRestrictions" expectedClass:objc_opt_class() activityItemsConfiguration:v7 itemAtSourceIndex:a4];
  v10 = [v7 itemProvidersForActivityItemsConfiguration];
  v11 = [v10 objectAtIndexedSubscript:a4];

  v15.receiver = self;
  v15.super_class = (Class)_UIActivityItemsConfigurationActivityItemProvider;
  v12 = [(UIActivityItemProvider *)&v15 initWithPlaceholderItem:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityItemsConfiguration, a3);
    objc_storeStrong(&v13->_item, v11);
    objc_storeStrong((id *)&v13->_linkMetadata, v8);
    objc_storeStrong((id *)&v13->_collaborationModeRestrictions, v9);
    v13->_sourceIndex = a4;
  }

  return v13;
}

- (id)item
{
  return self->_item;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_item;
}

- (id)_title
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(UIActivityItemsConfigurationReading *)self->_activityItemsConfiguration activityItemsConfigurationMetadataForItemAtIndex:self->_sourceIndex key:*MEMORY[0x1E4FB25F0]], (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_8;
    }
    v3 = [(UIActivityItemsConfigurationReading *)self->_activityItemsConfiguration activityItemsConfigurationMetadataForKey:*MEMORY[0x1E4FB25F0]];
    if (!v3) {
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 string];

    v3 = (void *)v4;
  }
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  if (dyld_program_sdk_at_least())
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(UIActivityItemsConfigurationReading *)self->_activityItemsConfiguration activityItemsConfigurationMetadataForKey:*MEMORY[0x1E4FB25F0]], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_opt_respondsToSelector())
      {
        v5 = [(UIActivityItemsConfigurationReading *)self->_activityItemsConfiguration activityItemsConfigurationMetadataForItemAtIndex:self->_sourceIndex key:*MEMORY[0x1E4FB25F0]];
        if (v5) {
          goto LABEL_6;
        }
      }
      else
      {
        v5 = 0;
      }
LABEL_10:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v5;
      }
      else {
        v8 = 0;
      }
      id v7 = v8;

      goto LABEL_14;
    }
LABEL_6:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 string];

      v5 = (void *)v6;
    }
    goto LABEL_10;
  }
  id v7 = [(_UIActivityItemsConfigurationActivityItemProvider *)self _title];
LABEL_14:
  return v7;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  linkMetadata = self->_linkMetadata;
  if (linkMetadata)
  {
    uint64_t v4 = linkMetadata;
  }
  else
  {
    uint64_t v4 = (LPLinkMetadata *)objc_alloc_init(getLPLinkMetadataClass_1());
    uint64_t v6 = [(_UIActivityItemsConfigurationActivityItemProvider *)self _title];
    [(LPLinkMetadata *)v4 setTitle:v6];

    if (objc_opt_respondsToSelector())
    {
      id v7 = -[UIActivityItemsConfigurationReading activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_activityItemsConfiguration, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", self->_sourceIndex, *MEMORY[0x1E4FB2600], 64.0, 64.0);
      [(LPLinkMetadata *)v4 setIconProvider:v7];

      v8 = -[UIActivityItemsConfigurationReading activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_activityItemsConfiguration, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", self->_sourceIndex, *MEMORY[0x1E4FB25F8], 512.0, 512.0);
      [(LPLinkMetadata *)v4 setImageProvider:v8];
    }
    v9 = [(LPLinkMetadata *)v4 title];
    if (v9
      || ([(LPLinkMetadata *)v4 iconProvider], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v11 = [(LPLinkMetadata *)v4 imageProvider];

      if (!v11)
      {

        uint64_t v4 = 0;
      }
    }
  }
  return v4;
}

- (id)activityViewControllerRecipients:(id)a3
{
  uint64_t v4 = objc_opt_class();
  activityItemsConfiguration = self->_activityItemsConfiguration;
  return +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:@"recipients" expectedClass:v4 activityItemsConfiguration:activityItemsConfiguration itemAtSourceIndex:0];
}

- (id)activityViewControllerShareRecipients:(id)a3
{
  uint64_t v4 = objc_opt_class();
  activityItemsConfiguration = self->_activityItemsConfiguration;
  return +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:@"shareRecipients" expectedClass:v4 activityItemsConfiguration:activityItemsConfiguration itemAtSourceIndex:0];
}

+ (id)metadataForKey:(id)a3 expectedClass:(Class)a4 activityItemsConfiguration:(id)a5 itemAtSourceIndex:(int64_t)a6
{
  id v8 = a3;
  id v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v9 activityItemsConfigurationMetadataForItemAtIndex:a6 key:v8],
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_opt_respondsToSelector())
    {
      v10 = [v9 activityItemsConfigurationMetadataForKey:v8];
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationModeRestrictions, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_activityItemsConfiguration, 0);
}

@end