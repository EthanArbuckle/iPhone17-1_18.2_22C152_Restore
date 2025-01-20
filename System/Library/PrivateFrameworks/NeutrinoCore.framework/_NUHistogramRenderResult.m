@interface _NUHistogramRenderResult
- (NUImageHistogram)histogram;
- (_NUHistogramRenderResult)initWithHistogram:(id)a3;
@end

@implementation _NUHistogramRenderResult

- (void).cxx_destruct
{
}

- (NUImageHistogram)histogram
{
  return (NUImageHistogram *)objc_getProperty(self, a2, 16, 1);
}

- (_NUHistogramRenderResult)initWithHistogram:(id)a3
{
  v4 = (NUImageHistogram *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_NUHistogramRenderResult;
  v5 = [(_NUHistogramRenderResult *)&v8 init];
  histogram = v5->_histogram;
  v5->_histogram = v4;

  return v5;
}

@end