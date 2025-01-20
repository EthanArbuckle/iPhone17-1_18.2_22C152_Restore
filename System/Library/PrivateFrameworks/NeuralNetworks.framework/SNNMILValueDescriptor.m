@interface SNNMILValueDescriptor
- (BOOL)isScalar;
- (NSArray)dimensions;
- (NSString)name;
- (SNNMILValueDescriptor)initWithShape:(id)a3 dataType:(unint64_t)a4;
- (SNNMILValueDescriptor)initWithShape:(id)a3 dataType:(unint64_t)a4 name:(id)a5;
- (unint64_t)dataType;
@end

@implementation SNNMILValueDescriptor

- (SNNMILValueDescriptor)initWithShape:(id)a3 dataType:(unint64_t)a4 name:(id)a5
{
  v8 = (NSArray *)a3;
  v9 = (NSString *)a5;
  v15.receiver = self;
  v15.super_class = (Class)SNNMILValueDescriptor;
  v10 = [(SNNMILValue *)&v15 init];
  dimensions = v10->_dimensions;
  v10->_dimensions = v8;
  v12 = v8;

  v10->_dataType = a4;
  name = v10->_name;
  v10->_name = v9;

  return v10;
}

- (SNNMILValueDescriptor)initWithShape:(id)a3 dataType:(unint64_t)a4
{
  v6 = (NSArray *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SNNMILValueDescriptor;
  v7 = [(SNNMILValue *)&v10 init];
  dimensions = v7->_dimensions;
  v7->_dimensions = v6;

  v7->_dataType = a4;
  return v7;
}

- (BOOL)isScalar
{
  v2 = [(SNNMILValueDescriptor *)self dimensions];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end