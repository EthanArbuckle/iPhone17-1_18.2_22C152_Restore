@interface TUIRenderModelNavigationItem
+ (id)renderModelWithItemType:(unint64_t)a3 identifier:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 title:(id)a7 attributedTitle:(id)a8 image:(id)a9 enabled:(BOOL)a10 buttonType:(unint64_t)a11 buttonRole:(unint64_t)a12 width:(double)a13 minWidth:(double)a14 maxWidth:(double)a15 text:(id)a16 searchTextMaxLength:(int64_t)a17 placeholderText:(id)a18 keyboardAppearance:(unint64_t)a19 navigationBarBackgroundOpacity:(double)a20 observeTrigger:(id)a21 observeTriggerValue:(unint64_t)a22 ignoreInsetsForOpacityTrigger:(BOOL)a23 menu:(id)a24 subview:(id)a25 axAttributes:(id)a26 refId:(id)a27 refInstance:(id)a28 hostingIdentifiers:(id)a29 hostingProperties:(id)a30;
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)ignoreInsetsForOpacityTrigger;
- (BOOL)isEnabled;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)hostingIdentifiers;
- (NSArray)hostingProperties;
- (NSAttributedString)attributedTitle;
- (NSAttributedString)placeholderText;
- (NSDictionary)imageModelIDToResource;
- (NSString)observeTrigger;
- (NSString)refId;
- (NSString)refInstance;
- (NSString)text;
- (NSString)title;
- (TUIAXAttributes)axAttributes;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIElementActionTriggerHandler)actionHandler;
- (TUIIdentifier)identifier;
- (TUIMenuModel)menu;
- (TUIRenderModelNavigationItem)initWithItemType:(unint64_t)a3 identifier:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 title:(id)a7 attributedTitle:(id)a8 image:(id)a9 enabled:(BOOL)a10 buttonType:(unint64_t)a11 buttonRole:(unint64_t)a12 width:(double)a13 minWidth:(double)a14 maxWidth:(double)a15 text:(id)a16 searchTextMaxLength:(int64_t)a17 placeholderText:(id)a18 keyboardAppearance:(unint64_t)a19 navigationBarBackgroundOpacity:(double)a20 observeTrigger:(id)a21 observeTriggerValue:(unint64_t)a22 ignoreInsetsForOpacityTrigger:(BOOL)a23 menu:(id)a24 subview:(id)a25 axAttributes:(id)a26 refId:(id)a27 refInstance:(id)a28 hostingIdentifiers:(id)a29 hostingProperties:(id)a30;
- (TUIRenderModelSubviews)subviewsModel;
- (UIImage)image;
- (double)maxWidth;
- (double)minWidth;
- (double)navigationBarBackgroundOpacity;
- (double)width;
- (id)renderItemWithFactory:(id)a3;
- (id)renderSearchControllerWithFactory:(id)a3;
- (id)renderViewWithFactory:(id)a3;
- (int64_t)searchTextMaxLength;
- (unint64_t)buttonRole;
- (unint64_t)buttonType;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)keyboardAppearance;
- (unint64_t)kind;
- (unint64_t)observeTriggerValue;
- (void)_takeAction:(id)a3;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSubviewsModel:(id)a3;
@end

@implementation TUIRenderModelNavigationItem

