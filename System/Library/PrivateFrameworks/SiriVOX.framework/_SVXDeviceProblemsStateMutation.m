@interface _SVXDeviceProblemsStateMutation
- (_SVXDeviceProblemsStateMutation)init;
- (_SVXDeviceProblemsStateMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setIsFixingProblems:(BOOL)a3;
- (void)setProblems:(unint64_t)a3;
@end

@implementation _SVXDeviceProblemsStateMutation

- (void).cxx_destruct
{
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
    {
      v4 = (SVXDeviceProblemsState *)[(SVXDeviceProblemsState *)baseModel copy];
      goto LABEL_12;
    }
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      uint64_t isFixingProblems = self->_isFixingProblems;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t isFixingProblems = [(SVXDeviceProblemsState *)baseModel isFixingProblems];
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        unint64_t problems = self->_problems;
LABEL_10:
        v5 = [SVXDeviceProblemsState alloc];
        BOOL v6 = isFixingProblems;
        unint64_t v7 = problems;
        goto LABEL_11;
      }
    }
    unint64_t problems = [(SVXDeviceProblemsState *)self->_baseModel problems];
    goto LABEL_10;
  }
  v5 = [SVXDeviceProblemsState alloc];
  BOOL v6 = self->_isFixingProblems;
  unint64_t v7 = self->_problems;
LABEL_11:
  v4 = [(SVXDeviceProblemsState *)v5 initWithIsFixingProblems:v6 problems:v7];
LABEL_12:

  return v4;
}

- (void)setProblems:(unint64_t)a3
{
  self->_unint64_t problems = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setIsFixingProblems:(BOOL)a3
{
  self->_uint64_t isFixingProblems = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeviceProblemsStateMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceProblemsStateMutation;
  BOOL v6 = [(_SVXDeviceProblemsStateMutation *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeviceProblemsStateMutation)init
{
  return [(_SVXDeviceProblemsStateMutation *)self initWithBaseModel:0];
}

@end