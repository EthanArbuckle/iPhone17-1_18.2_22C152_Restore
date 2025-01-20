@interface TUIRenderModelInteractive
- (BOOL)enabled;
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSDictionary)imageModelIDToResource;
- (NSDictionary)stateToModel;
- (NSString)description;
- (NSString)name;
- (NSString)reuseIdentifier;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIElementActionTriggerHandler)actionHandler;
- (TUIFocusStyle)focusStyle;
- (TUIIdentifier)identifier;
- (TUIMenuModel)menu;
- (TUIMutableDynamicValue)viewState;
- (TUIPointer)pointer;
- (TUIRenderModel)submodel;
- (TUIRenderModelInteractive)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 elementStates:(id)a6 actionHandler:(id)a7 viewState:(id)a8 enabled:(BOOL)a9 pressScale:(double)a10 touchInsets:(UIEdgeInsets)a11;
- (TUIRenderModelInteractive)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 elementStates:(id)a6 imageModelIDToResource:(id)a7 actionHandler:(id)a8 viewState:(id)a9 enabled:(BOOL)a10 pressScale:(double)a11 touchInsets:(UIEdgeInsets)a12 pointer:(id)a13 focusStyle:(id)a14 menu:(id)a15 name:(id)a16;
- (TUIRenderStyling)style;
- (UIEdgeInsets)touchInsets;
- (double)pressScale;
- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelInteractive

- (TUIRenderModelInteractive)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 elementStates:(id)a6 actionHandler:(id)a7 viewState:(id)a8 enabled:(BOOL)a9 pressScale:(double)a10 touchInsets:(UIEdgeInsets)a11
{
  LOBYTE(v12) = a9;
  return -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](self, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, a5, a6, 0, a7, a10, a11.top, a11.left, a11.bottom, a11.right, a8, v12, 0, 0, 0,
           0);
}

- (TUIRenderModelInteractive)initWithReuseIdentifier:(id)a3 identifier:(id)a4 style:(id)a5 elementStates:(id)a6 imageModelIDToResource:(id)a7 actionHandler:(id)a8 viewState:(id)a9 enabled:(BOOL)a10 pressScale:(double)a11 touchInsets:(UIEdgeInsets)a12 pointer:(id)a13 focusStyle:(id)a14 menu:(id)a15 name:(id)a16
{
  CGFloat right = a12.right;
  CGFloat bottom = a12.bottom;
  CGFloat left = a12.left;
  CGFloat top = a12.top;
  id v26 = a3;
  id v27 = a4;
  id obj = a5;
  id v53 = a5;
  id v28 = a6;
  id v29 = a7;
  id v49 = a8;
  id v30 = a8;
  v31 = v28;
  id v52 = v30;
  id v51 = a9;
  id v32 = a13;
  id v33 = a14;
  id v34 = a15;
  id v35 = a16;
  v54.receiver = self;
  v54.super_class = (Class)TUIRenderModelInteractive;
  v36 = [(TUIRenderModelInteractive *)&v54 init];
  if (v36)
  {
    v37 = (TUIIdentifier *)[v27 copyWithZone:0];
    identifier = v36->_identifier;
    v36->_identifier = v37;

    v39 = (NSString *)[v26 copy];
    reuseIdentifier = v36->_reuseIdentifier;
    v36->_reuseIdentifier = v39;

    objc_storeStrong((id *)&v36->_style, obj);
    v41 = (NSDictionary *)[v31 copy];
    stateToModel = v36->_stateToModel;
    v36->_stateToModel = v41;

    v43 = (NSDictionary *)[v29 copy];
    imageModelIDToResource = v36->_imageModelIDToResource;
    v36->_imageModelIDToResource = v43;

    v45 = (NSString *)[v35 copy];
    name = v36->_name;
    v36->_name = v45;

    objc_storeStrong((id *)&v36->_pointer, a13);
    objc_storeStrong((id *)&v36->_focusStyle, a14);
    objc_storeStrong((id *)&v36->_menu, a15);
    objc_storeStrong((id *)&v36->_viewState, a9);
    v36->_enabled = a10;
    v36->_pressScale = a11;
    v36->_touchInsets.CGFloat top = top;
    v36->_touchInsets.CGFloat left = left;
    v36->_touchInsets.CGFloat bottom = bottom;
    v36->_touchInsets.CGFloat right = right;
    objc_storeStrong((id *)&v36->_actionHandler, v49);
  }

  return v36;
}

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModel)submodel
{
  return 0;
}

