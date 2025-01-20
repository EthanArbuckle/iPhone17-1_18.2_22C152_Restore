@interface MKDataClassMetrics
- (MKDataClassMetrics)initWithDictionary:(id)a3;
- (NSString)name;
- (double)exportTime;
- (double)networkQueueTime;
- (double)preparationTime;
- (double)transferSpeed;
- (double)transferTime;
- (int)itemCount;
- (unint64_t)size;
- (void)setExportTime:(double)a3;
- (void)setItemCount:(int)a3;
- (void)setName:(id)a3;
- (void)setNetworkQueueTime:(double)a3;
- (void)setPreparationTime:(double)a3;
- (void)setSize:(unint64_t)a3;
- (void)setTransferSpeed:(double)a3;
- (void)setTransferTime:(double)a3;
@end

@implementation MKDataClassMetrics

- (MKDataClassMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKDataClassMetrics;
  v5 = [(MKDataClassMetrics *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"name"];
    [(MKDataClassMetrics *)v5 setName:v6];

    v7 = [v4 objectForKey:@"size"];
    -[MKDataClassMetrics setSize:](v5, "setSize:", [v7 unsignedLongValue]);

    v8 = [v4 objectForKey:@"item_count"];
    -[MKDataClassMetrics setItemCount:](v5, "setItemCount:", [v8 intValue]);

    v9 = [v4 objectForKey:@"transfer_speed"];
    [v9 doubleValue];
    -[MKDataClassMetrics setTransferSpeed:](v5, "setTransferSpeed:");

    v10 = [v4 objectForKey:@"durations"];
    v11 = [v10 objectForKey:@"preparation"];
    [v11 doubleValue];
    -[MKDataClassMetrics setPreparationTime:](v5, "setPreparationTime:");

    v12 = [v10 objectForKey:@"export"];
    [v12 doubleValue];
    -[MKDataClassMetrics setExportTime:](v5, "setExportTime:");

    v13 = [v10 objectForKey:@"network_queue"];
    [v13 doubleValue];
    -[MKDataClassMetrics setNetworkQueueTime:](v5, "setNetworkQueueTime:");

    v14 = [v10 objectForKey:@"transfer"];
    [v14 doubleValue];
    -[MKDataClassMetrics setTransferTime:](v5, "setTransferTime:");
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(int)a3
{
  self->_itemCount = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (double)transferSpeed
{
  return self->_transferSpeed;
}

- (void)setTransferSpeed:(double)a3
{
  self->_transferSpeed = a3;
}

- (double)preparationTime
{
  return self->_preparationTime;
}

- (void)setPreparationTime:(double)a3
{
  self->_preparationTime = a3;
}

- (double)exportTime
{
  return self->_exportTime;
}

- (void)setExportTime:(double)a3
{
  self->_exportTime = a3;
}

- (double)networkQueueTime
{
  return self->_networkQueueTime;
}

- (void)setNetworkQueueTime:(double)a3
{
  self->_networkQueueTime = a3;
}

- (double)transferTime
{
  return self->_transferTime;
}

- (void)setTransferTime:(double)a3
{
  self->_transferTime = a3;
}

- (void).cxx_destruct
{
}

@end