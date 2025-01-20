@interface TRIBackgroundMLTaskIdentifiers
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBMLTTaskIdentifiers:(id)a3;
- (NSString)bmltTaskId;
- (NSString)factorPackId;
- (NSString)treatmentId;
- (TRIBackgroundMLTaskIdentifiers)initWithBMLTTaskId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5;
- (TRIBackgroundMLTaskIdentifiers)initWithBMLTaskId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
@end

@implementation TRIBackgroundMLTaskIdentifiers

- (TRIBackgroundMLTaskIdentifiers)initWithBMLTTaskId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRIBackgroundMLTaskIdentifiers;
  v11 = [(TRIBackgroundMLTaskIdentifiers *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bmltTaskId, a3);
    v12->_deploymentId = a4;
    objc_storeStrong((id *)&v12->_treatmentId, a5);
  }

  return v12;
}

- (TRIBackgroundMLTaskIdentifiers)initWithBMLTaskId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRIBackgroundMLTaskIdentifiers;
  v11 = [(TRIBackgroundMLTaskIdentifiers *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bmltTaskId, a3);
    v12->_deploymentId = a4;
    objc_storeStrong((id *)&v12->_factorPackId, a5);
  }

  return v12;
}

- (BOOL)isEqualToBMLTTaskIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v6 = self->_bmltTaskId != 0;
  v7 = [v4 bmltTaskId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_12;
  }
  bmltTaskId = self->_bmltTaskId;
  if (bmltTaskId)
  {
    id v10 = [v5 bmltTaskId];
    int v11 = [(NSString *)bmltTaskId isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]) {
    goto LABEL_12;
  }
  int v13 = self->_treatmentId != 0;
  objc_super v14 = [v5 treatmentId];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_12;
  }
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    v17 = [v5 treatmentId];
    int v18 = [(NSString *)treatmentId isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  int v19 = self->_factorPackId != 0;
  v20 = [v5 factorPackId];
  int v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    char v24 = 0;
  }
  else
  {
    factorPackId = self->_factorPackId;
    if (factorPackId)
    {
      v23 = [v5 factorPackId];
      char v24 = [(NSString *)factorPackId isEqual:v23];
    }
    else
    {
      char v24 = 1;
    }
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIBackgroundMLTaskIdentifiers *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIBackgroundMLTaskIdentifiers *)self isEqualToBMLTTaskIdentifiers:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bmltTaskId hash];
  uint64_t v4 = self->_deploymentId - v3 + 32 * v3;
  return [(NSString *)self->_treatmentId hash] - v4 + 32 * v4;
}

- (id)description
{
  treatmentId = self->_treatmentId;
  id v4 = [NSString alloc];
  bmltTaskId = self->_bmltTaskId;
  uint64_t v6 = [NSNumber numberWithInt:self->_deploymentId];
  v7 = (void *)v6;
  uint64_t v8 = 24;
  if (treatmentId)
  {
    id v9 = @"<TRIBackgroundMLTaskIdentifiers | bmltTaskId:%@ deploymentId:%@ treatmentId:%@>";
  }
  else
  {
    uint64_t v8 = 32;
    id v9 = @"<TRIBackgroundMLTaskIdentifiers | bmltTaskId:%@ deploymentId:%@ factorPackId:%@>";
  }
  id v10 = objc_msgSend(v4, "initWithFormat:", v9, bmltTaskId, v6, *(Class *)((char *)&self->super.isa + v8));

  return v10;
}

- (NSString)bmltTaskId
{
  return self->_bmltTaskId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_bmltTaskId, 0);
}

@end