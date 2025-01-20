@interface _PXVisualDiagnosticsDrawImageConfiguration
- (NSString)symbolName;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation _PXVisualDiagnosticsDrawImageConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_symbolName, 0);
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

@end