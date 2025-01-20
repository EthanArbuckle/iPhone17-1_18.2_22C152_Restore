@interface _BSUIDynamicTimeLayer
- (BOOL)useFontFallback;
- (NSArray)currentLayers;
- (NSArray)digits;
- (NSArray)outgoingLayers;
- (NSString)timeSeparator;
- (UIColor)color;
- (UIFont)font;
- (_BSUIDynamicTimeLayer)init;
- (double)height;
- (id)newTextLayerAtFrame:(CGRect)a3 character:(id)a4;
- (int64_t)savedAnimatedReadingTime;
- (void)_generateDigits;
- (void)setColor:(id)a3;
- (void)setCurrentLayers:(id)a3;
- (void)setDigits:(id)a3;
- (void)setFont:(id)a3;
- (void)setFont:(id)a3 useFontFallback:(BOOL)a4;
- (void)setHeight:(double)a3;
- (void)setOutgoingLayers:(id)a3;
- (void)setReadingTime:(int64_t)a3 animate:(BOOL)a4;
- (void)setSavedAnimatedReadingTime:(int64_t)a3;
- (void)setTimeSeparator:(id)a3;
- (void)setUseFontFallback:(BOOL)a3;
@end

@implementation _BSUIDynamicTimeLayer

- (_BSUIDynamicTimeLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_BSUIDynamicTimeLayer;
  v2 = [(_BSUIDynamicTimeLayer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_BSUIDynamicTimeLayer *)v2 _generateDigits];
    [(_BSUIDynamicTimeLayer *)v3 setSavedAnimatedReadingTime:-1];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_generateDigits" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v3;
}

- (void)_generateDigits
{
  id v10 = +[NSMutableArray arrayWithCapacity:10];
  v3 = objc_opt_new();
  v4 = +[NSLocale currentLocale];
  [v3 setLocale:v4];

  for (uint64_t i = 0; i != 10; ++i)
  {
    objc_super v6 = +[NSNumber numberWithInteger:i];
    v7 = [v3 stringFromNumber:v6];
    [v10 addObject:v7];
  }
  v8 = (NSArray *)[v10 copy];
  digits = self->_digits;
  self->_digits = v8;
}

- (void)setFont:(id)a3 useFontFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 fontDescriptor];
  v24[0] = &off_3A0B18;
  v23[0] = UIFontFeatureTypeIdentifierKey;
  v23[1] = UIFontFeatureSelectorIdentifierKey;
  if (v4) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 2;
  }
  v9 = +[NSNumber numberWithInt:v8];
  v24[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v25[0] = v10;
  v21[0] = UIFontFeatureTypeIdentifierKey;
  v21[1] = UIFontFeatureSelectorIdentifierKey;
  v22[0] = &off_3A0B30;
  v22[1] = &off_3A0B48;
  v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v25[1] = v11;
  v12 = +[NSArray arrayWithObjects:v25 count:2];

  UIFontDescriptorAttributeName v19 = UIFontDescriptorFeatureSettingsAttribute;
  v20 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v14 = [v7 fontDescriptorByAddingAttributes:v13];

  [v6 pointSize];
  double v16 = v15;

  v17 = +[UIFont fontWithDescriptor:v14 size:v16];
  font = self->_font;
  self->_font = v17;
}

- (id)newTextLayerAtFrame:(CGRect)a3 character:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setAnchorPoint:0.0, 0.0];
  [v10 setFrame:CGRectMake(x, y, width, height)];
  v11 = [(_BSUIDynamicTimeLayer *)self font];
  [v10 setFont:v11];

  v12 = [(_BSUIDynamicTimeLayer *)self font];
  [v12 pointSize];
  [v10 setFontSize:];

  id v13 = [(_BSUIDynamicTimeLayer *)self color];
  objc_msgSend(v10, "setForegroundColor:", objc_msgSend(v13, "CGColor"));

  [v10 setAlignmentMode:kCAAlignmentCenter];
  [(_BSUIDynamicTimeLayer *)self contentsScale];
  [v10 setContentsScale:];
  [v10 setString:v9];

  return v10;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  v5 = +[UITraitCollection _currentTraitCollection];
  id v6 = [v4 resolvedColorWithTraitCollection:v5];
  color = self->_color;
  self->_color = v6;

  uint64_t v8 = [(_BSUIDynamicTimeLayer *)self outgoingLayers];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_41778;
  v14[3] = &unk_38F910;
  id v9 = v4;
  id v15 = v9;
  [v8 enumerateObjectsUsingBlock:v14];

  id v10 = [(_BSUIDynamicTimeLayer *)self currentLayers];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_417DC;
  v12[3] = &unk_38F910;
  id v13 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v12];
}

