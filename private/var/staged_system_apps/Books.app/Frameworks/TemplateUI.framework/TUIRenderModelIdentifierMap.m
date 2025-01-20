@interface TUIRenderModelIdentifierMap
- (TUIRenderModelIdentifierMap)init;
- (TUIRenderModelIdentifierMap)initWithView:(id)a3;
- (id)collectInterestWithInvalidationQueue:(id)a3;
- (id)mapViewModels:(id)a3;
- (unint64_t)viewIndexForIdentifier:(id)a3;
@end

@implementation TUIRenderModelIdentifierMap

- (TUIRenderModelIdentifierMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIRenderModelIdentifierMap;
  v2 = [(TUIRenderModelIdentifierMap *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TUIRenderModelIdentifierMap);
    view = v2->_view;
    v2->_view = v3;
  }
  return v2;
}

- (TUIRenderModelIdentifierMap)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIRenderModelIdentifierMap;
  objc_super v6 = [(TUIRenderModelIdentifierMap *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

- (id)mapViewModels:(id)a3
{
  v3 = [(_TUIRenderModelIdentifierMap *)self->_view mapRenderModels:a3];

  return v3;
}

- (unint64_t)viewIndexForIdentifier:(id)a3
{
  return [(_TUIRenderModelIdentifierMap *)self->_view indexForIdentifier:a3];
}

- (id)collectInterestWithInvalidationQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [(_TUIRenderModelIdentifierMap *)self->_view _appendInterests:v5];
  objc_super v6 = [[TUIRenderModelIdentifierInterest alloc] initWithQueue:v4 interests:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end