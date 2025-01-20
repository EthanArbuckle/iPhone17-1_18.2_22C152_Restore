@interface JSAPendingExecutionRecord
- (BOOL)isValueManaged;
- (JSAPendingExecutionRecord)initWithBlock:(id)a3;
- (JSAPendingExecutionRecord)initWithManagedValue:(id)a3 method:(id)a4 arguments:(id)a5 type:(unint64_t)a6;
- (JSAPendingExecutionRecord)initWithValue:(id)a3 method:(id)a4 arguments:(id)a5 type:(unint64_t)a6;
- (JSManagedValue)managedValue;
- (JSValue)recordValue;
- (JSValue)value;
- (NSArray)arguments;
- (NSString)method;
- (id)block;
- (unint64_t)type;
- (void)setIsValueManaged:(BOOL)a3;
- (void)setManagedValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation JSAPendingExecutionRecord

- (JSAPendingExecutionRecord)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JSAPendingExecutionRecord;
  v5 = [(JSAPendingExecutionRecord *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id block = v5->_block;
    v5->_id block = v6;

    v5->_type = 1;
  }

  return v5;
}

- (JSAPendingExecutionRecord)initWithManagedValue:(id)a3 method:(id)a4 arguments:(id)a5 type:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)JSAPendingExecutionRecord;
  v14 = [(JSAPendingExecutionRecord *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_isValueManaged = 1;
    objc_storeStrong((id *)&v14->_managedValue, a3);
    v16 = (NSString *)[v12 copy];
    method = v15->_method;
    v15->_method = v16;

    v18 = (NSArray *)[v13 copy];
    arguments = v15->_arguments;
    v15->_arguments = v18;

    v15->_type = a6;
  }

  return v15;
}

- (JSAPendingExecutionRecord)initWithValue:(id)a3 method:(id)a4 arguments:(id)a5 type:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)JSAPendingExecutionRecord;
  v14 = [(JSAPendingExecutionRecord *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_isValueManaged = 0;
    objc_storeStrong((id *)&v14->_value, a3);
    v16 = (NSString *)[v12 copy];
    method = v15->_method;
    v15->_method = v16;

    v18 = (NSArray *)[v13 copy];
    arguments = v15->_arguments;
    v15->_arguments = v18;

    v15->_type = a6;
  }

  return v15;
}

- (JSValue)recordValue
{
  if ([(JSAPendingExecutionRecord *)self isValueManaged])
  {
    v3 = [(JSAPendingExecutionRecord *)self managedValue];
    id v4 = [v3 value];
  }
  else
  {
    id v4 = [(JSAPendingExecutionRecord *)self value];
  }

  return (JSValue *)v4;
}

- (id)block
{
  return self->_block;
}

- (NSString)method
{
  return self->_method;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isValueManaged
{
  return self->_isValueManaged;
}

- (void)setIsValueManaged:(BOOL)a3
{
  self->_isValueManaged = a3;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (void)setManagedValue:(id)a3
{
}

- (JSValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_managedValue, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_method, 0);

  objc_storeStrong(&self->_block, 0);
}

@end