@interface _UIWindowSceneCoordinateSpace
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (UIWindowScene)windowScene;
- (_UIWindowSceneCoordinateSpace)initWithWindowScene:(id)a3 effectiveSettings:(id)a4;
@end

@implementation _UIWindowSceneCoordinateSpace

- (CGRect)bounds
{
  [(FBSSceneSettings *)self->_effectiveSettings bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  p_windowScene = &self->_windowScene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)p_windowScene);
    v13 = [v12 screen];
    id v14 = (id)[v13 fixedCoordinateSpace];

    id v15 = objc_loadWeakRetained((id *)p_windowScene);
    v16 = [v15 screen];
    id v17 = (id)[v16 coordinateSpace];

    if (a4 && a4 != self)
    {
      id v18 = objc_loadWeakRetained((id *)p_windowScene);
      v19 = v18;
      if (v14 == a4)
      {
        id v29 = __UISceneEffectiveSettings((uint64_t)v18);

        [v29 frame];
        double v31 = v30;
        double v33 = v32;
        id v34 = objc_loadWeakRetained((id *)p_windowScene);
        [v34 _referenceBounds];
        double v37 = _UIWindowConvertRectFromOrientationToOrientation([v29 interfaceOrientation], 1, x, y, width, height, v35, v36);
        double v39 = v38;
        double width = v40;
        double height = v41;

        double x = v31 + v37;
        double y = v33 + v39;
      }
      else
      {
        id v20 = [v18 screen];

        if (v20 != a4)
        {
          v21 = self;
          if (objc_opt_isKindOfClass())
          {
            id v22 = [a4 windowScene];
            id v23 = objc_loadWeakRetained((id *)p_windowScene);
            if (v22 == v23)
            {
              char v64 = [a4 _isExternallyPlaced];

              if ((v64 & 1) == 0)
              {
                id v65 = objc_loadWeakRetained((id *)p_windowScene);
                [v65 _referenceBounds];
                double v67 = v66;
                double v69 = v68;
                id v70 = objc_loadWeakRetained((id *)p_windowScene);
                v71 = [v70 _effectiveSettings];
                double v72 = _UIWindowConvertRectFromOrientationToOrientation([v71 interfaceOrientation], objc_msgSend(a4, "interfaceOrientation"), x, y, width, height, v67, v69);
                double v74 = v73;
                double width = v75;
                double height = v76;

                [a4 frame];
                double x = v72 - v77;
                [a4 frame];
                double y = v74 - v78;
                goto LABEL_21;
              }
              goto LABEL_10;
            }
          }
LABEL_10:
          -[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v17, x, y, width, height);
          objc_msgSend(v17, "convertRect:toCoordinateSpace:", a4);
LABEL_20:
          double x = v24;
          double y = v25;
          double width = v26;
          double height = v27;
          goto LABEL_21;
        }
        id v42 = objc_loadWeakRetained((id *)p_windowScene);
        id v43 = __UISceneEffectiveSettings((uint64_t)v42);

        [v43 frame];
        if (v45 != *MEMORY[0x1E4F1DAD8]
          || v44 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)
          || (id v46 = objc_loadWeakRetained((id *)p_windowScene),
              [v46 screen],
              v47 = objc_claimAutoreleasedReturnValue(),
              uint64_t v48 = [v47 _interfaceOrientation],
              uint64_t v49 = [v43 interfaceOrientation],
              v47,
              v46,
              v48 != v49))
        {
          -[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v14, x, y, width, height);
          double v51 = v50;
          double v53 = v52;
          double v55 = v54;
          double v57 = v56;
          [a4 _referenceBounds];
          double v24 = _UIWindowConvertRectFromOrientationToOrientation(1, [a4 _interfaceOrientation], v51, v53, v55, v57, v58, v59);
          goto LABEL_20;
        }
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    if (os_variant_has_internal_diagnostics())
    {
      v79 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        int v80 = 136315138;
        v81 = "-[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:]";
        _os_log_fault_impl(&dword_1853B0000, v79, OS_LOG_TYPE_FAULT, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v80, 0xCu);
      }
    }
    else
    {
      v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &convertRect_toCoordinateSpace____s_category_0) + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v80 = 136315138;
        v81 = "-[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:]";
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v80, 0xCu);
      }
    }
  }
