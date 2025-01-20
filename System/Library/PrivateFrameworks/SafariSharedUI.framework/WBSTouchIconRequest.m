@interface WBSTouchIconRequest
+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6;
+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 monogramConfiguration:(id)a7 options:(unint64_t)a8;
+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 options:(unint64_t)a7;
- (BOOL)isEqual:(id)a3;
- (CGSize)maximumIconSize;
- (CGSize)minimumIconSize;
- (CGSize)sizeForDrawing;
- (NSString)monogramTitle;
- (NSString)uniqueIdentifier;
- (WBSTemplateIconMonogramConfiguration)monogramConfiguration;
- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6;
- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 monogramConfiguration:(id)a7 options:(unint64_t)a8;
- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 options:(unint64_t)a7;
- (unint64_t)hash;
- (unint64_t)options;
@end

@implementation WBSTouchIconRequest

- (unint64_t)hash
{
  v2 = [(WBSSiteMetadataRequest *)self url];
  v3 = [v2 host];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (WBSTouchIconRequest *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(WBSSiteMetadataRequest *)self url];
      v9 = [v8 host];

      v10 = [(WBSSiteMetadataRequest *)v7 url];
      v11 = [v10 host];

      if ((v9 == v11 || [v9 isEqualToString:v11])
        && ((monogramTitle = self->_monogramTitle, monogramTitle == v7->_monogramTitle)
         || -[NSString isEqualToString:](monogramTitle, "isEqualToString:"))
        && (self->_minimumIconSize.width == v7->_minimumIconSize.width
          ? (BOOL v13 = self->_minimumIconSize.height == v7->_minimumIconSize.height)
          : (BOOL v13 = 0),
            v13
         && (self->_maximumIconSize.width == v7->_maximumIconSize.width
           ? (BOOL v14 = self->_maximumIconSize.height == v7->_maximumIconSize.height)
           : (BOOL v14 = 0),
             v14 && ((v7->_options ^ self->_options) & 0xFFFFFFFFFFFFFFFDLL) == 0)))
      {
        char v6 = WBSIsEqual();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (CGSize)minimumIconSize
{
  double width = self->_minimumIconSize.width;
  double height = self->_minimumIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (WBSTemplateIconMonogramConfiguration)monogramConfiguration
{
  return self->_monogramConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramTitle, 0);
  objc_storeStrong((id *)&self->_monogramConfiguration, 0);
}

- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 monogramConfiguration:(id)a7 options:(unint64_t)a8
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v12 = a5.height;
  CGFloat v13 = a5.width;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  if ((objc_msgSend(v17, "safari_isHTTPFamilyURL") & 1) == 0)
  {

    id v17 = 0;
  }
  v25.receiver = self;
  v25.super_class = (Class)WBSTouchIconRequest;
  v19 = [(WBSSiteMetadataRequest *)&v25 initWithURL:v17 extraInfo:0];
  v20 = v19;
  if (v19)
  {
    v19->_minimumIconSize.CGFloat width = v13;
    v19->_minimumIconSize.CGFloat height = v12;
    v19->_maximumIconSize.CGFloat width = width;
    v19->_maximumIconSize.CGFloat height = height;
    uint64_t v21 = [v16 copy];
    monogramTitle = v20->_monogramTitle;
    v20->_monogramTitle = (NSString *)v21;

    objc_storeStrong((id *)&v20->_monogramConfiguration, a7);
    v20->_options = a8;
    v23 = v20;
  }

  return v20;
}

+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:url:minimumIconSize:maximumIconSize:", v13, v12, v9, v8, width, height);

  return v14;
}

- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6
{
  return -[WBSTouchIconRequest initWithTitle:url:minimumIconSize:maximumIconSize:options:](self, "initWithTitle:url:minimumIconSize:maximumIconSize:options:", a3, a4, 3, a5.width, a5.height, a6.width, a6.height);
}

+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 options:(unint64_t)a7
{
  double height = a6.height;
  double width = a6.width;
  double v10 = a5.height;
  double v11 = a5.width;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:url:minimumIconSize:maximumIconSize:options:", v15, v14, a7, v11, v10, width, height);

  return v16;
}

- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 options:(unint64_t)a7
{
  return -[WBSTouchIconRequest initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:](self, "initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:", a3, a4, 0, a7, a5.width, a5.height, a6.width, a6.height);
}

+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 monogramConfiguration:(id)a7 options:(unint64_t)a8
{
  double height = a6.height;
  double width = a6.width;
  double v11 = a5.height;
  double v12 = a5.width;
  id v16 = a7;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:", v18, v17, v16, a8, v12, v11, width, height);

  return v19;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- (CGSize)sizeForDrawing
{
  double width = self->_maximumIconSize.width;
  double height = self->_maximumIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maximumIconSize
{
  double width = self->_maximumIconSize.width;
  double height = self->_maximumIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)monogramTitle
{
  return self->_monogramTitle;
}

@end