@interface UIScrollTestParameters
- (CADisplayLink)displayLink;
- (NSString)testName;
- (UIScrollTestParameters)init;
- (double)delta;
- (double)endOffset;
- (double)length;
- (double)startOffset;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)extraResultsBlock;
- (int64_t)iterations;
- (unint64_t)axis;
- (void)dealloc;
- (void)setAxis:(unint64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDelta:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setExtraResultsBlock:(id)a3;
- (void)setIterations:(int64_t)a3;
- (void)setLength:(double)a3;
- (void)setStartOffset:(double)a3;
- (void)setTestName:(id)a3;
@end

@implementation UIScrollTestParameters

- (UIScrollTestParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIScrollTestParameters;
  result = [(UIScrollTestParameters *)&v3 init];
  if (result)
  {
    result->_iterations = 3;
    *(_OWORD *)&result->_delta = xmmword_186B9E130;
    result->_axis = 2;
  }
  return result;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIScrollTestParameters;
  [(UIScrollTestParameters *)&v4 dealloc];
}

- (double)endOffset
{
  [(UIScrollTestParameters *)self startOffset];
  double v4 = v3;
  [(UIScrollTestParameters *)self length];
  return v4 + v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_alloc_init(UIScrollTestParameters);
  double v5 = [(UIScrollTestParameters *)self testName];
  [(UIScrollTestParameters *)v4 setTestName:v5];

  [(UIScrollTestParameters *)v4 setIterations:[(UIScrollTestParameters *)self iterations]];
  [(UIScrollTestParameters *)self delta];
  -[UIScrollTestParameters setDelta:](v4, "setDelta:");
  [(UIScrollTestParameters *)self length];
  -[UIScrollTestParameters setLength:](v4, "setLength:");
  [(UIScrollTestParameters *)v4 setAxis:[(UIScrollTestParameters *)self axis]];
  v6 = [(UIScrollTestParameters *)self extraResultsBlock];
  [(UIScrollTestParameters *)v4 setExtraResultsBlock:v6];

  return v4;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (double)delta
{
  return self->_delta;
}

- (void)setDelta:(double)a3
{
  self->_delta = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (id)extraResultsBlock
{
  return self->_extraResultsBlock;
}

- (void)setExtraResultsBlock:(id)a3
{
}

- (double)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(double)a3
{
  self->_startOffset = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_extraResultsBlock, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end