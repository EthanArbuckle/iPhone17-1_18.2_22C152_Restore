@interface FCANFDocumentManifest
+ (BOOL)supportsSecureCoding;
- (FCANFDocumentManifest)initWithCoder:(id)a3;
- (FCANFDocumentManifest)initWithNonImageResourceIDs:(id)a3 optimalImageResourceIDs:(id)a4 smallestImageResourceIDs:(id)a5;
- (NSArray)nonImageResourceIDs;
- (NSArray)optimalImageResourceIDs;
- (NSArray)smallestImageResourceIDs;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCANFDocumentManifest

- (FCANFDocumentManifest)initWithNonImageResourceIDs:(id)a3 optimalImageResourceIDs:(id)a4 smallestImageResourceIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCANFDocumentManifest;
  v11 = [(FCANFDocumentManifest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    nonImageResourceIDs = v11->_nonImageResourceIDs;
    v11->_nonImageResourceIDs = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    optimalImageResourceIDs = v11->_optimalImageResourceIDs;
    v11->_optimalImageResourceIDs = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    smallestImageResourceIDs = v11->_smallestImageResourceIDs;
    v11->_smallestImageResourceIDs = (NSArray *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  v4 = NSNumber;
  v5 = [(FCANFDocumentManifest *)self nonImageResourceIDs];
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [(FCDescription *)v3 addField:@"nonImageResourceIDs" object:v6];

  v7 = NSNumber;
  id v8 = [(FCANFDocumentManifest *)self optimalImageResourceIDs];
  id v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  [(FCDescription *)v3 addField:@"optimalImageResourceIDs" object:v9];

  id v10 = NSNumber;
  v11 = [(FCANFDocumentManifest *)self smallestImageResourceIDs];
  uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  [(FCDescription *)v3 addField:@"smallestImageResourceIDs" object:v12];

  v13 = [(FCDescription *)v3 descriptionString];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCANFDocumentManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"nonImageResourceIDs"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"optimalImageResourceIDs"];
  v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"smallestImageResourceIDs"];

  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11 = [(FCANFDocumentManifest *)self initWithNonImageResourceIDs:v8 optimalImageResourceIDs:v9 smallestImageResourceIDs:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FCANFDocumentManifest *)self nonImageResourceIDs];
  [v4 encodeObject:v5 forKey:@"nonImageResourceIDs"];

  v6 = [(FCANFDocumentManifest *)self optimalImageResourceIDs];
  [v4 encodeObject:v6 forKey:@"optimalImageResourceIDs"];

  id v7 = [(FCANFDocumentManifest *)self smallestImageResourceIDs];
  [v4 encodeObject:v7 forKey:@"smallestImageResourceIDs"];
}

- (NSArray)nonImageResourceIDs
{
  return self->_nonImageResourceIDs;
}

- (NSArray)optimalImageResourceIDs
{
  return self->_optimalImageResourceIDs;
}

- (NSArray)smallestImageResourceIDs
{
  return self->_smallestImageResourceIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallestImageResourceIDs, 0);
  objc_storeStrong((id *)&self->_optimalImageResourceIDs, 0);
  objc_storeStrong((id *)&self->_nonImageResourceIDs, 0);
}

@end