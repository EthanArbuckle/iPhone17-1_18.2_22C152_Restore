@interface SKMountParams
- (BOOL)force;
- (BOOL)noBrowse;
- (BOOL)raidTraverse;
- (BOOL)readOnly;
- (BOOL)recursive;
- (NSSet)allParams;
- (NSURL)mountPoint;
- (SKMountParams)init;
- (SKMountParams)initWithParams:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)redactedDescription;
- (void)setAllParams:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setMountPoint:(id)a3;
- (void)setNoBrowse:(BOOL)a3;
- (void)setRaidTraverse:(BOOL)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRecursive:(BOOL)a3;
@end

@implementation SKMountParams

- (SKMountParams)init
{
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(SKMountParams *)self initWithParams:v3];

  return v4;
}

- (SKMountParams)initWithParams:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKMountParams;
  v6 = [(SKMountParams *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] set];
    allParams = v6->_allParams;
    v6->_allParams = (NSSet *)v7;

    v6->_readOnly = [v5 containsObject:@"rdonly"];
    v6->_noBrowse = [v5 containsObject:@"nobrowse"];
    mountPoint = v6->_mountPoint;
    v6->_mountPoint = 0;

    objc_storeStrong((id *)&v6->_allParams, a3);
    *(_WORD *)&v6->_recursive = 257;
    v6->_raidTraverse = 1;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v17[5] = *MEMORY[0x263EF8340];
  v3 = [(SKMountParams *)self allParams];
  v4 = (void *)[v3 mutableCopy];

  if ([(SKMountParams *)self readOnly]) {
    [v4 addObject:@"rdonly"];
  }
  if ([(SKMountParams *)self noBrowse]) {
    [v4 addObject:@"nobrowse"];
  }
  id v5 = (void *)MEMORY[0x263EFF9A0];
  v16[0] = @"kSKDiskMountOptionToolOptions";
  v6 = [v4 allObjects];
  v17[0] = v6;
  v16[1] = @"kSKDiskMountOptionRecursive";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SKMountParams recursive](self, "recursive"));
  v17[1] = v7;
  v16[2] = @"kSKDiskMountOptionRecursiveRAID";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SKMountParams raidTraverse](self, "raidTraverse"));
  v17[2] = v8;
  v16[3] = @"kSKDiskMountOptionForce";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SKMountParams force](self, "force"));
  v16[4] = kSKDiskMountOptionWithoutEFI;
  v17[3] = v9;
  v17[4] = MEMORY[0x263EFFA88];
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  objc_super v11 = [v5 dictionaryWithDictionary:v10];

  v12 = [(SKMountParams *)self mountPoint];

  if (v12)
  {
    v13 = [(SKMountParams *)self mountPoint];
    v14 = [v13 path];
    [v11 setObject:v14 forKeyedSubscript:@"kSKDiskMountOptionMountPoint"];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SKMountParams alloc];
  id v5 = [(SKMountParams *)self allParams];
  v6 = [(SKMountParams *)v4 initWithParams:v5];

  uint64_t v7 = [(SKMountParams *)self mountPoint];
  [(SKMountParams *)v6 setMountPoint:v7];

  [(SKMountParams *)v6 setRecursive:[(SKMountParams *)self recursive]];
  [(SKMountParams *)v6 setForce:[(SKMountParams *)self force]];
  [(SKMountParams *)v6 setRaidTraverse:[(SKMountParams *)self raidTraverse]];
  return v6;
}

- (id)redactedDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(NSSet *)self->_allParams count];
  if (self->_mountPoint) {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v7 = MEMORY[0x263EFFA80];
  }
  v8 = [v3 stringWithFormat:@"<%@: { allParams: \"%lu\", mount point: \"%@\", recursive: %d, force: %d }>", v5, v6, v7, self->_recursive, self->_force];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@: { allParams: \"%@\", mount point: \"%@\", recursive: %d, force: %d }>", v5, self->_allParams, self->_mountPoint, self->_recursive, self->_force];

  return v6;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)noBrowse
{
  return self->_noBrowse;
}

- (void)setNoBrowse:(BOOL)a3
{
  self->_noBrowse = a3;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
}

- (NSSet)allParams
{
  return self->_allParams;
}

- (void)setAllParams:(id)a3
{
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (BOOL)raidTraverse
{
  return self->_raidTraverse;
}

- (void)setRaidTraverse:(BOOL)a3
{
  self->_raidTraverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allParams, 0);

  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end