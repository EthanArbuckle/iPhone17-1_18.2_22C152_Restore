@interface KTBAAKey
- (BOOL)validBAAKey;
- (KTBAAKey)initWithKey:(__SecKey *)a3 certificates:(id)a4 failure:(id)a5;
- (NSArray)certificates;
- (NSError)error;
- (__SecKey)referenceKey;
- (void)dealloc;
- (void)setCertificates:(id)a3;
- (void)setError:(id)a3;
- (void)setReferenceKey:(__SecKey *)a3;
@end

@implementation KTBAAKey

- (KTBAAKey)initWithKey:(__SecKey *)a3 certificates:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)KTBAAKey;
  v10 = [(KTBAAKey *)&v13 init];
  if (v10)
  {
    if (a3) {
      CFRetain(a3);
    }
    [(KTBAAKey *)v10 setReferenceKey:a3];
    [(KTBAAKey *)v10 setCertificates:v8];
    [(KTBAAKey *)v10 setError:v9];
    v11 = v10;
  }

  return v10;
}

- (BOOL)validBAAKey
{
  if (![(KTBAAKey *)self referenceKey]) {
    return 0;
  }
  v3 = [(KTBAAKey *)self certificates];
  if (v3)
  {
    v4 = [(KTBAAKey *)self error];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(KTBAAKey *)self referenceKey];
  if (v3) {
    CFRelease(v3);
  }
  [(KTBAAKey *)self setReferenceKey:0];
  v4.receiver = self;
  v4.super_class = (Class)KTBAAKey;
  [(KTBAAKey *)&v4 dealloc];
}

- (__SecKey)referenceKey
{
  return self->_referenceKey;
}

- (void)setReferenceKey:(__SecKey *)a3
{
  self->_referenceKey = a3;
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCertificates:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_certificates, 0);
}

@end