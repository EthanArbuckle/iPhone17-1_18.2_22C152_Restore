@interface SUUIProductPage
- (NSArray)relatedContentSwooshes;
- (NSData)ITMLData;
- (NSHTTPURLResponse)ITMLResponse;
- (NSString)metricsPageDescription;
- (NSURL)pageURL;
- (SSMetricsConfiguration)metricsConfiguration;
- (SUUIProductPageItem)item;
- (SUUIProductPageProductInfo)productInformation;
- (SUUIReviewConfiguration)reviewConfiguration;
- (SUUIUber)uber;
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

@implementation SUUIProductPage

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setDefaultPageFragment:self->_defaultPageFragment];
  [v4 setItem:self->_item];
  [v4 setITMLData:self->_itmlData];
  [v4 setITMLResponse:self->_itmlResponse];
  [v4 setMetricsConfiguration:self->_metricsConfiguration];
  [v4 setMetricsPageDescription:self->_metricsPageDescription];
  [v4 setPageURL:self->_pageURL];
  [v4 setProductInformation:self->_productInformation];
  [v4 setRelatedContentSwooshes:self->_relatedContentSwooshes];
  [v4 setReviewConfiguration:self->_reviewConfiguration];
  [v4 setUber:self->_uber];
  return v4;
}

- (int64_t)defaultPageFragment
{
  return self->_defaultPageFragment;
}

- (void)setDefaultPageFragment:(int64_t)a3
{
  self->_defaultPageFragment = a3;
}

- (SUUIProductPageItem)item
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

- (SUUIProductPageProductInfo)productInformation
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

- (SUUIReviewConfiguration)reviewConfiguration
{
  return self->_reviewConfiguration;
}

- (void)setReviewConfiguration:(id)a3
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

@end