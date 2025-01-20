@interface WDOfficeArt
+ (int)textBoxTextTypeForRegularTextType:(int)a3;
- (BOOL)isDrawableOverridden;
- (BOOL)isFloating;
- (WDOfficeArt)initWithParagraph:(id)a3;
- (id)description;
- (id)drawable;
- (id)imageBlipRef;
- (id)imageData;
- (id)imageName;
- (id)overrideDrawable;
- (int)runType;
- (void)checkForFloating:(id)a3;
- (void)clearDrawable;
- (void)propagateTextTypeToDrawables;
- (void)setDrawable:(id)a3;
- (void)setFloating:(BOOL)a3;
- (void)setImageBlipRef:(id)a3;
- (void)setTextType:(int)a3 recursivelyToDrawable:(id)a4;
@end

@implementation WDOfficeArt

- (WDOfficeArt)initWithParagraph:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDOfficeArt;
  return [(WDRunWithCharacterProperties *)&v4 initWithParagraph:a3];
}

- (void)setDrawable:(id)a3
{
}

- (id)drawable
{
  return self->mDrawable;
}

- (void)checkForFloating:(id)a3
{
  id v4 = a3;
  self->mFloating = 1;
  id v12 = v4;
  unint64_t v5 = [v4 runCount];
  unint64_t v6 = v5;
  unint64_t v7 = v5 - 3;
  if (v5 >= 3)
  {
    v8 = [v12 runAt:v5 - 1];
    v9 = v8;
    if (v8 && [v8 runType] == 7 && objc_msgSend(v9, "fieldMarkerType") == 20)
    {
      v10 = [v12 runAt:v6 - 2];

      if (v10)
      {
        if ([v10 runType])
        {
          v9 = v10;
        }
        else
        {
          v11 = [v10 string];
          v9 = [v12 runAt:v7];

          if (v9
            && [v9 runType] == 7
            && [v9 fieldMarkerType] == 19
            && ![v11 compare:@" SHAPE  \\* MERGEFORMAT "])
          {
            self->mFloating = 0;
          }
        }
      }
      else
      {
        v9 = 0;
      }
    }
  }
}

- (BOOL)isFloating
{
  return self->mFloating;
}

- (int)runType
{
  return 3;
}

- (BOOL)isDrawableOverridden
{
  return self->mDrawable != 0;
}

- (void)setFloating:(BOOL)a3
{
  self->mFloating = a3;
}

- (void)propagateTextTypeToDrawables
{
  id v5 = [(WDRun *)self paragraph];
  v3 = [v5 text];
  uint64_t v4 = [v3 textType];

  id v6 = [(WDOfficeArt *)self drawable];
  -[WDOfficeArt setTextType:recursivelyToDrawable:](self, "setTextType:recursivelyToDrawable:", v4);
}

- (void)setTextType:(int)a3 recursivelyToDrawable:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v11 = a4;
  id v6 = [v11 clientData];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setTextType:v4];
  }
  if ([v11 conformsToProtocol:&unk_26ECA15C8])
  {
    id v7 = v11;
    uint64_t v8 = [v7 childCount];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v10 = [v7 childAtIndex:i];
        [(WDOfficeArt *)self setTextType:v4 recursivelyToDrawable:v10];
      }
    }
  }
}

- (id)overrideDrawable
{
  return 0;
}

- (void)clearDrawable
{
  mDrawable = self->mDrawable;
  self->mDrawable = 0;
}

- (id)imageBlipRef
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(OADDrawable *)self->mDrawable imageProperties];
    uint64_t v4 = [v3 imageFill];
    id v5 = [v4 blipRef];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setImageBlipRef:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [[OADImage alloc] initWithBlipRef:v6];
  id v5 = [(OADDrawable *)v4 createWordClientDataWithTextType:0];
  [v5 setDrawable:v4];
  [(WDOfficeArt *)self setDrawable:v4];
}

- (id)imageData
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(OADDrawable *)self->mDrawable imageProperties];
    uint64_t v4 = [v3 imageFill];
    id v5 = [v4 blipRef];

    id v6 = [v5 blip];
    id v7 = [v6 mainSubBlip];
    uint64_t v8 = [v7 data];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)imageName
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(OADDrawable *)self->mDrawable imageProperties];
    uint64_t v4 = [v3 imageFill];
    id v5 = [v4 blipRef];

    id v6 = [v5 name];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (int)textBoxTextTypeForRegularTextType:(int)a3
{
  if (a3 == 2) {
    int v3 = 7;
  }
  else {
    int v3 = -1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 6;
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDOfficeArt;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end