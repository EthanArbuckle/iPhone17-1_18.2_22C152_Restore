@interface OABShapeBaseManager
- (BOOL)isShadowed;
- (BOOL)isStroked;
- (EshBlip)strokeFillBlipDataReference;
- (EshColor)shadowColor;
- (EshColor)strokeBgColor;
- (EshColor)strokeFgColor;
- (OABShapeBaseManager)initWithShapeBase:(void *)a3 shapeType:(int)a4 masterShape:(EshShape *)a5;
- (const)strokeCustomDash;
- (id)strokeFillBlipName;
- (int)shadowAlpha;
- (int)shadowOffsetX;
- (int)shadowOffsetY;
- (int)shadowSoftness;
- (int)shadowType;
- (int)strokeCapStyle;
- (int)strokeCompoundType;
- (int)strokeEndArrowLength;
- (int)strokeEndArrowType;
- (int)strokeEndArrowWidth;
- (int)strokeFgAlpha;
- (int)strokeFillType;
- (int)strokeJoinStyle;
- (int)strokeMiterLimit;
- (int)strokePresetDash;
- (int)strokeStartArrowLength;
- (int)strokeStartArrowType;
- (int)strokeStartArrowWidth;
- (int)strokeWidth;
- (unsigned)strokeFillBlipID;
@end

@implementation OABShapeBaseManager

- (OABShapeBaseManager)initWithShapeBase:(void *)a3 shapeType:(int)a4 masterShape:(EshShape *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)OABShapeBaseManager;
  result = [(OABFillPropertiesManager *)&v7 initWithFill:(char *)a3 + 296 shapeType:*(void *)&a4 masterShape:a5];
  if (result) {
    result->mShapeBase = a3;
  }
  return result;
}

- (EshColor)strokeFgColor
{
  v4 = v2;
  if (EshStroke::isColorSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    Color = (const EshColor *)EshStroke::getColor((EshStroke *)((char *)self->mShapeBase + 320));
    return (EshColor)EshColor::EshColor(v4, Color);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    if (mMasterManager)
    {
      return (EshColor)[(OABPropertiesManager *)mMasterManager strokeFgColor];
    }
    else
    {
      EshColor *v4 = 0;
    }
  }
  return (EshColor)mMasterManager;
}

- (int)strokeFgAlpha
{
  if (EshStroke::isOpacitySet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getOpacity(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeFgAlpha];
  }
}

- (BOOL)isStroked
{
  if (EshStroke::isOnSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    LOBYTE(isStrokeOn) = EshStroke::getOn(v3);
  }
  else
  {
    int isStrokeOn = EshShapeLib::isStrokeOn((EshShapeLib *)LOWORD(self->super.mShapeType), 1);
    if (isStrokeOn)
    {
      mMasterManager = self->super.mMasterManager;
      LOBYTE(isStrokeOn) = [(OABPropertiesManager *)mMasterManager isStroked];
    }
  }
  return isStrokeOn;
}

- (int)strokeFillType
{
  if (EshStroke::isFillTypeSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getFillType(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeFillType];
  }
}

