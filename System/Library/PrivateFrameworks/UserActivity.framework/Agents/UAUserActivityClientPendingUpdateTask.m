@interface UAUserActivityClientPendingUpdateTask
- (NSUUID)uuid;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAUserActivityClientPendingUpdateTask

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end