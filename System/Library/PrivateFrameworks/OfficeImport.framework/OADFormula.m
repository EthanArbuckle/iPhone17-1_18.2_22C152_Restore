@interface OADFormula
- (OADFormula)initWithType:(int)a3 arg0:(OADFormulaArg)a4 arg1:(OADFormulaArg)a5 arg2:(OADFormulaArg)a6;
- (OADFormulaArg)argAtIndex:(unsigned int)a3;
- (id)description;
- (id)name;
- (int)type;
- (void)setName:(id)a3;
@end

@implementation OADFormula

- (OADFormula)initWithType:(int)a3 arg0:(OADFormulaArg)a4 arg1:(OADFormulaArg)a5 arg2:(OADFormulaArg)a6
{
  v11.receiver = self;
  v11.super_class = (Class)OADFormula;
  result = [(OADFormula *)&v11 init];
  if (result)
  {
    result->mType = a3;
    result->mArgs[0] = a4;
    result->mArgs[1] = a5;
    result->mArgs[2] = a6;
  }
  return result;
}

- (OADFormulaArg)argAtIndex:(unsigned int)a3
{
  return self->mArgs[a3];
}

- (int)type
{
  return self->mType;
}

- (void)setName:(id)a3
{
}

- (id)name
{
  return self->mName;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADFormula;
  v2 = [(OADFormula *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end