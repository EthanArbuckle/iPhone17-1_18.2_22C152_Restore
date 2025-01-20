@interface NDTResultsFIFO
- (BOOL)finished;
- (BOOL)push:(id)a3;
- (BOOL)terminated;
- (NDTResultsFIFO)init;
- (NDTResultsFIFO)initWithFIFOLength:(int64_t)a3 name:(id)a4;
- (NSCondition)condition;
- (NSError)error;
- (NSMutableArray)fifo;
- (NSString)name;
- (id)description;
- (id)pop;
- (int64_t)length;
- (void)conditionalPop:(id)a3;
- (void)finish;
- (void)setCondition:(id)a3;
- (void)setError:(id)a3;
- (void)setFifo:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setLength:(int64_t)a3;
- (void)setTerminated:(BOOL)a3;
- (void)terminate;
- (void)terminateIfNotFinished;
@end

@implementation NDTResultsFIFO

- (NDTResultsFIFO)init
{
  return [(NDTResultsFIFO *)self initWithFIFOLength:8 name:0];
}

- (NDTResultsFIFO)initWithFIFOLength:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NDTResultsFIFO;
  v7 = [(NDTResultsFIFO *)&v15 init];
  if (v7)
  {
    v8 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
    fifo = v7->_fifo;
    v7->_fifo = v8;

    v7->_length = a3;
    v10 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    condition = v7->_condition;
    v7->_condition = v10;

    v7->_terminated = 0;
    if (v6)
    {
      v12 = (NSString *)[v6 copy];
      name = v7->_name;
      v7->_name = v12;
    }
  }

  return v7;
}

- (BOOL)push:(id)a3
{
  id v4 = a3;
  v5 = [(NDTResultsFIFO *)self condition];
  [v5 lock];
  while (1)
  {

    id v6 = [(NDTResultsFIFO *)self fifo];
    id v7 = [v6 count];
    if (v7 < (id)[(NDTResultsFIFO *)self length] || [(NDTResultsFIFO *)self terminated]) {
      break;
    }
    unsigned __int8 v8 = [(NDTResultsFIFO *)self finished];

    if (v8) {
      goto LABEL_7;
    }
    v5 = [(NDTResultsFIFO *)self condition];
    [v5 wait];
  }

LABEL_7:
  if ([(NDTResultsFIFO *)self terminated])
  {
    [(NDTResultsFIFO *)self setFifo:0];
  }
  else if (![(NDTResultsFIFO *)self finished])
  {
    v10 = [(NDTResultsFIFO *)self fifo];
    [v10 addObject:v4];

    BOOL v9 = 1;
    goto LABEL_12;
  }
  BOOL v9 = 0;
LABEL_12:
  v11 = [(NDTResultsFIFO *)self condition];
  [v11 broadcast];

  v12 = [(NDTResultsFIFO *)self condition];
  [v12 unlock];

  return v9;
}

- (void)finish
{
  v3 = [(NDTResultsFIFO *)self condition];
  [v3 lock];

  [(NDTResultsFIFO *)self setFinished:1];
  id v4 = [(NDTResultsFIFO *)self condition];
  [v4 broadcast];

  id v5 = [(NDTResultsFIFO *)self condition];
  [v5 unlock];
}

- (void)conditionalPop:(id)a3
{
  v14 = (void (**)(id, void))a3;
  id v4 = [(NDTResultsFIFO *)self condition];
  [v4 lock];
  while (1)
  {

    id v5 = [(NDTResultsFIFO *)self fifo];
    if ([v5 count] || -[NDTResultsFIFO terminated](self, "terminated")) {
      break;
    }
    unsigned __int8 v6 = [(NDTResultsFIFO *)self finished];

    if (v6) {
      goto LABEL_7;
    }
    id v4 = [(NDTResultsFIFO *)self condition];
    [v4 wait];
  }

LABEL_7:
  if ([(NDTResultsFIFO *)self terminated])
  {
    [(NDTResultsFIFO *)self setFifo:0];
LABEL_13:
    v14[2](v14, 0);
    goto LABEL_14;
  }
  id v7 = [(NDTResultsFIFO *)self fifo];
  id v8 = [v7 count];

  if (!v8) {
    goto LABEL_13;
  }
  BOOL v9 = [(NDTResultsFIFO *)self fifo];
  v10 = [v9 objectAtIndex:0];

  if (((unsigned int (*)(id, void *))v14[2])(v14, v10))
  {
    v11 = [(NDTResultsFIFO *)self fifo];
    [v11 removeObjectAtIndex:0];
  }
LABEL_14:
  v12 = [(NDTResultsFIFO *)self condition];
  [v12 broadcast];

  v13 = [(NDTResultsFIFO *)self condition];
  [v13 unlock];
}

- (id)pop
{
  uint64_t v5 = 0;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10003D774;
  BOOL v9 = sub_10003D784;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D78C;
  v4[3] = &unk_1000A9950;
  v4[4] = &v5;
  [(NDTResultsFIFO *)self conditionalPop:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)terminate
{
  v3 = [(NDTResultsFIFO *)self condition];
  [v3 lock];

  [(NDTResultsFIFO *)self setTerminated:1];
  [(NDTResultsFIFO *)self setFinished:1];
  id v4 = [(NDTResultsFIFO *)self condition];
  [v4 broadcast];

  id v5 = [(NDTResultsFIFO *)self condition];
  [v5 unlock];
}

- (void)terminateIfNotFinished
{
  v3 = [(NDTResultsFIFO *)self condition];
  [v3 lock];

  if (![(NDTResultsFIFO *)self finished])
  {
    [(NDTResultsFIFO *)self setTerminated:1];
    [(NDTResultsFIFO *)self setFinished:1];
  }
  id v4 = [(NDTResultsFIFO *)self condition];
  [v4 broadcast];

  id v5 = [(NDTResultsFIFO *)self condition];
  [v5 unlock];
}

- (id)description
{
  v3 = [(NDTResultsFIFO *)self condition];
  [v3 lock];

  id v4 = [(NDTResultsFIFO *)self fifo];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<NDTResultsFIFO:%p cap:%d/%d term:%d fin:%d>", self, [v4 count], -[NDTResultsFIFO length](self, "length"), -[NDTResultsFIFO terminated](self, "terminated"), -[NDTResultsFIFO finished](self, "finished"));

  unsigned __int8 v6 = [(NDTResultsFIFO *)self condition];
  [v6 unlock];

  return v5;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (NSMutableArray)fifo
{
  return self->_fifo;
}

- (void)setFifo:(id)a3
{
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fifo, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end