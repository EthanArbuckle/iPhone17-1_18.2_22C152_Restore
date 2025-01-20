@interface _UIPointerAssistantRegion
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)targetView;
- (id)targetViewAsButton;
@end

@implementation _UIPointerAssistantRegion

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPointerAssistantRegion;
  v4 = [(UIPointerRegion *)&v7 copyWithZone:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_storeWeak(v4 + 10, WeakRetained);

  objc_storeStrong(v4 + 11, self->_assistant);
  *((unsigned char *)v4 + 72) = self->_selected;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIPointerAssistantRegion *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v16.receiver = self,
             v16.super_class = (Class)_UIPointerAssistantRegion,
             [(UIPointerRegion *)&v16 isEqual:v5]))
  {
    v6 = v5;
    if (self->_selected == *((unsigned __int8 *)v6 + 72))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
      id v8 = objc_loadWeakRetained(v6 + 10);
      if (WeakRetained == v8)
      {
        assistant = self->_assistant;
        id v11 = v6[11];
        v12 = assistant;
        v13 = (_UIAssistantEntry *)v11;
        v14 = v13;
        if (v12 == v13)
        {
          char v9 = 1;
        }
        else
        {
          char v9 = 0;
          if (v12 && v13) {
            char v9 = [(_UIAssistantEntry *)v12 isEqual:v13];
          }
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_UIPointerAssistantRegion;
  v4 = [(UIPointerRegion *)&v11 description];
  assistant = self->_assistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_super v7 = WeakRetained;
  if (self->_selected) {
    id v8 = @" selected";
  }
  else {
    id v8 = &stru_1ED0E84C0;
  }
  char v9 = [v3 stringWithFormat:@"%@ assistant=%@ targetView=%p%@", v4, assistant, WeakRetained, v8];

  return v9;
}

- (id)targetViewAsButton
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = WeakRetained;
    }
    else {
      v2 = 0;
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)targetView
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_destroyWeak((id *)&self->_targetView);
}

@end