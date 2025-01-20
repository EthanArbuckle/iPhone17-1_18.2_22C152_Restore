@interface DataStreamFragmentChunk
- (BOOL)isEqual:(id)a3;
- (BOOL)isLast;
- (DataStreamFragmentChunk)initWithData:(id)a3 sequenceNumber:(id)a4 fragmentSequenceNumber:(id)a5 type:(id)a6 isLast:(BOOL)a7;
- (DataStreamFragmentChunk)initWithDictionaryRepresentation:(id)a3;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)fragmentSequenceNumber;
- (NSNumber)sequenceNumber;
- (NSString)type;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation DataStreamFragmentChunk

- (DataStreamFragmentChunk)initWithData:(id)a3 sequenceNumber:(id)a4 fragmentSequenceNumber:(id)a5 type:(id)a6 isLast:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v14)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_11:
    v27 = (DataStreamFragmentChunk *)_HMFPreconditionFailure();
    return [(DataStreamFragmentChunk *)v27 initWithDictionaryRepresentation:v29];
  }
  v30.receiver = self;
  v30.super_class = (Class)DataStreamFragmentChunk;
  v18 = [(DataStreamFragmentChunk *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    v20 = (NSNumber *)[v14 copy];
    sequenceNumber = v19->_sequenceNumber;
    v19->_sequenceNumber = v20;

    v22 = (NSNumber *)[v15 copy];
    fragmentSequenceNumber = v19->_fragmentSequenceNumber;
    v19->_fragmentSequenceNumber = v22;

    v24 = (NSString *)[v17 copy];
    type = v19->_type;
    v19->_type = v24;

    v19->_last = a7;
  }

  return v19;
}

