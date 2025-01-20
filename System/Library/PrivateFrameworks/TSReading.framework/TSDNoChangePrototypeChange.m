@interface TSDNoChangePrototypeChange
- (BOOL)propertiesAreChanging:(id)a3;
- (BOOL)propertyIsChanging:(int)a3;
- (BOOL)prototypeIsBeingDeleted;
- (BOOL)prototypeIsBeingModified;
- (BOOL)prototypeIsBeingReplaced;
- (NSString)description;
- (TSSPropertySource)propertiesBeforeChange;
- (id)changedPropertySet;
- (id)initNoChangePrototypeChangeForPrototype:(id)a3;
- (id)prototype;
- (id)replacement;
- (void)dealloc;
@end

@implementation TSDNoChangePrototypeChange

- (id)initNoChangePrototypeChangeForPrototype:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDNoChangePrototypeChange;
  v4 = [(TSDNoChangePrototypeChange *)&v6 init];
  if (v4) {
    v4->mPrototype = a3;
  }
  return v4;
}

- (NSString)description
{
  v2 = (void *)[MEMORY[0x263F7C828] descriptionWithObject:self class:objc_opt_class() format:@": unchanged"];

  return (NSString *)[v2 descriptionString];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDNoChangePrototypeChange;
  [(TSDNoChangePrototypeChange *)&v3 dealloc];
}

- (BOOL)prototypeIsBeingModified
{
  return 0;
}

- (BOOL)prototypeIsBeingReplaced
{
  return 0;
}

- (BOOL)prototypeIsBeingDeleted
{
  return 0;
}

- (id)changedPropertySet
{
  return 0;
}

- (id)replacement
{
  return 0;
}

- (TSSPropertySource)propertiesBeforeChange
{
  objc_super v3 = (TSSPropertySource *)TSUProtocolCast();
  if (!v3)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDNoChangePrototypeChange propertiesBeforeChange]"];
    [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 293, @"Tried to treat %@ as a property source when it's not", self->mPrototype file lineNumber description];
  }
  return v3;
}

- (BOOL)propertyIsChanging:(int)a3
{
  return 0;
}

- (BOOL)propertiesAreChanging:(id)a3
{
  return 0;
}

- (id)prototype
{
  return objc_getProperty(self, a2, 8, 1);
}

@end