- (void)setReadingTime:(int64_t)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = a3 & ~(a3 >> 63);
  if ([(_BSUIDynamicTimeLayer *)self savedAnimatedReadingTime] == v6) {
    return;
  }
  BOOL v68 = v4;
  [(_BSUIDynamicTimeLayer *)self setSavedAnimatedReadingTime:v6];
  unsigned int v7 = [(_BSUIDynamicTimeLayer *)self useFontFallback];
  uint64_t v8 = [(_BSUIDynamicTimeLayer *)self font];
  [v8 pointSize];
  double v10 = v9 / 72.0;

  double v11 = 38.0;
  if (v7) {
    double v11 = 44.0;
  }
  double v12 = v11 * v10;
  double v13 = v10 * 16.0;
  [(_BSUIDynamicTimeLayer *)self bounds];
  double v15 = v14;
  unint64_t v16 = v6 >> 5;
  uint64_t v17 = 3;
  uint64_t v18 = 2;
  if (v6 <= 0x257) {
    uint64_t v18 = 3;
  }
  unint64_t v67 = v6 >> 4;
  if (v6 >> 4 <= 0x176) {
    uint64_t v17 = v18;
  }
  if (v16 <= 0x752) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = 4;
  }
  double v20 = (double)v19;
  if (v6 >= 0x258) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v19 + 1;
  }
  double v22 = v13 + v12 * v20;
  double v23 = v12 * v20;
  if (v6 >= 0x258) {
    double v24 = v23;
  }
  else {
    double v24 = v22;
  }
  timeSeparator = (__CFString *)self->_timeSeparator;
  if (!timeSeparator) {
    timeSeparator = @":";
  }
  v26 = timeSeparator;
  v27 = [(_BSUIDynamicTimeLayer *)self currentLayers];
  v28 = +[NSMutableArray arrayWithCapacity:v19 + 1];
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  *(double *)&v100[3] = (v15 - v24) * 0.5;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  char v99 = 0;
  v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v27 count]);
  v30 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v27 count]);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_4223C;
  v89[3] = &unk_38F938;
  v95 = v100;
  v89[4] = self;
  id v70 = v28;
  id v90 = v70;
  id v31 = v27;
  id v91 = v31;
  v69 = v26;
  v92 = v69;
  v96 = v98;
  uint64_t v97 = v21;
  id v32 = v29;
  id v93 = v32;
  id v33 = v30;
  id v94 = v33;
  v34 = objc_retainBlock(v89);
  unint64_t v35 = v6 / 0x3C;
  if (v6 < 0x258)
  {
    v36 = [(NSArray *)self->_digits objectAtIndexedSubscript:v6 / 0x3C];
    ((void (*)(void *, void *, double))v34[2])(v34, v36, v12);

    ((void (*)(void *, __CFString *, double))v34[2])(v34, v69, v13);
    v37 = [(NSArray *)self->_digits objectAtIndexedSubscript:v6 % 0x3C / 0xA];
    ((void (*)(void *, void *, double))v34[2])(v34, v37, v12);

    v38 = [(NSArray *)self->_digits objectAtIndexedSubscript:v6 % 0x3C % 0xA];
    ((void (*)(void *, void *, double))v34[2])(v34, v38, v12);
    goto LABEL_26;
  }
  if (v16 >= 0x753)
  {
    v39 = [(NSArray *)self->_digits objectAtIndexedSubscript:(void)(v6 / 0xEA60 - 10 * ((v6 / 0xEA60 * (unsigned __int128)0x199999999999999AuLL) >> 64))];
    ((void (*)(void *, void *, double))v34[2])(v34, v39, v12);

LABEL_24:
    v40 = -[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (void)(v6 / 0x1770 - 10 * ((v6 / 0x1770 * (unsigned __int128)0x199999999999999AuLL) >> 64)), v67);
    ((void (*)(void *, void *, double))v34[2])(v34, v40, v12);

    goto LABEL_25;
  }
  if (v67 >= 0x177) {
    goto LABEL_24;
  }
LABEL_25:
  v41 = -[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (void)(v6 / 0x258 - 10 * ((v6 / 0x258 * (unsigned __int128)0x199999999999999AuLL) >> 64)), v67);
  ((void (*)(void *, void *, double))v34[2])(v34, v41, v12);

  v38 = [(NSArray *)self->_digits objectAtIndexedSubscript:(void)(v35 - 10 * ((v35 * (unsigned __int128)0x199999999999999AuLL) >> 64))];
  ((void (*)(void *, void *, double))v34[2])(v34, v38, v12);
