@interface MBFileSystemSnapshot
- (MBFileSystemSnapshot)initWithName:(id)a3 uuid:(id)a4 creationDate:(id)a5;
- (NSDate)creationDate;
- (NSString)name;
- (NSString)uuid;
- (id)description;
- (void)setCreationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MBFileSystemSnapshot

- (MBFileSystemSnapshot)initWithName:(id)a3 uuid:(id)a4 creationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MBFileSystemSnapshot;
  v11 = [(MBFileSystemSnapshot *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(MBFileSystemSnapshot *)v11 setName:v8];
    [(MBFileSystemSnapshot *)v12 setUuid:v9];
    [(MBFileSystemSnapshot *)v12 setCreationDate:v10];
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MBFileSystemSnapshot *)self name];
  v6 = [(MBFileSystemSnapshot *)self uuid];
  v7 = [(MBFileSystemSnapshot *)self creationDate];
  id v8 = MBStringWithDate((uint64_t)v7);
  id v9 = [(MBFileSystemSnapshot *)self creationDate];
  [v9 timeIntervalSince1970];
  v11 = [v3 stringWithFormat:@"<%@: name=\"%@\", uuid=%@, creationDate=\"%@\"(%.3f)>", v4, v5, v6, v8, v10];

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end