@interface FPImage
@end

@implementation FPImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerPath, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end