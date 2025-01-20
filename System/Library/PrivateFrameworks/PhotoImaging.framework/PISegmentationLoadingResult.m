@interface PISegmentationLoadingResult
- (BOOL)success;
- (NSError)error;
- (PISegmentationLoadingResult)initWithObject:(id)a3 success:(BOOL)a4 error:(id)a5;
- (id)object;
@end

@implementation PISegmentationLoadingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_object, 0);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)success
{
  return self->_success;
}

- (id)object
{
  return self->_object;
}

- (PISegmentationLoadingResult)initWithObject:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PISegmentationLoadingResult;
  v11 = [(PISegmentationLoadingResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_object, a3);
    v12->_success = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

@end