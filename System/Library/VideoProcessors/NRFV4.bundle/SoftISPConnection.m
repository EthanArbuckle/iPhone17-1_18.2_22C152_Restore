@interface SoftISPConnection
+ (uint64_t)destinationNameIsOutput:(uint64_t)a1;
+ (uint64_t)sourceNameIsInput:(uint64_t)a1;
- (BOOL)destinationIsGraphOutput;
- (BOOL)isNullable;
- (BOOL)sourceIsGraphInput;
- (id)description;
- (id)initFromStage:(id)a3 fromProperty:(id)a4 toStage:(id)a5 toProperty:(id)a6 isNullable:(BOOL)a7;
- (uint64_t)sourcePropertyName;
@end

@implementation SoftISPConnection

- (id)initFromStage:(id)a3 fromProperty:(id)a4 toStage:(id)a5 toProperty:(id)a6 isNullable:(BOOL)a7
{
  v12 = (SoftISPConnection *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  v19 = v12;
  if (v12)
  {
    if (v13 && v14 && v15)
    {
      v21.receiver = self;
      v21.super_class = (Class)SoftISPConnection;
      v17 = [(SoftISPConnection *)&v21 init];
      v12 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_sourceStageName, a3);
        objc_storeStrong((id *)&v12->_sourcePropertyName, a4);
        objc_storeStrong((id *)&v12->_destinationStageName, a5);
        objc_storeStrong((id *)&v12->_destinationPropertyName, a6);
        v12->_isNullable = a7;
      }
      else
      {
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();

      v12 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  return v12;
}

- (BOOL)destinationIsGraphOutput
{
  return [(NSString *)self->_destinationStageName isEqualToString:@"<output>"];
}

+ (uint64_t)sourceNameIsInput:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 isEqualToString:@"<input>"];

  return v3;
}

+ (uint64_t)destinationNameIsOutput:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 isEqualToString:@"<output>"];

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(sourceStageName=%@, sourcePropertyName=%@, destinationStageName=%@, destinationPropertyName=%@)", v5, self->_sourceStageName, self->_sourcePropertyName, self->_destinationStageName, self->_destinationPropertyName];

  return v6;
}

- (BOOL)sourceIsGraphInput
{
  return [(NSString *)self->_sourceStageName isEqualToString:@"<input>"];
}

- (uint64_t)sourcePropertyName
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)isNullable
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPropertyName, 0);
  objc_storeStrong((id *)&self->_destinationStageName, 0);
  objc_storeStrong((id *)&self->_sourcePropertyName, 0);

  objc_storeStrong((id *)&self->_sourceStageName, 0);
}

@end