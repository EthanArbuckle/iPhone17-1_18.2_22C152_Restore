@interface OUConfiguration
- (BOOL)enable3DOR;
- (BOOL)enableMLRefinement;
- (BOOL)enableRgbRefinement;
- (OUConfiguration)init;
- (OUConfiguration)initWithframerate:(float)a3 enable3DOR:(BOOL)a4 rgbRefinemnt:(BOOL)a5 mlRefinement:(BOOL)a6;
- (float)maxFramerate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnable3DOR:(BOOL)a3;
- (void)setEnableMLRefinement:(BOOL)a3;
- (void)setEnableRgbRefinement:(BOOL)a3;
- (void)setMaxFramerate:(float)a3;
@end

@implementation OUConfiguration

- (OUConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)OUConfiguration;
  result = [(OUConfiguration *)&v3 init];
  if (result)
  {
    result->maxFramerate = 2.0;
    *(_WORD *)&result->enable3DOR = 257;
    result->enableMLRefinement = 0;
  }
  return result;
}

- (OUConfiguration)initWithframerate:(float)a3 enable3DOR:(BOOL)a4 rgbRefinemnt:(BOOL)a5 mlRefinement:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)OUConfiguration;
  result = [(OUConfiguration *)&v11 init];
  if (result)
  {
    result->maxFramerate = a3;
    result->enable3DOR = a4;
    result->enableRgbRefinement = a5;
    result->enableMLRefinement = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->maxFramerate);
  *((unsigned char *)result + 8) = self->enable3DOR;
  *((unsigned char *)result + 9) = self->enableRgbRefinement;
  *((unsigned char *)result + 10) = self->enableMLRefinement;
  return result;
}

- (BOOL)enable3DOR
{
  return self->enable3DOR;
}

- (void)setEnable3DOR:(BOOL)a3
{
  self->enable3DOR = a3;
}

- (BOOL)enableRgbRefinement
{
  return self->enableRgbRefinement;
}

- (void)setEnableRgbRefinement:(BOOL)a3
{
  self->enableRgbRefinement = a3;
}

- (BOOL)enableMLRefinement
{
  return self->enableMLRefinement;
}

- (void)setEnableMLRefinement:(BOOL)a3
{
  self->enableMLRefinement = a3;
}

- (float)maxFramerate
{
  return self->maxFramerate;
}

- (void)setMaxFramerate:(float)a3
{
  self->maxFramerate = a3;
}

@end