@interface UIDragPreview
+ (CGSize)defaultBoundingSize;
+ (CGSize)textBoundingSize;
+ (UIDragPreview)previewForURL:(NSURL *)url;
+ (UIDragPreview)previewForURL:(NSURL *)url title:(NSString *)title;
- (BOOL)_preventAfterScreenUpdatesSnapshot;
- (BOOL)_springboardPlatterStyle;
- (BOOL)avoidAnimation;
- (CGPoint)preferredAnchorPoint;
- (NSDictionary)_springboardParameters;
- (UIDragPreview)initWithView:(UIView *)view;
- (UIDragPreview)initWithView:(UIView *)view parameters:(UIDragPreviewParameters *)parameters;
- (UIDragPreviewParameters)parameters;
- (UIView)view;
- (_DUIPreview)_duiPreview;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setPreventAfterScreenUpdatesSnapshot:(BOOL)a3;
- (void)setAvoidAnimation:(BOOL)a3;
- (void)setPreferredAnchorPoint:(CGPoint)a3;
- (void)set_springboardParameters:(id)a3;
- (void)set_springboardPlatterStyle:(BOOL)a3;
@end

@implementation UIDragPreview

+ (UIDragPreview)previewForURL:(NSURL *)url
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v3 = +[UIURLDragPreviewView viewWithURL:url];
  v4 = [UIDragPreview alloc];
  id v5 = v3;
  v6 = [UIDragPreviewParameters alloc];
  v7 = (void *)MEMORY[0x1E4F29238];
  [v5 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = objc_msgSend(v7, "valueWithCGRect:", v9, v11, v13, v15);
  v21[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v18 = [(UIPreviewParameters *)v6 initWithTextLineRects:v17];

  v19 = [(UIDragPreview *)v4 initWithView:v5 parameters:v18];
  return v19;
}

+ (UIDragPreview)previewForURL:(NSURL *)url title:(NSString *)title
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v4 = +[UIURLDragPreviewView viewWithTitle:title URL:url];
  id v5 = [UIDragPreview alloc];
  id v6 = v4;
  v7 = [UIDragPreviewParameters alloc];
  double v8 = (void *)MEMORY[0x1E4F29238];
  [v6 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = objc_msgSend(v8, "valueWithCGRect:", v10, v12, v14, v16);
  v22[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v19 = [(UIPreviewParameters *)v7 initWithTextLineRects:v18];

  v20 = [(UIDragPreview *)v5 initWithView:v6 parameters:v19];
  return v20;
}

- (UIDragPreview)initWithView:(UIView *)view parameters:(UIDragPreviewParameters *)parameters
{
  double v8 = view;
  double v9 = parameters;
  double v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIDragPreview.m", 46, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"UIDragPreview.m", 47, @"Invalid parameter not satisfying: %@", @"parameters != nil" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)UIDragPreview;
  double v11 = [(UIDragPreview *)&v19 init];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_view, view);
    uint64_t v13 = [(UIDragPreviewParameters *)v10 copy];
    double v14 = v12->_parameters;
    v12->_parameters = (UIDragPreviewParameters *)v13;

    double v15 = v12;
  }

  return v12;
}

- (UIDragPreview)initWithView:(UIView *)view
{
  v4 = view;
  id v5 = objc_alloc_init(UIDragPreviewParameters);
  id v6 = [(UIDragPreview *)self initWithView:v4 parameters:v5];

  return v6;
}

- (_DUIPreview)_duiPreview
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(UIDragPreview *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 == 0.0 || v7 == 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v18 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      objc_super v19 = [(UIDragPreview *)self view];
      int v20 = 138412290;
      v21 = v19;
      _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "UIDragPreview does not support zero-sized previews. This is a client issue. PLEASE FIX ME. %@", (uint8_t *)&v20, 0xCu);
    }
    else
    {
      v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_duiPreview___s_category) + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      v18 = v17;
      objc_super v19 = [(UIDragPreview *)self view];
      int v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "UIDragPreview does not support zero-sized previews. This is a client issue. PLEASE FIX ME. %@", (uint8_t *)&v20, 0xCu);
    }

LABEL_16:
  }
LABEL_3:
  double v8 = [_DUIPreview alloc];
  double v9 = [(UIDragPreview *)self view];
  double v10 = [(UIDragPreview *)self parameters];
  double v11 = [(_DUIPreview *)v8 initWithView:v9 container:0 parameters:v10];

  [(_DUIPreview *)v11 setAvoidAnimation:[(UIDragPreview *)self avoidAnimation]];
  if (self->_preferredAnchorPoint)
  {
    [(UIDragPreview *)self preferredAnchorPoint];
    double v14 = v13 / v5;
    if (v5 == 0.0) {
      double v14 = 0.5;
    }
    double v15 = v12 / v7;
    if (v7 == 0.0) {
      double v15 = 0.5;
    }
    -[_DUIPreview setLiftAnchorPoint:](v11, "setLiftAnchorPoint:", v14, v15);
  }
  return v11;
}

+ (CGSize)defaultBoundingSize
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = 206.0;
  if (!v3) {
    double v4 = 160.0;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)textBoundingSize
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = 400.0;
  if (!v3) {
    double v4 = 310.0;
  }
  double v5 = 206.0;
  if (!v3) {
    double v5 = 160.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPreferredAnchorPoint:(CGPoint)a3
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a3.x, a3.y);
  double v4 = (NSValue *)objc_claimAutoreleasedReturnValue();
  preferredAnchorPoint = self->_preferredAnchorPoint;
  self->_preferredAnchorPoint = v4;
}

- (CGPoint)preferredAnchorPoint
{
  [(NSValue *)self->_preferredAnchorPoint CGPointValue];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)set_springboardPlatterStyle:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 0;
  }
  [(UIPreviewParameters *)self->_parameters _setPreviewMode:v3];
}

- (BOOL)_springboardPlatterStyle
{
  return [(UIPreviewParameters *)self->_parameters _previewMode] == 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 24), self->_view);
    double v6 = [(UIDragPreview *)self parameters];
    uint64_t v7 = [v6 copy];
    double v8 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v7;

    *(unsigned char *)(v5 + 17) = self->_avoidAnimation;
    double v9 = [(UIDragPreview *)self _springboardParameters];
    uint64_t v10 = [v9 copy];
    double v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    objc_storeStrong((id *)(v5 + 8), self->_preferredAnchorPoint);
    id v12 = (id)v5;
  }

  return (id)v5;
}

- (UIView)view
{
  return self->_view;
}

- (UIDragPreviewParameters)parameters
{
  return self->_parameters;
}

- (BOOL)_preventAfterScreenUpdatesSnapshot
{
  return self->_preventAfterScreenUpdatesSnapshot;
}

- (void)_setPreventAfterScreenUpdatesSnapshot:(BOOL)a3
{
  self->_preventAfterScreenUpdatesSnapshot = a3;
}

- (BOOL)avoidAnimation
{
  return self->_avoidAnimation;
}

- (void)setAvoidAnimation:(BOOL)a3
{
  self->_avoidAnimation = a3;
}

- (NSDictionary)_springboardParameters
{
  return self->__springboardParameters;
}

- (void)set_springboardParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__springboardParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_preferredAnchorPoint, 0);
}

@end