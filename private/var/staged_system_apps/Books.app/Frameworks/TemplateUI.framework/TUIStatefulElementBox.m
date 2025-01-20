@interface TUIStatefulElementBox
- (BOOL)enabled;
- (BOOL)isEditableControl;
- (BOOL)menuIsPrimary;
- (Class)layoutClass;
- (NSDictionary)stateMap;
- (TUIElementActionTriggerHandler)triggerHandler;
- (TUIFocusStyle)focusStyle;
- (TUIMenuContainer)menuContainer;
- (TUIPointer)pointer;
- (TUIStatefulElementBox)init;
- (UIEdgeInsets)touchInsets;
- (double)pressedScale;
- (id)renderModelBlock;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)onContainedModelsChanged;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusStyle:(id)a3;
- (void)setIsEditableControl:(BOOL)a3;
- (void)setMenuContainer:(id)a3;
- (void)setMenuIsPrimary:(BOOL)a3;
- (void)setPointer:(id)a3;
- (void)setPressedScale:(double)a3;
- (void)setRenderModelBlock:(id)a3;
- (void)setStateMap:(id)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setTriggerHandler:(id)a3;
@end

@implementation TUIStatefulElementBox

- (TUIStatefulElementBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIStatefulElementBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    result->super.super._storage._data = TUIStatefulElementBoxStorageDataset | 1;
  }
  return result;
}

- (void)setMenuContainer:(id)a3
{
  v5 = (TUIMenuContainer *)a3;
  menuContainer = self->_menuContainer;
  v7 = v5;
  if (menuContainer != v5)
  {
    [(TUIMenuContainer *)menuContainer setParentModel:0];
    objc_storeStrong((id *)&self->_menuContainer, a3);
    [(TUIMenuContainer *)self->_menuContainer setParentModel:self];
  }
}

- (void)onContainedModelsChanged
{
  v2.receiver = self;
  v2.super_class = (Class)TUIStatefulElementBox;
  [(TUIContainerBox *)&v2 onContainedModelsChanged];
}

- (void)setStateMap:(id)a3
{
  v5 = (NSDictionary *)a3;
  stateMap = self->_stateMap;
  if (stateMap != v5)
  {
    [(NSDictionary *)stateMap enumerateKeysAndObjectsUsingBlock:&stru_2570E0];
    objc_storeStrong((id *)&self->_stateMap, a3);
    v7 = self->_stateMap;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_175410;
    v8[3] = &unk_255438;
    v8[4] = self;
    [(NSDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v8];
    [(TUIStatefulElementBox *)self onContainedModelsChanged];
  }
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  stateMap = self->_stateMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1754D8;
  v7[3] = &unk_255438;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)stateMap enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)appendContainedChildrenToArray:(id)a3
{
  id v4 = a3;
  stateMap = self->_stateMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1755A0;
  v7[3] = &unk_257108;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)stateMap enumerateKeysAndObjectsUsingBlock:v7];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)setEnabled:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)enabled
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 1) & 1;
}

- (void)setPressedScale:(double)a3
{
  p_storage = &self->super.super._storage;
  float v4 = a3;
  if (v4 == 0.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xBu);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0xBu);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0xBu, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)pressedScale
{
  objc_super v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xBu);
  if (v2) {
    return *v2;
  }
  else {
    return 0.0;
  }
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  float top = a3.top;
  p_storage = &self->super.super._storage;
  float left = a3.left;
  float bottom = a3.bottom;
  float right = a3.right;
  if (TUIInsets32Equal(top, left, bottom, right, 0.0, 0.0, 0.0, 0.0))
  {
    uint64_t v8 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x26u);
    if (!v8) {
      return;
    }
    DataForKey = (float *)v8;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x26u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x26u, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = top;
  DataForKey[1] = left;
  DataForKey[2] = bottom;
  DataForKey[3] = right;
}

- (UIEdgeInsets)touchInsets
{
  uint64_t v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x26u);
  int v3 = (float *)&TUIInsets32Zero;
  if (v2) {
    int v3 = (float *)v2;
  }
  double v4 = *v3;
  double v5 = v3[1];
  double v6 = v3[2];
  double v7 = v3[3];
  result.float right = v7;
  result.float bottom = v6;
  result.float left = v5;
  result.float top = v4;
  return result;
}

- (NSDictionary)stateMap
{
  return self->_stateMap;
}

- (id)renderModelBlock
{
  return self->_renderModelBlock;
}

- (void)setRenderModelBlock:(id)a3
{
}

- (TUIElementActionTriggerHandler)triggerHandler
{
  return self->_triggerHandler;
}

- (void)setTriggerHandler:(id)a3
{
}

- (TUIPointer)pointer
{
  return self->_pointer;
}

- (void)setPointer:(id)a3
{
}

- (TUIFocusStyle)focusStyle
{
  return self->_focusStyle;
}

- (void)setFocusStyle:(id)a3
{
}

- (BOOL)isEditableControl
{
  return self->_isEditableControl;
}

- (void)setIsEditableControl:(BOOL)a3
{
  self->_isEditableControl = a3;
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_focusStyle, 0);
  objc_storeStrong((id *)&self->_pointer, 0);
  objc_storeStrong((id *)&self->_triggerHandler, 0);
  objc_storeStrong(&self->_renderModelBlock, 0);

  objc_storeStrong((id *)&self->_stateMap, 0);
}

@end