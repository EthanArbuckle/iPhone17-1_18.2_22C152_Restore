@interface ActivityItemConfiguration
- (ActivityItemConfiguration)initWithInnerItemConfigurationProvider:(id)a3 additionalItemProviders:(id)a4;
- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3;
- (NSArray)applicationActivitiesForActivityItemsConfiguration;
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4;
- (id)activityItemsConfigurationMetadataForKey:(id)a3;
- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5;
@end

@implementation ActivityItemConfiguration

- (ActivityItemConfiguration)initWithInnerItemConfigurationProvider:(id)a3 additionalItemProviders:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ActivityItemConfiguration;
  v9 = [(ActivityItemConfiguration *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_innerProvider, a3);
    uint64_t v11 = [v8 copy];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v10->_additionalItemProviders, v13);

    v14 = v10;
  }

  return v10;
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  innerProvider = self->_innerProvider;
  if (innerProvider)
  {
    v4 = [(UIActivityItemsConfigurationReading *)innerProvider itemProvidersForActivityItemsConfiguration];
    self->_innerProviderItemCount = [v4 count];
    v5 = [v4 arrayByAddingObjectsFromArray:self->_additionalItemProviders];
  }
  else
  {
    v5 = self->_additionalItemProviders;
  }
  return v5;
}

- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(UIActivityItemsConfigurationReading *)self->_innerProvider activityItemsConfigurationSupportsInteraction:v4];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    char v5 = [(UIActivityItemsConfigurationReading *)self->_innerProvider activityItemsConfigurationMetadataForKey:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  id v6 = a4;
  if (self->_innerProviderItemCount > a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [(UIActivityItemsConfigurationReading *)self->_innerProvider activityItemsConfigurationMetadataForItemAtIndex:a3 key:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  if (self->_innerProviderItemCount > a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = -[UIActivityItemsConfigurationReading activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_innerProvider, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", a3, v9, width, height);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)applicationActivitiesForActivityItemsConfiguration
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(UIActivityItemsConfigurationReading *)self->_innerProvider applicationActivitiesForActivityItemsConfiguration];
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalItemProviders, 0);
  objc_storeStrong((id *)&self->_innerProvider, 0);
}

@end