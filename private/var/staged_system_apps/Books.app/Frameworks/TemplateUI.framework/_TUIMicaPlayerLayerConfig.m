@interface _TUIMicaPlayerLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (BOOL)shouldStartAtEnd;
- (Class)layerClass;
- (NSString)description;
- (NSString)gravity;
- (NSString)textKey;
- (NSString)textValue;
- (NSString)triggerName;
- (NSURL)url;
- (TUIFileResourceProviding)fileProvider;
- (TUIFontSpec)fontSpec;
- (_TUIMicaPlayerLayerConfig)initWithURL:(id)a3 gravity:(id)a4 textKey:(id)a5 textValue:(id)a6 shouldStartAtEnd:(BOOL)a7 triggerName:(id)a8 targetTriggerState:(unint64_t)a9 triggerDelay:(double)a10 contentScale:(double)a11 opacity:(double)a12 fontSpec:(id)a13 fileProvider:(id)a14;
- (double)contentScale;
- (double)opacity;
- (double)triggerDelay;
- (unint64_t)targetTriggerState;
- (void)configureBounds:(id)a3;
- (void)configureLayer:(id)a3;
@end

@implementation _TUIMicaPlayerLayerConfig

- (_TUIMicaPlayerLayerConfig)initWithURL:(id)a3 gravity:(id)a4 textKey:(id)a5 textValue:(id)a6 shouldStartAtEnd:(BOOL)a7 triggerName:(id)a8 targetTriggerState:(unint64_t)a9 triggerDelay:(double)a10 contentScale:(double)a11 opacity:(double)a12 fontSpec:(id)a13 fileProvider:(id)a14
{
  id v23 = a3;
  id v24 = a4;
  id obj = a5;
  id v25 = a5;
  id v33 = a6;
  id v35 = a8;
  id v36 = a6;
  id v26 = a8;
  id v27 = a13;
  id v28 = a14;
  v37.receiver = self;
  v37.super_class = (Class)_TUIMicaPlayerLayerConfig;
  v29 = [(_TUIMicaPlayerLayerConfig *)&v37 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_url, a3);
    objc_storeStrong((id *)&v30->_gravity, a4);
    objc_storeStrong((id *)&v30->_textKey, obj);
    objc_storeStrong((id *)&v30->_textValue, v33);
    v30->_shouldStartAtEnd = a7;
    objc_storeStrong((id *)&v30->_triggerName, v35);
    v30->_targetTriggerState = a9;
    v30->_triggerDelay = a10;
    v30->_contentScale = a11;
    v30->_opacity = a12;
    objc_storeStrong((id *)&v30->_fontSpec, a13);
    objc_storeWeak((id *)&v30->_fileProvider, v28);
  }

  return v30;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p url=%@>", v4, self, self->_url];

  return (NSString *)v5;
}

- (void)configureBounds:(id)a3
{
}

- (void)configureLayer:(id)a3
{
  double contentScale = self->_contentScale;
  id v5 = a3;
  [v5 setContentsScale:contentScale];
  [v5 setRasterizationScale:self->_contentScale];
  double opacity = self->_opacity;
  *(float *)&double opacity = opacity;
  [v5 setOpacity:opacity];
  url = self->_url;
  gravity = self->_gravity;
  textKey = self->_textKey;
  textValue = self->_textValue;
  BOOL shouldStartAtEnd = self->_shouldStartAtEnd;
  triggerName = self->_triggerName;
  unint64_t targetTriggerState = self->_targetTriggerState;
  double triggerDelay = self->_triggerDelay;
  p_fileProvider = &self->_fileProvider;
  fontSpec = self->_fontSpec;
  id WeakRetained = objc_loadWeakRetained((id *)p_fileProvider);
  [v5 configWithURL:url gravity:gravity textKey:textKey textValue:textValue shouldStartAtEnd:shouldStartAtEnd triggerName:triggerName targetTriggerState:triggerDelay triggerDelay:targetTriggerState fontSpec:fontSpec fileProvider:WeakRetained];
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = TUIDynamicCast(v6, v5);

  if (v7)
  {
    url = self->_url;
    v9 = [v7 url];
    if (url != v9)
    {
      v10 = self->_url;
      v11 = [v7 url];
      if (![(NSURL *)v10 isEqual:v11])
      {
        BOOL v12 = 0;
        goto LABEL_36;
      }
      v43 = v11;
    }
    gravity = self->_gravity;
    v14 = [v7 gravity];
    if (gravity != v14)
    {
      v15 = self->_gravity;
      v3 = [v7 gravity];
      if (![(NSString *)v15 isEqualToString:v3])
      {
        BOOL v12 = 0;
        v11 = v43;
LABEL_34:

LABEL_35:
        if (url == v9)
        {
LABEL_37:

          goto LABEL_38;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    textKey = self->_textKey;
    v17 = [v7 textKey];
    v42 = textKey;
    if (textKey != v17)
    {
      v18 = self->_textKey;
      uint64_t v19 = [v7 textKey];
      v20 = v18;
      v21 = (void *)v19;
      if (![(NSString *)v20 isEqualToString:v19])
      {
        BOOL v12 = 0;
LABEL_32:

LABEL_33:
        v11 = v43;
        if (gravity == v14) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      v39 = v21;
    }
    textValue = self->_textValue;
    id v23 = [v7 textValue];
    v40 = textValue;
    v41 = v3;
    if (textValue != v23)
    {
      id v24 = self->_textValue;
      v38 = [v7 textValue];
      if (!-[NSString isEqualToString:](v24, "isEqualToString:"))
      {
        BOOL v12 = 0;
        v3 = v41;
LABEL_30:

LABEL_31:
        v21 = v39;
        if (v42 == v17) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }
    int shouldStartAtEnd = self->_shouldStartAtEnd;
    if (shouldStartAtEnd != [v7 shouldStartAtEnd])
    {
      BOOL v12 = 0;
      goto LABEL_29;
    }
    triggerName = self->_triggerName;
    id v27 = [v7 triggerName];
    objc_super v37 = triggerName;
    if (triggerName == v27
      || (id v28 = self->_triggerName,
          [v7 triggerName],
          id v36 = objc_claimAutoreleasedReturnValue(),
          -[NSString isEqualToString:](v28, "isEqualToString:")))
    {
      id targetTriggerState = self->_targetTriggerState;
      if (targetTriggerState == [v7 targetTriggerState]
        && (double triggerDelay = self->_triggerDelay, [v7 triggerDelay], triggerDelay == v31))
      {
        double opacity = self->_opacity;
        [v7 opacity];
        BOOL v12 = opacity == v33;
        BOOL v34 = opacity == v33;
      }
      else
      {
        BOOL v12 = 0;
        BOOL v34 = 0;
      }
      if (v37 == v27)
      {

        BOOL v12 = v34;
LABEL_29:
        v3 = v41;
        if (v40 == v23) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    else
    {
      BOOL v12 = 0;
    }

    goto LABEL_29;
  }
  BOOL v12 = 0;
LABEL_38:

  return v12;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)gravity
{
  return self->_gravity;
}

- (NSString)textKey
{
  return self->_textKey;
}

- (NSString)textValue
{
  return self->_textValue;
}

- (BOOL)shouldStartAtEnd
{
  return self->_shouldStartAtEnd;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (double)triggerDelay
{
  return self->_triggerDelay;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (double)opacity
{
  return self->_opacity;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (TUIFileResourceProviding)fileProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileProvider);

  return (TUIFileResourceProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fileProvider);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_textValue, 0);
  objc_storeStrong((id *)&self->_textKey, 0);
  objc_storeStrong((id *)&self->_gravity, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end