@interface SEEndPointCA
+ (BOOL)supportsSecureCoding;
+ (id)decodeWithData:(id)a3 error:(id *)a4;
+ (id)endPointCAWithIdentifier:(id)a3 subjectIdentifier:(id)a4 instanceAID:(id)a5 secureElementAttestation:(id)a6 error:(id *)a7;
- (NSArray)certificates;
- (NSData)instanceAID;
- (NSData)secureElementAttestation;
- (NSString)identifier;
- (NSString)subjectIdentifier;
- (SEEndPointCA)initWithCoder:(id)a3;
- (id)description;
- (id)dumpState;
- (id)encodeWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificates:(id)a3;
@end

@implementation SEEndPointCA

+ (id)endPointCAWithIdentifier:(id)a3 subjectIdentifier:(id)a4 instanceAID:(id)a5 secureElementAttestation:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v12 && v13 && v15 && a7)
  {
    uint64_t v17 = objc_opt_new();
    objc_storeStrong((id *)(v17 + 8), a3);
    objc_storeStrong((id *)(v17 + 24), a4);
    objc_storeStrong((id *)(v17 + 40), a6);
    id v18 = v14;
    v19 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v18;
LABEL_8:

    goto LABEL_10;
  }
  if (a7)
  {
    v19 = SESDefaultLogObject();
    SESCreateAndLogError();
    uint64_t v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v17 = 0;
LABEL_10:

  return (id)v17;
}

- (id)encodeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08928];
  id v6 = a3;
  v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = [(SEEndPointCA *)self identifier];
  v5 = [(SEEndPointCA *)self instanceAID];
  id v6 = [v5 asHexString];
  v7 = [(SEEndPointCA *)self subjectIdentifier];
  v8 = [(SEEndPointCA *)self secureElementAttestation];
  v9 = [v8 asHexString];
  v10 = [(SEEndPointCA *)self certificates];
  v11 = [v3 stringWithFormat:@"Identifier : %@ InstanceAID %@ : {\n\tsubjectIdentifier : %@\n\tsecureElementAttestation : %@\n\tcertificates (%lu) : {\n", v4, v6, v7, v9, objc_msgSend(v10, "count")];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = [(SEEndPointCA *)self certificates];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) asHexString];
        [v11 appendFormat:@"\t\t : %@,\n", v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [v11 appendString:@"\t}\n}"];
  return v11;
}

- (id)dumpState
{
  v3 = objc_opt_new();
  v4 = [(SEEndPointCA *)self identifier];

  if (v4)
  {
    v5 = [(SEEndPointCA *)self identifier];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  id v6 = [(SEEndPointCA *)self subjectIdentifier];

  if (v6)
  {
    v7 = [(SEEndPointCA *)self subjectIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"subjectIdentifier"];
  }
  v8 = [(SEEndPointCA *)self instanceAID];

  if (v8)
  {
    v9 = [(SEEndPointCA *)self instanceAID];
    v10 = [v9 asHexString];
    [v3 setObject:v10 forKeyedSubscript:@"instanceAID"];
  }
  v11 = [(SEEndPointCA *)self certificates];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __25__SEEndPointCA_dumpState__block_invoke;
  v14[3] = &unk_2642196B0;
  id v12 = v3;
  id v15 = v12;
  [v11 enumerateObjectsUsingBlock:v14];

  return v12;
}

void __25__SEEndPointCA_dumpState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 asHexString];
  v5 = *(void **)(a1 + 32);
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"certificate-%u", a3);
  [v5 setObject:v7 forKeyedSubscript:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SEEndPointCA *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(SEEndPointCA *)self subjectIdentifier];
  [v4 encodeObject:v6 forKey:@"subjectIdentifier"];

  id v7 = [(SEEndPointCA *)self secureElementAttestation];
  [v4 encodeObject:v7 forKey:@"secureElementAttestation"];

  v8 = [(SEEndPointCA *)self certificates];
  [v4 encodeObject:v8 forKey:@"certificates"];

  id v9 = [(SEEndPointCA *)self instanceAID];
  [v4 encodeObject:v9 forKey:@"instanceAID"];
}

- (SEEndPointCA)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SEEndPointCA;
  v5 = [(SEEndPointCA *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subjectIdentifier"];
    subjectIdentifier = v5->_subjectIdentifier;
    v5->_subjectIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementAttestation"];
    secureElementAttestation = v5->_secureElementAttestation;
    v5->_secureElementAttestation = (NSData *)v10;

    id v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceAID"];
    instanceAID = v5->_instanceAID;
    v5->_instanceAID = (NSData *)v17;

    if (!v5->_instanceAID)
    {
      long long v19 = SESDefaultLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2146ED000, v19, OS_LOG_TYPE_INFO, "InstanceAID missing in CA, assuming legacy (CCC) AID", buf, 2u);
      }

      uint64_t v20 = [@"A000000809434343444B417631" hexStringAsData];
      long long v21 = v5->_instanceAID;
      v5->_instanceAID = (NSData *)v20;
    }
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)instanceAID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)subjectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCertificates:(id)a3
{
}

- (NSData)secureElementAttestation
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementAttestation, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceAID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end