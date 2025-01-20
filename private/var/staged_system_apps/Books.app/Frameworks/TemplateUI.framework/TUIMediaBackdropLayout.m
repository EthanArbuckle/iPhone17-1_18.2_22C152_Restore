@interface TUIMediaBackdropLayout
- (TUIMediaBackdropLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (id)_newImageResourcesWithContext:(id)a3;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
@end

@implementation TUIMediaBackdropLayout

- (TUIMediaBackdropLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TUIMediaBackdropLayout;
  v5 = [(TUILayout *)&v8 initWithModel:a3 parent:a4 controller:a5];
  v6 = v5;
  if (v5)
  {
    [(TUILayout *)v5 setSpecifiedWidthComputeInherited:1];
    [(TUILayout *)v6 setSpecifiedHeightComputeInherited:1];
  }
  return v6;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  if (a3 < 3) {
    return 0;
  }
  id v5 = a4;
  [(TUILayout *)self renderModelSizeWithContext:v5];
  double v7 = v6;
  double v9 = v8;
  id v39 = [(TUIMediaBackdropLayout *)self _newImageResourcesWithContext:v5];
  v10 = [v39 url];
  v11 = [(TUILayout *)self box];
  uint64_t v36 = TUIResourceLoadForURL(v10, (uint64_t)[v11 load]);

  v34 = [TUIImageLayerConfig alloc];
  [v5 contentsScale];
  double v13 = v12;

  v38 = [(TUILayout *)self box];
  [v38 cornerRadius];
  double v15 = v14;
  v37 = [(TUILayout *)self box];
  v33 = [v37 fallbackColor];
  v35 = [(TUILayout *)self box];
  v32 = [v35 contentsGravity];
  v16 = [(TUILayout *)self box];
  id v17 = [v16 crossfadesContents];
  v18 = [(TUILayout *)self box];
  [v18 opacity];
  double v20 = v19;
  v21 = [(TUILayout *)self box];
  LOBYTE(v10) = [v21 continuousCorners];
  v22 = [(TUILayout *)self box];
  unsigned __int8 v23 = [v22 shouldRasterize];
  v24 = [(TUILayout *)self box];
  v25 = [v24 blendMode];
  BYTE1(v31) = v23;
  LOBYTE(v31) = (_BYTE)v10;
  v26 = -[TUIImageLayerConfig initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:](v34, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:", v39, v36, v33, v32, 0, v17, v13, v15, v20, v31, v25);

  v27 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v26, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[TUIRenderModelLayer setSize:](v27, "setSize:", v7, v9);
  v28 = [(TUILayout *)self box];
  v29 = [v28 identifier];
  [(TUIRenderModelLayer *)v27 setIdentifier:v29];

  return v27;
}

- (id)_newImageResourcesWithContext:(id)a3
{
  id v4 = a3;
  [(TUILayout *)self computedNaturalSize];
  double v6 = v5;
  double v8 = v7;
  [v4 contentsScale];
  double v10 = v9;
  v11 = [(TUILayout *)self controller];
  double v12 = [v11 manager];
  double v13 = [v12 imageResourceCache];

  double v14 = [(TUILayout *)self box];
  double v15 = [v14 urlString];

  v16 = [(TUILayout *)self box];
  id v17 = v16;
  if (v15)
  {
    v18 = [v16 urlString];
    double v19 = [(TUILayout *)self box];
    double v20 = [v19 baseURL];
    v21 = [v13 imageResourceForTemplatedURL:v18 baseURL:v20 naturalSize:v6 contentsScale:v8];
  }
  else
  {
    v22 = [v16 resourceKind];

    if (!v22)
    {
LABEL_7:
      v30 = 0;
      goto LABEL_8;
    }
    id v17 = [(TUILayout *)self controller];
    v18 = [(TUILayout *)self box];
    double v19 = [v18 resourceKind];
    double v20 = [(TUILayout *)self box];
    v32 = [v20 resourceInstance];
    unsigned __int8 v23 = [(TUILayout *)self box];
    v24 = [v23 resourceOptions];
    v21 = [v17 imageResourceForKind:v19 naturalSize:v32 contentsScale:v24 instance:v6 options:v8 v10];
  }
  if (!v21) {
    goto LABEL_7;
  }
  [(TUILayout *)self computedNaturalSize];
  double v26 = v25;
  double v28 = v27;
  [v4 contentsScale];
  v30 = [v13 mediaBackdropImageResourceFrom:v21 naturalSize:v26 contentScale:v28];

LABEL_8:
  return v30;
}

@end