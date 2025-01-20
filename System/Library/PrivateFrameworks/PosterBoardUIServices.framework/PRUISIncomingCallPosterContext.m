@interface PRUISIncomingCallPosterContext
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonalPoster;
- (CGRect)horizontalTitleBoundingRect;
- (CGRect)verticalTitleBoundingRect;
- (NSString)imageAssetID;
- (NSString)preferredTitleString;
- (PRUISIncomingCallPosterContext)init;
- (PRUISIncomingCallPosterContext)initWithNameVariations:(id)a3 preferredNameStyle:(int64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8;
- (PRUISIncomingCallPosterContext)initWithTitleString:(id)a3 horizontalTitleBoundingRect:(CGRect)a4 verticalTitleBoundingRect:(CGRect)a5 imageAssetID:(id)a6 personalPoster:(BOOL)a7;
- (PRUISIncomingCallPosterContextNameVariations)nameVariations;
- (id)identifierForSnapshotting;
- (id)identifierForSnapshottingWithNameStyle:(int64_t)a3;
- (int64_t)preferredNameStyle;
- (unint64_t)hash;
- (void)applyContextToEditingSceneViewController:(id)a3;
- (void)applyContextToScene:(id)a3;
@end

@implementation PRUISIncomingCallPosterContext

- (PRUISIncomingCallPosterContext)init
{
  return -[PRUISIncomingCallPosterContext initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](self, "initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", 0, 0, 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (PRUISIncomingCallPosterContext)initWithNameVariations:(id)a3 preferredNameStyle:(int64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v14 = a5.size.height;
  CGFloat v15 = a5.size.width;
  CGFloat v16 = a5.origin.y;
  CGFloat v17 = a5.origin.x;
  id v21 = a3;
  id v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PRUISIncomingCallPosterContext;
  v23 = [(PRUISIncomingCallPosterContext *)&v26 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_nameVariations, a3);
    v24->_preferredNameStyle = a4;
    v24->_horizontalTitleBoundingRect.origin.CGFloat x = v17;
    v24->_horizontalTitleBoundingRect.origin.CGFloat y = v16;
    v24->_horizontalTitleBoundingRect.size.CGFloat width = v15;
    v24->_horizontalTitleBoundingRect.size.CGFloat height = v14;
    v24->_verticalTitleBoundingRect.origin.CGFloat x = x;
    v24->_verticalTitleBoundingRect.origin.CGFloat y = y;
    v24->_verticalTitleBoundingRect.size.CGFloat width = width;
    v24->_verticalTitleBoundingRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v24->_imageAssetID, a7);
    v24->_personalPoster = a8;
  }

  return v24;
}

- (PRUISIncomingCallPosterContext)initWithTitleString:(id)a3 horizontalTitleBoundingRect:(CGRect)a4 verticalTitleBoundingRect:(CGRect)a5 imageAssetID:(id)a6 personalPoster:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a4.size.height;
  double v13 = a4.size.width;
  double v14 = a4.origin.y;
  double v15 = a4.origin.x;
  v25[2] = *MEMORY[0x263EF8340];
  id v18 = a6;
  if (a3)
  {
    id v19 = a3;
    v20 = [PRUISIncomingCallPosterContextNameVariations alloc];
    v24[0] = &unk_2707FAA68;
    v24[1] = &unk_2707FAA80;
    v25[0] = v19;
    v25[1] = v19;
    id v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

    a3 = [(PRUISIncomingCallPosterContextNameVariations *)v20 initWithNamesDictionary:v21];
  }
  id v22 = -[PRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](self, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", a3, 0, v18, v7, v15, v14, v13, v12, x, y, width, height);

  return v22;
}

- (NSString)preferredTitleString
{
  return (NSString *)[(PRUISIncomingCallPosterContextNameVariations *)self->_nameVariations nameForStyle:self->_preferredNameStyle];
}

- (id)identifierForSnapshotting
{
  return [(PRUISIncomingCallPosterContext *)self identifierForSnapshottingWithNameStyle:self->_preferredNameStyle];
}

- (id)identifierForSnapshottingWithNameStyle:(int64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x263F29C60], "builder", a3);
  id v5 = (id)objc_msgSend(v4, "appendCGRect:", self->_horizontalTitleBoundingRect.origin.x, self->_horizontalTitleBoundingRect.origin.y, self->_horizontalTitleBoundingRect.size.width, self->_horizontalTitleBoundingRect.size.height);
  id v6 = (id)objc_msgSend(v4, "appendCGRect:", self->_verticalTitleBoundingRect.origin.x, self->_verticalTitleBoundingRect.origin.y, self->_verticalTitleBoundingRect.size.width, self->_verticalTitleBoundingRect.size.height);
  BOOL v7 = [(PRUISIncomingCallPosterContextNameVariations *)self->_nameVariations nameForStyle:self->_preferredNameStyle];
  v8 = v7;
  if (v7 && [v7 length]) {
    id v9 = (id)[v4 appendObject:v8];
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v11 = [v10 stringValue];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 nameVariations];
    BOOL v7 = [(PRUISIncomingCallPosterContext *)self nameVariations];
    int v8 = BSEqualObjects();

    if (!v8) {
      goto LABEL_8;
    }
    [v5 horizontalTitleBoundingRect];
    [(PRUISIncomingCallPosterContext *)self horizontalTitleBoundingRect];
    if (!BSRectEqualToRect()) {
      goto LABEL_8;
    }
    [v5 verticalTitleBoundingRect];
    [(PRUISIncomingCallPosterContext *)self verticalTitleBoundingRect];
    if (!BSRectEqualToRect()) {
      goto LABEL_8;
    }
    id v9 = [v5 imageAssetID];
    v10 = [(PRUISIncomingCallPosterContext *)self imageAssetID];
    int v11 = BSEqualStrings();

    if (v11)
    {
      int v12 = [v5 isPersonalPoster];
      int v13 = v12 ^ [(PRUISIncomingCallPosterContext *)self isPersonalPoster] ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_nameVariations];
  id v5 = (id)objc_msgSend(v3, "appendCGRect:", self->_horizontalTitleBoundingRect.origin.x, self->_horizontalTitleBoundingRect.origin.y, self->_horizontalTitleBoundingRect.size.width, self->_horizontalTitleBoundingRect.size.height);
  id v6 = (id)objc_msgSend(v3, "appendCGRect:", self->_verticalTitleBoundingRect.origin.x, self->_verticalTitleBoundingRect.origin.y, self->_verticalTitleBoundingRect.size.width, self->_verticalTitleBoundingRect.size.height);
  id v7 = (id)[v3 appendObject:self->_imageAssetID];
  id v8 = (id)[v3 appendBool:self->_personalPoster];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (void)applyContextToScene:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__PRUISIncomingCallPosterContext_applyContextToScene___block_invoke;
  v3[3] = &unk_26546B258;
  v3[4] = self;
  [a3 performUpdate:v3];
}

