@interface SKUIProductPage
- (NSArray)relatedContentSwooshes;
- (NSData)ITMLData;
- (NSHTTPURLResponse)ITMLResponse;
- (NSString)metricsPageDescription;
- (NSURL)pageURL;
- (SKUIProductPageItem)item;
- (SKUIProductPageProductInfo)productInformation;
- (SKUIReviewConfiguration)reviewConfiguration;
- (SKUIUber)uber;
- (SSMetricsConfiguration)metricsConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)defaultPageFragment;
- (void)setDefaultPageFragment:(int64_t)a3;
- (void)setITMLData:(id)a3;
- (void)setITMLResponse:(id)a3;
- (void)setItem:(id)a3;
- (void)setMetricsConfiguration:(id)a3;
- (void)setMetricsPageDescription:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setProductInformation:(id)a3;
- (void)setRelatedContentSwooshes:(id)a3;
- (void)setReviewConfiguration:(id)a3;
- (void)setUber:(id)a3;
@end

@implementation SKUIProductPage

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPage copyWithZone:]();
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setDefaultPageFragment:self->_defaultPageFragment];
  [v5 setItem:self->_item];
  [v5 setITMLData:self->_itmlData];
  [v5 setITMLResponse:self->_itmlResponse];
  [v5 setMetricsConfiguration:self->_metricsConfiguration];
  [v5 setMetricsPageDescription:self->_metricsPageDescription];
  [v5 setPageURL:self->_pageURL];
  [v5 setProductInformation:self->_productInformation];
  [v5 setRelatedContentSwooshes:self->_relatedContentSwooshes];
  [v5 setReviewConfiguration:self->_reviewConfiguration];
  [v5 setUber:self->_uber];
  return v5;
}

- (int64_t)defaultPageFragment
{
  return self->_defaultPageFragment;
}

- (void)setDefaultPageFragment:(int64_t)a3
{
  self->_defaultPageFragment = a3;
}

- (SKUIProductPageItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
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

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
}

- (SKUIProductPageProductInfo)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
}

- (NSArray)relatedContentSwooshes
{
  return self->_relatedContentSwooshes;
}

- (void)setRelatedContentSwooshes:(id)a3
{
}

- (SKUIReviewConfiguration)reviewConfiguration
{
  return self->_reviewConfiguration;
}

- (void)setReviewConfiguration:(id)a3
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
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedContentSwooshes, 0);
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_metricsPageDescription, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_itmlResponse, 0);
  objc_storeStrong((id *)&self->_itmlData, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)copyWithZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPage copyWithZone:]";
}

@end