LABEL_26:

  for (uint64_t i = (char *)[v70 count]; i < [v31 count]; ++i)
  {
    v43 = [v31 objectAtIndexedSubscript:i];
    [v32 addObject:v43];
  }
  +[CATransaction setDisableActions:1];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v44 = [(_BSUIDynamicTimeLayer *)self outgoingLayers];
  id v45 = [v44 countByEnumeratingWithState:&v85 objects:v104 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v86;
    do
    {
      for (j = 0; j != v45; j = (char *)j + 1)
      {
        if (*(void *)v86 != v46) {
          objc_enumerationMutation(v44);
        }
        [*(id *)(*((void *)&v85 + 1) + 8 * (void)j) removeFromSuperlayer];
      }
      id v45 = [v44 countByEnumeratingWithState:&v85 objects:v104 count:16];
    }
    while (v45);
  }

  +[CATransaction setDisableActions:0];
  id v48 = [v32 copy];
  [(_BSUIDynamicTimeLayer *)self setOutgoingLayers:v48];

  id v49 = [v70 copy];
  [(_BSUIDynamicTimeLayer *)self setCurrentLayers:v49];

  +[CATransaction setDisableActions:1];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v50 = v33;
  id v51 = [v50 countByEnumeratingWithState:&v81 objects:v103 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v82;
    do
    {
      for (k = 0; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v82 != v52) {
          objc_enumerationMutation(v50);
        }
        [(_BSUIDynamicTimeLayer *)self addSublayer:*(void *)(*((void *)&v81 + 1) + 8 * (void)k)];
      }
      id v51 = [v50 countByEnumeratingWithState:&v81 objects:v103 count:16];
    }
    while (v51);
  }

  +[CATransaction setDisableActions:0];
  if (v68)
  {
    id v54 = [v50 count];
    v55 = [(_BSUIDynamicTimeLayer *)self outgoingLayers];
    if (v54 >= [v55 count]) {
      double v56 = 0.0;
    }
    else {
      double v56 = 0.12;
    }

    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_4243C;
    v80[3] = &unk_38F960;
    *(double *)&v80[5] = v56;
    v80[6] = 0x3FB47AE147AE147BLL;
    v80[4] = self;
    [v50 enumerateObjectsUsingBlock:v80];
    v57 = [(_BSUIDynamicTimeLayer *)self outgoingLayers];
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_426A0;
    v79[3] = &unk_38F988;
    v79[4] = self;
    v79[5] = 0x3FB47AE147AE147BLL;
    [v57 enumerateObjectsUsingBlock:v79];
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v58 = v50;
    id v59 = [v58 countByEnumeratingWithState:&v75 objects:v102 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v76;
      do
      {
        for (m = 0; m != v59; m = (char *)m + 1)
        {
          if (*(void *)v76 != v60) {
            objc_enumerationMutation(v58);
          }
          v62 = *(void **)(*((void *)&v75 + 1) + 8 * (void)m);
          [v62 frame];
          [v62 setFrame:];
        }
        id v59 = [v58 countByEnumeratingWithState:&v75 objects:v102 count:16];
      }
      while (v59);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v63 = [(_BSUIDynamicTimeLayer *)self outgoingLayers];
    id v64 = [v63 countByEnumeratingWithState:&v71 objects:v101 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v72;
      do
      {
        for (n = 0; n != v64; n = (char *)n + 1)
        {
          if (*(void *)v72 != v65) {
            objc_enumerationMutation(v63);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * (void)n) removeFromSuperlayer];
        }
        id v64 = [v63 countByEnumeratingWithState:&v71 objects:v101 count:16];
      }
      while (v64);
    }
  }
  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v100, 8);
}

- (int64_t)savedAnimatedReadingTime
{
  return self->_savedAnimatedReadingTime;
}

- (void)setSavedAnimatedReadingTime:(int64_t)a3
{
  self->_savedAnimatedReadingTime = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

- (BOOL)useFontFallback
{
  return self->_useFontFallback;
}

- (void)setUseFontFallback:(BOOL)a3
{
  self->_useFontFallback = a3;
}

- (NSString)timeSeparator
{
  return self->_timeSeparator;
}

- (void)setTimeSeparator:(id)a3
{
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (NSArray)outgoingLayers
{
  return self->_outgoingLayers;
}

- (void)setOutgoingLayers:(id)a3
{
}

- (NSArray)currentLayers
{
  return self->_currentLayers;
}

- (void)setCurrentLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayers, 0);
  objc_storeStrong((id *)&self->_outgoingLayers, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_timeSeparator, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_font, 0);
}

@end