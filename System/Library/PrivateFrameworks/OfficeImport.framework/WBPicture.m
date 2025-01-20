@interface WBPicture
+ (id)readDrawableFromReader:(id)a3 textType:(int)a4;
+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 to:(id)a7;
@end

@implementation WBPicture

+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 to:(id)a7
{
  id v71 = a3;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    var4 = a5->var4;
    var5 = a5->var5;
    v18 = [WDCharacterProperties alloc];
    v19 = [v14 document];
    uint64_t v70 = [(WDCharacterProperties *)v18 initWithDocument:v19];

    v20 = [v14 document];
    +[WBCharacterProperties readFrom:v71 wrdProperties:var4 tracked:var5 document:v20 properties:v70];

    [v15 setProperties:v70];
    uint64_t v21 = [v14 textType];
    WrdPictureProperties::WrdPictureProperties((WrdPictureProperties *)v74);
    int var1 = a5->var1;
    int v75 = a4;
    int v76 = var1;
    uint64_t v23 = [v71 wrdReader];
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v23 + 416))(v23, v74);
    v24 = 0;
    switch(v77)
    {
      case 'b':
        v72 = &unk_26EBE6820;
        CsString::CsString((CsString *)&v73);
        uint64_t v25 = [v71 wrdReader];
        (*(void (**)(uint64_t, void **))(*(void *)v25 + 432))(v25, &v72);
        v72 = &unk_26EBE6820;
        CsString::~CsString((CsString *)&v73);
        v24 = 0;
        break;
      case 'c':
        break;
      case 'd':
        v24 = [a1 readDrawableFromReader:v71 textType:v21];
        if (v24) {
          goto LABEL_9;
        }
        break;
      case 'f':
        v72 = &unk_26EBE6820;
        CsString::CsString((CsString *)&v73);
        uint64_t v26 = [v71 wrdReader];
        (*(void (**)(uint64_t, void **))(*(void *)v26 + 432))(v26, &v72);
        v24 = [a1 readDrawableFromReader:v71 textType:v21];
        v72 = &unk_26EBE6820;
        CsString::~CsString((CsString *)&v73);
        if (v24) {
          goto LABEL_9;
        }
        break;
      default:
        v72 = &unk_26EBE67E0;
        OcBinaryData::OcBinaryData(&v73);
        uint64_t v27 = [v71 wrdReader];
        (*(void (**)(uint64_t, void **))(*(void *)v27 + 424))(v27, &v72);
        v28 = [ESDBlipContext alloc];
        v68 = [(ESDBlipContext *)v28 initWithOffset:v73.var1 byteCount:v73.var3 stream:v73.var7 streamID:v73.var2];
        v69 = [[OADSubBlip alloc] initWithData:0 type:4];
        [(OCDDelayedNode *)v69 setDelayedContext:v68];
        v29 = objc_alloc_init(OADBlip);
        [(OADBlip *)v29 setMainSubBlip:v69];
        v30 = [[OADBlipRef alloc] initWithIndex:0 name:0 blip:v29];
        v31 = objc_alloc_init(OADImageFill);
        [(OADImageFill *)v31 setBlipRef:v30];
        v24 = objc_alloc_init(OADImage);
        v32 = [(OADImage *)v24 imageProperties];
        [v32 setImageFill:v31];

        v33 = objc_alloc_init(WDAContent);
        [(OADDrawable *)v24 setClientData:v33];
        [(WDAContent *)v33 setDrawable:v24];
        [(WDAContent *)v33 setTextType:v21];

        v72 = &unk_26EBE67E0;
        OcBinaryData::~OcBinaryData(&v73);
        if (v24)
        {
LABEL_9:
          v34 = [(OADDrawable *)v24 clientData];
          [v15 setDrawable:v24];
          [v34 setTextType:a5->var1];
        }
        break;
    }
    int v35 = v78;
    int v36 = v79;
    int v37 = v80;
    int v38 = v81;
    LOWORD(v8) = v82;
    LOWORD(v7) = v83;
    v39 = [(OADDrawable *)v24 drawableProperties];
    v40 = [v39 orientedBounds];
    [v40 rotation];
    BOOL v41 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
    float v42 = (double)v35 / 20.0;
    float v43 = (double)v36 / 20.0;
    float v44 = (double)v37 / 20.0;
    float v45 = (double)v38 / 20.0;
    double v46 = v42;
    double v47 = v43;
    double v48 = (float)((float)(v44 * (float)v8) / 1000.0);
    double v49 = (float)((float)(v45 * (float)v7) / 1000.0);

    if (v41)
    {
      double v46 = NSTransposedRectWithSameCenter(v46, v47, v48, v49);
      double v47 = v50;
      double v48 = v51;
      double v49 = v52;
    }
    v53 = [(OADDrawable *)v24 drawableProperties];
    v54 = [v53 orientedBounds];
    objc_msgSend(v54, "setBounds:", v46, v47, v48, v49);

    uint64_t v55 = objc_opt_class();
    v56 = TSUDynamicCast(v55, (uint64_t)v24);
    v57 = v56;
    v58 = (void *)v70;
    if (!v56) {
      goto LABEL_25;
    }
    v59 = [v56 graphicProperties];
    if ([v59 hasStroke])
    {
      v60 = [v59 stroke];
      if ([v60 isFillOverridden])
      {
        v61 = [v60 fill];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_23;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_23;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_23;
        }
      }
    }
    uint64_t Border = WrdPictureProperties::getBorder(v74, 0);
    uint64_t v63 = Border;
    if (!*(_DWORD *)(Border + 16) || !*(unsigned char *)(Border + 25)) {
      goto LABEL_24;
    }
    v60 = objc_opt_new();
    v61 = objc_opt_new();
    v64 = +[OITSUColor colorWithCsColour:v63 + 8];
    v65 = +[OADRgbColor rgbColorWithTSUColor:v64];

    [v61 setColor:v65];
    [v60 setFill:v61];
    LOBYTE(v66) = *(unsigned char *)(v63 + 25);
    double v67 = (double)v66 * 0.125;
    *(float *)&double v67 = v67;
    [v60 setWidth:v67];
    [v59 setStroke:v60];

    v58 = (void *)v70;
