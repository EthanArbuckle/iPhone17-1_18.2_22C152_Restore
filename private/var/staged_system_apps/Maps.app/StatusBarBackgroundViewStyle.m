@interface StatusBarBackgroundViewStyle
+ (id)defaultBlurredStyleWithDefaultColorProvider:(id)a3;
- (BOOL)disableBlur;
- (BOOL)isEqual:(id)a3;
- (NSString)groupName;
- (StatusBarBackgroundViewStyle)initWithBlurStyle:(int64_t)a3 groupName:(id)a4 defaultColorProvider:(id)a5 disableBlur:(BOOL)a6;
- (StatusBarBackgroundViewStyle)initWithColor:(id)a3;
- (StatusBarBackgroundViewStyle)initWithGaussianBlurRadius:(double)a3 defaultColorProvider:(id)a4 disableBlur:(BOOL)a5;
- (StatusBarBackgroundViewStyle)initWithVariableBlurRadius:(double)a3 defaultColorProvider:(id)a4 disableBlur:(BOOL)a5;
- (UIColor)color;
- (double)blurRadius;
- (id)defaultColorProvider;
- (id)description;
- (int64_t)blurStyle;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation StatusBarBackgroundViewStyle

- (StatusBarBackgroundViewStyle)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)StatusBarBackgroundViewStyle;
  v6 = [(StatusBarBackgroundViewStyle *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultColorProvider, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

+ (id)defaultBlurredStyleWithDefaultColorProvider:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    GEOConfigGetDouble();
    id v6 = [objc_alloc((Class)a1) initWithVariableBlurRadius:v4 defaultColorProvider:0 disableBlur:v5];
  }
  else
  {
    id v6 = [objc_alloc((Class)a1) initWithGaussianBlurRadius:v4 defaultColorProvider:0 disableBlur:10.0];
  }
  v7 = v6;

  return v7;
}

- (StatusBarBackgroundViewStyle)initWithVariableBlurRadius:(double)a3 defaultColorProvider:(id)a4 disableBlur:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)StatusBarBackgroundViewStyle;
  objc_super v9 = [(StatusBarBackgroundViewStyle *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 3;
    v9->_blurRadius = a3;
    id v11 = objc_retainBlock(v8);
    id defaultColorProvider = v10->_defaultColorProvider;
    v10->_id defaultColorProvider = v11;

    v10->_disableBlur = a5;
  }

  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (StatusBarBackgroundViewStyle *)a3;
  if (self == v4)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      id v6 = [(StatusBarBackgroundViewStyle *)self type];
      if (v6 == (id)[(StatusBarBackgroundViewStyle *)v5 type])
      {
        v7 = [(StatusBarBackgroundViewStyle *)self color];
        id v8 = [(StatusBarBackgroundViewStyle *)v5 color];
        unint64_t v9 = v7;
        unint64_t v10 = v8;
        if ((!(v9 | v10)
           || (unsigned int v11 = [(id)v9 isEqual:v10],
               (id)v10,
               (id)v9,
               v11))
          && (id v12 = [(StatusBarBackgroundViewStyle *)self blurStyle],
              v12 == (id)[(StatusBarBackgroundViewStyle *)v5 blurStyle]))
        {
          v13 = [(StatusBarBackgroundViewStyle *)self groupName];
          objc_super v14 = [(StatusBarBackgroundViewStyle *)v5 groupName];
          unint64_t v15 = v13;
          unint64_t v16 = v14;
          if (v15 | v16
            && (unsigned int v17 = [(id)v15 isEqual:v16],
                (id)v16,
                (id)v15,
                !v17))
          {
            LOBYTE(v19) = 0;
          }
          else
          {
            unsigned int v18 = [(StatusBarBackgroundViewStyle *)self disableBlur];
            unsigned int v19 = v18 ^ [(StatusBarBackgroundViewStyle *)v5 disableBlur];
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)disableBlur
{
  return self->_disableBlur;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (id)defaultColorProvider
{
  return self->_defaultColorProvider;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (StatusBarBackgroundViewStyle)initWithBlurStyle:(int64_t)a3 groupName:(id)a4 defaultColorProvider:(id)a5 disableBlur:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)StatusBarBackgroundViewStyle;
  v13 = [(StatusBarBackgroundViewStyle *)&v18 init];
  objc_super v14 = v13;
  if (v13)
  {
    v13->_type = 1;
    v13->_blurStyle = a3;
    objc_storeStrong((id *)&v13->_groupName, a4);
    id v15 = objc_retainBlock(v12);
    id defaultColorProvider = v14->_defaultColorProvider;
    v14->_id defaultColorProvider = v15;

    v14->_disableBlur = a6;
  }

  return v14;
}

- (StatusBarBackgroundViewStyle)initWithGaussianBlurRadius:(double)a3 defaultColorProvider:(id)a4 disableBlur:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)StatusBarBackgroundViewStyle;
  unint64_t v9 = [(StatusBarBackgroundViewStyle *)&v14 init];
  unint64_t v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    v9->_blurRadius = a3;
    id v11 = objc_retainBlock(v8);
    id defaultColorProvider = v10->_defaultColorProvider;
    v10->_id defaultColorProvider = v11;

    v10->_disableBlur = a5;
  }

  return v10;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)StatusBarBackgroundViewStyle;
  v3 = [(StatusBarBackgroundViewStyle *)&v11 description];
  int64_t blurStyle = self->_blurStyle;
  groupName = self->_groupName;
  unint64_t type = self->_type;
  color = self->_color;
  id v8 = objc_retainBlock(self->_defaultColorProvider);
  unint64_t v9 = +[NSString stringWithFormat:@"%@ (type: %lu, blurStyle: %lu, groupName: %@, color: %@, defaultColorProvider: %@ disableBlur: %d)", v3, type, blurStyle, groupName, color, v8, self->_disableBlur];

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(StatusBarBackgroundViewStyle *)self type];
  id v4 = [(StatusBarBackgroundViewStyle *)self color];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(StatusBarBackgroundViewStyle *)self blurStyle];
  v7 = [(StatusBarBackgroundViewStyle *)self groupName];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];
  unint64_t v9 = v8 ^ [(StatusBarBackgroundViewStyle *)self disableBlur];

  return v9;
}

@end