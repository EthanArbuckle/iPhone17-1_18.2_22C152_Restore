@interface PFXDefPath
- (void)end;
@end

@implementation PFXDefPath

- (void)end
{
  v3 = (xmlChar *)PFXBezierPathWithSvgPath((const xmlChar *)[(PFXSvgElement *)self xmlValueForAttributeName:"d"]);
  v4 = [(PFXSvgElement *)self xmlValueForAttributeName:"transform"];
  if (v4 && *v4)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
    PFXAffineTransformWithSvgTransform(v4, &v6);
    v5[0] = v6;
    v5[1] = v7;
    v5[2] = v8;
    [(xmlChar *)v3 transformUsingAffineTransform:v5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PFXSvgElement *)self->super.mParent setBezierPath:v3];
    -[PFXSvgElement setFilled:](self->super.mParent, "setFilled:", objc_msgSend(-[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "fill"), "isEqualToString:", @"none") ^ 1);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PFXSvgElement *)self->super.mParent setBezierPath:v3];
    }
  }
}

@end