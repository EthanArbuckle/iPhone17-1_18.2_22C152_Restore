@interface OBImage
+ (id)_imageNameForUIInterfaceStyle:(int64_t)a3 originalName:(id)a4;
+ (id)_imageNamed:(id)a3 inBundle:(id)a4 convertToMatchInterfaceStyle:(BOOL)a5;
+ (id)imageNamed:(id)a3;
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
+ (int64_t)rootInterfaceStyle;
- (NSBundle)bundle;
- (NSString)name;
- (UIColor)tintColor;
- (id)_obFlatImageWithColor:(id)a3;
- (id)imageForUserInterfaceStyle:(int64_t)a3;
- (int64_t)style;
- (void)setBundle:(id)a3;
- (void)setName:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation OBImage

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return (id)[a1 _imageNamed:a3 inBundle:a4 convertToMatchInterfaceStyle:1];
}

+ (id)imageNamed:(id)a3
{
  return (id)[a1 _imageNamed:a3 inBundle:0 convertToMatchInterfaceStyle:1];
}

+ (id)_imageNamed:(id)a3 inBundle:(id)a4 convertToMatchInterfaceStyle:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    +[OBImage _imageNameForUIInterfaceStyle:originalName:](OBImage, "_imageNameForUIInterfaceStyle:originalName:", [a1 rootInterfaceStyle], v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;
  v12 = [OBImage alloc];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___OBImage;
  objc_msgSendSuper2(&v18, sel_imageNamed_inBundle_, v11, v9);
  id v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[OBImage initWithCGImage:](v12, "initWithCGImage:", [v13 CGImage]);

  [(OBImage *)v14 setName:v8];
  [(OBImage *)v14 setBundle:v9];
  -[OBImage setStyle:](v14, "setStyle:", [a1 rootInterfaceStyle]);
  if (!v14)
  {
    v15 = _OBLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [v9 description];
      *(_DWORD *)buf = 138413058;
      id v20 = v8;
      __int16 v21 = 2112;
      v22 = v17;
      __int16 v23 = 1024;
      BOOL v24 = v5;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_19BF0F000, v15, OS_LOG_TYPE_ERROR, "OBImage unable to create image \ninputs: [name: %@ \nbundle: %@\ncomputeCoronaName: %i\ncomputedName:%@\n]", buf, 0x26u);
    }
  }

  return v14;
}

- (id)imageForUserInterfaceStyle:(int64_t)a3
{
  if ([(OBImage *)self style] == a3)
  {
    BOOL v5 = self;
  }
  else
  {
    v6 = objc_opt_class();
    v7 = [(OBImage *)self name];
    id v8 = [v6 _imageNameForUIInterfaceStyle:a3 originalName:v7];

    id v9 = [(OBImage *)self bundle];
    id v10 = +[OBImage _imageNamed:v8 inBundle:v9 convertToMatchInterfaceStyle:0];

    [v10 setStyle:a3];
    v11 = [(OBImage *)self name];
    [v10 setName:v11];

    v12 = [(OBImage *)self tintColor];
    [v10 setTintColor:v12];

    id v13 = [(OBImage *)self bundle];
    [v10 setBundle:v13];

    v14 = [v10 tintColor];

    if (v14)
    {
      v15 = [v10 tintColor];
      BOOL v5 = [v10 _obFlatImageWithColor:v15];
    }
    else
    {
      BOOL v5 = v10;
    }
  }
  return v5;
}

+ (id)_imageNameForUIInterfaceStyle:(int64_t)a3 originalName:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 2)
  {
    id v7 = [v5 stringByReplacingOccurrencesOfString:@"." withString:@"_Corona."];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

+ (int64_t)rootInterfaceStyle
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v3 = [v2 traitCollection];
  int64_t v4 = [v3 userInterfaceStyle];

  return v4;
}

- (id)_obFlatImageWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [OBImage alloc];
  v11.receiver = self;
  v11.super_class = (Class)OBImage;
  id v6 = [(OBImage *)&v11 _flatImageWithColor:v4];
  id v7 = -[OBImage initWithCGImage:](v5, "initWithCGImage:", [v6 CGImage]);

  [(OBImage *)v7 setStyle:[(OBImage *)self style]];
  id v8 = [(OBImage *)self name];
  [(OBImage *)v7 setName:v8];

  id v9 = [(OBImage *)self bundle];
  [(OBImage *)v7 setBundle:v9];

  [(OBImage *)v7 setTintColor:v4];
  return v7;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end