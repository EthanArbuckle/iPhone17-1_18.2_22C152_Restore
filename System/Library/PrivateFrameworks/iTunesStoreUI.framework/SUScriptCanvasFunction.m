@interface SUScriptCanvasFunction
- (id)copyResultForSize:(CGSize)a3;
- (void)dealloc;
@end

@implementation SUScriptCanvasFunction

- (void)dealloc
{
  self->_lastResult = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptCanvasFunction;
  [(SUScriptFunction *)&v3 dealloc];
}

- (id)copyResultForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SUScriptFunction *)self lock];
  lastResult = self->_lastResult;
  if (lastResult
    && (v7 = [(SUScriptCanvasResult *)lastResult canvasImage]) != 0
    && (([(UIImage *)v7 size], width == v9) ? (BOOL v10 = height == v8) : (BOOL v10 = 0), v10))
  {
    v19 = self->_lastResult;
    [(SUScriptFunction *)self unlock];
    if (v19) {
      return v19;
    }
  }
  else
  {
    [(SUScriptFunction *)self unlock];
  }
  id v11 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  *(float *)&double v13 = width;
  uint64_t v14 = [NSNumber numberWithFloat:v13];
  *(float *)&double v15 = height;
  v16 = objc_msgSend(v11, "initWithObjects:", v12, v14, objc_msgSend(NSNumber, "numberWithFloat:", v15), 0);
  id v17 = [(SUScriptFunction *)self callSynchronouslyWithArguments:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptFunction *)self lock];

    v18 = [[SUScriptCanvasResult alloc] _initWithCanvas:v17];
    self->_lastResult = v18;
    v19 = v18;
    [(SUScriptFunction *)self unlock];
  }
  else
  {
    v19 = self->_lastResult;
  }

  return v19;
}

@end