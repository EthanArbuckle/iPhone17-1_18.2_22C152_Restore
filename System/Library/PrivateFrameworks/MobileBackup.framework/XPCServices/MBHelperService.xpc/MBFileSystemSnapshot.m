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
  uint64_t v3 = objc_opt_class();
  v4 = [(MBFileSystemSnapshot *)self name];
  v5 = [(MBFileSystemSnapshot *)self uuid];
  v6 = [(MBFileSystemSnapshot *)self creationDate];
  v7 = MBStringWithDate(v6);
  id v8 = [(MBFileSystemSnapshot *)self creationDate];
  [v8 timeIntervalSince1970];
  id v10 = +[NSString stringWithFormat:@"<%@: name=\"%@\", uuid=%@, creationDate=\"%@\"(%.3f)>", v3, v4, v5, v7, v9];

  return v10;
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