- (const)strokeCustomDash
{
  if (EshStroke::isDashStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getDashStyle(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return (const void *)[(OABPropertiesManager *)mMasterManager strokeCustomDash];
  }
}

- (int)strokePresetDash
{
  if (EshStroke::isPredefDashStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getPredefDashStyle(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokePresetDash];
  }
}

- (int)strokeJoinStyle
{
  if (EshStroke::isJoinStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getJoinStyle(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeJoinStyle];
  }
}

- (int)strokeStartArrowType
{
  if (EshStroke::isStartArrowSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getStartArrow(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeStartArrowType];
  }
}

- (int)strokeStartArrowWidth
{
  if (EshStroke::isStartArrowWidthSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getStartArrowWidth(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeStartArrowWidth];
  }
}

- (int)strokeStartArrowLength
{
  if (EshStroke::isStartArrowLengthSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getStartArrowLength(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeStartArrowLength];
  }
}

- (int)strokeEndArrowType
{
  if (EshStroke::isEndArrowSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getEndArrow(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeEndArrowType];
  }
}

- (int)strokeEndArrowWidth
{
  if (EshStroke::isEndArrowWidthSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getEndArrowWidth(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeEndArrowWidth];
  }
}

- (int)strokeEndArrowLength
{
  if (EshStroke::isEndArrowLengthSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getEndArrowLength(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeEndArrowLength];
  }
}

- (int)strokeWidth
{
  if (EshStroke::isWeightSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getWeight(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeWidth];
  }
}

- (int)strokeCapStyle
{
  if (EshStroke::isCapStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getCapStyle(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeCapStyle];
  }
}

- (int)strokeCompoundType
{
  if (EshStroke::isLineStyleSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getLineStyle(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeCompoundType];
  }
}

- (BOOL)isShadowed
{
  if (EshShadow::isOnSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    v3 = (EshShadow *)((char *)self->mShapeBase + 344);
    return EshShadow::getOn(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager isShadowed];
  }
}

- (EshColor)shadowColor
{
  v4 = v2;
  if (EshShadow::isColorSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    Color = (const EshColor *)EshShadow::getColor((EshShadow *)((char *)self->mShapeBase + 344));
    return (EshColor)EshColor::EshColor(v4, Color);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    if (mMasterManager)
    {
      return (EshColor)[(OABPropertiesManager *)mMasterManager shadowColor];
    }
    else
    {
      EshColor *v4 = 0;
    }
  }
  return (EshColor)mMasterManager;
}

- (int)shadowAlpha
{
  if (EshShadow::isOpacitySet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    v3 = (EshShadow *)((char *)self->mShapeBase + 344);
    return EshShadow::getOpacity(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager shadowAlpha];
  }
}

- (int)shadowSoftness
{
  if (EshShadow::isSoftnessSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    v3 = (EshShadow *)((char *)self->mShapeBase + 344);
    return EshShadow::getSoftness(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager shadowSoftness];
  }
}

- (int)shadowOffsetX
{
  if (EshShadow::isOffsetXSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    v3 = (EshShadow *)((char *)self->mShapeBase + 344);
    return EshShadow::getOffsetX(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager shadowOffsetX];
  }
}

- (int)shadowOffsetY
{
  if (EshShadow::isOffsetYSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    v3 = (EshShadow *)((char *)self->mShapeBase + 344);
    return EshShadow::getOffsetY(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager shadowOffsetY];
  }
}

- (int)shadowType
{
  if (EshShadow::isShadowTypeSet((EshShadow *)((char *)self->mShapeBase + 344)))
  {
    v3 = (EshShadow *)((char *)self->mShapeBase + 344);
    return EshShadow::getShadowType(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager shadowType];
  }
}

- (int)strokeMiterLimit
{
  if (EshStroke::isMiterLimitSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getMiterLimit(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeMiterLimit];
  }
}

- (unsigned)strokeFillBlipID
{
  if (EshStroke::isBlipSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    v3 = (EshStroke *)((char *)self->mShapeBase + 320);
    return EshStroke::getBlipId(v3);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return [(OABPropertiesManager *)mMasterManager strokeFillBlipID];
  }
}

- (id)strokeFillBlipName
{
  if (EshStroke::isBlipNameSet((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    BlipName = EshStroke::getBlipName((EshStroke *)((char *)self->mShapeBase + 320));
    if (BlipName) {
      BlipName = (void *)[[NSString alloc] initWithCsString:BlipName];
    }
  }
  else
  {
    BlipName = [(OABPropertiesManager *)self->super.mMasterManager strokeFillBlipName];
  }
  return BlipName;
}

- (EshColor)strokeBgColor
{
  v4 = v2;
  if (EshStroke::isColor2Set((EshStroke *)((char *)self->mShapeBase + 320)))
  {
    Color2 = (const EshColor *)EshStroke::getColor2((EshStroke *)((char *)self->mShapeBase + 320));
    return (EshColor)EshColor::EshColor(v4, Color2);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    if (mMasterManager)
    {
      return (EshColor)[(OABPropertiesManager *)mMasterManager strokeBgColor];
    }
    else
    {
      EshColor *v4 = 0;
    }
  }
  return (EshColor)mMasterManager;
}

- (EshBlip)strokeFillBlipDataReference
{
  if (EshStroke::isBlipSet((EshStroke *)((char *)self->mShapeBase + 320))
    && (EshStroke::isBlipId((EshStroke *)((char *)self->mShapeBase + 320)) & 1) == 0)
  {
    v5 = (EshStroke *)((char *)self->mShapeBase + 320);
    return (EshBlip *)EshStroke::getBlipRecordReference(v5);
  }
  else
  {
    mMasterManager = self->super.mMasterManager;
    return (EshBlip *)[(OABPropertiesManager *)mMasterManager strokeFillBlipDataReference];
  }
}

@end