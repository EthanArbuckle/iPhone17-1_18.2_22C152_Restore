@interface PXOperationStatus
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndeterminate;
- (NSError)error;
- (PXOperationStatus)init;
- (PXOperationStatus)initWithState:(int64_t)a3 error:(id)a4;
- (PXOperationStatus)initWithState:(int64_t)a3 progress:(double)a4 error:(id)a5;
- (double)progress;
- (id)description;
- (id)operationStatusByMixingOperationStatus:(id)a3 withMixFactor:(double)a4;
- (id)redactedDescription;
- (int64_t)state;
- (unint64_t)hash;
@end

@implementation PXOperationStatus

- (PXOperationStatus)initWithState:(int64_t)a3 progress:(double)a4 error:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXOperationStatus;
  v9 = [(PXOperationStatus *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_state = a3;
    v9->_progress = a4;
    v9->_indeterminate = 0;
    uint64_t v11 = [v8 copy];
    error = v10->_error;
    v10->_error = (NSError *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 state];
    if (v6 == [(PXOperationStatus *)self state]
      && (int v7 = [v5 isIndeterminate], v7 == -[PXOperationStatus isIndeterminate](self, "isIndeterminate"))
      && ([v5 progress], double v9 = v8, -[PXOperationStatus progress](self, "progress"), v9 == v10))
    {
      uint64_t v11 = [v5 error];
      v12 = [(PXOperationStatus *)self error];
      if (v11 == v12)
      {
        char v15 = 1;
      }
      else
      {
        v13 = [v5 error];
        objc_super v14 = [(PXOperationStatus *)self error];
        char v15 = [v13 isEqual:v14];
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (double)progress
{
  return self->_progress;
}

- (id)redactedDescription
{
  if ([(PXOperationStatus *)self state] == 3
    && ([(PXOperationStatus *)self error],
        v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    id v5 = NSString;
    uint64_t v6 = [(PXOperationStatus *)self error];
    int v7 = [v6 redactedDescription];
    double v8 = [v5 stringWithFormat:@"Failed (%@)", v7];
  }
  else
  {
    double v8 = [(PXOperationStatus *)self description];
  }

  return v8;
}

- (id)description
{
  switch([(PXOperationStatus *)self state])
  {
    case 0:
      v3 = @"?";
      break;
    case 1:
      char v4 = NSString;
      [(PXOperationStatus *)self progress];
      objc_msgSend(v4, "stringWithFormat:", @"%0.1f%%", v5 * 100.0);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v3 = @"Succeeded";
      break;
    case 3:
      uint64_t v6 = NSString;
      int v7 = [(PXOperationStatus *)self error];
      v3 = [v6 stringWithFormat:@"Failed (%@)", v7];

      break;
    case 4:
      v3 = @"Canceled";
      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

- (unint64_t)hash
{
  int64_t v3 = [(PXOperationStatus *)self state];
  int64_t v4 = v3 ^ [(PXOperationStatus *)self isIndeterminate];
  [(PXOperationStatus *)self progress];
  unint64_t v6 = (unint64_t)(v5 * 1000.0);
  int v7 = [(PXOperationStatus *)self error];
  unint64_t v8 = v4 ^ [v7 hash] ^ v6;

  return v8;
}

- (id)operationStatusByMixingOperationStatus:(id)a3 withMixFactor:(double)a4
{
  id v7 = a3;
  if (a4 < 0.0 || a4 > 1.0)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXOperationStatus.m", 40, @"Invalid parameter not satisfying: %@", @"mixFactor >= 0.0 && mixFactor <= 1.0" object file lineNumber description];
  }
  switch([v7 state])
  {
    case 0:
      goto LABEL_13;
    case 1:
      switch([(PXOperationStatus *)self state])
      {
        case 0:
        case 4:
          goto LABEL_15;
        case 1:
          double v9 = [PXOperationStatus alloc];
          [(PXOperationStatus *)self progress];
          double v11 = v10;
          [v7 progress];
          double v13 = v12 * a4 + (1.0 - a4) * v11;
          goto LABEL_11;
        case 2:
          v19 = [PXOperationStatus alloc];
          [v7 progress];
          double v13 = 1.0 - a4 + v20 * a4;
          char v15 = v19;
          goto LABEL_18;
        case 3:
          goto LABEL_13;
        default:
          goto LABEL_16;
      }
    case 2:
      switch([(PXOperationStatus *)self state])
      {
        case 0:
        case 2:
        case 4:
          goto LABEL_15;
        case 1:
          double v9 = [PXOperationStatus alloc];
          [(PXOperationStatus *)self progress];
          double v13 = a4 + (1.0 - a4) * v14;
LABEL_11:
          char v15 = v9;
LABEL_18:
          v17 = [(PXOperationStatus *)v15 initWithState:1 progress:0 error:v13];
          goto LABEL_19;
        case 3:
          goto LABEL_13;
        default:
          goto LABEL_16;
      }
    case 3:
      goto LABEL_15;
    case 4:
      int64_t v16 = [(PXOperationStatus *)self state];
      if ((unint64_t)(v16 - 1) >= 4)
      {
        if (v16)
        {
LABEL_16:
          v18 = 0;
          goto LABEL_20;
        }
LABEL_15:
        v17 = (PXOperationStatus *)v7;
      }
      else
      {
LABEL_13:
        v17 = self;
      }
LABEL_19:
      v18 = v17;
LABEL_20:

      return v18;
    default:
      goto LABEL_16;
  }
}

- (PXOperationStatus)initWithState:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXOperationStatus;
  id v7 = [(PXOperationStatus *)&v12 init];
  unint64_t v8 = v7;
  if (v7)
  {
    v7->_state = a3;
    v7->_progress = 0.5;
    v7->_indeterminate = 1;
    uint64_t v9 = [v6 copy];
    error = v8->_error;
    v8->_error = (NSError *)v9;
  }
  return v8;
}

- (PXOperationStatus)init
{
  return [(PXOperationStatus *)self initWithState:0 progress:0 error:0.0];
}

@end