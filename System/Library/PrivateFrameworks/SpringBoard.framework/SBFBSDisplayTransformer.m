@interface SBFBSDisplayTransformer
- (SBFBSDisplayTransformer)init;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation SBFBSDisplayTransformer

- (SBFBSDisplayTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFBSDisplayTransformer;
  v2 = [(SBFBSDisplayTransformer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBMainDisplayConfigurationTransformer);
    emulatedMainDisplayTransformer = v2->_emulatedMainDisplayTransformer;
    v2->_emulatedMainDisplayTransformer = v3;
  }
  return v2;
}

- (id)transformDisplayConfiguration:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  v7 = [v5 set];
  v8 = [(SBMainDisplayConfigurationTransformer *)self->_emulatedMainDisplayTransformer transformDisplayConfiguration:v6];

  if ([v8 count] != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBFBSDisplayTransformer.m", 32, @"received unexpected number of transformed configurations from main display transformer. transformer: %@, result: %@", self->_emulatedMainDisplayTransformer, v8 object file lineNumber description];
  }
  v9 = [v8 anyObject];
  v10 = +[SBDisplayTransformerRegistry sharedInstance];
  v11 = [v10 transformDisplayConfiguration:v9];
  [v7 unionSet:v11];

  return v7;
}

- (void).cxx_destruct
{
}

@end