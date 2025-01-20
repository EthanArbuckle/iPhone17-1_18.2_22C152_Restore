@interface PRComplicationGalleryWidgetItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isIconImageHidden;
- (BOOL)isSelected;
- (NSString)displayName;
- (NSString)text;
- (PRComplicationDescriptor)descriptor;
- (PRComplicationGalleryWidgetItem)initWithDisplayName:(id)a3 selected:(BOOL)a4 iconImageHidden:(BOOL)a5 descriptor:(id)a6;
- (PRComplicationGalleryWidgetItem)initWithDisplayName:(id)a3 selected:(BOOL)a4 iconImageHidden:(BOOL)a5 text:(id)a6 kind:(int64_t)a7;
- (int64_t)kind;
- (unint64_t)hash;
@end

@implementation PRComplicationGalleryWidgetItem

- (PRComplicationGalleryWidgetItem)initWithDisplayName:(id)a3 selected:(BOOL)a4 iconImageHidden:(BOOL)a5 descriptor:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PRComplicationGalleryWidgetItem;
  v12 = [(PRComplicationGalleryWidgetItem *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    displayName = v12->_displayName;
    v12->_displayName = (NSString *)v13;

    v12->_selected = a4;
    v12->_iconImageHidden = a5;
    objc_storeStrong((id *)&v12->_descriptor, a6);
    v12->_kind = 0;
  }

  return v12;
}

- (PRComplicationGalleryWidgetItem)initWithDisplayName:(id)a3 selected:(BOOL)a4 iconImageHidden:(BOOL)a5 text:(id)a6 kind:(int64_t)a7
{
  id v12 = a3;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRComplicationGalleryWidgetItem;
  v14 = [(PRComplicationGalleryWidgetItem *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v15;

    v14->_selected = a4;
    v14->_iconImageHidden = a5;
    uint64_t v17 = [v13 copy];
    text = v14->_text;
    v14->_text = (NSString *)v17;

    v14->_kind = a7;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  displayName = self->_displayName;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke;
  v38[3] = &unk_1E54DB098;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendString:displayName counterpart:v38];
  BOOL selected = self->_selected;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_2;
  v36[3] = &unk_1E54DB0C0;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendBool:selected counterpart:v36];
  BOOL iconImageHidden = self->_iconImageHidden;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_3;
  v34[3] = &unk_1E54DB0C0;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendBool:iconImageHidden counterpart:v34];
  descriptor = self->_descriptor;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_4;
  v32[3] = &unk_1E54DB0E8;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendObject:descriptor counterpart:v32];
  text = self->_text;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_5;
  v30[3] = &unk_1E54DB098;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendString:text counterpart:v30];
  int64_t kind = self->_kind;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_6;
  v28 = &unk_1E54DB110;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendInteger:kind counterpart:&v25];
  LOBYTE(kind) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);

  return kind;
}

id __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

uint64_t __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

uint64_t __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
}

id __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

uint64_t __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 40);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_displayName];
  id v5 = (id)[v3 appendBool:self->_selected];
  id v6 = (id)[v3 appendBool:self->_iconImageHidden];
  id v7 = (id)[v3 appendObject:self->_descriptor];
  id v8 = (id)[v3 appendString:self->_text];
  id v9 = (id)[v3 appendInteger:self->_kind];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isIconImageHidden
{
  return self->_iconImageHidden;
}

- (PRComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end