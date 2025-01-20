@interface TUIFeedHeightLayoutCondition
- (BOOL)evaluateWithRenderModel:(id)a3;
- (TUIFeedHeightLayoutCondition)initWithView:(id)a3 completion:(id)a4;
- (double)height;
- (void)updateWithView:(id)a3;
@end

@implementation TUIFeedHeightLayoutCondition

- (TUIFeedHeightLayoutCondition)initWithView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIFeedHeightLayoutCondition;
  v7 = [(TUIFeedBaseLayoutCondition *)&v10 initWithCompletion:a4];
  v8 = v7;
  if (v7) {
    [(TUIFeedHeightLayoutCondition *)v7 updateWithView:v6];
  }

  return v8;
}

- (BOOL)evaluateWithRenderModel:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  char state = (char)self->super._state;
  double height = self->_height;
  os_unfair_lock_unlock(&self->super._lock);
  if (state)
  {
    char v15 = 1;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    v8 = TUIDynamicCast(v7, v4);
    v9 = v8;
    if (v8)
    {
      objc_super v10 = [v8 info];
      v11 = [v10 objectForKeyedSubscript:@"TUIRenderInfoKeyIsFinal"];
      unsigned __int8 v12 = [v11 BOOLValue];

      v13 = [v9 sections];
      id v14 = [v13 count];
      char v15 = v14 != 0;

      if (v14 && (v12 & 1) == 0)
      {
        [v4 size];
        char v15 = v16 >= height;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  return v15;
}

- (void)updateWithView:(id)a3
{
  if (a3)
  {
    [a3 bounds];
    double Height = CGRectGetHeight(v6);
  }
  else
  {
    double Height = NAN;
  }
  os_unfair_lock_lock_with_options();
  self->_double height = Height;

  os_unfair_lock_unlock(&self->super._lock);
}

- (double)height
{
  return self->_height;
}

@end