- (TUIRenderModelNavigationItem)initWithItemType:(unint64_t)a3 identifier:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 title:(id)a7 attributedTitle:(id)a8 image:(id)a9 enabled:(BOOL)a10 buttonType:(unint64_t)a11 buttonRole:(unint64_t)a12 width:(double)a13 minWidth:(double)a14 maxWidth:(double)a15 text:(id)a16 searchTextMaxLength:(int64_t)a17 placeholderText:(id)a18 keyboardAppearance:(unint64_t)a19 navigationBarBackgroundOpacity:(double)a20 observeTrigger:(id)a21 observeTriggerValue:(unint64_t)a22 ignoreInsetsForOpacityTrigger:(BOOL)a23 menu:(id)a24 subview:(id)a25 axAttributes:(id)a26 refId:(id)a27 refInstance:(id)a28 hostingIdentifiers:(id)a29 hostingProperties:(id)a30
{
  id v76 = a4;
  id v74 = a5;
  id obj = a6;
  id v73 = a6;
  id v79 = a7;
  id v78 = a8;
  id v72 = a9;
  id v77 = a16;
  id v38 = a18;
  id v75 = a21;
  id v71 = a24;
  id v39 = a25;
  id v40 = a26;
  id v41 = a27;
  id v42 = a28;
  id v43 = a29;
  id v44 = a30;
  v80.receiver = self;
  v80.super_class = (Class)TUIRenderModelNavigationItem;
  v45 = [(TUIRenderModelNavigationItem *)&v80 init];
  v46 = v45;
  if (v45)
  {
    v45->_itemType = a3;
    v47 = (TUIIdentifier *)[v76 copyWithZone:0];
    identifier = v46->_identifier;
    v46->_identifier = v47;

    v49 = (NSDictionary *)[v74 copy];
    imageModelIDToResource = v46->_imageModelIDToResource;
    v46->_imageModelIDToResource = v49;

    objc_storeStrong((id *)&v46->_actionHandler, obj);
    v51 = (NSString *)[v79 copy];
    title = v46->_title;
    v46->_title = v51;

    v46->_searchTextMaxLength = a17;
    v53 = (NSAttributedString *)[v78 copy];
    attributedTitle = v46->_attributedTitle;
    v46->_attributedTitle = v53;

    objc_storeStrong((id *)&v46->_image, a9);
    v46->_enabled = a10;
    v46->_buttonType = a11;
    v46->_buttonRole = a12;
    v46->_width = a13;
    v46->_minWidth = a14;
    v46->_maxWidth = a15;
    v55 = (NSString *)[v77 copy];
    text = v46->_text;
    v46->_text = v55;

    v57 = (NSAttributedString *)[v38 copy];
    placeholderText = v46->_placeholderText;
    v46->_placeholderText = v57;

    v59 = (NSString *)[v75 copy];
    observeTrigger = v46->_observeTrigger;
    v46->_observeTrigger = v59;

    v46->_observeTriggerValue = a22;
    v46->_ignoreInsetsForOpacityTrigger = a23;
    objc_storeStrong((id *)&v46->_subviewsModel, a25);
    v46->_navigationBarBackgroundOpacity = a20;
    v46->_keyboardAppearance = a19;
    objc_storeStrong((id *)&v46->_menu, a24);
    v61 = (TUIAXAttributes *)[v40 copy];
    axAttributes = v46->_axAttributes;
    v46->_axAttributes = v61;

    objc_storeStrong((id *)&v46->_refId, a27);
    objc_storeStrong((id *)&v46->_refInstance, a28);
    v63 = (NSArray *)[v43 copy];
    hostingIdentifiers = v46->_hostingIdentifiers;
    v46->_hostingIdentifiers = v63;

    v65 = (NSArray *)[v44 copy];
    hostingProperties = v46->_hostingProperties;
    v46->_hostingProperties = v65;
  }
  return v46;
}

+ (id)renderModelWithItemType:(unint64_t)a3 identifier:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 title:(id)a7 attributedTitle:(id)a8 image:(id)a9 enabled:(BOOL)a10 buttonType:(unint64_t)a11 buttonRole:(unint64_t)a12 width:(double)a13 minWidth:(double)a14 maxWidth:(double)a15 text:(id)a16 searchTextMaxLength:(int64_t)a17 placeholderText:(id)a18 keyboardAppearance:(unint64_t)a19 navigationBarBackgroundOpacity:(double)a20 observeTrigger:(id)a21 observeTriggerValue:(unint64_t)a22 ignoreInsetsForOpacityTrigger:(BOOL)a23 menu:(id)a24 subview:(id)a25 axAttributes:(id)a26 refId:(id)a27 refInstance:(id)a28 hostingIdentifiers:(id)a29 hostingProperties:(id)a30
{
  id v47 = a30;
  id v46 = a29;
  id v45 = a28;
  id v44 = a27;
  id v43 = a26;
  id v59 = a25;
  id v58 = a24;
  id v57 = a21;
  id v41 = a18;
  id v42 = a16;
  id v40 = a9;
  id v49 = a8;
  id v56 = a7;
  id v51 = a6;
  id v34 = a5;
  id v35 = a4;
  LOBYTE(v39) = a23;
  LOBYTE(v38) = a10;
  v36 = -[TUIRenderModelNavigationItem initWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:]([TUIRenderModelNavigationItem alloc], "initWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:", a3, v35, v34, v51, v56, v49, a13, a14, a15, a20, v40, v38, a11, a12,
          v42,
          a17,
          v41,
          a19,
          v57,
          a22,
          v39,
          v58,
          v59,
          v43,
          v44,
          v45,
          v46,
          v47);

  return v36;
}

