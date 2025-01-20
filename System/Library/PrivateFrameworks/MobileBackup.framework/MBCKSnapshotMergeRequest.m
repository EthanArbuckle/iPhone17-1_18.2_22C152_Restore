@interface MBCKSnapshotMergeRequest
+ (id)snapshotMergeRequestForDevice:(id)a3;
- (BOOL)addSnapshotToMerge:(id)a3;
- (MBCKDevice)device;
- (MBCKSnapshotMergeRequest)initWithDevice:(id)a3;
- (id)_getRecordIDString;
- (id)recordRepresentation;
- (id)recordType;
- (unint64_t)recordZone;
- (void)setDevice:(id)a3;
@end

@implementation MBCKSnapshotMergeRequest

+ (id)snapshotMergeRequestForDevice:(id)a3
{
  id v3 = a3;
  v4 = [[MBCKSnapshotMergeRequest alloc] initWithDevice:v3];

  return v4;
}

- (MBCKSnapshotMergeRequest)initWithDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBCKSnapshotMergeRequest;
  v5 = [(MBCKModel *)&v12 initWithRecord:0 cache:0];
  v6 = v5;
  if (v5)
  {
    [(MBCKSnapshotMergeRequest *)v5 setDevice:v4];
    uint64_t v7 = MBRandomUUID();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    snapshotsToMerge = v6->_snapshotsToMerge;
    v6->_snapshotsToMerge = v9;
  }
  return v6;
}

- (BOOL)addSnapshotToMerge:(id)a3
{
  snapshotsToMerge = self->_snapshotsToMerge;
  id v4 = a3;
  id v5 = objc_alloc((Class)CKReference);
  v6 = [v4 recordID];

  id v7 = [v5 initWithRecordID:v6 action:0];
  [(NSMutableArray *)snapshotsToMerge addObject:v7];

  return 1;
}

- (id)_getRecordIDString
{
  return self->_uuid;
}

- (id)recordType
{
  return @"SnapshotMergeRequest";
}

- (unint64_t)recordZone
{
  return 2;
}

- (id)recordRepresentation
{
  v10.receiver = self;
  v10.super_class = (Class)MBCKSnapshotMergeRequest;
  id v3 = [(MBCKModel *)&v10 recordRepresentation];
  id v4 = [v3 objectForKeyedSubscript:@"device"];

  if (!v4)
  {
    id v5 = objc_alloc((Class)CKReference);
    v6 = [(MBCKSnapshotMergeRequest *)self device];
    id v7 = [v6 recordID];
    id v8 = [v5 initWithRecordID:v7 action:0];
    [v3 setObject:v8 forKeyedSubscript:@"device"];
  }
  [v3 setObject:self->_snapshotsToMerge forKeyedSubscript:@"snapshotsToMerge"];
  return v3;
}

- (MBCKDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MBCKDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_snapshotsToMerge, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end