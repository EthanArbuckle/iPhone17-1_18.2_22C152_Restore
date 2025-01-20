@interface _UIONavigationBarTitleRenamerViewMetricsUpdateAction
- (BOOL)isPermitted;
- (CGRect)frame;
- (_UIONavigationBarTitleRenamerViewMetricsUpdateAction)initWithFrame:(CGRect)a3 textAlignment:(int64_t)a4 session:(id)a5 responseHandler:(id)a6;
- (int64_t)textAlignment;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIONavigationBarTitleRenamerViewMetricsUpdateAction

- (_UIONavigationBarTitleRenamerViewMetricsUpdateAction)initWithFrame:(CGRect)a3 textAlignment:(int64_t)a4 session:(id)a5 responseHandler:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  v14 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v15 = a5;
  id v16 = objc_alloc_init(v14);
  v17 = [v15 sessionIdentifier];

  [v16 setObject:v17 forSetting:0];
  v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v16 setObject:v18 forSetting:1];

  v19 = [NSNumber numberWithInteger:a4];
  [v16 setObject:v19 forSetting:2];

  v20 = (void *)MEMORY[0x1E4F4F670];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke;
  v26[3] = &unk_1E52EE548;
  id v27 = v13;
  id v21 = v13;
  v22 = [v20 responderWithHandler:v26];
  v25.receiver = self;
  v25.super_class = (Class)_UIONavigationBarTitleRenamerViewMetricsUpdateAction;
  v23 = [(_UIOServerAction *)&v25 initWithOriginContext:0 info:v16 responder:v22];

  return v23;
}

- (CGRect)frame
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateAction *)self info];
  v3 = [v2 objectForSetting:1];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (int64_t)textAlignment
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateAction *)self info];
  v3 = [v2 objectForSetting:2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isPermitted
{
  return 1;
}

- (void)performActionFromConnection:(id)a3
{
  if ([(_UIONavigationBarTitleRenamerViewMetricsUpdateAction *)self canSendResponse])
  {
    int64_t v4 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateAction *)self info];
    id v31 = [v4 objectForSetting:0];

    double v5 = +[_UINavigationBarTitleRenamer renameServer];
    double v6 = [v5 sessionWithIdentifier:v31];
    double v7 = v6;
    if (v6)
    {
      double v8 = [v6 existingRenamerContentView];
      [(_UIONavigationBarTitleRenamerViewMetricsUpdateAction *)self frame];
      objc_msgSend(v8, "setFrame:", 0.0, 0.0);
      objc_msgSend(v8, "setTextAlignment:", -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction textAlignment](self, "textAlignment"));
      double v9 = [v8 layer];
      uint64_t RenderId = CALayerGetRenderId();

      double v11 = [v8 layer];
      double v12 = [v11 context];
      uint64_t v13 = [v12 contextId];

      double v14 = [_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse alloc];
      [v8 intrinsicContentSize];
      double v16 = v15;
      double v18 = v17;
      [v8 bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      [v8 horizontalTextInset];
      uint64_t v28 = -[_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse initWithRenderID:contextID:intrinsicContentSize:bounds:horizontalTextInset:](v14, "initWithRenderID:contextID:intrinsicContentSize:bounds:horizontalTextInset:", RenderId, v13, v16, v18, v20, v22, v24, v26, v27);
    }
    else
    {
      v29 = [_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse alloc];
      double v8 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1ED12F8C0 code:1 userInfo:0];
      uint64_t v28 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)v29 initWithInfo:0 error:v8];
    }
    v30 = (void *)v28;
    [(_UIONavigationBarTitleRenamerViewMetricsUpdateAction *)self sendResponse:v28];
  }
}

@end