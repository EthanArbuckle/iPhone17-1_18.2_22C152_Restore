@interface OAVImage
+ (void)readFromManager:(id)a3 toImage:(id)a4 state:(id)a5;
@end

@implementation OAVImage

+ (void)readFromManager:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v58 = a3;
  id v7 = a4;
  id v8 = a5;
  v47 = v8;
  v48 = v7;
  v51 = [v7 imageProperties];
  v9 = objc_alloc_init(OADImageFill);
  v46 = v9;
  v53 = [v58 imageRelId];
  v10 = [v58 packagePart];
  v11 = [v10 relationshipForIdentifier:v53];

  v52 = v11;
  if ([v11 targetMode])
  {
    v12 = [OADBlipRef alloc];
    v13 = [v11 targetLocation];
    v14 = [v13 relativeString];
    v57 = [(OADBlipRef *)v12 initWithIndex:0 name:v14 blip:0];
  }
  else
  {
    v13 = [v11 targetLocation];
    v57 = [v8 blipRefForURL:v13];
  }

  v15 = (_xmlNode *)[v58 shape];
  v16 = (_xmlNode *)OCXFindChild(v15, (CXNamespace *)OAVOfficeMainNamespace, "imagedata");
  v50 = objc_alloc_init(OADStretchTechnique);
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"cropleft", 0);
  v49 = (NSString *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"croptop", 0);
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"cropright", 0);
  v55 = (NSString *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"cropbottom", 0);
  v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v49 || v56 || v55 || v54)
  {
    v17 = objc_alloc_init(OADRelativeRect);
    if (v49)
    {
      *(float *)&double v18 = OAVReadFraction(v49);
      [(OADRelativeRect *)v17 setLeft:v18];
    }
    if (v55)
    {
      *(float *)&double v19 = OAVReadFraction(v55);
      [(OADRelativeRect *)v17 setRight:v19];
    }
    if (v56)
    {
      *(float *)&double v20 = OAVReadFraction(v56);
      [(OADRelativeRect *)v17 setTop:v20];
    }
    if (v54)
    {
      *(float *)&double v21 = OAVReadFraction(v54);
      [(OADRelativeRect *)v17 setBottom:v21];
    }
    [(OADImageFill *)v9 setSourceRect:v17];
  }
  uint64_t v22 = CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"gain", 0);
  uint64_t v23 = CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"blacklevel", 0);
  if (v22 | v23)
  {
    v24 = objc_alloc_init(OADLuminanceEffect);
    if (v22)
    {
      *(float *)&double v25 = OAVReadFraction((NSString *)v22);
      if (*(float *)&v25 <= 1.0) {
        *(float *)&double v25 = *(float *)&v25 + -1.0;
      }
      else {
        *(float *)&double v25 = 1.0 - (float)(1.0 / *(float *)&v25);
      }
      [(OADLuminanceEffect *)v24 setContrast:v25];
    }
    if (v23)
    {
      float v26 = OAVReadFraction((NSString *)v23);
      *(float *)&double v27 = v26 + v26;
      [(OADLuminanceEffect *)v24 setBrightness:v27];
    }
    [(OADBlipRef *)v57 addEffect:v24];
  }
  if (CXDefaultBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"grayscale", 0))
  {
    v28 = objc_alloc_init(OADGrayscaleEffect);
    [(OADBlipRef *)v57 addEffect:v28];
  }
  if (CXDefaultBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"bilevel", 0))
  {
    v29 = objc_alloc_init(OADBiLevelEffect);
    LODWORD(v30) = 0.5;
    [(OADBiLevelEffect *)v29 setThreshold:v30];
    [(OADBlipRef *)v57 addEffect:v29];
  }
  v31 = CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"chromakey", 0);
  if (v31)
  {
    LODWORD(v32) = 1.0;
    v33 = +[OAVColor readColorFromAttribute:v31 alpha:0 manager:v32];
    v34 = +[OAVColor readColorFromAttribute:v31 alpha:0 manager:0.0];
    v35 = objc_alloc_init(OADColorChangeEffect);
    [(OADColorChangeEffect *)v35 setFromColor:v33];
    [(OADColorChangeEffect *)v35 setToColor:v34];
    [(OADBlipRef *)v57 addEffect:v35];
  }
  v36 = [v58 movieRelId];
  if (v36)
  {
    v37 = [v58 packagePart];
    v38 = [v37 relationshipForIdentifier:v36];

    if (v38 && ![v38 targetMode])
    {
      v45 = objc_alloc_init(OADQTStubFile);
      v39 = [OAXMovieContext alloc];
      v44 = [v38 targetLocation];
      v40 = [v58 packagePart];
      v41 = [v40 package];
      v42 = [(OCXDelayedMediaContext *)v39 initWithTargetLocation:v44 package:v41];

      [(OCDDelayedNode *)v45 setDelayedContext:v42];
      v43 = CXDefaultStringAttribute(v16, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"title", 0);
      [(OADMovie *)v45 setName:v43];
      [(OADBlipRef *)v57 setName:0];
      [v48 setMovie:v45];
    }
  }
  [(OADImageFill *)v46 setBlipRef:v57];
  [(OADImageFill *)v46 setTechnique:v50];
  [v51 setImageFill:v46];
}

@end