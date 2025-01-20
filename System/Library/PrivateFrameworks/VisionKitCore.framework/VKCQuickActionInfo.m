@interface VKCQuickActionInfo
+ (id)quickActionInfoFromActionInfoButton:(id)a3;
- (DDUIAction)defaultAction;
- (NSArray)children;
- (NSString)text;
- (NSUUID)correlationIdentifier;
- (UIImage)image;
- (UIImage)menuImage;
- (VKCActionInfoButton)actionInfoButton;
- (id)linearizedElements;
- (unint64_t)dataDetectorTypes;
- (unint64_t)quickActionType;
- (void)performDefaultAction;
- (void)setActionInfoButton:(id)a3;
- (void)setChildren:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDefaultAction:(id)a3;
- (void)setImage:(id)a3;
- (void)setMenuImage:(id)a3;
- (void)setQuickActionType:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation VKCQuickActionInfo

+ (id)quickActionInfoFromActionInfoButton:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = VKDynamicCast(v4, (uint64_t)v3);
  uint64_t v6 = objc_opt_class();
  v7 = VKDynamicCast(v6, (uint64_t)v3);
  uint64_t v8 = objc_opt_class();
  v9 = VKDynamicCast(v8, (uint64_t)v3);

  if (v9) {
    goto LABEL_2;
  }
  if (v5)
  {
    v10 = objc_alloc_init(VKCQuickActionInfo);
    [(VKCQuickActionInfo *)v10 setQuickActionType:1];
  }
  else
  {
    if (!v7)
    {
LABEL_2:
      v10 = 0;
      goto LABEL_7;
    }
    v10 = objc_alloc_init(VKCQuickActionInfo);
    v11 = [v7 text];
    [(VKCQuickActionInfo *)v10 setText:v11];

    v12 = [v7 image];
    [(VKCQuickActionInfo *)v10 setImage:v12];

    v13 = [v7 defaultAction];
    [(VKCQuickActionInfo *)v10 setDefaultAction:v13];

    v14 = [v7 correlationIdentifier];
    [(VKCQuickActionInfo *)v10 setCorrelationIdentifier:v14];

    -[VKCQuickActionInfo setQuickActionType:](v10, "setQuickActionType:", [v7 quickActionType]);
    v15 = [v7 representedElement];
    -[VKCQuickActionInfo setDataDetectorTypes:](v10, "setDataDetectorTypes:", [v15 dataDetectorTypes]);

    [(VKCQuickActionInfo *)v10 setActionInfoButton:v7];
    v16 = [v7 menu];
    v17 = [v16 children];
    v18 = objc_msgSend(v17, "vk_compactMap:", &__block_literal_global_133);
    [(VKCQuickActionInfo *)v10 setChildren:v18];
  }
LABEL_7:

  return v10;
}

id __58__VKCQuickActionInfo_quickActionInfoFromActionInfoButton___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VKCQuickActionInfoElement elementFromElement:a2];
}

- (id)linearizedElements
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(VKCQuickActionInfo *)self children];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__VKCQuickActionInfo_linearizedElements__block_invoke;
  v7[3] = &unk_1E6BF2A38;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __40__VKCQuickActionInfo_linearizedElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 linearizeElements];
  [v2 addObjectsFromArray:v3];
}

- (void)performDefaultAction
{
  id v2 = [(VKCQuickActionInfo *)self actionInfoButton];
  [v2 performDefaultElementAction];
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)menuImage
{
  return self->_menuImage;
}

- (void)setMenuImage:(id)a3
{
}

- (DDUIAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSUUID)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (unint64_t)quickActionType
{
  return self->_quickActionType;
}

- (void)setQuickActionType:(unint64_t)a3
{
  self->_quickActionType = a3;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (VKCActionInfoButton)actionInfoButton
{
  return self->_actionInfoButton;
}

- (void)setActionInfoButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionInfoButton, 0);
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_menuImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end