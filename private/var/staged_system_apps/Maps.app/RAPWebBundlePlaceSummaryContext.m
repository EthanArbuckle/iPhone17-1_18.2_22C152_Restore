@interface RAPWebBundlePlaceSummaryContext
- (NSDictionary)context;
- (NSString)address;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (RAPWebBundleImageContext)imageContext;
- (void)setAddress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageContext:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RAPWebBundlePlaceSummaryContext

- (NSDictionary)context
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(RAPWebBundlePlaceSummaryContext *)self identifier];

  if (v4)
  {
    v5 = [(RAPWebBundlePlaceSummaryContext *)self identifier];
    [v3 setObject:v5 forKeyedSubscript:@"id"];
  }
  v6 = [(RAPWebBundlePlaceSummaryContext *)self title];

  if (v6)
  {
    v7 = [(RAPWebBundlePlaceSummaryContext *)self title];
    [v3 setObject:v7 forKeyedSubscript:@"title"];
  }
  v8 = [(RAPWebBundlePlaceSummaryContext *)self subtitle];

  if (v8)
  {
    v9 = [(RAPWebBundlePlaceSummaryContext *)self subtitle];
    [v3 setObject:v9 forKeyedSubscript:@"subtitle"];
  }
  v10 = [(RAPWebBundlePlaceSummaryContext *)self address];

  if (v10)
  {
    v11 = [(RAPWebBundlePlaceSummaryContext *)self address];
    [v3 setObject:v11 forKeyedSubscript:@"formattedAddress"];
  }
  v12 = [(RAPWebBundlePlaceSummaryContext *)self imageContext];

  if (v12)
  {
    v13 = [(RAPWebBundlePlaceSummaryContext *)self imageContext];
    v14 = [v13 context];
    [v3 addEntriesFromDictionary:v14];
  }
  id v15 = [v3 copy];

  return (NSDictionary *)v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (RAPWebBundleImageContext)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end