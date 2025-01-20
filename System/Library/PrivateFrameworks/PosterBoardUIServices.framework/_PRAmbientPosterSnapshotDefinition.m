@interface _PRAmbientPosterSnapshotDefinition
- (BOOL)isAmbientPresented;
- (BOOL)isEqualToDefinition:(id)a3;
- (_PRAmbientPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 ambientPresentationSettings:(id)a4 renderingContent:(int64_t)a5 renderingMode:(int64_t)a6 previewContent:(unint64_t)a7;
- (_PRAmbientPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 ambientPresented:(BOOL)a4 ambientDisplayStyle:(int64_t)a5 renderingContent:(int64_t)a6 renderingMode:(int64_t)a7 previewContent:(unint64_t)a8;
- (int64_t)ambientDisplayStyle;
- (void)applySceneSettings:(id)a3;
- (void)setAmbientDisplayStyle:(int64_t)a3;
- (void)setAmbientPresented:(BOOL)a3;
@end

@implementation _PRAmbientPosterSnapshotDefinition

- (_PRAmbientPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 ambientPresentationSettings:(id)a4 renderingContent:(int64_t)a5 renderingMode:(int64_t)a6 previewContent:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v12 isAmbientPresented];
  uint64_t v15 = [v12 ambientDisplayStyle];

  v16 = [(_PRAmbientPosterSnapshotDefinition *)self initWithUniqueIdentifier:v13 ambientPresented:v14 ambientDisplayStyle:v15 renderingContent:a5 renderingMode:a6 previewContent:a7];
  return v16;
}

- (_PRAmbientPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 ambientPresented:(BOOL)a4 ambientDisplayStyle:(int64_t)a5 renderingContent:(int64_t)a6 renderingMode:(int64_t)a7 previewContent:(unint64_t)a8
{
  id v14 = a3;
  uint64_t v15 = PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet();
  v18.receiver = self;
  v18.super_class = (Class)_PRAmbientPosterSnapshotDefinition;
  v16 = [(PRPosterSnapshotDefinition *)&v18 initWithUniqueIdentifier:v14 includeHeaderElements:0 includesComplications:0 levelSets:v15 isUnlocked:1 renderingContent:a6 renderingMode:a7 previewContent:a8];

  if (v16)
  {
    v16->_ambientPresented = a4;
    v16->_ambientDisplayStyle = a5;
  }
  return v16;
}

- (void)applySceneSettings:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_PRAmbientPosterSnapshotDefinition;
  [(PRPosterSnapshotDefinition *)&v5 applySceneSettings:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 setAmbientDisplayStyle:self->_ambientDisplayStyle];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 setAmbientPresented:self->_ambientPresented];
  }
}

- (BOOL)isEqualToDefinition:(id)a3
{
  id v4 = (_PRAmbientPosterSnapshotDefinition *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_PRAmbientPosterSnapshotDefinition;
    if ([(PRPosterSnapshotDefinition *)&v11 isEqualToDefinition:v4]
      && (self,
          objc_super v5 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v5,
          (isKindOfClass & 1) != 0)
      && (int64_t v7 = [(_PRAmbientPosterSnapshotDefinition *)self ambientDisplayStyle],
          v7 == [(_PRAmbientPosterSnapshotDefinition *)v4 ambientDisplayStyle]))
    {
      BOOL v8 = [(_PRAmbientPosterSnapshotDefinition *)self isAmbientPresented];
      BOOL v9 = v8 ^ [(_PRAmbientPosterSnapshotDefinition *)v4 isAmbientPresented] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (void)setAmbientPresented:(BOOL)a3
{
  self->_ambientPresented = a3;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (void)setAmbientDisplayStyle:(int64_t)a3
{
  self->_ambientDisplayStyle = a3;
}

@end