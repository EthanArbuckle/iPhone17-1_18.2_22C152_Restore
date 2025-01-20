@interface MOClientRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MOClientRequest)initWithClientRequestMO:(id)a3;
- (MOClientRequest)initWithCoder:(id)a3;
- (MOClientRequest)initWithRequestIdentifier:(id)a3 requestType:(unint64_t)a4 creationDate:(id)a5;
- (NSDate)creationDate;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestType:(unint64_t)a3;
@end

@implementation MOClientRequest

- (MOClientRequest)initWithRequestIdentifier:(id)a3 requestType:(unint64_t)a4 creationDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MOClientRequest;
  v11 = [(MOClientRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestIdentifier, a3);
    v12->_requestType = a4;
    objc_storeStrong((id *)&v12->_creationDate, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestIdentifier = self->_requestIdentifier;
  id v5 = a3;
  [v5 encodeObject:requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeInteger:self->_requestType forKey:@"requestType"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
}

- (MOClientRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOClientRequest;
  id v5 = [(MOClientRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v6;

    v5->_requestType = (unint64_t)[v4 decodeIntegerForKey:@"requestType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOClientRequest);
  objc_storeStrong((id *)&v4->_requestIdentifier, self->_requestIdentifier);
  objc_storeStrong((id *)&v4->_creationDate, self->_creationDate);
  v4->_requestType = self->_requestType;
  return v4;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"request id, %@, request type, %lu, creation date, %@", self->_requestIdentifier, self->_requestType, self->_creationDate];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOClientRequest *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    BOOL v12 = 1;
    goto LABEL_24;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v12 = 0;
    goto LABEL_24;
  }
  v7 = v6;
  uint64_t v8 = [(MOClientRequest *)self requestIdentifier];
  if (!v8)
  {
    v3 = [(MOClientRequest *)v7 requestIdentifier];
    if (!v3)
    {
      unsigned int v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  id v9 = [(MOClientRequest *)self requestIdentifier];
  id v10 = [(MOClientRequest *)v7 requestIdentifier];
  unsigned int v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:

  v13 = [(MOClientRequest *)self creationDate];
  if (!v13)
  {
    v3 = [(MOClientRequest *)v7 creationDate];
    if (!v3)
    {
      unsigned __int8 v16 = 1;
LABEL_17:

      goto LABEL_18;
    }
  }
  objc_super v14 = [(MOClientRequest *)self creationDate];
  v15 = [(MOClientRequest *)v7 creationDate];
  unsigned __int8 v16 = [v14 isEqual:v15];

  if (!v13) {
    goto LABEL_17;
  }
LABEL_18:

  unint64_t v17 = [(MOClientRequest *)self requestType];
  id v18 = [(MOClientRequest *)v7 requestType];
  if (v11)
  {
    if ((id)v17 == v18) {
      BOOL v12 = v16;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

LABEL_24:
  return v12;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (MOClientRequest)initWithClientRequestMO:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 requestIdentifier];
    id v6 = [v4 requestType];
    v7 = [v4 creationDate];

    self = [(MOClientRequest *)self initWithRequestIdentifier:v5 requestType:v6 creationDate:v7];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end