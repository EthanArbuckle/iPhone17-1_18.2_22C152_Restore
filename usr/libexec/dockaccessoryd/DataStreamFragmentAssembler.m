@interface DataStreamFragmentAssembler
- (BOOL)addFragmentChunk:(id)a3 error:(id *)a4;
- (DataStreamFragment)assembledFragment;
- (DataStreamFragmentAssembler)initWithSequenceNumber:(id)a3 type:(id)a4;
- (NSMutableData)data;
- (NSNumber)currentChunkSequenceNumber;
- (NSNumber)sequenceNumber;
- (NSString)type;
- (id)attributeDescriptions;
- (void)setAssembledFragment:(id)a3;
- (void)setCurrentChunkSequenceNumber:(id)a3;
@end

@implementation DataStreamFragmentAssembler

- (DataStreamFragmentAssembler)initWithSequenceNumber:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  v21.receiver = self;
  v21.super_class = (Class)DataStreamFragmentAssembler;
  v10 = [(DataStreamFragmentAssembler *)&v21 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sequenceNumber, a3);
    v12 = (NSString *)[v9 copy];
    type = v11->_type;
    v11->_type = v12;

    uint64_t v14 = +[NSMutableData data];
    data = v11->_data;
    v11->_data = (NSMutableData *)v14;

    currentChunkSequenceNumber = v11->_currentChunkSequenceNumber;
    v11->_currentChunkSequenceNumber = (NSNumber *)&off_1002816E8;

    v17 = v11;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@Initialized data chunk assembler with sequence number: %@ type: %@", buf, 0x20u);
    }
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v20 = [(DataStreamFragmentAssembler *)self sequenceNumber];
  id v19 = [v3 initWithName:@"Sequence Number" value:v20];
  v21[0] = v19;
  id v4 = objc_alloc((Class)HMFAttributeDescription);
  v5 = [(DataStreamFragmentAssembler *)self type];
  id v6 = [v4 initWithName:@"Type" value:v5];
  v21[1] = v6;
  id v7 = objc_alloc((Class)HMFAttributeDescription);
  id v8 = [(DataStreamFragmentAssembler *)self data];
  v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 length]);
  id v10 = [v7 initWithName:@"Data Length" value:v9];
  v21[2] = v10;
  id v11 = objc_alloc((Class)HMFAttributeDescription);
  v12 = [(DataStreamFragmentAssembler *)self currentChunkSequenceNumber];
  id v13 = [v11 initWithName:@"Current Chunk Sequence Number" value:v12];
  v21[3] = v13;
  id v14 = objc_alloc((Class)HMFAttributeDescription);
  v15 = [(DataStreamFragmentAssembler *)self assembledFragment];
  id v16 = [v14 initWithName:@"Assembled Fragment" value:v15];
  v21[4] = v16;
  v17 = +[NSArray arrayWithObjects:v21 count:5];

  return v17;
}

- (BOOL)addFragmentChunk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_100083FD0(v7);
    int v36 = 138543618;
    v37 = v9;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Adding chunk: %@", (uint8_t *)&v36, 0x16u);
  }
  id v10 = [(DataStreamFragmentAssembler *)v7 assembledFragment];

  if (v10)
  {
    id v11 = v7;
    v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = sub_100083FD0(v11);
      int v36 = 138543618;
      v37 = v13;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ but the last data chunk has already been received", (uint8_t *)&v36, 0x16u);
    }
    if (a4)
    {
      uint64_t v14 = 1;
LABEL_18:
      +[NSError errorWithDomain:@"DataStreamFragmentAssemblerErrorDomain" code:v14 userInfo:0];
      BOOL v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v15 = [(DataStreamFragmentAssembler *)v7 currentChunkSequenceNumber];
  id v16 = (char *)[v15 unsignedLongLongValue];

  v17 = [v6 sequenceNumber];
  v18 = (char *)[v17 unsignedLongLongValue];

  if (v18 != v16 + 1)
  {
    v28 = v7;
    v29 = sub_100083F74();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = sub_100083FD0(v28);
      v31 = [(DataStreamFragmentAssembler *)v28 currentChunkSequenceNumber];
      int v36 = 138543874;
      v37 = v30;
      __int16 v38 = 2112;
      id v39 = v6;
      __int16 v40 = 2112;
      v41 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ with non-sequential sequence number compared to current stream data chunk sequence number %@", (uint8_t *)&v36, 0x20u);
    }
    if (a4)
    {
      uint64_t v14 = 2;
      goto LABEL_18;
    }
LABEL_23:
    BOOL v27 = 0;
    goto LABEL_24;
  }
  if (v18 == (char *)-1 && ([v6 isLast] & 1) == 0)
  {
    v32 = v7;
    v33 = sub_100083F74();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = sub_100083FD0(v32);
      int v36 = 138543618;
      v37 = v34;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@Asked to add non-last fragment chunk with maximum allowed sequence number: %@", (uint8_t *)&v36, 0x16u);
    }
    if (a4)
    {
      uint64_t v14 = 3;
      goto LABEL_18;
    }
    goto LABEL_23;
  }
  id v19 = [v6 sequenceNumber];
  [(DataStreamFragmentAssembler *)v7 setCurrentChunkSequenceNumber:v19];

  v20 = [(DataStreamFragmentAssembler *)v7 data];
  objc_super v21 = [v6 data];
  [v20 appendData:v21];

  if ([v6 isLast])
  {
    v22 = [DataStreamFragment alloc];
    v23 = [(DataStreamFragmentAssembler *)v7 data];
    __int16 v24 = [(DataStreamFragmentAssembler *)v7 sequenceNumber];
    id v25 = [(DataStreamFragmentAssembler *)v7 type];
    __int16 v26 = [(DataStreamFragment *)v22 initWithData:v23 sequenceNumber:v24 type:v25];
    [(DataStreamFragmentAssembler *)v7 setAssembledFragment:v26];
  }
  BOOL v27 = 1;
LABEL_24:

  return v27;
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (DataStreamFragment)assembledFragment
{
  return (DataStreamFragment *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssembledFragment:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)currentChunkSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentChunkSequenceNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChunkSequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_assembledFragment, 0);

  objc_storeStrong((id *)&self->_sequenceNumber, 0);
}

@end