@interface _UIAssistantEntry
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
@end

@implementation _UIAssistantEntry

- (void).cxx_destruct
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  p_view = &self->_view;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  v14 = [WeakRetained pointerInteraction:v12 regionForRequest:v11 defaultRegion:v10];

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"_UIPointerInteractionAssistant.m" lineNumber:113 description:@"Assisted views must call -createRegionFromRect:targetView:identifier:selected: to create regions"];
    }
    objc_storeStrong(v14 + 11, self);
  }
  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  p_view = &self->_view;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  v9 = [WeakRetained pointerInteraction:v7 styleForRegion:v6];

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  p_view = &self->_view;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [WeakRetained pointerInteraction:v10 willEnterRegion:v9 animator:v8];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  p_view = &self->_view;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [WeakRetained pointerInteraction:v10 willExitRegion:v9 animator:v8];
}

@end