@interface OpenTraceAction
- (BOOL)startNav;
- (NSString)filePath;
- (OpenTraceAction)initWithFilePath:(id)a3;
- (OpenTraceAction)initWithFilePath:(id)a3 shouldStartNav:(BOOL)a4;
- (void)setFilePath:(id)a3;
- (void)setStartNav:(BOOL)a3;
@end

@implementation OpenTraceAction

- (OpenTraceAction)initWithFilePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenTraceAction;
  v6 = [(OpenTraceAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filePath, a3);
    v7->_startNav = 0;
  }

  return v7;
}

- (OpenTraceAction)initWithFilePath:(id)a3 shouldStartNav:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OpenTraceAction;
  v8 = [(OpenTraceAction *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filePath, a3);
    v9->_startNav = a4;
  }

  return v9;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (BOOL)startNav
{
  return self->_startNav;
}

- (void)setStartNav:(BOOL)a3
{
  self->_startNav = a3;
}

- (void).cxx_destruct
{
}

@end