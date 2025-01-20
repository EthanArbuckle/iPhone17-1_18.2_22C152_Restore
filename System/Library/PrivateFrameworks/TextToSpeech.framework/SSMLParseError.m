@interface SSMLParseError
+ (SSMLParseError)errorWith:(id)a3 hint:(id)a4 errorLocation:(id)a5;
- (NSString)error;
- (NSString)hint;
- (NSString)location;
- (void)setError:(id)a3;
- (void)setHint:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SSMLParseError

+ (SSMLParseError)errorWith:(id)a3 hint:(id)a4 errorLocation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(SSMLParseError);
  objc_msgSend_setError_(v10, v11, (uint64_t)v9, v12, v13);

  objc_msgSend_setHint_(v10, v14, (uint64_t)v8, v15, v16);
  objc_msgSend_setLocation_(v10, v17, (uint64_t)v7, v18, v19);

  return v10;
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hint, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end