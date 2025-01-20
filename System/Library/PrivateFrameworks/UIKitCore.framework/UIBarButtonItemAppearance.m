@interface UIBarButtonItemAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UIBarButtonItemAppearance)copy;
- (UIBarButtonItemAppearance)init;
- (UIBarButtonItemAppearance)initWithBarButtonItemAppearance:(id)a3;
- (UIBarButtonItemAppearance)initWithCoder:(NSCoder *)coder;
- (UIBarButtonItemAppearance)initWithStyle:(UIBarButtonItemStyle)style;
- (UIBarButtonItemStateAppearance)disabled;
- (UIBarButtonItemStateAppearance)focused;
- (UIBarButtonItemStateAppearance)highlighted;
- (UIBarButtonItemStateAppearance)normal;
- (_UIBarButtonItemAppearanceChangeObserver)_changeObserver;
- (_UIBarButtonItemData)_data;
- (_UIBarButtonItemDataFallback)_fallback;
- (id)_proxyForState:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_describeInto:(id)a3;
- (void)_resetBackIndicatorImages;
- (void)_setBackIndicatorImage:(id)a3 transitionMaskImage:(id)a4;
- (void)_setChangeObserver:(id)a3;
- (void)_setData:(id)a3;
- (void)_setFallback:(id)a3;
- (void)_updateDataTo:(id)a3 signal:(BOOL)a4;
- (void)_updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:(id)a3;
- (void)_writeToStorage:(id)a3;
- (void)configureWithDefaultForStyle:(UIBarButtonItemStyle)style;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIBarButtonItemAppearance

- (_UIBarButtonItemData)_data
{
  return (_UIBarButtonItemData *)[(_UIBarAppearanceData *)self->_data markReadOnly];
}

- (UIBarButtonItemAppearance)initWithStyle:(UIBarButtonItemStyle)style
{
  v8.receiver = self;
  v8.super_class = (Class)UIBarButtonItemAppearance;
  v4 = [(UIBarButtonItemAppearance *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[_UIBarButtonItemData standardItemDataForStyle:style];
    data = v4->_data;
    v4->_data = (_UIBarButtonItemData *)v5;
  }
  return v4;
}

- (void)_setChangeObserver:(id)a3
{
}

- (void)_setFallback:(id)a3
{
  id v4 = [(_UIBarButtonItemData *)self->_data dataWithNewFallback:a3];
  [(UIBarButtonItemAppearance *)self _updateDataTo:v4 signal:0];
}

- (void)_updateDataTo:(id)a3 signal:(BOOL)a4
{
  v7 = (_UIBarButtonItemData *)a3;
  data = self->_data;
  if (data != v7)
  {
    v12 = v7;
    v9 = data;
    objc_storeStrong((id *)&self->_data, a3);
    for (uint64_t i = 24; i != 56; i += 8)
      [*(id *)((char *)&self->super.isa + i) setData:self->_data];
    if (a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
      [WeakRetained _barButtonItemAppearanceChangedItemData:self toItemData:self->_data fromItemData:v9];
    }
    v7 = v12;
  }
}

- (void)dealloc
{
  for (uint64_t i = 24; i != 56; i += 8)
    [*(id *)((char *)&self->super.isa + i) _clearOwner];
  v4.receiver = self;
  v4.super_class = (Class)UIBarButtonItemAppearance;
  [(UIBarButtonItemAppearance *)&v4 dealloc];
}

- (void).cxx_destruct
{
  for (uint64_t i = 48; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

- (UIBarButtonItemAppearance)init
{
  return [(UIBarButtonItemAppearance *)self initWithStyle:0];
}

- (void)_updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);

  if (WeakRetained)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIBarButtonItemAppearance.m" lineNumber:311 description:@"This method must be called before a change observer is attached"];
  }
  id v6 = [(_UIBarButtonItemData *)self->_data copyAsBackButtonDataWithIndicatorsAndFallbackFrom:v8];
  [(UIBarButtonItemAppearance *)self _updateDataTo:v6 signal:0];
}

- (UIBarButtonItemAppearance)copy
{
  v3.receiver = self;
  v3.super_class = (Class)UIBarButtonItemAppearance;
  return [(UIBarButtonItemAppearance *)&v3 copy];
}

