@interface _LayerHUDPropertiesListener
- (CAMetalLayer)m_metalLayer;
- (_LayerHUDPropertiesListener)initWithLayer:(id)a3 andOverlay:(void *)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setM_metalLayer:(id)a3;
@end

@implementation _LayerHUDPropertiesListener

- (_LayerHUDPropertiesListener)initWithLayer:(id)a3 andOverlay:(void *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LayerHUDPropertiesListener;
  v7 = [(_LayerHUDPropertiesListener *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(_LayerHUDPropertiesListener *)v7 setM_metalLayer:v6];
    v8->m_overlay = a4;
    v9 = [(_LayerHUDPropertiesListener *)v8 m_metalLayer];
    [v9 addObserver:v8 forKeyPath:@"developerHUDProperties" options:1 context:0];
  }
  return v8;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_metalLayer);
  [WeakRetained removeObserver:self forKeyPath:@"developerHUDProperties"];

  v4.receiver = self;
  v4.super_class = (Class)_LayerHUDPropertiesListener;
  [(_LayerHUDPropertiesListener *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"developerHUDProperties", a4, a5, a6)
    && *(unsigned char *)self->m_overlay)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_metalLayer);
    v7 = [WeakRetained developerHUDProperties];
    v8 = [v7 objectForKeyedSubscript:@"mode"];

    if (*((unsigned char *)self->m_overlay + 1))
    {
      uint64_t v9 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = [v8 isEqualToString:@"default"];
      }
      else {
        uint64_t v9 = 0;
      }
    }
    [*((id *)self->m_overlay + 1) setEnabled:v9];
    id v10 = objc_loadWeakRetained((id *)&self->m_metalLayer);
    objc_super v11 = [v10 developerHUDProperties];
    id v26 = [v11 objectForKeyedSubscript:@"logging"];

    if (*((unsigned char *)self->m_overlay + 1))
    {
      uint64_t v12 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = [v26 isEqualToString:@"default"];
      }
      else {
        uint64_t v12 = 0;
      }
    }
    [*((id *)self->m_overlay + 1) setLoggingEnabled:v12];
    if (![*((id *)self->m_overlay + 1) alignment])
    {
      id v13 = objc_loadWeakRetained((id *)&self->m_metalLayer);
      v14 = [v13 developerHUDProperties];
      v15 = [v14 objectForKeyedSubscript:@"alignment"];

      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*((id *)self->m_overlay + 1) setAlignment:[v15 integerValue] & 0x1F];
        }
      }
    }
    id v16 = objc_loadWeakRetained((id *)&self->m_metalLayer);
    v17 = [v16 developerHUDProperties];
    v18 = [v17 objectForKeyedSubscript:@"positionX"];

    id v19 = objc_loadWeakRetained((id *)&self->m_metalLayer);
    v20 = [v19 developerHUDProperties];
    v21 = [v20 objectForKeyedSubscript:@"positionY"];

    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & (v21 != 0)) == 1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v18 floatValue];
          float v23 = v22;
          [v21 floatValue];
          [*((id *)self->m_overlay + 1) setPosition:v23, v24];
          [*((id *)self->m_overlay + 1) setAlignment:1];
        }
      }
    }
  }
}

- (CAMetalLayer)m_metalLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_metalLayer);

  return (CAMetalLayer *)WeakRetained;
}

- (void)setM_metalLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end