@interface SNNMILOperationEnumerator
- (SNNMILFunction)function;
- (SNNMILOperationEnumerator)initWithFunction:(id)a3;
- (id)nextObject;
- (void)setFunction:(id)a3;
@end

@implementation SNNMILOperationEnumerator

- (SNNMILOperationEnumerator)initWithFunction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILOperationEnumerator;
  v5 = [(SNNMILOperationEnumerator *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_currentIndex = 0;
    objc_storeWeak((id *)&v5->_function, v4);
  }

  return v6;
}

- (id)nextObject
{
  uint64_t currentIndex = self->_currentIndex;
  p_function = &self->_function;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_function);
  uint64_t v6 = [WeakRetained operationCount];

  if (v6 <= currentIndex)
  {
    objc_super v8 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_function);
    ++self->_currentIndex;
    objc_super v8 = objc_msgSend(v7, "operationAtIndex:");
  }
  return v8;
}

- (SNNMILFunction)function
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_function);
  return (SNNMILFunction *)WeakRetained;
}

- (void)setFunction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end