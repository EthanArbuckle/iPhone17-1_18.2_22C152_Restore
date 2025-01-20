@interface MBCKFileChange
- (BOOL)shouldCopy;
- (MBDomain)domain;
- (NSString)absolutePath;
- (NSString)changeTypeString;
- (NSString)relativePath;
- (NSString)snapshotPath;
- (id)description;
- (unint64_t)changeType;
- (void)setAbsolutePath:(id)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)setShouldCopy:(BOOL)a3;
- (void)setSnapshotPath:(id)a3;
@end

@implementation MBCKFileChange

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v10.receiver = self;
  v10.super_class = (Class)MBCKFileChange;
  v4 = [(MBCKFileChange *)&v10 description];
  v5 = [(MBCKFileChange *)self domain];
  v6 = [v5 name];
  v7 = [(MBCKFileChange *)self relativePath];
  id v8 = [v3 initWithFormat:@"%@ <%@:%@>", v4, v6, v7];

  return v8;
}

- (NSString)changeTypeString
{
  unint64_t v2 = [(MBCKFileChange *)self changeType];
  if (v2 > 3) {
    return (NSString *)@"added";
  }
  else {
    return &off_100413AC0[v2]->isa;
  }
}

- (NSString)snapshotPath
{
  return self->_snapshotPath;
}

- (void)setSnapshotPath:(id)a3
{
}

- (MBDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)absolutePath
{
  return self->_absolutePath;
}

- (void)setAbsolutePath:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (BOOL)shouldCopy
{
  return self->_shouldCopy;
}

- (void)setShouldCopy:(BOOL)a3
{
  self->_shouldCopy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_absolutePath, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_snapshotPath, 0);
}

@end