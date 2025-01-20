@interface ISODeviceEngagement
+ (BOOL)supportsSecureCoding;
- (ISODeviceEngagement)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISODeviceEngagement

- (id)description
{
  v3 = sub_10000C008(self->_ephemeralKey);
  v4 = +[NSString stringWithFormat:@"<COSEKey=%@, CipherSuites=%@, Proprietary=%@, DeviceRetrievalMethods=%@>", v3, self->_cipherList, self->_proprietaryElements, self->_deviceRetrievalMethods];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_ephemeralKey forKey:@"ephemeralKey"];
  [v6 encodeObject:self->_cipherList forKey:@"cipherList"];
  proprietaryElements = self->_proprietaryElements;
  if (proprietaryElements)
  {
    v5 = proprietaryElements;
    [v6 encodeObject:v5 forKey:@"proprietaryElements"];
  }
}

- (ISODeviceEngagement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ISODeviceEngagement);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralKey"];
  id v7 = v6;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_ephemeralKey, v6);
    cborObj = v5->_cborObj;
    v5->_cborObj = 0;
  }
  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"cipherList"];
  v12 = v11;
  if (v5)
  {
    id v13 = v11;
    v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v13];

    cipherList = v5->_cipherList;
    v5->_cipherList = v14;

    v16 = v5->_cborObj;
    v5->_cborObj = 0;
  }
  uint64_t v17 = objc_opt_class();
  v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(), 0);
  v19 = [v4 decodeObjectOfClasses:v18 forKey:@"proprietaryElements"];

  id v20 = v19;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_proprietaryElements, v19);
    v21 = v5->_cborObj;
    v5->_cborObj = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cborObj, 0);
  objc_storeStrong((id *)&self->_deviceRetrievalMethods, 0);
  objc_storeStrong((id *)&self->_transferMethodList, 0);
  objc_storeStrong((id *)&self->_proprietaryElements, 0);
  objc_storeStrong((id *)&self->_optionalElements, 0);
  objc_storeStrong((id *)&self->_cipherList, 0);

  objc_storeStrong((id *)&self->_ephemeralKey, 0);
}

@end