- (NSArray)debugContainedSubmodels
{
  return [(NSDictionary *)self->_stateToModel allValues];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p stateToModel=%@, enabled=%d>", v4, self, self->_stateToModel, self->_enabled];

  return (NSString *)v5;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  stateToModel = self->_stateToModel;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  long long v8 = *(_OWORD *)&a4->c;
  long long v12 = *(_OWORD *)&a4->a;
  long long v13 = v8;
  v10[2] = sub_15E158;
  v10[3] = &unk_256908;
  id v11 = v6;
  long long v14 = *(_OWORD *)&a4->tx;
  id v9 = v6;
  [(NSDictionary *)stateToModel enumerateKeysAndObjectsUsingBlock:v10];
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  stateToModel = self->_stateToModel;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  long long v14 = *(_OWORD *)&a4->c;
  long long v22 = *(_OWORD *)&a4->a;
  long long v23 = v14;
  v18[2] = sub_15E29C;
  v18[3] = &unk_256930;
  long long v24 = *(_OWORD *)&a4->tx;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(NSDictionary *)stateToModel enumerateKeysAndObjectsUsingBlock:v18];
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  return [(TUIRenderModelInteractive *)self _copyAppearanceWithFlags:a3 statesCopyProc:TUIElementStateRenderModelMapCopyForInitialAppearanceWithFlags];
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  return [(TUIRenderModelInteractive *)self _copyAppearanceWithFlags:a3 statesCopyProc:TUIElementStateRenderModelMapCopyForFinalAppearanceWithFlags];
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = (unsigned __int8 *)v4;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      TUIDynamicCast(v6, v4);
      v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v7;
    if (TUIRenderModelIsEqualToRenderModel(self, v7)
      && self->_viewState == (TUIMutableDynamicValue *)*((void *)v9 + 6)
      && ((reuseIdentifier = self->_reuseIdentifier, reuseIdentifier == *((NSString **)v9 + 4))
       || -[NSString isEqualToString:](reuseIdentifier, "isEqualToString:"))
      && ((name = self->_name, name == *((NSString **)v9 + 10)) || -[NSString isEqualToString:](name, "isEqualToString:"))&& self->_enabled == v9[8]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_touchInsets.top, *(float64x2_t *)(v9 + 136)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_touchInsets.bottom, *(float64x2_t *)(v9 + 152)))), 0xFuLL))) & 1) != 0&& ((stateToModel = self->_stateToModel, stateToModel == *((NSDictionary **)v9 + 8))|| -[NSDictionary isEqual:](stateToModel, "isEqual:"))&& ((imageModelIDToResource = self->_imageModelIDToResource, imageModelIDToResource == *((NSDictionary **)v9 + 9))|| -[NSDictionary isEqualToDictionary:](imageModelIDToResource, "isEqualToDictionary:"))&& ((style = self->_style, style == *((TUIRenderStyling **)v9 + 7))
       || -[TUIRenderStyling isEqualToStyle:](style, "isEqualToStyle:"))
      && ((actionHandler = self->_actionHandler, actionHandler == *((TUIElementActionTriggerHandler **)v9 + 5))
       || -[TUIElementActionTriggerHandler isEqualToHandler:](actionHandler, "isEqualToHandler:")))
    {
      menu = self->_menu;
      if (menu == *((TUIMenuModel **)v9 + 13)) {
        unsigned __int8 v8 = 1;
      }
      else {
        unsigned __int8 v8 = -[TUIMenuModel isEqual:](menu, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelInteractive *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  reuseIdentifier = self->_reuseIdentifier;
  identifier = self->_identifier;
  style = self->_style;
  id v11 = ((void (*)(NSDictionary *, unint64_t))a4)(self->_stateToModel, a3);
  LOBYTE(v14) = self->_enabled;
  id v12 = objc_msgSend(v7, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", reuseIdentifier, identifier, style, v11, self->_imageModelIDToResource, self->_actionHandler, self->_pressScale, self->_touchInsets.top, self->_touchInsets.left, self->_touchInsets.bottom, self->_touchInsets.right, self->_viewState, v14, self->_pointer, self->_focusStyle, self->_menu,
          self->_name);

  TUIRenderModelCopyProperties(v12, self);
  return v12;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  return 0;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (TUIRenderStyling)style
{
  return self->_style;
}

- (NSDictionary)stateToModel
{
  return self->_stateToModel;
}

- (NSDictionary)imageModelIDToResource
{
  return self->_imageModelIDToResource;
}

- (NSString)name
{
  return self->_name;
}

- (TUIPointer)pointer
{
  return self->_pointer;
}

- (TUIFocusStyle)focusStyle
{
  return self->_focusStyle;
}

- (TUIMenuModel)menu
{
  return self->_menu;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)pressScale
{
  return self->_pressScale;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_focusStyle, 0);
  objc_storeStrong((id *)&self->_pointer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_imageModelIDToResource, 0);
  objc_storeStrong((id *)&self->_stateToModel, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end