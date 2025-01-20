@interface OABImage
+ (void)readfromShape:(id)a3 toImage:(id)a4 state:(id)a5;
@end

@implementation OABImage

+ (void)readfromShape:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v48 = a5;
  v49 = [v8 imageProperties];
  v9 = objc_alloc_init(OADImageFill);
  uint64_t v10 = [v7 eshShape];
  v11 = (EshShapeImageData *)(v10 + 480);
  isBlipSet = (EshFill *)EshShapeImageData::isBlipSet((EshShapeImageData *)(v10 + 480));
  if (isBlipSet)
  {
    isBlipSet = (EshFill *)EshShapeImageData::getBlipId(v11);
    v13 = isBlipSet;
  }
  else
  {
    v13 = 0;
  }
  DefaultBlipName = (uint64_t *)EshFill::getDefaultBlipName(isBlipSet);
  if (EshShapeImageData::isBlipNameSet(v11)) {
    DefaultBlipName = EshShapeImageData::getBlipName(v11);
  }
  if (DefaultBlipName && *((_DWORD *)DefaultBlipName + 4)) {
    v15 = (void *)[[NSString alloc] initWithCsString:DefaultBlipName];
  }
  else {
    v15 = 0;
  }
  v16 = objc_alloc_init(OADStretchTechnique);
  if (v13)
  {
    v17 = [[OADBlipRef alloc] initWithIndex:v13 name:v15 blip:0];
    if ((EshShapeImageData::isCropTopSet(v11) & 1) != 0
      || (EshShapeImageData::isCropBottomSet(v11) & 1) != 0
      || (EshShapeImageData::isCropLeftSet(v11) & 1) != 0
      || EshShapeImageData::isCropRightSet(v11))
    {
      v18 = objc_alloc_init(OADRelativeRect);
      if (EshShapeImageData::isCropTopSet(v11))
      {
        CropTop = (EshFixedPointUtil *)EshShapeImageData::getCropTop(v11);
        *(float *)&double v20 = EshFixedPointUtil::toFloat(CropTop);
        [(OADRelativeRect *)v18 setTop:v20];
      }
      if (EshShapeImageData::isCropBottomSet(v11))
      {
        CropBottom = (EshFixedPointUtil *)EshShapeImageData::getCropBottom(v11);
        *(float *)&double v22 = EshFixedPointUtil::toFloat(CropBottom);
        [(OADRelativeRect *)v18 setBottom:v22];
      }
      if (EshShapeImageData::isCropLeftSet(v11))
      {
        CropLeft = (EshFixedPointUtil *)EshShapeImageData::getCropLeft(v11);
        *(float *)&double v24 = EshFixedPointUtil::toFloat(CropLeft);
        [(OADRelativeRect *)v18 setLeft:v24];
      }
      if (EshShapeImageData::isCropRightSet(v11))
      {
        CropRight = (EshFixedPointUtil *)EshShapeImageData::getCropRight(v11);
        *(float *)&double v26 = EshFixedPointUtil::toFloat(CropRight);
        [(OADRelativeRect *)v18 setRight:v26];
      }
      [(OADImageFill *)v9 setSourceRect:v18];
    }
    if ((EshShapeImageData::isGainSet(v11) & 1) != 0 || EshShapeImageData::isBlackLevelSet(v11))
    {
      v27 = objc_alloc_init(OADLuminanceEffect);
      if (EshShapeImageData::isGainSet(v11))
      {
        Gain = (EshFixedPointUtil *)EshShapeImageData::getGain(v11);
        *(float *)&double v29 = EshFixedPointUtil::toFloat(Gain);
        if (*(float *)&v29 <= 1.0) {
          *(float *)&double v29 = *(float *)&v29 + -1.0;
        }
        else {
          *(float *)&double v29 = 1.0 - (float)(1.0 / *(float *)&v29);
        }
        [(OADLuminanceEffect *)v27 setContrast:v29];
      }
      if (EshShapeImageData::isBlackLevelSet(v11))
      {
        BlackLevel = (EshFixedPointUtil *)EshShapeImageData::getBlackLevel(v11);
        float v31 = EshFixedPointUtil::toFloat(BlackLevel);
        *(float *)&double v32 = v31 + v31;
        [(OADLuminanceEffect *)v27 setBrightness:v32];
      }
      [(OADBlipRef *)v17 addEffect:v27];
    }
    if (EshShapeImageData::isGrayScaleSet(v11) && EshShapeImageData::getGrayScale(v11))
    {
      v33 = objc_alloc_init(OADGrayscaleEffect);
      [(OADBlipRef *)v17 addEffect:v33];
    }
    if (EshShapeImageData::isBilevelSet(v11) && EshShapeImageData::getBilevel(v11))
    {
      v34 = objc_alloc_init(OADBiLevelEffect);
      LODWORD(v35) = 0.5;
      [(OADBiLevelEffect *)v34 setThreshold:v35];
      [(OADBlipRef *)v17 addEffect:v34];
    }
    if (EshShapeImageData::isChromakeySet(v11))
    {
      id v47 = v7;
      Chromakey = (const EshColor *)EshShapeImageData::getChromakey(v11);
      EshColor::EshColor(&v52, Chromakey);
      EshColor::EshColor(&v51, &v52);
      LODWORD(v37) = 1.0;
      v38 = +[OABShapeProperties targetColorWithSourceColor:&v51 alpha:0 colorPropertiesManager:v48 state:v37];
      EshColor::EshColor(&v50, &v52);
      v39 = +[OABShapeProperties targetColorWithSourceColor:&v50 alpha:0 colorPropertiesManager:v48 state:0.0];
      v40 = objc_alloc_init(OADColorChangeEffect);
      [(OADColorChangeEffect *)v40 setFromColor:v38];
      [(OADColorChangeEffect *)v40 setToColor:v39];
      [(OADBlipRef *)v17 addEffect:v40];

      id v7 = v47;
    }
    if (EshFill::isOpacitySet((EshFill *)(v10 + 296)))
    {
      v41 = objc_alloc_init(OADAlphaModFixEffect);
      Opacity = (EshFixedPointUtil *)EshFill::getOpacity((EshFill *)(v10 + 296));
      *(float *)&double v43 = EshFixedPointUtil::toFloat(Opacity);
      [(OADAlphaModFixEffect *)v41 setAlpha:v43];
      [(OADBlipRef *)v17 addEffect:v41];
    }
    -[OADImageFill setBlipRef:](v9, "setBlipRef:", v17, v47);
  }
  [(OADImageFill *)v9 setTechnique:v16];
  [v49 setImageFill:v9];
  if (EshShapeImageData::isQuicktimeDataSet(v11))
  {
    QuicktimeData = EshShapeImageData::getQuicktimeData(v11);
    if (QuicktimeData)
    {
      if (*(_DWORD *)QuicktimeData)
      {
        v45 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:QuicktimeData[1] length:*(unsigned int *)QuicktimeData];
        v46 = objc_alloc_init(OADQTStubFile);
        [(OADMovie *)v46 setName:v15];
        [(OADMovie *)v46 setData:v45];
        [(OCDDelayedNode *)v46 setLoaded:1];
        [v8 setMovie:v46];
      }
    }
  }
}

@end