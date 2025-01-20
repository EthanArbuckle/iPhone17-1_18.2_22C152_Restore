@interface TSDModifyPrototypeChange
- (BOOL)propertiesAreChanging:(id)a3;
- (BOOL)propertyIsChanging:(int)a3;
- (BOOL)prototypeIsBeingDeleted;
- (BOOL)prototypeIsBeingModified;
- (BOOL)prototypeIsBeingReplaced;
- (NSString)description;
- (TSSMutablePropertySet)changedPropertySet;
- (TSSMutablePropertySet)i_propertiesWithOldValuesRecordedButNotNewValues;
- (TSSPropertyMap)changedPropertyMapAfterChange;
- (TSSPropertyMap)changedPropertyMapBeforeChange;
- (TSSPropertySource)propertiesAfterChange;
- (TSSPropertySource)propertiesBeforeChange;
- (id)initModifyPrototypeChangeForPrototype:(id)a3;
- (id)prototype;
- (id)replacement;
- (void)dealloc;
@end

@implementation TSDModifyPrototypeChange

- (id)initModifyPrototypeChangeForPrototype:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDModifyPrototypeChange;
  v4 = [(TSDModifyPrototypeChange *)&v6 init];
  if (v4)
  {
    v4->mChangedPropertySet = objc_alloc_init(TSSMutablePropertySet);
    v4->mPrototype = a3;
    v4->mChangedPropertyMapBeforeChange = objc_alloc_init(TSSPropertyMap);
    v4->mChangedPropertyMapAfterChange = objc_alloc_init(TSSPropertyMap);
    v4->mPropertiesWithOldValuesRecordedButNotNewValues = objc_alloc_init(TSSMutablePropertySet);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDModifyPrototypeChange;
  [(TSDModifyPrototypeChange *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = (void *)[MEMORY[0x263F7C828] descriptionWithObject:self class:objc_opt_class() format:@": changed properties"];
  if ([(TSDModifyPrototypeChange *)self changedPropertySet]) {
    objc_msgSend(v3, "addField:value:", @"mChangedPropertySet", -[TSSMutablePropertySet description](-[TSDModifyPrototypeChange changedPropertySet](self, "changedPropertySet"), "description"));
  }

  return (NSString *)[v3 descriptionString];
}

- (BOOL)prototypeIsBeingModified
{
  return 1;
}

- (BOOL)prototypeIsBeingReplaced
{
  return 0;
}

- (BOOL)prototypeIsBeingDeleted
{
  return 0;
}

- (id)replacement
{
  return 0;
}

- (TSSPropertySource)propertiesBeforeChange
{
  [(TSDModifyPrototypeChange *)self prototype];
  if (!TSUProtocolCast())
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDModifyPrototypeChange propertiesBeforeChange]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 202, @"Tried to treat %@ as a property source when it's not", -[TSDModifyPrototypeChange prototype](self, "prototype") file lineNumber description];
  }
  result = (TSSPropertySource *)self->mPropertySourceBeforeChange;
  if (!result)
  {
    result = [[TSDPropertySourceForModifyPrototypeChange alloc] initWithPrototypeChange:self afterChange:0];
    self->mPropertySourceBeforeChange = (TSDPropertySourceForModifyPrototypeChange *)result;
  }
  return result;
}

- (TSSPropertySource)propertiesAfterChange
{
  [(TSDModifyPrototypeChange *)self prototype];
  if (!TSUProtocolCast())
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDModifyPrototypeChange propertiesAfterChange]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 216, @"Tried to treat %@ as a property source when it's not", -[TSDModifyPrototypeChange prototype](self, "prototype") file lineNumber description];
  }
  result = (TSSPropertySource *)self->mPropertySourceAfterChange;
  if (!result)
  {
    result = [[TSDPropertySourceForModifyPrototypeChange alloc] initWithPrototypeChange:self afterChange:1];
    self->mPropertySourceAfterChange = (TSDPropertySourceForModifyPrototypeChange *)result;
  }
  return result;
}

- (BOOL)propertyIsChanging:(int)a3
{
  return [(TSSPropertySet *)self->mChangedPropertySet containsProperty:*(void *)&a3];
}

- (BOOL)propertiesAreChanging:(id)a3
{
  return [(TSSPropertySet *)self->mChangedPropertySet intersectsProperties:a3];
}

- (id)prototype
{
  return objc_getProperty(self, a2, 8, 1);
}

- (TSSMutablePropertySet)changedPropertySet
{
  return (TSSMutablePropertySet *)objc_getProperty(self, a2, 16, 1);
}

- (TSSPropertyMap)changedPropertyMapBeforeChange
{
  return (TSSPropertyMap *)objc_getProperty(self, a2, 24, 1);
}

- (TSSPropertyMap)changedPropertyMapAfterChange
{
  return (TSSPropertyMap *)objc_getProperty(self, a2, 32, 1);
}

- (TSSMutablePropertySet)i_propertiesWithOldValuesRecordedButNotNewValues
{
  return (TSSMutablePropertySet *)objc_getProperty(self, a2, 56, 1);
}

@end