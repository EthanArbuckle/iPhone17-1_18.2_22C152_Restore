@interface SKUIStorePage
- (NSArray)pageComponents;
- (NSData)ITMLData;
- (NSHTTPURLResponse)ITMLResponse;
- (NSString)metricsPageDescription;
- (NSString)pageType;
- (NSString)title;
- (NSURL)pageURL;
- (SKUIArtwork)backgroundArtwork;
- (SKUIProductPage)productPage;
- (SKUIUber)uber;
- (SSMetricsConfiguration)metricsConfiguration;
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

@implementation SKUIStorePage

- (void)setPageComponents:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStorePage setPageComponents:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_pageComponents != v4)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = v4;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "metricsElementName", (void)v23);
          if (v20)
          {
            objc_msgSend(v19, "_setMetricsLocationPosition:", objc_msgSend(v13, "countForObject:", v20));
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    v21 = (NSArray *)[(NSArray *)v14 copy];
    pageComponents = self->_pageComponents;
    self->_pageComponents = v21;
  }
}

- (void)setValue:(id)a3 forPageKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIStorePage setValue:forPageKey:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  values = self->_values;
  if (v6)
  {
    if (!values)
    {
      uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18 = self->_values;
      self->_values = v17;

      values = self->_values;
    }
    [(NSMutableDictionary *)values setObject:v6 forKey:v7];
  }
  else
  {
    [(NSMutableDictionary *)values removeObjectForKey:v7];
  }
}

- (id)valueForPageKey:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStorePage valueForPageKey:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_values objectForKey:v4];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStorePage copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v13 setBackgroundArtwork:self->_backgroundArtwork];
  [v13 setITMLData:self->_itmlData];
  [v13 setITMLResponse:self->_itmlResponse];
  [v13 setMetricsConfiguration:self->_metricsConfiguration];
  [v13 setMetricsPageDescription:self->_metricsPageDescription];
  uint64_t v14 = [(NSArray *)self->_pageComponents copyWithZone:a3];
  uint64_t v15 = (void *)v13[6];
  v13[6] = v14;

  [v13 setPageType:self->_pageType];
  [v13 setPageURL:self->_pageURL];
  [v13 setProductPage:self->_productPage];
  [v13 setTitle:self->_title];
  [v13 setUber:self->_uber];
  uint64_t v16 = [(NSMutableDictionary *)self->_values mutableCopyWithZone:a3];
  uint64_t v17 = (void *)v13[12];
  v13[12] = v16;

  return v13;
}

- (SKUIArtwork)backgroundArtwork
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

- (SKUIProductPage)productPage
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

- (SKUIUber)uber
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

- (void)setPageComponents:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setValue:(uint64_t)a3 forPageKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)valueForPageKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end