@interface BKTOCWebViewCellContent
+ (id)cellContentWithHeight:(double)a3 cacheKey:(id)a4;
- (NSString)cacheKey;
- (double)height;
- (void)setCacheKey:(id)a3;
- (void)setHeight:(double)a3;
@end

@implementation BKTOCWebViewCellContent

+ (id)cellContentWithHeight:(double)a3 cacheKey:(id)a4
{
  id v5 = a4;
  v6 = objc_opt_new();
  [v6 setHeight:a3];
  [v6 setCacheKey:v5];

  return v6;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end