@interface TUIRenderModelButton
- (BOOL)contextMenuIsPrimaryAction;
- (BOOL)enableBackgroundForHighlightPreview;
- (BOOL)enableShadowForHighlightPreview;
- (BOOL)isEqualToRenderModel:(id)a3;
- (NSArray)linkEntities;
- (NSDictionary)stateToButtonAttributes;
- (TUIAXAttributesProviding)axAttributes;
- (TUIRenderModelButton)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 stateToButtonAttributes:(id)a6 stateToRenderModel:(id)a7 imageModelIDToResource:(id)a8 actionHandler:(id)a9 viewState:(id)a10 linkEntities:(id)a11 type:(unint64_t)a12 role:(unint64_t)a13 userInterfaceStyle:(unint64_t)a14 enabled:(BOOL)a15 pressScale:(double)a16 touchInsets:(UIEdgeInsets)a17 pointer:(id)a18 focusStyle:(id)a19 menu:(id)a20 contextMenuIsPrimaryAction:(BOOL)a21 name:(id)a22 axAttributes:(id)a23 enableBackgroundForHighlightPreview:(BOOL)a24 enableShadowForHighlightPreview:(BOOL)a25;
- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4;
- (id)description;
- (unint64_t)role;
- (unint64_t)type;
- (unint64_t)userInterfaceStyle;
@end

@implementation TUIRenderModelButton

- (TUIRenderModelButton)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 stateToButtonAttributes:(id)a6 stateToRenderModel:(id)a7 imageModelIDToResource:(id)a8 actionHandler:(id)a9 viewState:(id)a10 linkEntities:(id)a11 type:(unint64_t)a12 role:(unint64_t)a13 userInterfaceStyle:(unint64_t)a14 enabled:(BOOL)a15 pressScale:(double)a16 touchInsets:(UIEdgeInsets)a17 pointer:(id)a18 focusStyle:(id)a19 menu:(id)a20 contextMenuIsPrimaryAction:(BOOL)a21 name:(id)a22 axAttributes:(id)a23 enableBackgroundForHighlightPreview:(BOOL)a24 enableShadowForHighlightPreview:(BOOL)a25
{
  double right = a17.right;
  double bottom = a17.bottom;
  double left = a17.left;
  double top = a17.top;
  id v32 = a6;
  id v33 = a11;
  id v34 = a23;
  v46.receiver = self;
  v46.super_class = (Class)TUIRenderModelButton;
  v35 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v46, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, a5, a7, a8, a9, a16, top, left, bottom, right, a10, a15, a18, a19, a20,
          a22);
  if (v35)
  {
    v36 = (NSArray *)[v33 copy];
    linkEntities = v35->_linkEntities;
    v35->_linkEntities = v36;

    v38 = (NSDictionary *)[v32 copy];
    stateToButtonAttributes = v35->_stateToButtonAttributes;
    v35->_stateToButtonAttributes = v38;

    v35->_type = a12;
    v35->_role = a13;
    v35->_userInterfaceStyle = a14;
    objc_storeStrong((id *)&v35->_axAttributes, a23);
    v35->_contextMenuIsPrimaryAction = a21;
    v35->_enableBackgroundForHighlightPreview = a24;
    v35->_enableShadowForHighlightPreview = a25;
  }

  return v35;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  v20.receiver = self;
  v20.super_class = (Class)TUIRenderModelButton;
  if (![(TUIRenderModelInteractive *)&v20 isEqualToRenderModel:v6]) {
    goto LABEL_10;
  }
  id type = self->_type;
  if (type != [v6 type]) {
    goto LABEL_10;
  }
  id role = self->_role;
  if (role != [v6 role]) {
    goto LABEL_10;
  }
  id userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle != [v6 userInterfaceStyle]) {
    goto LABEL_10;
  }
  stateToButtonAttributes = self->_stateToButtonAttributes;
  uint64_t v11 = [v6 stateToButtonAttributes];
  if (stateToButtonAttributes == (NSDictionary *)v11)
  {
  }
  else
  {
    v12 = (void *)v11;
    v13 = self->_stateToButtonAttributes;
    v14 = [v6 stateToButtonAttributes];
    LODWORD(v13) = [(NSDictionary *)v13 isEqualToDictionary:v14];

    if (!v13) {
      goto LABEL_10;
    }
  }
  axAttributes = self->_axAttributes;
  v16 = [v6 axAttributes];

  if (axAttributes == v16)
  {
    int contextMenuIsPrimaryAction = self->_contextMenuIsPrimaryAction;
    BOOL v17 = contextMenuIsPrimaryAction == [v6 contextMenuIsPrimaryAction];
    goto LABEL_11;
  }
