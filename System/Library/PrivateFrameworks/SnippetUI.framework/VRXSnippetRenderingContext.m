@interface VRXSnippetRenderingContext
- (VRXSnippetRenderingContext)initWithRenderingEvent:(int64_t)a3;
- (_TtC9SnippetUI25RFSnippetRenderingContext)snippetRenderingContext;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation VRXSnippetRenderingContext

- (VRXSnippetRenderingContext)initWithRenderingEvent:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VRXSnippetRenderingContext;
  v4 = [(VRXSnippetRenderingContext *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC9SnippetUI25RFSnippetRenderingContext alloc] initWithEvent:a3];
    snippetRenderingContext = v4->_snippetRenderingContext;
    v4->_snippetRenderingContext = v5;
  }
  return v4;
}

- (void)emitWithTurnIdentifier:(id)a3
{
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
}

- (_TtC9SnippetUI25RFSnippetRenderingContext)snippetRenderingContext
{
  return (_TtC9SnippetUI25RFSnippetRenderingContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end