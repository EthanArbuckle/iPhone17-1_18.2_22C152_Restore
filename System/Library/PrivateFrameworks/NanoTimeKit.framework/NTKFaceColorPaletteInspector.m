@interface NTKFaceColorPaletteInspector
- (BOOL)isTritium;
- (NSBundle)bundleLocation;
- (NSString)domain;
- (NSString)fallbackMethodName;
- (NSString)pathLocation;
- (NSString)pigmentName;
- (NSString)propertyName;
- (UIColor)color;
- (id)description;
- (void)setBundleLocation:(id)a3;
- (void)setColor:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFallbackMethodName:(id)a3;
- (void)setIsTritium:(BOOL)a3;
- (void)setPathLocation:(id)a3;
- (void)setPigmentName:(id)a3;
- (void)setPropertyName:(id)a3;
@end

@implementation NTKFaceColorPaletteInspector

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (self->_isTritium) {
    v4 = @" - tritium";
  }
  else {
    v4 = &stru_1F1635E90;
  }
  v5 = (void *)[v3 initWithFormat:@"[%@ - %@ - %@%@] ", *(_OWORD *)&self->_domain, self->_propertyName, v4];
  color = self->_color;
  if (color)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      [(UIColor *)self->_color getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
      color = [NSString stringWithFormat:@"[%.3f, %.3f, %.3f, %.2f]", v16, v15, v14, v13];
    }
    else
    {
      color = 0;
    }
  }
  pathLocation = self->_pathLocation;
  if (pathLocation)
  {
    v8 = [(NSBundle *)self->_bundleLocation bundlePath];
    v9 = objc_msgSend(v8, "ntk_extractFileName");
    [v5 appendFormat:@"%@ %@: %@", pathLocation, v9, color];
  }
  else if (self->_fallbackMethodName)
  {
    [v5 appendFormat:@"%@: %@", self->_fallbackMethodName, color];
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", @"NOT FOUND", v11, v12);
  }

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)pigmentName
{
  return self->_pigmentName;
}

- (void)setPigmentName:(id)a3
{
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (void)setPropertyName:(id)a3
{
}

- (NSBundle)bundleLocation
{
  return self->_bundleLocation;
}

- (void)setBundleLocation:(id)a3
{
}

- (NSString)pathLocation
{
  return self->_pathLocation;
}

- (void)setPathLocation:(id)a3
{
}

- (NSString)fallbackMethodName
{
  return self->_fallbackMethodName;
}

- (void)setFallbackMethodName:(id)a3
{
}

- (BOOL)isTritium
{
  return self->_isTritium;
}

- (void)setIsTritium:(BOOL)a3
{
  self->_isTritium = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fallbackMethodName, 0);
  objc_storeStrong((id *)&self->_pathLocation, 0);
  objc_storeStrong((id *)&self->_bundleLocation, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_pigmentName, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end