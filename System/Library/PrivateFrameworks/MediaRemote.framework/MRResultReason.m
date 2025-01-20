@interface MRResultReason
- (BOOL)result;
- (MRResultReason)initWithResult:(BOOL)a3 format:(id)a4;
- (MRResultReason)initWithResult:(BOOL)a3 reason:(id)a4;
- (NSString)reason;
@end

@implementation MRResultReason

- (MRResultReason)initWithResult:(BOOL)a3 reason:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRResultReason;
  v8 = [(MRResultReason *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_reason, a4);
  }

  return v9;
}

- (MRResultReason)initWithResult:(BOOL)a3 format:(id)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    v6 = (objc_class *)NSString;
    id v7 = a4;
    v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v11];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(MRResultReason *)self initWithResult:v4 reason:v8];

  return v9;
}

- (BOOL)result
{
  return self->_result;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end