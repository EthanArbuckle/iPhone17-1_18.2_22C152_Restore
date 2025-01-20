@interface HAPFragmentationPacket
- (BOOL)isEqual:(id)a3;
- (HAPFragmentationPacket)init;
- (HAPFragmentationPacket)initWithData:(id)a3 transactionIdentifier:(unsigned __int16)a4 length:(unsigned int)a5 offset:(unsigned int)a6;
- (HAPFragmentationPacket)initWithFragmentedPacketData:(id)a3;
- (NSData)data;
- (id)debugDescription;
- (id)description;
- (id)serialize;
- (id)shortDescription;
- (unint64_t)hash;
- (unsigned)length;
- (unsigned)offset;
- (unsigned)transactionIdentifier;
@end

@implementation HAPFragmentationPacket

- (HAPFragmentationPacket)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPFragmentationPacket)initWithFragmentedPacketData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v7;
      v8 = "%{public}@[HAPFragmentationPacket] Invalid paramter 'data'";
      v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)[v4 length] <= 0xB)
  {
    v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v7;
      __int16 v28 = 2048;
      uint64_t v29 = 12;
      v8 = "%{public}@[HAPFragmentationPacket] Fragmented data must have a length of at least %lu bytes";
      v9 = v6;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v12 = v5;
  memset(v25, 0, 12);
  id v13 = [v12 length];
  if ((unint64_t)v13 <= 0xB)
  {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid serialized data length %tu", [v12 length]);
    v19 = sub_100083F74();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v20;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPFragmentationPacket] %@", buf, 0x16u);
    }
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    *(void *)buf = v18;
    v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v26 count:1];
    id v14 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6743 userInfo:v21];

    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    [v12 getBytes:v25 length:12];
    id v14 = 0;
    uint64_t v15 = LOWORD(v25[0]);
    uint64_t v16 = *(unsigned int *)((char *)v25 + 2);
    uint64_t v17 = *(unsigned int *)((char *)v25 + 6);
  }

  v6 = v14;
  if ((unint64_t)v13 <= 0xB)
  {
    v22 = sub_100083F74();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v23;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationPacket] Failed to deserialize packet header with erorr: %@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    v22 = [v12 subdataWithRange:12, [v12 length] - 12];
    self = [(HAPFragmentationPacket *)self initWithData:v22 transactionIdentifier:v15 length:v16 offset:v17];
    v11 = self;
  }

LABEL_20:
  return v11;
}

- (HAPFragmentationPacket)initWithData:(id)a3 transactionIdentifier:(unsigned __int16)a4 length:(unsigned int)a5 offset:(unsigned int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPFragmentationPacket;
  id v12 = [(HAPFragmentationPacket *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v13->_transactionIdentifier = a4;
    v13->_length = a5;
    v13->_offset = a6;
  }

  return v13;
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:@"%@", objc_opt_class()];
}

- (id)debugDescription
{
  v3 = [(HAPFragmentationPacket *)self shortDescription];
  unsigned int v4 = [(HAPFragmentationPacket *)self transactionIdentifier];
  uint64_t v5 = [(HAPFragmentationPacket *)self length];
  uint64_t v6 = [(HAPFragmentationPacket *)self offset];
  v7 = [(HAPFragmentationPacket *)self data];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>", v3, self, v4, v5, v6, [v7 length]);

  return v8;
}

- (id)description
{
  v3 = [(HAPFragmentationPacket *)self shortDescription];
  unsigned int v4 = [(HAPFragmentationPacket *)self transactionIdentifier];
  uint64_t v5 = [(HAPFragmentationPacket *)self length];
  uint64_t v6 = [(HAPFragmentationPacket *)self offset];
  v7 = [(HAPFragmentationPacket *)self data];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>", v3, v4, v5, v6, [v7 length]);

  return v8;
}

- (unint64_t)hash
{
  unsigned int v3 = [(HAPFragmentationPacket *)self transactionIdentifier];
  return [(HAPFragmentationPacket *)self offset] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (HAPFragmentationPacket *)a3;
  BOOL v7 = 1;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (unsigned int v5 = [(HAPFragmentationPacket *)self transactionIdentifier],
          v5 != [(HAPFragmentationPacket *)v4 transactionIdentifier])
      || (unsigned int v6 = [(HAPFragmentationPacket *)self offset], v6 != [(HAPFragmentationPacket *)v4 offset]))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)serialize
{
  LOWORD(v8) = [(HAPFragmentationPacket *)self transactionIdentifier];
  *(_DWORD *)((char *)&v8 + 2) = [(HAPFragmentationPacket *)self length];
  *(_DWORD *)((char *)&v8 + 6) = [(HAPFragmentationPacket *)self offset];
  uint64_t v9 = v8;
  int v10 = WORD4(v8);
  unsigned int v3 = +[NSData dataWithBytes:&v9 length:12];
  unsigned int v4 = [(HAPFragmentationPacket *)self data];
  unsigned int v5 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v4 length] + 12);

  [v5 appendData:v3];
  unsigned int v6 = [(HAPFragmentationPacket *)self data];
  [v5 appendData:v6];

  return v5;
}

- (unsigned)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unsigned)length
{
  return self->_length;
}

- (unsigned)offset
{
  return self->_offset;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end