LABEL_10:
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t type = self->_type;
  unint64_t role = self->_role;
  unsigned int v7 = [(TUIRenderModelInteractive *)self enabled];
  stateToButtonAttributes = self->_stateToButtonAttributes;
  v9 = [(TUIRenderModelInteractive *)self stateToModel];
  v10 = +[NSString stringWithFormat:@"<%@ %p type=%lu role=%lu enabled=%d stateToAttr=%@ stateToModel=%@>", v4, self, type, role, v7, stateToButtonAttributes, v9];

  return v10;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v39 = objc_alloc((Class)objc_opt_class());
  v43 = [(TUIRenderModelInteractive *)self reuseIdentifier];
  v42 = [(TUIRenderModelInteractive *)self identifier];
  v41 = [(TUIRenderModelInteractive *)self style];
  v38 = [(TUIRenderModelButton *)self stateToButtonAttributes];
  v44 = [(TUIRenderModelInteractive *)self stateToModel];
  v37 = ((void (*)(void *, unint64_t))a4)(v44, a3);
  v36 = [(TUIRenderModelInteractive *)self imageModelIDToResource];
  v30 = [(TUIRenderModelInteractive *)self actionHandler];
  v29 = [(TUIRenderModelInteractive *)self viewState];
  v35 = [(TUIRenderModelButton *)self linkEntities];
  unint64_t v34 = [(TUIRenderModelButton *)self type];
  unint64_t v33 = [(TUIRenderModelButton *)self role];
  unint64_t v32 = [(TUIRenderModelButton *)self userInterfaceStyle];
  unsigned __int8 v31 = [(TUIRenderModelInteractive *)self enabled];
  [(TUIRenderModelInteractive *)self pressScale];
  double v8 = v7;
  [(TUIRenderModelInteractive *)self touchInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v28 = [(TUIRenderModelInteractive *)self pointer];
  v27 = [(TUIRenderModelInteractive *)self focusStyle];
  v26 = [(TUIRenderModelInteractive *)self menu];
  unsigned __int8 v17 = [(TUIRenderModelButton *)self contextMenuIsPrimaryAction];
  v18 = [(TUIRenderModelInteractive *)self name];
  v19 = [(TUIRenderModelButton *)self axAttributes];
  unsigned __int8 v20 = [(TUIRenderModelButton *)self enableBackgroundForHighlightPreview];
  BYTE1(v25) = [(TUIRenderModelButton *)self enableShadowForHighlightPreview];
  LOBYTE(v25) = v20;
  LOBYTE(v24) = v17;
  LOBYTE(v23) = v31;
  id v40 = objc_msgSend(v39, "initWithReuseIdentifier:identifier:style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:", v43, v42, v41, v38, v37, v36, v8, v10, v12, v14, v16, v30, v29, v35, v34,
          v33,
          v32,
          v23,
          v28,
          v27,
          v26,
          v24,
          v18,
          v19,
          v25);

  TUIRenderModelCopyProperties(v40, self);
  v21 = self;

  return v21;
}

- (NSDictionary)stateToButtonAttributes
{
  return self->_stateToButtonAttributes;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)role
{
  return self->_role;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (TUIAXAttributesProviding)axAttributes
{
  return self->_axAttributes;
}

- (BOOL)contextMenuIsPrimaryAction
{
  return self->_contextMenuIsPrimaryAction;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (BOOL)enableShadowForHighlightPreview
{
  return self->_enableShadowForHighlightPreview;
}

- (BOOL)enableBackgroundForHighlightPreview
{
  return self->_enableBackgroundForHighlightPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);

  objc_storeStrong((id *)&self->_stateToButtonAttributes, 0);
}

@end