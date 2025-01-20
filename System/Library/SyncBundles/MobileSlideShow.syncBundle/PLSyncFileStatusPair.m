@interface PLSyncFileStatusPair
- (NSString)path;
- (PLSyncFileStatusPair)initWithPath:(id)a3;
- (int)status;
- (void)setStatus:(int)a3;
@end

@implementation PLSyncFileStatusPair

- (void).cxx_destruct
{
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int)status
{
  return self->_status;
}

- (NSString)path
{
  return self->_path;
}

- (PLSyncFileStatusPair)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSyncFileStatusPair;
  v5 = [(PLSyncFileStatusPair *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    path = v5->_path;
    v5->_path = v6;

    [(PLSyncFileStatusPair *)v5 setStatus:0];
  }

  return v5;
}

@end