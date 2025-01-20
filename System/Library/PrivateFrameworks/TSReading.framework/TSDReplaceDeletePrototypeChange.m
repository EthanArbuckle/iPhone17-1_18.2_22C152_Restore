@interface TSDReplaceDeletePrototypeChange
- (BOOL)propertiesAreChanging:(id)a3;
- (BOOL)propertyIsChanging:(int)a3;
- (BOOL)prototypeIsBeingDeleted;
- (BOOL)prototypeIsBeingModified;
- (BOOL)prototypeIsBeingReplaced;
- (NSString)description;
- (TSSPropertySource)propertiesAfterChange;
- (TSSPropertySource)propertiesBeforeChange;
- (id)changedPropertySet;
- (id)initDeletePrototypeChangeForPrototype:(id)a3 replacement:(id)a4;
- (id)initReplacePrototypeChangeForPrototype:(id)a3 toReplacement:(id)a4;
- (id)prototype;
- (id)replacement;
- (void)dealloc;
@end

@implementation TSDReplaceDeletePrototypeChange

- (id)initReplacePrototypeChangeForPrototype:(id)a3 toReplacement:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDReplaceDeletePrototypeChange;
  v6 = [(TSDReplaceDeletePrototypeChange *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mPrototypeIsBeingReplaced = 1;
    v6->mPrototype = a3;
    v7->mReplacement = a4;
  }
  return v7;
}

- (id)initDeletePrototypeChangeForPrototype:(id)a3 replacement:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDReplaceDeletePrototypeChange;
  v6 = [(TSDReplaceDeletePrototypeChange *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mPrototypeIsBeingDeleted = 1;
    v6->mPrototypeIsBeingReplaced = a4 != 0;
    v6->mPrototype = a3;
    v7->mReplacement = a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDReplaceDeletePrototypeChange;
  [(TSDReplaceDeletePrototypeChange *)&v3 dealloc];
}

- (NSString)description
{
  BOOL v3 = [(TSDReplaceDeletePrototypeChange *)self prototypeIsBeingReplaced];
  v4 = (void *)MEMORY[0x263F7C828];
  uint64_t v5 = objc_opt_class();
  if (v3) {
    uint64_t v6 = objc_msgSend(v4, "descriptionWithObject:class:format:", self, v5, @": replaced with %p", -[TSDReplaceDeletePrototypeChange replacement](self, "replacement"));
  }
  else {
    uint64_t v6 = objc_msgSend(v4, "descriptionWithObject:class:format:", self, v5, @": unchanged", v10);
  }
  v7 = (void *)v6;
  if ([(TSDReplaceDeletePrototypeChange *)self prototypeIsBeingDeleted])
  {
    if ([(TSDReplaceDeletePrototypeChange *)self prototypeIsBeingDeleted]) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    [v7 addField:@"prototypeIsBeingDeleted" value:v8];
  }

  return (NSString *)[v7 descriptionString];
}

- (BOOL)prototypeIsBeingModified
{
  return 0;
}

- (id)changedPropertySet
{
  return 0;
}

- (TSSPropertySource)propertiesBeforeChange
{
  [(TSDReplaceDeletePrototypeChange *)self prototype];
  BOOL v3 = (TSSPropertySource *)TSUProtocolCast();
  if (!v3)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDReplaceDeletePrototypeChange propertiesBeforeChange]"];
    [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 98, @"Tried to treat %@ as a property source when it's not", -[TSDReplaceDeletePrototypeChange prototype](self, "prototype") file lineNumber description];
  }
  return v3;
}

- (TSSPropertySource)propertiesAfterChange
{
  if ([(TSDReplaceDeletePrototypeChange *)self prototypeIsBeingDeleted])
  {
    if (![(TSDReplaceDeletePrototypeChange *)self prototypeIsBeingReplaced])
    {
      BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSDReplaceDeletePrototypeChange propertiesAfterChange]"];
      [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 104, @"%@ is being deleted, but we're calling -newProperties on a prototypeChange for it.", -[TSDReplaceDeletePrototypeChange prototype](self, "prototype") file lineNumber description];
    }
  }
  if ([(TSDReplaceDeletePrototypeChange *)self prototypeIsBeingReplaced])
  {
    [(TSDReplaceDeletePrototypeChange *)self replacement];
    result = (TSSPropertySource *)TSUProtocolCast();
    if (result) {
      return result;
    }
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDReplaceDeletePrototypeChange propertiesAfterChange]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPrototypeChange.m"), 107, @"Tried to treat %@ as a property source when it's not", -[TSDReplaceDeletePrototypeChange replacement](self, "replacement") file lineNumber description];
  }
  return 0;
}

- (BOOL)propertyIsChanging:(int)a3
{
  return 1;
}

- (BOOL)propertiesAreChanging:(id)a3
{
  return 1;
}

- (BOOL)prototypeIsBeingReplaced
{
  return self->mPrototypeIsBeingReplaced;
}

- (BOOL)prototypeIsBeingDeleted
{
  return self->mPrototypeIsBeingDeleted;
}

- (id)replacement
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)prototype
{
  return objc_getProperty(self, a2, 24, 1);
}

@end