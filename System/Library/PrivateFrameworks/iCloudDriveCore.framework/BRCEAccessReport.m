@interface BRCEAccessReport
+ (BOOL)supportsSecureCoding;
- (BOOL)has_acls;
- (BRCEAccessReport)initWithCoder:(id)a3;
- (unint64_t)incidents;
- (unsigned)protection_class;
- (unsigned)st_flags;
- (unsigned)st_gid;
- (unsigned)st_mode;
- (unsigned)st_uid;
- (void)encodeWithCoder:(id)a3;
- (void)setHas_acls:(BOOL)a3;
- (void)setIncidents:(unint64_t)a3;
- (void)setProtection_class:(unsigned int)a3;
- (void)setSt_flags:(unsigned int)a3;
- (void)setSt_gid:(unsigned int)a3;
- (void)setSt_mode:(unsigned __int16)a3;
- (void)setSt_uid:(unsigned int)a3;
@end

@implementation BRCEAccessReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t st_mode = self->st_mode;
  id v5 = a3;
  [v5 encodeInt32:st_mode forKey:@"st_mode"];
  [v5 encodeInt32:self->st_uid forKey:@"st_uid"];
  [v5 encodeInt32:self->st_gid forKey:@"st_gid"];
  [v5 encodeInt32:self->st_flags forKey:@"st_flags"];
  [v5 encodeInt32:self->protection_class forKey:@"protection_class"];
  [v5 encodeBool:self->has_acls forKey:@"has_acls"];
  [v5 encodeInt64:self->incidents forKey:@"incidents"];
}

- (BRCEAccessReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCEAccessReport;
  id v5 = [(BRCEAccessReport *)&v7 init];
  if (v5)
  {
    v5->uint64_t st_mode = [v4 decodeInt32ForKey:@"st_mode"];
    v5->st_uid = [v4 decodeInt32ForKey:@"st_uid"];
    v5->st_gid = [v4 decodeInt32ForKey:@"st_gid"];
    v5->st_flags = [v4 decodeInt32ForKey:@"st_flags"];
    v5->protection_class = [v4 decodeInt32ForKey:@"protection_class"];
    v5->has_acls = [v4 decodeBoolForKey:@"has_acls"];
    v5->incidents = [v4 decodeInt64ForKey:@"incidents"];
  }

  return v5;
}

- (unsigned)st_mode
{
  return self->st_mode;
}

- (void)setSt_mode:(unsigned __int16)a3
{
  self->uint64_t st_mode = a3;
}

- (unsigned)st_uid
{
  return self->st_uid;
}

- (void)setSt_uid:(unsigned int)a3
{
  self->st_uid = a3;
}

- (unsigned)st_gid
{
  return self->st_gid;
}

- (void)setSt_gid:(unsigned int)a3
{
  self->st_gid = a3;
}

- (unsigned)st_flags
{
  return self->st_flags;
}

- (void)setSt_flags:(unsigned int)a3
{
  self->st_flags = a3;
}

- (unsigned)protection_class
{
  return self->protection_class;
}

- (void)setProtection_class:(unsigned int)a3
{
  self->protection_class = a3;
}

- (BOOL)has_acls
{
  return self->has_acls;
}

- (void)setHas_acls:(BOOL)a3
{
  self->has_acls = a3;
}

- (unint64_t)incidents
{
  return self->incidents;
}

- (void)setIncidents:(unint64_t)a3
{
  self->incidents = a3;
}

@end