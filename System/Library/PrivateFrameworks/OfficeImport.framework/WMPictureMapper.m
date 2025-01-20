@interface WMPictureMapper
- (WMPictureMapper)initWithWDPicture:(id)a3 parent:(id)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapBounds;
- (void)setBoundingBox;
@end

@implementation WMPictureMapper

- (WMPictureMapper)initWithWDPicture:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 drawable];
  v15.receiver = self;
  v15.super_class = (Class)WMPictureMapper;
  v9 = [(CMDrawableMapper *)&v15 initWithOadDrawable:v8 parent:v7];
  v10 = v9;
  if (v9)
  {
    [(WMPictureMapper *)v9 setBoundingBox];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      mDrawable = v10->super.mDrawable;
      v14.receiver = v10;
      v14.super_class = (Class)WMPictureMapper;
      [(CMDrawableMapper *)&v14 setWithOadImage:mDrawable];
    }
    v12 = v10;
  }

  return v10;
}

- (void)setBoundingBox
{
  id v7 = [(OADDrawable *)self->super.mDrawable clientData];
  if ([v7 hasBounds])
  {
    [v7 bounds];
    self->super.mBox.origin.x = v3;
    self->super.mBox.origin.y = v4;
    self->super.mBox.size.width = v5;
    self->super.mBox.size.height = v6;
  }
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v5 = a3;
  [(WMPictureMapper *)self mapBounds];
  [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
  double v10 = v9;
  if (v9 != 0.0)
  {
    double v11 = v6;
    double v12 = v7;
    double v13 = v8;
    objc_super v14 = +[OIXMLElement elementWithType:9];
    [v5 addChild:v14];
    -[CMStyle appendSizeInfoFromRect:](self->super.mStyle, "appendSizeInfoFromRect:", v11, v12, v10, v13);
    if (self->super.mIsSupported && (mImageBinaryData = self->super.mImageBinaryData) != 0)
    {
      uint64_t mResourceType = self->super.mResourceType;
      v18.receiver = self;
      v18.super_class = (Class)WMPictureMapper;
      v17 = [(CMDrawableMapper *)&v18 saveResourceAndReturnPath:mImageBinaryData withType:mResourceType];
      [(CMMapper *)self addAttribute:0x26EC19158 toNode:v14 value:v17];
    }
    else
    {
      [(CMStyle *)self->super.mStyle appendDefaultBorderStyle];
    }
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v14 style:self->super.mStyle];
  }
}

- (void)mapBounds
{
  id v7 = [(OADDrawable *)self->super.mDrawable clientData];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v3 = [(OADDrawable *)self->super.mDrawable drawableProperties];
    CGFloat v4 = [v3 orientedBounds];
    mOrientedBounds = self->super.mOrientedBounds;
    self->super.mOrientedBounds = v4;
  }
  else
  {
    if (![v7 hasBounds]) {
      goto LABEL_6;
    }
    [v7 bounds];
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
    double v6 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
    CGFloat v3 = self->super.mOrientedBounds;
    self->super.mOrientedBounds = v6;
  }

LABEL_6:
}

- (void).cxx_destruct
{
}

@end