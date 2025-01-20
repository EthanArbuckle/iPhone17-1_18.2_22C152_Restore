@interface SKVolume
- (NSString)name;
- (NSString)password;
- (SKDisk)disk;
- (SKFilesystem)filesystem;
- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5;
- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5 password:(id)a6;
- (id)description;
- (id)formatArgs;
- (id)formatter;
- (id)redactedDescription;
@end

@implementation SKVolume

- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[SKVolume alloc] initWithDisk:v10 filesystem:v9 name:v8 password:0];

  return v11;
}

- (SKVolume)initWithDisk:(id)a3 filesystem:(id)a4 name:(id)a5 password:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SKVolume;
  v15 = [(SKVolume *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_disk, a3);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_password, a6);
    if (v14 && ([v12 isEncrypted] & 1) == 0)
    {
      v17 = [v12 majorType];
      uint64_t v18 = +[SKFilesystem filesystemFor:caseSensitive:encrypted:isExtension:](SKFilesystem, "filesystemFor:caseSensitive:encrypted:isExtension:", v17, [v12 isCaseSensitive], 1, [v12 isExtension]);

      id v12 = (id)v18;
    }
    objc_storeStrong((id *)&v16->_filesystem, v12);
  }

  return v16;
}

- (id)formatArgs
{
  v3 = +[NSMutableArray array];
  v4 = [(SKVolume *)self filesystem];
  v5 = [v4 formatArgs];
  v6 = [v5 componentsSeparatedByString:@" "];

  if ([v6 count])
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    unsigned __int8 v8 = [v7 isEqualToString:&stru_10004A7A8];

    if ((v8 & 1) == 0) {
      [v3 addObjectsFromArray:v6];
    }
  }
  uint64_t v9 = [(SKVolume *)self password];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(SKVolume *)self password];
    id v12 = [v11 length];

    if (v12)
    {
      [v3 addObject:@"-E"];
      [v3 addObject:@"-S"];
      id v13 = [(SKVolume *)self password];
      [v3 addObject:v13];
    }
  }
  [v3 addObject:@"-v"];
  id v14 = [(SKVolume *)self name];
  [v3 addObject:v14];

  v15 = [(SKVolume *)self disk];
  v16 = [v15 diskIdentifier];
  v17 = +[NSString stringWithFormat:@"/dev/%@", v16];
  [v3 addObject:v17];

  return v3;
}

- (id)formatter
{
  v2 = [(SKVolume *)self filesystem];
  v3 = [v2 formatExecutable];

  return v3;
}

- (id)redactedDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(SKVolume *)self disk];
  v6 = [(SKVolume *)self filesystem];
  v7 = +[NSString stringWithFormat:@"<%@: { disk: \"%@\", filesystem: \"%@\"}>", v4, v5, v6];

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(SKVolume *)self disk];
  v6 = [(SKVolume *)self filesystem];
  v7 = [(SKVolume *)self name];
  unsigned __int8 v8 = +[NSString stringWithFormat:@"<%@: { disk: \"%@\", filesystem: \"%@\", name: \"%@\"}>", v4, v5, v6, v7];

  return v8;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (SKFilesystem)filesystem
{
  return self->_filesystem;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);

  objc_storeStrong((id *)&self->_disk, 0);
}

@end