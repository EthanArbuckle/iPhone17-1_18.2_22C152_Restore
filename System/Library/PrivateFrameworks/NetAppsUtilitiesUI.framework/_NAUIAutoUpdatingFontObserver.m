@interface _NAUIAutoUpdatingFontObserver
+ (BOOL)canObserveFontsForTarget:(id)a3;
- (_NAUIAutoUpdatingFontObserver)initWithTarget:(id)a3;
- (id)target;
- (void)dealloc;
- (void)updateDyamicFontForCurrentContentSize;
@end

@implementation _NAUIAutoUpdatingFontObserver

- (_NAUIAutoUpdatingFontObserver)initWithTarget:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() canObserveFontsForTarget:v4])
  {
    v17.receiver = self;
    v17.super_class = (Class)_NAUIAutoUpdatingFontObserver;
    v5 = [(_NAUIAutoUpdatingFontObserver *)&v17 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak(&v5->_target, v4);
      objc_initWeak(&location, v6);
      v7 = [MEMORY[0x263F08A00] defaultCenter];
      v8 = [MEMORY[0x263F08A48] mainQueue];
      uint64_t v9 = *MEMORY[0x263F1D158];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __48___NAUIAutoUpdatingFontObserver_initWithTarget___block_invoke;
      v14[3] = &unk_264627D38;
      objc_copyWeak(&v15, &location);
      uint64_t v10 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v14];
      id notificationObserver = v6->_notificationObserver;
      v6->_id notificationObserver = (id)v10;

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)canObserveFontsForTarget:(id)a3
{
  id v3 = a3;
  BOOL v6 = 1;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v3 viewForLastBaselineLayout],
          id v4 = objc_claimAutoreleasedReturnValue(),
          char v5 = objc_opt_respondsToSelector(),
          v4,
          (v5 & 1) == 0))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)updateDyamicFontForCurrentContentSize
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained(p_target);
    objc_msgSend(v5, "naui_dynamicFontTextStyleDescriptor");
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = objc_loadWeakRetained(p_target);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(p_target);
      objc_msgSend(v8, "naui_reloadDynamicFontWithTextStyleDescriptor:", v13);
    }
    id v9 = objc_loadWeakRetained(p_target);
    uint64_t v10 = [v9 viewForLastBaselineLayout];

    if (objc_opt_respondsToSelector())
    {
      v11 = +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:v13];
      [v10 setFont:v11];
    }
    id v12 = objc_loadWeakRetained(p_target);
    [v12 setNeedsLayout];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_notificationObserver];

  v4.receiver = self;
  v4.super_class = (Class)_NAUIAutoUpdatingFontObserver;
  [(_NAUIAutoUpdatingFontObserver *)&v4 dealloc];
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_notificationObserver, 0);
}

@end