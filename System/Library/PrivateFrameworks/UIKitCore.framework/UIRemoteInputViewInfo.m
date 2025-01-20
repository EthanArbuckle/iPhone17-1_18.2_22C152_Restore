@interface UIRemoteInputViewInfo
- (BOOL)shouldShowDockView;
- (CGSize)size;
- (NSEdgeInsets)insets;
- (RTIInputViewInfo)rtiInputViewInfo;
- (id)description;
- (int)processId;
- (unsigned)contextId;
- (void)setContextId:(unsigned int)a3;
- (void)setInsets:(NSEdgeInsets)a3;
- (void)setProcessId:(int)a3;
- (void)setShouldShowDockView:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation UIRemoteInputViewInfo

- (RTIInputViewInfo)rtiInputViewInfo
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getRTIInputViewInfoClass_softClass;
  uint64_t v11 = getRTIInputViewInfoClass_softClass;
  if (!getRTIInputViewInfoClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getRTIInputViewInfoClass_block_invoke;
    v7[3] = &unk_1E52D9900;
    v7[4] = &v8;
    __getRTIInputViewInfoClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setContextId:", -[UIRemoteInputViewInfo contextId](self, "contextId"));
  [(UIRemoteInputViewInfo *)self size];
  objc_msgSend(v5, "setSize:");
  [(UIRemoteInputViewInfo *)self insets];
  objc_msgSend(v5, "setInsets:");
  return (RTIInputViewInfo *)v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(UIRemoteInputViewInfo *)self processId];
  v6 = [(UIRemoteInputViewInfo *)self rtiInputViewInfo];
  v7 = [v3 stringWithFormat:@"<%@: %p processId = %d; info = %@>", v4, self, v5, v6];;

  return v7;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(NSEdgeInsets)a3
{
  self->_insets = a3;
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

@end