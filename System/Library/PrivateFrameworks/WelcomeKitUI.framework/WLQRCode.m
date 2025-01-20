@interface WLQRCode
- (NSString)code;
- (NSString)name;
- (NSString)title;
- (NSString)url;
- (WLQRCode)initWithName:(id)a3 title:(id)a4 URL:(id)a5 code:(id)a6;
- (id)createQRCodeImage:(double)a3;
- (void)setCode:(id)a3;
- (void)setName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation WLQRCode

- (WLQRCode)initWithName:(id)a3 title:(id)a4 URL:(id)a5 code:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WLQRCode;
  v14 = [(WLQRCode *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(WLQRCode *)v14 setName:v10];
    [(WLQRCode *)v15 setTitle:v11];
    [(WLQRCode *)v15 setUrl:v12];
    [(WLQRCode *)v15 setCode:v13];
  }

  return v15;
}

- (id)createQRCodeImage:(double)a3
{
  v4 = [(NSString *)self->_url dataUsingEncoding:4];
  v5 = [MEMORY[0x263F00640] filterWithName:@"CIQRCodeGenerator"];
  [v5 setValue:v4 forKey:@"inputMessage"];
  [v5 setValue:@"H" forKey:@"inputCorrectionLevel"];
  v6 = [v5 outputImage];
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = v8;

  [v6 extent];
  CGFloat v11 = v9 * (a3 / v10);
  [v6 extent];
  CGAffineTransformMakeScale(&v16, v11, v9 * (a3 / v12));
  id v13 = [v6 imageByApplyingTransform:&v16];

  v14 = [MEMORY[0x263F827E8] imageWithCIImage:v13 scale:0 orientation:v9];

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end