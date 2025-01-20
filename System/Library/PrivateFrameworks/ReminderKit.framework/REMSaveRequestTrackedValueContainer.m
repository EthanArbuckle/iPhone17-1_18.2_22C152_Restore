@interface REMSaveRequestTrackedValueContainer
- (REMSaveRequestTrackedValue)template;
- (REMSaveRequestTrackedValue)weakValue;
- (REMSaveRequestTrackedValueContainer)initWithValue:(id)a3;
- (id)valueForSaveRequest:(id)a3;
- (id)valueWithoutPerformingCopy;
- (void)setTemplate:(id)a3;
- (void)setWeakValue:(id)a3;
@end

@implementation REMSaveRequestTrackedValueContainer

- (REMSaveRequestTrackedValueContainer)initWithValue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMSaveRequestTrackedValueContainer;
  v5 = [(REMSaveRequestTrackedValueContainer *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakValue, v4);
    uint64_t v7 = [v4 shallowCopyWithSaveRequest:0];
    v8 = v6->_template;
    v6->_template = (REMSaveRequestTrackedValue *)v7;
  }
  return v6;
}

- (id)valueForSaveRequest:(id)a3
{
  id v4 = a3;
  v5 = [(REMSaveRequestTrackedValueContainer *)self weakValue];
  if (!v5)
  {
    v6 = [(REMSaveRequestTrackedValueContainer *)self template];
    v5 = [v6 shallowCopyWithSaveRequest:v4];

    [(REMSaveRequestTrackedValueContainer *)self setWeakValue:v5];
  }

  return v5;
}

- (id)valueWithoutPerformingCopy
{
  v3 = [(REMSaveRequestTrackedValueContainer *)self weakValue];
  if (!v3)
  {
    v3 = [(REMSaveRequestTrackedValueContainer *)self template];
  }

  return v3;
}

- (REMSaveRequestTrackedValue)weakValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakValue);

  return (REMSaveRequestTrackedValue *)WeakRetained;
}

- (void)setWeakValue:(id)a3
{
}

- (REMSaveRequestTrackedValue)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_template, 0);

  objc_destroyWeak((id *)&self->_weakValue);
}

@end