- (unint64_t)kind
{
  return 5;
}

- (id)renderItemWithFactory:(id)a3
{
  id v4 = a3;
  v5 = [(TUIRenderModelNavigationItem *)self menu];
  if ([v5 isPrimary]) {
    v6 = 0;
  }
  else {
    v6 = "_takeAction:";
  }
  v7 = [(TUIRenderModelNavigationItem *)self subviewsModel];
  if (v7
    || [(TUIRenderModelNavigationItem *)self buttonType]
    || ([(TUIRenderModelNavigationItem *)self attributedTitle],
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    v8 = objc_alloc_init(TUINavigationItemView);
    [(TUINavigationItemView *)v8 setFactory:v4];
    [(TUINavigationItemView *)v8 configureWithModel:self];
    v9 = [[TUIBarButtonItem alloc] initWithCustomView:v8];
    v10 = [(TUIRenderModelNavigationItem *)self title];
    [(TUIBarButtonItem *)v9 setTitle:v10];

    [(TUIBarButtonItem *)v9 setTarget:self];
    [(TUIBarButtonItem *)v9 setAction:v6];

    goto LABEL_9;
  }
  uint64_t v16 = [(TUIRenderModelNavigationItem *)self title];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(TUIRenderModelNavigationItem *)self image];

    if (v18) {
      goto LABEL_8;
    }
  }
  v19 = [TUIBarButtonItem alloc];
  v20 = [(TUIRenderModelNavigationItem *)self title];
  v9 = [(TUIBarButtonItem *)v19 initWithTitle:v20 style:0 target:self action:v6];

  [(TUIRenderModelNavigationItem *)self width];
  -[TUIBarButtonItem setWidth:](v9, "setWidth:");
  [(TUIRenderModelNavigationItem *)self minWidth];
  -[TUIBarButtonItem _setMinimumWidth:](v9, "_setMinimumWidth:");
  [(TUIRenderModelNavigationItem *)self maxWidth];
  -[TUIBarButtonItem _setMaximumWidth:](v9, "_setMaximumWidth:");
LABEL_9:
  v11 = [(TUIRenderModelNavigationItem *)self attributedTitle];
  [(TUIBarButtonItem *)v9 setAttributedTitle:v11];

  v12 = [(TUIRenderModelNavigationItem *)self image];
  [(TUIBarButtonItem *)v9 setImage:v12];

  [(TUIBarButtonItem *)v9 setEnabled:[(TUIRenderModelNavigationItem *)self isEnabled]];
  [(TUIBarButtonItem *)v9 setButtonType:[(TUIRenderModelNavigationItem *)self buttonType]];
  [(TUIBarButtonItem *)v9 setButtonRole:[(TUIRenderModelNavigationItem *)self buttonRole]];
  [(TUIRenderModelNavigationItem *)self width];
  -[TUIBarButtonItem setButtonWidth:](v9, "setButtonWidth:");
  [(TUIRenderModelNavigationItem *)self minWidth];
  -[TUIBarButtonItem setMinButtonWidth:](v9, "setMinButtonWidth:");
  [(TUIRenderModelNavigationItem *)self maxWidth];
  -[TUIBarButtonItem setMaxButtonWidth:](v9, "setMaxButtonWidth:");
  v13 = [(TUIRenderModelNavigationItem *)self imageModelIDToResource];
  [(TUIBarButtonItem *)v9 setImageModelIDToResource:v13];

  [(TUIBarButtonItem *)v9 setMenuModel:v5];
  v14 = [(TUIRenderModelNavigationItem *)self axAttributes];
  [(TUIBarButtonItem *)v9 setAxAttributes:v14];

  return v9;
}

- (void)_takeAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  TUIDynamicCast(v5, v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  v7 = TUIDynamicCast(v6, v4);

  v8 = objc_opt_new();
  if (v10) {
    [v8 setObject:v10 forKeyedSubscript:@"sourceView"];
  }
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:@"sourceBarButtonItem"];
  }
  v9 = [(TUIRenderModelNavigationItem *)self actionHandler];
  [v9 invoke:@"press" arguments:v8];
}

- (id)renderViewWithFactory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(TUINavigationItemView);
  [(TUINavigationItemView *)v5 setFactory:v4];

  [(TUINavigationItemView *)v5 configureWithModel:self];

  return v5;
}

