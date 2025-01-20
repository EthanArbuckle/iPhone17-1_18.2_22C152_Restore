@interface PTParameterRecords
- (NSMutableDictionary)recordDictionary;
- (PTParameterRecords)initWithDictionary:(id)a3;
- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6;
- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4;
- (void)setRecordDictionary:(id)a3;
@end

@implementation PTParameterRecords

- (PTParameterRecords)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTParameterRecords;
  v5 = [(PTParameterRecords *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(PTParameterRecords *)v5 setRecordDictionary:v4];
    if (!qword_1000205B0)
    {
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecords", 0);
      v8 = (void *)qword_1000205B0;
      qword_1000205B0 = (uint64_t)v7;
    }
  }

  return v6;
}

- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = qword_1000205B0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005794;
  block[3] = &unk_100018850;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = qword_1000205B0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005AE8;
  block[3] = &unk_100018878;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (NSMutableDictionary)recordDictionary
{
  return self->_recordDictionary;
}

- (void)setRecordDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end