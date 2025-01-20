@interface AEMinimalTemplateStepRange
- (NSMutableArray)steps;
- (NSString)keyPath;
- (void)setKeyPath:(id)a3;
- (void)setSteps:(id)a3;
@end

@implementation AEMinimalTemplateStepRange

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (NSMutableArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end