@interface PSIReusableObject
- (BOOL)isPreparedFromStatement;
- (PSIReusableObject)init;
- (unint64_t)objectType;
- (void)didPrepareFromStatement:(sqlite3_stmt *)a3;
- (void)prepareForReuse;
- (void)prepareFromStatement:(sqlite3_stmt *)a3;
@end

@implementation PSIReusableObject

- (void)prepareFromStatement:(sqlite3_stmt *)a3
{
  if (!self->_isPreparedForReuse)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v5 handleFailureInMethod:a2 object:self file:@"PSIReusableObject.m" lineNumber:34 description:0];
  }
  if (self->_isPreparedFromStatement)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v6 handleFailureInMethod:a2 object:self file:@"PSIReusableObject.m" lineNumber:35 description:0];
  }
  self->_isPreparedForReuse = 0;
}

- (void)didPrepareFromStatement:(sqlite3_stmt *)a3
{
  if (self->_isPreparingFromStatement)
  {
    if (self->_isPreparedFromStatement)
    {
      v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
      [v5 handleFailureInMethod:a2 object:self file:@"PSIReusableObject.m" lineNumber:41 description:0];
    }
    *(_WORD *)&self->_isPreparingFromStatement = 256;
  }
}

- (PSIReusableObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)PSIReusableObject;
  result = [(PSIReusableObject *)&v3 init];
  if (result) {
    result->_isPreparedForReuse = 1;
  }
  return result;
}

- (BOOL)isPreparedFromStatement
{
  return self->_isPreparedFromStatement;
}

- (unint64_t)objectType
{
  v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)prepareForReuse
{
  *(_WORD *)&self->_isPreparedForReuse = 1;
  self->_isPreparedFromStatement = 0;
}

@end