@interface BKTOCWebViewCellLoadRequest
+ (BKTOCWebViewCellLoadRequest)loadRequestWithContents:(id)a3 template:(id)a4 fontFamily:(id)a5 fontSize:(double)a6 maxSpan:(double)a7 textColor:(id)a8 selectedColor:(id)a9 backgroundColor:(id)a10 baseURL:(id)a11 forObject:(id)a12;
+ (BKTOCWebViewCellLoadRequest)loadRequestWithHTML:(id)a3 maxSpan:(double)a4 selectedColor:(id)a5 baseURL:(id)a6 forObject:(id)a7;
+ (id)_generateCacheKey:(id)a3 maxSpan:(double)a4 baseURL:(id)a5;
- (AEMinimalTemplate)htmlTemplate;
- (BKTOCWebViewCellLoadDelegate)requester;
- (BKTOCWebViewCellLoadRequest)initWithHTML:(id)a3 maxSpan:(double)a4 selectedColor:(id)a5 baseURL:(id)a6 forObject:(id)a7;
- (NSString)cacheKey;
- (NSString)htmlContentString;
- (NSURL)baseURL;
- (UIColor)selectedColor;
- (double)span;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation BKTOCWebViewCellLoadRequest

+ (BKTOCWebViewCellLoadRequest)loadRequestWithHTML:(id)a3 maxSpan:(double)a4 selectedColor:(id)a5 baseURL:(id)a6 forObject:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [[BKTOCWebViewCellLoadRequest alloc] initWithHTML:v14 maxSpan:v13 selectedColor:v12 baseURL:v11 forObject:a4];

  return v15;
}

+ (BKTOCWebViewCellLoadRequest)loadRequestWithContents:(id)a3 template:(id)a4 fontFamily:(id)a5 fontSize:(double)a6 maxSpan:(double)a7 textColor:(id)a8 selectedColor:(id)a9 backgroundColor:(id)a10 baseURL:(id)a11 forObject:(id)a12
{
  id v19 = a3;
  id v20 = a5;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  id v24 = a10;
  id v25 = a4;
  v26 = [a8 bc_rgbaString];
  v27 = [v24 bc_rgbaString];

  v38[0] = @"contents";
  v38[1] = @"fontFamily";
  v36 = v19;
  v39[0] = v19;
  v39[1] = v20;
  v38[2] = @"fontSize";
  v28 = +[NSNumber numberWithDouble:a6];
  v39[2] = v28;
  v38[3] = @"maxSpan";
  v29 = +[NSNumber numberWithDouble:a7];
  v39[3] = v29;
  v39[4] = v26;
  v38[4] = @"textColor";
  v38[5] = @"backgroundColor";
  v39[5] = v27;
  v30 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:6];

  uint64_t v37 = 0;
  v31 = [v25 evaluateWithData:v30 error:&v37];

  uint64_t v32 = v37;
  if (v25)
  {
    if (!v37) {
      goto LABEL_3;
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    if (!v32) {
      goto LABEL_3;
    }
  }
  BCReportAssertionFailureWithMessage();
LABEL_3:
  v33 = [a1 loadRequestWithHTML:v31 maxSpan:v21 selectedColor:v22 baseURL:v23 forObject:a7];

  return (BKTOCWebViewCellLoadRequest *)v33;
}

- (NSString)cacheKey
{
  v3 = objc_opt_class();
  v4 = [(BKTOCWebViewCellLoadRequest *)self htmlContentString];
  [(BKTOCWebViewCellLoadRequest *)self span];
  double v6 = v5;
  v7 = [(BKTOCWebViewCellLoadRequest *)self baseURL];
  v8 = [v3 _generateCacheKey:v4 maxSpan:v7 baseURL:v6];

  return (NSString *)v8;
}

+ (id)_generateCacheKey:(id)a3 maxSpan:(double)a4 baseURL:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc((Class)NSString);
  v10 = +[NSNumber numberWithDouble:a4];
  id v11 = [v7 absoluteString];

  id v12 = [v9 initWithFormat:@"%@-%@-%@", v8, v10, v11];

  return v12;
}

- (BKTOCWebViewCellLoadRequest)initWithHTML:(id)a3 maxSpan:(double)a4 selectedColor:(id)a5 baseURL:(id)a6 forObject:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BKTOCWebViewCellLoadRequest;
  v16 = [(BKTOCWebViewCellLoadRequest *)&v22 init];
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    htmlContentString = v16->_htmlContentString;
    v16->_htmlContentString = v17;

    v16->_span = a4;
    objc_storeStrong((id *)&v16->_baseURL, a6);
    objc_storeWeak((id *)&v16->_requester, v15);
    if (v13)
    {
      id v19 = (UIColor *)v13;
    }
    else
    {
      id v19 = +[UIColor lightGrayColor];
    }
    selectedColor = v16->_selectedColor;
    v16->_selectedColor = v19;
  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(BKTOCWebViewCellLoadRequest *)self htmlContentString];
  [(BKTOCWebViewCellLoadRequest *)self span];
  double v6 = v5;
  id v7 = [(BKTOCWebViewCellLoadRequest *)self selectedColor];
  id v8 = [(BKTOCWebViewCellLoadRequest *)self baseURL];
  id v9 = [(BKTOCWebViewCellLoadRequest *)self requester];
  v10 = +[BKTOCWebViewCellLoadRequest loadRequestWithHTML:v4 maxSpan:v7 selectedColor:v8 baseURL:v9 forObject:v6];

  return v10;
}

- (NSString)htmlContentString
{
  return self->_htmlContentString;
}

- (AEMinimalTemplate)htmlTemplate
{
  return self->_htmlTemplate;
}

- (double)span
{
  return self->_span;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (BKTOCWebViewCellLoadDelegate)requester
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requester);

  return (BKTOCWebViewCellLoadDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requester);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_htmlTemplate, 0);

  objc_storeStrong((id *)&self->_htmlContentString, 0);
}

@end