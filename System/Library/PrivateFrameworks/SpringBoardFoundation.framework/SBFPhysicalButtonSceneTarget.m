@interface SBFPhysicalButtonSceneTarget
- (BOOL)isEqual:(id)a3;
- (FBSSceneIdentity)sceneIdentity;
- (FBScene)scene;
- (NSString)description;
- (id)_initWithScene:(void *)a3 sceneIdentity:(void *)a4 targetsByButton:;
- (id)buttonTargetForButton:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBFPhysicalButtonSceneTarget

- (id)_initWithScene:(void *)a3 sceneIdentity:(void *)a4 targetsByButton:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)SBFPhysicalButtonSceneTarget;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 2, v7);
      objc_storeStrong(a1 + 3, a3);
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      id v12 = a1[1];
      a1[1] = v11;
    }
  }

  return a1;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v7 = a3;
  if ([(NSMutableDictionary *)self->_targetsByButton count])
  {
    v4 = [(NSMutableDictionary *)self->_targetsByButton allValues];
    v5 = [(FBSSceneIdentity *)self->_sceneIdentity description];
    id v6 = (id)[v7 appendObject:v4 withName:v5];
  }
  else
  {
    [v7 appendString:@"(empty)" withName:0];
  }
}

- (id)buttonTargetForButton:(unint64_t)a3
{
  targetsByButton = self->_targetsByButton;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)targetsByButton objectForKey:v4];

  return v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (FBScene *)WeakRetained;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_targetsByButton count];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SBFMutablePhysicalButtonSceneTarget alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  sceneIdentity = self->_sceneIdentity;
  id v7 = (void *)[(NSMutableDictionary *)self->_targetsByButton mutableCopy];
  id v8 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:]((id *)&v4->super.super.isa, WeakRetained, sceneIdentity, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBFPhysicalButtonSceneTarget *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      id v9 = objc_loadWeakRetained(v7 + 2);
      int v10 = BSEqualObjects();

      if (v10 && BSEqualObjects()) {
        char v11 = BSEqualDictionaries();
      }
      else {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v4 = [WeakRetained hash];
  uint64_t v5 = [(FBSSceneIdentity *)self->_sceneIdentity hash] ^ v4;
  unint64_t v6 = v5 ^ [(NSMutableDictionary *)self->_targetsByButton hash];

  return v6;
}

- (FBSSceneIdentity)sceneIdentity
{
  return self->_sceneIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_targetsByButton, 0);
}

@end