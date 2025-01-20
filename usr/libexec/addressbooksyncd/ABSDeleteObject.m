@interface ABSDeleteObject
- (ABSDeleteObject)initWithGuid:(id)a3;
- (NSString)description;
- (NSString)guid;
- (NSString)sequencer;
- (id)createProtobufWithOptions:(id)a3;
- (int64_t)changeType;
- (void)setGuid:(id)a3;
@end

@implementation ABSDeleteObject

- (ABSDeleteObject)initWithGuid:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ABSDeleteObject;
  v5 = [(ABSDeleteObject *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ABSDeleteObject *)v5 setGuid:v4];
  }

  return v6;
}

- (int64_t)changeType
{
  return 3;
}

- (NSString)sequencer
{
  return 0;
}

- (id)createProtobufWithOptions:(id)a3
{
  id v4 = [[ABSPBSyncObject alloc] initWithMemo:@"Delete"];
  v5 = objc_alloc_init(ABSPBDeleteWrapper);
  [(ABSPBSyncObject *)v4 setDeleteWrapper:v5];

  v6 = [(ABSDeleteObject *)self guid];
  v7 = [(ABSPBSyncObject *)v4 deleteWrapper];
  [v7 setGuid:v6];

  objc_super v8 = [(ABSPBSyncObject *)v4 data];

  return v8;
}

- (NSString)description
{
  v2 = [(ABSDeleteObject *)self guid];
  v3 = +[NSString stringWithFormat:@"<ABSContactsDeleteObject:%@>", v2];

  return (NSString *)v3;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end