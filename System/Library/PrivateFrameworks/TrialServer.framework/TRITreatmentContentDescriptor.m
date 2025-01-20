@interface TRITreatmentContentDescriptor
+ (id)descriptorWithTreatmentId:(id)a3 container:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescriptor:(id)a3;
- (NSString)treatmentId;
- (TRIAppContainer)container;
- (TRITreatmentContentDescriptor)initWithTreatmentId:(id)a3 container:(id)a4;
- (id)copyWithReplacementContainer:(id)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRITreatmentContentDescriptor

- (TRITreatmentContentDescriptor)initWithTreatmentId:(id)a3 container:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2507, @"Invalid parameter not satisfying: %@", @"treatmentId != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)TRITreatmentContentDescriptor;
  v10 = [(TRITreatmentContentDescriptor *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_treatmentId, a3);
    objc_storeStrong((id *)&v11->_container, a4);
  }

  return v11;
}

+ (id)descriptorWithTreatmentId:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTreatmentId:v7 container:v6];

  return v8;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTreatmentId:v4 container:self->_container];

  return v5;
}

- (id)copyWithReplacementContainer:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTreatmentId:self->_treatmentId container:v4];

  return v5;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_treatmentId != 0;
  id v7 = [v4 treatmentId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    v10 = [v5 treatmentId];
    int v11 = [(NSString *)treatmentId isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_container != 0;
  v13 = [v5 container];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    container = self->_container;
    if (container)
    {
      v16 = [v5 container];
      char v17 = [(TRIAppContainer *)container isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITreatmentContentDescriptor *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITreatmentContentDescriptor *)self isEqualToDescriptor:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_treatmentId hash];
  return [(TRIAppContainer *)self->_container hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRITreatmentContentDescriptor | treatmentId:%@ container:%@>", self->_treatmentId, self->_container];
  return v2;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (TRIAppContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

@end