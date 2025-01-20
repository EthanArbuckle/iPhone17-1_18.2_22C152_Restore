@interface WFWorkflowRunViewSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalidated;
- (CGRect)originFrame;
- (NSUUID)uuid;
- (UIView)originView;
- (WFWorkflowRunViewSource)initWithCoder:(id)a3;
- (WFWorkflowRunViewSource)initWithView:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)renderID;
- (unsigned)contextID;
- (void)encodeWithCoder:(id)a3;
- (void)refresh;
- (void)setContextID:(unsigned int)a3;
- (void)setOriginFrame:(CGRect)a3;
- (void)setOriginView:(id)a3;
- (void)setRenderID:(unint64_t)a3;
- (void)updateSourceView:(id)a3;
@end

@implementation WFWorkflowRunViewSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_originView);
}

- (void)setOriginFrame:(CGRect)a3
{
  self->_originFrame = a3;
}

- (CGRect)originFrame
{
  double x = self->_originFrame.origin.x;
  double y = self->_originFrame.origin.y;
  double width = self->_originFrame.size.width;
  double height = self->_originFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setRenderID:(unint64_t)a3
{
  self->_renderID = a3;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setOriginView:(id)a3
{
}

- (UIView)originView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originView);
  return (UIView *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowRunViewSource;
  v4 = [(WFWorkflowRunViewSource *)&v14 description];
  unint64_t v5 = [(WFWorkflowRunViewSource *)self renderID];
  uint64_t v6 = [(WFWorkflowRunViewSource *)self contextID];
  [(WFWorkflowRunViewSource *)self originFrame];
  v11 = WFStringFromCGRect(v7, v8, v9, v10);
  v12 = [v3 stringWithFormat:@"<%@, renderID: %llu, contextID: %u, originFrame: %@>", v4, v5, v6, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(WFWorkflowRunViewSource *)self uuid];
  uint64_t v7 = [v6 copyWithZone:a3];
  double v8 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v7;

  *(void *)(v5 + 32) = [(WFWorkflowRunViewSource *)self renderID];
  *(_DWORD *)(v5 + 8) = [(WFWorkflowRunViewSource *)self contextID];
  [(WFWorkflowRunViewSource *)self originFrame];
  *(void *)(v5 + 40) = v9;
  *(void *)(v5 + 48) = v10;
  *(void *)(v5 + 56) = v11;
  *(void *)(v5 + 64) = v12;
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFWorkflowRunViewSource *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[WFWorkflowRunViewSource renderID](self, "renderID"));
  [v4 encodeObject:v6 forKey:@"renderID"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[WFWorkflowRunViewSource contextID](self, "contextID"));
  [v4 encodeObject:v7 forKey:@"contextID"];

  [(WFWorkflowRunViewSource *)self originFrame];
  WFStringFromCGRect(v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"originFrame"];
}

