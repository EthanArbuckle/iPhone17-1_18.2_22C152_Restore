@interface OABShapeManager
- (BOOL)hidden;
- (BOOL)isFillOK;
- (BOOL)isFilled;
- (BOOL)isShadowOK;
- (BOOL)isShadowed;
- (BOOL)isStrokeOK;
- (BOOL)isStroked;
- (BOOL)isTextPath;
- (BOOL)textPathBold;
- (BOOL)textPathItalic;
- (BOOL)textPathSmallcaps;
- (BOOL)textPathStrikethrough;
- (BOOL)textPathUnderline;
- (OABShapeManager)initWithShape:(void *)a3;
- (OABShapeManager)initWithShape:(void *)a3 masterShape:(void *)a4;
- (id)textPathFontFamily;
- (id)textPathUnicodeString;
- (int)textPathFontSize;
- (int)textPathTextAlignment;
@end

@implementation OABShapeManager

- (OABShapeManager)initWithShape:(void *)a3 masterShape:(void *)a4
{
  uint64_t ShapeType = EshShapeProperties::getShapeType((EshShapeProperties *)((char *)a3 + 424));
  v9.receiver = self;
  v9.super_class = (Class)OABShapeManager;
  result = [(OABShapeBaseManager *)&v9 initWithShapeBase:a3 shapeType:ShapeType masterShape:a4];
  if (result) {
    result->mShape = a3;
  }
  return result;
}

- (BOOL)isFilled
{
  v5.receiver = self;
  v5.super_class = (Class)OABShapeManager;
  BOOL v3 = [(OABFillPropertiesManager *)&v5 isFilled];
  if (v3) {
    LOBYTE(v3) = [(OABShapeManager *)self isFillOK];
  }
  return v3;
}

- (BOOL)isTextPath
{
  if (EshTextPath::isOnSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getOn(v3);
  }
  else if (EshShapeLib::isWordArt((EshShapeLib *)LOWORD(self->super.super.mShapeType)))
  {
    return 1;
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager isTextPath];
  }
}

- (BOOL)isStroked
{
  v5.receiver = self;
  v5.super_class = (Class)OABShapeManager;
  BOOL v3 = [(OABShapeBaseManager *)&v5 isStroked];
  if (v3) {
    LOBYTE(v3) = [(OABShapeManager *)self isStrokeOK];
  }
  return v3;
}

- (BOOL)isShadowed
{
  v5.receiver = self;
  v5.super_class = (Class)OABShapeManager;
  BOOL v3 = [(OABShapeBaseManager *)&v5 isShadowed];
  if (v3) {
    LOBYTE(v3) = [(OABShapeManager *)self isShadowOK];
  }
  return v3;
}

- (BOOL)hidden
{
  if (EshShapeProperties::isHiddenSet((EshShapeProperties *)((char *)self->mShape + 424)))
  {
    BOOL v3 = (EshShapeProperties *)((char *)self->mShape + 424);
    return EshShapeProperties::getHidden(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager hidden];
  }
}

- (BOOL)isStrokeOK
{
  if (EshPath::isStrokeOKSet((EshPath *)self->mShape + 22))
  {
    BOOL v3 = (EshPath *)((char *)self->mShape + 528);
    LOBYTE(isStrokeOK) = EshPath::getStrokeOK(v3);
  }
  else
  {
    int isStrokeOK = EshShapeLib::isStrokeOK((EshShapeLib *)LOWORD(self->super.super.mShapeType), 1);
    if (isStrokeOK)
    {
      mMasterManager = self->super.super.mMasterManager;
      LOBYTE(isStrokeOK) = [(OABPropertiesManager *)mMasterManager isStrokeOK];
    }
  }
  return isStrokeOK;
}

- (BOOL)isFillOK
{
  if (EshPath::isFillOKSet((EshPath *)self->mShape + 22))
  {
    BOOL v3 = (EshPath *)((char *)self->mShape + 528);
    LOBYTE(isFillOK) = EshPath::getFillOK(v3);
  }
  else
  {
    int isFillOK = EshShapeLib::isFillOK((EshShapeLib *)LOWORD(self->super.super.mShapeType), 1);
    if (isFillOK)
    {
      mMasterManager = self->super.super.mMasterManager;
      LOBYTE(isFillOK) = [(OABPropertiesManager *)mMasterManager isFillOK];
    }
  }
  return isFillOK;
}

- (BOOL)isShadowOK
{
  if (EshPath::isShadowOKSet((EshPath *)self->mShape + 22))
  {
    BOOL v3 = (EshPath *)((char *)self->mShape + 528);
    LOBYTE(isShadowOK) = EshPath::getShadowOK(v3);
  }
  else
  {
    int isShadowOK = EshShapeLib::isShadowOK((EshShapeLib *)LOWORD(self->super.super.mShapeType), 1);
    if (isShadowOK)
    {
      mMasterManager = self->super.super.mMasterManager;
      LOBYTE(isShadowOK) = [(OABPropertiesManager *)mMasterManager isShadowOK];
    }
  }
  return isShadowOK;
}

- (int)textPathTextAlignment
{
  if (EshTextPath::isAlignSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getAlign(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathTextAlignment];
  }
}

- (id)textPathUnicodeString
{
  if (EshTextPath::isStringSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    String = EshTextPath::getString((EshTextPath *)((char *)self->mShape + 504));
    if (String) {
      String = (void *)[[NSString alloc] initWithCsString:String];
    }
  }
  else
  {
    String = [(OABPropertiesManager *)self->super.super.mMasterManager textPathUnicodeString];
  }
  return String;
}

- (id)textPathFontFamily
{
  if (EshTextPath::isFontSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    Font = EshTextPath::getFont((EshTextPath *)((char *)self->mShape + 504));
    if (Font) {
      Font = (void *)[[NSString alloc] initWithCsString:Font];
    }
  }
  else
  {
    Font = [(OABPropertiesManager *)self->super.super.mMasterManager textPathFontFamily];
  }
  return Font;
}

- (int)textPathFontSize
{
  if (EshTextPath::isSizeSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getSize(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathFontSize];
  }
}

- (BOOL)textPathBold
{
  if (EshTextPath::isBoldSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getBold(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathBold];
  }
}

- (BOOL)textPathItalic
{
  if (EshTextPath::isItalicSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getItalic(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathItalic];
  }
}

- (BOOL)textPathSmallcaps
{
  if (EshTextPath::isSmallcapsSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getSmallcaps(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathSmallcaps];
  }
}

- (OABShapeManager)initWithShape:(void *)a3
{
  return [(OABShapeManager *)self initWithShape:a3 masterShape:0];
}

- (BOOL)textPathUnderline
{
  if (EshTextPath::isUnderlineSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getUnderline(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathUnderline];
  }
}

- (BOOL)textPathStrikethrough
{
  if (EshTextPath::isStrikethroughSet((EshTextPath *)((char *)self->mShape + 504)))
  {
    BOOL v3 = (EshTextPath *)((char *)self->mShape + 504);
    return EshTextPath::getStrikethrough(v3);
  }
  else
  {
    mMasterManager = self->super.super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager textPathStrikethrough];
  }
}

@end