void __54__PRUISIncomingCallPosterContext_applyContextToScene___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(double **)(a1 + 32);
  double v4 = v3[5];
  double v5 = v3[6];
  double v6 = v3[7];
  double v7 = v3[8];
  id v8 = a2;
  objc_msgSend(v8, "pr_setHorizontalTitleBoundingRect:", v4, v5, v6, v7);
  objc_msgSend(v8, "pr_setVerticalTitleBoundingRect:", *(double *)(*(void *)(a1 + 32) + 72), *(double *)(*(void *)(a1 + 32) + 80), *(double *)(*(void *)(a1 + 32) + 88), *(double *)(*(void *)(a1 + 32) + 96));
}

- (void)applyContextToEditingSceneViewController:(id)a3
{
  double x = self->_horizontalTitleBoundingRect.origin.x;
  double y = self->_horizontalTitleBoundingRect.origin.y;
  double width = self->_horizontalTitleBoundingRect.size.width;
  double height = self->_horizontalTitleBoundingRect.size.height;
  id v8 = a3;
  objc_msgSend(v8, "setHorizontalTitleBoundingRect:", x, y, width, height);
  objc_msgSend(v8, "setVerticalTitleBoundingRect:", self->_verticalTitleBoundingRect.origin.x, self->_verticalTitleBoundingRect.origin.y, self->_verticalTitleBoundingRect.size.width, self->_verticalTitleBoundingRect.size.height);
  id v9 = [(PRUISIncomingCallPosterContext *)self preferredTitleString];
  [v8 setTitleString:v9];
}

- (PRUISIncomingCallPosterContextNameVariations)nameVariations
{
  return self->_nameVariations;
}

- (int64_t)preferredNameStyle
{
  return self->_preferredNameStyle;
}

- (CGRect)horizontalTitleBoundingRect
{
  double x = self->_horizontalTitleBoundingRect.origin.x;
  double y = self->_horizontalTitleBoundingRect.origin.y;
  double width = self->_horizontalTitleBoundingRect.size.width;
  double height = self->_horizontalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)verticalTitleBoundingRect
{
  double x = self->_verticalTitleBoundingRect.origin.x;
  double y = self->_verticalTitleBoundingRect.origin.y;
  double width = self->_verticalTitleBoundingRect.size.width;
  double height = self->_verticalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)imageAssetID
{
  return self->_imageAssetID;
}

- (BOOL)isPersonalPoster
{
  return self->_personalPoster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAssetID, 0);

  objc_storeStrong((id *)&self->_nameVariations, 0);
}

@end