- (WFWorkflowRunViewSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowRunViewSource;
  uint64_t v5 = [(WFWorkflowRunViewSource *)&v25 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderID"];
  v5->_renderID = [v8 unsignedLongLongValue];
  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextID"];
  v5->_contextID = [v9 unsignedIntValue];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originFrame"];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  double v11 = (double (*)(id))getCGRectFromStringSymbolLoc_ptr;
  v34 = getCGRectFromStringSymbolLoc_ptr;
  if (!getCGRectFromStringSymbolLoc_ptr)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getCGRectFromStringSymbolLoc_block_invoke;
    v29 = &unk_1E6079C28;
    v30 = &v31;
    id v12 = UIKitCoreLibrary();
    v13 = dlsym(v12, "CGRectFromString");
    *(void *)(v30[1] + 24) = v13;
    getCGRectFromStringSymbolLoc_ptr = *(_UNKNOWN **)(v30[1] + 24);
    double v11 = (double (*)(id))v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (v11)
  {
    double v14 = v11(v10);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v5->_originFrame.origin.double x = v14;
    v5->_originFrame.origin.double y = v16;
    v5->_originFrame.size.double width = v18;
    v5->_originFrame.size.double height = v20;
    v21 = v5;

LABEL_6:
    return v5;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  v24 = [NSString stringWithUTF8String:"CGRect WFCGRectFromString(NSString *__strong)"];
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"WFWorkflowRunViewSource.m", 21, @"%s", dlerror());

  __break(1u);
  return result;
}

- (unint64_t)hash
{
  v2 = [(WFWorkflowRunViewSource *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFWorkflowRunViewSource *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [(WFWorkflowRunViewSource *)v6 uuid];
      double v8 = [(WFWorkflowRunViewSource *)self uuid];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (BOOL)isInvalidated
{
  [(WFWorkflowRunViewSource *)self originFrame];
  return CGRectEqualToRect(v4, *MEMORY[0x1E4F1DB28])
      || ![(WFWorkflowRunViewSource *)self renderID]
      || [(WFWorkflowRunViewSource *)self contextID] == 0;
}

- (void)refresh
{
  unint64_t v3 = [(WFWorkflowRunViewSource *)self originView];
  CGRect v4 = [v3 layer];
  [(WFWorkflowRunViewSource *)self setRenderID:CALayerGetRenderId()];

  uint64_t v5 = [(WFWorkflowRunViewSource *)self originView];
  uint64_t v6 = [v5 layer];
  uint64_t v7 = CALayerGetContext();
  -[WFWorkflowRunViewSource setContextID:](self, "setContextID:", [v7 contextId]);

  id v22 = [(WFWorkflowRunViewSource *)self originView];
  double v8 = [v22 superview];
  char v9 = [(WFWorkflowRunViewSource *)self originView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGFloat v18 = [(WFWorkflowRunViewSource *)self originView];
  double v19 = [v18 window];
  CGFloat v20 = [v19 rootViewController];
  v21 = [v20 view];
  objc_msgSend(v8, "convertRect:toView:", v21, v11, v13, v15, v17);
  -[WFWorkflowRunViewSource setOriginFrame:](self, "setOriginFrame:");
}

- (void)updateSourceView:(id)a3
{
  id v37 = a3;
  [(WFWorkflowRunViewSource *)self setOriginView:v37];
  if (v37)
  {
    CGRect v4 = [v37 layer];
    uint64_t RenderId = CALayerGetRenderId();

    unint64_t v6 = [(WFWorkflowRunViewSource *)self renderID];
    BOOL v7 = v6 != RenderId;
    if (v6 != RenderId) {
      [(WFWorkflowRunViewSource *)self setRenderID:RenderId];
    }
    double v8 = [v37 layer];
    char v9 = CALayerGetContext();
    uint64_t v10 = [v9 contextId];

    unsigned int v11 = [(WFWorkflowRunViewSource *)self contextID];
    if (v10 && v11 != v10)
    {
      [(WFWorkflowRunViewSource *)self setContextID:v10];
      BOOL v7 = 1;
    }
    double v12 = [v37 superview];
    [v37 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [v37 window];
    id v22 = [v21 rootViewController];
    v23 = [v22 view];
    objc_msgSend(v12, "convertRect:toView:", v23, v14, v16, v18, v20);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    [(WFWorkflowRunViewSource *)self originFrame];
    v41.origin.double x = v25;
    v41.origin.double y = v27;
    v41.size.double width = v29;
    v41.size.double height = v31;
    if (CGRectEqualToRect(v39, v41))
    {
      if (!v7) {
        goto LABEL_16;
      }
    }
    else
    {
      -[WFWorkflowRunViewSource setOriginFrame:](self, "setOriginFrame:", v25, v27, v29, v31);
    }
LABEL_15:
    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 postNotificationName:@"WFWorkflowRunViewSourceUpdatedNotification" object:self userInfo:MEMORY[0x1E4F1CC08]];

    goto LABEL_16;
  }
  [(WFWorkflowRunViewSource *)self originFrame];
  double v32 = *MEMORY[0x1E4F1DB28];
  double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v42.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v42.origin.double y = v33;
  v42.size.double width = v34;
  v42.size.double height = v35;
  if (!CGRectEqualToRect(v40, v42)
    || [(WFWorkflowRunViewSource *)self renderID]
    || [(WFWorkflowRunViewSource *)self contextID])
  {
    -[WFWorkflowRunViewSource setOriginFrame:](self, "setOriginFrame:", v32, v33, v34, v35);
    [(WFWorkflowRunViewSource *)self setRenderID:0];
    [(WFWorkflowRunViewSource *)self setContextID:0];
    goto LABEL_15;
  }
LABEL_16:
}

- (WFWorkflowRunViewSource)initWithView:(id)a3
{
  id v4 = a3;
  if (v4
    && (v28.receiver = self,
        v28.super_class = (Class)WFWorkflowRunViewSource,
        (self = [(WFWorkflowRunViewSource *)&v28 init]) != 0))
  {
    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    uuid = self->_uuid;
    self->_uuid = v5;

    BOOL v7 = [v4 layer];
    self->_renderID = CALayerGetRenderId();

    double v8 = [v4 layer];
    char v9 = CALayerGetContext();
    self->_contextID = [v9 contextId];

    uint64_t v10 = [v4 superview];
    [v4 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [v4 window];
    double v20 = [v19 rootViewController];
    v21 = [v20 view];
    objc_msgSend(v10, "convertRect:toView:", v21, v12, v14, v16, v18);
    self->_originFrame.origin.double x = v22;
    self->_originFrame.origin.double y = v23;
    self->_originFrame.size.double width = v24;
    self->_originFrame.size.double height = v25;

    objc_storeWeak((id *)&self->_originView, v4);
    self = self;
    double v26 = self;
  }
  else
  {
    double v26 = 0;
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end