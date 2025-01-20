@interface PFXDefImage
- (void)end;
@end

@implementation PFXDefImage

- (void)end
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[PFXCommon absolutePathWithUrl:[(PFXSvgElement *)self valueForAttributeName:"href"] relativeToFile:[(PFXSvgDefsDocument *)self->super.mDocument entryPath]];
    mParent = self->super.mParent;
    [(PFXSvgElement *)mParent setImageHref:v3];
  }
}

@end