- (DataStreamFragmentChunk)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 hmf_dataForKey:@"data"];
  if (v5)
  {
    [v4 hmf_dictionaryForKey:@"metadata"];
    v6 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = [(DataStreamFragmentChunk *)v6 hmf_numberForKey:@"dataChunkSequenceNumber"];
      if (v8)
      {
        v9 = [(DataStreamFragmentChunk *)v7 hmf_numberForKey:@"dataSequenceNumber"];
        if (v9)
        {
          v10 = [(DataStreamFragmentChunk *)v7 hmf_stringForKey:@"dataType"];
          if (v10)
          {
            v11 = [(DataStreamFragmentChunk *)v7 hmf_numberForKey:@"isLastDataChunk"];
            v12 = v11;
            if (v11)
            {
              id v13 = [(DataStreamFragmentChunk *)self initWithData:v5 sequenceNumber:v8 fragmentSequenceNumber:v9 type:v10 isLast:[(DataStreamFragmentChunk *)v11 BOOLValue]];
              id v14 = v13;
            }
            else
            {
              id v13 = self;
              v21 = sub_100083F74();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v23 = sub_100083FD0(v13);
                *(_DWORD *)buf = 138543874;
                v25 = v23;
                __int16 v26 = 2112;
                CFStringRef v27 = @"isLastDataChunk";
                __int16 v28 = 2112;
                id v29 = v4;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not determine isLast (key=%@) from stream data dictionary: %@", buf, 0x20u);
              }
              id v14 = 0;
            }
          }
          else
          {
            v12 = self;
            v19 = sub_100083F74();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = sub_100083FD0(v12);
              *(_DWORD *)buf = 138543874;
              v25 = v20;
              __int16 v26 = 2112;
              CFStringRef v27 = @"dataType";
              __int16 v28 = 2112;
              id v29 = v4;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not determine type (key=%@) from stream data dictionary: %@", buf, 0x20u);
            }
            id v14 = 0;
            id v13 = v12;
          }
        }
        else
        {
          v10 = self;
          sub_100083F74();
          v12 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
          {
            v18 = sub_100083FD0(v10);
            *(_DWORD *)buf = 138543874;
            v25 = v18;
            __int16 v26 = 2112;
            CFStringRef v27 = @"dataSequenceNumber";
            __int16 v28 = 2112;
            id v29 = v4;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "%{public}@Could not determine fragment sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);
          }
          id v14 = 0;
          id v13 = v10;
        }
      }
      else
      {
        v9 = self;
        sub_100083F74();
        v10 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
        {
          v17 = sub_100083FD0(v9);
          *(_DWORD *)buf = 138543874;
          v25 = v17;
          __int16 v26 = 2112;
          CFStringRef v27 = @"dataChunkSequenceNumber";
          __int16 v28 = 2112;
          id v29 = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "%{public}@Could not determine sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);
        }
        id v14 = 0;
        id v13 = v9;
      }
    }
    else
    {
      v8 = self;
      sub_100083F74();
      v9 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        id v16 = sub_100083FD0(v8);
        *(_DWORD *)buf = 138543874;
        v25 = v16;
        __int16 v26 = 2112;
        CFStringRef v27 = @"metadata";
        __int16 v28 = 2112;
        id v29 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%{public}@Could not determine metadata (key=%@) from stream data dictionary: %@", buf, 0x20u);
      }
      id v14 = 0;
      id v13 = v8;
    }
  }
  else
  {
    v7 = self;
    sub_100083F74();
    v8 = (DataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      id v15 = sub_100083FD0(v7);
      *(_DWORD *)buf = 138543874;
      v25 = v15;
      __int16 v26 = 2112;
      CFStringRef v27 = @"data";
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_ERROR, "%{public}@Could not determine data (key=%@) from stream data dictionary: %@", buf, 0x20u);
    }
    id v14 = 0;
    id v13 = v7;
  }

  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  v13[0] = @"metadata";
  v11[0] = @"dataChunkSequenceNumber";
  v3 = [(DataStreamFragmentChunk *)self sequenceNumber];
  v12[0] = v3;
  v11[1] = @"dataSequenceNumber";
  id v4 = [(DataStreamFragmentChunk *)self fragmentSequenceNumber];
  v12[1] = v4;
  v11[2] = @"dataType";
  v5 = [(DataStreamFragmentChunk *)self type];
  v12[2] = v5;
  v11[3] = @"isLastDataChunk";
  v6 = +[NSNumber numberWithBool:[(DataStreamFragmentChunk *)self isLast]];
  v12[3] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v13[1] = @"data";
  v14[0] = v7;
  v8 = [(DataStreamFragmentChunk *)self data];
  v14[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return (NSDictionary *)v9;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v20 = [(DataStreamFragmentChunk *)self data];
  v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 length]);
  id v4 = [v3 initWithName:@"Data Length" value:v19];
  v21[0] = v4;
  id v5 = objc_alloc((Class)HMFAttributeDescription);
  v6 = [(DataStreamFragmentChunk *)self sequenceNumber];
  id v7 = [v5 initWithName:@"Sequence Number" value:v6];
  v21[1] = v7;
  id v8 = objc_alloc((Class)HMFAttributeDescription);
  v9 = [(DataStreamFragmentChunk *)self fragmentSequenceNumber];
  id v10 = [v8 initWithName:@"Fragment Sequence Number" value:v9];
  v21[2] = v10;
  id v11 = objc_alloc((Class)HMFAttributeDescription);
  v12 = [(DataStreamFragmentChunk *)self type];
  id v13 = [v11 initWithName:@"Type" value:v12];
  v21[3] = v13;
  id v14 = objc_alloc((Class)HMFAttributeDescription);
  [(DataStreamFragmentChunk *)self isLast];
  id v15 = HMFBooleanToString();
  id v16 = [v14 initWithName:@"Is Last" value:v15];
  v21[4] = v16;
  v17 = +[NSArray arrayWithObjects:v21 count:5];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 data];
    v9 = [(DataStreamFragmentChunk *)self data];
    if ([v8 isEqualToData:v9])
    {
      id v10 = [v7 sequenceNumber];
      id v11 = [(DataStreamFragmentChunk *)self sequenceNumber];
      if ([v10 isEqualToNumber:v11])
      {
        v12 = [v7 fragmentSequenceNumber];
        id v13 = [(DataStreamFragmentChunk *)self fragmentSequenceNumber];
        if ([v12 isEqualToNumber:v13])
        {
          uint64_t v14 = [v7 type];
          uint64_t v15 = [(DataStreamFragmentChunk *)self type];
          v21 = (void *)v14;
          id v16 = (void *)v14;
          v17 = (void *)v15;
          if ([v16 isEqualToString:v15])
          {
            unsigned int v20 = [v7 isLast];
            unsigned int v18 = v20 ^ [(DataStreamFragmentChunk *)self isLast] ^ 1;
          }
          else
          {
            LOBYTE(v18) = 0;
          }
        }
        else
        {
          LOBYTE(v18) = 0;
        }
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(DataStreamFragmentChunk *)self data];
  unint64_t v4 = (unint64_t)[v3 hash];

  id v5 = [(DataStreamFragmentChunk *)self sequenceNumber];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  id v7 = [(DataStreamFragmentChunk *)self fragmentSequenceNumber];
  unint64_t v8 = (unint64_t)[v7 hash];

  v9 = [(DataStreamFragmentChunk *)self type];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10 ^ [(DataStreamFragmentChunk *)self isLast];
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)fragmentSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isLast
{
  return self->_last;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_fragmentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end