@interface WFHarnessTestResultExpectation
- (NSString)filePath;
- (WFHarnessTestResultExpectation)initWithBlock:(id)a3 filePath:(id)a4 lineNumber:(int64_t)a5;
- (id)block;
- (int64_t)lineNumber;
- (void)testWithResult:(id)a3 completion:(id)a4;
@end

@implementation WFHarnessTestResultExpectation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (id)block
{
  return self->_block;
}

- (int64_t)lineNumber
{
  return self->_lineNumber;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)testWithResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFHarnessTestResultExpectation *)self block];
  v8[2](v8, v7, v6);
}

- (WFHarnessTestResultExpectation)initWithBlock:(id)a3 filePath:(id)a4 lineNumber:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFHarnessTestResultExpectation.m", 16, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFHarnessTestResultExpectation.m", 17, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFHarnessTestResultExpectation;
  v12 = [(WFHarnessTestResultExpectation *)&v19 init];
  if (v12)
  {
    v13 = _Block_copy(v9);
    id block = v12->_block;
    v12->_id block = v13;

    objc_storeStrong((id *)&v12->_filePath, a4);
    v12->_lineNumber = a5;
    v15 = v12;
  }

  return v12;
}

@end