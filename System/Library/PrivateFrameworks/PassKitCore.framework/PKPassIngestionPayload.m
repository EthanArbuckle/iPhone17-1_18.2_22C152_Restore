@interface PKPassIngestionPayload
+ (BOOL)supportsSecureCoding;
- (PKPassIngestionPayload)init;
- (PKPassIngestionPayload)initWithCoder:(id)a3;
- (PKPassIngestionPayload)initWithData:(id)a3;
- (PKPassIngestionPayload)initWithFileDescriptor:(int)a3;
- (PKPassIngestionPayload)initWithPass:(id)a3;
- (PKPassIngestionProperties)properties;
- (id)_initWithData:(id)a3 fileDescriptor:(id)a4 pass:(id)a5;
- (id)createPass;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setProperties:(id)a3;
@end

@implementation PKPassIngestionPayload

- (PKPassIngestionPayload)init
{
  return 0;
}

- (PKPassIngestionPayload)initWithData:(id)a3
{
  return (PKPassIngestionPayload *)[(PKPassIngestionPayload *)self _initWithData:a3 fileDescriptor:0 pass:0];
}

- (PKPassIngestionPayload)initWithFileDescriptor:(int)a3
{
  v4 = [[PKFileDescriptorXPCContainer alloc] initWithFileDescriptor:*(void *)&a3];
  v5 = [(PKPassIngestionPayload *)self _initWithData:0 fileDescriptor:v4 pass:0];

  return v5;
}

- (PKPassIngestionPayload)initWithPass:(id)a3
{
  return (PKPassIngestionPayload *)[(PKPassIngestionPayload *)self _initWithData:0 fileDescriptor:0 pass:a3];
}

- (id)_initWithData:(id)a3 fileDescriptor:(id)a4 pass:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPassIngestionPayload;
  v12 = [(PKPassIngestionPayload *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (void)dealloc
{
  [(PKPassIngestionPayload *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPassIngestionPayload;
  [(PKPassIngestionPayload *)&v3 dealloc];
}

- (id)createPass
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  data = self->_data;
  if (!data)
  {
    fd = self->_fd;
    if (!fd)
    {
      pass = self->_pass;
      if (pass)
      {
        v2 = pass;
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    *(void *)buf = 0;
    v16 = buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__62;
    v19 = __Block_byref_object_dispose__62;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__PKPassIngestionPayload_createPass__block_invoke;
    v14[3] = &unk_1E56F08A8;
    v14[4] = buf;
    [(PKFileDescriptorXPCContainer *)fd accessFileDescriptorWithBlock:v14];
    uint64_t v7 = *((void *)v16 + 5);
    if (v7)
    {
      id v13 = 0;
      v2 = +[PKObject createWithFileDataAccessor:v7 validationOptions:14 warnings:0 error:&v13];
      id v8 = v13;
      if (v8)
      {
        id v9 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v22 = 138412290;
          id v23 = v8;
          _os_log_error_impl(&dword_190E10000, v9, OS_LOG_TYPE_ERROR, "Failed to create pass due to validation error: %@", v22, 0xCu);
        }

        goto LABEL_12;
      }
      if (!v2)
      {
LABEL_12:

        char v10 = 1;
        goto LABEL_18;
      }
      char v10 = 0;
    }
    else
    {
      char v10 = 1;
    }
LABEL_18:
    _Block_object_dispose(buf, 8);

    if ((v10 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v21 = 0;
  v2 = +[PKObject createWithData:data warnings:0 error:&v21];
  if (v2) {
    goto LABEL_20;
  }
  v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "Cannot add pass: pass cannot be instantiated from data.", buf, 2u);
  }

LABEL_19:
  v2 = 0;
LABEL_20:
  return v2;
}

void __36__PKPassIngestionPayload_createPass__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = [[PKSerializedDataAccessor alloc] initWithFileDescriptor:a2 error:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)invalidate
{
  [(PKFileDescriptorXPCContainer *)self->_fd invalidate];
  fd = self->_fd;
  self->_fd = 0;

  data = self->_data;
  self->_data = 0;

  pass = self->_pass;
  self->_pass = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassIngestionPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassIngestionPayload;
  v5 = [(PKPassIngestionPayload *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fd"];
    fd = v5->_fd;
    v5->_fd = (PKFileDescriptorXPCContainer *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (PKPassIngestionProperties *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 encodeObject:self->_fd forKey:@"fd"];
  if (self->_pass) {
    BOOL v5 = self->_data == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x192FDC630](v4);
    uint64_t v7 = [(PKObject *)self->_pass archiveData];
    [v8 encodeObject:v7 forKey:@"data"];
  }
  else
  {
    objc_msgSend(v8, "encodeObject:forKey:");
  }
  [v8 encodeObject:self->_properties forKey:@"properties"];
}

- (PKPassIngestionProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_fd, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end