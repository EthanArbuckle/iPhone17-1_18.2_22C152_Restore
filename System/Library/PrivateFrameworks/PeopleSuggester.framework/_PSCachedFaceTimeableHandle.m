@interface _PSCachedFaceTimeableHandle
- (NSDate)expirationDate;
- (NSString)handle;
- (_PSCachedFaceTimeableHandle)initWithExpirationDate:(id)a3 handle:(id)a4;
@end

@implementation _PSCachedFaceTimeableHandle

- (_PSCachedFaceTimeableHandle)initWithExpirationDate:(id)a3 handle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSCachedFaceTimeableHandle;
  v9 = [(_PSCachedFaceTimeableHandle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expirationDate, a3);
    objc_storeStrong((id *)&v10->_handle, a4);
  }

  return v10;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end