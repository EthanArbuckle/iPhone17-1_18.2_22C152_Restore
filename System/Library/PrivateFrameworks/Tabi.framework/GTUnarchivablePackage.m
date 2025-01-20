@interface GTUnarchivablePackage
- (GTUnarchivablePackage)initWithIdentifier:(id)a3 fileURL:(id)a4;
- (NSString)identifier;
- (NSURL)fileURL;
@end

@implementation GTUnarchivablePackage

- (GTUnarchivablePackage)initWithIdentifier:(id)a3 fileURL:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  v4 = v16;
  v16 = 0;
  v13.receiver = v4;
  v13.super_class = (Class)GTUnarchivablePackage;
  v12 = [(GTUnarchivablePackage *)&v13 init];
  v16 = v12;
  objc_storeStrong((id *)&v16, v12);
  if (v12)
  {
    uint64_t v5 = [location[0] copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v5;

    uint64_t v7 = [v14 copy];
    fileURL = v16->_fileURL;
    v16->_fileURL = (NSURL *)v7;
  }
  v10 = v16;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
}

@end