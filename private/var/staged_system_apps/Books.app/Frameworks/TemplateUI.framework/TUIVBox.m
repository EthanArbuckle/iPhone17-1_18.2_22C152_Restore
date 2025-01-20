@interface TUIVBox
- (BOOL)allowDynamicWindowInstantiation;
- (Class)dynamicArrayLayoutContainerClass;
- (Class)layoutClass;
- (TUIBox)pivotChild;
- (TUIVBox)init;
- (void)setPivotChild:(id)a3;
@end

@implementation TUIVBox

- (BOOL)allowDynamicWindowInstantiation
{
  return 1;
}

- (TUIVBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIVBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    result->super.super._storage._data = TUIVBoxStorageDataset | 1;
  }
  return result;
}

- (void)setPivotChild:(id)a3
{
}

- (TUIBox)pivotChild
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x2Eu);

  return (TUIBox *)ObjectForKey;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)dynamicArrayLayoutContainerClass
{
  return (Class)objc_opt_class();
}

@end