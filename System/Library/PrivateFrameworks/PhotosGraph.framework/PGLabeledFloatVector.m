@interface PGLabeledFloatVector
- (MAFloatVector)floatVector;
- (MAFloatVector)label;
- (PGLabeledFloatVector)initWithFloatVector:(id)a3 label:(id)a4;
@end

@implementation PGLabeledFloatVector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_floatVector, 0);
}

- (MAFloatVector)label
{
  return self->_label;
}

- (MAFloatVector)floatVector
{
  return self->_floatVector;
}

- (PGLabeledFloatVector)initWithFloatVector:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGLabeledFloatVector;
  v9 = [(PGLabeledFloatVector *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_floatVector, a3);
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

@end