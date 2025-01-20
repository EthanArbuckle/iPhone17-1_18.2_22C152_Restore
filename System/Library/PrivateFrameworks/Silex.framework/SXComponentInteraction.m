@interface SXComponentInteraction
- (BOOL)handlesType:(unint64_t)a3;
- (SXComponentInteraction)initWithComponentView:(id)a3 handler:(id)a4 types:(unint64_t)a5;
- (SXComponentInteractionHandler)handler;
- (SXComponentView)componentView;
- (unint64_t)types;
@end

@implementation SXComponentInteraction

- (SXComponentInteraction)initWithComponentView:(id)a3 handler:(id)a4 types:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SXComponentInteraction;
  v10 = [(SXComponentInteraction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_componentView, v8);
    objc_storeStrong((id *)&v11->_handler, a4);
    v11->_types = a5;
  }

  return v11;
}

- (BOOL)handlesType:(unint64_t)a3
{
  return (a3 & ~[(SXComponentInteraction *)self types]) == 0;
}

- (SXComponentView)componentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentView);
  return (SXComponentView *)WeakRetained;
}

- (SXComponentInteractionHandler)handler
{
  return self->_handler;
}

- (unint64_t)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_destroyWeak((id *)&self->_componentView);
}

@end