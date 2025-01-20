@interface _NSCGTextGraphicsContext
+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3;
- (BOOL)isDrawingToScreen;
- (BOOL)isFlipped;
- (CGContext)CGContext;
- (_NSCGTextGraphicsContext)initWithCGContext:(CGContext *)a3;
- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3;
- (void)dealloc;
- (void)restoreGraphicsState;
- (void)saveGraphicsState;
@end

@implementation _NSCGTextGraphicsContext

- (BOOL)isFlipped
{
  return 1;
}

- (CGContext)CGContext
{
  return self->_context;
}

- (void)dealloc
{
  context = self->_context;
  if (context) {
    CGContextRelease(context);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSCGTextGraphicsContext;
  [(_NSCGTextGraphicsContext *)&v4 dealloc];
}

- (_NSCGTextGraphicsContext)initWithCGContext:(CGContext *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NSCGTextGraphicsContext;
  objc_super v4 = [(_NSCGTextGraphicsContext *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->_context = CGContextRetain(a3);
  }
  return v5;
}

- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3
{
  context = self->_context;
  uint64_t v5 = [(_NSCGTextGraphicsContext *)self isFlipped];

  setCurrentCGContextDuringBlock_iOS((uint64_t)context, v5, (uint64_t)a3);
}

+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromClass((Class)a1);
  [v4 raise:v5, @"+[%@ %@] should not be invoked.", v6, NSStringFromSelector(a2) format];
  return 0;
}

- (BOOL)isDrawingToScreen
{
  return 1;
}

- (void)saveGraphicsState
{
  context = self->_context;
  if (context) {
    CGContextSaveGState(context);
  }
}

- (void)restoreGraphicsState
{
  context = self->_context;
  if (context) {
    CGContextRestoreGState(context);
  }
}

@end