LABEL_23:

LABEL_24:
LABEL_25:

    WrdPictureProperties::~WrdPictureProperties((WrdPictureProperties *)v74);
  }
}

+ (id)readDrawableFromReader:(id)a3 textType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [[WBOfficeArtReaderState alloc] initWithClient:objc_opt_class()];
  [(WBOfficeArtReaderState *)v6 setCurrentTextType:v4];
  unsigned int v7 = [v5 officeArtState];
  [v5 setOfficeArtState:v6];
  int v31 = 4;
  unsigned int v8 = +[WBEscher readRootWithType:&v31 reader:v5];
  v9 = v8;
  if (v8 && [v8 childCount])
  {
    v10 = [v9 childAt:0];
    v11 = [v5 officeArtState];
    v12 = +[OABDrawable readDrawableFromObject:v10 state:v11];

    v30 = [v9 childAt:0];
    v13 = (const void *)[v30 eshObject];
    if (v13)
    {
      if (v14)
      {
        uint64_t v15 = 0;
        uint64_t v16 = (uint64_t)v14 + 16;
        v17 = v9;
        v28 = v7;
        while (1)
        {
          unsigned int v18 = dword_238EEED34[v15];
          if (EshOpt::isPropertySet(v16, v18))
          {
            if (*(unsigned char *)EshOpt::getProperty(v16, v18) && *((_DWORD *)EshOpt::getProperty(v16, v18) + 2)) {
              break;
            }
          }
          v9 = v17;
LABEL_18:
          ++v15;
          v17 = v9;
          if (v15 == 3) {
            goto LABEL_36;
          }
        }
        int v31 = 5;
        v9 = +[WBEscher readRootWithType:&v31 reader:v5];

        if (!v9 || ![v9 childCount]) {
          goto LABEL_18;
        }
        v19 = [v9 childAt:0];
        uint64_t v20 = [v19 eshObject];
        if ((*(unsigned int (**)(uint64_t))(*(void *)v20 + 16))(v20) != 61447)
        {
LABEL_34:

          goto LABEL_18;
        }
        v29 = +[OABBlip readBlipFromBse:v19];
        switch(v15)
        {
          case 2:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              uint64_t v21 = [v12 graphicProperties];
              uint64_t v26 = [v21 stroke];
              uint64_t v23 = [v26 fill];

LABEL_25:
              goto LABEL_27;
            }
            break;
          case 1:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              uint64_t v21 = [v12 graphicProperties];
              uint64_t v22 = [v21 fill];
              goto LABEL_24;
            }
            break;
          case 0:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              uint64_t v21 = [v12 imageProperties];
              uint64_t v22 = [v21 imageFill];
LABEL_24:
              uint64_t v23 = (void *)v22;
              goto LABEL_25;
            }
            break;
        }
        uint64_t v23 = 0;
LABEL_27:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [v23 blipRef];
          [v24 setBlip:v29];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_33;
          }
          v24 = [v23 pattern];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = [v24 blipRef];
            [v27 setBlip:v29];
          }
        }

LABEL_33:
        unsigned int v7 = v28;
        goto LABEL_34;
      }
    }
LABEL_36:
  }
  else
  {
    v12 = 0;
  }
  [v5 setOfficeArtState:v7];

  return v12;
}

@end