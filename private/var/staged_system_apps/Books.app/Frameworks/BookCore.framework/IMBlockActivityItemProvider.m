@interface IMBlockActivityItemProvider
- (IMBlockActivityItemProvider)initWithUTI:(id)a3 resolutionBlock:(id)a4;
- (NSArray)supportedActivityTypes;
- (NSString)UTI;
- (NSString)activityType;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)resolutionBlock;
- (void)setActivityType:(id)a3;
- (void)setResolutionBlock:(id)a3;
- (void)setSupportedActivityTypes:(id)a3;
- (void)setUTI:(id)a3;
@end

@implementation IMBlockActivityItemProvider

- (IMBlockActivityItemProvider)initWithUTI:(id)a3 resolutionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IMBlockActivityItemProvider *)self init];
  if (v8)
  {
    id v9 = [v7 copy];
    id resolutionBlock = v8->_resolutionBlock;
    v8->_id resolutionBlock = v9;

    v11 = (NSString *)[v6 copy];
    UTI = v8->_UTI;
    v8->_UTI = v11;
  }
  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v4 = [(IMBlockActivityItemProvider *)self UTI];
  unsigned __int8 v5 = [v4 isEqualToString:@"public.plain-text"];

  if (v5)
  {
    id v6 = @"kBKBlockActivityItemProviderTextPlaceholder";
  }
  else
  {
    id v7 = [(IMBlockActivityItemProvider *)self UTI];
    unsigned int v8 = [v7 isEqualToString:@"public.image"];

    if (v8)
    {
      id v6 = (__CFString *)objc_alloc_init((Class)UIImage);
    }
    else
    {
      id v9 = [(IMBlockActivityItemProvider *)self UTI];
      unsigned int v10 = [v9 isEqualToString:@"public.url"];

      if (v10)
      {
        id v6 = +[NSURL URLWithString:@"kBKBlockActivityItemProviderURLPlaceholder"];
      }
      else
      {
        id v6 = 0;
      }
    }
  }

  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  id v6 = [(IMBlockActivityItemProvider *)self resolutionBlock];

  if (v6
    && ([(IMBlockActivityItemProvider *)self supportedActivityTypes],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 containsObject:v5],
        v7,
        v8))
  {
    id v9 = [(IMBlockActivityItemProvider *)self resolutionBlock];
    unsigned int v10 = ((void (**)(void, id))v9)[2](v9, v5);
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (void)setUTI:(id)a3
{
}

- (id)resolutionBlock
{
  return self->_resolutionBlock;
}

- (void)setResolutionBlock:(id)a3
{
}

- (NSArray)supportedActivityTypes
{
  return self->_supportedActivityTypes;
}

- (void)setSupportedActivityTypes:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_supportedActivityTypes, 0);
  objc_storeStrong(&self->_resolutionBlock, 0);

  objc_storeStrong((id *)&self->_UTI, 0);
}

@end