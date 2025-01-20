@interface TUIRootLayout
- (void)computeLayout;
- (void)onChildRenderModelInvalidate:(id)a3;
@end

@implementation TUIRootLayout

- (void)computeLayout
{
  v3 = [(TUILayout *)self box];
  v4 = [v3 contentModels];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2)
  {
    v6 = [(TUILayout *)self controller];
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"More than one root boxes in template";
    v7 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v8 = +[NSError errorWithDomain:@"TUIErrorDomain" code:1015 userInfo:v7];
    [v6 addError:v8];
  }
  v9 = [(TUILayout *)self box];
  v10 = [v9 contentModel];

  v11 = [(TUILayout *)self controller];
  v12 = [v11 layoutForModel:v10];

  [(TUILayout *)self containingWidth];
  [v12 setContainingWidth:];
  [(TUILayout *)self containingHeight];
  [v12 setContainingHeight:];
  [v12 validateLayout];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v13 = [(TUILayout *)self box];
  v14 = [v13 navBarModels];

  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v18);
        v20 = [(TUILayout *)self controller];
        v21 = [v20 layoutForModel:v19];

        [(TUILayout *)self containingWidth];
        [v21 setContainingWidth:];
        [v21 setContainingHeight:44.0];
        [v21 validateLayout];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [(TUILayout *)self containingWidth];
  double v23 = v22;
  [(TUILayout *)self containingHeight];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v23, v24);
}

- (void)onChildRenderModelInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILayout *)self box];
  v6 = [v5 navBarModels];
  v7 = [v4 model];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = [(TUILayout *)self controller];
    [v9 invalidateAuxiliaryRenderModel];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TUIRootLayout;
    [(TUILayout *)&v10 onChildRenderModelInvalidate:v4];
  }
}

@end