- (UIBarButtonItemAppearance)initWithBarButtonItemAppearance:(id)a3
{
  objc_super v4 = (id *)a3;
  uint64_t v5 = -[UIBarButtonItemAppearance initWithStyle:](self, "initWithStyle:", [v4[2] style]);
  if (v5)
  {
    uint64_t v6 = [v4[2] copy];
    data = v5->_data;
    v5->_data = (_UIBarButtonItemData *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithBarButtonItemAppearance:self];
}

- (UIBarButtonItemAppearance)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v11.receiver = self;
  v11.super_class = (Class)UIBarButtonItemAppearance;
  uint64_t v5 = [(UIBarButtonItemAppearance *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[_UIBarButtonItemData decodeFromCoder:v4 prefix:0];
    data = v5->_data;
    v5->_data = (_UIBarButtonItemData *)v6;

    if (!v5->_data)
    {
      uint64_t v8 = +[_UIBarButtonItemData standardItemDataForStyle:0];
      v9 = v5->_data;
      v5->_data = (_UIBarButtonItemData *)v8;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIBarButtonItemAppearance;
  objc_super v3 = [(UIBarButtonItemAppearance *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(UIBarButtonItemAppearance *)self _describeInto:v4];
  return v4;
}

- (unint64_t)hash
{
  return [(_UIBarAppearanceData *)self->_data hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIBarButtonItemAppearance *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && [(UIBarButtonItemAppearance *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v6 = [p_isa[2] isEqual:self->_data];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_describeInto:(id)a3
{
}

- (void)_setData:(id)a3
{
}

- (_UIBarButtonItemDataFallback)_fallback
{
  return [(_UIBarButtonItemData *)self->_data fallback];
}

- (void)_writeToStorage:(id)a3
{
  data = self->_data;
  uint64_t v5 = (void (**)(void))a3;
  char v6 = [(_UIBarAppearanceData *)data writableInstance];
  [(UIBarButtonItemAppearance *)self _updateDataTo:v6 signal:1];

  v5[2](v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  [WeakRetained _barButtonItemDataChanged:self];
}

- (id)_proxyForState:(int64_t)a3
{
  states = self->_states;
  uint64_t v5 = self->_states[a3];
  if (!v5)
  {
    v7 = [[UIBarButtonItemStateAppearance alloc] _initWithOwner:self data:self->_data state:a3];
    uint64_t v8 = states[a3];
    states[a3] = v7;

    uint64_t v5 = states[a3];
  }
  return v5;
}

- (void)configureWithDefaultForStyle:(UIBarButtonItemStyle)style
{
  if ([(_UIBarButtonItemData *)self->_data isBackButtonData])
  {
    uint64_t v5 = +[_UIBarButtonItemData standardBackButtonData];
    id v7 = (id)[v5 copyAsBackButtonDataWithIndicatorsAndFallbackFrom:self->_data];
  }
  else
  {
    id v7 = +[_UIBarButtonItemData standardItemDataForStyle:style];
  }
  [(UIBarButtonItemAppearance *)self _updateDataTo:v7 signal:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  [WeakRetained _barButtonItemDataChanged:self];
}

- (UIBarButtonItemStateAppearance)normal
{
  return (UIBarButtonItemStateAppearance *)[(UIBarButtonItemAppearance *)self _proxyForState:0];
}

- (UIBarButtonItemStateAppearance)highlighted
{
  return (UIBarButtonItemStateAppearance *)[(UIBarButtonItemAppearance *)self _proxyForState:1];
}

- (UIBarButtonItemStateAppearance)disabled
{
  return (UIBarButtonItemStateAppearance *)[(UIBarButtonItemAppearance *)self _proxyForState:2];
}

- (UIBarButtonItemStateAppearance)focused
{
  return (UIBarButtonItemStateAppearance *)[(UIBarButtonItemAppearance *)self _proxyForState:3];
}

- (void)_setBackIndicatorImage:(id)a3 transitionMaskImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__UIBarButtonItemAppearance__setBackIndicatorImage_transitionMaskImage___block_invoke;
  v10[3] = &unk_1E52DCB30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(UIBarButtonItemAppearance *)self _writeToStorage:v10];
}

uint64_t __72__UIBarButtonItemAppearance__setBackIndicatorImage_transitionMaskImage___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setBackIndicatorImage:a1[5] transitionMaskImage:a1[6]];
}

- (void)_resetBackIndicatorImages
{
  [(_UIBarButtonItemData *)self->_data resetBackIndicatorImages];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  [WeakRetained _barButtonItemDataChanged:self];
}

- (_UIBarButtonItemAppearanceChangeObserver)_changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  return (_UIBarButtonItemAppearanceChangeObserver *)WeakRetained;
}

@end