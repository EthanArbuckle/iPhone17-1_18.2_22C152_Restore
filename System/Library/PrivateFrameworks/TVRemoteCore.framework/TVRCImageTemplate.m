@interface TVRCImageTemplate
+ (id)imageTemplateWithString:(id)a3;
- (NSString)templateString;
- (TVRCImageTemplate)initWithString:(id)a3;
- (id)urlForSize:(CGSize)a3;
@end

@implementation TVRCImageTemplate

+ (id)imageTemplateWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (TVRCImageTemplate)initWithString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCImageTemplate;
  v6 = [(TVRCImageTemplate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateString, a3);
  }

  return v7;
}

- (id)urlForSize:(CGSize)a3
{
  unint64_t height = (unint64_t)a3.height;
  id v5 = NSString;
  v6 = [NSNumber numberWithUnsignedInteger:(unint64_t)a3.width];
  v7 = [v5 stringWithFormat:@"%@", v6];

  v8 = NSString;
  objc_super v9 = [NSNumber numberWithUnsignedInteger:height];
  v10 = [v8 stringWithFormat:@"%@", v9];

  v11 = [(TVRCImageTemplate *)self templateString];
  v12 = [v11 stringByReplacingOccurrencesOfString:@"{w}" withString:v7];

  v13 = [v12 stringByReplacingOccurrencesOfString:@"{h}" withString:v10];

  v14 = [v13 stringByReplacingOccurrencesOfString:@"{f}" withString:@"jpg"];

  v15 = [NSURL URLWithString:v14];

  return v15;
}

- (NSString)templateString
{
  return self->_templateString;
}

- (void).cxx_destruct
{
}

@end