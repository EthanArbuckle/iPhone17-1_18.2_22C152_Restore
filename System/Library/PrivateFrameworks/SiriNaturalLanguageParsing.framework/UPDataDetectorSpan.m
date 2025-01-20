@interface UPDataDetectorSpan
- (UPDataDetectorSpan)initWithRange:(_NSRange)a3 category:(id)a4 dataDetectorResult:(__DDResult *)a5;
- (UPDataDetectorSpan)initWithRange:(_NSRange)a3 category:(id)a4 dataDetectorResult:(__DDResult *)a5 usoGraph:(id)a6;
- (USOSerializedGraph)usoGraph;
- (__DDResult)dataDetectorResult;
- (id)getUsoGraphPrintedForm;
- (void)dealloc;
@end

@implementation UPDataDetectorSpan

- (void).cxx_destruct
{
}

- (USOSerializedGraph)usoGraph
{
  return (USOSerializedGraph *)objc_getProperty(self, a2, 56, 1);
}

- (__DDResult)dataDetectorResult
{
  return self->_dataDetectorResult;
}

- (id)getUsoGraphPrintedForm
{
  return (id)[(USOSerializedGraph *)self->_usoGraph printedForm];
}

- (void)dealloc
{
  CFRelease(self->_dataDetectorResult);
  v3.receiver = self;
  v3.super_class = (Class)UPDataDetectorSpan;
  [(UPDataDetectorSpan *)&v3 dealloc];
}

- (UPDataDetectorSpan)initWithRange:(_NSRange)a3 category:(id)a4 dataDetectorResult:(__DDResult *)a5 usoGraph:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  v12 = (USOSerializedGraph *)a6;
  v13 = -[UPSpan initWithRange:type:category:](self, "initWithRange:type:category:", location, length, 2, v11);
  CFRetain(a5);
  v13->_dataDetectorResult = a5;
  usoGraph = v13->_usoGraph;
  v13->_usoGraph = v12;

  return v13;
}

- (UPDataDetectorSpan)initWithRange:(_NSRange)a3 category:(id)a4 dataDetectorResult:(__DDResult *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  v10 = -[UPSpan initWithRange:type:category:](self, "initWithRange:type:category:", location, length, 2, v9);
  CFRetain(a5);
  v10->_dataDetectorResult = a5;

  return v10;
}

@end