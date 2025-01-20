@interface RouteStepLabelListView
+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6;
+ (id)_spacingForNumberOfStrings:(unint64_t)a3 isEVStep:(BOOL)a4;
+ (id)colorsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6;
+ (id)fontsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6;
+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5;
+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6;
+ (id)voiceOverStringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5;
- (BOOL)tableMode;
- (RouteStepLabelListView)initWithRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5;
- (id)attributedStringForString:(id)a3 inStrings:(id)a4 forStep:(id)a5 font:(id)a6;
- (void)layoutToFitSize:(CGSize)a3;
- (void)setRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5;
- (void)setTableMode:(BOOL)a3;
@end

@implementation RouteStepLabelListView

+ (id)voiceOverStringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return 0;
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return 0;
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6
{
  return 0;
}

+ (id)fontsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6
{
  id v6 = [a3 count];
  if (v6)
  {
    unint64_t v7 = (unint64_t)v6;
    v8 = +[NSMutableArray arrayWithCapacity:v6];
    v9 = +[UIDevice currentDevice];
    id v10 = [v9 userInterfaceIdiom];

    if (v10 == (id)5)
    {
      do
      {
        v11 = +[UIFont system17];
        [v8 addObject:v11];

        --v7;
      }
      while (v7);
    }
    else
    {
      v12 = +[UIFont system17Bold];
      [v8 addObject:v12];

      if (v7 >= 2)
      {
        unint64_t v13 = v7 - 1;
        do
        {
          v14 = +[UIFont system15];
          [v8 addObject:v14];

          --v13;
        }
        while (v13);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6
{
  id v6 = (char *)[a3 count];
  if (v6)
  {
    unint64_t v7 = v6;
    v8 = +[NSMutableArray arrayWithCapacity:v6];
    v9 = +[UIColor blackColor];
    [v8 addObject:v9];

    id v10 = v7 - 1;
    if (v7 != (char *)1)
    {
      do
      {
        v11 = +[UIColor colorWithWhite:0.501960814 alpha:1.0];
        [v8 addObject:v11];

        --v10;
      }
      while (v10);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attributedStringForString:(id)a3 inStrings:(id)a4 forStep:(id)a5 font:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([a5 isEVChargerStep]
    && ([v10 lastObject],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v9 isEqualToString:v12],
        v12,
        v13))
  {
    v14 = +[UIImage systemImageNamed:@"bolt.circle.fill"];
    [v11 pointSize];
    v15 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 2);
    v16 = [v14 imageWithConfiguration:v15];

    v17 = [v16 imageWithRenderingMode:2];
    v18 = +[UIColor systemGreenColor];
    v19 = [v17 _flatImageWithColor:v18];

    if (v19)
    {
      id v20 = objc_alloc_init((Class)NSTextAttachment);
      [v20 setImage:v19];
      [v11 capHeight];
      double v22 = v21;
      [v19 size];
      double v24 = (v22 - v23) * 0.5;
      [v19 size];
      double v26 = v25;
      [v19 size];
      [v20 setBounds:0.0, v24, v26, v27];
      id v28 = objc_alloc((Class)NSMutableAttributedString);
      v29 = +[NSAttributedString attributedStringWithAttachment:v20];
      id v30 = [v28 initWithAttributedString:v29];

      id v31 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
      [v30 appendAttributedString:v31];
      id v32 = [objc_alloc((Class)NSAttributedString) initWithString:v9];
      [v30 appendAttributedString:v32];
      id v33 = [v30 copy];
    }
    else
    {
      id v33 = 0;
    }
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = [a1 stringsForRoute:v10 step:v9 tableMode:0];
  v12 = [a1 fontsForStrings:v11 route:v10 step:v9 tableMode:0];

  id v13 = [v11 count];
  id v14 = [v9 isEVChargerStep];

  v15 = [a1 _spacingForNumberOfStrings:v13 isEVStep:v14];
  [a1 heightForWidth:v11 strings:v12 fonts:v15 spacings:a3];
  double v17 = v16;

  return v17;
}

+ (id)_spacingForNumberOfStrings:(unint64_t)a3 isEVStep:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a1 spacingForNumberOfStrings:a3];
  id v6 = v5;
  if (v4 && [v5 count])
  {
    id v7 = [v6 mutableCopy];
    [v7 replaceObjectAtIndex:[v7 count] - 1 withObject:&off_1013A7048];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (RouteStepLabelListView)initWithRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)RouteStepLabelListView;
  id v10 = -[LabelListView initWithFrame:](&v31, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v11 = v10;
  if (v10)
  {
    [(RouteStepLabelListView *)v10 setAccessibilityIdentifier:@"RouteStepLabelList"];
    v11->_isEVStep = [v9 isEVChargerStep];
    v12 = objc_opt_class();
    id v30 = v11;
    [(RouteStepLabelListView *)v11 setTableMode:v5];
    id v13 = [v12 stringsForRoute:v8 step:v9 tableMode:v5];
    v29 = [v12 voiceOverStringsForRoute:v8 step:v9 tableMode:v5];
    id v28 = [v12 fontsForStrings:v13 route:v8 step:v9 tableMode:v5];
    id v26 = v8;
    double v27 = [v12 colorsForStrings:v13 route:v8 step:v9 tableMode:v5];
    id v14 = (char *)[v13 count];
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        double v17 = [v13 objectAtIndexedSubscript:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = [v28 objectAtIndexedSubscript:i];
          v19 = [(RouteStepLabelListView *)v30 attributedStringForString:v17 inStrings:v13 forStep:v9 font:v18];

          id v20 = [v29 objectAtIndexedSubscript:i];
          [v28 objectAtIndexedSubscript:i];
          v22 = id v21 = v9;
          double v23 = [v27 objectAtIndexedSubscript:i];
          [(LabelListView *)v30 addLabelWithText:v17 attributedText:v19 accessibilityText:v20 font:v22 color:v23];

          id v9 = v21;
        }
      }
    }
    id v11 = v30;
    double v24 = v30;

    id v8 = v26;
  }

  return v11;
}

- (void)setRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v38 = a3;
  id v8 = a4;
  self->_isEVStep = [v8 isEVChargerStep];
  [(RouteStepLabelListView *)self setTableMode:v5];
  id v9 = (char *)[(NSMutableArray *)self->super._labels count];
  id v10 = objc_opt_class();
  id v11 = [v10 stringsForRoute:v38 step:v8 tableMode:v5];
  uint64_t v37 = [v10 voiceOverStringsForRoute:v38 step:v8 tableMode:v5];
  v12 = [v10 fontsForStrings:v11 route:v38 step:v8 tableMode:v5];
  v39 = v8;
  v40 = [v10 colorsForStrings:v11 route:v38 step:v8 tableMode:v5];
  id v13 = (char *)[v11 count];
  id v14 = v13;
  v41 = v12;
  if (v13 >= v9)
  {
    double v16 = (void *)v37;
    if (v13 > v9)
    {
      double v17 = NSCollectionLayoutEdgeSpacing_ptr;
      v18 = v9;
      v36 = v13;
      do
      {
        v19 = [v11 objectAtIndexedSubscript:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = [v12 objectAtIndexedSubscript:v18];
          id v21 = [(RouteStepLabelListView *)self attributedStringForString:v19 inStrings:v11 forStep:v39 font:v20];

          double v22 = [v16 objectAtIndexedSubscript:v18];
          double v23 = [v41 objectAtIndexedSubscript:v18];
          [v40 objectAtIndexedSubscript:v18];
          v25 = double v24 = v17;
          [(LabelListView *)self addLabelWithText:v19 attributedText:v21 accessibilityText:v22 font:v23 color:v25];

          double v17 = v24;
          double v16 = (void *)v37;

          v12 = v41;
          id v14 = v36;
        }

        ++v18;
      }
      while (v14 != v18);
      id v14 = v9;
    }
  }
  else
  {
    do
    {
      v15 = [(NSMutableArray *)self->super._labels lastObject];
      [v15 removeFromSuperview];
      [(NSMutableArray *)self->super._labels removeLastObject];

      --v9;
    }
    while (v9 > v14);
    double v16 = (void *)v37;
  }
  if (v14)
  {
    id v26 = 0;
    do
    {
      double v27 = v14;
      id v28 = [(NSMutableArray *)self->super._labels objectAtIndexedSubscript:v26];
      v29 = [v11 objectAtIndexedSubscript:v26];
      id v30 = [v12 objectAtIndexedSubscript:v26];
      objc_super v31 = [(RouteStepLabelListView *)self attributedStringForString:v29 inStrings:v11 forStep:v39 font:v30];

      if (v31)
      {
        [v28 setAttributedText:v31];
      }
      else
      {
        id v32 = [v11 objectAtIndexedSubscript:v26];
        [v28 setText:v32];
      }
      v12 = v41;
      id v33 = [v16 objectAtIndexedSubscript:v26];
      [v28 setAccessibilityLabel:v33];

      v34 = [v41 objectAtIndexedSubscript:v26];
      [v28 setFont:v34];

      v35 = [v40 objectAtIndexedSubscript:v26];
      [v28 setTextColor:v35];

      ++v26;
      id v14 = v27;
    }
    while (v27 != v26);
  }
}

- (void)layoutToFitSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [objc_opt_class() _spacingForNumberOfStrings:[self->super._labels count] isEVStep:self->_isEVStep];
  v7.receiver = self;
  v7.super_class = (Class)RouteStepLabelListView;
  -[LabelListView layoutToFitSize:spacings:](&v7, "layoutToFitSize:spacings:", v6, width, height);
}

- (BOOL)tableMode
{
  return self->_tableMode;
}

- (void)setTableMode:(BOOL)a3
{
  self->_tableMode = a3;
}

@end