LABEL_21:
  double v60 = x;
  double v61 = y;
  double v62 = width;
  double v63 = height;
  result.size.double height = v63;
  result.size.double width = v62;
  result.origin.double y = v61;
  result.origin.double x = v60;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  p_windowScene = &self->_windowScene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)p_windowScene);
    v13 = [v12 screen];
    id v14 = (id)[v13 fixedCoordinateSpace];

    id v15 = objc_loadWeakRetained((id *)p_windowScene);
    v16 = [v15 screen];
    id v17 = (id)[v16 coordinateSpace];

    if (a4 && a4 != self)
    {
      id v18 = objc_loadWeakRetained((id *)p_windowScene);
      v19 = v18;
      if (v14 == a4)
      {
        id v27 = __UISceneEffectiveSettings((uint64_t)v18);

        [v27 frame];
        double v29 = x - v28;
        double v31 = y - v30;
        id v32 = objc_loadWeakRetained((id *)p_windowScene);
        [v32 _referenceBounds];
        double x = _UIWindowConvertRectFromOrientationToOrientation(1, [v27 interfaceOrientation], v29, v31, width, height, v33, v34);
        double y = v35;
        double width = v36;
        double height = v37;
LABEL_16:

        goto LABEL_22;
      }
      id v20 = [v18 screen];

      if (v20 != a4)
      {
        v21 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_9:

LABEL_10:
          objc_msgSend(v17, "convertRect:fromCoordinateSpace:", a4, x, y, width, height);
          double v24 = self;
          id v25 = v17;
LABEL_21:
          -[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:](v24, "convertRect:fromCoordinateSpace:", v25);
          double x = v48;
          double y = v49;
          double width = v50;
          double height = v51;
          goto LABEL_22;
        }
        id v22 = [a4 windowScene];
        id v23 = objc_loadWeakRetained((id *)p_windowScene);
        if (v22 != v23)
        {

          goto LABEL_9;
        }
        char v56 = [a4 _isExternallyPlaced];

        if (v56) {
          goto LABEL_10;
        }
        [a4 frame];
        double v58 = x + v57;
        [a4 frame];
        double v60 = y + v59;
        id v32 = objc_loadWeakRetained((id *)p_windowScene);
        [v32 _referenceBounds];
        double v62 = v61;
        double v64 = v63;
        uint64_t v65 = [a4 interfaceOrientation];
        id v66 = objc_loadWeakRetained((id *)p_windowScene);
        double v67 = [v66 _effectiveSettings];
        double x = _UIWindowConvertRectFromOrientationToOrientation(v65, [v67 interfaceOrientation], v58, v60, width, height, v62, v64);
        double y = v68;
        double width = v69;
        double height = v70;

        goto LABEL_16;
      }
      id v38 = objc_loadWeakRetained((id *)p_windowScene);
      id v39 = __UISceneEffectiveSettings((uint64_t)v38);

      [v39 frame];
      if (v41 != *MEMORY[0x1E4F1DAD8]
        || v40 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)
        || (id v42 = objc_loadWeakRetained((id *)p_windowScene),
            [v42 screen],
            id v43 = objc_claimAutoreleasedReturnValue(),
            uint64_t v44 = [v43 _interfaceOrientation],
            uint64_t v45 = [v39 interfaceOrientation],
            v43,
            v42,
            v44 != v45))
      {
        [a4 _referenceBounds];
        _UIWindowConvertRectFromOrientationToOrientation([a4 _interfaceOrientation], 1, x, y, width, height, v46, v47);
        double v24 = self;
        id v25 = v14;
        goto LABEL_21;
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    if (os_variant_has_internal_diagnostics())
    {
      v71 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
      {
        int v72 = 136315138;
        double v73 = "-[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:]";
        _os_log_fault_impl(&dword_1853B0000, v71, OS_LOG_TYPE_FAULT, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v72, 0xCu);
      }
    }
    else
    {
      double v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &convertRect_fromCoordinateSpace____s_category) + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v72 = 136315138;
        double v73 = "-[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:]";
        _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v72, 0xCu);
      }
    }
  }
LABEL_22:
  double v52 = x;
  double v53 = y;
  double v54 = width;
  double v55 = height;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (_UIWindowSceneCoordinateSpace)initWithWindowScene:(id)a3 effectiveSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIWindowSceneCoordinateSpace;
  v8 = [(_UIWindowSceneCoordinateSpace *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_effectiveSettings, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  -[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  -[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (UIWindowScene *)WeakRetained;
}

@end