@interface SXFullscreenCaption
- (id)additionsForTextSource:(id)a3;
- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4;
- (id)contentSizeCategoryForTextSource:(id)a3;
- (id)defaultComponentTextStyleForTextSource:(id)a3;
- (id)defaultComponentTextStylesForTextSource:(id)a3;
- (id)initWithCaption:(void *)a3 dataSource:;
- (id)initWithText:(void *)a3 dataSource:;
- (id)inlineTextStylesForTextSource:(id)a3;
- (id)textResizerForTextSource:(id)a3;
- (id)textRulesForTextSource:(id)a3;
- (id)textStyleForIdentifier:(id)a3;
- (uint64_t)caption;
- (uint64_t)text;
@end

@implementation SXFullscreenCaption

- (id)initWithText:(void *)a3 dataSource:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SXFullscreenCaption;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeWeak(a1 + 3, v7);
    }
  }

  return a1;
}

- (id)initWithCaption:(void *)a3 dataSource:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXFullscreenCaption;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 2, a2);
      uint64_t v9 = [v6 text];
      id v10 = a1[1];
      a1[1] = (id)v9;

      objc_storeWeak(a1 + 3, v7);
    }
  }

  return a1;
}

- (id)textResizerForTextSource:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  v5 = [WeakRetained textResizerForCaption:self];

  return v5;
}

- (id)textRulesForTextSource:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  v5 = [WeakRetained textRulesForCaption:self];

  return v5;
}

- (id)additionsForTextSource:(id)a3
{
  if (self) {
    self = (SXFullscreenCaption *)self->_caption;
  }
  v3 = [(SXFullscreenCaption *)self additions];
  v4 = [v3 NSArray];

  return v4;
}

- (uint64_t)caption
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (id)inlineTextStylesForTextSource:(id)a3
{
  if (self) {
    self = (SXFullscreenCaption *)self->_caption;
  }
  v3 = [(SXFullscreenCaption *)self inlineTextStyles];
  v4 = [v3 NSArray];

  return v4;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    id v7 = [(SXJSONObject *)[SXComponentTextStyle alloc] initWithJSONObject:&unk_26D594170 andVersion:0];
  }
  else {
    id v7 = 0;
  }
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    caption = self->_caption;
  }
  else
  {
    id WeakRetained = 0;
    caption = 0;
  }
  id v10 = caption;
  v11 = [(SXFormattedText *)v10 textStyle];
  objc_super v12 = [WeakRetained componentTextStyleForIdentifier:v11 inheritingFromComponentTextStyle:v7];

  return v12;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  v3 = [(SXJSONObject *)[SXComponentTextStyle alloc] initWithJSONObject:&unk_26D594198 andVersion:0];
  return v3;
}

- (id)defaultComponentTextStylesForTextSource:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v3 = [(SXJSONObject *)[SXComponentTextStyle alloc] initWithJSONObject:&unk_26D5941C0 andVersion:0];
  v6[0] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (SXFullscreenCaption *)objc_loadWeakRetained((id *)&self->_dataSource);
  }
  v5 = [(SXFullscreenCaption *)self textStyleForIdentifier:v4];

  return v5;
}

- (id)contentSizeCategoryForTextSource:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  v5 = [WeakRetained contentSizeCategoryForCaption:self];

  return v5;
}

- (uint64_t)text
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end