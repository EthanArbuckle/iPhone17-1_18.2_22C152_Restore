@interface OABFillPropertiesManager
- (BOOL)isFilled;
- (BOOL)isStroked;
- (EshBlip)fillBlipDataReference;
- (EshColor)fillBgColor;
- (EshColor)fillFgColor;
- (EshColor)shadowColor;
- (EshColor)strokeBgColor;
- (EshColor)strokeFgColor;
- (OABFillPropertiesManager)initWithFill:(const EshFill *)a3 shapeType:(int)a4 masterShape:(EshShape *)a5;
- (const)fillGradientColors;
- (id)fillBlipName;
- (int)fillAngle;
- (int)fillBgAlpha;
- (int)fillFgAlpha;
- (int)fillFocus;
- (int)fillFocusBottom;
- (int)fillFocusLeft;
- (int)fillFocusRight;
- (int)fillFocusTop;
- (int)fillType;
- (unsigned)fillBlipID;
@end

@implementation OABFillPropertiesManager

- (OABFillPropertiesManager)initWithFill:(const EshFill *)a3 shapeType:(int)a4 masterShape:(EshShape *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)OABFillPropertiesManager;
  v8 = [(OABFillPropertiesManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->mFill = a3;
    v8->mShapeType = a4;
    if (a5) {
      v10 = [[OABShapeManager alloc] initWithShape:a5 masterShape:0];
    }
    else {
      v10 = objc_alloc_init(OABDefaultsManager);
    }
    mMasterManager = v9->mMasterManager;
    v9->mMasterManager = (OABPropertiesManager *)v10;
  }
  return v9;
}

- (int)fillType
{
  if (EshFill::isFillTypeSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getFillType(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillType];
  }
}

- (BOOL)isFilled
{
  if (EshFill::isOnSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    LOBYTE(isFillOn) = EshFill::getOn(mFill);
  }
  else
  {
    int isFillOn = EshShapeLib::isFillOn((EshShapeLib *)LOWORD(self->mShapeType), 1);
    if (isFillOn)
    {
      mMasterManager = self->mMasterManager;
      LOBYTE(isFillOn) = [(OABPropertiesManager *)mMasterManager isFilled];
    }
  }
  return isFillOn;
}

- (EshColor)fillFgColor
{
  v4 = v2;
  if (EshFill::isColorSet((EshFill *)self->mFill))
  {
    Color = (const EshColor *)EshFill::getColor((EshFill *)self->mFill);
    return (EshColor)EshColor::EshColor(v4, Color);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    if (mMasterManager)
    {
      return (EshColor)[(OABPropertiesManager *)mMasterManager fillFgColor];
    }
    else
    {
      EshColor *v4 = 0;
    }
  }
  return (EshColor)mMasterManager;
}

- (int)fillFgAlpha
{
  if (EshFill::isOpacitySet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getOpacity(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillFgAlpha];
  }
}

- (unsigned)fillBlipID
{
  if (EshFill::isBlipSet((EshFill *)self->mFill)
    && EshFill::isBlipId((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getBlipId(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillBlipID];
  }
}

- (id)fillBlipName
{
  if (EshFill::isBlipNameSet((EshFill *)self->mFill))
  {
    BlipName = EshFill::getBlipName((EshFill *)self->mFill);
    if (BlipName) {
      BlipName = (void *)[[NSString alloc] initWithCsString:BlipName];
    }
  }
  else
  {
    BlipName = [(OABPropertiesManager *)self->mMasterManager fillBlipName];
  }
  return BlipName;
}

- (EshBlip)fillBlipDataReference
{
  if (!EshFill::isBlipSet((EshFill *)self->mFill) || (EshFill::isBlipId((EshFill *)self->mFill) & 1) != 0) {
    return 0;
  }
  mFill = (EshFill *)self->mFill;
  return (EshBlip *)EshFill::getBlipRecordReference(mFill);
}

- (int)fillAngle
{
  if (EshFill::isAngleSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getAngle(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillAngle];
  }
}

- (int)fillFocus
{
  if (EshFill::isFocusSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getFocus(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillFocus];
  }
}

- (EshColor)fillBgColor
{
  v4 = v2;
  if (EshFill::isColor2Set((EshFill *)self->mFill))
  {
    Color2 = (const EshColor *)EshFill::getColor2((EshFill *)self->mFill);
    return (EshColor)EshColor::EshColor(v4, Color2);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    if (mMasterManager)
    {
      return (EshColor)[(OABPropertiesManager *)mMasterManager fillBgColor];
    }
    else
    {
      EshColor *v4 = 0;
    }
  }
  return (EshColor)mMasterManager;
}

- (const)fillGradientColors
{
  if (EshFill::isColorsSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getColors(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return (const void *)[(OABPropertiesManager *)mMasterManager fillGradientColors];
  }
}

- (int)fillBgAlpha
{
  if (EshFill::isOpacity2Set((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getOpacity2(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillBgAlpha];
  }
}

- (int)fillFocusLeft
{
  if (EshFill::isFocusLeftSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getFocusLeft(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillFocusLeft];
  }
}

- (int)fillFocusTop
{
  if (EshFill::isFocusTopSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getFocusTop(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillFocusTop];
  }
}

- (int)fillFocusRight
{
  if (EshFill::isFocusRightSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getFocusRight(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillFocusRight];
  }
}

- (int)fillFocusBottom
{
  if (EshFill::isFocusBottomSet((EshFill *)self->mFill))
  {
    mFill = (EshFill *)self->mFill;
    return EshFill::getFocusBottom(mFill);
  }
  else
  {
    mMasterManager = self->mMasterManager;
    return [(OABPropertiesManager *)mMasterManager fillFocusBottom];
  }
}

- (BOOL)isStroked
{
  return 0;
}

- (EshColor)strokeFgColor
{
  mMasterManager = self->mMasterManager;
  if (mMasterManager) {
    return (EshColor)[(OABPropertiesManager *)mMasterManager strokeFgColor];
  }
  else {
    void *v2 = 0;
  }
  return (EshColor)mMasterManager;
}

- (EshColor)strokeBgColor
{
  mMasterManager = self->mMasterManager;
  if (mMasterManager) {
    return (EshColor)[(OABPropertiesManager *)mMasterManager strokeBgColor];
  }
  else {
    void *v2 = 0;
  }
  return (EshColor)mMasterManager;
}

- (EshColor)shadowColor
{
  mMasterManager = self->mMasterManager;
  if (mMasterManager) {
    return (EshColor)[(OABPropertiesManager *)mMasterManager shadowColor];
  }
  else {
    void *v2 = 0;
  }
  return (EshColor)mMasterManager;
}

- (void).cxx_destruct
{
}

@end