- (id)renderSearchControllerWithFactory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(TUISearchController);
  [(TUISearchController *)v5 setFactory:v4];

  [(TUISearchController *)v5 configureWithModel:self];

  return v5;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = TUIDynamicCast(v5, v4);

  if (!TUIRenderModelIsEqualToRenderModel(self, (void *)v6)) {
    goto LABEL_32;
  }
  title = self->_title;
  if (title != *(NSString **)(v6 + 32) && !-[NSString isEqualToString:](title, "isEqualToString:")) {
    goto LABEL_32;
  }
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != *(NSAttributedString **)(v6 + 40)
    && !-[NSAttributedString isEqualToAttributedString:](attributedTitle, "isEqualToAttributedString:"))
  {
    goto LABEL_32;
  }
  if (((image = self->_image, image == *(UIImage **)(v6 + 48)) || -[UIImage isEqual:](image, "isEqual:"))
    && self->_enabled == *(unsigned __int8 *)(v6 + 8)
    && self->_buttonType == *(void *)(v6 + 56)
    && self->_buttonRole == *(void *)(v6 + 64)
    && self->_width == *(double *)(v6 + 72)
    && self->_minWidth == *(double *)(v6 + 80)
    && self->_maxWidth == *(double *)(v6 + 88)
    && ((text = self->_text, text == *(NSString **)(v6 + 96)) || -[NSString isEqualToString:](text, "isEqualToString:"))
    && ((placeholderText = self->_placeholderText, placeholderText == *(NSAttributedString **)(v6 + 104))
     || -[NSAttributedString isEqualToAttributedString:](placeholderText, "isEqualToAttributedString:"))
    && self->_keyboardAppearance == *(void *)(v6 + 112)
    && self->_navigationBarBackgroundOpacity == *(double *)(v6 + 152)
    && ((observeTrigger = self->_observeTrigger, observeTrigger == *(NSString **)(v6 + 120))
     || -[NSString isEqualToString:](observeTrigger, "isEqualToString:"))
    && self->_observeTriggerValue == *(void *)(v6 + 128)
    && self->_itemType == *(void *)(v6 + 136)
    && ((imageModelIDToResource = self->_imageModelIDToResource, imageModelIDToResource == *(NSDictionary **)(v6 + 208))
     || -[NSDictionary isEqualToDictionary:](imageModelIDToResource, "isEqualToDictionary:"))
    && ((actionHandler = self->_actionHandler, actionHandler == *(TUIElementActionTriggerHandler **)(v6 + 216))
     || -[TUIElementActionTriggerHandler isEqualToHandler:](actionHandler, "isEqualToHandler:"))
    && ((menu = self->_menu, menu == *(TUIMenuModel **)(v6 + 160)) || -[TUIMenuModel isEqual:](menu, "isEqual:")))
  {
    subviewsModel = self->_subviewsModel;
    if (subviewsModel == *(TUIRenderModelSubviews **)(v6 + 224)) {
      unsigned __int8 v17 = 1;
    }
    else {
      unsigned __int8 v17 = -[TUIRenderModelSubviews isEqualToRenderModel:](subviewsModel, "isEqualToRenderModel:");
    }
  }
  else
  {
LABEL_32:
    unsigned __int8 v17 = 0;
  }

  return v17;
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
  v2 = [(TUIRenderModelNavigationItem *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
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

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (double)width
{
  return self->_width;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (unint64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (NSString)observeTrigger
{
  return self->_observeTrigger;
}

- (unint64_t)observeTriggerValue
{
  return self->_observeTriggerValue;
}

- (BOOL)ignoreInsetsForOpacityTrigger
{
  return self->_ignoreInsetsForOpacityTrigger;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (int64_t)searchTextMaxLength
{
  return self->_searchTextMaxLength;
}

- (double)navigationBarBackgroundOpacity
{
  return self->_navigationBarBackgroundOpacity;
}

- (TUIMenuModel)menu
{
  return self->_menu;
}

- (TUIAXAttributes)axAttributes
{
  return self->_axAttributes;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (NSArray)hostingIdentifiers
{
  return self->_hostingIdentifiers;
}

- (NSArray)hostingProperties
{
  return self->_hostingProperties;
}

- (NSDictionary)imageModelIDToResource
{
  return self->_imageModelIDToResource;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (TUIRenderModelSubviews)subviewsModel
{
  return self->_subviewsModel;
}

- (void)setSubviewsModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsModel, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_imageModelIDToResource, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiers, 0);
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_observeTrigger, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end