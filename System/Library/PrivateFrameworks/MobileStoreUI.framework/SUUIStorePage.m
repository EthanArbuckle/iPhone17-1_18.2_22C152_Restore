@interface SUUIStorePage
- (NSArray)pageComponents;
- (NSData)ITMLData;
- (NSHTTPURLResponse)ITMLResponse;
- (NSString)metricsPageDescription;
- (NSString)pageType;
- (NSString)title;
- (NSURL)pageURL;
- (SSMetricsConfiguration)metricsConfiguration;
- (SUUIArtwork)backgroundArtwork;
- (SUUIProductPage)productPage;
- (SUUIUber)uber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForPageKey:(id)a3;
- (void)setBackgroundArtwork:(id)a3;
- (void)setITMLData:(id)a3;
- (void)setITMLResponse:(id)a3;
- (void)setMetricsConfiguration:(id)a3;
- (void)setMetricsPageDescription:(id)a3;
- (void)setPageComponents:(id)a3;
- (void)setPageType:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setProductPage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUber:(id)a3;
- (void)setValue:(id)a3 forPageKey:(id)a4;
@end

@implementation SUUIStorePage

- (void)setPageComponents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = (NSArray *)a3;
  if (self->_pageComponents != v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08760]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "metricsElementName", (void)v15);
          if (v12)
          {
            objc_msgSend(v11, "_setMetricsLocationPosition:", objc_msgSend(v5, "countForObject:", v12));
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v13 = (NSArray *)[(NSArray *)v6 copy];
    pageComponents = self->_pageComponents;
    self->_pageComponents = v13;
  }
}

- (void)setValue:(id)a3 forPageKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  values = self->_values;
  if (v12)
  {
    if (!values)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v11 = self->_values;
      self->_values = v10;

      id v7 = v12;
      values = self->_values;
    }
    [(NSMutableDictionary *)values setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)values removeObjectForKey:v8];
  }
}

- (id)valueForPageKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_values objectForKey:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setBackgroundArtwork:self->_backgroundArtwork];
  [v5 setITMLData:self->_itmlData];
  [v5 setITMLResponse:self->_itmlResponse];
  [v5 setMetricsConfiguration:self->_metricsConfiguration];
  [v5 setMetricsPageDescription:self->_metricsPageDescription];
  uint64_t v6 = [(NSArray *)self->_pageComponents copyWithZone:a3];
  id v7 = (void *)v5[6];
  v5[6] = v6;

  [v5 setPageType:self->_pageType];
  [v5 setPageURL:self->_pageURL];
  [v5 setProductPage:self->_productPage];
  [v5 setTitle:self->_title];
  [v5 setUber:self->_uber];
  uint64_t v8 = [(NSMutableDictionary *)self->_values mutableCopyWithZone:a3];
  uint64_t v9 = (void *)v5[12];
  v5[12] = v8;

  return v5;
}

- (SUUIArtwork)backgroundArtwork
{
  return self->_backgroundArtwork;
}

- (void)setBackgroundArtwork:(id)a3
{
}

- (NSData)ITMLData
{
  return self->_itmlData;
}

- (void)setITMLData:(id)a3
{
}

- (NSHTTPURLResponse)ITMLResponse
{
  return self->_itmlResponse;
}

- (void)setITMLResponse:(id)a3
{
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (void)setMetricsConfiguration:(id)a3
{
}

- (NSString)metricsPageDescription
{
  return self->_metricsPageDescription;
}

- (void)setMetricsPageDescription:(id)a3
{
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void)setProductPage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (SUUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);
  objc_storeStrong((id *)&self->_metricsPageDescription, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_itmlResponse, 0);
  objc_storeStrong((id *)&self->_itmlData, 0);
  objc_storeStrong((id *)&self->_backgroundArtwork, 0);
}

@end