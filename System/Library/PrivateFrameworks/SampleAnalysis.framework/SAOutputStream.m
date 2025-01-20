@interface SAOutputStream
- (int)appendData:(id)a3;
- (int)appendString:(id)a3;
- (int)printWithFormat:(id)a3;
@end

@implementation SAOutputStream

- (int)printWithFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  LODWORD(self) = [(SAOutputStream *)self appendString:v6];
  return (int)self;
}

- (int)appendString:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 lengthOfBytesUsingEncoding:4];
  if (v5)
  {
    size_t v6 = v5;
    v7 = malloc_type_malloc(v5, 0xA9CE6BE9uLL);
    if ([v4 getCString:v7 maxLength:v6 encoding:4])
    {
      int v8 = [(SAOutputStream *)self write:v7 maxLength:v6];
    }
    else
    {
      v9 = (void *)MEMORY[0x1C18A6A20]();
      v10 = [v4 dataUsingEncoding:4 allowLossyConversion:1];
      if (v10) {
        int v8 = [(SAOutputStream *)self appendData:v10];
      }
      else {
        int v8 = 0;
      }
    }
    free(v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)appendData:(id)a3
{
  id v3 = a3;
  int v4 = *__error();
  size_t v5 = _sa_logt();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "Called appendData: on the superclass. Subclasses implement this.", v7, 2u);
  }

  *__error() = v4;
  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"SAOutputStream implementation error" reason:@"subclass must implement appendData" userInfo:0];
  objc_exception_throw(v6);
}

@end